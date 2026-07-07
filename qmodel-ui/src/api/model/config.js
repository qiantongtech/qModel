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
