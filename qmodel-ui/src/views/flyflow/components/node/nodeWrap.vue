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
