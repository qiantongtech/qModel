<template>
	<el-drawer :append-to-body="true" v-model="visible" :show-close="false" :size="550"
						 @open="openEvent"
						 :before-close="saveApprover">
		<!--			标题-->
		<template #header="{ close, titleId, titleClass }">

			<title-handler :node-config="approverConfig"></title-handler>


		</template>


		<el-tabs type="border-card">
			<el-tab-pane label="设置审批人">

				<user-config :approver-config="approverConfig"></user-config>


				<template
						v-if="
						approverConfig.assignedType===4
						||
						approverConfig.assignedType===14

">

					<h4>选择方式</h4>
					<el-radio-group v-model="approverConfig.multiple" class="ml-4">
						<el-radio :label="false" size="large">单选</el-radio>
						<el-radio :label="true" size="large">多选</el-radio>
					</el-radio-group>
				</template>
				<template v-if="(
					(approverConfig.multiple===true&&	approverConfig.assignedType===4)||
					(approverConfig.multiple===true&&	approverConfig.assignedType===14)||
				(approverConfig.assignedType===1)||
				(approverConfig.assignedType===9)||
				(approverConfig.assignedType===15)||
				(approverConfig.assignedType===2)||
				(approverConfig.assignedType===10)||
				(approverConfig.assignedType===3)||
				(approverConfig.assignedType===7)||
				(approverConfig.assignedType===8)
				)
				&&(approverConfig.assignedType!=5)">

					<h4>🧑‍🤝‍🧑多人审批时采用的审批方式</h4>
					<el-radio-group v-model="approverConfig.multipleMode" class="ml-4">
						<p style="display: block;width: 100%">
							<el-radio :label="1" size="large">会签(默认需要所有审批人同意)</el-radio>

						</p>
						<p style="display: block;width: 100%">
							<el-radio :label="2" size="large">或签(一名审批人同意即可)</el-radio>
						</p>
						<p style="display: block;width: 100%">


							<el-radio :label="3" size="large">依次审批(按顺序依次审批)</el-radio>
						</p>
					</el-radio-group>

				</template>



				<template v-if="approverConfig.assignedType!=11&&approverConfig.assignedType!=12">
					<h4>🈳审批人为空时</h4>
					<el-radio-group v-model="approverConfig.nobody.handler" class="ml-4">
						<el-radio style="width:40%" label="TO_PASS" size="large">自动通过</el-radio>
						<el-radio label="TO_REFUSE" size="large">自动拒绝</el-radio>
						<el-radio style="width: 40%"  label="TO_USER" size="large">指定人员</el-radio>
						<el-radio label="TO_ADMIN" size="large">转交给流程管理员</el-radio>
					</el-radio-group>
					<select-show v-if="approverConfig.nobody.handler==='TO_USER'"
											 v-model:orgList="approverConfig.nobody.assignedUser" type="user"
											 :multiple="false"></select-show>
				</template>

			</el-tab-pane>
			<el-tab-pane label="操作权限">
				<ul>
					<li>
						<el-row>
							<el-col :span="12">
								<el-text tag="b">权限名字</el-text>
							</el-col>
							<el-col :span="12">
								<el-text tag="b">按钮名字</el-text>
							</el-col>
						</el-row>
					</li>
					<li v-for="(item,index) in approverConfig.operList">
						<el-row>
							<el-col :span="12">
								<el-checkbox v-model="item.checked" size="large">
									{{ item.defaultName }}
								</el-checkbox>
							</el-col>
							<el-col :span="12">
								<el-text v-if="!item.edit" @click="clickOperBtnName(item,index)">
									{{ item.name }}
									<el-icon>
										<EditPen/>
									</el-icon>
								</el-text>
								<template v-else>
									<el-input :id="'btnNameRef'+index" @blur="operInputBlur(item)" v-model="item.name"
														placeholder="请输入按钮名字"/>
								</template>
							</el-col>
						</el-row>


					</li>

				</ul>


			</el-tab-pane>
			<el-tab-pane label="表单权限">

				<form-perm :form-perm="approverConfig.formPerms"></form-perm>


			</el-tab-pane>


		</el-tabs>


	</el-drawer>
</template>

<script setup type="ts">


import {Check, Plus, EditPen} from "@element-plus/icons-vue";

import {ref, watch, computed, reactive, nextTick} from 'vue'
import $func from '../../utils/index'
import {delayUnitOpts, nodeData, placeholderList} from '../../utils/const'
import {useStore} from '../../stores/index'
import {useFlowStore} from '../../stores/flow'

import * as util from '../../utils/objutil'


import UserConfig from './components/userConfig.vue'



let flowStore = useFlowStore();


import FormPerm from './components/formPerm.vue'
import TitleHandler from './components/titleHandler.vue'


const clickOperBtnName = (item, index) => {

	item.edit = true;

	nextTick(() => {
		document.getElementById("btnNameRef" + index)?.focus();

	})


}


const operInputBlur = (item) => {

	item.edit = false;
	if (util.isBlank(item.name)) {
		item.name = item.defaultName
	}
}

const step2FormList = computed(() => {
	let step2 = flowStore.step2;

	return step2;
})


const openEvent = () => {
	let value = step2FormList.value;
	var arr = {};
	let formPerms = approverConfig.value.formPerms;

	for (var item of value) {
		arr[item.id] = "R"

		if (formPerms[item.id]) {
			arr[item.id] = formPerms[item.id]
		}
	}
	approverConfig.value.formPerms = arr;
}

import selectShow from "../orgselect/selectAndShow.vue";


let approverConfig = ref({})


let store = useStore()
let {setApproverConfig, setApprover} = store
let approverConfigData = computed(() => store.approverConfigData)
let approverDrawer = computed(() => store.approverDrawer)
let visible = computed({
	get() {
		return approverDrawer.value
	},
	set() {
		closeDrawer()
	}
})
watch(approverConfigData, (val) => {
	approverConfig.value = {...nodeData[val.value.type], ...val.value};
})


const saveApprover = () => {

	let checkApproval = $func.checkApproval(approverConfig.value);
	approverConfig.value.error = !checkApproval.ok;
	approverConfig.value.errorMsg = checkApproval.msg;
	setApproverConfig({
		value: approverConfig.value,
		flag: true,
		id: approverConfigData.value.id
	})
	closeDrawer()
}
const closeDrawer = () => {
	setApprover(false)
}
</script>
<style lang="less" scoped>
</style>
