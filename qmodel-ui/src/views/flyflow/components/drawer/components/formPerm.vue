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
