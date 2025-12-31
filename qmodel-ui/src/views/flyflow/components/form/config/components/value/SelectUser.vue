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
		<select-show :showStyle="showStyle" placeholder="请选择用户"
				:disabled="false" v-model:orgList="defaultValue" type="user" :multiple="false"
			 ></select-show>
	</div>

</template>

<style scoped lang="less">

</style>
