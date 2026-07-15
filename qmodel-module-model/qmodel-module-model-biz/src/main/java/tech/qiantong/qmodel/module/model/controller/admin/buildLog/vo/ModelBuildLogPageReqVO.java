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
