<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.

  This file is part of qModel Module Platform (Open Source Edition).

  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.

  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.

  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

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
