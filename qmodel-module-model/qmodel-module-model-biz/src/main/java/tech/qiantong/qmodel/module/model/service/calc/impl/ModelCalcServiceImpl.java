/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
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
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import tech.qiantong.qmodel.module.model.dal.mapper.calc.ModelCalcMapper;
import tech.qiantong.qmodel.module.model.service.calc.IModelCalcService;
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

    @Override
    public PageResult<ModelCalcDO> getModelCalcPage(ModelCalcPageReqVO pageReqVO) {
        return modelCalcMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelCalc(ModelCalcSaveReqVO createReqVO) {
        ModelCalcDO dictType = BeanUtils.toBean(createReqVO, ModelCalcDO.class);
        modelCalcMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelCalc(ModelCalcSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型计算任务
        ModelCalcDO updateObj = BeanUtils.toBean(updateReqVO, ModelCalcDO.class);
        return modelCalcMapper.updateById(updateObj);
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
}
