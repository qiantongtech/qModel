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
