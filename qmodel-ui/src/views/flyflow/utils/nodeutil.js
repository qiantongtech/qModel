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
