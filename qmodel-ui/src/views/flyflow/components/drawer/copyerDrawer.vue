
<template>
	<el-drawer :append-to-body="true" title="抄送人设置" v-model="visible"


			 @open="openEvent"

						 class="set_copyer" :show-close="false" :size="550" :before-close="saveCopyer">

    <template #header="{ close, titleId, titleClass }">

      <title-handler :node-config="copyerConfig"></title-handler>


    </template>


    <el-tabs type="border-card">
		  <el-tab-pane label="设置抄送人">

        <user-config :approver-config="copyerConfig" :exclude-assign-type="[11,4,12,14]"></user-config>

			</el-tab-pane>
		  <el-tab-pane label="表单权限">
		  <form-perm :hide-key="['E']" :form-perm="copyerConfig.formPerms"></form-perm>


	  </el-tab-pane>
		</el-tabs>
	</el-drawer>
</template>
<script setup>

import $func from '../../utils/index'
import { useStore } from '../../stores/index'
import { ref, watch, computed } from 'vue'
let copyerConfig = ref({})
import UserConfig from './components/userConfig.vue'

import {useFlowStore} from '../../stores/flow'
let flowStore = useFlowStore();

import FormPerm from './components/formPerm.vue'
import TitleHandler from "./components/titleHandler.vue";
import {nodeData} from "../../utils/const.js";
import {deepCopy} from "../../utils/objutil.js";

const step2FormList = computed(() => {
	let step2 = flowStore.step2;


	return step2;
})



let store = useStore()
let { setCopyerConfig, setCopyer } = store
let copyerDrawer = computed(()=> store.copyerDrawer)
let copyerConfig1 = computed(()=> store.copyerConfig1)
let visible = computed({
	get() {
		return copyerDrawer.value
	},
	set() {
		closeDrawer()
	}
})
watch(copyerConfig1, (val) => {
	copyerConfig.value = {...deepCopy(nodeData[val.value.type]),...val.value};
})

const  openEvent=()=>{
	let value = step2FormList.value;
	var arr={};
	let formPerms = copyerConfig.value.formPerms;

	for(var item of value){
		arr[item.id]="R"

		if(formPerms[item.id]){
			arr[item.id]=formPerms[item.id]
		}
	}
	copyerConfig.value.formPerms=arr;
}

const saveCopyer = () => {
	copyerConfig.value.error = !$func.checkCopy(copyerConfig.value).ok;
	copyerConfig.value.errorMsg = $func.checkCopy(copyerConfig.value).msg;
	setCopyerConfig({
		value: copyerConfig.value,
		flag: true,
		id: copyerConfig1.value.id
	})
	closeDrawer();
}
const closeDrawer = () => {
	setCopyer(false)
}
</script>

<style lang="less" scoped>
</style>
