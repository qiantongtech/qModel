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

import ValueCom from './components/value/Number.vue'

</script>

<template>
	<div v-if="config">
		<el-form-item label="单位">
			<el-input v-model="config.props.unit" style="width: 100%" maxlength="10"/>
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
