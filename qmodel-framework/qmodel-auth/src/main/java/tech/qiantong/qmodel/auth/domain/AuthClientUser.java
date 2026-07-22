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

package tech.qiantong.qmodel.auth.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 应用和用户关联对象 auth_client_user
 *
 * @author qModel
 * @date 2024-08-31
 */
@Data
@TableName(value = "auth_client_user")
public class AuthClientUser extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** 应用ID */
    @Excel(name = "应用ID")
    @TableId(type = IdType.AUTO)
    private Long clientId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** open_id */
    @Excel(name = "open_id")
    private String openId;


}
