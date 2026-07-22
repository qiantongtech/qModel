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

import request from '@/utils/request'

// 查询示例部门列表
export function listDept(query) {
  return request({
    url: '/example/dept/list',
    method: 'get',
    params: query
  })
}

// 查询示例部门详细
export function getDept(id) {
  return request({
    url: '/example/dept/' + id,
    method: 'get'
  })
}

// 新增示例部门
export function addDept(data) {
  return request({
    url: '/example/dept',
    method: 'post',
    data: data
  })
}

// 修改示例部门
export function updateDept(data) {
  return request({
    url: '/example/dept',
    method: 'put',
    data: data
  })
}

// 删除示例部门
export function delDept(id) {
  return request({
    url: '/example/dept/' + id,
    method: 'delete'
  })
}
