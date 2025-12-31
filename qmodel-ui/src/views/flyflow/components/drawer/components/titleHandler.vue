<script setup lang="ts">

import {EditPen} from "@element-plus/icons-vue";
import {computed, nextTick, ref} from "vue";
import {placeholderList} from "../../../utils/const";

const input = ref(false);

let props = defineProps({


  nodeConfig: {
    type: Object, default: () => {

    }
  }

});

let defaultText = computed(() => {
  return placeholderList[props.nodeConfig.type]
});

const titleInputBlurEvent = () => {

  input.value = false
  props.nodeConfig.nodeName = props.nodeConfig.nodeName || defaultText

};
const titleInputRef = ref()
const titleTextClickEvent = () => {
  input.value = true
  nextTick(() => {
    titleInputRef.value.focus()
  })
}
</script>

<template>
<div>

  <el-text style="cursor: pointer" v-if="!input" tag="b" size="large" @click="titleTextClickEvent">
    {{ nodeConfig.nodeName }}
    <el-icon>
      <EditPen/>
    </el-icon>

  </el-text>
  <el-input

      ref="titleInputRef"

      @blur="titleInputBlurEvent"

      maxlength="10"

      v-if="input" v-model="nodeConfig.nodeName"></el-input>
</div>
</template>

<style scoped lang="less">

</style>
