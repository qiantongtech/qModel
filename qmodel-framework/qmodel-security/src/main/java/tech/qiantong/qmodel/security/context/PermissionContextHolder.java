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

package tech.qiantong.qmodel.security.context;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import tech.qiantong.qmodel.common.core.text.Convert;

/**
 * 权限信息
 *
 * @author anivia
 */
public class PermissionContextHolder
{
    private static final String PERMISSION_CONTEXT_ATTRIBUTES = "PERMISSION_CONTEXT";

    public static void setContext(String permission)
    {
        RequestContextHolder.currentRequestAttributes().setAttribute(PERMISSION_CONTEXT_ATTRIBUTES, permission,
                RequestAttributes.SCOPE_REQUEST);
    }

    public static String getContext()
    {
        return Convert.toStr(RequestContextHolder.currentRequestAttributes().getAttribute(PERMISSION_CONTEXT_ATTRIBUTES,
                RequestAttributes.SCOPE_REQUEST));
    }
}
