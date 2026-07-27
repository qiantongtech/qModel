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

package tech.qiantong.qmodel.module.model.controller.admin.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型基础信息 创建/修改 Request VO model
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型基础信息 Response VO")
@Data
public class ModelSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业ID", example = "")
    private Long companyId;

    @Schema(description = "分类id", example = "")
    private Long classifyId;

    @Schema(description = "名称", example = "")
    @NotBlank(message = "名称不能为空")
    private String name;

    @Schema(description = "编码", example = "")
    @NotBlank(message = "编码不能为空")
    private String code;

    @Schema(description = "接入方式", example = "")
    @NotBlank(message = "接入方式不能为空")
    private String accessType;

    @Schema(description = "版本号", example = "")
    @NotBlank(message = "版本号不能为空")
    private String version;

    @Schema(description = "作者", example = "")
    private String author;

    @Schema(description = "状态", example = "")
    private String status;

    @Schema(description = "标签", example = "")
    private String tags;

    @Schema(description = "图标", example = "")
    @Size(max = 256, message = "图标路径长度不能超过256个字符")
    private String icon;

    @Schema(description = "描述", example = "")
    private String description;

    @Schema(description = "备注", example = "")
    private String remark;

    @Schema(description = "文件存储路径(PYTHON类型专用)", example = "")
    @Size(max = 256, message = "文件存储路径长度不能超过256个字符")
    private String filePath;

    @Schema(description = "原始上传文件名(PYTHON类型专用)", example = "")
    @Size(max = 32, message = "原始上传文件名长度不能超过32个字符")
    private String fileName;

    @Schema(description = "文件大小MB(PYTHON类型专用)", example = "")
    private Long fileSize;

    @Schema(description = "脚本名称(入口文件)(PYTHON类型专用)", example = "")
    @Size(max = 32, message = "脚本名称长度不能超过32个字符")
    private String scriptName;

    @Schema(description = "资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)(PYTHON类型专用)", example = "")
    private String resourceType;

    @Schema(description = "模型版本号(PYTHON类型专用)", example = "")
    private Long modelVersion;

    @Schema(description = "输入参数Schema(PYTHON类型专用)", example = "")
    @Size(max = 3072, message = "输入参数Schema长度不能超过3072个字符")
    private String inputSchema;

    @Schema(description = "输出参数Schema(PYTHON类型专用)", example = "")
    @Size(max = 3072, message = "输出参数Schema长度不能超过3072个字符")
    private String outputSchema;

    @Schema(description = "文件资源ID(编辑模式下使用)", example = "")
    private Long fileResourceId;

}
