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
  <el-form
    ref="basicFormRef"
    :model="formData"
    :rules="rules"
    label-width="170px"
    style="padding-right: 90px"
    class="basic-info-step"
  >
    <div class="section-block">
      <div class="h2-titles">API 配置</div>
      <el-form-item label="API名称" prop="name">
        <el-input
          v-model="formData.name"
          placeholder="请输入API名称"
          maxlength="128"
          show-word-limit
        />
      </el-form-item>

      <el-form-item label="接口地址" prop="apiUrl">
        <div class="url-input-group">
          <el-select v-model="formData.requestMethod" placeholder="方式" style="width: 120px">
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
        <el-col :span="24">
          <el-form-item label="备注" >
            <el-input
              class="char-count"
              v-model="formData.remark"
              type="textarea"
              :rows="2"
              placeholder="请输入备注"
              maxlength="500"
              show-word-limit
            />
          </el-form-item>
        </el-col>
       
      </el-row>
    </div>

    <div class="section-block">
      <div class="h2-titles">鉴权配置</div>
      <el-form-item label="鉴权类型" prop="authType">
        <el-radio-group v-model="formData.authType" @change="handleAuthTypeChange">
          <el-radio
            v-for="dict in dictAuthType"
            :key="dict.value"
            :label="dict.value"
          >{{ dict.label }}</el-radio>
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
              <el-form-item label="注入位置" prop="authInjectPos">
                <el-select v-model="formData.authInjectPos" placeholder="请选择" style="width: 100%">
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
        <el-form-item label="Token 接口地址" prop="authDynUrl">
          <div class="url-input-group">
            <el-select v-model="formData.authDynMethod" style="width: 120px">
              <el-option
                v-for="item in requestMethodOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
            <el-input
              v-model="formData.authDynUrl"
              placeholder="请输入接口地址"
              style="flex: 1"
            />
          </div>
        </el-form-item>
        
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="请求头 Headers" prop="authDynHeaders">
              <div class="default-wrap">
                <el-input
                  v-model="formData.authDynHeaders"
                  type="textarea"
                  :rows="8"
                  placeholder="请输入请求头 JSON"
                />
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Query参数" prop="authDynParams">
              <div class="default-wrap">
                <el-input
                  v-model="formData.authDynParams"
                  type="textarea"
                  :rows="8"
                  placeholder="请输入Query参数 JSON"
                />
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="Token提取路径" prop="authExtractPath">
              <el-input v-model="formData.authExtractPath" placeholder="例如 $.data.token" />
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
            <el-form-item label="注入位置" prop="authInjectPos">
              <el-select v-model="formData.authInjectPos" placeholder="请选择" style="width: 100%">
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
</template>

<script setup name="basicInfoStep">
import { ref, computed } from 'vue'

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const props = defineProps({
  dictApiType: {
    type: Array,
    default: () => []
  },
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

const basicFormRef = ref(null)

const requestMethodOptions = computed(() => {
  if (props.dictRequestMethod?.length) return props.dictRequestMethod
  return [
    { label: 'GET', value: 'GET' },
    { label: 'POST', value: 'POST' },
    { label: 'PUT', value: 'PUT' },
    { label: 'DELETE', value: 'DELETE' }
  ]
})

const contentTypeOptions = computed(() => {
  if (props.dictContentType?.length) return props.dictContentType
  return [
    { label: 'application/json', value: 'application/json' },
    { label: 'application/x-www-form-urlencoded', value: 'application/x-www-form-urlencoded' },
    { label: 'multipart/form-data', value: 'multipart/form-data' }
  ]
})

const injectPositionOptions = computed(() => {
  if (props.dictInjectPosition?.length) return props.dictInjectPosition
  return [
    { label: 'Header', value: 'header' },
    { label: 'Query', value: 'query' }
  ]
})

const rules = computed(() => ({
  name: [{ required: true, message: '请输入API名称', trigger: 'blur' }],
  apiType: [{ required: true, message: '请选择API类型', trigger: 'change' }],
  requestMethod: [{ required: true, message: '请选择请求方式', trigger: 'change' }],
  contentType: [{ required: true, message: '请选择Content-Type', trigger: 'change' }],
  apiUrl: [{ required: true, message: '请输入接口地址', trigger: 'blur' }],
  timeoutSeconds: [{ required: true, message: '请输入超时时间', trigger: 'blur' }],
  authType: [{ required: true, message: '请选择鉴权类型', trigger: 'change' }]
}))

const handleAuthTypeChange = (val) => {
  if (val === 'NONE') {
    formData.value.authMethod = 'apiKey'
    formData.value.authInjectPos = 'header'
  }
}

const validate = () => basicFormRef.value.validate()

defineExpose({ validate })
</script>

<style lang="scss" scoped>
.basic-info-step {
  height: 100%;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;

  :deep(.el-form-item) {
    margin-bottom: 14px;
  }
}

.section-block {
  margin-bottom: 20px;
  border: none;
  background: transparent;
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
}
</style>