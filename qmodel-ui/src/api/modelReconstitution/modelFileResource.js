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

// 查询模型文件部署列表
export function listModelFileResource(query) {
  return request({
    url: '/model/modelFileResource/list',
    method: 'get',
    params: query
  })
}

// 查询模型文件部署详细
export function getModelFileResource(id) {
  return request({
    url: '/model/modelFileResource/' + id,
    method: 'get'
  })
}

// 新增模型文件部署
export function addModelFileResource(data) {
  return request({
    url: '/model/modelFileResource',
    method: 'post',
    data: data
  })
}

// 修改模型文件部署
export function updateModelFileResource(data) {
  return request({
    url: '/model/modelFileResource',
    method: 'put',
    data: data
  })
}

// 删除模型文件部署
export function delModelFileResource(id) {
  return request({
    url: '/model/modelFileResource/' + id,
    method: 'delete'
  })
}
