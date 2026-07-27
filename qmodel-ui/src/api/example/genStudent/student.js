/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  
 * This file is part of qModel Module Platform (Open Source Edition).
 *  
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

import request from '@/utils/request'

// 查询学生列表
export function listStudent(query) {
  return request({
    url: '/example/student/list',
    method: 'get',
    params: query
  })
}

// 查询学生详细
export function getStudent(id) {
  return request({
    url: '/example/student/' + id,
    method: 'get'
  })
}

// 新增学生
export function addStudent(data) {
  return request({
    url: '/example/student',
    method: 'post',
    data: data
  })
}

// 修改学生
export function updateStudent(data) {
  return request({
    url: '/example/student',
    method: 'put',
    data: data
  })
}

// 删除学生
export function delStudent(id) {
  return request({
    url: '/example/student/' + id,
    method: 'delete'
  })
}
