/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
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
