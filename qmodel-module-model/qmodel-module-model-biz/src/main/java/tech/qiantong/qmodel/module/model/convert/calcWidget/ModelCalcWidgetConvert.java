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

package tech.qiantong.qmodel.module.model.convert.calcWidget;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcWidget.ModelCalcWidgetDO;

/**
 * 模型计算任务可视化组件配置 Convert
 *
 * @author anivia
 * @date 2026-08-04
 */
@Mapper
public interface ModelCalcWidgetConvert {
    ModelCalcWidgetConvert INSTANCE = Mappers.getMapper(ModelCalcWidgetConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelCalcWidgetPageReqVO 请求参数
     * @return ModelCalcWidgetDO
     */
     ModelCalcWidgetDO convertToDO(ModelCalcWidgetPageReqVO modelCalcWidgetPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelCalcWidgetSaveReqVO 保存请求参数
     * @return ModelCalcWidgetDO
     */
     ModelCalcWidgetDO convertToDO(ModelCalcWidgetSaveReqVO modelCalcWidgetSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelCalcWidgetDO 实体对象
     * @return ModelCalcWidgetRespVO
     */
     ModelCalcWidgetRespVO convertToRespVO(ModelCalcWidgetDO modelCalcWidgetDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelCalcWidgetDOList 实体对象列表
     * @return List<ModelCalcWidgetRespVO>
     */
     List<ModelCalcWidgetRespVO> convertToRespVOList(List<ModelCalcWidgetDO> modelCalcWidgetDOList);
}
