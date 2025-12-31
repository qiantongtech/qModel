import request from '../../utils/request';



/**
 * 获取首页数据
 */
export function getIndexData() {
	return request({
		url: '/base/index',
		method: 'get'
	});
}

/**
 * 同步数据
 */
export function loadRemoteData() {
	return request({
		url: '/base/loadRemoteData',
		method: 'post'
	});
}


/**
 * 获取用户签署合同默认的签章url
 */
export function getUserSignContractUrl(taskId) {
	return request({
		url: '/base/getUserSignContractUrl',
		method: 'get',
		params:{taskId:taskId}
	});
}


/**
 * 节点格式化数据显示
 */
export function formatStartNodeShow(d) {
	return request({
		url: '/base/formatStartNodeShow',
		method: 'post',
		data:d
	});
}


/**
 * 查询头部显示数据
 */
export function queryHeaderShow(d) {
	return request({
		url: '/base/queryHeaderShow',
		method: 'post',
		data:d
	});
}



/**
 * 查询操作数据
 */
export function queryTaskOperData(d) {
	return request({
		url: '/base/queryTaskOperData',
		method: 'get',
		params:{taskId:d}
	});
}


/**
 * 查询流程打印数据
 */
export function queryPrintData(d) {
	return request({
		url: '/base/queryPrintData',
		method: 'get',
		params:{processInstanceId:d}
	});
}




/**
 * 修改前端版本号
 */
export function setWebVersion(d) {
	return request({
		url: '/base/setWebVersion',
		method: 'post',
		data:{versionNo:d}
	});
}



/**
 * 获取前端版本号
 */
export function getWebVersion() {
	return request({
		url: '/base/getWebVersion',
		method: 'get'
	});
}


