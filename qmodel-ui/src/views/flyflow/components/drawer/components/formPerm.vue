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
import {computed} from "vue";
import {useFlowStore} from "../../../stores/flow";

let props = defineProps({


	formPerm: {
		type: Object, default: () => {

		}
	},
	hideKey: {
		type: Array, default: () => []
	}

});
let flowStore = useFlowStore();

const step2FormList = computed(() => {
	let step2 = flowStore.step2;

	return step2;
})
</script>

<template>
	<div>

		<div style="display: flex;flex-direction: row;background-color: var(--el-fill-color-light)" effect="dark">

			<div class="f1">表单字段</div>
			<div class="f2">只读</div>
			<div class="f3" >编辑</div>
			<div class="f4">隐藏</div>
		</div>

		<div v-if="step2FormList.length==0">
			<el-empty description="暂无表单"/>
		</div>
		<template v-for="item in step2FormList">

			<div style="display: flex;flex-direction: row;">

				<div class="f1">
					<span>{{ item.name }}</span>
			<span v-if="item.required" style="color: #c75450"> * </span>
		</div>

				<el-radio-group v-model="formPerm[item.id]" size="large">
					<div class="f2">
						<el-radio    size="large" label="R"><span></span></el-radio>
					</div>
					<div class="f3"  >
						<el-radio :disabled="!(hideKey.length==0||hideKey.indexOf('E')<0)" size="large" label="E"><span></span></el-radio>
					</div>
					<div class="f4">
						<el-radio size="large" label="H"><span></span></el-radio>
					</div>
				</el-radio-group>


			</div>

		</template>

	</div>
</template>

<style scoped lang="less">

@width2: 80px;
@width3: 80px;
@width4: 80px;

.f1 {
	width: calc(100% - @width2 - @width3 - @width4);
	padding: 10px;
}

.f2 {
	width: @width2;
	padding: 10px;

}

.f3 {
	width: @width3;
	padding: 10px;

}

.f4 {
	width: @width4;
	padding: 10px;

}
</style>
