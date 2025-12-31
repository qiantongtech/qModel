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
