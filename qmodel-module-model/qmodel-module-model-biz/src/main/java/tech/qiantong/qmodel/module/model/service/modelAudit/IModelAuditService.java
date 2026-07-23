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

package tech.qiantong.qmodel.module.model.service.modelAudit;

import java.util.List;
import java.util.Map;
import java.util.Collection;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelAudit.ModelAuditDO;

/**
 * 模型审批Service接口
 *
 * @author anivia
 * @date 2026-07-23
 */
public interface IModelAuditService extends IService<ModelAuditDO> {

    /**
     * 获得模型审批分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型审批分页列表
     */
    PageResult<ModelAuditDO> getModelAuditPage(ModelAuditPageReqVO pageReqVO);

    /**
     * 创建模型审批
     *
     * @param createReqVO 模型审批信息
     * @return 模型审批编号
     */
    Long createModelAudit(ModelAuditSaveReqVO createReqVO);

    /**
     * 更新模型审批
     *
     * @param updateReqVO 模型审批信息
     */
    int updateModelAudit(ModelAuditSaveReqVO updateReqVO);

    /**
     * 删除模型审批
     *
     * @param idList 模型审批编号
     */
    int removeModelAudit(Collection<Long> idList);

    /**
     * 获得模型审批详情
     *
     * @param id 模型审批编号
     * @return 模型审批
     */
    ModelAuditDO getModelAuditById(Long id);

    /**
     * 获得全部模型审批列表
     *
     * @return 模型审批列表
     */
    List<ModelAuditDO> getModelAuditList();

    /**
     * 获得全部模型审批 Map
     *
     * @return 模型审批 Map
     */
    Map<Long, ModelAuditDO> getModelAuditMap();


    /**
     * 导入模型审批数据
     *
     * @param importExcelList 模型审批数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    String importModelAudit(List<ModelAuditRespVO> importExcelList, boolean isUpdateSupport, String operName);

}
