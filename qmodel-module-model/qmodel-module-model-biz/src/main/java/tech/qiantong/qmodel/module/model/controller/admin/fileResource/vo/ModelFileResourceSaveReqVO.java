/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
 */

package tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型文件部署 创建/修改 Request VO model_file_resource
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型文件部署 Response VO")
@Data
public class ModelFileResourceSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Excel(name = "模型id")
    @Schema(description = "模型id", example = "")
    @NotNull(message = "模型id不能为空")
    private Long modelId;

    @Schema(description = "原始上传文件名", example = "")
    @NotBlank(message = "原始上传文件名不能为空")
    @Size(max = 32, message = "原始上传文件名长度不能超过32个字符")
    private String fileName;

    @Schema(description = "脚本名称(入口文件)", example = "")
    @Size(max = 32, message = "脚本名称(入口文件)长度不能超过32个字符")
    private String scriptName;

    @Schema(description = "文件存储地址", example = "")
    @NotBlank(message = "文件存储地址不能为空")
    @Size(max = 256, message = "文件存储地址长度不能超过256个字符")
    private String filePath;

    @Schema(description = "依赖文件路径", example = "")
    @Size(max = 256, message = "依赖文件路径长度不能超过256个字符")
    private String depsFilePath;

    @Schema(description = "模型版本号", example = "")
    private Long modelVersion;

    @Schema(description = "资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)", example = "")
    @NotBlank(message = "资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)不能为空")
    private String resourceType;

    @Schema(description = "文件大小MB", example = "")
    private Long fileSize;

    @Schema(description = "运行日志文件路径", example = "")
    @Size(max = 256, message = "运行日志文件路径长度不能超过256个字符")
    private String logFilePath;

    @Schema(description = "请求超时秒数", example = "")
    private Long execTimeout;

    @Schema(description = "自动生成dockerFile文件地址", example = "")
    @Size(max = 256, message = "自动生成dockerFile文件地址长度不能超过256个字符")
    private String dockerFilePath;

    @Schema(description = "构建镜像标签", example = "")
    @Size(max = 256, message = "构建镜像标签长度不能超过256个字符")
    private String imageTag;

    @Schema(description = "镜像版本", example = "")
    @Size(max = 32, message = "镜像版本长度不能超过32个字符")
    private String imageVersion;

    @Schema(description = "镜像构建状态", example = "")
    private String imageBuildStatus;

    @Schema(description = "镜像构建时间", example = "")
    private Long imageBuildTime;

    @Schema(description = "镜像构建日志文件地址", example = "")
    @Size(max = 256, message = "镜像构建日志文件地址长度不能超过256个字符")
    private String imageBuildLog;

    @Schema(description = "容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb", example = "")
    @Size(max = 3072, message = "容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb长度不能超过3072个字符")
    private String resourceLimit;

    @Schema(description = "容器自定义环境变量，JSON数组格式", example = "")
    @Size(max = 3072, message = "容器自定义环境变量，JSON数组格式长度不能超过3072个字符")
    private String containerEnv;

    @Schema(description = "容器额外挂载目录配置，JSON数组格式", example = "")
    @Size(max = 3072, message = "容器额外挂载目录配置，JSON数组格式长度不能超过3072个字符")
    private String containerMounts;

    @Schema(description = "容器暴露端口", example = "")
    private Long containerPorts;

    @Schema(description = "宿主机端口", example = "")
    private Long mappedHostPort;

    @Schema(description = "容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)", example = "")
    private String containerStatus;

    @Schema(description = "容器id", example = "")
    @Size(max = 128, message = "容器id长度不能超过128个字符")
    private String containerId;

    @Schema(description = "入参JSONSchema定义", example = "")
    @Size(max = 8192, message = "入参JSONSchema定义长度不能超过8192个字符")
    private String inputSchema;

    @Schema(description = "出参JSONSchema定义", example = "")
    @Size(max = 8192, message = "出参JSONSchema定义长度不能超过8192个字符")
    private String outputSchema;

    @Schema(description = "备注", example = "")
    @Size(max = 512, message = "备注长度不能超过512个字符")
    private String remark;


}
