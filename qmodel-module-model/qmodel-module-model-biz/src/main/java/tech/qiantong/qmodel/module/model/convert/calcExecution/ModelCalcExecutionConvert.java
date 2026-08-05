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

package tech.qiantong.qmodel.module.model.convert.calcExecution;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcExecution.ModelCalcExecutionDO;

/**
 * 模型计算执行记录 Convert
 *
 * @author qModel
 * @date 2026-07-28
 */
@Mapper
public interface ModelCalcExecutionConvert {
    ModelCalcExecutionConvert INSTANCE = Mappers.getMapper(ModelCalcExecutionConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelCalcExecutionPageReqVO 请求参数
     * @return ModelCalcExecutionDO
     */
     ModelCalcExecutionDO convertToDO(ModelCalcExecutionPageReqVO modelCalcExecutionPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelCalcExecutionSaveReqVO 保存请求参数
     * @return ModelCalcExecutionDO
     */
     ModelCalcExecutionDO convertToDO(ModelCalcExecutionSaveReqVO modelCalcExecutionSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelCalcExecutionDO 实体对象
     * @return ModelCalcExecutionRespVO
     */
     ModelCalcExecutionRespVO convertToRespVO(ModelCalcExecutionDO modelCalcExecutionDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelCalcExecutionDOList 实体对象列表
     * @return List<ModelCalcExecutionRespVO>
     */
     List<ModelCalcExecutionRespVO> convertToRespVOList(List<ModelCalcExecutionDO> modelCalcExecutionDOList);
}
