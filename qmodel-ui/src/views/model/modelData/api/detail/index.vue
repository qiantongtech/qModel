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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom: 15px">
      <div class="infotop">
        <div class="infotop-title mb15">
          <div class="task-item">
            <div class="task-id">
              {{ modelDataApiDetail.id || "-" }}
            </div>
            <div class="task-name">
              <el-tooltip :content="modelDataApiDetail.name || ''" placement="top" effect="light" :disabled="!textOverflowMap.name">
                <span class="ellipsis-text" @mouseenter="(event) => checkTextOverflow(event, 'name')">{{ modelDataApiDetail.name || "" }}</span>
              </el-tooltip>
            </div>
          </div>
          <el-row :gutter="15" class="btn-style" style="margin-left: auto">
            <el-col :span="1.5">
              <el-button
                type="primary"
                size="small"
                class="fhbtn"
                plain
                @click="goBack"
                @mousedown="(e) => e.preventDefault()"
              >
                <svg-icon
                  style="width: 12px; height: 12px; margin-right: 3px"
                  iconClass="fhs"
                />
                返回
              </el-button>
            </el-col>
          </el-row>
        </div>

        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">请求方式</div>
              <div class="infotop-row-value">
                <dict-tag :options="requestMethodOptions" :value="modelDataApiDetail.requestMethod" />
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">鉴权类型</div>
              <div class="infotop-row-value">
                <dict-tag :options="auth_type" :value="modelDataApiDetail.authType" />
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">Content-Type</div>
              <div class="infotop-row-value">
                <dict-tag :options="content_type" :value="modelDataApiDetail.contentType" />
              </div>
            </div>
          </el-col>
        </el-row>

        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">超时时间</div>
              <div class="infotop-row-value">
                {{ modelDataApiDetail.timeoutSeconds || "-" }} 秒
              </div>
            </div>
          </el-col>
          <el-col :span="16">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">接口地址</div>
              <div class="infotop-row-value">
                <el-tooltip :content="modelDataApiDetail.apiUrl || '-'" placement="top" effect="light" :disabled="!textOverflowMap.apiUrl">
                  <span class="ellipsis-text" @mouseenter="(event) => checkTextOverflow(event, 'apiUrl')">{{ modelDataApiDetail.apiUrl || "-" }}</span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
        </el-row>


        <el-row :gutter="3">
          <el-col :span="24">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">备注</div>
              <div class="infotop-row-value">
                <el-tooltip :content="modelDataApiDetail.remark || '-'" placement="top" effect="light" :disabled="!textOverflowMap.remark">
                  <div class="ellipsis-2" @mouseenter="(event) => checkTextOverflow(event, 'remark')">{{ modelDataApiDetail.remark || "-" }}</div>
                </el-tooltip>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>

    <div class="pagecont-bottom">
      <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
        <el-tab-pane label="在线调试" name="1">
          <component-one :bid-id="id"></component-one>
        </el-tab-pane>
        <el-tab-pane label="调用记录" name="2">
          <component-two :bid-id="id"></component-two>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script setup name="ModelDataApiDetail">
import { ref, reactive, toRefs, watch, computed, getCurrentInstance } from "vue";
import { useRoute, useRouter } from 'vue-router';
import { getModelDataApi } from "@/api/model/modelData/modelDataApi";
import ComponentOne from "./componentOne.vue";
import ComponentTwo from "./componentTwo.vue";

const { proxy } = getCurrentInstance();
const route = useRoute();
const router = useRouter();

const activeName = ref('1');
const showSearch = ref(true);
const id = ref(route.query.id);

const textOverflowMap = reactive({});
const checkTextOverflow = (event, field) => {
  const element = event.currentTarget;
  if (element) {
    textOverflowMap[field] = element.scrollWidth > element.clientWidth || element.scrollHeight > element.clientHeight;
  }
};

const data = reactive({
  modelDataApiDetail: {},
});

const { modelDataApiDetail } = toRefs(data);

// 字典数据
const { model_data_api_type, model_access_mode, content_type, auth_type } = proxy.useDict(
  "model_data_api_type",
  "model_access_mode",
  "content_type",
  "auth_type"
);

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

const handleClick = (tab, event) => {
  console.log(tab, event);
};

const goBack = () => {
  router.push('/data/api');
};

/** 获取详情 */
function getModelDataApiDetailById() {
  if (!id.value) return;
  getModelDataApi(id.value).then(response => {
    modelDataApiDetail.value = response.data;
  });
}

// 监听 id 变化
watch(
  () => route.query.id,
  (newId) => {
    id.value = newId;
    if (newId) {
      getModelDataApiDetailById();
    }
  },
  { immediate: true }
);

</script>

<style lang="scss" scoped>
.form-readonly {
  width: 100%;
  border: 1px solid #f1f1f1;
  padding: 0px 10px;
  min-height: 34px;
  background-color: #fcfcfc;
  border-radius: 2px;
  color: #333;
  display: flex;
  align-items: center;
  white-space: pre-wrap;
  word-wrap: break-word;
  word-break: break-all;
}

.form-readonly.textarea {
  min-height: 80px;
  padding: 10px;
  align-items: flex-start;
}

.justify-between {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.mb15 {
  margin-bottom: 15px;
}
</style>