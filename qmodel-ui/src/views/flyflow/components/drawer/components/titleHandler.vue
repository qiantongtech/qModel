<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

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
