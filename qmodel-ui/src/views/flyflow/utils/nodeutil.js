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
