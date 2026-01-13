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

package tech.qiantong.qmodel.module.system.controller.admin.system;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import tech.qiantong.qmodel.common.constant.Constants;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.domain.entity.SysMenu;
import tech.qiantong.qmodel.common.core.domain.entity.SysUser;
import tech.qiantong.qmodel.common.core.domain.model.LoginBody;
import tech.qiantong.qmodel.common.utils.SecurityUtils;
import tech.qiantong.qmodel.module.system.service.ISysUserService;
import tech.qiantong.qmodel.security.web.service.SysLoginService;
import tech.qiantong.qmodel.security.web.service.SysPermissionService;
import tech.qiantong.qmodel.module.system.service.ISysMenuService;

/**
 * 登录验证
 *
 * @author anivia
 */
@RestController
public class SysLoginController {
    @Resource
    private SysLoginService loginService;

    @Resource
    private ISysMenuService menuService;

    @Resource
    private SysPermissionService permissionService;

    @Resource
    private ISysUserService userService;

    @Resource
    private SpringUtil springUtil;

    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) throws Exception {
        AjaxResult ajax = AjaxResult.success();
        //需求: 如果是这个密码, 可以登录任何用户的账号
//        if ("gfh78h23789#$gfdy845".equals(loginBody.getPassword())) {
//            SysUser sysUser = userService.selectUserByUserName(loginBody.getNickName());
//            loginBody.setPassword(sysUser.getPassword());
//        }
        // 生成令牌
        Map map = loginService.login(loginBody.getNickName(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, MapUtil.getStr(map, "token"));

        // 用户id
        String userId = MapUtil.getStr(map, "userId");

        // 通知 flow 登录成功
        String flowEnable = SpringUtil.getProperty("flow.enable");
        if ("true".equals(flowEnable)) {
            String flowBizUrl = SpringUtil.getProperty("flow.url");
            String url = StrUtil.format("{}login/auto" , flowBizUrl);

            String post = HttpUtil.post(url, JSON.toJSONString(map));

            JSONObject jsonObject = JSON.parseObject(post);
            Boolean ok = jsonObject.getBoolean("ok");
            if (ok) {
                return ajax;
            } else {
                return AjaxResult.error("登录失败");
            }
        }
        return ajax;
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo() {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user" , user);
        ajax.put("roles" , roles);
        ajax.put("permissions" , permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters() {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
