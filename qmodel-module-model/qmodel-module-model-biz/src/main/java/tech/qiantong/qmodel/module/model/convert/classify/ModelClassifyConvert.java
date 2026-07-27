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

package tech.qiantong.qmodel.module.model.convert.classify;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifyPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifyRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifySaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.classify.ModelClassifyDO;

import java.util.List;

/**
 * 模型分类 Convert
 *
 * @author qModel
 * @date 2026-01-07
 */
@Mapper
public interface ModelClassifyConvert {
    ModelClassifyConvert INSTANCE = Mappers.getMapper(ModelClassifyConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelClassifyPageReqVO 请求参数
     * @return ModelClassifyDO
     */
     ModelClassifyDO convertToDO(ModelClassifyPageReqVO modelClassifyPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelClassifySaveReqVO 保存请求参数
     * @return ModelClassifyDO
     */
     ModelClassifyDO convertToDO(ModelClassifySaveReqVO modelClassifySaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelClassifyDO 实体对象
     * @return ModelClassifyRespVO
     */
     ModelClassifyRespVO convertToRespVO(ModelClassifyDO modelClassifyDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelClassifyDOList 实体对象列表
     * @return List<ModelClassifyRespVO>
     */
     List<ModelClassifyRespVO> convertToRespVOList(List<ModelClassifyDO> modelClassifyDOList);
}
