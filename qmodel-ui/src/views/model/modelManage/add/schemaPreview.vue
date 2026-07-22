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

<template>
  <div class="schema-preview">
    <SchemaNode :schema="schema" name="root" :required="true" />
  </div>
</template>

<script setup name="SchemaPreview">
import SchemaNode from './schemaNode.vue'

defineProps({
  schema: {
    type: Object,
    required: true
  }
})
</script>

<style lang="scss" scoped>
.schema-preview {
  font-family: 'Consolas', 'Monaco', 'PingFang SC', sans-serif;
  font-size: 14px;
}
</style>
