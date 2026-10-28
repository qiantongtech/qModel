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

package tech.qiantong.qmodel.module.model.dal.dataobject.modelData;

import lombok.*;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型数据API接入 DO 对象 model_data_api
 *
 * @author qModel
 * @date 2026-08-19
 */
@Data
@TableName(value = "model_data_api")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("model_data_api_seq")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ModelDataApiDO extends BaseEntity {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** ID */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** API数据名称 */
    private String name;

    /** 关联模型ID */
    private Long modelId;

    /** API类型：Chat Completion、Text Generation等 */
    private String apiType;

    /** 接口地址 */
    private String apiUrl;

    /** 请求方式：GET、POST、PUT、DELETE */
    private String requestMethod;

    /** 请求内容类型 */
    private String contentType;

    /** 超时时间(秒) */
    private Long timeoutSeconds;

    /** 鉴权类型：none、key(固定)、token(动态) */
    private String authType;

    /** 鉴权方式：apiKey、bearer */
    private String authMethod;

    /** 注入位置：header、query */
    private String authInjectPos;

    /** 鉴权键名 */
    private String authKeyName;

    /** Token前缀 */
    private String authTokenPrefix;

    /** 固定Token值/APIKey */
    private String authTokenValue;

    /** 动态获取Token方式 */
    private String authDynMethod;

    /** 动态获取Token地址 */
    private String authDynUrl;

    /** 动态获取Token请求头(JSON) */
    private String authDynHeaders;

    /** 动态获取TokenQuery参数(JSON) */
    private String authDynParams;

    /** 动态获取Token请求体(JSON) */
    private String authDynBody;

    /** Token提取路径(JSONPath) */
    private String authExtractPath;

    /** 请求参数模板 */
    private String requestTemplate;

    /** 批量请求参数 */
    private String batchParams;

    /** 入参JSONSchema定义 */
    private String inputSchema;

    /** 出参JSONSchema定义 */
    private String outputSchema;

    /** 描述 */
    private String description;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    @TableLogic
    private Boolean delFlag;

    /** 更新人ID */
    private Long updaterId;

    @TableField(exist = false)
    private Long updatorId;

}
