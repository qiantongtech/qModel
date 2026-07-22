/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.api.config.dto;

import lombok.*;

/**
 * 模型配置详情 DTO 对象 model_config
 *
 * @author anivia
 * @date 2026-07-07
 */
@Data
public class ModelConfigReqDTO {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 企业ID */
    private Long companyId;

    /** 关联模型ID */
    private Long modelId;

    /** 业务接口地址 */
    private String apiUrl;

    /** 请求方式 */
    private String requestMethod;

    /** 请求内容类型例 */
    private String contentType;

    /** 超时时间单位秒 */
    private Long timeoutSeconds;

    /** 鉴权类型 */
    private String authType;

    /** 鉴权方式（bearer / apiKey） */
    private String authMethod;

    /** 注入位置 */
    private String authInjectPosition;

    /** 鉴权键名例 */
    private String authKeyName;

    /** Token前缀 */
    private String authTokenPrefix;

    /** 固定Token值或APIKey */
    private String authTokenValue;

    /** 获取Token方式 */
    private String authDynamicMethod;

    /** 获取Token的URL地址 */
    private String authDynamicUrl;

    /** 获取Token时的请求头 */
    private String authDynamicHeaders;

    /** 获取Token的请求体 */
    private String authDynamicBody;

    /** Token提取路径 */
    private String authExtractPath;

    /** 入参JSONSchema定义 */
    private String inputSchema;

    /** 出参JSONSchema定义 */
    private String outputSchema;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    private Boolean delFlag;


}
