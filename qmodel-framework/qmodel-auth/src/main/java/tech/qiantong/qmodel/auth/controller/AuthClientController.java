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

package tech.qiantong.qmodel.auth.controller;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.auth.domain.AuthClient;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.page.TableDataInfo;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 应用管理Controller
 *
 * @author qModel
 * @date 2024-08-31
 */
@RestController
@RequestMapping("/auth/client")
public class AuthClientController extends BaseController {
    @Resource
    private IService<AuthClient> authClientService;

/**
 * 查询应用管理列表
 */
@PreAuthorize("@ss.hasPermi('auth:client:list')")
@GetMapping("/list")
    public TableDataInfo list(AuthClient authClient) {
        startPage();
        QueryWrapper<AuthClient> queryWrapper = new QueryWrapper<>(authClient);
        List<AuthClient> list = authClientService.list(queryWrapper);
        return getDataTable(list);
    }

    /**
     * 导出应用管理列表
     */
    @PreAuthorize("@ss.hasPermi('auth:client:export')")
    @Log(title = "应用管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AuthClient authClient) {
        QueryWrapper<AuthClient> queryWrapper = new QueryWrapper<>(authClient);
        List<AuthClient> list = authClientService.list(queryWrapper);
        ExcelUtil<AuthClient> util = new ExcelUtil<>(AuthClient.class);
        util.exportExcel(response, list, "应用管理数据");
    }

    /**
     * 获取应用管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('auth:client:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(authClientService.getById(id));
    }

    /**
     * 新增应用管理
     */
    @PreAuthorize("@ss.hasPermi('auth:client:add')")
    @Log(title = "应用管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AuthClient authClient) {
        authClient.setCreatorId(getUserId());
        authClient.setCreateBy(getNickName());
        authClient.setSecretKey(IdUtil.simpleUUID());
        return toAjax(authClientService.save(authClient));
    }

    /**
     * 修改应用管理
     */
    @PreAuthorize("@ss.hasPermi('auth:client:edit')")
    @Log(title = "应用管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AuthClient authClient) {
        authClient.setUpdatorId(getUserId());
        authClient.setUpdateBy(getNickName());
        authClient.setUpdateTime(new Date());
        return toAjax(authClientService.updateById(authClient));
    }

    /**
     * 删除应用管理
     */
    @PreAuthorize("@ss.hasPermi('auth:client:remove')")
    @Log(title = "应用管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(authClientService.removeByIds(Arrays.asList(ids)));
    }
}
