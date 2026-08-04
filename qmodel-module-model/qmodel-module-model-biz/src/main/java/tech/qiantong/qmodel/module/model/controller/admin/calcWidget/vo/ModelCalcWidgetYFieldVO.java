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

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 可视化组件 Y 轴/系列配置 VO
 *
 * @author anivia
 * @date 2026-08-04
 */
@Schema(description = "可视化组件 Y 轴/系列配置")
@Data
public class ModelCalcWidgetYFieldVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "图例名称", example = "预测流量")
    @NotBlank(message = "图例名称不能为空")
    private String tag;

    @Schema(description = "字段绑定路径", example = "chart_data.value")
    @NotBlank(message = "字段绑定不能为空")
    private String field;

}
