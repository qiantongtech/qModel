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
