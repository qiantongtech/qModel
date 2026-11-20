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
      <span
        v-if="editable && path.length > 0"
        class="node-default-editor"
        :class="{ 'is-complex': isArrayOrObject }"
        @click.stop
      >
        <span class="default-label">默认值</span>
        <el-input-number
          v-if="isNumber"
          v-model="defaultDraft"
          size="small"
          :controls="false"
          :precision="schema.type === 'integer' ? 0 : undefined"
          placeholder="未设置"
          @change="commitDefault"
        />
        <el-select
          v-else-if="isBoolean"
          v-model="defaultDraft"
          size="small"
          clearable
          placeholder="未设置"
          @change="commitDefault"
        >
          <el-option label="true" :value="true" />
          <el-option label="false" :value="false" />
        </el-select>
        <el-input
          v-else
          v-model="defaultDraft"
          size="small"
          clearable
          :placeholder="isArrayOrObject ? 'JSON 格式' : '未设置'"
          @change="commitDefault"
        />
      </span>
      <span v-else-if="hasDefault" class="node-default" :title="defaultText">默认: {{ defaultText }}</span>
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
          :path="[...path, key]"
          :editable="editable"
          @update-default="(payload) => emit('updateDefault', payload)"
        />
      </template>
      <template v-if="isArray">
        <SchemaNode
          :schema="schema.items || {}"
          name="items"
          :required="false"
          :level="level + 1"
          :editable="false"
        />
      </template>
    </div>
  </div>
</template>

<script setup name="SchemaNode">
import { ref, computed, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { ArrowRight } from '@element-plus/icons-vue'
import { hasSchemaDefault, formatSchemaDefault } from '@/utils/modelSchema'

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
  },
  // 从根节点到当前节点的属性名路径，用于定位默认值写回位置
  path: {
    type: Array,
    default: () => []
  },
  // 是否允许编辑默认值（API / PYTHON 类型模型的参数定义均开启）
  editable: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['updateDefault'])

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

const isNumber = computed(() => props.schema.type === 'integer' || props.schema.type === 'number')
const isBoolean = computed(() => props.schema.type === 'boolean')
const isArrayOrObject = computed(() => props.schema.type === 'array' || props.schema.type === 'object')
const hasDefault = computed(() => hasSchemaDefault(props.schema))
const defaultText = computed(() => formatSchemaDefault(props.schema.default))

/** 将 Schema 默认值转换为编辑控件的草稿值 */
const toDraft = (def, type) => {
  if (def === undefined || def === null) {
    if (type === 'integer' || type === 'number') return null
    if (type === 'boolean') return undefined
    return ''
  }
  if (type === 'integer' || type === 'number') {
    const num = Number(def)
    return Number.isNaN(num) ? null : num
  }
  if (type === 'boolean') {
    return typeof def === 'boolean' ? def : String(def).toLowerCase() === 'true'
  }
  if (typeof def === 'object') return JSON.stringify(def)
  return String(def)
}

const defaultDraft = ref(toDraft(props.schema.default, props.schema.type))

// Schema 外部变化（编辑区输入、默认值写回后重新解析）时同步草稿值
watch(
  () => props.schema.default,
  (val) => {
    defaultDraft.value = toDraft(val, props.schema.type)
  }
)

/** 提交默认值编辑，空值表示移除 default 关键字 */
const commitDefault = (raw) => {
  const type = props.schema.type
  let value
  let remove = false

  if (type === 'integer' || type === 'number') {
    if (raw === null || raw === undefined || raw === '') {
      remove = true
    } else {
      value = raw
    }
  } else if (type === 'boolean') {
    if (raw === '' || raw === null || raw === undefined) {
      remove = true
    } else {
      value = raw === true || raw === 'true'
    }
  } else if (type === 'array' || type === 'object') {
    const text = String(raw ?? '').trim()
    if (!text) {
      remove = true
    } else {
      try {
        value = JSON.parse(text)
      } catch {
        ElMessage.error(`参数「${props.name}」默认值不是合法 JSON`)
        defaultDraft.value = toDraft(props.schema.default, type)
        return
      }
      if (type === 'array' && !Array.isArray(value)) {
        ElMessage.error(`参数「${props.name}」默认值必须是 JSON 数组`)
        defaultDraft.value = toDraft(props.schema.default, type)
        return
      }
      if (type === 'object' && (typeof value !== 'object' || value === null || Array.isArray(value))) {
        ElMessage.error(`参数「${props.name}」默认值必须是 JSON 对象`)
        defaultDraft.value = toDraft(props.schema.default, type)
        return
      }
    }
  } else {
    const text = raw ?? ''
    if (text === '') {
      remove = true
    } else {
      value = text
    }
  }

  emit('updateDefault', { path: props.path, value, remove })
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
    min-width: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .node-default-editor {
    margin-left: auto;
    padding-left: 8px;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    flex-shrink: 0;
    user-select: text;

    .default-label {
      color: #909399;
      font-size: 12px;
      flex-shrink: 0;
    }

    .el-input,
    .el-select,
    .el-input-number {
      width: 150px;
    }

    // 关闭 hover 过渡，且 hover 阴影与常态一致，避免鼠标悬浮时边框闪动
    :deep(.el-input__wrapper),
    :deep(.el-select__wrapper) {
      position: relative;
      transition: none !important;
    }

    :deep(.el-input__wrapper:hover) {
      box-shadow: 0 0 0 1px var(--el-input-border-color) inset;
    }

    :deep(.el-select__wrapper:hover) {
      box-shadow: 0 0 0 1px var(--el-border-color) inset;
    }

    // clearable 的清除图标由 hover 触发显示，若参与 flex 布局会使输入区宽度变窄，
    // 居中文本随之左右跳动；改为绝对定位后输入区宽度恒定
    :deep(.el-input__suffix),
    :deep(.el-select__suffix) {
      position: absolute;
      right: 8px;
      top: 50%;
      transform: translateY(-50%);
      z-index: 1;
    }

    // el-input-number 自带文字居中，普通 el-input 默认左对齐；
    // 统一默认值输入框的占位符/输入值对齐，避免同一列样式不一致
    :deep(input) {
      text-align: center;
    }

    // el-select 的选中值渲染在 .el-select__placeholder 上而不是 input，
    // 上面那条管不到；该元素同时带 .el-select__selected-item（display: flex），
    // 所以 text-align 与 justify-content 都要给，否则布尔类默认值与相邻输入框对不齐
    :deep(.el-select__placeholder) {
      justify-content: center;
      text-align: center;
    }

    // 数组/对象默认值是 JSON 文本，给更宽的输入区域
    &.is-complex .el-input {
      width: 260px;
    }
  }

  .node-default {
    margin-left: auto;
    padding-left: 8px;
    color: #67c23a;
    font-size: 12px;
    flex-shrink: 0;
    max-width: 220px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
}
</style>
