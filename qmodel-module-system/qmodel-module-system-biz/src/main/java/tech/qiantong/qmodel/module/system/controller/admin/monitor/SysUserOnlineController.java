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

package tech.qiantong.qmodel.module.system.controller.admin.monitor;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.constant.CacheConstants;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.domain.model.LoginUser;
import tech.qiantong.qmodel.common.core.page.TableDataInfo;
import tech.qiantong.qmodel.common.core.redis.RedisCache;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.module.system.domain.SysUserOnline;
import tech.qiantong.qmodel.module.system.service.ISysUserOnlineService;

/**
 * 在线用户监控
 *
 * @author anivia
 */
@RestController
@RequestMapping("/monitor/online")
public class SysUserOnlineController extends BaseController
{
    @Resource
    private ISysUserOnlineService userOnlineService;

    @Resource
    private RedisCache redisCache;

    @PreAuthorize("@ss.hasPermi('monitor:online:list')")
    @GetMapping("/list")
    public TableDataInfo list(String ipaddr, String userName)
    {
        Collection<String> keys = redisCache.keys(CacheConstants.LOGIN_TOKEN_KEY + "*");
        List<SysUserOnline> userOnlineList = new ArrayList<SysUserOnline>();
        for (String key : keys)
        {
            LoginUser user = redisCache.getCacheObject(key);
            if (StringUtils.isNotEmpty(ipaddr) && StringUtils.isNotEmpty(userName))
            {
                userOnlineList.add(userOnlineService.selectOnlineByInfo(ipaddr, userName, user));
            }
            else if (StringUtils.isNotEmpty(ipaddr))
            {
                userOnlineList.add(userOnlineService.selectOnlineByIpaddr(ipaddr, user));
            }
            else if (StringUtils.isNotEmpty(userName) && StringUtils.isNotNull(user.getUser()))
            {
                userOnlineList.add(userOnlineService.selectOnlineByUserName(userName, user));
            }
            else
            {
                userOnlineList.add(userOnlineService.loginUserToUserOnline(user));
            }
        }
        Collections.reverse(userOnlineList);
        userOnlineList.removeAll(Collections.singleton(null));
        return getDataTable(userOnlineList);
    }

    /**
     * 强退用户
     */
    @PreAuthorize("@ss.hasPermi('monitor:online:forceLogout')")
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @DeleteMapping("/{tokenId}")
    public AjaxResult forceLogout(@PathVariable String tokenId)
    {
        redisCache.deleteObject(CacheConstants.LOGIN_TOKEN_KEY + tokenId);
        return success();
    }
}
