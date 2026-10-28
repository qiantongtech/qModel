/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.convert.modelData;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelData.ModelDataApiDO;

/**
 * 模型数据API接入 Convert
 *
 * @author qModel
 * @date 2026-08-19
 */
@Mapper
public interface ModelDataApiConvert {
    ModelDataApiConvert INSTANCE = Mappers.getMapper(ModelDataApiConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelDataApiPageReqVO 请求参数
     * @return ModelDataApiDO
     */
     ModelDataApiDO convertToDO(ModelDataApiPageReqVO modelDataApiPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelDataApiSaveReqVO 保存请求参数
     * @return ModelDataApiDO
     */
     ModelDataApiDO convertToDO(ModelDataApiSaveReqVO modelDataApiSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelDataApiDO 实体对象
     * @return ModelDataApiRespVO
     */
     ModelDataApiRespVO convertToRespVO(ModelDataApiDO modelDataApiDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelDataApiDOList 实体对象列表
     * @return List<ModelDataApiRespVO>
     */
     List<ModelDataApiRespVO> convertToRespVOList(List<ModelDataApiDO> modelDataApiDOList);
}
