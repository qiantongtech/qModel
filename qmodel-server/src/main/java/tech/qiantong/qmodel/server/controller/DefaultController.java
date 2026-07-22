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

package tech.qiantong.qmodel.server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;


/**
 * 默认 Controller，解决部分 module 未开启时的 404 提示。
 * 例如说，/bpm/** 路径，工作流
 *
 * @author anivia
 */
@RestController
public class DefaultController {

    @RequestMapping({"/dev-api/example/**", "/prod-api/example/**", "/example/**"})
    public AjaxResult example404() {
        return AjaxResult.error("[示例模块 anivia-module-example - 已禁用]");
    }

}
