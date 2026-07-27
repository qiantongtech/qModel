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

package tech.qiantong.qmodel.module.model.controller.admin.input.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 模型输入管理 创建/修改 Request VO MODEL_INPUT
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "模型输入管理 Response VO")
@Data
public class ModelInputSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业Id", example = "")
    private Long companyId;

    @Schema(description = "参数名称", example = "")
    @NotBlank(message = "参数名称不能为空")
    private String name;

    @Schema(description = "英文名称", example = "")
//    @NotBlank(message = "英文名称不能为空")
    private String engName;

    @Schema(description = "参数类型 0:单值，1：多列数值，2：文件", example = "")
    @NotNull(message = "参数类型不能为空")
    private Long type;

    @Schema(description = "所属模型id", example = "")
    private Long modelId;

    @Schema(description = "所属模型名称", example = "")
//    @NotBlank(message = "所属模型名称不能为空")
    private String modelName;

    @Schema(description = "所属模型版本", example = "")
    @NotBlank(message = "所属模型版本不能为空")
    private String modelVersion;

    @Schema(description = "参数说明(描述)", example = "")
    private String description;

    @Schema(description = "参数示例", example = "")
//    @NotBlank(message = "参数示例不能为空")
    private String example;

    @Schema(description = "参数文件", example = "")
    private String paramFile;

    @Schema(description = "参数单值", example = "")
    private String singleContent;

    @Schema(description = "参数多列值", example = "")
    private String multipleContent;

    @Schema(description = "备注", example = "")
    private String remark;

    @Schema(description = "是否可变", example = "")
    @NotNull(message = "是否可变不能为空")
    private Boolean changeFlag;


}
