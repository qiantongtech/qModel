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
  }

});
var options = computed(() => {
  return props.valueConfig.options;
});

var formValue = computed({
  get() {
    let value = props.valueConfig.value;
    return (value&&value.length==1)?value[0].key:undefined;
  },
  set(t) {
    let filterElement = options.value.filter(res=>res.key===t);
    props.valueConfig.value = filterElement
  }
})

</script>

<template>
  <el-select
      v-model="formValue"
      placeholder=""
      style="width: 100%"
  >
    <el-option
        v-for="item in options"
        :key="item.key"
        :label="item.value"
        :value="item.key"
    />
  </el-select>

</template>

<style scoped lang="less">

</style>
