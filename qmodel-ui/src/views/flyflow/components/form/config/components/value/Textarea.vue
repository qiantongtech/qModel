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
			<el-input type="textarea" v-model="valueConfig.value"/>

</template>

<style scoped lang="less">

</style>
