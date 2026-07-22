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

/**
 * 登录请求参数
 */
export interface LoginData {
  /**
   * 用户名
   */
  username?: string;
  /**
   * 密码
   */
  password?: string;

  /**
   * 验证码缓存key
   */
  verifyCodeKey?: string;

  /**
   * 验证码
   */
  verifyCode?: string;
}

/**
 * 登录响应
 */
export interface LoginResult {
  /**
   * 访问token
   */
  tokenValue?: string;

}

/**
 * 验证码响应
 */
export interface CaptchaResult {
  /**
   * 验证码缓存key
   */
  verifyCodeKey: string;
  /**
   * 验证码图片Base64字符串
   */
  verifyCodeBase64: string;
}

