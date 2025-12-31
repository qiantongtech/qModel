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

import ValueCom from './components/value/Time.vue'

</script>

<template>
	<div v-if="config">


		<el-form-item label="最小值">

		<el-time-picker
			arrow-control
		size="default"
				class="formDate"

				v-model="config.props.min"

	  value-format="HH:mm:ss"


		/>
		</el-form-item>
		<el-form-item label="最大值">
		<el-time-picker
				arrow-control
				size="default"
				class="formDate"

				v-model="config.props.max"
		value-format="HH:mm:ss"



		/>

		</el-form-item>

		<el-form-item label="默认值">

				<value-com :id="id" :value-config="config.props"></value-com>


		</el-form-item>
	</div>
</template>

<style scoped lang="less">
:deep( .formDate div.el-input__wrapper){
  width: 100% !important;
}
:deep( .formDate){
  width: 100% !important;
}
</style>
