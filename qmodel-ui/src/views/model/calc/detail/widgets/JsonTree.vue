<!--
  Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.

  This file is part of qModel Module Platform (Open Source Edition).

  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.

  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.

  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<template>
  <div class="json-tree">
    <JsonNode :data="data" node-key="" :depth="0" />
  </div>
</template>

<script setup name="JsonTree">
import { ref, watch, provide } from 'vue';
import JsonNode from './JsonNode.vue';

const props = defineProps({
  data: {
    type: [Object, Array, String, Number, Boolean],
    default: null
  },
  defaultExpanded: {
    type: Boolean,
    default: true
  }
});

const expandedKeys = ref(new Set());

function isExpandable(value) {
  return value !== null && (Array.isArray(value) || typeof value === 'object');
}

function collectKeys(value, prefix) {
  const keys = new Set();
  if (!isExpandable(value)) return keys;
  keys.add(prefix);
  if (Array.isArray(value)) {
    value.forEach((item, index) => {
      const childKey = `${prefix}[${index}]`;
      const childKeys = collectKeys(item, childKey);
      childKeys.forEach((k) => keys.add(k));
    });
  } else {
    Object.keys(value).forEach((k) => {
      const childKey = prefix ? `${prefix}.${k}` : k;
      const childKeys = collectKeys(value[k], childKey);
      childKeys.forEach((key) => keys.add(key));
    });
  }
  return keys;
}

function expandAll() {
  expandedKeys.value = collectKeys(props.data, '');
}

function collapseAll() {
  expandedKeys.value = new Set();
}

provide('jsonTreeExpandedKeys', expandedKeys);
provide('jsonTreeToggle', (key) => {
  if (expandedKeys.value.has(key)) {
    expandedKeys.value.delete(key);
  } else {
    expandedKeys.value.add(key);
  }
});

watch(
  () => props.data,
  (newData) => {
    if (props.defaultExpanded) {
      expandedKeys.value = collectKeys(newData, '');
    } else {
      expandedKeys.value = new Set();
    }
  },
  { immediate: true, deep: true }
);

defineExpose({
  expandAll,
  collapseAll
});
</script>

<style lang="scss" scoped>
.json-tree {
  font-family: "Consolas", "Monaco", "Courier New", monospace;
  font-size: 14px;
  line-height: 1.8;
  color: #1f2328;
  overflow: auto;
}
</style>
