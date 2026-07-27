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
