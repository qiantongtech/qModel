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

package tech.qiantong.qmodel.module.model.controller.admin.output.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型输出管理 Request VO 对象 MODEL_OUTPUT
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "模型输出管理 Request VO")
@Data
public class ModelOutputPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;

    @Schema(description = "企业Id", example = "")
    private Long companyId;

    @Schema(description = "参数名称", example = "")
    private String name;

    @Schema(description = "英文名称", example = "")
    private String engName;

    @Schema(description = "参数类型 0:单值，1：多列数值", example = "")
    private Long type;

    @Schema(description = "所属模型id", example = "")
    private Long modelId;

    @Schema(description = "所属模型名称", example = "")
    private String modelName;

    @Schema(description = "所属模型版本", example = "")
    private String modelVersion;

    @Schema(description = "参数说明(描述)", example = "")
    private String description;

    @Schema(description = "参数单值", example = "")
    private String singleContent;

    @Schema(description = "参数多列值", example = "")
    private String multipleContent;




}
