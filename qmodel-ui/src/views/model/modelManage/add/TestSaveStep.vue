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
  <div class="test-save-step">
    <el-row :gutter="20" class="test-row">
      <el-col :span="12">
        <div class="test-card">
          <div class="section-title">
            <span class="title-line"></span>
            <span>测试请求</span>
          </div>
          <el-input
            v-model="testBodyText"
            type="textarea"
            :rows="18"
            placeholder='请输入请求体 JSON，例如：&#10;{&#10;  "name": "测试",&#10;  "age": 18&#10;}'
            class="test-textarea"
          />
          <div v-if="validateError" class="error-msg">
            <el-icon><Warning /></el-icon> {{ validateError }}
          </div>
          <el-button
            type="primary"
            size="large"
            class="test-btn"
            :loading="testing"
            :icon="VideoPlay"
            @click="handleTest"
          >
            发起调用测试
          </el-button>
        </div>
      </el-col>
      <el-col :span="12">
        <div class="result-card">
          <div class="section-title">
            <span class="title-line"></span>
            <span>执行结果及日志</span>
          </div>
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
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="TestSaveStep">
import { ref, computed, nextTick } from 'vue'
import { VideoPlay, Warning } from '@element-plus/icons-vue'
import Ajv from 'ajv'
import { testModelConfig } from '@/api/model/config'

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const ajv = new Ajv({ allErrors: true, strict: false })

const testBodyText = computed({
  get() {
    return formData.value.testBody || ''
  },
  set(val) {
    formData.value.testBody = val
  }
})

const validateError = ref('')
const testing = ref(false)
const logs = ref([])
const logRef = ref(null)

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

const validateTestBody = () => {
  validateError.value = ''
  const text = testBodyText.value.trim()
  if (!text) {
    validateError.value = '请输入请求体 JSON'
    return false
  }
  let body
  try {
    body = JSON.parse(text)
  } catch (e) {
    validateError.value = '请求体 JSON 格式错误：' + e.message
    return false
  }

  const schemaText = (formData.value.inputSchema || '').trim()
  if (schemaText) {
    try {
      const schema = JSON.parse(schemaText)
      const validate = ajv.compile(schema)
      const valid = validate(body)
      if (!valid) {
        validateError.value = '不符合入参 Schema：' + validate.errors.map(e => e.message).join('；')
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
  const body = validateTestBody()
  if (body === false) return

  testing.value = true
  addLog('开始组装请求配置...')

  try {
    const data = {
      apiUrl: formData.value.apiUrl,
      requestMethod: formData.value.requestMethod,
      contentType: formData.value.contentType,
      timeoutSeconds: formData.value.timeoutSeconds,
      authType: formData.value.authType,
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
      testBody: testBodyText.value
    }

    addLog(`请求方式：${data.requestMethod} ${data.apiUrl}`)
    addLog('正在发送测试请求...')

    const res = await testModelConfig(data)
    if (res.code === 200) {
      const result = res.data || {}
      if (result.logs && result.logs.length) {
        result.logs.forEach(item => addLog(item))
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
  // 第四步不强制要求测试通过才能保存
  return Promise.resolve()
}

defineExpose({
  validate
})
</script>

<style lang="scss" scoped>
.test-save-step {
  padding: 20px 0;
}

.section-title {
  display: flex;
  align-items: center;
  font-size: 16px;
  font-weight: 500;
  color: #303133;
  margin-bottom: 15px;

  .title-line {
    width: 4px;
    height: 16px;
    background-color: #409eff;
    margin-right: 8px;
    border-radius: 2px;
  }
}

.test-row {
  .test-card,
  .result-card {
    min-height: 520px;
    display: flex;
    flex-direction: column;
  }

  .test-textarea {
    flex: 1;

    :deep(.el-textarea__inner) {
      font-family: 'Consolas', 'Monaco', monospace;
      min-height: 420px !important;
      resize: none;
    }
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

  .test-btn {
    width: 100%;
    margin-top: 15px;
  }

  .log-body {
    flex: 1;
    background-color: #1e1e1e;
    color: #d4d4d4;
    padding: 15px;
    font-family: 'Consolas', 'Monaco', monospace;
    font-size: 13px;
    line-height: 1.6;
    border-radius: 4px;
    overflow: auto;
    min-height: 480px;
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
}
</style>
