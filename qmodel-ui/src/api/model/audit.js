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

// 查询模型审批列表
export function listAudit(query) {
  return request({
    url: '/model/audit/list',
    method: 'get',
    params: query
  })
}

// 查询模型审批详细
export function getAudit(id) {
  return request({
    url: '/model/audit/' + id,
    method: 'get'
  })
}

// 修改模型审批
export function updateAudit(data) {
  return request({
    url: '/model/audit',
    method: 'put',
    data: data
  })
}
