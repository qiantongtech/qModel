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
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型文件部署 Request VO 对象 model_file_resource
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型文件部署 Request VO")
@Data
public class ModelFileResourcePageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;

    @Schema(description = "原始上传文件名", example = "")
    private String fileName;

    @Schema(description = "脚本名称(入口文件)", example = "")
    private String scriptName;

    @Schema(description = "文件存储地址", example = "")
    private String filePath;

    @Schema(description = "依赖文件路径", example = "")
    private String depsFilePath;

    @Schema(description = "模型版本号", example = "")
    private Long modelVersion;

    @Schema(description = "资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)", example = "")
    private String resourceType;

    @Schema(description = "文件大小MB", example = "")
    private Long fileSize;

    @Schema(description = "运行日志文件路径", example = "")
    private String logFilePath;

    @Schema(description = "请求超时秒数", example = "")
    private Long execTimeout;

    @Schema(description = "自动生成dockerFile文件地址", example = "")
    private String dockerFilePath;

    @Schema(description = "构建镜像标签", example = "")
    private String imageTag;

    @Schema(description = "镜像版本", example = "")
    private String imageVersion;

    @Schema(description = "镜像构建状态", example = "")
    private String imageBuildStatus;

    @Schema(description = "镜像构建时间", example = "")
    private Long imageBuildTime;

    @Schema(description = "镜像构建日志文件地址", example = "")
    private String imageBuildLog;

    @Schema(description = "容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb", example = "")
    private String resourceLimit;

    @Schema(description = "容器自定义环境变量，JSON数组格式", example = "")
    private String containerEnv;

    @Schema(description = "容器额外挂载目录配置，JSON数组格式", example = "")
    private String containerMounts;

    @Schema(description = "容器暴露端口", example = "")
    private Long containerPorts;

    @Schema(description = "宿主机端口", example = "")
    private Long mappedHostPort;

    @Schema(description = "容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)", example = "")
    private String containerStatus;

    @Schema(description = "容器id", example = "")
    private String containerId;




}
