import request from '../../utils/request';

import { AxiosPromise } from 'axios';
import { UserForm, UserInfo, UserPageVO, UserQuery } from './types';

/**
 * 登录成功后获取用户信息（昵称、头像、权限集合和角色集合）
 */
export function getUserInfo(): AxiosPromise<UserInfo> {
  return request({
    url: '/user/getCurrentUserDetail',
    method: 'get'
  });
}

/**
 * 获取用户分页列表
 *
 * @param queryParams
 */
export function getUserPage(
  queryParams: UserQuery
): AxiosPromise<PageResult<UserPageVO[]>> {
  return request({
    url: '/user/queryList',
    method: 'post',
    data: queryParams
  });
}


/**
 * 添加用户
 *
 * @param data
 */
export function addUser(data: any) {
  return request({
    url: '/user/create',
    method: 'post',
    data: data
  });
}

/**
 * 修改用户
 *
 * @param id
 * @param data
 */
export function updateUser(id: number, data: UserForm) {
  return request({
    url: '/user/edit',
    method: 'put',
    data: data
  });
}

/**
 * 修改用户状态
 *
 * @param id
 * @param status
 */
export function updateUserStatus(id: number, status: number) {
  return request({
    url: 'user/status',
    method: 'post',
    data: { status: status ,id:id}
  });
}

/**
 * 修改用户密码
 *
 * @param id
 * @param password
 */
export function updateUserPassword(id: number, password: string) {
  return request({
    url: '/user/password',
    method: 'post',
    data: { password: password,id:id }
  });
}

/**
 * 删除用户
 *
 * @param ids
 */
export function deleteUsers(ids: number) {
  return request({
    url: 'user/delete',
    method: 'delete',
	  data:{id:ids}
  });
}

/**
 * 下载用户导入模板
 *
 * @returns
 */
export function downloadTemplateApi() {
  return request({
    url: '/api/v1/users/template',
    method: 'get',
    responseType: 'arraybuffer'
  });
}

/**
 * 导出用户
 *
 * @param queryParams
 * @returns
 */
export function exportUser(queryParams: UserQuery) {
  return request({
    url: '/api/v1/users/_export',
    method: 'get',
    params: queryParams,
    responseType: 'arraybuffer'
  });
}

/**
 * 导入用户
 *
 * @param file
 */
export function importUser(deptId: number, file: File) {
  const formData = new FormData();
  formData.append('file', file);
  return request({
    url: '/api/v1/users/_import',
    method: 'post',
    params: { deptId: deptId },
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}
