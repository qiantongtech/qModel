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

package tech.qiantong.qmodel.module.model.dal.dataobject.config;

import lombok.*;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型配置详情 DO 对象 model_config
 *
 * @author anivia
 * @date 2026-07-07
 */
@Data
@TableName(value = "model_config")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("model_config_seq")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ModelConfigDO extends BaseEntity {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId(type = IdType.AUTO)
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

    /** 获取Token时的Query参数 */
    private String authDynamicParams;

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
    @TableLogic
    private Boolean delFlag;


}
