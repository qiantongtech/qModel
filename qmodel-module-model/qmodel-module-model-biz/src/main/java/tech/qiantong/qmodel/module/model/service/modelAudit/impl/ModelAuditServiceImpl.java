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

package tech.qiantong.qmodel.module.model.service.modelAudit.impl;

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
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelAudit.ModelAuditDO;
import tech.qiantong.qmodel.module.model.dal.mapper.modelAudit.ModelAuditMapper;
import tech.qiantong.qmodel.module.model.service.modelAudit.IModelAuditService;

/**
 * 模型审批Service业务层处理
 *
 * @author anivia
 * @date 2026-07-23
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelAuditServiceImpl extends ServiceImpl<ModelAuditMapper, ModelAuditDO> implements IModelAuditService {
    @Resource
    private ModelAuditMapper modelAuditMapper;

    @Override
    public PageResult<ModelAuditDO> getModelAuditPage(ModelAuditPageReqVO pageReqVO) {
        return modelAuditMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelAudit(ModelAuditSaveReqVO createReqVO) {
        ModelAuditDO dictType = BeanUtils.toBean(createReqVO, ModelAuditDO.class);
        modelAuditMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelAudit(ModelAuditSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型审批
        ModelAuditDO updateObj = BeanUtils.toBean(updateReqVO, ModelAuditDO.class);
        return modelAuditMapper.updateById(updateObj);
    }

    @Override
    public int removeModelAudit(Collection<Long> idList) {
        // 批量删除模型审批
        return modelAuditMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelAuditDO getModelAuditById(Long id) {
        return modelAuditMapper.selectById(id);
    }

    @Override
    public List<ModelAuditDO> getModelAuditList() {
        return modelAuditMapper.selectList();
    }

    @Override
    public Map<Long, ModelAuditDO> getModelAuditMap() {
        List<ModelAuditDO> modelAuditList = modelAuditMapper.selectList();
        return modelAuditList.stream()
                .collect(Collectors.toMap(
                        ModelAuditDO::getId,
                        modelAuditDO -> modelAuditDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


    /**
     * 导入模型审批数据
     *
     * @param importExcelList 模型审批数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    @Override
    public String importModelAudit(List<ModelAuditRespVO> importExcelList, boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }

        int successNum = 0;
        int failureNum = 0;
        List<String> successMessages = new ArrayList<>();
        List<String> failureMessages = new ArrayList<>();

        for (ModelAuditRespVO respVO : importExcelList) {
            try {
                ModelAuditDO modelAuditDO = BeanUtils.toBean(respVO, ModelAuditDO.class);
                Long modelAuditId = respVO.getId();
                if (isUpdateSupport) {
                    if (modelAuditId != null) {
                        ModelAuditDO existingModelAudit = modelAuditMapper.selectById(modelAuditId);
                        if (existingModelAudit != null) {
                            modelAuditMapper.updateById(modelAuditDO);
                            successNum++;
                            successMessages.add("数据更新成功，ID为 " + modelAuditId + " 的模型审批记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，ID为 " + modelAuditId + " 的模型审批记录不存在。");
                        }
                    } else {
                        failureNum++;
                        failureMessages.add("数据更新失败，某条记录的ID不存在。");
                    }
                } else {
                    QueryWrapper<ModelAuditDO> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("id", modelAuditId);
                    ModelAuditDO existingModelAudit = modelAuditMapper.selectOne(queryWrapper);
                    if (existingModelAudit == null) {
                        modelAuditMapper.insert(modelAuditDO);
                        successNum++;
                        successMessages.add("数据插入成功，ID为 " + modelAuditId + " 的模型审批记录。");
                    } else {
                        failureNum++;
                        failureMessages.add("数据插入失败，ID为 " + modelAuditId + " 的模型审批记录已存在。");
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
