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

// 查询模型配置详情列表
export function listModelConfig(query) {
  return request({
    url: '/model/config/list',
    method: 'get',
    params: query
  })
}

// 查询模型配置详情
export function getModelConfig(id) {
  return request({
    url: '/model/config/' + id,
    method: 'get'
  })
}

// 根据模型ID查询模型配置详情
export function getModelConfigByModelId(modelId) {
  return request({
    url: '/model/config/list',
    method: 'get',
    params: { modelId }
  })
}

// 新增模型配置详情
export function addModelConfig(data) {
  return request({
    url: '/model/config',
    method: 'post',
    data: data
  })
}

// 测试模型配置接口调用
export function testModelConfig(data) {
  return request({
    url: '/model/config/test',
    method: 'post',
    data: data
  })
}

// 修改模型配置详情
export function updateModelConfig(data) {
  return request({
    url: '/model/config',
    method: 'put',
    data: data
  })
}

// 删除模型配置详情
export function delModelConfig(id) {
  return request({
    url: '/model/config/' + id,
    method: 'delete'
  })
}
