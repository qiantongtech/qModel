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

package tech.qiantong.qmodel.module.model.api.fileResource.dto;

import lombok.*;

/**
 * 模型文件部署 DTO 对象 model_file_resource
 *
 * @author anivia
 * @date 2026-07-07
 */
@Data
public class ModelFileResourceReqDTO {

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
