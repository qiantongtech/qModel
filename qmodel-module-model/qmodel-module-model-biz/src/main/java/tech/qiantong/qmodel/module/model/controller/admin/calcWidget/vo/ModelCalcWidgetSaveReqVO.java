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

package tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.Valid;
import java.util.List;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型计算任务可视化组件配置 创建/修改 Request VO model_calc_widget
 *
 * @author anivia
 * @date 2026-08-04
 */
@Schema(description = "模型计算任务可视化组件配置 Response VO")
@Data
public class ModelCalcWidgetSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "租户/公司ID", example = "")
    private Long companyId;

    @Schema(description = "计算任务ID，关联 model_calc.id", example = "")
    @NotNull(message = "计算任务ID，关联 model_calc.id不能为空")
    private Long calcId;

    @Schema(description = "关联模型ID，冗余字段", example = "")
    private Long modelId;

    @Schema(description = "组件类型：base64、line、bar、pie 等", example = "")
    @NotBlank(message = "组件类型：base64、line、bar、pie 等不能为空")
    private String type;

    @Schema(description = "组件显示标题", example = "")
    @NotBlank(message = "组件显示标题不能为空")
    private String title;

    @Schema(description = "展示排序", example = "")
    private Long sort;

    @Schema(description = "Base64 字段绑定路径", example = "image_base64")
    private String field;

    @Schema(description = "折线图 X 轴字段绑定路径", example = "chart_data.time")
    @JsonProperty("xField")
    private String xField;

    @Schema(description = "折线图 Y 轴数据系列")
    @Valid
    @JsonProperty("yFields")
    private List<ModelCalcWidgetYFieldVO> yFields;


}
