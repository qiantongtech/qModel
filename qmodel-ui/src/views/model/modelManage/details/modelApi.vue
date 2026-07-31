<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.

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
  <div>
    <div class="infotop" >
      <div class="h2-titles">服务信息</div>
      <div>
        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">Base URL</div>
              <div class="infotop-row-value">
                <el-tooltip :content="baseUrl || '-'" placement="top" effect="light">
                  <span class="ellipsis-text">{{ baseUrl || "-" }}</span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">鉴权方式(API Key)</div>
              <div class="infotop-row-value">
                <span class="ellipsis-text">Authorization: Bearer &lt;YOUR_API_KEY&gt;</span>
              </div>
            </div>
          </el-col>

          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">鉴权位置</div>
              <div class="infotop-row-value">
                <span>header(请求头)</span>
              </div>
            </div>
          </el-col>
        </el-row>

        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">Base URL</div>
              <div class="infotop-row-value">
                <el-tooltip :content="baseUrl || '-'" placement="top" effect="light">
                  <span class="ellipsis-text">{{ baseUrl || "-" }}</span>
                </el-tooltip>
              </div>
            </div>
          </el-col>

        </el-row>

      </div>
    </div>
    <div>
      <div class="h2-titles">接口定义</div>
      <div>
        <el-collapse accordion v-model="activeNames">
          <el-collapse-item name="1" :class="['collapse-item-wrap', 'post']">

            <template #title>
              <div class="api-title" style="color: #009e21">
                <el-tag type="success" effect="dark" size="small" style="margin-left: 10px;background: #009e21!important;color: #ffffff!important;" >POST</el-tag>
                <span class="path">/predict</span>
                <span>执行模型推理预测</span>
              </div>
            </template>

            <el-row :gutter="20" class="api-panel">
              <!-- 请求参数 -->
              <el-col :span="12">
                <div class="sub-title under-line">请求参数 (Request Body)</div>
                <pre class="code-block dark fixed-height">{{ getInputSchema() }}</pre>
                <div class="code-hint">格式: application/json</div>
                <!--                  <el-link type="primary">查看 Schema 详情</el-link>-->
              </el-col>
              <!-- 响应结果 -->
              <el-col :span="12">
                <div class="sub-title under-line">响应结果 (Responses)</div>
                <pre class="code-block dark fixed-height">{{ getOutputSchema() }}</pre>
                <div class="resp-status">
                  <el-tag type="success" size="small" style="margin-right:10px">200</el-tag>
                  <span>成功返回预测结果</span>
                </div>

              </el-col>
            </el-row>
            <!-- 调用示例 -->
            <el-row :gutter="20" class="api-panel">
              <el-col :span="24">
                <div class="demo-section">
                  <div class="sub-title">调用示例 (Code Snippets)</div>
                  <el-tabs v-model="demoTab" type="border-card">
                    <el-tab-pane label="CURL" name="curl">
                      <pre class="code-block dark">{{ genCURLExampleCode("post", "/predict") }}</pre>
                    </el-tab-pane>
                    <el-tab-pane label="Python (requests)" name="python">
                      <pre class="code-block dark">{{ genPythonExampleCode("post", "/predict") }}</pre>
                    </el-tab-pane>
                    <el-tab-pane label="Node.js (axios)" name="node">
                      <pre class="code-block dark">{{ genNodeExampleCode("post", "/predict") }}</pre>
                    </el-tab-pane>
                  </el-tabs>
                </div>
              </el-col>
            </el-row>
          </el-collapse-item>
          <el-collapse-item name="2" :class="['collapse-item-wrap', 'get']">

            <template #title>
              <div class="api-title" style="color: #2666fb">
                <el-tag type="primary" size="small" effect="dark" style="margin-left: 10px">GET</el-tag>
                <span class="path">/status</span>
                <span>获取模型当前运行状态</span>
              </div>
            </template>

            <el-row :gutter="20" class="api-panel">
              <!-- 请求参数 -->
              <el-col :span="12">
                <div class="sub-title under-line">请求参数 (Request Body)</div>
                <pre class="code-block dark fixed-height">{{ getInputSchema() }}</pre>
                <div class="code-hint">格式: application/json
                  <el-link type="primary">查看 Schema 详情</el-link>
                </div>
              </el-col>
              <!-- 响应结果 -->
              <el-col :span="12">
                <div class="sub-title under-line">响应结果 (Responses)</div>
                <pre class="code-block dark fixed-height">
                                  {
                                    "predictions": [
                                      {
                                        "store_id": "1001",
                                        "predicted_sales_next_day": 162.3
                                      }
                                    ],
                                    "model_version": "V1.0"
                                  }
                  </pre>
                <div class="resp-status">
                  <el-tag type="success" size="small">200</el-tag>
                  <span>成功返回预测结果</span>
                </div>

              </el-col>
            </el-row>
            <!-- 调用示例 -->
            <el-row :gutter="20" class="api-panel">
              <el-col :span="24">
                <div class="demo-section">
                  <div class="sub-title">调用示例 (Code Snippets)</div>
                  <el-tabs v-model="demoTab" type="border-card">
                    <el-tab-pane label="CURL" name="curl">
                      <pre class="code-block dark">{{ genCURLExampleCode("post", "/predict") }}</pre>
                    </el-tab-pane>
                    <el-tab-pane label="Python (requests)" name="python">
                      <pre class="code-block dark">{{ genPythonExampleCode("post", "/predict") }}</pre>
                    </el-tab-pane>
                    <el-tab-pane label="Node.js (axios)" name="node">
                      <pre class="code-block dark">{{ genNodeExampleCode("post", "/predict") }}</pre>
                    </el-tab-pane>
                  </el-tabs>
                </div>
              </el-col>
            </el-row>
          </el-collapse-item>
        </el-collapse>
      </div>
    </div>
  </div>

  <!-- 添加或修改版本管理对话框 -->
  <el-dialog
      title="API Key"
      v-model="openKey"
      width="750px"
      :close-on-click-modal="false"
  >
    <el-row style="margin-bottom: 10px" class="btn-style">
      <el-col :span="1.5">
        <el-button
            type="primary"
            plain
            @click="handleAddToken"
        >
          <i class="iconfont-mini icon-xinzeng"></i>新增
        </el-button>
      </el-col>
    </el-row>

    <el-table
        stripe
        v-loading="loading"
        :default-sort="{ prop: 'createTime', order: 'descending' }"
        :data="apiKeyList"
    >
      <el-table-column label="密钥" align="center" prop="apiKey">
        <template #default="scope">
          {{ maskData(scope.row.apiKey) }}
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="updateBy" width="120"
                       :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          <span>{{ scope.row.createBy }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" width="140" prop="createTime" sortable>
        <template #default="scope">
          {{ parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}") }}
        </template>
      </el-table-column>
      <el-table-column label="操作" width="180" align="center">
        <template #default="scope">
          <el-button link type="primary" icon="CopyDocument" @click="copyToken(scope.row)">
            复制
          </el-button>
          <el-button link type="danger" icon="Delete" @click="deleteToken(scope.row)">
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <template #footer>
      <div class="dialog-footer">
        <el-button @click="cancel">关 闭</el-button>
      </div>
    </template
    >
  </el-dialog>

</template>

<script setup name="modelApi">
import {ref, getCurrentInstance} from "vue";
import {addModelKey, delModelKey, listModelKey} from "@/api/model/modelKey.js";

const {proxy} = getCurrentInstance();

const baseUrl = window.location.origin + "/dev-api/v1/models";
const demoTab = ref('curl')
const activeNames = ref(['1'])
const openKey = ref(false)
const apiKeyList = ref([])
const loading = ref(false)

const props = defineProps({
  model: {
    type: Object,
    default: null,
    required: true,
  },
});

// 复制BaseURL
async function copyUrl() {
  await navigator.clipboard.writeText(baseUrl)
  proxy.$modal.msgSuccess("链接已复制");
}

// 获取输入参数Schema
function getInputSchema() {
  if (props.model.accessType === "API") {
    return props.model.modelConfig.inputSchema;
  } else if (props.model.accessType === "PYTHON") {
    return props.model.modelFileResourceRespVO.inputSchema;
  } else {
    return {}
  }
}

// 获取输入参数Schema
function getOutputSchema() {
  let outputSchema = {
    "code": 200,
    "data": {},
    "msg": "操作成功"
  };
  if (props.model.accessType === "API") {
    outputSchema.data = {
      "success": true,
      "statusCode": 200,
      "responseBody": "",
      "responseHeaders": {},
      "logs": [],
      "errorMsg": ""
    }
    return outputSchema;
  } else if (props.model.accessType === "PYTHON") {
    return outputSchema;
  } else {
    return {}
  }
}

// 生成CURL示例代码
function genCURLExampleCode(method, path) {
  const inputSchema = JSON.parse(getInputSchema());
  let paramExample = buildEmptyDataBySchema(inputSchema)
  let paramExampleStr = JSON.stringify(paramExample)

  let arr = [];
  arr.push(`curl -X ${method} "${baseUrl}${path}"`);
  arr.push(`-H "Authorization: Bearer <YOUR_API_KEY>"`);
  arr.push(`-H "Content-Type: application/json"`);
  arr.push(`-d '${paramExampleStr}'`);
  return arr.join("\n");
}

// 生成Python示例代码
function genPythonExampleCode(method, path) {
  const inputSchema = JSON.parse(getInputSchema());
  let paramExample = buildEmptyDataBySchema(inputSchema)
  let paramExampleStr = JSON.stringify(paramExample)

  let arr = [];
  arr.push(`import requests`);
  arr.push(`url = "${baseUrl}${path}"`);
  arr.push(`headers = {`);
  arr.push(`  "Authorization": "Bearer <YOUR_API_KEY>"`);
  arr.push(`  "Content-Type": "application/json"`);
  arr.push(`  }`);
  arr.push(`payload = {`);
  arr.push(`  "instances": [`);
  arr.push(`    ${paramExampleStr}`);
  arr.push(`  ]`);
  arr.push(`}`);
  arr.push(`resp = requests.post(url, json=payload, headers=headers)`);
  arr.push(`print(resp.json())`);
  return arr.join("\n");
}

// 生成 Node 示例代码
function genNodeExampleCode(method, path) {
  const inputSchema = JSON.parse(getInputSchema());
  let paramExample = buildEmptyDataBySchema(inputSchema)
  let paramExampleStr = JSON.stringify(paramExample)

  let arr = [];
  arr.push(`const axios = require('axios');`);
  arr.push(`async function run() {`);
  arr.push(`  const res = await axios.post(`);
  arr.push(`    "${baseUrl}${path}",`);
  arr.push(`    {`);
  arr.push(`      instances: [${paramExampleStr}]`);
  arr.push(`    },`);
  arr.push(`    {`);
  arr.push(`      headers: {`);
  arr.push(`            "Authorization": "Bearer Bearer <YOUR_API_KEY>",`);
  arr.push(`            "Content-Type": "application/json"`);
  arr.push(`      }`);
  arr.push(`    }`);
  arr.push(`  )`);
  arr.push(`  console.log(res.data);`);
  arr.push(`}`);
  arr.push(`run();`);
  return arr.join("\n");

}

// 生成参数示例
function buildEmptyDataBySchema(schema) {
  if (!schema) return null;

  if (schema.$ref) {
    return null;
  }

  // type 可能是数组 ["string","null"]，取第一个有效类型
  let type = Array.isArray(schema.type) ? schema.type[0] : schema.type;

  switch (type) {
    case 'string':
      return '';
    case 'number':
    case 'integer':
      return 0;
    case 'boolean':
      return false;
    case 'array': {
      return [];
    }
    case 'object': {
      const result = {};
      const props = schema.properties || {};
      for (const key of Object.keys(props)) {
        result[key] = buildEmptyDataBySchema(props[key]);
      }
      return result;
    }
    default:
      return null;
  }
}

// 获取Token
function getToken() {
  getTokenList();
  openKey.value = true;
}

// 关闭 Token 窗口
function cancel() {
  openKey.value = false;
}

// 添加Token
function handleAddToken() {
  const param = {
    modelId: props.model.id
  }
  addModelKey(param).then(res => {
    proxy.$modal.msgSuccess("新增成功");
    getTokenList();
  });
}

// 获取Token列表
function getTokenList() {
  loading.value = true;
  const param = {
    modelId: props.model.id
  }

  listModelKey(param).then(res => {
    apiKeyList.value = res.data;
    loading.value = false;
  });
}

// 复制Token
async function copyToken(row) {
  await navigator.clipboard.writeText(row.apiKey)
  proxy.$modal.msgSuccess("API Key已复制");
}

// 删除 Token
function deleteToken(row) {
  proxy.$modal.confirm("是否确认删除该 API Key 吗？", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  })
      .then(() => {
        return delModelKey(row.id);
      })
      .then(() => {
        getTokenList();
        proxy.$modal.msgSuccess("删除成功");
      })

}

// 数据脱敏
function maskData(data) {
  if (!data || data.length < 16) return data
  return data.slice(0, 6) + '****' + data.slice(-10)
}

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

.toolbar-row {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 0 12px;
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

.api-panel {
  padding: 12px 4px;
}

.api-title {
  display: flex;
  align-items: center;
  gap: 10px;
}

.path {
  font-family: monospace;
  font-weight: 500;
}

:deep(.el-collapse) {
  border: none;
}

:deep(.collapse-item-wrap.post .el-collapse-item__header) {
  background: #e4fcec;
  border-radius: 8px;
  margin-bottom: 5px;
}

:deep(.collapse-item-wrap.get .el-collapse-item__header) {
  background: #ebf3fb;
  border-radius: 8px;
  margin-bottom: 5px;
}

.sub-title {
  font-size: 14px;
  color: #666;
  margin-bottom: 8px;
}

.under-line {
  border-bottom: 1px solid #e8e8e8;
}

.code-block {
  padding: 12px;
  border-radius: 6px;
  font-family: Consolas, monospace;
  font-size: 13px;
  overflow-x: auto;
  white-space: pre;
}

.code-block.dark {
  background-color: #1e293b;
  color: #e2e8f0;
}

.fixed-height {
  height: 200px;
}

</style>
