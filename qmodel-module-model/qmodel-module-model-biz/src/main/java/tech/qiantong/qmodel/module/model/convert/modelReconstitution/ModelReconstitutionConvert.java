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

package tech.qiantong.qmodel.module.model.convert.modelReconstitution;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution.ModelReconstitutionDO;

import java.util.List;

/**
 * 模型库重构 Convert
 *
 * @author qModel
 * @date 2026-01-12
 */
@Mapper
public interface ModelReconstitutionConvert {
    ModelReconstitutionConvert INSTANCE = Mappers.getMapper(ModelReconstitutionConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelReconstitutionPageReqVO 请求参数
     * @return ModelReconstitutionDO
     */
     ModelReconstitutionDO convertToDO(ModelReconstitutionPageReqVO modelReconstitutionPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelReconstitutionSaveReqVO 保存请求参数
     * @return ModelReconstitutionDO
     */
     ModelReconstitutionDO convertToDO(ModelReconstitutionSaveReqVO modelReconstitutionSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelReconstitutionDO 实体对象
     * @return ModelReconstitutionRespVO
     */
     ModelReconstitutionRespVO convertToRespVO(ModelReconstitutionDO modelReconstitutionDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelReconstitutionDOList 实体对象列表
     * @return List<ModelReconstitutionRespVO>
     */
     List<ModelReconstitutionRespVO> convertToRespVOList(List<ModelReconstitutionDO> modelReconstitutionDOList);
}
