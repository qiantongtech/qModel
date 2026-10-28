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
  <div class="online-test">
    <div class="test-card">
      <div class="version-section">
        <div class="test-card-header">
          <div class="h2-titles">调用版本</div>
          <el-button
            type="primary"
            size="default"
            :loading="testing"
            :icon="VideoPlay"
            class="header-action-btn"
            @click="handleTest"
          >
            调用测试
          </el-button>
        </div>
        <div class="version-select-row">
          <span class="version-label">版本号</span>
          <el-select
            v-model="selectedVersion"
            placeholder="请选择版本"
            size="default"
            style="width: 300px"
          >
            <el-option
              v-for="version in versionList"
              :key="version.dictValue"
              :label="version.dictLabel"
              :value="version.dictValue"
            />
          </el-select>
        </div>
      </div>

      <div class="calc-input-header">
        <div class="h2-titles">请求参数</div>
        <el-button type="primary" class="header-action-btn" @click="openApiSelector">
          <svg-icon icon-class="apigl" class="mr5" style="width: 14px; height: 14px;" />
          选择API
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
              <span>{{ row.required ? "是" : "否" }}</span>
            </template>
          </el-table-column>
          <el-table-column label="参数值" min-width="220">
            <template #default="{ row }">
              <el-input
                v-if="row.displayType === 'string'"
                v-model="formValues[row.key]"
                placeholder="请输入参数值"
                clearable
              />
              <el-input-number
                v-else-if="
                  row.displayType === 'integer' || row.displayType === 'number'
                "
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
                  disabled
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

        <div v-if="selectedApi" class="selected-api-card">
          <div class="selected-api-icon">API</div>
          <div class="selected-api-info">
            <div class="selected-api-name">
              {{ selectedApi.name }}
              <span v-if="selectedApi.code" style="color: #999; font-weight: normal; margin-left: 8px;">({{ selectedApi.code }})</span>
            </div>
            <div class="selected-api-meta">
              <dict-tag :options="requestMethodOptions" :value="selectedApi.requestMethod" style="display: inline-block; vertical-align: middle; margin-right: 5px;" />
              {{ selectedApi.apiUrl || '-' }}
              <span v-if="selectedApi.apiType"> · <dict-tag :options="model_data_api_type" :value="selectedApi.apiType" style="display: inline-block; vertical-align: middle;" /></span>
            </div>
          </div>
          <el-button link type="danger" icon="Close" @click="clearApiSelection" />
        </div>
      </div>

      <div v-if="validateError" class="error-msg">
        <el-icon><Warning /></el-icon> {{ validateError }}
      </div>
    </div>

    <!-- 执行结果及日志 (Python 类型) -->
    <div class="result-card" v-if="props.accessType === 'PYTHON'">
      <div class="h2-titles h3-titles">执行结果及日志</div>
      <div ref="logRef" class="log-body">
        <div
          v-for="(line, index) in logs"
          :key="index"
          :class="['log-line', line.type]"
        >
          <span class="log-time">{{ line.time }}</span>
          <span class="log-content">{{ line.content }}</span>
        </div>
        <div v-if="logs.length === 0" class="log-empty">
          > 等待发起测试<br />
          > 返回结果将展示在此处
        </div>
      </div>
    </div>

    <!-- 执行结果与结果定义 (仅 API 类型) -->
    <div class="compare-info" v-else-if="props.accessType === 'API'">
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

      <!-- 右侧：结果定义 (只读) -->
      <div class="border-item definition-card">
        <div class="border-item-head">
          <span class="h2-titles">结果定义</span>
        </div>
        <div class="border-item-body">
          <el-table :data="outputFields" stripe style="width: 100%" height="300">
            <el-table-column prop="field" label="字段" min-width="150" :show-overflow-tooltip="{ effect: 'light' }" />
            <el-table-column prop="name" label="名称" min-width="120" :show-overflow-tooltip="{ effect: 'light' }" />
            <el-table-column prop="example" label="示例" min-width="120" :show-overflow-tooltip="{ effect: 'light' }" />
            <el-table-column prop="description" label="说明" min-width="150" :show-overflow-tooltip="{ effect: 'light' }" />
            <template #empty>
              <el-empty :image-size="60" description="暂无结果定义" />
            </template>
          </el-table>
        </div>
      </div>
    </div>

    <!-- 数据 API 选择 -->
    <el-dialog
      v-model="apiSelectorOpen"
      width="800px"
      class="dialog"
      draggable
      destroy-on-close
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          选择数据 API
        </span>
      </template>
      <el-form :inline="true" :model="apiQuery" class="api-selector-form btn-style" @submit.prevent>
        <el-form-item label="API 名称">
          <el-input v-model="apiQuery.name" clearable placeholder="请输入 API 名称" class="el-form-input-width" @keyup.enter="loadApiOptions" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" plain @click="loadApiOptions">
            <i class="iconfont-mini icon-a-zu22377 mr5"></i>查询
          </el-button>
        </el-form-item>
      </el-form>
      <el-table
        ref="apiTableRef"
        v-loading="apiLoading"
        :data="apiOptions"
        highlight-current-row
        row-key="id"
        stripe
        @row-click="handleApiSelect"
      >
      <el-table-column
          label="编号"
          align="center"
          prop="id"
          width="80"
          :show-overflow-tooltip="{ effect: 'light' }"
        />
        <el-table-column label="API 名称" prop="name" min-width="170" :show-overflow-tooltip="{ effect: 'light' }" />
        <el-table-column label="用途" prop="description" min-width="220" :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">{{ scope.row.description || scope.row.remark || '-' }}</template>
        </el-table-column>
        <el-table-column label="请求地址" prop="apiUrl" min-width="230" :show-overflow-tooltip="{ effect: 'light' }" />
        <el-table-column label="请求方式" prop="requestMethod" width="110" align="center">
          <template #default="scope">
            <dict-tag :options="requestMethodOptions" :value="scope.row.requestMethod" />
          </template>
        </el-table-column>

        <template #empty>
          <div class="emptyBg">
            <img src="@/assets/system/images/no_data/noData.png" alt="" />
            <p>暂无可用 API</p>
          </div>
        </template>
      </el-table>
      <pagination
        v-show="apiTotal > 0"
        :total="apiTotal"
        v-model:page="apiQuery.pageNum"
        v-model:limit="apiQuery.pageSize"
        @pagination="loadApiOptions"
      />
      <template #footer>
        <div class="dialog-footer">
          <el-button size="mini" @click="apiSelectorOpen = false">取 消</el-button>
          <el-button type="primary" size="mini" @click="confirmApiSelection" :disabled="!apiSelectedRow" :loading="apiExecuting">确 认</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="OnlineTest">
import { ref, reactive, computed, watch, nextTick, onMounted } from "vue";
import { VideoPlay, Warning } from "@element-plus/icons-vue";
import Ajv from "ajv";
import FileUpload from "@/components/FileUpload2";
import { testModelConfig, getModelConfigByModelId } from "@/api/model/config";
import {
  runModelScript,
  listModelFileResource,
} from "@/api/model/modelFileResource";
import { listModelDataApi, getModelDataApi } from '@/api/model/modelData/modelDataApi';
import { getModelVersionDict } from '@/api/model/version.js';

const props = defineProps({
  modelId: {
    type: [Number, String],
    default: null,
  },
  modelName: {
    type: String,
    default: "",
  },
  accessMode: {
    type: Number,
    default: 0,
  },
  modelVersion: {
    type: String,
    default: "",
  },
  accessType: {
    type: String,
    default: "PYTHON",
  },
});

const { proxy } = getCurrentInstance();

const {
  model_data_api_type,
  model_access_mode
} = proxy.useDict(
    'model_data_api_type',
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

const ajv = new Ajv({
  allErrors: true,
  strict: false,
  strictTypes: false,
  strictFormat: false,
});

const validateError = ref("");
const testing = ref(false);
const configLoading = ref(false);
const logs = ref([]);
const logRef = ref(null);
const formValues = reactive({});
const fieldTypeMap = reactive({});
const selectedVersion = ref("");
const versionList = ref([]);

const apiSelectorOpen = ref(false);
const apiLoading = ref(false);
const apiOptions = ref([]);
const apiSelectedRow = ref(null);
const apiTotal = ref(0);
const apiQuery = ref({
  name: '',
  pageNum: 1,
  pageSize: 10
});
const apiTableRef = ref(null);
const apiExecuting = ref(false);
const resourceId = ref(null);
const resourceCode = ref('');
const resourceName = ref('');
const resourceUrl = ref('');
const resourceMethod = ref('');
const resourceType = ref('');

const selectedApi = computed(() => {
  if (!resourceId.value) return null
  return apiOptions.value.find((item) => item.id === resourceId.value) || {
    id: resourceId.value,
    code: resourceCode.value || '',
    name: resourceName.value || '已绑定数据 API',
    apiUrl: resourceUrl.value || '',
    requestMethod: resourceMethod.value || '',
    apiType: resourceType.value || ''
  }
})

const configData = reactive({
  inputSchema: "",
  outputSchema: "",
  apiUrl: "",
  requestMethod: "POST",
  contentType: "application/json",
  timeoutSeconds: 30,
  authType: "NONE",
  authMethod: "",
  authInjectPosition: "",
  authKeyName: "",
  authTokenPrefix: "",
  authTokenValue: "",
  authDynamicMethod: "",
  authDynamicUrl: "",
  authDynamicHeaders: "",
  authDynamicParams: "",
  authDynamicBody: "",
  authExtractPath: "",
});

const typeOptions = [
  { label: "String", value: "string" },
  { label: "Integer", value: "integer" },
  { label: "Number", value: "number" },
  { label: "File", value: "file" },
];

const inputSchemaObj = computed(() => {
  const text = (configData.inputSchema || "").trim();
  if (!text) return null;
  try {
    return JSON.parse(text);
  } catch {
    return null;
  }
});

const outputFields = computed(() => {
  try {
    if (configData.outputSchema) {
      const parsed = JSON.parse(configData.outputSchema)
      return Array.isArray(parsed) ? parsed : []
    }
  } catch (e) {}
  return []
})

const fieldList = computed(() => {
  const schema = inputSchemaObj.value;
  if (!schema || schema.type !== "object") return [];
  const props = schema.properties || {};
  const required = schema.required || [];
  return Object.keys(props).map((key) => {
    const p = props[key] || {};
    const rawType = p.type || "string";
    const currentType = fieldTypeMap[key] || rawType;
    const isFile = p.format === "binary" && !fieldTypeMap[key];
    return {
      key,
      title: p.title || key,
      description: p.description || "",
      type: currentType,
      format: p.format || "",
      displayType: isFile ? "file" : currentType,
      required: required.includes(key),
    };
  });
});

const initFormValues = () => {
  const schema = inputSchemaObj.value;
  const defaultValues = {};

  if (schema && schema.type === "object" && schema.properties) {
    Object.keys(schema.properties).forEach((key) => {
      const p = schema.properties[key] || {};
      if (p.type === "integer" || p.type === "number") {
        defaultValues[key] = undefined;
      } else {
        defaultValues[key] = "";
      }
    });
  }

  Object.keys(formValues).forEach((key) => delete formValues[key]);
  Object.assign(formValues, defaultValues);
};

watch(inputSchemaObj, initFormValues, { immediate: true });

const fetchConfig = async () => {
  if (!props.modelId) return;

  configLoading.value = true;
  getModelVersionDict(props.modelId).then((res) => {
    versionList.value = res.data;
  });
  try {
    if (props.accessMode === 0) {
      const res = await listModelFileResource({ modelId: props.modelId, modelVersion: selectedVersion.value });
      const rows = res.data?.rows || [];
      if (rows.length > 0) {
        const fileResource = rows[0];
        configData.inputSchema = fileResource.inputSchema || "";
        configData.outputSchema = fileResource.outputSchema || "";
      }
    } else {
      const res = await getModelConfigByModelId(props.modelId,selectedVersion.value);
      const rows = res.data?.rows || [];
      if (rows.length > 0) {
        const config = rows[0];
        configData.inputSchema = config.inputSchema || "";
        configData.outputSchema = config.outputSchema || "";
        configData.apiUrl = config.apiUrl || "";
        configData.requestMethod = config.requestMethod || "POST";
        configData.contentType = config.contentType || "application/json";
        configData.timeoutSeconds = config.timeoutSeconds || 30;
        configData.authType = config.authType || "NONE";
        configData.authMethod = config.authMethod || "";
        configData.authInjectPosition = config.authInjectPosition || "";
        configData.authKeyName = config.authKeyName || "";
        configData.authTokenPrefix = config.authTokenPrefix || "";
        configData.authTokenValue = config.authTokenValue || "";
        configData.authDynamicMethod = config.authDynamicMethod || "";
        configData.authDynamicUrl = config.authDynamicUrl || "";
        configData.authDynamicHeaders = config.authDynamicHeaders || "";
        configData.authDynamicParams = config.authDynamicParams || "";
        configData.authDynamicBody = config.authDynamicBody || "";
        configData.authExtractPath = config.authExtractPath || "";
      }
    }
  } catch (error) {
    console.error("获取配置失败:", error);
  } finally {
    configLoading.value = false;
  }
};

watch([() => props.modelId, () => props.accessMode, () => selectedVersion.value],
    () => {
  fetchConfig();
});

watch(
    () => props.modelVersion,
    (newVal) => {
      if (!newVal) return;
      selectedVersion.value = newVal;
    }
);

onMounted(() => {
  fetchConfig();
});

const handleFileUpload = (val, key) => {
  formValues[key] = val || "";
};

const handleTypeChange = (key, val) => {
  fieldTypeMap[key] = val;
  if (val === "integer" || val === "number") {
    formValues[key] = undefined;
  } else {
    formValues[key] = "";
  }
};

/** 扁平化 JSON 对象，方便匹配参数名 */
function flattenJson(obj, result = {}) {
  if (!obj || typeof obj !== 'object') return result
  for (const key in obj) {
    if (Object.prototype.hasOwnProperty.call(obj, key)) {
      const value = obj[key]
      // 始终保留当前层级的 key，方便短名称匹配
      if (result[key] === undefined) {
        result[key] = value
      }
      // 如果是对象且不是数组，递归处理
      if (value !== null && typeof value === 'object' && !Array.isArray(value)) {
        flattenJson(value, result)
      }
    }
  }
  return result
}

/** 打开 API 选择器 */
function openApiSelector() {
  apiSelectedRow.value = selectedApi.value || null
  apiSelectorOpen.value = true
  loadApiOptions()
}

function loadApiOptions() {
  apiLoading.value = true
  listModelDataApi({
    pageNum: apiQuery.value.pageNum,
    pageSize: apiQuery.value.pageSize,
    name: apiQuery.value.name || undefined
  }).then((res) => {
    apiOptions.value = (res.data?.rows || []).filter((item) => item.validFlag !== false && item.delFlag !== true)
    apiTotal.value = res.data?.total || 0
    // 如果有已选中的，回显高亮
    if (apiSelectedRow.value) {
      nextTick(() => {
        const row = apiOptions.value.find(item => item.id === apiSelectedRow.value.id)
        if (row && apiTableRef.value) {
          apiTableRef.value.setCurrentRow(row)
        }
      })
    }
  }).finally(() => {
    apiLoading.value = false
  })
}

function handleApiSelect(row) {
  if (!row) return
  apiSelectedRow.value = row
}

async function confirmApiSelection() {
  if (!apiSelectedRow.value) return
  const apiId = apiSelectedRow.value.id

  apiSelectorOpen.value = false
  apiExecuting.value = true
  try {
    // 1. 获取 API 完整详情以获取调用配置
    const apiDetailRes = await getModelDataApi(apiId)
    const apiData = apiDetailRes.data

    // 2. 构造测试请求参数
    const testPayload = {
      apiUrl: apiData.apiUrl,
      requestMethod: getRequestMethodLabel(apiData.requestMethod),
      contentType: apiData.contentType,
      timeoutSeconds: apiData.timeoutSeconds,
      authType: apiData.authType,
      authMethod: apiData.authMethod,
      authInjectPosition: apiData.authInjectPos,
      authKeyName: apiData.authKeyName,
      authTokenPrefix: apiData.authTokenPrefix,
      authTokenValue: apiData.authTokenValue,
      authDynamicMethod: apiData.authDynMethod,
      authDynamicUrl: apiData.authDynUrl,
      authDynamicHeaders: apiData.authDynHeaders,
      authDynamicParams: apiData.authDynParams,
      authDynamicBody: apiData.authDynBody,
      authExtractPath: apiData.authExtractPath,
      testBody: "{}" // 默认空 Body
    }

    const testRes = await testModelConfig(testPayload)

    if (testRes.code === 200 && testRes.data && testRes.data.success) {
      let responseObj = {}
      try {
        responseObj = JSON.parse(testRes.data.responseBody)
      } catch (e) {
        responseObj = { result: testRes.data.responseBody }
      }

      // 4. 扁平化数据并匹配
      const flatData = flattenJson(responseObj)
      let matchCount = 0

      Object.keys(formValues).forEach(key => {
        if (flatData[key] !== undefined) {
          const val = flatData[key]
          formValues[key] = (val === null || val === undefined) ? '' : String(val)
          matchCount++
        }
      })

      // 5. 绑定 API 信息
      resourceId.value = apiData.id
      resourceCode.value = apiData.code || ''
      resourceName.value = apiData.name
      resourceUrl.value = apiData.apiUrl || ''
      resourceMethod.value = apiData.requestMethod || ''
      resourceType.value = apiData.apiType || ''

      proxy.$modal.msgSuccess(`API 调用成功，已自动匹配填充 ${matchCount} 个参数`)
    } else {
      proxy.$modal.msgError(`API 调用失败: ${testRes.data?.errorMsg || '未知错误'}`)
    }
  } catch (error) {
    console.error('API 绑定并调用失败', error)
    proxy.$modal.msgError('API 绑定失败，请检查网络或配置')
  } finally {
    apiExecuting.value = false
  }
}

/** 取消绑定 API */
function clearApiSelection() {
  resourceId.value = null
  resourceCode.value = ''
  resourceName.value = ''
  resourceUrl.value = ''
  resourceMethod.value = ''
  resourceType.value = ''

  // 清空已匹配的参数值
  Object.keys(formValues).forEach(key => {
    formValues[key] = ''
  })

  proxy.$modal.msgSuccess('已取消 API 绑定，并重置参数值')
}

const addLog = (content, type = "info") => {
  const now = new Date();
  const time = `${now.getHours().toString().padStart(2, "0")}:${now
    .getMinutes()
    .toString()
    .padStart(2, "0")}:${now.getSeconds().toString().padStart(2, "0")}`;
  logs.value.push({ time, content, type });
  nextTick(() => {
    if (logRef.value) {
      logRef.value.scrollTop = logRef.value.scrollHeight;
    }
  });
};

const buildTestPayload = () => {
  const payload = {};
  const schema = inputSchemaObj.value;
  const properties = (schema && schema.type === 'object' && schema.properties) ? schema.properties : {};

  Object.keys(formValues).forEach((key) => {
    let value = formValues[key];
    if (value !== undefined && value !== "") {
      // 获取该字段在 schema 中的定义类型
      const fieldType = properties[key]?.type;

      // 如果期望是数组，并且输入的是字符串，则尝试解析为 JS 数组
      if (fieldType === 'array' && typeof value === 'string') {
        try {
          value = JSON.parse(value);
        } catch (e) {
          // 解析失败保留原字符串，交由后续 ajv 抛出校验错误
        }
      } else if (fieldType === 'object' && typeof value === 'string') {
        // 同理，如果是 object 类型也可以顺便支持解析
        try {
          value = JSON.parse(value);
        } catch (e) {
        }
      }

      payload[key] = value;
    }
  });
  return payload;
};

const validateTestBody = async () => {
  validateError.value = "";
  if (fieldList.value.length === 0) {
    validateError.value = "没有可测试的入参字段";
    return false;
  }

  const errors = [];
  fieldList.value.forEach((field) => {
    if (field.required) {
      const value = formValues[field.key];
      const isFile = field.type === "file";
      if (isFile) {
        if (!value || !String(value).trim()) {
          errors.push(`请上传${field.title}`);
        }
      } else {
        if (value === undefined || value === "" || value === null) {
          errors.push(`请输入${field.title}`);
        }
      }
    }
  });

  if (errors.length > 0) {
    validateError.value = errors.join("；");
    return false;
  }

  const body = buildTestPayload();
  const schemaText = (configData.inputSchema || "").trim();
  if (schemaText) {
    try {
      // 修复：深拷贝并移除 format: 'binary'，因为 Ajv 默认不支持这个格式
      const schema = JSON.parse(schemaText);
      const schemaCopy = JSON.parse(JSON.stringify(schema));

      // 递归移除所有 format: 'binary'
      const removeBinaryFormat = (obj) => {
        if (typeof obj === "object" && obj !== null) {
          if (obj.format === "binary") {
            delete obj.format;
          }
          Object.keys(obj).forEach((key) => removeBinaryFormat(obj[key]));
        }
      };
      removeBinaryFormat(schemaCopy);

      const validate = ajv.compile(schemaCopy);
      const valid = validate(body);
      if (!valid) {
        validateError.value =
          "不符合入参 Schema：" +
          validate.errors.map((e) => e.message).join("；");
        return false;
      }
    } catch (e) {
      validateError.value = "入参 Schema 解析失败：" + e.message;
      return false;
    }
  }
  return body;
};

const handleTest = async () => {
  logs.value = [];
  const body = await validateTestBody();
  if (body === false) return;

  testing.value = true;
  addLog("开始组装请求配置...");

  try {
    if (props.accessMode === 0) {
      addLog(`执行 Python 脚本，模型ID：${props.modelId}`);
      addLog("正在执行脚本...");
      const res = await runModelScript(props.modelId,selectedVersion.value, body);
      if (res.code === 200) {
        const result = res.data || {};
        addLog("脚本执行成功", "success");
        if (result) {
          addLog("执行结果：");
          addLog(
            formatJson(
              typeof result === "string" ? result : JSON.stringify(result)
            ),
            "code"
          );
        }
      } else {
        addLog(res.msg || "脚本执行失败", "error");
      }
    } else {
      const data = {
        modelId: props.modelId,
        modelName: props.modelName,
        modelVersion: selectedVersion.value,
        inputSchema: configData.inputSchema,
        apiUrl: configData.apiUrl,
        requestMethod: getRequestMethodLabel(configData.requestMethod),
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
        testBody: JSON.stringify(body),
      };

      addLog(`请求方式：${data.requestMethod} ${data.apiUrl}`);
      addLog("正在发送测试请求...");

      const res = await testModelConfig(data);
      if (res.code === 200) {
        const result = res.data || {};
        if (result.logs && result.logs.length) {
          result.logs.forEach((item) => addLog(item));
        }
        if (result.success) {
          addLog(
            `测试请求成功，HTTP 状态：${result.statusCode || "-"}`,
            "success"
          );
        } else {
          addLog(`测试请求失败：${result.errorMsg || "未知错误"}`, "error");
        }
        if (result.responseBody) {
          addLog("响应内容：");
          addLog(formatJson(result.responseBody), "code");
        }
      } else {
        addLog(res.msg || "测试请求失败", "error");
      }
    }
  } catch (error) {
    addLog(
      "测试调用异常：" + (error?.msg || error?.message || "未知错误"),
      "error"
    );
  } finally {
    testing.value = false;
  }
};

const formatJson = (str) => {
  try {
    return JSON.stringify(JSON.parse(str), null, 2);
  } catch {
    return str;
  }
};
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
  content: "";
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
  margin-bottom: 15px;
}

.test-card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 10px;
  flex-shrink: 0;
}

.header-action-btn {
  width: 104px;
  padding: 0;
  display: inline-flex;
  justify-content: center;
  align-items: center;
}

.version-section {
  margin-bottom: 5px;
}

.version-select-row {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-top: 8px;
}

.version-label {
  font-size: 14px;
  color: #606266;
  font-weight: 500;
}

.form-body {
  flex: 1;
  max-height: 220px;
  overflow-y: auto;
  min-height: 0;
}

.calc-input-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  margin-bottom: 10px;
}

.selected-api-card {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 10px 14px;
  margin-top: 12px;
  border: 1px solid #dbe8fa;
  background: #f7faff;
}

.selected-api-icon {
  width: 34px;
  height: 34px;
  display: grid;
  place-items: center;
  color: var(--el-color-primary);
  background: #e6f0ff;
  font-size: 12px;
  font-weight: 600;
}

.selected-api-info {
  min-width: 0;
  flex: 1;
}

.selected-api-name {
  color: #26364b;
  font-weight: 600;
  font-size: 14px;
}

.selected-api-meta {
  margin-top: 4px;
  color: #7d8b9c;
  font-size: 12px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.api-selector-form {
  margin-bottom: 14px;
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

.compare-info {
  display: flex;
  gap: 20px;
  flex: 1;
  min-height: 0;

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

.log-body {
  background-color: #1e1e1e;
  color: #d4d4d4;
  padding: 15px;
  font-family: "Consolas", "Monaco", monospace;
  font-size: 13px;
  line-height: 1.6;
  border-radius: 4px;
  overflow-y: auto;
  height: 220px;
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
