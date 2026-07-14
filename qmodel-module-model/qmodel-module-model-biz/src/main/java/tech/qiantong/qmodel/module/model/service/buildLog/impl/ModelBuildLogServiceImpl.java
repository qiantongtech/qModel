/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
 */

package tech.qiantong.qmodel.module.model.service.buildLog.impl;

import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.exception.ServiceException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.buildLog.ModelBuildLogDO;
import tech.qiantong.qmodel.module.model.dal.mapper.buildLog.ModelBuildLogMapper;
import tech.qiantong.qmodel.module.model.service.buildLog.IModelBuildLogService;
/**
 * 构建日志Service业务层处理
 *
 * @author qModel
 * @date 2026-07-14
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelBuildLogServiceImpl  extends ServiceImpl<ModelBuildLogMapper,ModelBuildLogDO> implements IModelBuildLogService {
    @Resource
    private ModelBuildLogMapper modelBuildLogMapper;

    @Override
    public PageResult<ModelBuildLogDO> getModelBuildLogPage(ModelBuildLogPageReqVO pageReqVO) {
        return modelBuildLogMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelBuildLog(ModelBuildLogSaveReqVO createReqVO) {
        ModelBuildLogDO dictType = BeanUtils.toBean(createReqVO, ModelBuildLogDO.class);
        modelBuildLogMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelBuildLog(ModelBuildLogSaveReqVO updateReqVO) {
        // 相关校验

        // 更新构建日志
        ModelBuildLogDO updateObj = BeanUtils.toBean(updateReqVO, ModelBuildLogDO.class);
        return modelBuildLogMapper.updateById(updateObj);
    }
    @Override
    public int removeModelBuildLog(Collection<Long> idList) {
        // 批量删除构建日志
        return modelBuildLogMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelBuildLogDO getModelBuildLogById(Long id) {
        return modelBuildLogMapper.selectById(id);
    }

    @Override
    public List<ModelBuildLogDO> getModelBuildLogList() {
        return modelBuildLogMapper.selectList();
    }

    @Override
    public Map<Long, ModelBuildLogDO> getModelBuildLogMap() {
        List<ModelBuildLogDO> modelBuildLogList = modelBuildLogMapper.selectList();
        return modelBuildLogList.stream()
                .collect(Collectors.toMap(
                        ModelBuildLogDO::getId,
                        modelBuildLogDO -> modelBuildLogDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入构建日志数据
         *
         * @param importExcelList 构建日志数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelBuildLog(List<ModelBuildLogRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelBuildLogRespVO respVO : importExcelList) {
                try {
                    ModelBuildLogDO modelBuildLogDO = BeanUtils.toBean(respVO, ModelBuildLogDO.class);
                    Long modelBuildLogId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelBuildLogId != null) {
                            ModelBuildLogDO existingModelBuildLog = modelBuildLogMapper.selectById(modelBuildLogId);
                            if (existingModelBuildLog != null) {
                                modelBuildLogMapper.updateById(modelBuildLogDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelBuildLogId + " 的构建日志记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelBuildLogId + " 的构建日志记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelBuildLogDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelBuildLogId);
                        ModelBuildLogDO existingModelBuildLog = modelBuildLogMapper.selectOne(queryWrapper);
                        if (existingModelBuildLog == null) {
                            modelBuildLogMapper.insert(modelBuildLogDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelBuildLogId + " 的构建日志记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelBuildLogId + " 的构建日志记录已存在。");
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
}
