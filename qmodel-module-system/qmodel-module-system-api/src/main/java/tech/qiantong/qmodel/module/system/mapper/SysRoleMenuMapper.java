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

package tech.qiantong.qmodel.module.system.mapper;

import tech.qiantong.qmodel.module.system.domain.SysRoleMenu;

import java.util.List;

/**
 * 角色与菜单关联表 数据层
 *
 * @author anivia
 */
public interface SysRoleMenuMapper
{
    /**
     * 查询菜单使用数量
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    public int checkMenuExistRole(Long menuId);

    /**
     * 通过角色ID删除角色和菜单关联
     *
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteRoleMenuByRoleId(Long roleId);

    /**
     * 批量删除角色菜单关联信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRoleMenu(Long[] ids);

    /**
     * 批量新增角色菜单信息
     *
     * @param roleMenuList 角色菜单列表
     * @return 结果
     */
    public int batchRoleMenu(List<SysRoleMenu> roleMenuList);
}
