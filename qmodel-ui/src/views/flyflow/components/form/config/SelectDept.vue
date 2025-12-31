<script setup lang="ts">
import { computed, defineExpose,ref } from "vue";

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


//校验
const validate = () => {
  return true;
};
defineExpose({ validate });

import ValueCom from './components/value/SelectDept.vue'

</script>

<template>
	<div v-if="config">

    <el-form-item label="默认值">

        <value-com :id="id" :value-config="config.props"></value-com>



	</el-form-item>
  </div>
</template>

<style scoped lang="less"></style>
