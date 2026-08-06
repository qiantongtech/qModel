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
  <div>
    <div class="infotop">
      <div class="h2-titles">服务信息</div>
      <div>
        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">Base URL</div>
              <div class="infotop-row-value">
                <el-tooltip
                    :content="baseUrl || '-'"
                    placement="top"
                    effect="light"
                >
                  <span class="ellipsis-text">
                    {{ baseUrl || "-" }}
                  </span>
                </el-tooltip>
              </div>
            </div>
            <div class="info-tip">
              <el-icon>
                <InfoFilled/>
              </el-icon>
              <span>Base URL 需要和接口定义中的地址拼接成完整的 URL 进行调用</span>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">鉴权方式(API Key)</div>
              <div class="infotop-row-value">
                <el-tooltip
                    content="Authorization: Bearer &lt;YOUR_KEY&gt;"
                    placement="top"
                    effect="light"
                >
                  <span class="ellipsis-text">
                    Authorization: Bearer &lt;YOUR_KEY&gt;
                  </span>
                </el-tooltip>
              </div>
            </div>
            <div class="info-tip">
              <el-icon>
                <InfoFilled/>
              </el-icon>
              <span>KEY 可以从 密钥管理 中进行获取</span>
            </div>
          </el-col>

          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">鉴权位置</div>
              <div class="infotop-row-value">
                <el-tooltip
                    content="Request Headers(请求头)"
                    placement="top"
                    effect="light"
                >
                  <span class="ellipsis-text">Request Headers(请求头)</span>
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
                <el-tag type="success" effect="dark" size="small"
                        style="margin-left: 10px;background: #009e21!important;color: #ffffff!important;">POST
                </el-tag>
                <span class="path">/predict</span>
                <span>执行模型推理预测</span>
              </div>
            </template>

            <el-row :gutter="20" class="api-panel">
              <!-- 请求参数 -->
              <el-col :span="12">
                <div class="sub-title under-line">请求参数 (Request Body)</div>
                <pre class="code-block dark fixed-height">{{ getInputSchema() }}</pre>
              </el-col>
              <!-- 响应结果 -->
              <el-col :span="12">
                <div class="sub-title under-line">响应结果 (Response)</div>
                <pre class="code-block dark fixed-height">{{ getOutputSchema() }}</pre>
              </el-col>
            </el-row>
            <!-- 调用示例 -->
            <el-row :gutter="20" class="api-panel">
              <el-col :span="24">
                <div class="demo-section">
                  <div class="sub-title">调用示例 (Call Example)</div>
                  <el-tabs v-model="demoTab" type="border-card">
                    <el-tab-pane label="CURL" name="curl">
                      <div class="code-wrap">
                        <el-button
                            class="copy-btn"
                            icon="DocumentCopy"
                            size="small"
                            @click="copyCode('post', '/predict','curl')"
                        />
                        <pre class="code-block dark">{{ genCURLExampleCode("post", "/predict") }}</pre>
                      </div>
                    </el-tab-pane>
                    <el-tab-pane label="Python (requests)" name="python">
                      <div class="code-wrap">
                        <el-button
                            class="copy-btn"
                            icon="DocumentCopy"
                            size="small"
                            @click="copyCode('post', '/predict','python')"
                        />
                        <pre class="code-block dark">{{ genPythonExampleCode("post", "/predict") }}</pre>
                      </div>
                    </el-tab-pane>
                    <el-tab-pane label="Node.js (axios)" name="node">
                      <div class="code-wrap">
                        <el-button
                            class="copy-btn"
                            icon="DocumentCopy"
                            size="small"
                            @click="copyCode('post', '/predict','node')"
                        />
                        <pre class="code-block dark">{{ genNodeExampleCode("post", "/predict") }}</pre>
                      </div>

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

</template>

<script setup name="modelApi">
import {ref, getCurrentInstance} from "vue";

const {proxy} = getCurrentInstance();

const rawBaseApi = import.meta.env.VITE_APP_BASE_API ?? '';
const baseApi = rawBaseApi.endsWith('/') ? rawBaseApi : rawBaseApi + '/';
const baseUrl = window.location.origin + baseApi + "v1/models";
const demoTab = ref('curl');
const activeNames = ref(['1']);
const loading = ref(false);

const props = defineProps({
  model: {
    type: Object,
    default: null,
    required: true,
  },
});

// 获取输入参数Schema
function getInputSchema() {
  let result = null;
  if (props.model.accessType === "API") {
    result = props.model.modelConfig.inputSchema;
  } else if (props.model.accessType === "PYTHON") {
    result = props.model.modelFileResourceRespVO ? props.model.modelFileResourceRespVO.inputSchema : null;
  }

  if (result) {
    return result;
  } else {
    return "{}";
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
  let modelCode = props.model.code;
  method = method.toUpperCase()

  let arr = [];
  arr.push(`curl -X ${method} "${baseUrl}${path}"`);
  arr.push(`-H "Authorization: Bearer <YOUR_KEY>"`);
  arr.push(`-H "Content-Type: application/json"`);
  arr.push(`-d '{"modelCode":"${modelCode}","param":${paramExampleStr}}'`);
  return arr.join("\n");
}

// 生成Python示例代码
function genPythonExampleCode(method, path) {
  const inputSchema = JSON.parse(getInputSchema());
  let paramExample = buildEmptyDataBySchema(inputSchema)
  let paramExampleStr = JSON.stringify(paramExample)
  let modelCode = props.model.code;

  let arr = [];
  arr.push(`import requests`);
  arr.push(`url = "${baseUrl}${path}"`);
  arr.push(`headers = {`);
  arr.push(`  "Authorization": "Bearer <YOUR_KEY>",`);
  arr.push(`  "Content-Type": "application/json"`);
  arr.push(`}`);
  arr.push(`payload = {`);
  arr.push(`  "modelCode":"${modelCode}",`);
  arr.push(`  "param":${paramExampleStr}`);
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
  let modelCode = props.model.code;

  let arr = [];
  arr.push(`import axios from 'axios';`);
  arr.push(`async function run() {`);
  arr.push(`  const url = "${baseUrl}${path}";`);
  arr.push(`  const data = {`);
  arr.push(`      "modelCode":"${modelCode}",`);
  arr.push(`      "param":${paramExampleStr}`);
  arr.push(`   };`);
  arr.push(`  const headers = {`);
  arr.push(`       "Authorization": "Bearer <YOUR_KEY>",`);
  arr.push(`       "Content-Type": "application/json"`);
  arr.push(`   };`);
  arr.push(`  const res = await axios.post(url,data, {headers:headers})`);
  arr.push(`  console.log(res.data);`);
  arr.push(`}`);
  arr.push(`run();`);
  return arr.join("\n");

}

// 生成参数示例
function buildEmptyDataBySchema(schema) {
  if (!schema) return {};

  if (schema.$ref) {
    return {};
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
      return {};
  }
}

function copyCode(method, path,type) {
  let code = "";
  switch (type) {
    case 'curl':
      code = genCURLExampleCode(method, path);break;
    case 'python':
      code = genPythonExampleCode(method, path);break;
    case 'node':
      code = genNodeExampleCode(method, path);break;
  }
  const ta = document.createElement('textarea');
  ta.value = code;
  ta.style.position = 'fixed';
  ta.style.left = '-9999px';
  document.body.appendChild(ta);
  ta.select();
  document.execCommand('copy'); // 旧API
  ta.remove();
  proxy.$modal.msgSuccess("已复制");
}
</script>

<style lang="scss" scoped>
.code-wrap {
  position: relative;
}

.code-wrap .copy-btn {
  position: absolute;
  top: 8px;
  right: 8px;
  z-index: 10;
  opacity: 0;
  transition: opacity 0.2s;
}
.code-wrap:hover .copy-btn {
  opacity: 1;
}
.code-block {
  margin: 0;
  /* 给右上角按钮留出顶部空间，防止代码被遮挡 */
  padding: 40px 12px 12px;
  white-space: pre-wrap;
}

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
  height: 250px;
}

.ellipsis-text {
  display: inline-block;
  width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  vertical-align: middle;
}

.info-tip {
  display: flex;
  flex-direction: row;
  align-items: center;
  font-size: x-small;
  color: #a8aaae;
  margin-left: 5px;
  margin-top: 5px;
  justify-content: flex-start;
  gap: 5px;
}

</style>
