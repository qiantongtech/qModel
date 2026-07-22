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

package tech.qiantong.qmodel.module.model.dal.dataobject.version;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 版本管理 DO 对象 MODEL_VERSION
 *
 * @author qModel
 * @date 2026-01-09
 */
@Data
@TableName(value = "model_version")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("MODEL_VERSION_seq")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ModelVersionDO extends BaseEntity {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 所属模型id */
    private Long modelId;

    /** 所属模型名称 */
    private String modelName;

    /** 模型版本号 */
    private String version;

    /** 文件地址 */
    private String fileAddress;

    /** 接口地址 */
    private String interfaceAddress;

    /** 版本状态 */
    private Integer status;

    /** 描述 */
    private String description;

    /** 是否有效 0：无效，1：有效 */
    private Boolean validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    @TableLogic
    private Boolean delFlag;

    /** 文件的名称 */
    private String fileName;

    /** 可执行文件地址 */
    private String runnableFileAddress;


}
