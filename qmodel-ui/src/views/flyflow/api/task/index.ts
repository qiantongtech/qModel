import request from '../../utils/request';


/**
 * 查询待签署合同
 *
 * @param data
 */
export function querySignContractInfo(data: any) {
    return request({
        url: '/task/querySignContractInfo',
        method: 'get',
        params: {taskId:data}
    });
}


/**
 * 查询待签署合同图片
 *
 * @param data
 */
export function queryContractImg(data: any) {
    return request({
        url: '/task/queryContractImg',
        method: 'post',
        data: data
    });
}





/**
 * 抄送给我的流程实例
 *
 * @param data
 */
export function queryMineCCInstance(data: any) {
	return request({
		url: '/process-instance/queryMineCCProcessInstance',
		method: 'post',
		data: data
	});
}
/**
 * 查询待办任务
 *
 * @param data
 */
export function queryMineTask(data: any) {
	return request({
		url: '/combination/group/queryTodoTaskList',
		method: 'post',
		data: data
	});
}



/**
 * 查询我发起的任务
 *
 * @param data
 */
export function queryMineStarted(data: any) {
	return request({
		url: '/combination/group/queryInitiatedTaskList',
		method: 'post',
		data: data
	});
}


/**
 * 查询流程列表
 *
 * @param data
 */
export function queryList(data: any) {
	return request({
		url: '/process-instance/queryList',
		method: 'post',
		data: data
	});
}
/**
 * 查询流程实例详情
 *
 * @param data
 */
export function queryDetailByProcessInstanceId(data: any) {
	return request({
		url: '/process-instance/queryDetailByProcessInstanceId',
		method: 'get',
		params: {processInstanceId:data}
	});
}


// 查询当前用户已办任务
export function queryMineEndTask(param) {
	return request({
		url: 'combination/group/queryFinishedTaskList',
		method: 'post',
		data: param
	})
}
// 查询当前用户已办任务的流程实例
export function queryMineDoneProcessInstance(param) {
	return request({
		url: 'process-instance/queryMineDoneProcessInstance',
		method: 'post',
		data: param
	})
}



// 获取任务信息
export function getTask(taskId) {
	return request({
		url: 'task/getTask',
		method: 'get',
		params: {taskId:taskId}
	})
}
/**
 * 查看流程图
 *
 * @param data
 */
export function showImage(processInstanceId: string) {
	return request({
		url: '/process-instance/showImg?procInsId='+processInstanceId,
		method: 'get'
	});
}
// 添加评论
export function submitComment(param:Object) {
	return request({
		url: 'task/submitComment',
		method: 'post',
		data: param
	})
}
// 完成任务
export function completeTask(param:Object) {
	return request({
		url: 'task/completeTask',
		method: 'post',
		data: param
	})
}
// 完成签署合同任务
export function completeSignContractTask(param:Object) {
	return request({
		url: 'task/completeSignContractTask',
		method: 'post',
		data: param
	})
}
// 前加签完成任务
export function resolveTask(param:Object) {
	return request({
		url: 'task/resolveTask',
		method: 'post',
		data: param
	})
}
// 后加签
export function backJoinTask(param:Object) {
	return request({
		url: 'task/setAssignee',
		method: 'post',
		data: param
	})
}
// 管理员设置执行人 转交
export function setAssigneeByAdmin(param:Object) {
	return request({
		url: 'task/setAssigneeByAdmin',
		method: 'post',
		data: param
	})
}
// 驳回任务
export function rejectTask(param:Object) {
	return request({
		url: 'task/reject',
		method: 'post',
		data: param
	})
}
// 撤回任务
export function revokeTask(param:Object) {
	return request({
		url: 'task/revoke',
		method: 'post',
		data: param
	})
}
// 前加签任务
export function frontJoinTask(param:Object) {
	return request({
		url: 'task/delegateTask',
		method: 'post',
		data: param
	})
}
// 加签任务
export function addAssigneeTask(param:Object) {
	return request({
		url: 'task/addAssignee',
		method: 'post',
		data: param
	})
}
// 减签任务
export function delAssigneeTask(param:Object) {
	return request({
		url: 'task/delAssignee',
		method: 'post',
		data: param
	})
}
