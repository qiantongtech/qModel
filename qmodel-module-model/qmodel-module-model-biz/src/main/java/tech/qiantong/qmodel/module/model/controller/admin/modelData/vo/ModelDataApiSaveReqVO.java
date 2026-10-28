/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.controller.admin.modelData.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型数据API接入 创建/修改 Request VO model_data_api
 *
 * @author qModel
 * @date 2026-08-19
 */
@Schema(description = "模型数据API接入 Response VO")
@Data
public class ModelDataApiSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "API数据名称", example = "")
    @NotBlank(message = "API数据名称不能为空")
    private String name;

    @Schema(description = "关联模型ID", example = "")
    private Long modelId;

    @Schema(description = "API类型：Chat Completion、Text Generation等", example = "")
    @Size(max = 32, message = "API类型：Chat Completion、Text Generation等长度不能超过32个字符")
    private String apiType;

    @Schema(description = "接口地址", example = "")
    @NotBlank(message = "接口地址不能为空")
    private String apiUrl;

    @Schema(description = "请求方式：GET、POST、PUT、DELETE", example = "")
    @NotBlank(message = "请求方式：GET、POST、PUT、DELETE不能为空")
    private String requestMethod;

    @Schema(description = "请求内容类型", example = "")
    private String contentType;

    @Schema(description = "超时时间(秒)", example = "")
    private Long timeoutSeconds;

    @Schema(description = "鉴权类型：none、key(固定)、token(动态)", example = "")
    @Size(max = 32, message = "鉴权类型：none、key(固定)、token(动态)长度不能超过32个字符")
    private String authType;

    @Schema(description = "鉴权方式：apiKey、bearer", example = "")
    @Size(max = 32, message = "鉴权方式：apiKey、bearer长度不能超过32个字符")
    private String authMethod;

    @Schema(description = "注入位置：header、query", example = "")
    @Size(max = 32, message = "注入位置：header、query长度不能超过32个字符")
    private String authInjectPos;

    @Schema(description = "鉴权键名", example = "")
    @Size(max = 128, message = "鉴权键名长度不能超过128个字符")
    private String authKeyName;

    @Schema(description = "Token前缀", example = "")
    @Size(max = 64, message = "Token前缀长度不能超过64个字符")
    private String authTokenPrefix;

    @Schema(description = "固定Token值/APIKey", example = "")
    @Size(max = 1024, message = "固定Token值/APIKey长度不能超过1024个字符")
    private String authTokenValue;

    @Schema(description = "动态获取Token方式", example = "")
    @Size(max = 16, message = "动态获取Token方式长度不能超过16个字符")
    private String authDynMethod;

    @Schema(description = "动态获取Token地址", example = "")
    @Size(max = 1024, message = "动态获取Token地址长度不能超过1024个字符")
    private String authDynUrl;

    @Schema(description = "动态获取Token请求头(JSON)", example = "")
    private String authDynHeaders;

    @Schema(description = "动态获取TokenQuery参数(JSON)", example = "")
    private String authDynParams;

    @Schema(description = "动态获取Token请求体(JSON)", example = "")
    private String authDynBody;

    @Schema(description = "Token提取路径(JSONPath)", example = "")
    @Size(max = 256, message = "Token提取路径(JSONPath)长度不能超过256个字符")
    private String authExtractPath;

    @Schema(description = "请求参数模板", example = "")
    private String requestTemplate;

    @Schema(description = "批量请求参数", example = "")
    private String batchParams;

    @Schema(description = "入参JSONSchema定义", example = "")
    private String inputSchema;

    @Schema(description = "出参JSONSchema定义", example = "")
    private String outputSchema;

    @Schema(description = "描述", example = "")
    @Size(max = 1024, message = "描述长度不能超过1024个字符")
    private String description;

    @Schema(description = "更新人ID", example = "")
    private Long updaterId;

    @Schema(description = "备注", example = "")
    @Size(max = 512, message = "备注长度不能超过512个字符")
    private String remark;

}
