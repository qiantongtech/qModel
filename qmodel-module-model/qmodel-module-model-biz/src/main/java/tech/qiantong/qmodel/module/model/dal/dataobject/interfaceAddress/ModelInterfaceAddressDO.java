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

package tech.qiantong.qmodel.module.model.dal.dataobject.interfaceAddress;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 接口地址 DO 对象 MODEL_INTERFACE_ADDRESS
 *
 * @author qModel
 * @date 2026-01-09
 */
@Data
@TableName(value = "model_interface_address")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("MODEL_INTERFACE_ADDRESS_seq")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ModelInterfaceAddressDO extends BaseEntity {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 模型id */
    private Long modelId;

    /** 接口地址 */
    private String interfaceAddress;

    /** 模型版本id */
    private Long versionId;

    /** 请求方式 */
    private Integer requestMethod;

    /** 输入参数 */
    private String inputParameter;

    /** 输出参数 */
    private String outputParameter;

    /** 删除标志 */
    @TableLogic
    private Boolean delFlag;

    /** 输入参数说明 */
    private String inputParameterIllustrate;

    /** 输出参数说明 */
    private String outputParameterIllustrate;

    /** 模型名称 */
    @TableField(exist = false)
    private String modelName;

    /** 模型版本 */
    @TableField(exist = false)
    private String version;

    /** 描述 */
    @TableField(exist = false)
    private String description;

}
