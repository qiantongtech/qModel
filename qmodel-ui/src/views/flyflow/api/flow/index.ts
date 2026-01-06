/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
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
