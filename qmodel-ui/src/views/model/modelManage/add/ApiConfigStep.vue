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
  <div class="api-config-step">
    <el-form
      ref="apiFormRef"
      :model="formData"
      :rules="rules"
      label-width="170px"
      style="padding-right: 90px"
      class="api-form"
    >
      <div class="section-block">
        <div class="h2-titles">基础请求配置</div>

        <el-form-item label="接口地址" prop="apiUrl">
          <div class="default-wrap">
            <div class="url-input-group">
              <el-select v-model="formData.requestMethod" style="width: 100px">
                <el-option
                  v-for="item in requestMethodOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
              <el-input
                v-model="formData.apiUrl"
                placeholder="请输入接口地址"
                style="flex: 1"
              />
            </div>
          </div>
        </el-form-item>

        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="Content-Type" prop="contentType">
              <el-select v-model="formData.contentType" placeholder="请选择" style="width: 100%">
                <el-option
                  v-for="item in contentTypeOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="超时时间（秒）" prop="timeoutSeconds">
              <el-input-number
                v-model="formData.timeoutSeconds"
                :min="1"
                :max="300"
                controls-position="right"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
        </el-row>
      </div>

      <div class="section-block">
        <div class="h2-titles">鉴权配置</div>

        <el-form-item label="鉴权类型" prop="authType">
          <el-radio-group v-model="formData.authType">
            <el-radio label="NONE">无鉴权</el-radio>
            <el-radio label="FIXED">固定 Token / API Key</el-radio>
            <el-radio label="DYNAMIC">动态 Token API</el-radio>
          </el-radio-group>
        </el-form-item>

        <div v-if="formData.authType === 'NONE'" class="empty-auth-tip">
          无额外鉴权配置
        </div>

        <template v-if="formData.authType === 'FIXED'">
          <el-form-item label="鉴权方式" prop="authMethod">
            <el-select v-model="formData.authMethod" placeholder="请选择" style="width: 100%">
              <el-option label="Bearer Token" value="bearer" />
              <el-option label="API Key" value="apiKey" />
            </el-select>
          </el-form-item>

          <template v-if="formData.authMethod === 'bearer'">
            <el-form-item label="Token 内容" prop="authTokenValue">
              <el-input
                v-model="formData.authTokenValue"
                placeholder="请输入 Token 内容"
              />
            </el-form-item>
          </template>

          <template v-if="formData.authMethod === 'apiKey'">
            <el-row :gutter="20">
              <el-col :span="12">
                <el-form-item label="注入位置" prop="authInjectPosition">
                  <el-select v-model="formData.authInjectPosition" placeholder="请选择" style="width: 100%">
                    <el-option
                      v-for="item in injectPositionOptions"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"
                    />
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="Key" prop="authKeyName">
                  <el-input v-model="formData.authKeyName" placeholder="请输入 Key" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-form-item label="Value" prop="authTokenValue">
              <el-input v-model="formData.authTokenValue" placeholder="请输入 Value" />
            </el-form-item>
          </template>
        </template>

        <template v-if="formData.authType === 'DYNAMIC'">
          <el-form-item label="Token 接口地址" prop="authDynamicUrl">
            <div class="url-input-group">
              <el-select v-model="formData.authDynamicMethod" style="width: 100px">
                <el-option
                  v-for="item in requestMethodOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
              <el-input
                v-model="formData.authDynamicUrl"
                placeholder="请输入接口地址"
                style="flex: 1"
              />
            </div>
          </el-form-item>

          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="请求头（Headers）" prop="authDynamicHeaders">
                <div class="default-wrap">
                  <el-input
                    v-model="formData.authDynamicHeaders"
                    type="textarea"
                    :rows="8"
                    placeholder='请输入请求头（Headers）'
                  />
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="Query 参数" prop="authDynamicParams">
                <div class="default-wrap">
                  <el-input
                    v-model="formData.authDynamicParams"
                    type="textarea"
                    :rows="8"
                    placeholder='请输入 Query 参数'
                  />
                </div>
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="Token 提取路径" prop="authExtractPath">
                <el-input v-model="formData.authExtractPath" placeholder="请输入 Token 提取路径" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="值前缀" prop="authTokenPrefix">
                <el-input v-model="formData.authTokenPrefix" placeholder="请输入值前缀" />
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="注入位置" prop="authInjectPosition">
                <el-select v-model="formData.authInjectPosition" placeholder="请选择" style="width: 100%">
                  <el-option
                    v-for="item in injectPositionOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="注入参数名" prop="authKeyName">
                <el-input v-model="formData.authKeyName" placeholder="请输入注入参数名" />
              </el-form-item>
            </el-col>
          </el-row>
        </template>
      </div>
    </el-form>
  </div>
</template>

<script setup name="ApiConfigStep">
import { ref, computed, watch } from 'vue'

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const authBackup = ref({
  FIXED: {},
  DYNAMIC: {}
})

const props = defineProps({
  dictRequestMethod: {
    type: Array,
    default: () => []
  },
  dictContentType: {
    type: Array,
    default: () => []
  },
  dictAuthType: {
    type: Array,
    default: () => []
  },
  dictInjectPosition: {
    type: Array,
    default: () => []
  }
})

const apiFormRef = ref(null)

const requestMethodOptions = computed(() => {
  if (props.dictRequestMethod && props.dictRequestMethod.length > 0) {
    return props.dictRequestMethod.map((item) => {
      const isNumberValue = /^\d+$/.test(String(item.value))
      const label = item.label.toUpperCase()
      const value = isNumberValue ? label : String(item.value).toUpperCase()
      return { value, label }
    })
  }
  return [
    { value: 'GET', label: 'GET' },
    { value: 'POST', label: 'POST' },
    { value: 'PUT', label: 'PUT' },
    { value: 'DELETE', label: 'DELETE' }
  ]
})

const contentTypeOptions = computed(() => {
  if (props.dictContentType && props.dictContentType.length > 0) {
    return props.dictContentType.map((item) => ({
      value: item.value,
      label: item.label
    }))
  }
  return [
    { value: 'application/json', label: 'application/json' },
    { value: 'application/x-www-form-urlencoded', label: 'application/x-www-form-urlencoded' },
    { value: 'multipart/form-data', label: 'multipart/form-data' },
    { value: 'text/plain', label: 'text/plain' }
  ]
})

const injectPositionOptions = computed(() => {
  if (props.dictInjectPosition && props.dictInjectPosition.length > 0) {
    return props.dictInjectPosition.map((item) => ({
      value: item.value,
      label: item.label
    }))
  }
  return [
    { value: 'Header', label: 'Header' },
    { value: 'Query', label: 'Query' }
  ]
})

watch(
  () => formData.value.authType,
  (newVal, oldVal) => {
    console.log(formData.value,'cjyyyyyyyyyyyyyy');
    if (oldVal === 'FIXED' || oldVal === 'DYNAMIC') {
      authBackup.value[oldVal] = {
        authTokenValue: formData.value.authTokenValue,
        authInjectPosition: formData.value.authInjectPosition,
        authKeyName: formData.value.authKeyName,
        authTokenPrefix: formData.value.authTokenPrefix,
        authDynamicMethod: formData.value.authDynamicMethod,
        authDynamicUrl: formData.value.authDynamicUrl,
        authDynamicHeaders: formData.value.authDynamicHeaders,
        authDynamicParams: formData.value.authDynamicParams,
        authDynamicBody: formData.value.authDynamicBody,
        authExtractPath: formData.value.authExtractPath,
        authMethod: formData.value.authMethod
      }
    }
    if (newVal === 'FIXED' || newVal === 'DYNAMIC') {
      const backup = authBackup.value[newVal]
      if (backup && Object.keys(backup).length > 0) {
        Object.assign(formData.value, backup)
      }
    }
  }
)

watch(
  () => formData.value.authMethod,
  (newVal) => {
    if (newVal === 'bearer') {
      formData.value.authKeyName = 'Blade-Auth'
      formData.value.authInjectPosition = 'Header'
    }
  }
)

const jsonValidator = (rule, value, callback) => {
  if (!value || !String(value).trim()) {
    return callback()
  }
  try {
    JSON.parse(value)
    callback()
  } catch {
    callback(new Error('请输入合法的 JSON 格式'))
  }
}

const rules = computed(() => {
  const baseRules = {
    apiUrl: [
      { required: true, message: '请输入接口地址', trigger: 'blur' },
      { pattern: /^[^\u4e00-\u9fa5]+$/, message: '接口地址不能包含中文', trigger: 'blur' }
    ],
    requestMethod: [{ required: true, message: '请选择请求方式', trigger: 'change' }],
    contentType: [{ required: true, message: '请选择 Content-Type', trigger: 'change' }],
    timeoutSeconds: [{ required: true, message: '请输入超时时间', trigger: 'blur' }],
    authType: [{ required: true, message: '请选择鉴权类型', trigger: 'change' }]
  }

  if (formData.value.authType === 'FIXED') {
    baseRules.authMethod = [{ required: true, message: '请选择鉴权方式', trigger: 'change' }]
    const tokenValueMsg = formData.value.authMethod === 'bearer' ? '请输入 Token 内容' : '请输入 Value'
    baseRules.authTokenValue = [{ required: true, message: tokenValueMsg, trigger: 'blur' }]
    if (formData.value.authMethod === 'apiKey') {
      baseRules.authInjectPosition = [{ required: true, message: '请选择注入位置', trigger: 'change' }]
      baseRules.authKeyName = [{ required: true, message: '请输入 Key', trigger: 'blur' }]
    }
  }

  if (formData.value.authType === 'DYNAMIC') {
    baseRules.authDynamicUrl = [
      { required: true, message: '请输入 Token 接口地址', trigger: 'blur' },
      { pattern: /^[^\u4e00-\u9fa5]+$/, message: 'Token 接口地址不能包含中文', trigger: 'blur' }
    ]
    baseRules.authDynamicMethod = [{ required: true, message: '请选择获取 Token 方式', trigger: 'change' }]
    baseRules.authDynamicHeaders = [
      { required: true, message: '请输入请求头', trigger: 'blur' },
      { validator: jsonValidator, trigger: 'blur' }
    ]
    baseRules.authDynamicParams = [
      { required: true, message: '请输入 Query 参数', trigger: 'blur' },
      { validator: jsonValidator, trigger: 'blur' }
    ]
    baseRules.authExtractPath = [{ required: true, message: '请输入 Token 提取路径', trigger: 'blur' }]
    baseRules.authInjectPosition = [{ required: true, message: '请选择注入位置', trigger: 'change' }]
    baseRules.authKeyName = [{ required: true, message: '请输入注入参数名', trigger: 'blur' }]
  }

  return baseRules
})

const validate = () => {
  return apiFormRef.value.validate()
}

const clearAuthState = () => {
  authBackup.value = {
    FIXED: {},
    DYNAMIC: {}
  }
  formData.value.authMethod = 'apiKey'
  formData.value.authTokenValue = ''
  formData.value.authInjectPosition = 'Header'
  formData.value.authKeyName = null
  formData.value.authTokenPrefix = ''
  formData.value.authDynamicMethod = 'POST'
  formData.value.authDynamicUrl = ''
  formData.value.authDynamicHeaders = ''
  formData.value.authDynamicParams = ''
  formData.value.authDynamicBody = ''
  formData.value.authExtractPath = ''
}

defineExpose({
  validate,
  clearAuthState
})
</script>

<style lang="scss" scoped>
.api-form {
  width: 100%;

  :deep(.el-textarea__inner) {
    height: auto;
  }
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

.url-input-group {
  display: flex;
  gap: 10px;
  width: 100%;
}

.empty-auth-tip {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 120px;
  background-color: #f5f7fa;
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  color: #909399;
  font-size: 14px;
  margin-bottom: 20px;
}

.default-wrap {
  width: 100%;

  .tip-content {
    display: flex;
    gap: 4px;
    color: #888;
    font-size: 12px;
    line-height: 1.5;
    padding-top: 4px;

    :deep(.el-icon) {
      margin-top: 2px;
      flex-shrink: 0;
    }
  }
}
</style>
