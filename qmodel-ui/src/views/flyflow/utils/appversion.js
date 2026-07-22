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

//判断是否是飞书
export function isFeishu(){
	const userAgentStr = navigator.userAgent
	return  (userAgentStr.indexOf("Lark") >= 0);

};
//是否是企微
export function isWxCp() {
	const userAgentStr = navigator.userAgent

	return userAgentStr.indexOf('wxwork')>=0;
}

//判断是钉钉
export function isDD() {
	let userAgent = navigator.userAgent;
	return userAgent.indexOf('DingTalk')>=0;
}
//判断是否是手机端
export function isMobile() {
	const ua = navigator.userAgent.toLowerCase();
	return /mobile|android|iphone|ipod|phone|ipad/i.test(ua);
}
