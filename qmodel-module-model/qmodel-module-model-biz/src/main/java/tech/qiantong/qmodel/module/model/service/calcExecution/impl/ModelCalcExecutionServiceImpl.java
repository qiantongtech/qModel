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

package tech.qiantong.qmodel.module.model.service.calcExecution.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcExecution.ModelCalcExecutionDO;
import tech.qiantong.qmodel.module.model.dal.mapper.calcExecution.ModelCalcExecutionMapper;
import tech.qiantong.qmodel.module.model.service.calcExecution.IModelCalcExecutionService;
import tech.qiantong.qmodel.mybatis.core.util.MyBatisUtils;
import com.baomidou.mybatisplus.core.metadata.IPage;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 模型计算执行记录Service业务层处理
 *
 * @author qModel
 * @date 2026-07-28
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelCalcExecutionServiceImpl extends ServiceImpl<ModelCalcExecutionMapper, ModelCalcExecutionDO> implements IModelCalcExecutionService {
    @Resource
    private ModelCalcExecutionMapper modelCalcExecutionMapper;

    @Override
    public PageResult<ModelCalcExecutionDO> getModelCalcExecutionPage(ModelCalcExecutionPageReqVO pageReqVO) {
        return modelCalcExecutionMapper.selectPage(pageReqVO);
    }

    @Override
    public PageResult<ModelCalcExecutionRespVO> getExecutionPageResult(ModelCalcExecutionPageReqVO pageReqVO) {
        IPage<ModelCalcExecutionRespVO> mpPage = MyBatisUtils.buildPage(pageReqVO);
        modelCalcExecutionMapper.selectExecutionPage(mpPage, pageReqVO);
        return new PageResult<>(mpPage.getRecords(), mpPage.getTotal());
    }

    @Override
    public Long createModelCalcExecution(ModelCalcExecutionSaveReqVO createReqVO) {
        ModelCalcExecutionDO dictType = BeanUtils.toBean(createReqVO, ModelCalcExecutionDO.class);
        modelCalcExecutionMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelCalcExecution(ModelCalcExecutionSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型计算执行记录
        ModelCalcExecutionDO updateObj = BeanUtils.toBean(updateReqVO, ModelCalcExecutionDO.class);
        return modelCalcExecutionMapper.updateById(updateObj);
    }

    @Override
    public int removeModelCalcExecution(Collection<Long> idList) {
        // 批量删除模型计算执行记录
        return modelCalcExecutionMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelCalcExecutionDO getModelCalcExecutionById(Long id) {
        return modelCalcExecutionMapper.selectById(id);
    }

    @Override
    public List<ModelCalcExecutionDO> getModelCalcExecutionList() {
        return modelCalcExecutionMapper.selectList();
    }

    @Override
    public Map<Long, ModelCalcExecutionDO> getModelCalcExecutionMap() {
        List<ModelCalcExecutionDO> modelCalcExecutionList = modelCalcExecutionMapper.selectList();
        return modelCalcExecutionList.stream()
                .collect(Collectors.toMap(
                        ModelCalcExecutionDO::getId,
                        modelCalcExecutionDO -> modelCalcExecutionDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


    /**
     * 导入模型计算执行记录数据
     *
     * @param importExcelList 模型计算执行记录数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    @Override
    public String importModelCalcExecution(List<ModelCalcExecutionRespVO> importExcelList, boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }

        int successNum = 0;
        int failureNum = 0;
        List<String> successMessages = new ArrayList<>();
        List<String> failureMessages = new ArrayList<>();

        for (ModelCalcExecutionRespVO respVO : importExcelList) {
            try {
                ModelCalcExecutionDO modelCalcExecutionDO = BeanUtils.toBean(respVO, ModelCalcExecutionDO.class);
                Long modelCalcExecutionId = respVO.getId();
                if (isUpdateSupport) {
                    if (modelCalcExecutionId != null) {
                        ModelCalcExecutionDO existingModelCalcExecution = modelCalcExecutionMapper.selectById(modelCalcExecutionId);
                        if (existingModelCalcExecution != null) {
                            modelCalcExecutionMapper.updateById(modelCalcExecutionDO);
                            successNum++;
                            successMessages.add("数据更新成功，ID为 " + modelCalcExecutionId + " 的模型计算执行记录记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，ID为 " + modelCalcExecutionId + " 的模型计算执行记录记录不存在。");
                        }
                    } else {
                        failureNum++;
                        failureMessages.add("数据更新失败，某条记录的ID不存在。");
                    }
                } else {
                    QueryWrapper<ModelCalcExecutionDO> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("id", modelCalcExecutionId);
                    ModelCalcExecutionDO existingModelCalcExecution = modelCalcExecutionMapper.selectOne(queryWrapper);
                    if (existingModelCalcExecution == null) {
                        modelCalcExecutionMapper.insert(modelCalcExecutionDO);
                        successNum++;
                        successMessages.add("数据插入成功，ID为 " + modelCalcExecutionId + " 的模型计算执行记录记录。");
                    } else {
                        failureNum++;
                        failureMessages.add("数据插入失败，ID为 " + modelCalcExecutionId + " 的模型计算执行记录记录已存在。");
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
    public ModelCalcExecutionDO getByExecutionNo(String executionNo) {
        QueryWrapper<ModelCalcExecutionDO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("execution_no", executionNo);
        return modelCalcExecutionMapper.selectOne(queryWrapper);
    }

    @Override
    public int updateStatusByExecutionNo(String executionNo, Integer status) {
        ModelCalcExecutionDO updateObj = new ModelCalcExecutionDO();
        updateObj.setStatus(status);
        QueryWrapper<ModelCalcExecutionDO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("execution_no", executionNo);
        return modelCalcExecutionMapper.update(updateObj, queryWrapper);
    }

    @Override
    public int updateExecutionResult(String executionNo, Integer status, String outputResult, String errorMessage, Long duration, String resourceUsage) {
        ModelCalcExecutionDO updateObj = new ModelCalcExecutionDO();
        updateObj.setStatus(status);
        updateObj.setOutputResult(outputResult);
        updateObj.setErrorMessage(errorMessage);
        updateObj.setDuration(duration);
        updateObj.setResourceUsage(resourceUsage);
        updateObj.setEndTime(new java.util.Date());
        QueryWrapper<ModelCalcExecutionDO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("execution_no", executionNo);
        return modelCalcExecutionMapper.update(updateObj, queryWrapper);
    }

    @Override
    public int updateExecutionLog(String executionNo, String executionLog) {
        ModelCalcExecutionDO updateObj = new ModelCalcExecutionDO();
        updateObj.setExecutionLog(executionLog);
        QueryWrapper<ModelCalcExecutionDO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("execution_no", executionNo);
        return modelCalcExecutionMapper.update(updateObj, queryWrapper);
    }

    @Override
    public int incrementRetryCount(String executionNo) {
        ModelCalcExecutionDO execution = getByExecutionNo(executionNo);
        if (execution == null) {
            return 0;
        }
        long retryCount = execution.getRetryCount() != null ? execution.getRetryCount() + 1 : 1;
        ModelCalcExecutionDO updateObj = new ModelCalcExecutionDO();
        updateObj.setRetryCount(retryCount);
        QueryWrapper<ModelCalcExecutionDO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("execution_no", executionNo);
        return modelCalcExecutionMapper.update(updateObj, queryWrapper);
    }

    @Override
    public Long countByStatus(Integer status) {
        QueryWrapper<ModelCalcExecutionDO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("status", status);
        return (long) modelCalcExecutionMapper.selectCount(queryWrapper);
    }



    
}
