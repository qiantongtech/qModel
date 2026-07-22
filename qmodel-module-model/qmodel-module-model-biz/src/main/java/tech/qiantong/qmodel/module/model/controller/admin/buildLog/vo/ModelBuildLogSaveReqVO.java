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

package tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 构建日志 创建/修改 Request VO model_build_log
 *
 * @author qModel
 * @date 2026-07-14
 */
@Schema(description = "构建日志 Response VO")
@Data
public class ModelBuildLogSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "模型文件id", example = "")
    @NotNull(message = "模型文件id不能为空")
    private Long resourceId;

    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    @NotBlank(message = "模型名称不能为空")
    @Size(max = 128, message = "模型名称长度不能超过128个字符")
    private String modelName;

    @Schema(description = "版本id", example = "")
    private Long versionId;

    @Schema(description = "构建类型", example = "")
    @NotBlank(message = "构建类型不能为空")
    private String buildType;

    @Schema(description = "构建状态", example = "")
    @NotBlank(message = "构建状态不能为空")
    private String status;

    @Schema(description = "开始时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    @Schema(description = "执行耗时", example = "")
    private Long duration;

    @Schema(description = "已存在的依赖包列表JSON", example = "")
    @NotBlank(message = "已存在的依赖包列表JSON不能为空")
    private String installedPackages;

    @Schema(description = "缺失失败的依赖包列表JSON", example = "")
    @NotBlank(message = "缺失失败的依赖包列表JSON不能为空")
    private String missingPackages;

    @Schema(description = "安装失败的依赖包列表JSON", example = "")
    @NotBlank(message = "安装失败的依赖包列表JSON不能为空")
    private String failedPackages;

    @Schema(description = "dockerFile内容", example = "")
    @NotBlank(message = "dockerFile内容不能为空")
    private String dockerfileContent;

    @Schema(description = "构建日志", example = "")
    @NotBlank(message = "构建日志不能为空")
    private String buildLog;

    @Schema(description = "错误日志", example = "")
    @NotBlank(message = "错误日志不能为空")
    private String errorMessage;

    @Schema(description = "requirements.txt 内容", example = "")
    @NotBlank(message = "requirements.txt 内容不能为空")
    private String requirements;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    @Size(max = 512, message = "备注长度不能超过512个字符")
    private String remark;


}
