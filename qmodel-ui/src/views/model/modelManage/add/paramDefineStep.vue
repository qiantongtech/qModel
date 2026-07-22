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
  <div class="param-define-step">
    <div class="h2-titles">参数定义</div>

    <el-form
      ref="paramFormRef"
      :model="formData"
      :rules="rules"
      label-width="0"
      class="param-form"
    >
      <el-row :gutter="20" class="schema-row">
        <el-col :span="12">
          <el-form-item prop="inputSchema" class="schema-form-item">
            <div class="editor-card">
              <div class="editor-header">
                <span><el-icon><Document /></el-icon> JSON Schema 编辑区</span>
                <el-button size="small" type="primary" :icon="Brush" :disabled="!canFormat" @click="formatCurrentSchema">
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
            </div>
          </el-form-item>
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
    </el-form>
  </div>
</template>

<script setup name="ParamDefineStep">
import { ref, computed, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { Document, View, Brush } from '@element-plus/icons-vue'
import SchemaPreview from './schemaPreview.vue'

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const parseError = ref('')
const parsedSchema = ref(null)
const paramFormRef = ref(null)

const validateInputSchema = (rule, value, callback) => {
  const text = (value || '').trim()
  if (!text) {
    return callback(new Error('请输入 JSON Schema 参数'))
  }
  try {
    const parsed = JSON.parse(text)
    if (!parsed || typeof parsed !== 'object') {
      return callback(new Error('入参 Schema 必须是 JSON 对象'))
    }
    if (parsed.type !== 'object') {
      return callback(new Error('入参 Schema 根节点 type 必须为 object'))
    }
    if (!parsed.properties || Object.keys(parsed.properties).length === 0) {
      return callback(new Error('入参 Schema 至少需要定义一个参数'))
    }
    callback()
  } catch (e) {
    callback(new Error('入参 Schema JSON 格式错误：' + e.message))
  }
}

const rules = {
  inputSchema: [{ required: true, validator: validateInputSchema, trigger: ['change', 'blur'] }]
}

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

const canFormat = computed(() => {
  const text = (formData.value.inputSchema || '').trim()
  if (!text) return false
  try {
    JSON.parse(text)
    return true
  } catch {
    return false
  }
})

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
  return paramFormRef.value.validate()
}

defineExpose({
  validate
})
</script>

<style lang="scss" scoped>
.param-define-step {
  height: 100%;
  display: flex;
  flex-direction: column;
}

.param-form {
  flex: 1;
  min-height: 0;
  display: flex;
  flex-direction: column;
}

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
  align-items: stretch;
  flex: 1;
  min-height: 0;

  .editor-card,
  .preview-card {
    border: 1px solid #e4e7ed;
    border-radius: 4px;
    overflow: hidden;
    height: 100%;
    min-height: 0;
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

    span {
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }
  }

  .schema-form-item {
    width: 100%;
    margin-bottom: 0;
    height: 100%;
    position: relative;

    :deep(.el-form-item__content) {
      display: block;
      line-height: normal;
      height: 100%;
    }

    :deep(.el-form-item__error) {
      position: absolute;
      bottom: -26px;
      left: 0;
      padding-top: 4px;
      font-size: 14px;
    }

    &.is-error .schema-textarea :deep(.el-textarea__inner) {
      border: 1px solid var(--el-color-danger);
    }
  }

  .schema-textarea {
    flex: 1;

    :deep(.el-textarea__inner) {
      border: none;
      border-radius: 0;
      font-family: 'Consolas', 'Monaco', monospace;
      resize: none;
      height: 100% !important;
      min-height: 0;
    }
  }

  .preview-body {
    flex: 1;
    padding: 15px;
    overflow: auto;
  }
}
</style>
