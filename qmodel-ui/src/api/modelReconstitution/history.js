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

// 查询操作历史列表
export function historyList(query) {
  return request({
    url: '/model/history/list/',
    method: 'get',
    params: query
  })
}

// 查询操作历史列表
export function listHistory(query) {
  return request({
    url: '/model/history/modelList/',
    method: 'get',
    params: query
  })
}

// 查询操作历史详细
export function getHistory(id) {
  return request({
    url: '/model/history/' + id,
    method: 'get'
  })
}

// 新增操作历史
export function addHistory(data) {
  return request({
    url: '/model/history',
    method: 'post',
    data: data
  })
}

// 修改操作历史
export function updateHistory(data) {
  return request({
    url: '/model/history',
    method: 'put',
    data: data
  })
}

// 删除操作历史
export function delHistory(id) {
  return request({
    url: '/model/history/' + id,
    method: 'delete'
  })
}
