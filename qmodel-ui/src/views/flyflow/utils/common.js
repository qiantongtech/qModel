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
