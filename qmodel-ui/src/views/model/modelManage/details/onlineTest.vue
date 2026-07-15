<template>
  <div class="online-test">
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
          发起调用测试
        </el-button>
      </div>

      <div class="form-body" v-loading="configLoading">
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
                :placeholder="`请输入${row.title}`"
                clearable
              />
              <el-input-number
                v-else-if="row.displayType === 'integer' || row.displayType === 'number'"
                v-model="formValues[row.key]"
                :placeholder="`请输入${row.title}`"
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
        <el-empty v-else description="暂无测试参数" />
      </div>

      <div v-if="validateError" class="error-msg">
        <el-icon><Warning /></el-icon> {{ validateError }}
      </div>
    </div>

    <div class="result-card">
      <div class="h2-titles h3-titles">执行结果及日志</div>
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
</template>

<script setup name="OnlineTest">
import { ref, reactive, computed, watch, nextTick, onMounted } from 'vue'
import { VideoPlay, Warning } from '@element-plus/icons-vue'
import Ajv from 'ajv'
import FileUpload from '@/components/FileUpload2'
import { testModelConfig, getModelConfigByModelId } from '@/api/model/config'
import { runModelScript, listModelFileResource } from '@/api/model/modelFileResource'

const props = defineProps({
  modelId: {
    type: [Number, String],
    default: null
  },
  modelName: {
    type: String,
    default: ''
  },
  accessMode: {
    type: Number,
    default: 0
  }
})

const ajv = new Ajv({ allErrors: true, strict: false, strictTypes: false, strictFormat: false })

const validateError = ref('')
const testing = ref(false)
const configLoading = ref(false)
const logs = ref([])
const logRef = ref(null)
const formValues = reactive({})
const fieldTypeMap = reactive({})

const configData = reactive({
  inputSchema: '',
  apiUrl: '',
  requestMethod: 'POST',
  contentType: 'application/json',
  timeoutSeconds: 30,
  authType: 'NONE',
  authMethod: '',
  authInjectPosition: '',
  authKeyName: '',
  authTokenPrefix: '',
  authTokenValue: '',
  authDynamicMethod: '',
  authDynamicUrl: '',
  authDynamicHeaders: '',
  authDynamicParams: '',
  authDynamicBody: '',
  authExtractPath: ''
})

const typeOptions = [
  { label: 'String', value: 'string' },
  { label: 'Integer', value: 'integer' },
  { label: 'Number', value: 'number' },
  { label: 'File', value: 'file' }
]

const inputSchemaObj = computed(() => {
  const text = (configData.inputSchema || '').trim()
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
  const defaultValues = {}

  if (schema && schema.type === 'object' && schema.properties) {
    Object.keys(schema.properties).forEach((key) => {
      const p = schema.properties[key] || {}
      if (p.type === 'integer' || p.type === 'number') {
        defaultValues[key] = undefined
      } else {
        defaultValues[key] = ''
      }
    })
  }

  Object.keys(formValues).forEach((key) => delete formValues[key])
  Object.assign(formValues, defaultValues)
}

watch(inputSchemaObj, initFormValues, { immediate: true })

const fetchConfig = async () => {
  if (!props.modelId) return

  configLoading.value = true
  try {
    if (props.accessMode === 0) {
      const res = await listModelFileResource({ modelId: props.modelId })
      const rows = res.data?.rows || []
      if (rows.length > 0) {
        const fileResource = rows[0]
        configData.inputSchema = fileResource.inputSchema || ''
      }
    } else {
      const res = await getModelConfigByModelId(props.modelId)
      const rows = res.data?.rows || []
      if (rows.length > 0) {
        const config = rows[0]
        configData.inputSchema = config.inputSchema || ''
        configData.apiUrl = config.apiUrl || ''
        configData.requestMethod = config.requestMethod || 'POST'
        configData.contentType = config.contentType || 'application/json'
        configData.timeoutSeconds = config.timeoutSeconds || 30
        configData.authType = config.authType || 'NONE'
        configData.authMethod = config.authMethod || ''
        configData.authInjectPosition = config.authInjectPosition || ''
        configData.authKeyName = config.authKeyName || ''
        configData.authTokenPrefix = config.authTokenPrefix || ''
        configData.authTokenValue = config.authTokenValue || ''
        configData.authDynamicMethod = config.authDynamicMethod || ''
        configData.authDynamicUrl = config.authDynamicUrl || ''
        configData.authDynamicHeaders = config.authDynamicHeaders || ''
        configData.authDynamicParams = config.authDynamicParams || ''
        configData.authDynamicBody = config.authDynamicBody || ''
        configData.authExtractPath = config.authExtractPath || ''
      }
    }
  } catch (error) {
    console.error('获取配置失败:', error)
  } finally {
    configLoading.value = false
  }
}

watch([() => props.modelId, () => props.accessMode], () => {
  fetchConfig()
})

onMounted(() => {
  fetchConfig()
})

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
  Object.keys(formValues).forEach((key) => {
    if (formValues[key] !== undefined && formValues[key] !== '') {
      payload[key] = formValues[key]
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
  const schemaText = (configData.inputSchema || '').trim()
  if (schemaText) {
    try {
      // 修复：深拷贝并移除 format: 'binary'，因为 Ajv 默认不支持这个格式
      const schema = JSON.parse(schemaText)
      const schemaCopy = JSON.parse(JSON.stringify(schema))

      // 递归移除所有 format: 'binary'
      const removeBinaryFormat = (obj) => {
        if (typeof obj === 'object' && obj !== null) {
          if (obj.format === 'binary') {
            delete obj.format
          }
          Object.keys(obj).forEach(key => removeBinaryFormat(obj[key]))
        }
      }
      removeBinaryFormat(schemaCopy)

      const validate = ajv.compile(schemaCopy)
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
    if (props.accessMode === 0) {
      addLog(`执行 Python 脚本，模型ID：${props.modelId}`)
      addLog('正在执行脚本...')

      const res = await runModelScript(props.modelId, body)
      if (res.code === 200) {
        const result = res.data || {}
        addLog('脚本执行成功', 'success')
        if (result) {
          addLog('执行结果：')
          addLog(formatJson(typeof result === 'string' ? result : JSON.stringify(result)), 'code')
        }
      } else {
        addLog(res.msg || '脚本执行失败', 'error')
      }
    } else {
      const data = {
        modelId: props.modelId,
        modelName: props.modelName,
        apiUrl: configData.apiUrl,
        requestMethod: configData.requestMethod,
        contentType: configData.contentType,
        timeoutSeconds: configData.timeoutSeconds,
        authType: configData.authType,
        authMethod: configData.authMethod,
        authInjectPosition: configData.authInjectPosition,
        authKeyName: configData.authKeyName,
        authTokenPrefix: configData.authTokenPrefix,
        authTokenValue: configData.authTokenValue,
        authDynamicMethod: configData.authDynamicMethod,
        authDynamicUrl: configData.authDynamicUrl,
        authDynamicHeaders: configData.authDynamicHeaders,
        authDynamicParams: configData.authDynamicParams,
        authDynamicBody: configData.authDynamicBody,
        authExtractPath: configData.authExtractPath,
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
        }
      } else {
        addLog(res.msg || '测试请求失败', 'error')
      }
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
</script>

<style lang="scss" scoped>
.online-test {
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

.result-card {
  display: flex;
  flex-direction: column;
  flex: 1;
  min-height: 0;
}

.log-body {
  background-color: #1e1e1e;
  color: #d4d4d4;
  padding: 15px;
  font-family: 'Consolas', 'Monaco', monospace;
  font-size: 13px;
  line-height: 1.6;
  border-radius: 4px;
  overflow-y: auto;
  height: 320px;
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
