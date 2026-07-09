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
    <div class="h2-titles">参数定义</div>

    <el-row :gutter="20" class="schema-row">
      <el-col :span="12">
        <div class="editor-card">
          <div class="editor-header">
            <span><el-icon><Document /></el-icon> JSON Schema 编辑区</span>
            <el-button size="small" type="primary" :icon="Brush" @click="formatCurrentSchema">
              格式化 Schema
            </el-button>
          </div>
          <el-input
            v-model="formData.inputSchema"
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


  </div>
</template>

<script setup name="ParamDefineStep">
import { ref, computed, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { Document, View, Brush, Warning, QuestionFilled } from '@element-plus/icons-vue'
import SchemaPreview from './SchemaPreview.vue'

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const parseError = ref('')
const parsedSchema = ref(null)

const currentSchemaText = computed({
  get() {
    return formData.value.inputSchema || ''
  },
  set(val) {
    formData.value.inputSchema = val
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

const validate = () => {
  const text = (formData.value.inputSchema || '').trim()
  if (text) {
    try {
      const parsed = JSON.parse(text)
      if (!parsed || typeof parsed !== 'object') {
        return Promise.reject('入参 Schema 必须是 JSON 对象')
      }
    } catch {
      return Promise.reject('入参 Schema JSON 格式错误')
    }
  }
  return Promise.resolve()
}

defineExpose({
  validate
})
</script>

<style lang="scss" scoped>
.h2-titles {
  font-size: 16px;
  color: rgba(0, 0, 0, 0.85);
  display: flex;
  align-items: center;
  font-weight: 500;
  margin: 8px 0;
}

.h2-titles::before {
  display: inline-block;
  content: '';
  width: 6px;
  height: 16px;
  border-radius: 3px;
  background: var(--el-color-primary);
  margin-right: 8px;
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
    justify-content: space-between;
    gap: 6px;
    height: 48px;
    box-sizing: border-box;
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
</style>
