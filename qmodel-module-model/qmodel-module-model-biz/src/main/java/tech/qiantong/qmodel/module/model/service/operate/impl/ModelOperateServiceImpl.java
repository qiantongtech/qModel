/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.service.operate.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperatePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.operate.ModelOperateDO;
import tech.qiantong.qmodel.module.model.dal.mapper.operate.ModelOperateMapper;
import tech.qiantong.qmodel.module.model.service.operate.IModelOperateService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
/**
 * 模型历史管理Service业务层处理
 *
 * @author qModel
 * @date 2026-01-09
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelOperateServiceImpl  extends ServiceImpl<ModelOperateMapper,ModelOperateDO> implements IModelOperateService {
    @Resource
    private ModelOperateMapper modelOperateMapper;

    @Override
    public PageResult<ModelOperateDO> getModelOperatePage(ModelOperatePageReqVO pageReqVO) {
        return modelOperateMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelOperate(ModelOperateSaveReqVO createReqVO) {
        ModelOperateDO dictType = BeanUtils.toBean(createReqVO, ModelOperateDO.class);
        modelOperateMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelOperate(ModelOperateSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型历史管理
        ModelOperateDO updateObj = BeanUtils.toBean(updateReqVO, ModelOperateDO.class);
        return modelOperateMapper.updateById(updateObj);
    }
    @Override
    public int removeModelOperate(Collection<Long> idList) {
        // 批量删除模型历史管理
        return modelOperateMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelOperateDO getModelOperateById(Long id) {
        return modelOperateMapper.selectById(id);
    }

    @Override
    public List<ModelOperateDO> getModelOperateList() {
        return modelOperateMapper.selectList();
    }

    @Override
    public Map<Long, ModelOperateDO> getModelOperateMap() {
        List<ModelOperateDO> modelOperateList = modelOperateMapper.selectList();
        return modelOperateList.stream()
                .collect(Collectors.toMap(
                        ModelOperateDO::getId,
                        modelOperateDO -> modelOperateDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入模型历史管理数据
         *
         * @param importExcelList 模型历史管理数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelOperate(List<ModelOperateRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelOperateRespVO respVO : importExcelList) {
                try {
                    ModelOperateDO modelOperateDO = BeanUtils.toBean(respVO, ModelOperateDO.class);
                    Long modelOperateId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelOperateId != null) {
                            ModelOperateDO existingModelOperate = modelOperateMapper.selectById(modelOperateId);
                            if (existingModelOperate != null) {
                                modelOperateMapper.updateById(modelOperateDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelOperateId + " 的模型历史管理记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelOperateId + " 的模型历史管理记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelOperateDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelOperateId);
                        ModelOperateDO existingModelOperate = modelOperateMapper.selectOne(queryWrapper);
                        if (existingModelOperate == null) {
                            modelOperateMapper.insert(modelOperateDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelOperateId + " 的模型历史管理记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelOperateId + " 的模型历史管理记录已存在。");
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
