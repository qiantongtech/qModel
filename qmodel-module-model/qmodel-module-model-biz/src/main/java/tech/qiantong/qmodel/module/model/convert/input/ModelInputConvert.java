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

package tech.qiantong.qmodel.module.model.convert.input;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.input.ModelInputDO;

import java.util.List;

/**
 * 模型输入管理 Convert
 *
 * @author qModel
 * @date 2026-01-09
 */
@Mapper
public interface ModelInputConvert {
    ModelInputConvert INSTANCE = Mappers.getMapper(ModelInputConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelInputPageReqVO 请求参数
     * @return ModelInputDO
     */
     ModelInputDO convertToDO(ModelInputPageReqVO modelInputPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelInputSaveReqVO 保存请求参数
     * @return ModelInputDO
     */
     ModelInputDO convertToDO(ModelInputSaveReqVO modelInputSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelInputDO 实体对象
     * @return ModelInputRespVO
     */
     ModelInputRespVO convertToRespVO(ModelInputDO modelInputDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelInputDOList 实体对象列表
     * @return List<ModelInputRespVO>
     */
     List<ModelInputRespVO> convertToRespVOList(List<ModelInputDO> modelInputDOList);
}
