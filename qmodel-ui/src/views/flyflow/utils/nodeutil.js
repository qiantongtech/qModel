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

import {isNotBlank,getRandomId} from "./objutil.js";


function isNode(node) {
	return node && isNotBlank(node.id)
}


/**
 * 判断是否是分支
 * @param type
 * @returns {boolean}
 */
function  isBranch(type){
	if (type === 4 || type === 5 || type === 8) {
		return true;
	}
	return false;
}

/**
 * 重新设置nodeid
 * @param node
 */
export function resetNodeId(node,parentId){
	if(!isNode(node)){
		return
	}
	node.id=getRandomId();
	node.parentId=parentId;
	let childNode = node.childNode;
	if(!isNode(childNode)){
		return;
	}
	let type = node.type;

	if (isBranch(type)) {

		let branchs = node.conditionNodes;

		for (var branch of branchs) {

			  resetNodeId(branch,node.id);

		}

	}
	resetNodeId(childNode,node.id);

}



/**
 * 获取除了分支之后的所有节点
 * @param node
 */
export function getAllNodeExceptBranch(node){

	var arr=[];

	if(!isNode(node)){
		return arr;
	}

	if(isBranch(node.type)){
		let branchs = node.conditionNodes;

		for (var branch of branchs) {
			let list = getAllNodeExceptBranch(branch.childNode);
			arr=arr.concat(list);

		}
	}else if(node.type!=0){
		arr.push(node);
	}

	let list = getAllNodeExceptBranch(node.childNode);
	return  arr.concat(list);
}
