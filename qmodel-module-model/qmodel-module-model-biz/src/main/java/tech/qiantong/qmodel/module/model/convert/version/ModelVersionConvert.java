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

package tech.qiantong.qmodel.module.model.convert.version;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;

import java.util.List;

/**
 * 版本管理 Convert
 *
 * @author qModel
 * @date 2026-01-09
 */
@Mapper
public interface ModelVersionConvert {
    ModelVersionConvert INSTANCE = Mappers.getMapper(ModelVersionConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelVersionPageReqVO 请求参数
     * @return ModelVersionDO
     */
     ModelVersionDO convertToDO(ModelVersionPageReqVO modelVersionPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelVersionSaveReqVO 保存请求参数
     * @return ModelVersionDO
     */
     ModelVersionDO convertToDO(ModelVersionSaveReqVO modelVersionSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelVersionDO 实体对象
     * @return ModelVersionRespVO
     */
     ModelVersionRespVO convertToRespVO(ModelVersionDO modelVersionDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelVersionDOList 实体对象列表
     * @return List<ModelVersionRespVO>
     */
     List<ModelVersionRespVO> convertToRespVOList(List<ModelVersionDO> modelVersionDOList);
}
