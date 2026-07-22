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

package tech.qiantong.qmodel.module.model.api.fileResource.dto;

import lombok.*;

/**
 * 模型文件部署 DTO 对象 model_file_resource
 *
 * @author anivia
 * @date 2026-07-07
 */
@Data
public class ModelFileResourceRespDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 模型id */
    private Long modelId;

    /** 原始上传文件名 */
    private String fileName;

    /** 脚本名称(入口文件) */
    private String scriptName;

    /** 文件存储地址 */
    private String filePath;

    /** 依赖文件路径 */
    private String depsFilePath;

    /** 模型版本号 */
    private Long modelVersion;

    /** 资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py) */
    private String resourceType;

    /** 文件大小MB */
    private Long fileSize;

    /** 运行日志文件路径 */
    private String logFilePath;

    /** 请求超时秒数 */
    private Long execTimeout;

    /** 自动生成dockerFile文件地址 */
    private String dockerFilePath;

    /** 构建镜像标签 */
    private String imageTag;

    /** 镜像版本 */
    private String imageVersion;

    /** 镜像构建状态（0 = 未构建、1 = 构建中、2 = 构建成功、3 = 构建失败） */
    private String imageBuildStatus;

    /** 镜像构建时间 */
    private Long imageBuildTime;

    /** 镜像构建日志文件地址 */
    private String imageBuildLog;

    /** 容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb */
    private String resourceLimit;

    /** 容器自定义环境变量，JSON数组格式 */
    private String containerEnv;

    /** 容器额外挂载目录配置，JSON数组格式 */
    private String containerMounts;

    /** 容器暴露端口 */
    private Long containerPorts;

    /** 宿主机端口 */
    private Long mappedHostPort;

    /** 容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁) */
    private String containerStatus;

    /** 容器id */
    private String containerId;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    private Boolean delFlag;


}
