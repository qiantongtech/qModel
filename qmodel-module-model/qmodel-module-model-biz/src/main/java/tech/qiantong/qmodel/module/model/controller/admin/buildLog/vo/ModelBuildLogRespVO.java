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
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;

/**
 * 构建日志 Response VO 对象 model_build_log
 *
 * @author qModel
 * @date 2026-07-14
 */
@Schema(description = "构建日志 Response VO")
@Data
public class ModelBuildLogRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "模型文件id")
    @Schema(description = "模型文件id", example = "")
    private Long resourceId;

    @Excel(name = "模型id")
    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Excel(name = "模型名称")
    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Excel(name = "版本id")
    @Schema(description = "版本id", example = "")
    private Long versionId;

    @Excel(name = "构建类型")
    @Schema(description = "构建类型", example = "")
    private String buildType;

    @Excel(name = "构建状态")
    @Schema(description = "构建状态", example = "")
    private String status;

    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "开始时间", example = "")
    private Date startTime;

    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "结束时间", example = "")
    private Date endTime;

    @Excel(name = "执行耗时")
    @Schema(description = "执行耗时", example = "")
    private Long duration;

    @Excel(name = "已存在的依赖包列表JSON")
    @Schema(description = "已存在的依赖包列表JSON", example = "")
    private String installedPackages;

    @Excel(name = "缺失失败的依赖包列表JSON")
    @Schema(description = "缺失失败的依赖包列表JSON", example = "")
    private String missingPackages;

    @Excel(name = "安装失败的依赖包列表JSON")
    @Schema(description = "安装失败的依赖包列表JSON", example = "")
    private String failedPackages;

    @Excel(name = "dockerFile内容")
    @Schema(description = "dockerFile内容", example = "")
    private String dockerfileContent;

    @Excel(name = "构建日志")
    @Schema(description = "构建日志", example = "")
    private String buildLog;

    @Excel(name = "错误日志")
    @Schema(description = "错误日志", example = "")
    private String errorMessage;

    @Excel(name = "requirements.txt 内容")
    @Schema(description = "requirements.txt 内容", example = "")
    private String requirements;

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

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

    @Schema(description = "模型编码", example = "")
    private String code;

    @Schema(description = "模型版本号", example = "")
    private String version;

}
