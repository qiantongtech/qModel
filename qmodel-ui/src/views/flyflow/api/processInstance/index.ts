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
