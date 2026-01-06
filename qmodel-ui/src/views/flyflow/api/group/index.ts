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
import { AxiosPromise } from 'axios';
import {Group, GroupVO} from './types';


/**
 * 添加分组
 *
 * @param data
 */
export function addGroup(data: Group) {
  return request({
    url: '/processGroup/create',
    method: 'post',
    data: data
  });
}
/**
 * 修改分组
 *
 * @param data
 */
export function editGroup(data: Group) {
  return request({
    url: '/processGroup/edit',
    method: 'post',
    data: data
  });
}
/**
 * 下移排序
 *
 * @param data
 */
export function bottomSort(data: Group) {
  return request({
    url: '/processGroup/bottomSort',
    method: 'post',
    data: data
  });
}
/**
 * 上移排序
 *
 * @param data
 */
export function topSort(data: Group) {
  return request({
    url: '/processGroup/topSort',
    method: 'post',
    data: data
  });
}
/**
 * 删除分组
 *
 * @param data
 */
export function delGroup(id: number) {
  return request({
    url: '/processGroup/delete/'+id,
    method: 'delete'

  });
}

/**
 * 查询分组列表
 */

export function queryGroupList():AxiosPromise<GroupVO[]> {
	return request({
		url: '/processGroup/list',
		method: 'get'
	});
}

/**
 * 查询分组和流程列表
 */

export function queryGroupFlowList(hidden?:Boolean):AxiosPromise<GroupVO[]> {
	return request({
		url: '/combination/group/listGroupWithProcess',
		method: 'get',
		params:{hidden:hidden}
	});
}


/**
 * 删除主流程
 */

export function deleteProcessMain(uniqueId?:string):AxiosPromise<GroupVO[]> {
	return request({
		url: '/combination/group/deleteProcessMain/'+uniqueId,
		method: 'delete'
	});
}

/**
 * 清理流程
 */

export function clearProcess(uniqueId?:string):AxiosPromise<GroupVO[]> {
	return request({
		url: '/combination/group/clear/'+uniqueId,
		method: 'delete'
	});
}


/**
 * 查询分组和流程主表列表
 */

export function queryGroupMainFlowList():AxiosPromise<GroupVO[]> {
	return request({
		url: '/combination/group/listGroupWithProcessMain',
		method: 'get'
	});
}
/**
 * 搜索流程
 */

export function searchFlowList(word):AxiosPromise<GroupVO[]> {
	return request({
		url: '/combination/group/searchFlowList',
		method: 'get',
		params:{word:word}
	});
}

/**
 * 查询我可发起的组和流程
 */

export function queryMineStartGroupFlowList(hidden?:Boolean):AxiosPromise<GroupVO[]> {
	return request({
		url: '/combination/group/listCurrentUserStartGroup',
		method: 'get',
		params:{hidden:hidden}
	});
}
