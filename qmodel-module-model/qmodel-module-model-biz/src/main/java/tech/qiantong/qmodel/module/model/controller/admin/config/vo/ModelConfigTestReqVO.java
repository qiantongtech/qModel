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

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 模型配置测试调用 Request VO
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型配置测试调用 Request VO")
@Data
public class ModelConfigTestReqVO {

    @Schema(description = "业务接口地址", requiredMode = Schema.RequiredMode.REQUIRED, example = "https://api.example.com/chat")
    @NotBlank(message = "业务接口地址不能为空")
    private String apiUrl;

    @Schema(description = "请求方式", requiredMode = Schema.RequiredMode.REQUIRED, example = "POST")
    @NotBlank(message = "请求方式不能为空")
    private String requestMethod;

    @Schema(description = "请求内容类型", example = "application/json")
    private String contentType;

    @Schema(description = "超时时间单位秒", example = "30")
    private Long timeoutSeconds;

    @Schema(description = "鉴权类型", requiredMode = Schema.RequiredMode.REQUIRED, example = "NONE")
    @NotBlank(message = "鉴权类型不能为空")
    private String authType;

    @Schema(description = "鉴权方式（bearer / apiKey）", example = "bearer")
    private String authMethod;

    @Schema(description = "注入位置", example = "Header")
    private String authInjectPosition;

    @Schema(description = "鉴权键名例", example = "Authorization")
    private String authKeyName;

    @Schema(description = "Token前缀", example = "Bearer ")
    private String authTokenPrefix;

    @Schema(description = "固定Token值或APIKey", example = "sk-xxxxxx")
    private String authTokenValue;

    @Schema(description = "获取Token方式", example = "POST")
    private String authDynamicMethod;

    @Schema(description = "获取Token的URL地址", example = "https://auth.example.com/token")
    private String authDynamicUrl;

    @Schema(description = "获取Token时的请求头", example = "{\"Content-Type\": \"application/json\"}")
    private String authDynamicHeaders;

    @Schema(description = "获取Token时的Query参数", example = "{\"grant_type\": \"password\", \"username\": \"xxx\"}")
    private String authDynamicParams;

    @Schema(description = "获取Token的请求体", example = "{\"appKey\": \"xxx\", \"appSecret\": \"yyy\"}")
    private String authDynamicBody;

    @Schema(description = "Token提取路径", example = "data.access_token")
    private String authExtractPath;

    @Schema(description = "测试请求体", example = "{\"name\": \"测试\"}")
    private String testBody;

    @TableField(exist = false)
    private Long modelId;

    @TableField(exist = false)
    private String modelName;

}
