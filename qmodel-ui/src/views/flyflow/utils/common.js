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
