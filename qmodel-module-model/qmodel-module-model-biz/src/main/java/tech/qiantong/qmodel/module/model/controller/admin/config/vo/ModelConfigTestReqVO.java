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

}
