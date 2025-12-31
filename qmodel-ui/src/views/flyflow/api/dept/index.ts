import request from '../../utils/request';
import { AxiosPromise } from 'axios';
import { DeptForm, DeptQuery, DeptVO } from './types';

/**
 * 部门树形表格
 *
 * @param queryParams
 */
export function listDepts(queryParams?: DeptQuery): AxiosPromise<DeptVO[]> {
  return request({
	  url: '/org/treeAll',
    method: 'get',
    params: queryParams
  });
}


/**
 * 选择成员搜索用户
 */
export function orgTreeSearcheUser(param:Object): AxiosPromise<[]> {
  return request({
    url: '/org/tree/user/search',
    method: 'get',
	  params:param
  });
}

/**
 * 部门下拉列表
 */
export function orgTree(type:String,deptId:Number): AxiosPromise<[]> {
  return request({
    url: '/org/tree',
    method: 'get',
	  params:{type:type,deptId:deptId}
  });
}

/**
 * 获取部门详情
 *
 * @param id
 */
export function getDeptForm(id: number): AxiosPromise<DeptForm> {
  return request({
    url: '/api/v1/dept/' + id + '/form',
    method: 'get'
  });
}

/**
 * 新增部门
 *
 * @param data
 */
export function addDept(data: DeptForm) {
  return request({
    url: '/dept/create',
    method: 'post',
    data: data
  });
}

/**
 *  修改部门
 *
 * @param id
 * @param data
 */
export function updateDept(id: number, data: DeptForm) {
  return request({
    url: 'dept/update',
    method: 'put',
    data: data
  });
}

/**
 * 删除部门
 *
 * @param ids
 */
export function deleteDept(ids: string) {
  return request({
    url: '/dept/delete' ,
    method: 'delete',
	  data:{id:ids}
  });
}
