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

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * 模型数据API接入 Response VO 对象 model_data_api
 *
 * @author qModel
 * @date 2026-08-19
 */
@Schema(description = "模型数据API接入 Response VO")
@Data
public class ModelDataApiRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "API数据名称")
    @Schema(description = "API数据名称", example = "")
    private String name;

    @Excel(name = "关联模型ID")
    @Schema(description = "关联模型ID", example = "")
    private Long modelId;

    @Excel(name = "API类型：Chat Completion、Text Generation等")
    @Schema(description = "API类型：Chat Completion、Text Generation等", example = "")
    private String apiType;

    @Excel(name = "接口地址")
    @Schema(description = "接口地址", example = "")
    private String apiUrl;

    @Excel(name = "请求方式：GET、POST、PUT、DELETE")
    @Schema(description = "请求方式：GET、POST、PUT、DELETE", example = "")
    private String requestMethod;

    @Excel(name = "请求内容类型")
    @Schema(description = "请求内容类型", example = "")
    private String contentType;

    @Excel(name = "超时时间(秒)")
    @Schema(description = "超时时间(秒)", example = "")
    private Long timeoutSeconds;

    @Excel(name = "鉴权类型：none、key(固定)、token(动态)")
    @Schema(description = "鉴权类型：none、key(固定)、token(动态)", example = "")
    private String authType;

    @Excel(name = "鉴权方式：apiKey、bearer")
    @Schema(description = "鉴权方式：apiKey、bearer", example = "")
    private String authMethod;

    @Excel(name = "注入位置：header、query")
    @Schema(description = "注入位置：header、query", example = "")
    private String authInjectPos;

    @Excel(name = "鉴权键名")
    @Schema(description = "鉴权键名", example = "")
    private String authKeyName;

    @Excel(name = "Token前缀")
    @Schema(description = "Token前缀", example = "")
    private String authTokenPrefix;

    @Excel(name = "固定Token值/APIKey")
    @Schema(description = "固定Token值/APIKey", example = "")
    private String authTokenValue;

    @Excel(name = "动态获取Token方式")
    @Schema(description = "动态获取Token方式", example = "")
    private String authDynMethod;

    @Excel(name = "动态获取Token地址")
    @Schema(description = "动态获取Token地址", example = "")
    private String authDynUrl;

    @Excel(name = "动态获取Token请求头(JSON)")
    @Schema(description = "动态获取Token请求头(JSON)", example = "")
    private String authDynHeaders;

    @Excel(name = "动态获取TokenQuery参数(JSON)")
    @Schema(description = "动态获取TokenQuery参数(JSON)", example = "")
    private String authDynParams;

    @Excel(name = "动态获取Token请求体(JSON)")
    @Schema(description = "动态获取Token请求体(JSON)", example = "")
    private String authDynBody;

    @Excel(name = "Token提取路径(JSONPath)")
    @Schema(description = "Token提取路径(JSONPath)", example = "")
    private String authExtractPath;

    @Excel(name = "请求参数模板")
    @Schema(description = "请求参数模板", example = "")
    private String requestTemplate;

    @Excel(name = "批量请求参数")
    @Schema(description = "批量请求参数", example = "")
    private String batchParams;

    @Excel(name = "入参JSONSchema定义")
    @Schema(description = "入参JSONSchema定义", example = "")
    private String inputSchema;

    @Excel(name = "出参JSONSchema定义")
    @Schema(description = "出参JSONSchema定义", example = "")
    private String outputSchema;

    @Excel(name = "描述")
    @Schema(description = "描述", example = "")
    private String description;

    @Excel(name = "是否有效")
    @Schema(description = "是否有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志")
    @Schema(description = "删除标志", example = "")
    private Boolean delFlag;

    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;

    @Excel(name = "创建人ID")
    @Schema(description = "创建人ID", example = "")
    private Long creatorId;

    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;

    @Excel(name = "更新人ID")
    @Schema(description = "更新人ID", example = "")
    private Long updaterId;

    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

}
