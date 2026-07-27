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

export function listCompute(query) {
  return request({
    url: '/model/compute/list',
    method: 'get',
    params: query
  })
}

export function getInboundFlow(data) {
  return request({
    url: 'model/compute/getInboundFlow',
    method: 'post',
    data: data
  })
}

// 查询模型计算管理 详细
export function getCompute(id) {
  return request({
    url: '/model/compute/' + id,
    method: 'get'
  })
}

// 新增模型计算管理
export function addCompute(data) {
  return request({
    url: '/model/compute',
    method: 'post',
    data: data
  })
}

// 修改模型计算管理
export function updateCompute(data) {
  return request({
    url: '/model/compute',
    method: 'put',
    data: data
  })
}

// 删除模型计算管理
export function delCompute(id) {
  return request({
    url: '/model/compute/' + id,
    method: 'delete'
  })
}
