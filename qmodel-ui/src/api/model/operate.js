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

// 查询模型历史管理 列表
export function listOperate(query) {
  return request({
    url: '/model/operate/list',
    method: 'get',
    params: query
  })
}

// 查询模型历史管理 详细
export function getOperate(id) {
  return request({
    url: '/model/operate/' + id,
    method: 'get'
  })
}

// 新增模型历史管理 
export function addOperate(data) {
  return request({
    url: '/model/operate',
    method: 'post',
    data: data
  })
}

// 修改模型历史管理 
export function updateOperate(data) {
  return request({
    url: '/model/operate',
    method: 'put',
    data: data
  })
}

// 删除模型历史管理 
export function delOperate(id) {
  return request({
    url: '/model/operate/' + id,
    method: 'delete'
  })
}
