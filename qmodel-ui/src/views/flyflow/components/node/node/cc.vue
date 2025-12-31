<script setup lang="ts">
import {getCurrentInstance, computed, onMounted, ref, watch} from "vue";


let props = defineProps({

	nodeConfig: {
		type: Object, default: () => {

		}
	}

});




//TODO 7
import {useFlowStore} from '../../../stores/flow'

let flowStore = useFlowStore();


const step2FormList = computed(() => {
	let step2 = flowStore.step2;
	return step2;
})

//TODO 6
watch(() => step2FormList.value, (val) => {

	let nodeConfig = props.nodeConfig;

	if (nodeConfig.type == 1) {
		//审批人

		if (nodeConfig.assignedType == 8) {
			//表单人员
			let formUserId = nodeConfig.formUserId;
			let length = val.filter(res => res.id === formUserId).length;
			if (length == 0) {
				nodeConfig.formUserId = ''
				nodeConfig.formUserName = ''
				nodeConfig.error = true;
				nodeConfig.errorMsg = '请选择表单人员';
			}

		}
	}
})




import {useStore} from "../../../stores";



let emits = defineEmits(['updateData']);


const updateParentData = (d) => {
	emits("updateData", d);

}



let store = useStore();
let {

	//TODO 2
	setCopyer,

	setCopyerConfig



} = store;


let _uid = getCurrentInstance().uid;



function open(){

	//TODO 4
	setCopyer(true);
	setCopyerConfig({

    value: JSON.parse(JSON.stringify(props.nodeConfig)),

		flag: false,
		id: _uid,
	});
}

import NodeTemplate from "./node-template.vue";

</script>

<template>
	<node-template :uid="_uid" store-data-key="copyerConfig1" @updateData="updateParentData" place-holder-method-name="copyerStr" check-method-name="checkCopy" @open="open"   :node-config="nodeConfig"></node-template>
</template>

<style scoped lang="less">
</style>
