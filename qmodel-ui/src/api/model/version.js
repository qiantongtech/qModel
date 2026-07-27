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

// 查询版本管理列表
export function listVersion(query) {
  return request({
    url: '/model/version/list',
    method: 'get',
    params: query
  })
}

// 查询版本管理详细
export function getVersion(id) {
  return request({
    url: '/model/version/' + id,
    method: 'get'
  })
}

// 查询一个模型全部版本记录
export function getMVList(modelId) {
  return request({
    url: '/model/version/mVList/' + modelId,
    method: 'get'
  })
}

// 展示一个模型全部版本记录
export function getVersionList(query) {
  return request({
    url: '/model/version/versionList/',
    method: 'get',
    params: query
  })
}

// 新增版本管理
export function addVersion(data) {
  return request({
    url: '/model/version',
    method: 'post',
    data: data
  })
}

// 修改版本管理
export function updateVersion(data) {
  return request({
    url: '/model/version',
    method: 'put',
    data: data
  })
}

// 删除版本管理
export function delVersion(id) {
  return request({
    url: '/model/version/' + id,
    method: 'delete'
  })
}
