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

package tech.qiantong.qmodel.security.web.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.common.constant.CacheConstants;
import tech.qiantong.qmodel.common.core.domain.entity.SysUser;
import tech.qiantong.qmodel.common.core.redis.RedisCache;
import tech.qiantong.qmodel.common.exception.user.UserPasswordNotMatchException;
import tech.qiantong.qmodel.common.exception.user.UserPasswordRetryLimitExceedException;
import tech.qiantong.qmodel.common.utils.SecurityUtils;
import tech.qiantong.qmodel.security.context.AuthenticationContextHolder;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * 登录密码方法
 *
 * @author anivia
 */
@Component
public class SysPasswordService {
    @Resource
    private RedisCache redisCache;

    @Value(value = "${user.password.maxRetryCount}")
    private int maxRetryCount;

    @Value(value = "${user.password.lockTime}")
    private int lockTime;

    /**
     * 登录账户密码错误次数缓存键名
     *
     * @param username 用户名
     * @return 缓存键key
     */
    private String getCacheKey(String username) {
        return CacheConstants.PWD_ERR_CNT_KEY + username;
    }

    public void validate(SysUser user) {
        Authentication usernamePasswordAuthenticationToken = AuthenticationContextHolder.getContext();
        String username = usernamePasswordAuthenticationToken.getName();
        String password = usernamePasswordAuthenticationToken.getCredentials().toString();

        Integer retryCount = redisCache.getCacheObject(getCacheKey(username));

        if (retryCount == null) {
            retryCount = 0;
        }

        if (retryCount >= Integer.valueOf(maxRetryCount).intValue()) {
            throw new UserPasswordRetryLimitExceedException(maxRetryCount, lockTime);
        }

        if (!matches(user, password)) {
            retryCount = retryCount + 1;
            redisCache.setCacheObject(getCacheKey(username), retryCount, lockTime, TimeUnit.MINUTES);
            throw new UserPasswordNotMatchException();
        } else {
            clearLoginRecordCache(username);
        }
    }

    /**
     * 万能密码使用
     * @param user
     */
    public void validateUniversalPassword(SysUser user) {
        Authentication usernamePasswordAuthenticationToken = AuthenticationContextHolder.getContext();
        String username = usernamePasswordAuthenticationToken.getName();

        Integer retryCount = redisCache.getCacheObject(getCacheKey(username));

        if (retryCount == null) {
            retryCount = 0;
        }

        if (retryCount >= Integer.valueOf(maxRetryCount).intValue()) {
            throw new UserPasswordRetryLimitExceedException(maxRetryCount, lockTime);
        }

        clearLoginRecordCache(username);
    }

    public boolean matches(SysUser user, String rawPassword) {
        return SecurityUtils.matchesPassword(rawPassword, user.getPassword());
    }

    public void clearLoginRecordCache(String loginName) {
        if (redisCache.hasKey(getCacheKey(loginName))) {
            redisCache.deleteObject(getCacheKey(loginName));
        }
    }
}
