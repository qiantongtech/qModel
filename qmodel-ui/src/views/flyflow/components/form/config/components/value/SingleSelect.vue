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
