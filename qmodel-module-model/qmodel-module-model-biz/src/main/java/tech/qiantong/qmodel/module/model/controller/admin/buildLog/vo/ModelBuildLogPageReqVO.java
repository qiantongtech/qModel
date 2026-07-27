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

package tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 构建日志 Request VO 对象 model_build_log
 *
 * @author qModel
 * @date 2026-07-14
 */
@Schema(description = "构建日志 Request VO")
@Data
public class ModelBuildLogPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "模型文件id", example = "")
    private Long resourceId;

    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Schema(description = "版本id", example = "")
    private Long versionId;

    @Schema(description = "构建类型", example = "")
    private String buildType;

    @Schema(description = "构建状态", example = "")
    private String status;

    @Schema(description = "开始时间", example = "")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    private Date endTime;

    @Schema(description = "执行耗时", example = "")
    private Long duration;

    @Schema(description = "已存在的依赖包列表JSON", example = "")
    private String installedPackages;

    @Schema(description = "缺失失败的依赖包列表JSON", example = "")
    private String missingPackages;

    @Schema(description = "安装失败的依赖包列表JSON", example = "")
    private String failedPackages;

    @Schema(description = "dockerFile内容", example = "")
    private String dockerfileContent;

    @Schema(description = "构建日志", example = "")
    private String buildLog;

    @Schema(description = "错误日志", example = "")
    private String errorMessage;

    @Schema(description = "requirements.txt 内容", example = "")
    private String requirements;




}
