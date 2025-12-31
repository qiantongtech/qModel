<script setup lang="ts">

import StartFlowUi from './startFlowUI.vue'
import {ref} from "vue";
import {FormVO} from "../../api/form/types";
import { startFlow} from "../../api/flow";


const currentOpenFlow = ref<FormVO[]>([]);

const handle = (row) => {


	currentOpenFlow.value = row;

	startProcess(row);
}

defineExpose({handle});

const startFlowUiRef = ref();


const startProcess = (f) => {
	startFlowUiRef.value.handle(f.flowId,undefined,f.processInstanceId,f.uniqueId)
}


const submitProcess = (data) => {

	startFlow(data).then(res => {
		startFlowUiRef.value.complete(res);
	})


}

</script>

<template>
	<div>

		<start-flow-ui @complete="submitProcess" ref="startFlowUiRef"></start-flow-ui>


	</div>
</template>

<style scoped lang="less">

</style>
