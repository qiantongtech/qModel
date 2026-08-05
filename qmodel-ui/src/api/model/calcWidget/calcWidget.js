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

// 查询模型计算任务可视化组件配置列表
export function listCalcWidget(query) {
    return request({
        url: '/model/calcWidget/list',
        method: 'get',
        params: query
    })
}

// 根据计算任务ID查询可视化组件配置列表
export function listCalcWidgetByCalcId(calcId) {
    return request({
        url: '/model/calcWidget/listByCalcId/' + calcId,
        method: 'get'
    })
}

// 查询模型计算任务可视化组件配置详细
export function getCalcWidget(id) {
    return request({
        url: '/model/calcWidget/' + id,
        method: 'get'
    })
}

// 新增模型计算任务可视化组件配置
export function addCalcWidget(data) {
    return request({
        url: '/model/calcWidget',
        method: 'post',
        data: data
    })
}

// 修改模型计算任务可视化组件配置
export function updateCalcWidget(data) {
    return request({
        url: '/model/calcWidget',
        method: 'put',
        data: data
    })
}

// 删除模型计算任务可视化组件配置
export function delCalcWidget(id) {
    return request({
        url: '/model/calcWidget/' + id,
        method: 'delete'
    })
}
