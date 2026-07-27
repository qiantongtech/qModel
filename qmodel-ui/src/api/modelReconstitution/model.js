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

import request from '@/utils/request';

// 查询模型管理 列表
export function listModel(query) {
    return request({
        url: '/model/modelReconstitution/list',
        method: 'get',
        params: query
    });
}

// 查询模型管理 详细
export function getModel(id) {
    return request({
        url: '/model/modelReconstitution/' + id,
        method: 'get'
    });
}

// 查询模型管理 分类
export function getmodelList(classifyId) {
    return request({
        url: '/model/modelReconstitution/list/children/' + classifyId,
        method: 'get'
    });
}

// 新增模型管理
export function addModel(data) {
    return request({
        url: '/model/modelReconstitution',
        method: 'post',
        data: data
    });
}

// 修改模型管理 基础信息
export function updateModel(data) {
    return request({
        url: '/model/modelReconstitution',
        method: 'put',
        data: data
    });
}

// 删除模型管理
export function delModel(id) {
    return request({
        url: '/model/modelReconstitution/' + id,
        method: 'delete'
    });
}

// 新增模型管理
export function getFileList(data) {
    return request({
        url: '/model/modelReconstitution/getFileList',
        method: 'post',
        data: data
    });
}
