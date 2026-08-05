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

// 查询模型访问 key列表
export function listModelKey(query) {
  return request({
    url: '/model/modelKey/list',
    method: 'get',
    params: query
  })
}

// 新增模型访问 key
export function addModelKey(data) {
  return request({
    url: '/model/modelKey',
    method: 'post',
    data: data
  })
}

// 删除模型访问 key
export function delModelKey(id) {
  return request({
    url: '/model/modelKey/' + id,
    method: 'delete'
  })
}

// 删除模型访问 key
export function getKey(id) {
  return request({
    url: '/model/modelKey/getKey?modelId=' + id,
    method: 'get'
  })
}
