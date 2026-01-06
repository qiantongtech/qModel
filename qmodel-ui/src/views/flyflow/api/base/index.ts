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
 * 获取首页数据
 */
export function getIndexData() {
	return request({
		url: '/base/index',
		method: 'get'
	});
}

/**
 * 同步数据
 */
export function loadRemoteData() {
	return request({
		url: '/base/loadRemoteData',
		method: 'post'
	});
}


/**
 * 获取用户签署合同默认的签章url
 */
export function getUserSignContractUrl(taskId) {
	return request({
		url: '/base/getUserSignContractUrl',
		method: 'get',
		params:{taskId:taskId}
	});
}


/**
 * 节点格式化数据显示
 */
export function formatStartNodeShow(d) {
	return request({
		url: '/base/formatStartNodeShow',
		method: 'post',
		data:d
	});
}


/**
 * 查询头部显示数据
 */
export function queryHeaderShow(d) {
	return request({
		url: '/base/queryHeaderShow',
		method: 'post',
		data:d
	});
}



/**
 * 查询操作数据
 */
export function queryTaskOperData(d) {
	return request({
		url: '/base/queryTaskOperData',
		method: 'get',
		params:{taskId:d}
	});
}


/**
 * 查询流程打印数据
 */
export function queryPrintData(d) {
	return request({
		url: '/base/queryPrintData',
		method: 'get',
		params:{processInstanceId:d}
	});
}




/**
 * 修改前端版本号
 */
export function setWebVersion(d) {
	return request({
		url: '/base/setWebVersion',
		method: 'post',
		data:{versionNo:d}
	});
}



/**
 * 获取前端版本号
 */
export function getWebVersion() {
	return request({
		url: '/base/getWebVersion',
		method: 'get'
	});
}


