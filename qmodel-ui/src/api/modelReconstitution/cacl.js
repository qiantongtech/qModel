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

// 查询模型计算管理 列表
export function listCacl(query) {
  return request({
    url: '/model/cacl/list',
    method: 'get',
    params: query
  })
}

// 查询模型计算管理 详细
export function getCacl(id) {
  return request({
    url: '/model/cacl/' + id,
    method: 'get'
  })
}

// 新增模型计算管理
export function addCacl(data) {
  return request({
    url: '/model/cacl',
    method: 'post',
    data: data
  })
}

// 修改模型计算管理
export function updateCacl(data) {
  return request({
    url: '/model/cacl',
    method: 'put',
    data: data
  })
}

// 删除模型计算管理
export function delCacl(id) {
  return request({
    url: '/model/cacl/' + id,
    method: 'delete'
  })
}

// 开始计算模型计算管理
export function startCacl(id) {
  return request({
    url: '/model/cacl/calculate?modelCaclId=' + id,
    method: 'get',
  })
}

// 获取输入参数  模型计算管理
export function findModelInputById(id) {
  return request({
    url: '/model/cacl/findModelInputById?modelCaclId=' + id,
    method: 'get'
  })
}

// 获取输出结果  模型计算管理
export function findModelOutputById(id) {
  return request({
    url: '/model/cacl/findModelOutputById?modelCaclId=' + id,
    method: 'get'
  })
}
