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

/*
 * @Date: 2022-08-29 14:00:42
 * @LastEditors: StavinLi 495727881@qq.com
 * @LastEditTime: 2023-03-29 15:53:05
 * @FilePath: /Workflow-Vue3/src/components/dialog/common.js
 */


import {ref} from 'vue'
import {orgTree, orgTreeSearcheUser} from "../api/dept/index";
import $func from "./index.js";

export let searchVal = ref('')
export let departments = ref({
	titleDepartments: [],
	childDepartments: [],
	roleList: [],
	employees: [],
})
export let roles = ref({})

export let getDepartmentList = async (parentId = 0,type='org') => {
	// let { data } = await getDepartments({ parentId })

	let {data} = await orgTree(type, parentId)

	departments.value = data;

}
export let getDebounceData = (event, type = 1) => {

	$func.debounce(async () => {

		if (event) {
			let data = {
				userName: event,
				pageNum: 1,
				pageSize: 30
			}
				departments.value.childDepartments = [];
				let res = await orgTreeSearcheUser(data)
				departments.value.employees = res.data

		} else {
			  await getDepartmentList() ;
		}
	})()
}
