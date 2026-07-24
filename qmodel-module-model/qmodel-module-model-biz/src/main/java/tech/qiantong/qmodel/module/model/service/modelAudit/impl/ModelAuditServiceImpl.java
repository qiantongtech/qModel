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

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelAudit.ModelAuditDO;
import tech.qiantong.qmodel.module.model.dal.mapper.modelAudit.ModelAuditMapper;
import tech.qiantong.qmodel.module.model.service.modelAudit.IModelAuditService;

import java.util.Date;

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

    /**
     * 模型审批分页列表
     *
     * @param pageReqVO 查询参数
     * @return 模型审批分页列表
     */
    @Override
    public PageResult<ModelAuditPageReqVO> getModelAuditPage(ModelAuditPageReqVO pageReqVO) {
        if (StrUtil.isNotBlank(pageReqVO.getModelName())){
            pageReqVO.setModelName("%" + pageReqVO.getModelName() + "%");
        }
        if (StrUtil.isNotBlank(pageReqVO.getModelCode())){
            pageReqVO.setModelCode("%" + pageReqVO.getModelCode() + "%");
        }
        IPage<ModelAuditPageReqVO> page = new Page<>(pageReqVO.getPageNum(), pageReqVO.getPageSize());
        page = baseMapper.selectPage(page, pageReqVO);

        return new PageResult<>(page.getRecords(),page.getTotal());
    }

    @Override
    public int updateModelAudit(ModelAuditSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型审批
        updateReqVO.setAuditTime(new Date());
        ModelAuditDO updateObj = BeanUtils.toBean(updateReqVO, ModelAuditDO.class);
        return baseMapper.updateById(updateObj);
    }

    @Override
    public ModelAuditDO getModelAuditById(Long id) {
        return baseMapper.selectById(id);
    }

}
