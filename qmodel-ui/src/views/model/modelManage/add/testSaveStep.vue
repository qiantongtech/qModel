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
  <div class="test-save-step">
    <div class="test-card">
      <div class="test-card-header">
        <div class="h2-titles">测试请求</div>
        <el-button
          type="primary"
          size="default"
          :loading="testing"
          :icon="VideoPlay"
          @click="handleTest"
        >
          调用测试
        </el-button>
      </div>

      <div class="form-body">
        <el-table
          v-if="fieldList.length > 0"
          :data="fieldList"
          class="param-table"
          style="width: 100%"
          max-height="200"
        >
          <el-table-column label="参数名" prop="key" min-width="160" />
          <el-table-column label="是否必填" min-width="90" align="center">
            <template #default="{ row }">
              <span>{{ row.required ? '是' : '否' }}</span>
            </template>
          </el-table-column>
          <el-table-column label="参数值" min-width="220" >
            <template #default="{ row }">
              <el-input
                v-if="row.displayType === 'string'"
                v-model="formValues[row.key]"
                placeholder="请输入参数值"
                clearable
              />
              <el-input-number
                v-else-if="row.displayType === 'integer' || row.displayType === 'number'"
                v-model="formValues[row.key]"
                placeholder="请输入参数值"
                :precision="row.displayType === 'integer' ? 0 : 2"
                controls-position="right"
                style="width: 100%"
              />
              <div
                v-else-if="row.displayType === 'file'"
                class="file-upload-wrapper"
              >
                <FileUpload
                  :model-value="formValues[row.key] || ''"
                  :limit="1"
                  :file-size="200"
                  :drag-flag="false"
                  @update:model-value="(val) => handleFileUpload(val, row.key)"
                />
              </div>
              <el-input
                v-else
                v-model="formValues[row.key]"
                :placeholder="`请输入${row.title}`"
                clearable
              />
            </template>
          </el-table-column>
          <el-table-column label="类型" min-width="130">
            <template #default="{ row }">
              <el-select
                :model-value="row.displayType"
                @change="(val) => handleTypeChange(row.key, val)"
                disabled
              >
                <el-option
                  v-for="opt in typeOptions"
                  :key="opt.value"
                  :label="opt.label"
                  :value="opt.value"
                />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="说明" min-width="260">
            <template #default="{ row }">
              <el-input :model-value="row.description || row.title" disabled />
            </template>
          </el-table-column>
        </el-table>

        <el-empty v-else description="请在第三步定义入参 JSON Schema" />
      </div>

      <div v-if="validateError" class="error-msg">
        <el-icon><Warning /></el-icon> {{ validateError }}
      </div>
    </div>

    <!-- 执行结果与结果定义 -->
    <div class="compare-info">
      <!-- 左侧：执行日志 -->
      <div class="border-item log-card">
        <div class="border-item-head">
          <span class="h2-titles">执行结果及日志</span>
        </div>
        <div class="border-item-body">
          <div ref="logRef" class="log-body">
            <div v-for="(line, index) in logs" :key="index" :class="['log-line', line.type]">
              <span class="log-time">{{ line.time }}</span>
              <span class="log-content">{{ line.content }}</span>
            </div>
            <div v-if="logs.length === 0" class="log-empty">
              > 等待发起测试<br/>
              > 返回结果将展示在此处
            </div>
          </div>
        </div>
      </div>

      <!-- 右侧：结果定义 -->
      <div class="border-item definition-card">
        <div class="border-item-head">
          <span class="h2-titles">结果定义</span>
        </div>
        <div class="border-item-body">
          <el-table :data="outputFields" stripe style="width: 100%" height="300">
            <el-table-column prop="field" label="字段" min-width="150" :show-overflow-tooltip="{ effect: 'light' }" />
            <el-table-column label="名称" min-width="120">
              <template #default="scope">
                <el-input v-model="scope.row.name" placeholder="请输入名称" />
              </template>
            </el-table-column>
            <el-table-column label="示例" min-width="120">
              <template #default="scope">
                <el-input v-model="scope.row.example" placeholder="请输入示例" />
              </template>
            </el-table-column>
            <el-table-column label="说明" min-width="150">
              <template #default="scope">
                <el-input v-model="scope.row.description" placeholder="请输入字段说明" />
              </template>
            </el-table-column>
            <template #empty>
              <el-empty :image-size="60" description="暂无返回结果，请先发起测试" />
            </template>
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup name="TestSaveStep">
import { ref, reactive, computed, watch, nextTick, getCurrentInstance } from 'vue'
import { VideoPlay, Warning } from '@element-plus/icons-vue'
import Ajv from 'ajv'
import FileUpload from '@/components/FileUpload2'
import { testModelConfig } from '@/api/model/config'

const { proxy } = getCurrentInstance()

const {
  model_access_mode
} = proxy.useDict(
  'model_access_mode'
)

// 请求方式转换
const requestMethodOptions = computed(() => {
  if (model_access_mode.value?.length) return model_access_mode.value;
  return [
    { label: 'GET', value: 'GET' },
    { label: 'POST', value: 'POST' },
    { label: 'PUT', value: 'PUT' },
    { label: 'DELETE', value: 'DELETE' }
  ];
});

/** 获取请求方式的展示文本（大写） */
const getRequestMethodLabel = (value) => {
  if (!value) return '';
  // 如果已经是 GET/POST 等，直接返回
  if (['GET', 'POST', 'PUT', 'DELETE'].includes(String(value).toUpperCase())) {
    return String(value).toUpperCase();
  }
  const option = requestMethodOptions.value.find(opt => String(opt.value) === String(value));
  return option ? option.label.toUpperCase() : String(value).toUpperCase();
};

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const ajv = new Ajv({ allErrors: true, strict: false })

const validateError = ref('')
const testing = ref(false)
const logs = ref([])
const logRef = ref(null)
const formValues = reactive({})
const fieldTypeMap = reactive({})
const outputFields = ref([])

/** 扁平化响应结果并提取字段 */
const updateOutputFields = (responseBody) => {
  try {
    const obj = JSON.parse(responseBody)
    const fields = []

    const flatten = (data, path = '') => {
      if (data === null || data === undefined) return

      if (Array.isArray(data)) {
        // 如果数组不为空且是对象数组，解析第一个元素
        if (data.length > 0 && typeof data[0] === 'object') {
          flatten(data[0], path)
        } else {
          // 如果是基础类型数组，记录路径
          if (path && !fields.find(f => f.field === path)) {
            fields.push({ field: path, name: '', example: '', description: '' })
          }
        }
      } else if (typeof data === 'object') {
        Object.keys(data).forEach(key => {
          const currentPath = path ? `${path}.${key}` : key
          const val = data[key]

          if (!fields.find(f => f.field === currentPath)) {
            fields.push({ field: currentPath, name: '', example: '', description: '' })
          }

          flatten(val, currentPath)
        })
      }
    }

    flatten(obj)

    // 合并现有数据（保留已填写的名称、示例和说明）
    const existingFields = []
    try {
      if (formData.value.outputSchema) {
        const parsed = JSON.parse(formData.value.outputSchema)
        if (Array.isArray(parsed)) existingFields.push(...parsed)
      }
    } catch (e) {}

    outputFields.value = fields.map(f => {
      const exist = existingFields.find(ef => ef.field === f.field)
      return exist ? { ...f, ...exist } : f
    })

  } catch (e) {
    console.error('解析响应体失败', e)
  }
}

// 监听输出字段变化，同步回 formData
watch(outputFields, (val) => {
  formData.value.outputSchema = JSON.stringify(val)
}, { deep: true })

// 初始化时，如果已有 outputSchema 则恢复
watch(() => formData.value.outputSchema, (val) => {
  if (val && outputFields.value.length === 0) {
    try {
      const parsed = JSON.parse(val)
      if (Array.isArray(parsed)) {
        outputFields.value = parsed
      }
    } catch (e) {}
  }
}, { immediate: true })

const typeOptions = [
  { label: 'String', value: 'string' },
  { label: 'Integer', value: 'integer' },
  { label: 'Number', value: 'number' },
  { label: 'File', value: 'file' }
]

const inputSchemaObj = computed(() => {
  const text = (formData.value.inputSchema || '').trim()
  if (!text) return null
  try {
    return JSON.parse(text)
  } catch {
    return null
  }
})

const fieldList = computed(() => {
  const schema = inputSchemaObj.value
  if (!schema || schema.type !== 'object') return []
  const props = schema.properties || {}
  const required = schema.required || []
  return Object.keys(props).map((key) => {
    const p = props[key] || {}
    const rawType = p.type || 'string'
    const currentType = fieldTypeMap[key] || rawType
    const isFile = p.format === 'binary' && !fieldTypeMap[key]
    return {
      key,
      title: p.title || key,
      description: p.description || '',
      type: currentType,
      format: p.format || '',
      displayType: isFile ? 'file' : currentType,
      required: required.includes(key)
    }
  })
})

const initFormValues = () => {
  const schema = inputSchemaObj.value
  const existingBody = parseExistingBody()
  const defaultValues = {}

  if (schema && schema.type === 'object' && schema.properties) {
    Object.keys(schema.properties).forEach((key) => {
      const p = schema.properties[key] || {}
      if (existingBody && key in existingBody) {
        defaultValues[key] = existingBody[key]
      } else if (p.type === 'integer' || p.type === 'number') {
        defaultValues[key] = undefined
      } else {
        defaultValues[key] = ''
      }
    })
  }

  Object.keys(formValues).forEach((key) => delete formValues[key])
  Object.assign(formValues, defaultValues)
}

const parseExistingBody = () => {
  const text = (formData.value.testBody || '').trim()
  if (!text) return null
  try {
    return JSON.parse(text)
  } catch {
    return null
  }
}

watch(inputSchemaObj, initFormValues, { immediate: true })

watch(
  formValues,
  () => {
    const payload = buildTestPayload()
    formData.value.testBody = JSON.stringify(payload, null, 2)
  },
  { deep: true }
)

const handleFileUpload = (val, key) => {
  formValues[key] = val || ''
}

const handleTypeChange = (key, val) => {
  fieldTypeMap[key] = val
  if (val === 'integer' || val === 'number') {
    formValues[key] = undefined
  } else {
    formValues[key] = ''
  }
}

const addLog = (content, type = 'info') => {
  const now = new Date()
  const time = `${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}:${now.getSeconds().toString().padStart(2, '0')}`
  logs.value.push({ time, content, type })
  nextTick(() => {
    if (logRef.value) {
      logRef.value.scrollTop = logRef.value.scrollHeight
    }
  })
}

const buildTestPayload = () => {
  const payload = {}
  const schema = inputSchemaObj.value
  const properties = (schema && schema.type === 'object' && schema.properties) ? schema.properties : {}
  Object.keys(formValues).forEach((key) => {
    let value = formValues[key]
    if (value !== undefined && value !== '') {
      // 获取该字段在 schema 中的定义类型
      const fieldType = properties[key]?.type
      // 如果期望是数组，并且输入的是字符串，则尝试解析为 JS 数组
      if (fieldType === 'array' ) {
        try {
          value = JSON.parse(value)

        } catch (e) {
          // 解析失败保留原字符串，交由后续 ajv 抛出校验错误
        }
      } else if (fieldType === 'object' && typeof value === 'string') {
        // 同理，如果是 object 类型也可以顺便支持解析
        try {
          value = JSON.parse(value)
        } catch (e) {
        }
      }
      payload[key] = value
    }
  })
  return payload
}

const validateTestBody = async () => {
  validateError.value = ''
  if (fieldList.value.length === 0) {
    validateError.value = '没有可测试的入参字段'
    return false
  }

  const errors = []
  fieldList.value.forEach((field) => {
    if (field.required) {
      const value = formValues[field.key]
      const isFile = field.type === 'file'
      if (isFile) {
        if (!value || !String(value).trim()) {
          errors.push(`请上传${field.title}`)
        }
      } else {
        if (value === undefined || value === '' || value === null) {
          errors.push(`请输入${field.title}`)
        }
      }
    }
  })

  if (errors.length > 0) {
    validateError.value = errors.join('；')
    return false
  }

  const body = buildTestPayload()
  const schemaText = (formData.value.inputSchema || '').trim()
  if (schemaText) {
    try {
      const schema = JSON.parse(schemaText)
      const validate = ajv.compile(schema)
      const valid = validate(body)
      if (!valid) {
        validateError.value = '不符合入参 Schema：' + validate.errors.map((e) => e.message).join('；')
        return false
      }
    } catch (e) {
      validateError.value = '入参 Schema 解析失败：' + e.message
      return false
    }
  }
  return body
}

const handleTest = async () => {
  logs.value = []
  const body = await validateTestBody()
  if (body === false) return

  testing.value = true
  addLog('开始组装请求配置...')

  try {
    const data = {
      inputSchema: formData.value.inputSchema,
      apiUrl: formData.value.apiUrl,
      requestMethod: getRequestMethodLabel(formData.value.requestMethod),
      contentType: formData.value.contentType,
      timeoutSeconds: formData.value.timeoutSeconds,
      authType: formData.value.authType,
      authMethod: formData.value.authMethod,
      authInjectPosition: formData.value.authInjectPosition,
      authKeyName: formData.value.authKeyName,
      authTokenPrefix: formData.value.authTokenPrefix,
      authTokenValue: formData.value.authTokenValue,
      authDynamicMethod: formData.value.authDynamicMethod,
      authDynamicUrl: formData.value.authDynamicUrl,
      authDynamicHeaders: formData.value.authDynamicHeaders,
      authDynamicParams: formData.value.authDynamicParams,
      authDynamicBody: formData.value.authDynamicBody,
      authExtractPath: formData.value.authExtractPath,
      testBody: JSON.stringify(body)
    }

    addLog(`请求方式：${data.requestMethod} ${data.apiUrl}`)
    addLog('正在发送测试请求...')

    const res = await testModelConfig(data)
    if (res.code === 200) {
      const result = res.data || {}
      if (result.logs && result.logs.length) {
        result.logs.forEach((item) => addLog(item))
      }
      if (result.success) {
        addLog(`测试请求成功，HTTP 状态：${result.statusCode || '-'}`, 'success')
      } else {
        addLog(`测试请求失败：${result.errorMsg || '未知错误'}`, 'error')
      }
      if (result.responseBody) {
        addLog('响应内容：')
        addLog(formatJson(result.responseBody), 'code')
        // 自动解析响应结果生成字段定义
        updateOutputFields(result.responseBody)
      }
    } else {
      addLog(res.msg || '测试请求失败', 'error')
    }
  } catch (error) {
    addLog('测试调用异常：' + (error?.msg || error?.message || '未知错误'), 'error')
  } finally {
    testing.value = false
  }
}

const formatJson = (str) => {
  try {
    return JSON.stringify(JSON.parse(str), null, 2)
  } catch {
    return str
  }
}

const validate = () => {
  return Promise.resolve()
}

defineExpose({
  validate
})
</script>

<style lang="scss" scoped>
.test-save-step {
  padding: 0 0 20px 0;
  box-sizing: border-box;
  height: 100%;
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

.h3-titles {
  margin-bottom: 15px;
}

.test-card {
  display: flex;
  flex-direction: column;
  flex: 0 0 auto;
  min-height: 0;
  margin-bottom: 20px;
}

.test-card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 15px;
  flex-shrink: 0;
}

.form-body {
  flex: 1;
  max-height: 220px;
  overflow-y: auto;
  min-height: 0;
}

.param-table {
  .el-input,
  .el-input-number,
  .el-select {
    width: 100%;
  }
}

.file-upload-wrapper {
  display: flex;
  align-items: center;
  width: 100%;
  min-height: 32px;
}

.error-msg {
  margin-top: 10px;
  padding: 8px 12px;
  color: #f56c6c;
  font-size: 13px;
  background-color: #fef0f0;
  border-radius: 4px;
  display: flex;
  align-items: center;
  gap: 6px;
}

.compare-info {
  display: flex;
  gap: 20px;
  height: 340px;
  margin-top: 10px;

  .border-item {
    flex: 1;
    display: flex;
    flex-direction: column;
    overflow: hidden;

    .border-item-head {
      padding: 0;
      margin-bottom: 8px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 32px;
      box-sizing: border-box;

      .h2-titles {
        margin: 0;
        font-size: 16px;
      }
    }

    .border-item-body {
      flex: 1;
      overflow: hidden;
      display: flex;
      flex-direction: column;
    }
  }

  .log-card {
    .log-body {
      height: 300px;
      min-height: 300px;
      border: 1px solid #e4e7ed;
      border-radius: 4px;
      background-color: #1e1e1e;
      color: #d4d4d4;
      padding: 15px;
      font-family: 'Consolas', 'Monaco', monospace;
      font-size: 13px;
      line-height: 1.6;
      overflow-y: auto;
    }
    .log-line .log-time {
      color: #858585;
    }
    .log-line .log-content {
      color: #d4d4d4;
    }
    .log-line.success .log-content {
      color: #7ee787;
    }
    .log-line.error .log-content {
      color: #f85149;
    }
    .log-line.warn .log-content {
      color: #ffa657;
    }
    .log-line.code .log-content {
      color: #79c0ff;
    }
  }

  .definition-card {
    :deep(.el-table) {
      border: 1px solid #e4e7ed;
      border-radius: 4px;
    }
  }
}

.log-line {
  white-space: pre-wrap;
  word-break: break-all;
  margin-bottom: 4px;
}

.log-time {
  color: #858585;
  margin-right: 8px;
}

.log-content {
  color: #d4d4d4;
}

.log-line.success .log-content {
  color: #7ee787;
}

.log-line.error .log-content {
  color: #f85149;
}

.log-line.warn .log-content {
  color: #ffa657;
}

.log-line.code .log-content {
  color: #79c0ff;
}

.log-empty {
  color: #7ee787;
}
.el-empty {
  --el-empty-padding: 0px !important;
}
</style>
