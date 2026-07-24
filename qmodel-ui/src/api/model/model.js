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

// 查询模型基础信息列表
export function listModel(query) {
  return request({
    url: '/model/model/list',
    method: 'get',
    params: query
  })
}

// 查询模型基础信息详细
export function getModel(id) {
  return request({
    url: '/model/model/' + id,
    method: 'get'
  })
}

// 新增模型基础信息
export function addModel(data) {
  return request({
    url: '/model/model',
    method: 'post',
    data: data
  })
}

// 修改模型基础信息
export function updateModel(data) {
  return request({
    url: '/model/model',
    method: 'put',
    data: data
  })
}

// 保存模型基础信息及配置详情
export function saveModelWithConfig(data) {
  return request({
    url: '/model/model/saveWithConfig',
    method: 'post',
    data: data
  })
}

// 删除模型基础信息
export function delModel(id) {
  return request({
    url: '/model/model/' + id,
    method: 'delete'
  })
}

// 修改模型状态
export function updateModelStatus(id, status) {
  return request({
    url: '/model/model/' + id + '/status/' + status,
    method: 'put'
  })
}

// 导出模型基础信息
export function exportModel(query) {
  return request({
    url: '/model/model/export',
    method: 'post',
    data: query,
    responseType: 'blob'
  })
}
