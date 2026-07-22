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

import request from '../../utils/request';


/**
 * 获取未读数量
 */
export function getMessageUnreadNum(p) {
	return request({
		url: '/message/unreadNum',
		method: 'get',
		params:p
	});
}

/**
 * 查询消息列表
 */
export function queryMessageList(p) {
	return request({
		url: '/message/queryList',
		method: 'post',
		data:p
	});
}
/**
 * 删除消息
 */
export function deleteMsg(id) {
	return request({
		url: '/message/delete',
		method: 'delete',
		data:{id:id}
	});
}

/**
 * 消息已读
 */
export function readMsg(id) {
	return request({
		url: '/message/read',
		method: 'post',
		data:{id:id}
	});
}

/**
 * 全部已读
 */
export function readAllMsg() {
	return request({
		url: '/message/readAll',
		method: 'post'
	});
}

