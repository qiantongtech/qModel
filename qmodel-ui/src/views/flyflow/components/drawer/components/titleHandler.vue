<!--
  Copyright © 2026 Qiantong Technology Co., Ltd.
  qModel Model Platform(Open Source Edition)
   *
  License:
  Released under the Apache License, Version 2.0.
  You may use, modify, and distribute this software for commercial purposes
  under the terms of the License.
   *
  Special Notice:
  All derivative versions are strictly prohibited from modifying or removing
  the default system logo and copyright information.
  For brand customization, please apply for brand customization authorization via official channels.
   *
  More information: https://qmodel.qiantong.tech/business.html
   *
  ============================================================================
   *
  版权所有 © 2026 江苏千桐科技有限公司
  qModel 模型平台（开源版）
   *
  许可协议：
  本项目基于 Apache License 2.0 开源协议发布，
  允许在遵守协议的前提下进行商用、修改和分发。
   *
  特别说明：
  所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
  如需定制品牌，请通过官方渠道申请品牌定制授权。
   *
  更多信息请访问：https://qmodel.qiantong.tech/business.html
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
