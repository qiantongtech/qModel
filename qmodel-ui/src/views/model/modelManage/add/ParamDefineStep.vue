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
  <div class="param-define-step">
    <div class="section-title">
      <span class="title-line"></span>
      <span>参数定义</span>
      <el-tooltip content="不会写 JSON Schema？可点击右上角导入示例数据自动生成">
        <el-icon class="title-tip"><QuestionFilled /></el-icon>
      </el-tooltip>
    </div>

    <div class="toolbar">
      <el-radio-group v-model="activeTab" size="small">
        <el-radio-button label="input">入参 Schema</el-radio-button>
        <el-radio-button label="output">出参 Schema</el-radio-button>
      </el-radio-group>
      <div class="toolbar-actions">
        <el-button size="small" :icon="MagicStick" @click="openGenDialog">
          导入示例数据生成
        </el-button>
        <el-button size="small" type="primary" :icon="Brush" @click="formatCurrentSchema">
          格式化 Schema
        </el-button>
      </div>
    </div>

    <el-row :gutter="20" class="schema-row">
      <el-col :span="12">
        <div class="editor-card">
          <div class="editor-header">
            <span><el-icon><Document /></el-icon> JSON Schema 编辑区</span>
          </div>
          <el-input
            v-model="currentSchemaText"
            type="textarea"
            :rows="22"
            placeholder='请输入 JSON Schema，例如：&#10;{&#10;  "type": "object",&#10;  "properties": {&#10;    "name": { "type": "string" }&#10;  }&#10;}'
            class="schema-textarea"
          />
          <div v-if="parseError" class="error-msg">
            <el-icon><Warning /></el-icon> {{ parseError }}
          </div>
        </div>
      </el-col>
      <el-col :span="12">
        <div class="preview-card">
          <div class="preview-header">
            <span><el-icon><View /></el-icon> 实时结构预览</span>
          </div>
          <div class="preview-body">
            <SchemaPreview v-if="currentSchema" :schema="currentSchema" />
            <el-empty v-else description="左侧输入合法的 JSON Schema 后，此处将实时展示结构" />
          </div>
        </div>
      </el-col>
    </el-row>

    <el-dialog v-model="genDialogVisible" title="导入示例数据生成 Schema" width="600px">
      <el-input
        v-model="sampleJsonText"
        type="textarea"
        :rows="12"
        placeholder='请输入示例 JSON，例如：&#10;{&#10;  "name": "",&#10;  "age": 0&#10;}'
      />
      <div v-if="sampleError" class="dialog-error">{{ sampleError }}</div>
      <template #footer>
        <el-button @click="genDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="generateFromSample">生成并覆盖</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="ParamDefineStep">
import { ref, computed, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { Document, View, Brush, MagicStick, Warning, QuestionFilled } from '@element-plus/icons-vue'
import SchemaPreview from './SchemaPreview.vue'

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const activeTab = ref('input')
const parseError = ref('')
const parsedSchema = ref(null)
const genDialogVisible = ref(false)
const sampleJsonText = ref('')
const sampleError = ref('')

const schemaKey = computed(() => (activeTab.value === 'input' ? 'inputSchema' : 'outputSchema'))

const currentSchemaText = computed({
  get() {
    return formData.value[schemaKey.value] || ''
  },
  set(val) {
    formData.value[schemaKey.value] = val
  }
})

const currentSchema = computed(() => parsedSchema.value)

const updateParsedSchema = () => {
  parseError.value = ''
  parsedSchema.value = null
  const text = currentSchemaText.value?.trim()
  if (!text) return
  try {
    const parsed = JSON.parse(text)
    if (parsed && typeof parsed === 'object') {
      parsedSchema.value = parsed
    } else {
      parseError.value = 'Schema 必须是对象'
    }
  } catch (e) {
    parseError.value = 'JSON 格式错误：' + e.message
  }
}

watch(currentSchemaText, updateParsedSchema, { immediate: true })

watch(activeTab, () => {
  parseError.value = ''
  updateParsedSchema()
})

const openGenDialog = () => {
  sampleJsonText.value = ''
  sampleError.value = ''
  genDialogVisible.value = true
}

const formatCurrentSchema = () => {
  const text = currentSchemaText.value?.trim()
  if (!text) return
  try {
    const parsed = JSON.parse(text)
    currentSchemaText.value = JSON.stringify(parsed, null, 2)
  } catch (e) {
    ElMessage.error('格式化失败：' + e.message)
  }
}

const generateFromSample = () => {
  sampleError.value = ''
  const text = sampleJsonText.value.trim()
  if (!text) {
    sampleError.value = '请输入示例 JSON'
    return
  }
  try {
    const data = JSON.parse(text)
    const schema = inferSchema(data)
    currentSchemaText.value = JSON.stringify(schema, null, 2)
    genDialogVisible.value = false
    sampleJsonText.value = ''
    ElMessage.success('Schema 生成成功')
  } catch (e) {
    sampleError.value = 'JSON 解析失败：' + e.message
  }
}

function inferSchema(data) {
  if (data === null) return { type: 'null' }
  if (Array.isArray(data)) {
    const items = data.length > 0 ? inferSchema(data[0]) : {}
    return { type: 'array', items }
  }
  if (typeof data === 'object') {
    const properties = {}
    const required = Object.keys(data)
    for (const key of required) {
      properties[key] = inferSchema(data[key])
    }
    return { type: 'object', properties, required }
  }
  return { type: typeof data }
}

const validate = () => {
  const errors = []
  const tabs = [
    { key: 'inputSchema', label: '入参 Schema' },
    { key: 'outputSchema', label: '出参 Schema' }
  ]
  for (const tab of tabs) {
    const text = (formData.value[tab.key] || '').trim()
    if (text) {
      try {
        const parsed = JSON.parse(text)
        if (!parsed || typeof parsed !== 'object') {
          errors.push(`${tab.label} 必须是 JSON 对象`)
        }
      } catch {
        errors.push(`${tab.label} JSON 格式错误`)
      }
    }
  }
  if (errors.length > 0) {
    return Promise.reject(errors.join('；'))
  }
  return Promise.resolve()
}

defineExpose({
  validate
})
</script>

<style lang="scss" scoped>
.param-define-step {
  padding: 20px 0;
}

.section-title {
  display: flex;
  align-items: center;
  font-size: 16px;
  font-weight: 500;
  color: #303133;
  margin-bottom: 20px;

  .title-line {
    width: 4px;
    height: 16px;
    background-color: #409eff;
    margin-right: 8px;
    border-radius: 2px;
  }

  .title-tip {
    margin-left: 8px;
    color: #909399;
    cursor: pointer;
  }
}

.toolbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;

  .toolbar-actions {
    display: flex;
    gap: 10px;
  }
}

.schema-row {
  .editor-card,
  .preview-card {
    border: 1px solid #e4e7ed;
    border-radius: 4px;
    overflow: hidden;
    height: 100%;
    min-height: 520px;
    display: flex;
    flex-direction: column;
  }

  .editor-header,
  .preview-header {
    padding: 12px 15px;
    background-color: #f5f7fa;
    border-bottom: 1px solid #e4e7ed;
    font-size: 14px;
    font-weight: 500;
    color: #303133;
    display: flex;
    align-items: center;
    gap: 6px;
  }

  .schema-textarea {
    flex: 1;

    :deep(.el-textarea__inner) {
      border: none;
      border-radius: 0;
      font-family: 'Consolas', 'Monaco', monospace;
      resize: none;
      height: 100% !important;
      min-height: 470px;
    }
  }

  .preview-body {
    flex: 1;
    padding: 15px;
    overflow: auto;
  }

  .error-msg {
    padding: 8px 12px;
    color: #f56c6c;
    font-size: 13px;
    background-color: #fef0f0;
    display: flex;
    align-items: center;
    gap: 6px;
  }
}

.dialog-error {
  margin-top: 10px;
  color: #f56c6c;
  font-size: 13px;
}
</style>
