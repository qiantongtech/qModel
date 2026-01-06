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

package tech.qiantong.qmodel.auth.controller;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.auth.domain.AuthClient;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.page.TableDataInfo;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
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
