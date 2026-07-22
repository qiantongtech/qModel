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

let props = defineProps({

  nodeUser: {
    type: Object,
    dafault: () => {
    }
  },
  row: {
    type: Array,
    dafault: () => []
  },
  disableSelect: {
    type: Boolean,
    default: false
  }

});



import FlowNodeFormatContent from "./FlowNodeFormatContent.vue";

</script>

<template>
  <div style="padding: 10px">

    <el-timeline :reverse="false" style="border: 0px solid red;">
      <flow-node-format-content :disable-select="disableSelect"
      :node-user="nodeUser"
                                :row="row"
      ></flow-node-format-content>
    </el-timeline>


  </div>
</template>

<style scoped lang="less">
ul{
  padding: 0px;
}
</style>
