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

package tech.qiantong.qmodel.module.model.convert.operate;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperatePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.operate.ModelOperateDO;

import java.util.List;

/**
 * 模型历史管理 Convert
 *
 * @author qModel
 * @date 2026-01-09
 */
@Mapper
public interface ModelOperateConvert {
    ModelOperateConvert INSTANCE = Mappers.getMapper(ModelOperateConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelOperatePageReqVO 请求参数
     * @return ModelOperateDO
     */
     ModelOperateDO convertToDO(ModelOperatePageReqVO modelOperatePageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelOperateSaveReqVO 保存请求参数
     * @return ModelOperateDO
     */
     ModelOperateDO convertToDO(ModelOperateSaveReqVO modelOperateSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelOperateDO 实体对象
     * @return ModelOperateRespVO
     */
     ModelOperateRespVO convertToRespVO(ModelOperateDO modelOperateDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelOperateDOList 实体对象列表
     * @return List<ModelOperateRespVO>
     */
     List<ModelOperateRespVO> convertToRespVOList(List<ModelOperateDO> modelOperateDOList);
}
