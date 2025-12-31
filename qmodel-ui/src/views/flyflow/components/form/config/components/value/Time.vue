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


</script>

<template>
  <el-time-picker
      arrow-control
      size="default"
      class="formDate"
      value-format="HH:mm:ss"

      v-model="valueConfig.value"


  />
</template>

<style scoped lang="less">

</style>
