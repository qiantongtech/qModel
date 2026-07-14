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

package tech.qiantong.qmodel.module.model.service.invokeHistory.impl;

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
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.invokeHistory.ModelInvokeHistoryDO;
import tech.qiantong.qmodel.module.model.dal.mapper.invokeHistory.ModelInvokeHistoryMapper;
import tech.qiantong.qmodel.module.model.service.invokeHistory.IModelInvokeHistoryService;
/**
 * 模型调用历史记录Service业务层处理
 *
 * @author qmodel
 * @date 2026-07-14
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelInvokeHistoryServiceImpl  extends ServiceImpl<ModelInvokeHistoryMapper,ModelInvokeHistoryDO> implements IModelInvokeHistoryService {
    @Resource
    private ModelInvokeHistoryMapper modelInvokeHistoryMapper;

    @Override
    public PageResult<ModelInvokeHistoryDO> getModelInvokeHistoryPage(ModelInvokeHistoryPageReqVO pageReqVO) {
        return modelInvokeHistoryMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelInvokeHistory(ModelInvokeHistorySaveReqVO createReqVO) {
        ModelInvokeHistoryDO dictType = BeanUtils.toBean(createReqVO, ModelInvokeHistoryDO.class);
        modelInvokeHistoryMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelInvokeHistory(ModelInvokeHistorySaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型调用历史记录
        ModelInvokeHistoryDO updateObj = BeanUtils.toBean(updateReqVO, ModelInvokeHistoryDO.class);
        return modelInvokeHistoryMapper.updateById(updateObj);
    }
    @Override
    public int removeModelInvokeHistory(Collection<Long> idList) {
        // 批量删除模型调用历史记录
        return modelInvokeHistoryMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelInvokeHistoryDO getModelInvokeHistoryById(Long id) {
        return modelInvokeHistoryMapper.selectById(id);
    }

    @Override
    public List<ModelInvokeHistoryDO> getModelInvokeHistoryList() {
        return modelInvokeHistoryMapper.selectList();
    }

    @Override
    public Map<Long, ModelInvokeHistoryDO> getModelInvokeHistoryMap() {
        List<ModelInvokeHistoryDO> modelInvokeHistoryList = modelInvokeHistoryMapper.selectList();
        return modelInvokeHistoryList.stream()
                .collect(Collectors.toMap(
                        ModelInvokeHistoryDO::getId,
                        modelInvokeHistoryDO -> modelInvokeHistoryDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入模型调用历史记录数据
         *
         * @param importExcelList 模型调用历史记录数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelInvokeHistory(List<ModelInvokeHistoryRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelInvokeHistoryRespVO respVO : importExcelList) {
                try {
                    ModelInvokeHistoryDO modelInvokeHistoryDO = BeanUtils.toBean(respVO, ModelInvokeHistoryDO.class);
                    Long modelInvokeHistoryId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelInvokeHistoryId != null) {
                            ModelInvokeHistoryDO existingModelInvokeHistory = modelInvokeHistoryMapper.selectById(modelInvokeHistoryId);
                            if (existingModelInvokeHistory != null) {
                                modelInvokeHistoryMapper.updateById(modelInvokeHistoryDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelInvokeHistoryId + " 的模型调用历史记录记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelInvokeHistoryId + " 的模型调用历史记录记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelInvokeHistoryDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelInvokeHistoryId);
                        ModelInvokeHistoryDO existingModelInvokeHistory = modelInvokeHistoryMapper.selectOne(queryWrapper);
                        if (existingModelInvokeHistory == null) {
                            modelInvokeHistoryMapper.insert(modelInvokeHistoryDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelInvokeHistoryId + " 的模型调用历史记录记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelInvokeHistoryId + " 的模型调用历史记录记录已存在。");
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
