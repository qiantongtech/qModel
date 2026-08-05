/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

import request from '../../utils/request';
import { AxiosPromise } from 'axios';
import { CaptchaResult, LoginData, LoginResult } from './types';

/**
 * 登录API
 *
 * @param data {LoginData}
 * @returns
 */
export function loginApi(data: LoginData): AxiosPromise<LoginResult> {
  return request({
    url: '/login/login',
    method: 'post',
    data: data
  });
}

export function loginByTokenApi(token: string): AxiosPromise<LoginResult> {
  return request({
    url: '/login/loginByToken?token='+token,
    method: 'get'
  });
}
//钉钉登录
export function loginAtDingTalkApi(token: string): AxiosPromise<LoginResult> {
	return request({
		url: '/login/loginAtDingTalk?authCode='+token,
		method: 'get'
	});
}

/**
 * 注销API
 */
export function logoutApi() {
  return request({
    url: '/login/logout',
    method: 'post'
  });
}

