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

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * 模型配置详情 Response VO 对象 model_config
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型配置详情 Response VO")
@Data
public class ModelConfigRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "企业ID")
    @Schema(description = "企业ID", example = "")
    private Long companyId;

    @Excel(name = "关联模型ID")
    @Schema(description = "关联模型ID", example = "")
    private Long modelId;

    @Excel(name = "业务接口地址")
    @Schema(description = "业务接口地址", example = "")
    private String apiUrl;

    @Excel(name = "请求方式")
    @Schema(description = "请求方式", example = "")
    private String requestMethod;

    @Excel(name = "请求内容类型例")
    @Schema(description = "请求内容类型例", example = "")
    private String contentType;

    @Excel(name = "超时时间单位秒")
    @Schema(description = "超时时间单位秒", example = "")
    private Long timeoutSeconds;

    @Excel(name = "鉴权类型")
    @Schema(description = "鉴权类型", example = "")
    private String authType;

    @Excel(name = "鉴权方式")
    @Schema(description = "鉴权方式（bearer / apiKey）", example = "bearer")
    private String authMethod;

    @Excel(name = "注入位置")
    @Schema(description = "注入位置", example = "")
    private String authInjectPosition;

    @Excel(name = "鉴权键名例")
    @Schema(description = "鉴权键名例", example = "")
    private String authKeyName;

    @Excel(name = "Token前缀")
    @Schema(description = "Token前缀", example = "")
    private String authTokenPrefix;

    @Excel(name = "固定Token值或APIKey")
    @Schema(description = "固定Token值或APIKey", example = "")
    private String authTokenValue;

    @Excel(name = "获取Token方式")
    @Schema(description = "获取Token方式", example = "")
    private String authDynamicMethod;

    @Excel(name = "获取Token的URL地址")
    @Schema(description = "获取Token的URL地址", example = "")
    private String authDynamicUrl;

    @Excel(name = "获取Token时的请求头")
    @Schema(description = "获取Token时的请求头", example = "")
    private String authDynamicHeaders;

    @Excel(name = "获取Token时的Query参数")
    @Schema(description = "获取Token时的Query参数", example = "")
    private String authDynamicParams;

    @Excel(name = "获取Token的请求体")
    @Schema(description = "获取Token的请求体", example = "")
    private String authDynamicBody;

    @Excel(name = "Token提取路径")
    @Schema(description = "Token提取路径", example = "")
    private String authExtractPath;

    @Excel(name = "入参JSONSchema定义")
    @Schema(description = "入参JSONSchema定义", example = "")
    private String inputSchema;

    @Excel(name = "出参JSONSchema定义")
    @Schema(description = "出参JSONSchema定义", example = "")
    private String outputSchema;

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
    private Long updatorId;

    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

}
