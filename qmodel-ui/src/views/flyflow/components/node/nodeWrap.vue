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

<template>
	<div>
		<approval @updateData="nodeConfigUpdate" v-if="nodeConfig.type==1" :nodeConfig="nodeConfig"></approval>
		<starter @updateData="nodeConfigUpdate" v-else-if="nodeConfig.type==0" :nodeConfig="nodeConfig"></starter>
		<c-c @updateData="nodeConfigUpdate" v-else-if="nodeConfig.type==2" :nodeConfig="nodeConfig"></c-c>
	 		<delay @updateData="nodeConfigUpdate" v-else-if="nodeConfig.type==7" :nodeConfig="nodeConfig"></delay>
	 		<condition @updateData="nodeConfigUpdate" v-else-if="nodeConfig.type==4||nodeConfig.type==8" :nodeConfig="nodeConfig"></condition>
		<parallel @updateData="nodeConfigUpdate" v-else-if="nodeConfig.type==5" :nodeConfig="nodeConfig"></parallel>
		<nodeWrap v-if="nodeConfig.childNode" v-model:nodeConfig="nodeConfig.childNode"/>

	</div>

</template>
<script setup>
import Approval from "./node/approval.vue"
import Starter from "./node/starter.vue"
import CC from "./node/cc.vue"

import Delay from "./node/delay.vue"

import Condition from "./node/condition.vue"
import Parallel from "./node/parallel.vue"

const nodeConfigUpdate = (e) => {
	emits("update:nodeConfig", e);
}

let props = defineProps({
	nodeConfig: {
		type: Object,
		default: () => ({}),
	}
});





let emits = defineEmits(["update:nodeConfig"]);




</script>
<style scoped>
</style>
