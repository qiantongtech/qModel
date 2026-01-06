<!--
  Copyright © 2026 Qiantong Technology Co., Ltd.
  qModel Model Platform(Open Source Edition)
   *
  License:
  Released under the Apache License, Version 2.0.
  You may use, modify, and distribute this software for commercial purposes
  under the terms of the License.
   *
  Special Notice:
  All derivative versions are strictly prohibited from modifying or removing
  the default system logo and copyright information.
  For brand customization, please apply for brand customization authorization via official channels.
   *
  More information: https://qmodel.qiantong.tech/business.html
   *
  ============================================================================
   *
  版权所有 © 2026 江苏千桐科技有限公司
  qModel 模型平台（开源版）
   *
  许可协议：
  本项目基于 Apache License 2.0 开源协议发布，
  允许在遵守协议的前提下进行商用、修改和分发。
   *
  特别说明：
  所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
  如需定制品牌，请通过官方渠道申请品牌定制授权。
   *
  更多信息请访问：https://qmodel.qiantong.tech/business.html
-->


<template>
	<el-drawer :append-to-body="true" title="发起人" v-model="visible" class="set_promoter" :show-close="false"
						 @open="openEvent"
						 :size="550" :before-close="savePromoter">
    <template #header="{ close, titleId, titleClass }">

      <title-handler :node-config="starterConfig"></title-handler>


    </template>

    <div class="demo-drawer__content">
			<el-tabs type="border-card">

				<el-tab-pane label="表单权限">
						<form-perm :form-perm="starterConfig.formPerms"></form-perm>

				</el-tab-pane>



			</el-tabs>


		</div>
	</el-drawer>
</template>
<script setup>
import {useFlowStore} from '../../stores/flow'

import {useStore} from '../../stores/index'
import {computed, ref, watch} from 'vue'

import FormPerm from './components/formPerm.vue'

let store = useStore()
import $func from "../../utils/index.js";
import TitleHandler from "./components/titleHandler.vue";
import {nodeData} from "../../utils/const.js";
import {deepCopy} from "../../utils/objutil.js";


let starterConfig = ref({})
let flowStore = useFlowStore();

let starterConfigData = computed(() => store.starterConfigData)
watch(starterConfigData, (val) => {
	starterConfig.value ={...deepCopy(nodeData[val.value.type]),...val.value};
})
const step2FormList = computed(() => {
	let step2 = flowStore.step2;

	return step2;
})

const  openEvent=()=>{
	let value = step2FormList.value;
	var arr={};
	let formPerms = starterConfig.value.formPerms;
	for(var item of value){
		arr[item.id]="E"

		if(formPerms[item.id]){
			arr[item.id]=formPerms[item.id]
		}


	}
	starterConfig.value.formPerms=arr;
}



let {setPromoter, setStarterConfig} = store
let promoterDrawer = computed(() => store.promoterDrawer)
let visible = computed({
	get() {
		return promoterDrawer.value
	},
	set() {
		closeDrawer()
	}
})


const savePromoter = () => {


	// starterConfig.value.error = !$func.checkStarter(starterConfig.value);


  starterConfig.value.error = !$func.checkStarter(starterConfig.value).ok;
  starterConfig.value.errorMsg = $func.checkStarter(starterConfig.value).msg;
	setStarterConfig({
		value: starterConfig.value,
		flag: true,
		id: starterConfigData.value.id
	})
	closeDrawer()
}
const closeDrawer = () => {
	setPromoter(false)
}
</script>
<style lang="less" scoped>
</style>
