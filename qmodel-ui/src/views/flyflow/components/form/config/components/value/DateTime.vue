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
  <el-date-picker
      size="default"
      class="formDate"
      value-format="YYYY-MM-DD HH:mm:ss"

      v-model="valueConfig.value"

      type="datetime"

  />
</template>

<style scoped lang="less">

</style>
