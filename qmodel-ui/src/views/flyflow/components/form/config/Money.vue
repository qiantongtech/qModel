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
import {computed, defineExpose} from "vue";

let props = defineProps({
	id: {
		type: String,
		default: "",
	}
});

import {useFlowStore} from "../../../stores/flow";

let flowStore = useFlowStore();


import {getCurrentConfig} from "../../../utils/objutil";

var config = computed(() => {

	return getCurrentConfig(props.id);
});
var isInLayout=computed(()=>{
	let step2 = flowStore.step2;
	var idObjList = step2.filter(res => res.id === props.id);
	if (idObjList.length > 0) {
		return false
	}

	return true;
})

import ValueCom from './components/value/Money.vue'

</script>

<template>
	<div v-if="config">

	  <el-form-item label="格式">
		  <el-checkbox v-model="config.props.showChinese" label="显示大写数字" />
<!--		  <el-checkbox v-model="config.props.showThousandSymbol" label="显示千位分隔符" />-->
	  </el-form-item>
		<el-form-item label="统计总数" v-if="isInLayout">
			<el-switch
					v-model="config.props.sum"
					size="large"
					active-text="开启"
					inactive-text="关闭"
			/>

		</el-form-item>
		<el-form-item label="最小值">
			<el-input-number v-model="config.props.min" style="width: 100%" controls-position="right" :min="1"
							 :max="100000000000000"/>
		</el-form-item>
		<el-form-item label="最大值">
			<el-input-number v-model="config.props.max" style="width: 100%" controls-position="right" :min="1"
							 :max="100000000000000"/>

		</el-form-item>
		<el-form-item label="小数位数">
			<el-input-number :step="1" step-strictly v-model="config.props.radixNum" style="width: 100%"
							 controls-position="right" :min="0"
					   value-on-clear="min"

					   :max="10"/>

		</el-form-item>

		<el-form-item label="默认值">
      <value-com :id="id" :value-config="config.props"></value-com>

    </el-form-item>
	</div>
</template>

<style scoped lang="less">

</style>
