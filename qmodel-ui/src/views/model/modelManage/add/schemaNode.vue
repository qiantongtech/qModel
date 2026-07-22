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
  <div class="schema-node" :style="{ marginLeft: level > 0 ? '20px' : '0' }">
    <div class="node-line" @click="toggleExpand">
      <span v-if="hasChildren" class="expand-icon" :class="{ collapsed: !expanded }">
        <el-icon><ArrowRight /></el-icon>
      </span>
      <span v-else class="expand-placeholder"></span>
      <span class="node-name">{{ displayName }}</span>
      <span class="node-type">[{{ displayType }}]</span>
      <span v-if="isRequired" class="node-required">必填</span>
      <span v-if="schema.description" class="node-desc">{{ schema.description }}</span>
    </div>

    <div v-if="expanded && hasChildren" class="node-children">
      <template v-if="isObject">
        <SchemaNode
          v-for="(subSchema, key) in schema.properties"
          :key="key"
          :schema="subSchema"
          :name="key"
          :required="requiredSet.has(key)"
          :level="level + 1"
        />
      </template>
      <template v-if="isArray">
        <SchemaNode
          :schema="schema.items || {}"
          name="items"
          :required="false"
          :level="level + 1"
        />
      </template>
    </div>
  </div>
</template>

<script setup name="SchemaNode">
import { ref, computed } from 'vue'
import { ArrowRight } from '@element-plus/icons-vue'

const props = defineProps({
  schema: {
    type: Object,
    required: true
  },
  name: {
    type: String,
    default: ''
  },
  required: {
    type: Boolean,
    default: false
  },
  level: {
    type: Number,
    default: 0
  }
})

const expanded = ref(true)

const displayName = computed(() => props.name)

const displayType = computed(() => {
  const type = props.schema.type
  if (Array.isArray(type)) return type.join(' | ')
  if (type) return type
  if (props.schema.properties) return 'object'
  if (props.schema.items) return 'array'
  return 'any'
})

const isObject = computed(() => {
  const type = props.schema.type
  return type === 'object' || (!!props.schema.properties && !type)
})

const isArray = computed(() => {
  const type = props.schema.type
  return type === 'array' || (!!props.schema.items && !type)
})

const hasChildren = computed(() => {
  return isObject.value || isArray.value
})

const requiredSet = computed(() => {
  const required = props.schema.required
  return new Set(Array.isArray(required) ? required : [])
})

const isRequired = computed(() => {
  return props.required
})

const toggleExpand = () => {
  if (hasChildren.value) {
    expanded.value = !expanded.value
  }
}
</script>

<style lang="scss" scoped>
.schema-node {
  .node-line {
    display: flex;
    align-items: center;
    padding: 4px 0;
    cursor: default;
    user-select: none;

    &:hover {
      background-color: #f5f7fa;
    }
  }

  .expand-icon,
  .expand-placeholder {
    width: 16px;
    height: 16px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    margin-right: 4px;
  }

  .expand-icon {
    cursor: pointer;
    transition: transform 0.2s;

    &.collapsed {
      transform: rotate(0deg);
    }

    &:not(.collapsed) {
      transform: rotate(90deg);
    }
  }

  .node-name {
    color: #303133;
    font-weight: 500;
    margin-right: 6px;
  }

  .node-type {
    color: #409eff;
    margin-right: 6px;
  }

  .node-required {
    color: #f56c6c;
    font-size: 12px;
    margin-right: 6px;
  }

  .node-desc {
    color: #909399;
    font-size: 12px;
  }
}
</style>
