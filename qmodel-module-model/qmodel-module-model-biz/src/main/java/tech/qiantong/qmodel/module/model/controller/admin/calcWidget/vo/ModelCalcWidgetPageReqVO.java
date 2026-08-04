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

package tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型计算任务可视化组件配置 Request VO 对象 model_calc_widget
 *
 * @author anivia
 * @date 2026-08-04
 */
@Schema(description = "模型计算任务可视化组件配置 Request VO")
@Data
public class ModelCalcWidgetPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "租户/公司ID", example = "")
    private Long companyId;

    @Schema(description = "计算任务ID，关联 model_calc.id", example = "")
    private Long calcId;

    @Schema(description = "关联模型ID，冗余字段", example = "")
    private Long modelId;

    @Schema(description = "组件类型：base64、line、bar、pie 等", example = "")
    private String type;

    @Schema(description = "组件显示标题", example = "")
    private String title;

    @Schema(description = "展示排序", example = "")
    private Long sort;

    @Schema(description = "组件配置JSON", example = "")
    private String config;




}
