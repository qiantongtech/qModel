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

// 查询模型分类列表
export function listClassify(query) {
  return request({
    url: '/model/classify/list',
    method: 'get',
    params: query
  })
}

// 查询模型分类详细
export function getClassify(id) {
  return request({
    url: '/model/classify/' + id,
    method: 'get'
  })
}

// 新增模型分类
export function addClassify(data) {
  return request({
    url: '/model/classify',
    method: 'post',
    data: data
  })
}

// 修改模型分类
export function updateClassify(data) {
  return request({
    url: '/model/classify',
    method: 'put',
    data: data
  })
}

// 删除模型分类
export function delClassify(id) {
  return request({
    url: '/model/classify/' + id,
    method: 'delete'
  })
}
