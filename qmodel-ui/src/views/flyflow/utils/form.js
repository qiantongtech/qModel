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

import {useFlowStore} from '../stores/flow'
import {computed} from "vue";
import * as util from "@/views/flyflow/utils/objutil.js";
let flowStore = useFlowStore();
const step2FormList = computed(() => {
	let step2 = flowStore.step2;

	return step2;
})


export function getAboveSameTypeFormList(aboveFormId,type,autoAddStarter=false){

	let value = step2FormList.value;


	var fList = [];

	if (util.isNotBlank(aboveFormId)) {
		for (var it of value) {
			if (it.id === aboveFormId) {
				break
			}
			fList.push(it)
		}

	} else {
		fList = value;
	}

	let $deepCopy = util.deepCopy(fList.filter(res =>
		res.type != 'SelectMultiUser' &&
		res.type != 'SelectMultiDept' &&
		res.type != 'Description' &&

		res.type != 'UploadImage' &&
		res.type != 'UploadFile'
	));


	//自动添加发起人信息
	if(autoAddStarter){
		$deepCopy.push({
			id: 'rootUser',
			name: '发起人',
			type: "SelectUser",
			typeName: "用户"
		})
	}




	//判断类型
	if(util.isNotBlank(type)){
		return $deepCopy.filter(res=>res.type===type);
	}

	return $deepCopy;
}
