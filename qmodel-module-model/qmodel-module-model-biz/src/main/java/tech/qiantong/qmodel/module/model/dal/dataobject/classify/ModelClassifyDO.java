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

package tech.qiantong.qmodel.module.model.dal.dataobject.classify;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型分类 DO 对象 MODEL_CLASSIFY
 *
 * @author qModel
 * @date 2026-01-07
 */
@Data
@TableName(value = "model_classify")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("MODEL_CLASSIFY_seq")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ModelClassifyDO extends BaseEntity {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 父级id */
    private Long parentId;

    /** 祖籍列表 */
    private String ancestors;

    /** 分类名称 */
    private String name;

    /** 分类描述 */
    private String description;

    /** 显示顺序 */
    private Integer orderNum;

    /** 是否有效 0：无效，1：有效 */
    private Boolean validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    @TableLogic
    private Boolean delFlag;


}
