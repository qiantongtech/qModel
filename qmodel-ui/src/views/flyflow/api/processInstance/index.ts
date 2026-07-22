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


/**
 * 抄送给我的
 *
 * @param data
 */
export function queryMineCC(data: any) {
    return request({
        url: '/combination/group/queryCopiedTaskList',
        method: 'post',
        data: data
    });
}




//  导出流程详情
export function exportDetail(param:any) {
	return request({
		url: '/process-instance/export/'+param,
		method: 'post'
	})
}



//  批量导出流程详情
export function exportBatch(param:any) {
	return request({
		url: '/process-instance/exportBatch/',
		method: 'post',
		data:param
	})
}



// 结束流程
export function stopProcessInstance(param:any) {
    return request({
        url: 'process-instance/stopProcessInstance/'+param,
        method: 'post'
    })
}

// 查询进行中的任务
export function queryTaskListInProgress(param:any) {
    return request({
        url: 'process-instance/queryTaskListInProgress/'+param,
        method: 'post'
    })
}


// 催办任务
export function urgeProcessInstance(param:any) {
    return request({
        url: 'process-instance/urgeProcessInstance',
        method: 'post',
        data: param
    })
}
