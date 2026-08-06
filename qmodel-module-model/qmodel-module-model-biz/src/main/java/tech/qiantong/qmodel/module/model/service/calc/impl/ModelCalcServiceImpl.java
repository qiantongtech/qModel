/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
 *
 * This file is part of qModel Module Platform (Open Source Edition).
 *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.service.calc.impl;

import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.stream.Collectors;

import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;

import tech.qiantong.qmodel.common.core.domain.model.LoginUser;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.exception.ServiceException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcExecution.ModelCalcExecutionDO;
import tech.qiantong.qmodel.module.model.dal.mapper.calc.ModelCalcMapper;
import tech.qiantong.qmodel.module.model.service.calc.ICalcQueueService;
import tech.qiantong.qmodel.module.model.service.calc.IModelCalcService;
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcExecuteResultDTO;
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcQueueStatusDTO;
import tech.qiantong.qmodel.module.model.service.calc.dto.QueueTask;
import tech.qiantong.qmodel.module.model.service.calcExecution.IModelCalcExecutionService;
/**
 * 模型计算任务Service业务层处理
 *
 * @author qModel
 * @date 2026-07-27
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelCalcServiceImpl  extends ServiceImpl<ModelCalcMapper,ModelCalcDO> implements IModelCalcService {
    @Resource
    private ModelCalcMapper modelCalcMapper;

    @Resource
    private ICalcQueueService calcQueueService;

    @Resource
    private IModelCalcExecutionService executionService;

    @Override
    public PageResult<ModelCalcDO> getModelCalcPage(ModelCalcPageReqVO pageReqVO) {
        return modelCalcMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelCalc(ModelCalcSaveReqVO createReqVO, LoginUser loginUser) {
        ModelCalcDO dictType = BeanUtils.toBean(createReqVO, ModelCalcDO.class);
        // 新建后默认入队：status=5（排队中）
        if (dictType.getStatus() == null) {
            dictType.setStatus(5);
        }
        dictType.setUpdateBy(loginUser.getUser().getNickName());
        dictType.setUpdateTime(new Date());
        dictType.setUpdatorId(loginUser.getUserId());
        dictType.setCreateBy(loginUser.getUser().getNickName());
        dictType.setCreateTime(new Date());
        dictType.setCreatorId(loginUser.getUserId());
        modelCalcMapper.insert(dictType);

        executeCalc(dictType.getId());

        return dictType.getId();
    }

    @Override
    public int updateModelCalc(ModelCalcSaveReqVO updateReqVO,LoginUser loginUser) {
        ModelCalcDO updateObj = BeanUtils.toBean(updateReqVO, ModelCalcDO.class);
        // 修改后重新入队：强制 status=5（排队中）
        updateObj.setStatus(5);
        updateObj.setUpdateBy(loginUser.getUser().getNickName());
        updateObj.setUpdateTime(new Date());
        updateObj.setUpdatorId(loginUser.getUserId());
        int result = modelCalcMapper.updateById(updateObj);

        executeCalc(updateReqVO.getId());

        return result;
    }
    @Override
    public int removeModelCalc(Collection<Long> idList) {
        // 批量删除模型计算任务
        return modelCalcMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelCalcDO getModelCalcById(Long id) {
        return modelCalcMapper.selectById(id);
    }

    @Override
    public List<ModelCalcDO> getModelCalcList() {
        return modelCalcMapper.selectList();
    }

    @Override
    public Map<Long, ModelCalcDO> getModelCalcMap() {
        List<ModelCalcDO> modelCalcList = modelCalcMapper.selectList();
        return modelCalcList.stream()
                .collect(Collectors.toMap(
                        ModelCalcDO::getId,
                        modelCalcDO -> modelCalcDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入模型计算任务数据
         *
         * @param importExcelList 模型计算任务数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelCalc(List<ModelCalcRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelCalcRespVO respVO : importExcelList) {
                try {
                    ModelCalcDO modelCalcDO = BeanUtils.toBean(respVO, ModelCalcDO.class);
                    Long modelCalcId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelCalcId != null) {
                            ModelCalcDO existingModelCalc = modelCalcMapper.selectById(modelCalcId);
                            if (existingModelCalc != null) {
                                modelCalcMapper.updateById(modelCalcDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelCalcId + " 的模型计算任务记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelCalcId + " 的模型计算任务记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelCalcDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelCalcId);
                        ModelCalcDO existingModelCalc = modelCalcMapper.selectOne(queryWrapper);
                        if (existingModelCalc == null) {
                            modelCalcMapper.insert(modelCalcDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelCalcId + " 的模型计算任务记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelCalcId + " 的模型计算任务记录已存在。");
                        }
                    }
                } catch (Exception e) {
                    failureNum++;
                    String errorMsg = "数据导入失败，错误信息：" + e.getMessage();
                    failureMessages.add(errorMsg);
                    log.error(errorMsg, e);
                }
            }
            StringBuilder resultMsg = new StringBuilder();
            if (failureNum > 0) {
                resultMsg.append("很抱歉，导入失败！共 ").append(failureNum).append(" 条数据格式不正确，错误如下：");
                resultMsg.append("<br/>").append(String.join("<br/>", failureMessages));
                throw new ServiceException(resultMsg.toString());
            } else {
                resultMsg.append("恭喜您，数据已全部导入成功！共 ").append(successNum).append(" 条。");
            }
            return resultMsg.toString();
        }

    @Override
    public CalcExecuteResultDTO executeCalc(Long id) {
        ModelCalcDO calc = getModelCalcById(id);
        if (calc == null) {
            throw new ServiceException("计算任务不存在");
        }

        String executionNo = generateExecutionNo();

        ModelCalcExecutionDO execution = new ModelCalcExecutionDO();
        execution.setCalcId(id);
        execution.setModelId(calc.getModelId());
        execution.setExecutionNo(executionNo);
        execution.setExecutionMode(1);
        execution.setStatus(5);
        execution.setInputParams(toJsonString(calc.getInputParams()));
        execution.setRetryCount(0L);
        executionService.save(execution);

        // ============ 入队时同步主表：status=排队中 + inputParams 落库 + 旧结果/耗时归零 ============
        ModelCalcSaveReqVO infoVO = new ModelCalcSaveReqVO();
        infoVO.setId(id);
        infoVO.setStatus(5);
        infoVO.setInputParams(toJsonString(calc.getInputParams()));
        infoVO.setOutputResult("");
        infoVO.setStartTime(null);
        infoVO.setEndTime(null);
        infoVO.setDuration(0L);
        infoVO.setErrorMessage("");
        updateCalcExecutionInfo(infoVO);
        // =======================================================================================

        calcQueueService.enqueue(id, calc.getPriority(), executionNo);

        CalcExecuteResultDTO result = new CalcExecuteResultDTO();
        result.setExecutionNo(executionNo);
        result.setStatus("QUEUED");
        result.setPriority(calc.getPriority());

        log.info("提交计算任务: id={}, executionNo={}", id, executionNo);
        return result;
    }

    @Override
    public boolean cancelCalc(String executionNo) {
        boolean success = calcQueueService.cancel(executionNo);
        if (success) {
            executionService.updateStatusByExecutionNo(executionNo, 4);
            // ============ 终止时同步主表：status=已终止 + 计算已用时/结束时间 ============
            ModelCalcExecutionDO execution = executionService.getByExecutionNo(executionNo);
            if (execution != null && execution.getCalcId() != null) {
                Date endTimeObj = new Date();
                Long duration = null;
                if (execution.getStartTime() != null) {
                    duration = Math.max(0L, endTimeObj.getTime() - execution.getStartTime().getTime());
                } else if (execution.getDuration() != null) {
                    duration = execution.getDuration();
                }
                ModelCalcSaveReqVO infoVO = new ModelCalcSaveReqVO();
                infoVO.setId(execution.getCalcId());
                infoVO.setStatus(4);
                infoVO.setEndTime(endTimeObj);
                if (duration != null) {
                    infoVO.setDuration(duration);
                }
                updateCalcExecutionInfo(infoVO);
            }
        }
        return success;
    }

    @Override
    public CalcQueueStatusDTO getQueueStatus() {
        CalcQueueStatusDTO status = new CalcQueueStatusDTO();
        status.setWaiting(calcQueueService.getQueueSize());
        status.setRunning(executionService.countByStatus(1));
        status.setDead(calcQueueService.getDeadQueueSize());
        return status;
    }

    @Override
    public List<QueueTask> listWaitingTasks() {
        return calcQueueService.listWaitingTasks();
    }

    @Override
    public void updateCalcStatus(Long id, Integer status) {
        if (id == null || status == null) {
            return;
        }
        try {
            ModelCalcDO update = new ModelCalcDO();
            update.setId(id);
            update.setStatus(status);
            modelCalcMapper.updateById(update);
        } catch (Exception e) {
            log.error("更新模型计算任务状态失败, id={}, status={}", id, status, e);
        }
    }

    @Override
    public boolean cancelCalcByCalcId(Long calcId) {
        if (calcId == null) {
            return false;
        }
        try {
            // 找到该 calc 最新一条「未完成」的执行批次：status in (0,1,5)，按创建时间倒序取第一条
            ModelCalcExecutionDO latest = executionService.lambdaQuery()
                    .eq(ModelCalcExecutionDO::getCalcId, calcId)
                    .in(ModelCalcExecutionDO::getStatus, 0, 1, 5)
                    .orderByDesc(ModelCalcExecutionDO::getCreateTime)
                    .last("limit 1")
                    .one();
            if (latest == null || StringUtils.isBlank(latest.getExecutionNo())) {
                // 没有可取消的执行批次，直接把主任务标记终止（防止用户反复点终止无效果）
                Date endTimeObj = new Date();
                ModelCalcSaveReqVO infoVO = new ModelCalcSaveReqVO();
                infoVO.setId(calcId);
                infoVO.setStatus(4);
                infoVO.setEndTime(endTimeObj);
                updateCalcExecutionInfo(infoVO);
                return true;
            }
            return cancelCalc(latest.getExecutionNo());
        } catch (Exception e) {
            log.error("按 calcId 终止任务失败, calcId={}", calcId, e);
            return false;
        }
    }

    @Override
    public void updateCalcExecutionInfo(ModelCalcSaveReqVO reqVO) {
        if (reqVO == null || reqVO.getId() == null) {
            return;
        }
        try {
            ModelCalcDO update = BeanUtils.toBean(reqVO, ModelCalcDO.class);
            // 只更新 7 个执行信息相关字段 + id；其他字段（name/modelId 等）若在 VO 里为 null 则 MyBatis-Plus 默认 NOT_NULL 策略不会进 SQL，
            // 但为了防御 VO 将来加默认值影响，这里只保留「主表执行信息快照」相关字段
            ModelCalcDO safe = new ModelCalcDO();
            safe.setId(update.getId());
            safe.setStatus(update.getStatus());
            safe.setInputParams(update.getInputParams());
            safe.setOutputResult(update.getOutputResult());
            safe.setStartTime(update.getStartTime());
            safe.setEndTime(update.getEndTime());
            safe.setDuration(update.getDuration());
            safe.setErrorMessage(update.getErrorMessage());
            // hasAny：一个字段都没设置就别发 SQL 了
            boolean hasAny = safe.getStatus() != null
                    || safe.getInputParams() != null
                    || safe.getOutputResult() != null
                    || safe.getStartTime() != null
                    || safe.getEndTime() != null
                    || safe.getDuration() != null
                    || safe.getErrorMessage() != null;
            if (!hasAny) {
                return;
            }
            modelCalcMapper.updateById(safe);
        } catch (Exception e) {
            log.error("更新模型计算任务执行信息失败, calcId={}", reqVO.getId(), e);
        }
    }

    private String generateExecutionNo() {
        return "EXEC_" + java.time.LocalDateTime.now()
                .format(java.time.format.DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
    }

    /**
     * 任意对象转 JSON 字符串（null → null，String 原样返回，Map/List/数组统一序列化）
     * 防止因为泛型/反射拿到非 String 值传入，导致 MyBatis 按对象字节存进数据库引发字符集错误
     */
    private String toJsonString(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof String) {
            return (String) obj;
        }
        try {
            return JSON.toJSONString(obj);
        } catch (Exception e) {
            log.warn("inputParams 序列化失败，使用 toString 兜底", e);
            return obj.toString();
        }
    }
}
