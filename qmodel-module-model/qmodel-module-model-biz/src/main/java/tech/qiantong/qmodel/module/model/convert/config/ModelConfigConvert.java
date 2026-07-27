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

package tech.qiantong.qmodel.module.model.convert.config;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;

/**
 * 模型配置详情 Convert
 *
 * @author anivia
 * @date 2026-07-07
 */
@Mapper
public interface ModelConfigConvert {
    ModelConfigConvert INSTANCE = Mappers.getMapper(ModelConfigConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelConfigPageReqVO 请求参数
     * @return ModelConfigDO
     */
    ModelConfigDO convertToDO(ModelConfigPageReqVO modelConfigPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelConfigSaveReqVO 保存请求参数
     * @return ModelConfigDO
     */
    ModelConfigDO convertToDO(ModelConfigSaveReqVO modelConfigSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelConfigDO 实体对象
     * @return ModelConfigRespVO
     */
    ModelConfigRespVO convertToRespVO(ModelConfigDO modelConfigDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelConfigDOList 实体对象列表
     * @return List<ModelConfigRespVO>
     */
    List<ModelConfigRespVO> convertToRespVOList(List<ModelConfigDO> modelConfigDOList);
}
