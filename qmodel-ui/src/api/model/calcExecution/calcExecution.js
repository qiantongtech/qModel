/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

// 查询模型计算执行记录列表
export function listCalcExecution(query) {
  return request({
    url: '/model/calcExecution/list',
    method: 'get',
    params: query
  })
}

// 查询模型计算执行记录详细
export function getCalcExecution(id) {
  return request({
    url: '/model/calcExecution/' + id,
    method: 'get'
  })
}

// 新增模型计算执行记录
export function addCalcExecution(data) {
  return request({
    url: '/model/calcExecution',
    method: 'post',
    data: data
  })
}

// 修改模型计算执行记录
export function updateCalcExecution(data) {
  return request({
    url: '/model/calcExecution',
    method: 'put',
    data: data
  })
}

// 删除模型计算执行记录
export function delCalcExecution(id) {
  return request({
    url: '/model/calcExecution/' + id,
    method: 'delete'
  })
}
