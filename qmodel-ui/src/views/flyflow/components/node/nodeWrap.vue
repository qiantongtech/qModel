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
