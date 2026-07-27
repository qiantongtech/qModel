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

package tech.qiantong.qmodel.module.system.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
    /**
     * 用户id 不能为空
     */
    private String id;
    /**
     * 直属领导id
     */
    private String parentId;

    /**
     * 用户姓名 不能为空
     */
    private String name;
    /**
     * 用户头像 不能为空
     */
    private String avatarUrl;
    /**
     * 用户所属部门id 可以为空
     */
    private List<String> deptIdList;
    /**
     * 用户状态 0禁用 1启用
     */
    private Integer status;
    private String token;

    /**
     * 手机号
     */
    private String phone;
    /**
     * 部门名称
     */
    private String deptName;


}
