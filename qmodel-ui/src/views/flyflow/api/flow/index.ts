import request from '../../utils/request';





/**
 * 创建流程
 *
 * @param data
 */
export function addFlow(data: any) {
	return request({
		url: '/process/create',
		method: 'post',
		data: data
	});
}

/**
 * 获取流程详细信息
 *
 * @param data
 */
export function getFlowDetail(flowId: string) {
	return request({
		url: '/process/getDetail?flowId=' + flowId,
		method: 'get'
	});
}

/**
 * 停用流程
 *
 * @param data
 */
export function disableFlow(flowId: string) {
	return request({
		url: '/process/update/' + flowId + "?type=stop",
		method: 'put'
	});
}

/**
 * 根据流程唯一标识查询流程列表
 *
 * @param uniqueId
 */
export function getListByUniqueId(uniqueId: string) {
	return request({
		url: '/process/getListByUniqueId/' + uniqueId ,
		method: 'get'
	});
}
/**
 * 设置主流程
 *
 * @param flowId
 */
export function setMainProcess(flowId: string) {
	return request({
		url: '/process/setMainProcess/' + flowId ,
		method: 'post'
	});
}

/**
 * 删除流程
 *
 * @param data
 */
export function deleteFlow(flowId: string) {
	return request({
		url: '/process/update/' + flowId + "?type=delete",
		method: 'put'
	});
}

/**
 * 启用流程
 *
 * @param data
 */
export function enableFlow(flowId: string) {
	return request({
		url: '/process/update/' + flowId + "?type=using",
		method: 'put'
	});
}

/**
 * 发起流程
 *
 * @param data
 */
export function startFlow(obj: any) {
	return request({
		url: '/process-instance/startProcessInstance',
		method: 'post',
		data: obj
	});
}
