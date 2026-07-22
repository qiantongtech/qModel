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

// 查询 模型输出管理列表
export function listOutput(query) {
  return request({
    url: '/model/output/list',
    method: 'get',
    params: query
  })
}

// 查询 模型输出管理详细
export function getOutput(id) {
  return request({
    url: '/model/output/' + id,
    method: 'get'
  })
}

// 新增 模型输出管理
export function addOutput(data) {
  return request({
    url: '/model/output',
    method: 'post',
    data: data
  })
}

// 修改 模型输出管理
export function updateOutput(data) {
  return request({
    url: '/model/output',
    method: 'put',
    data: data
  })
}

// 删除 模型输出管理
export function delOutput(id) {
  return request({
    url: '/model/output/' + id,
    method: 'delete'
  })
}

export function findAllModel(data) {
  return request({
    url: '/model/output/findAllModel',
    method: 'post',
    data: data
  })
}

// 所有模型版本
export function findAllModelVersion(data) {
  return request({
    url: '/model/output/findAllModelVersion',
    method: 'post',
    data: data
  })
}

// 文件模型数据
export function waterSurfaceProfileAndQzhb() {
  return request({
    url: '/model/output/waterSurfaceProfileAndQzhb',
    method: 'post',
  })
}

// 文件模型数据数据合并起来的
export function waterSurfaceProfileAndQzhbMerge() {
  return request({
    url: '/model/output/waterSurfaceProfileAndQzhbMerge',
    method: 'post',
  })
}
