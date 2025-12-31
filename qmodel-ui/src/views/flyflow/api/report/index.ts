import request from '../../utils/request';

//  流程数据列表
export function queryFlowDataList(param:any) {
	return request({
		url: '/report/queryDataList',
		method: 'post',
		data: param
	})
}

//  导出流程数据列表
export function exportDataList(param:any) {
	return request({
		url: '/report/exportDataList',
		method: 'post',
		data: param
	})
}

//  查询请求头
export function queryHeaderList(param:any) {
	return request({
		url: '/report/queryHeaderList',
		method: 'get',
		params: {flowId:param}
	})
}

//  查询请求条件
export function queryConditionList(param:any) {
	return request({
		url: '/report/queryConditionList',
		method: 'get',
		params: {flowId:param}
	})
}
