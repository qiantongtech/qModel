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

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 应用管理对象 auth_client
 *
 * @author qModel
 * @date 2024-08-31
 */
@Data
@TableName(value = "auth_client")
public class AuthClient extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** 应用ID */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 应用秘钥 */
    @Excel(name = "应用秘钥")
    private String secretKey;

    /** 应用名称 */
    @Excel(name = "应用名称")
    private String name;

    /** 应用类型;0：Web，1：App，2：小程序 */
    @Excel(name = "应用类型;0：Web，1：App，2：小程序")
    private Integer type;

    /** 应用图标 */
    @Excel(name = "应用图标")
    private String icon;

    /** 应用首页 */
    @Excel(name = "应用首页")
    private String homeUrl;

    /** 同步地址 */
    @Excel(name = "同步地址")
    private String syncUrl;

    /** 允许授权的url */
    @Excel(name = "允许授权的url")
    private String redirectUrl;

    /** 是否公开 */
    @Excel(name = "是否公开")
    private Integer publicFlag;

    /** 是否有效;0：无效，1：有效 */
    @Excel(name = "是否有效;0：无效，1：有效")
    private Integer validFlag;

    /** 删除标志;1：已删除，0：未删除 */
    @TableLogic
    private Integer delFlag;
    /** 创建人id;创建者的sys_user_id */
    @Excel(name = "创建人id;创建者的sys_user_id")
    private Long creatorId;

    /** 更新人id;更新者的sys_user_id */
    @Excel(name = "更新人id;更新者的sys_user_id")
    private Long updatorId;


}
