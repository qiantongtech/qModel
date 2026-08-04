<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.

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
  <div v-if="type === 'array'" class="json-node">
    <div v-if="data.length === 0" class="json-line" :style="lineStyle">
      <span class="json-bracket">[</span>
      <span class="json-bracket">]</span>
    </div>
    <template v-else>
      <div
        class="json-line"
        :class="{ 'json-collapsed': !isExpanded }"
        :style="lineStyle"
        @click.self="toggle"
      >
        <span class="json-toggle" @click.stop="toggle">
          <el-icon><CaretRight v-if="!isExpanded" /><CaretBottom v-else /></el-icon>
        </span>
        <span class="json-bracket">[</span>
        <template v-if="!isExpanded">
          <span class="json-ellipsis">...{{ data.length }} 项</span>
          <span class="json-bracket">]</span>
        </template>
      </div>
      <template v-if="isExpanded">
        <div
          v-for="(item, index) in data"
          :key="childKey(index)"
          class="json-line"
          :style="childLineStyle"
        >
          <JsonNode
            :data="item"
            :node-key="childKey(index, true)"
            :depth="depth + 1"
            :show-comma="index < data.length - 1"
          />
        </div>
        <div class="json-line" :style="lineStyle">
          <span class="json-bracket">]</span>
          <span v-if="showComma" class="json-comma">,</span>
        </div>
      </template>
    </template>
  </div>

  <div v-else-if="type === 'object'" class="json-node">
    <div v-if="keys.length === 0" class="json-line" :style="lineStyle">
      <span class="json-bracket">{</span>
      <span class="json-bracket">}</span>
    </div>
    <template v-else>
      <div
        class="json-line"
        :class="{ 'json-collapsed': !isExpanded }"
        :style="lineStyle"
        @click.self="toggle"
      >
        <span class="json-toggle" @click.stop="toggle">
          <el-icon><CaretRight v-if="!isExpanded" /><CaretBottom v-else /></el-icon>
        </span>
        <span class="json-bracket">{</span>
        <template v-if="!isExpanded">
          <span class="json-ellipsis">...{{ keys.length }} 项</span>
          <span class="json-bracket">}</span>
        </template>
      </div>
      <template v-if="isExpanded">
        <div
          v-for="(key, index) in keys"
          :key="childKey(key)"
          class="json-line"
          :style="childLineStyle"
        >
          <span class="json-key">"{{ key }}"</span>
          <span class="json-colon">: </span>
          <JsonNode
            :data="data[key]"
            :node-key="childKey(key)"
            :depth="depth + 1"
            :show-comma="index < keys.length - 1"
          />
        </div>
        <div class="json-line" :style="lineStyle">
          <span class="json-bracket">}</span>
          <span v-if="showComma" class="json-comma">,</span>
        </div>
      </template>
    </template>
  </div>

  <span v-else :class="`json-value json-${type}`">
    {{ displayString }}
    <span v-if="showComma" class="json-comma">,</span>
    <span
      v-if="isLongString"
      class="string-toggle"
      @click.stop="isStringExpanded = !isStringExpanded"
    >
      {{ isStringExpanded ? '收起' : '展开' }}
    </span>
  </span>
</template>

<script setup name="JsonNode">
import { computed, inject, ref } from 'vue';
import { ElIcon } from 'element-plus';
import { CaretRight, CaretBottom } from '@element-plus/icons-vue';

const props = defineProps({
  data: {
    type: [Object, Array, String, Number, Boolean],
    default: null
  },
  nodeKey: {
    type: String,
    default: ''
  },
  depth: {
    type: Number,
    default: 0
  },
  showComma: {
    type: Boolean,
    default: false
  }
});

const expandedKeys = inject('jsonTreeExpandedKeys');
const toggleKey = inject('jsonTreeToggle');

const STRING_TRUNCATE_LENGTH = 200;
const isStringExpanded = ref(false);

const isLongString = computed(() => type.value === 'string' && String(props.data).length > STRING_TRUNCATE_LENGTH);

const displayString = computed(() => {
  if (type.value !== 'string') {
    return formatValue(props.data);
  }
  const value = String(props.data);
  if (isStringExpanded.value || value.length <= STRING_TRUNCATE_LENGTH) {
    return `"${value}"`;
  }
  return `"${value.slice(0, STRING_TRUNCATE_LENGTH)}..."`;
});

const type = computed(() => {
  if (props.data === null) return 'null';
  if (Array.isArray(props.data)) return 'array';
  return typeof props.data;
});

const keys = computed(() => (type.value === 'object' ? Object.keys(props.data) : []));

const isExpanded = computed(() => expandedKeys.value.has(props.nodeKey));

const lineStyle = computed(() => ({
  textIndent: `${props.depth * 20}px`
}));

const childLineStyle = computed(() => ({
  textIndent: `${(props.depth + 1) * 20}px`
}));

function getType(value) {
  if (value === null) return 'null';
  if (Array.isArray(value)) return 'array';
  return typeof value;
}

function formatValue(value) {
  const t = getType(value);
  if (t === 'string') return `"${value}"`;
  if (t === 'null') return 'null';
  return String(value);
}

function childKey(keyOrIndex, isArrayItem = false) {
  if (!props.nodeKey) return isArrayItem ? `[${keyOrIndex}]` : String(keyOrIndex);
  return isArrayItem ? `${props.nodeKey}[${keyOrIndex}]` : `${props.nodeKey}.${keyOrIndex}`;
}

function toggle() {
  if (toggleKey) {
    toggleKey(props.nodeKey);
  }
}
</script>

<style lang="scss" scoped>
.json-line {
  white-space: normal;
  word-break: break-all;
}

.json-collapsed {
  cursor: pointer;
}

.json-toggle {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 18px;
  height: 18px;
  cursor: pointer;
  color: #6e7781;
  vertical-align: middle;
  margin-right: 2px;

  &:hover {
    color: #0969da;
  }

  .el-icon {
    font-size: 13px;
  }
}

.json-key {
  color: #0550ae;
  font-weight: 500;
}

.json-colon {
  color: #1f2328;
}

.json-comma {
  color: #1f2328;
}

.json-bracket {
  color: #1f2328;
}

.json-ellipsis {
  color: #6e7781;
  margin: 0 4px;
}

.json-value {
  &.json-string {
    color: #0a3069;
  }

  &.json-number {
    color: #0550ae;
  }

  &.json-boolean {
    color: #0550ae;
  }

  &.json-null {
    color: #6e7781;
  }
}

.string-toggle {
  color: #0969da;
  cursor: pointer;
  margin-left: 4px;
  user-select: none;
  font-size: 12px;

  &:hover {
    text-decoration: underline;
  }
}
</style>
