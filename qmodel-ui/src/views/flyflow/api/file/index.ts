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

import request from '../../utils/request';
import { AxiosPromise } from 'axios';
import { FileInfo } from './types';

/**
 * 上传文件
 *
 * @param file
 */
export function uploadFileApi(file: File): AxiosPromise<FileInfo> {
  const formData = new FormData();
  formData.append('file', file);
  return request({
    url: 'file/upload',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

/**
 * 删除文件
 *
 * @param filePath 文件完整路径
 */
export function deleteFileApi(filePath?: string) {
  return request({
    url: '/api/v1/files',
    method: 'delete',
    params: { filePath: filePath }
  });
}


/**
 * pdf转图片
 *
 * @param filePath 文件完整路径
 */
export function pdfToImgList(filePath?: string,page,count) {
  return request({
    url: '/file/pdfToImgList',
    method: 'get',
    params: { url: filePath,page:page,count:count }
  });
}
