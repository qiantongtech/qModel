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

package tech.qiantong.qmodel.module.model.controller.admin.config.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型配置详情 Request VO 对象 model_config
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型配置详情 Request VO")
@Data
public class ModelConfigPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "企业ID", example = "")
    private Long companyId;

    @Schema(description = "关联模型ID", example = "")
    private Long modelId;

    @Schema(description = "业务接口地址", example = "")
    private String apiUrl;

    @Schema(description = "请求方式", example = "")
    private String requestMethod;

    @Schema(description = "请求内容类型例", example = "")
    private String contentType;

    @Schema(description = "超时时间单位秒", example = "")
    private Long timeoutSeconds;

    @Schema(description = "鉴权类型", example = "")
    private String authType;

    @Schema(description = "鉴权方式（bearer / apiKey）", example = "bearer")
    private String authMethod;

    @Schema(description = "注入位置", example = "")
    private String authInjectPosition;

    @Schema(description = "鉴权键名例", example = "")
    private String authKeyName;

    @Schema(description = "Token前缀", example = "")
    private String authTokenPrefix;

    @Schema(description = "固定Token值或APIKey", example = "")
    private String authTokenValue;

    @Schema(description = "获取Token方式", example = "")
    private String authDynamicMethod;

    @Schema(description = "获取Token的URL地址", example = "")
    private String authDynamicUrl;

    @Schema(description = "获取Token时的请求头", example = "")
    private String authDynamicHeaders;

    @Schema(description = "获取Token的请求体", example = "")
    private String authDynamicBody;

    @Schema(description = "Token提取路径", example = "")
    private String authExtractPath;

    @Schema(description = "入参JSONSchema定义", example = "")
    private String inputSchema;

    @Schema(description = "出参JSONSchema定义", example = "")
    private String outputSchema;




}
