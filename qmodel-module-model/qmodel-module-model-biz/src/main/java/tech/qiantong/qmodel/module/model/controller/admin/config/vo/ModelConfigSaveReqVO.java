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

package tech.qiantong.qmodel.module.model.controller.admin.config.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型配置详情 创建/修改 Request VO model_config
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型配置详情 Response VO")
@Data
public class ModelConfigSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业ID", example = "")
    private Long companyId;

    @Schema(description = "关联模型ID", example = "")
    private Long modelId;

    @Schema(description = "业务接口地址", example = "")
    @NotBlank(message = "业务接口地址不能为空")
    @Size(max = 3072, message = "业务接口地址长度不能超过3072个字符")
    private String apiUrl;

    @Schema(description = "请求方式", example = "")
    @NotBlank(message = "请求方式不能为空")
    @Size(max = 128, message = "请求方式长度不能超过128个字符")
    private String requestMethod;

    @Schema(description = "请求内容类型例", example = "")
    @NotBlank(message = "请求内容类型例不能为空")
    @Size(max = 128, message = "请求内容类型例长度不能超过128个字符")
    private String contentType;

    @Schema(description = "超时时间单位秒", example = "")
    private Long timeoutSeconds;

    @Schema(description = "鉴权类型", example = "")
    @NotBlank(message = "鉴权类型不能为空")
    private String authType;

    @Schema(description = "鉴权方式（bearer / apiKey）", example = "bearer")
    @Size(max = 32, message = "鉴权方式长度不能超过32个字符")
    private String authMethod;

    @Schema(description = "注入位置", example = "")
    @Size(max = 32, message = "注入位置长度不能超过32个字符")
    private String authInjectPosition;

    @Schema(description = "鉴权键名例", example = "")
    @Size(max = 128, message = "鉴权键名例长度不能超过128个字符")
    private String authKeyName;

    @Schema(description = "Token前缀", example = "")
    @Size(max = 128, message = "Token前缀长度不能超过128个字符")
    private String authTokenPrefix;

    @Schema(description = "固定Token值或APIKey", example = "")
    @Size(max = 512, message = "固定Token值或APIKey长度不能超过512个字符")
    private String authTokenValue;

    @Schema(description = "获取Token方式", example = "")
    private String authDynamicMethod;

    @Schema(description = "获取Token的URL地址", example = "")
    @Size(max = 3072, message = "获取Token的URL地址长度不能超过3072个字符")
    private String authDynamicUrl;

    @Schema(description = "获取Token时的请求头", example = "")
    private String authDynamicHeaders;

    @Schema(description = "获取Token时的Query参数", example = "")
    private String authDynamicParams;

    @Schema(description = "获取Token的请求体", example = "")
    private String authDynamicBody;

    @Schema(description = "Token提取路径", example = "")
    @Size(max = 256, message = "Token提取路径长度不能超过256个字符")
    private String authExtractPath;

    @Schema(description = "入参JSONSchema定义", example = "")
    private String inputSchema;

    @Schema(description = "出参JSONSchema定义", example = "")
    private String outputSchema;

    @Schema(description = "备注", example = "")
    @Size(max = 512, message = "备注长度不能超过512个字符")
    private String remark;


}
