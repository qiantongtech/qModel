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

import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;

/**
 * 模型计算任务可视化组件配置 Response VO 对象 model_calc_widget
 *
 * @author anivia
 * @date 2026-08-04
 */
@Schema(description = "模型计算任务可视化组件配置 Response VO")
@Data
public class ModelCalcWidgetRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "租户/公司ID")
    @Schema(description = "租户/公司ID", example = "")
    private Long companyId;

    @Excel(name = "计算任务ID，关联 model_calc.id")
    @Schema(description = "计算任务ID，关联 model_calc.id", example = "")
    private Long calcId;

    @Excel(name = "关联模型ID，冗余字段")
    @Schema(description = "关联模型ID，冗余字段", example = "")
    private Long modelId;

    @Excel(name = "组件类型：base64、line、bar、pie 等")
    @Schema(description = "组件类型：base64、line、bar、pie 等", example = "")
    private String type;

    @Excel(name = "组件显示标题")
    @Schema(description = "组件显示标题", example = "")
    private String title;

    @Excel(name = "展示排序")
    @Schema(description = "展示排序", example = "")
    private Long sort;

    @Excel(name = "组件配置JSON")
    @Schema(description = "组件配置JSON", example = "")
    private String config;

    @Schema(description = "Base64 字段绑定路径", example = "image_base64")
    private String field;

    @Schema(description = "折线图 X 轴字段绑定路径", example = "chart_data.time")
    @JsonProperty("xField")
    private String xField;

    @Schema(description = "折线图 Y 轴数据系列")
    @JsonProperty("yFields")
    private List<ModelCalcWidgetYFieldVO> yFields;

    @Excel(name = "是否有效")
    @Schema(description = "是否有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志")
    @Schema(description = "删除标志", example = "")
    private Boolean delFlag;

    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;

    @Excel(name = "创建人id")
    @Schema(description = "创建人id", example = "")
    private Long creatorId;

    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;

    @Excel(name = "更新人id")
    @Schema(description = "更新人id", example = "")
    private Long updatorId;

    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

}
