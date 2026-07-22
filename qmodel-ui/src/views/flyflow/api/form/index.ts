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

import request from '../../utils/request';
import {AxiosPromise} from 'axios';


/**
 * 获取表单详细数据
 */

export function getFormDetail(d): AxiosPromise {


    return request({
        url: '/form/getFormDetail' ,
        method: 'post',
        data: d
    });
}

/**
 * 获取动态表单
 */

export function dynamicFormList(d): AxiosPromise {


    return request({
        url: '/form/dynamicFormList',
        method: 'post',
        data: d
    });
}


/**
 * 获取表单选项
 */

export function selectOptions(d): AxiosPromise {


    return request({
        url: '/form/selectOptions',
        method: 'post',
        data: d
    });
}
