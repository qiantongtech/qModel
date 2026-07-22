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

package tech.qiantong.qmodel.module.model.convert.cacl;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.cacl.vo.ModelCaclSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.cacl.ModelCaclDO;

import java.util.List;

/**
 * 模型计算重构 Convert
 *
 * @author qModel
 * @date 2026-01-12
 */
@Mapper
public interface ModelCaclConvert {
    ModelCaclConvert INSTANCE = Mappers.getMapper(ModelCaclConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelCaclPageReqVO 请求参数
     * @return ModelCaclDO
     */
     ModelCaclDO convertToDO(ModelCaclPageReqVO modelCaclPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelCaclSaveReqVO 保存请求参数
     * @return ModelCaclDO
     */
     ModelCaclDO convertToDO(ModelCaclSaveReqVO modelCaclSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelCaclDO 实体对象
     * @return ModelCaclRespVO
     */
     ModelCaclRespVO convertToRespVO(ModelCaclDO modelCaclDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelCaclDOList 实体对象列表
     * @return List<ModelCaclRespVO>
     */
     List<ModelCaclRespVO> convertToRespVOList(List<ModelCaclDO> modelCaclDOList);
}
