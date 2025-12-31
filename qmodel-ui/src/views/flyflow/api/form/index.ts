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
