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

package tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * 模型文件部署 Response VO 对象 model_file_resource
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型文件部署 Response VO")
@Data
public class ModelFileResourceRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "模型id")
    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Excel(name = "原始上传文件名")
    @Schema(description = "原始上传文件名", example = "")
    private String fileName;

    @Excel(name = "脚本名称(入口文件)")
    @Schema(description = "脚本名称(入口文件)", example = "")
    private String scriptName;

    @Excel(name = "文件存储地址")
    @Schema(description = "文件存储地址", example = "")
    private String filePath;

    @Excel(name = "依赖文件路径")
    @Schema(description = "依赖文件路径", example = "")
    private String depsFilePath;

    @Excel(name = "模型版本号")
    @Schema(description = "模型版本号", example = "")
    private Long modelVersion;

    @Excel(name = "资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)")
    @Schema(description = "资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)", example = "")
    private String resourceType;

    @Excel(name = "文件大小MB")
    @Schema(description = "文件大小MB", example = "")
    private Long fileSize;

    @Excel(name = "运行日志文件路径")
    @Schema(description = "运行日志文件路径", example = "")
    private String logFilePath;

    @Excel(name = "请求超时秒数")
    @Schema(description = "请求超时秒数", example = "")
    private Long execTimeout;

    @Excel(name = "自动生成dockerFile文件地址")
    @Schema(description = "自动生成dockerFile文件地址", example = "")
    private String dockerFilePath;

    @Excel(name = "构建镜像标签")
    @Schema(description = "构建镜像标签", example = "")
    private String imageTag;

    @Excel(name = "镜像版本")
    @Schema(description = "镜像版本", example = "")
    private String imageVersion;

    @Excel(name = "镜像构建状态", readConverterExp = "0=,==,未=构建、1,==,构=建中、2,==,构=建成功、3,==,构=建失败")
    @Schema(description = "镜像构建状态", example = "")
    private String imageBuildStatus;

    @Excel(name = "镜像构建时间")
    @Schema(description = "镜像构建时间", example = "")
    private Long imageBuildTime;

    @Excel(name = "镜像构建日志文件地址")
    @Schema(description = "镜像构建日志文件地址", example = "")
    private String imageBuildLog;

    @Excel(name = "容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb")
    @Schema(description = "容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb", example = "")
    private String resourceLimit;

    @Excel(name = "容器自定义环境变量，JSON数组格式")
    @Schema(description = "容器自定义环境变量，JSON数组格式", example = "")
    private String containerEnv;

    @Excel(name = "容器额外挂载目录配置，JSON数组格式")
    @Schema(description = "容器额外挂载目录配置，JSON数组格式", example = "")
    private String containerMounts;

    @Excel(name = "容器暴露端口")
    @Schema(description = "容器暴露端口", example = "")
    private Long containerPorts;

    @Excel(name = "宿主机端口")
    @Schema(description = "宿主机端口", example = "")
    private Long mappedHostPort;

    @Excel(name = "容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)")
    @Schema(description = "容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)", example = "")
    private String containerStatus;

    @Excel(name = "容器id")
    @Schema(description = "容器id", example = "")
    private String containerId;

    @Excel(name = "入参JSONSchema定义")
    @Schema(description = "入参JSONSchema定义", example = "")
    private String inputSchema;

    @Excel(name = "出参JSONSchema定义")
    @Schema(description = "出参JSONSchema定义", example = "")
    private String outputSchema;

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

}
