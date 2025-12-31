
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
