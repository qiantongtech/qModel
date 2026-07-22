<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<script setup lang="ts">

import TaskUIHandle from "./taskUiPc.vue"
import {onMounted ,ref} from 'vue'


/**
 * 点击开始处理
 */
const deal = (row) => {



	  taskUiHandler.value.deal(row.taskId, row.processInstanceId,row.flowId,row.ccId,row.nodeId)


}




defineExpose({deal});

const taskSubmitEvent = () => {

	emit('taskSubmitEvent')
}



onMounted(() => {

});
const emit = defineEmits(["taskSubmitEvent"]);

const taskUiHandler=ref();

</script>

<template>
	<div >

			<task-u-i-handle   @taskSubmitEvent="taskSubmitEvent" ref="taskUiHandler"></task-u-i-handle>

	</div>
</template>
<style scoped lang="less">

</style>
