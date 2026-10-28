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
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型数据API接入 Request VO 对象 model_data_api
 *
 * @author qModel
 * @date 2026-08-19
 */
@Schema(description = "模型数据API接入 Request VO")
@Data
public class ModelDataApiPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "API数据名称", example = "")
    private String name;

    @Schema(description = "关联模型ID", example = "")
    private Long modelId;

    @Schema(description = "API类型：Chat Completion、Text Generation等", example = "")
    private String apiType;

    @Schema(description = "接口地址", example = "")
    private String apiUrl;

    @Schema(description = "请求方式：GET、POST、PUT、DELETE", example = "")
    private String requestMethod;

    @Schema(description = "请求内容类型", example = "")
    private String contentType;

    @Schema(description = "超时时间(秒)", example = "")
    private Long timeoutSeconds;

    @Schema(description = "鉴权类型：none、key(固定)、token(动态)", example = "")
    private String authType;

    @Schema(description = "鉴权方式：apiKey、bearer", example = "")
    private String authMethod;

    @Schema(description = "注入位置：header、query", example = "")
    private String authInjectPos;

    @Schema(description = "鉴权键名", example = "")
    private String authKeyName;

    @Schema(description = "Token前缀", example = "")
    private String authTokenPrefix;

    @Schema(description = "固定Token值/APIKey", example = "")
    private String authTokenValue;

    @Schema(description = "动态获取Token方式", example = "")
    private String authDynMethod;

    @Schema(description = "动态获取Token地址", example = "")
    private String authDynUrl;

    @Schema(description = "动态获取Token请求头(JSON)", example = "")
    private String authDynHeaders;

    @Schema(description = "动态获取TokenQuery参数(JSON)", example = "")
    private String authDynParams;

    @Schema(description = "动态获取Token请求体(JSON)", example = "")
    private String authDynBody;

    @Schema(description = "Token提取路径(JSONPath)", example = "")
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
    private String description;

    @Schema(description = "更新人ID", example = "")
    private Long updaterId;

}
