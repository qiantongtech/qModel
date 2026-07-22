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
 * 创建流程
 *
 * @param data
 */
export function addFlow(data: any) {
	return request({
		url: '/process/create',
		method: 'post',
		data: data
	});
}

/**
 * 获取流程详细信息
 *
 * @param data
 */
export function getFlowDetail(flowId: string) {
	return request({
		url: '/process/getDetail?flowId=' + flowId,
		method: 'get'
	});
}

/**
 * 停用流程
 *
 * @param data
 */
export function disableFlow(flowId: string) {
	return request({
		url: '/process/update/' + flowId + "?type=stop",
		method: 'put'
	});
}

/**
 * 根据流程唯一标识查询流程列表
 *
 * @param uniqueId
 */
export function getListByUniqueId(uniqueId: string) {
	return request({
		url: '/process/getListByUniqueId/' + uniqueId ,
		method: 'get'
	});
}
/**
 * 设置主流程
 *
 * @param flowId
 */
export function setMainProcess(flowId: string) {
	return request({
		url: '/process/setMainProcess/' + flowId ,
		method: 'post'
	});
}

/**
 * 删除流程
 *
 * @param data
 */
export function deleteFlow(flowId: string) {
	return request({
		url: '/process/update/' + flowId + "?type=delete",
		method: 'put'
	});
}

/**
 * 启用流程
 *
 * @param data
 */
export function enableFlow(flowId: string) {
	return request({
		url: '/process/update/' + flowId + "?type=using",
		method: 'put'
	});
}

/**
 * 发起流程
 *
 * @param data
 */
export function startFlow(obj: any) {
	return request({
		url: '/process-instance/startProcessInstance',
		method: 'post',
		data: obj
	});
}
