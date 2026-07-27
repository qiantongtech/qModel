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

export function uploadCommonFile(file) {
  const formData = new FormData()
  formData.append('file', file)
  return request({
    url: '/common/upload',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}

export function checkUploadFile(file) {
  const formData = new FormData()
  formData.append('file', file)
  return request({
    url: '/model/modelFileResource/checkUploadFile',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}

// 查询模型文件部署列表
export function listModelFileResource(query) {
  return request({
    url: '/model/modelFileResource/list',
    method: 'get',
    params: query
  })
}

export function addFileResource(data) {
  return request({
    url: '/model/modelFileResource',
    method: 'post',
    data: data
  })
}

export function updateFileResource(data) {
  return request({
    url: '/model/modelFileResource',
    method: 'put',
    data: data
  })
}

export function getBuildEnvInfo(filePath) {
  return request({
    url: '/model/modelFileResource/getBuildEnvInfo',
    method: 'get',
    params: { filePath }
  })
}

export function runModelScript(modelId, inputParam) {
  return request({
    url: '/model/modelFileResource/runScript/' + modelId,
    method: 'post',
    data: inputParam
  })
}
