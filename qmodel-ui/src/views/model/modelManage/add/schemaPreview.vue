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
