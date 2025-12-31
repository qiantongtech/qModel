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

const placeHolder = computed(()=>{
	return config?.value?.placeholder;
})


watch(()=>placeHolder.value,(f)=>{
	if(config.value){
	  config.value.props.value=f;

	}
},{deep:true})

</script>

<template>
	<div>

	</div>
</template>

<style scoped lang="less">

</style>
