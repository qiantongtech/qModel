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
import {computed, defineExpose,ref} from "vue";

let props = defineProps({
	id: {
		type: String,
		default: "",
	},
});

import {getCurrentConfig} from "../../../utils/objutil";

var config = computed(() => {

	return getCurrentConfig(props.id);
});

var defaultValue = computed({
	get: () => {
		return (config.value.props.value);
	},
	set: (s: any[]) => {
		config.value.props.value = s
	},
});


//校验
const validate = () => {
	return true;
};
defineExpose({validate});

import ValueCom from './components/value/SelectUser.vue'

</script>

<template>
	<div v-if="config">


		<el-form-item label="选择范围">
			<el-checkbox
					v-model="config.props.self"
					:disabled="defaultValue.length > 0"
					label="可选自己"
			/>

		</el-form-item>
		<el-form-item label="默认值">

          <value-com :id="id" :value-config="config.props"></value-com>

		</el-form-item>
	</div>
</template>

<style scoped lang="less"></style>
