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

package tech.qiantong.qmodel.module.model.convert.output;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.output.ModelOutputDO;

import java.util.List;

/**
 * 模型输出管理 Convert
 *
 * @author qModel
 * @date 2026-01-09
 */
@Mapper
public interface ModelOutputConvert {
    ModelOutputConvert INSTANCE = Mappers.getMapper(ModelOutputConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelOutputPageReqVO 请求参数
     * @return ModelOutputDO
     */
     ModelOutputDO convertToDO(ModelOutputPageReqVO modelOutputPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelOutputSaveReqVO 保存请求参数
     * @return ModelOutputDO
     */
     ModelOutputDO convertToDO(ModelOutputSaveReqVO modelOutputSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelOutputDO 实体对象
     * @return ModelOutputRespVO
     */
     ModelOutputRespVO convertToRespVO(ModelOutputDO modelOutputDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelOutputDOList 实体对象列表
     * @return List<ModelOutputRespVO>
     */
     List<ModelOutputRespVO> convertToRespVOList(List<ModelOutputDO> modelOutputDOList);
}
