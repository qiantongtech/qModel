






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

package tech.qiantong.qmodel.auth.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.auth.domain.AuthClientUser;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.page.TableDataInfo;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 * 应用和用户关联Controller
 *
 * @author qModel
 * @date 2024-08-31
 */
@RestController
@RequestMapping("/auth/user")
public class AuthClientUserController extends BaseController {
    @Resource
    private IService<AuthClientUser> authClientUserService;

/**
 * 查询应用和用户关联列表
 */
@PreAuthorize("@ss.hasPermi('auth:user:list')")
@GetMapping("/list")
    public TableDataInfo list(AuthClientUser authClientUser) {
        startPage();
        QueryWrapper<AuthClientUser> queryWrapper = new QueryWrapper<>(authClientUser);
        List<AuthClientUser> list = authClientUserService.list(queryWrapper);
        return getDataTable(list);
    }

    /**
     * 导出应用和用户关联列表
     */
    @PreAuthorize("@ss.hasPermi('auth:user:export')")
    @Log(title = "应用和用户关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AuthClientUser authClientUser) {
        QueryWrapper<AuthClientUser> queryWrapper = new QueryWrapper<>(authClientUser);
        List<AuthClientUser> list = authClientUserService.list(queryWrapper);
        ExcelUtil<AuthClientUser> util = new ExcelUtil<>(AuthClientUser.class);
        util.exportExcel(response, list, "应用和用户关联数据");
    }

    /**
     * 获取应用和用户关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('auth:user:query')")
    @GetMapping(value = "/{clientId}")
    public AjaxResult getInfo(@PathVariable("clientId") Long clientId) {
        return success(authClientUserService.getById(clientId));
    }

    /**
     * 新增应用和用户关联
     */
    @PreAuthorize("@ss.hasPermi('auth:user:add')")
    @Log(title = "应用和用户关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AuthClientUser authClientUser) {
        return toAjax(authClientUserService.save(authClientUser));
    }

    /**
     * 修改应用和用户关联
     */
    @PreAuthorize("@ss.hasPermi('auth:user:edit')")
    @Log(title = "应用和用户关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AuthClientUser authClientUser) {
        return toAjax(authClientUserService.updateById(authClientUser));
    }

    /**
     * 删除应用和用户关联
     */
    @PreAuthorize("@ss.hasPermi('auth:user:remove')")
    @Log(title = "应用和用户关联", businessType = BusinessType.DELETE)
    @DeleteMapping("/{clientIds}")
    public AjaxResult remove(@PathVariable Long[] clientIds) {
        return toAjax(authClientUserService.removeByIds(Arrays.asList(clientIds)));
    }
}
