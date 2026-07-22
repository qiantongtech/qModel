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
