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

package tech.qiantong.qmodel.module.model.convert.calc;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;

/**
 * 模型计算任务 Convert
 *
 * @author qModel
 * @date 2026-07-27
 */
@Mapper
public interface ModelCalcConvert {
    ModelCalcConvert INSTANCE = Mappers.getMapper(ModelCalcConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelCalcPageReqVO 请求参数
     * @return ModelCalcDO
     */
     ModelCalcDO convertToDO(ModelCalcPageReqVO modelCalcPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelCalcSaveReqVO 保存请求参数
     * @return ModelCalcDO
     */
     ModelCalcDO convertToDO(ModelCalcSaveReqVO modelCalcSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelCalcDO 实体对象
     * @return ModelCalcRespVO
     */
     ModelCalcRespVO convertToRespVO(ModelCalcDO modelCalcDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelCalcDOList 实体对象列表
     * @return List<ModelCalcRespVO>
     */
     List<ModelCalcRespVO> convertToRespVOList(List<ModelCalcDO> modelCalcDOList);
}
