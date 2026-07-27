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

package tech.qiantong.qmodel.module.model.convert.model;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;

/**
 * 模型基础信息 Convert
 *
 * @author anivia
 * @date 2026-07-07
 */
@Mapper
public interface ModelConvert {
    ModelConvert INSTANCE = Mappers.getMapper(ModelConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelPageReqVO 请求参数
     * @return ModelDO
     */
    ModelDO convertToDO(ModelPageReqVO modelPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelSaveReqVO 保存请求参数
     * @return ModelDO
     */
    ModelDO convertToDO(ModelSaveReqVO modelSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelDO 实体对象
     * @return ModelRespVO
     */
    ModelRespVO convertToRespVO(ModelDO modelDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelDOList 实体对象列表
     * @return List<ModelRespVO>
     */
    List<ModelRespVO> convertToRespVOList(List<ModelDO> modelDOList);
}
