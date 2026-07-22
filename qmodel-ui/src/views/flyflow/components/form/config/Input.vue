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
import {computed, defineExpose} from "vue";

let props = defineProps({
	id: {
		type: String,
		default: "",
	}
});



import {getCurrentConfig} from "../../../utils/objutil";

var config = computed(() => {

	return getCurrentConfig(props.id);
});
import ValueCom from './components/value/Input.vue'

</script>

<template>
	<div  v-if="config">
		<el-form-item label="最小长度">
			<el-input-number :step="1" step-strictly v-model="config.props.minLength" style="width: 100%"
											 controls-position="right" :min="1"
											 :max="100"/>
		</el-form-item>
		<el-form-item label="最大长度">
			<el-input-number :step="1" step-strictly v-model="config.props.maxLength" style="width: 100%"
											 controls-position="right" :min="1"
											 :max="100"/>

		</el-form-item>
		<el-form-item label="正则表达式">
			<el-input placeholder="^\d+$" v-model="config.props.regex"/>


		</el-form-item>
		<el-form-item label="正则表达式提示语">
			<el-input placeholder="表单值不符合正则表达式" v-model="config.props.regexDesc"/>


		</el-form-item>
		<el-form-item label="默认值">
      <value-com :id="id" :value-config="config.props"></value-com>
		</el-form-item>
	</div>
</template>

<style scoped lang="less">

</style>
