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

package tech.qiantong.qmodel.module.model.convert.modelAudit;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelAudit.ModelAuditDO;

/**
 * 模型审批 Convert
 *
 * @author anivia
 * @date 2026-07-23
 */
@Mapper
public interface ModelAuditConvert {
    ModelAuditConvert INSTANCE = Mappers.getMapper(ModelAuditConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelAuditPageReqVO 请求参数
     * @return ModelAuditDO
     */
     ModelAuditDO convertToDO(ModelAuditPageReqVO modelAuditPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelAuditSaveReqVO 保存请求参数
     * @return ModelAuditDO
     */
     ModelAuditDO convertToDO(ModelAuditSaveReqVO modelAuditSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelAuditDO 实体对象
     * @return ModelAuditRespVO
     */
     ModelAuditRespVO convertToRespVO(ModelAuditDO modelAuditDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelAuditDOList 实体对象列表
     * @return List<ModelAuditRespVO>
     */
     List<ModelAuditRespVO> convertToRespVOList(List<ModelAuditDO> modelAuditDOList);
}
