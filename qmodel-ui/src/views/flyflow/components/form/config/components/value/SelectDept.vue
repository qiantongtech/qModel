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
  ,
  valueConfig:{
    type:Object,
    dafault:()=>{}
  },
	showStyle:{
		type:Number,
		default:1
	}
});
import selectShow from "../../../../orgselect/selectAndShow.vue";

var defaultValue = computed({
  get: () => {
		let value = props.valueConfig.value;
		return value?value:[];
  },
  set: (s: any[]) => {
    props.valueConfig.value = s
  },
});

</script>

<template>
	<div>
		<select-show
				:showStyle="showStyle" placeholder="请选择部门"
				:disabled="false" v-model:orgList="defaultValue" type="dept" :multiple="false"
				 ></select-show>
	</div>

</template>

<style scoped lang="less">

</style>
