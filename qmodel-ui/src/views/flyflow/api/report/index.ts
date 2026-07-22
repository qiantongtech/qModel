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

//  流程数据列表
export function queryFlowDataList(param:any) {
	return request({
		url: '/report/queryDataList',
		method: 'post',
		data: param
	})
}

//  导出流程数据列表
export function exportDataList(param:any) {
	return request({
		url: '/report/exportDataList',
		method: 'post',
		data: param
	})
}

//  查询请求头
export function queryHeaderList(param:any) {
	return request({
		url: '/report/queryHeaderList',
		method: 'get',
		params: {flowId:param}
	})
}

//  查询请求条件
export function queryConditionList(param:any) {
	return request({
		url: '/report/queryConditionList',
		method: 'get',
		params: {flowId:param}
	})
}
