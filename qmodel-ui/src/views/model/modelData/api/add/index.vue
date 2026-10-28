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
  <div class="app-container model-api-add-page" ref="app-container">
    <div class="custom-card">
      <div class="steps-inner">
        <ul class="zl-step">
          <li
            v-for="(item, index) in stepsList"
            :key="index"
            :class="[
              {
                statusEnd: activeStep === index,
                prevStep: index < activeStep,
                cur: index > activeStep,
              },
              `step-${index + 1}`,
            ]"
          >
            <div
              class="step-circle"
              :class="{
                active: activeStep === index,
                prev: index < activeStep,
              }"
            >
              <span>{{ index + 1 }}</span>
            </div>
            <span class="step-name">{{ item.name }}</span>
          </li>
        </ul>
      </div>
    </div>

    <div class="pagecont-top">
      <div class="main">
        <BasicInfoStep
          v-show="activeStep === 0"
          ref="step1Ref"
          v-model:form-data="form"
          :dict-api-type="model_data_api_type"
          :dict-request-method="model_access_mode"
          :dict-content-type="content_type"
          :dict-inject-position="auth_inject_position"
          :dict-auth-type="auth_type"
        />

        <ParamDefineStep
          v-show="activeStep === 1"
          ref="step2Ref"
          v-model:form-data="form"
          :dict-request-method="model_access_mode"
          :dict-content-type="content_type"
          :dict-auth-type="auth_type"
          :dict-inject-position="auth_inject_position"
        />

        <TestSaveStep
          v-show="activeStep === 2"
          ref="step3Ref"
          v-model:form-data="form"
        />
      </div>
    </div>

    <div class="button-style">
      <el-button type="primary" @click="handleCancel">返回列表</el-button>
      <el-button v-if="activeStep > 0" @click="handlePrevStep">上一步</el-button>
      <el-button v-if="activeStep < 2" @click="handleNextStep">下一步</el-button>
      <el-button
        v-if="activeStep === 2"
        type="primary"
        :loading="submitLoading"
        @click="handleSubmit"
      >
        确定并保存
      </el-button>
    </div>
  </div>
</template>

<script setup name="ModelDataApiAdd">
import { ref, reactive, onMounted, getCurrentInstance } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import useTagsViewStore from "@/store/system/tagsView";
import { getModelDataApi, addModelDataApi, updateModelDataApi } from "@/api/model/modelData/modelDataApi";
import BasicInfoStep from './basicInfoStep.vue';
import ParamDefineStep from './paramDefineStep.vue';
import TestSaveStep from './testSaveStep.vue';

const { proxy } = getCurrentInstance();
const route = useRoute();
const router = useRouter();
const tagsViewStore = useTagsViewStore();

const activeStep = ref(0);
const submitLoading = ref(false);
const isEdit = ref(false);
const step1Ref = ref(null);
const step2Ref = ref(null);
const step3Ref = ref(null);

const {
  model_data_api_type,
  model_access_mode,
  content_type,
  auth_type,
  auth_inject_position
} = proxy.useDict(
  "model_data_api_type",
  "model_access_mode",
  "content_type",
  "auth_type",
  "auth_inject_position"
);

const stepsList = [
  { name: "基础信息", id: 0 },
  { name: "参数与接口配置", id: 1 },
  { name: "测试与保存", id: 2 }
];

const form = reactive({
  id: null,
  name: '',
  modelId: null,
  apiType: null,
  apiUrl: '',
  requestMethod: '1',
  contentType: 'application/json',
  timeoutSeconds: 30,
  authType: 'NONE',
  authMethod: 'apiKey',
  authInjectPos: 'Header',
  authKeyName: null,
  authTokenPrefix: '',
  authTokenValue: '',
  authDynMethod: 'POST',
  authDynUrl: '',
  authDynHeaders: '',
  authDynParams: '',
  authDynBody: '',
  authExtractPath: '',
  requestTemplate: '',
  batchParams: '',
  inputSchema: '',
  outputSchema: '',
  description: '',
  remark: ''
});

onMounted(() => {
  const editId = route.query.id;
  if (editId) {
    isEdit.value = true;
    updateRouteTitle("修改API接入数据");
    loadData(editId);
  } else {
    updateRouteTitle("新增API接入数据");
  }
});

const updateRouteTitle = (title) => {
  route.meta.title = title;
  tagsViewStore.updateVisitedView(route);
};

const loadData = (id) => {
  getModelDataApi(id).then(res => {
    Object.assign(form, res.data);
  });
};

const handleCancel = () => {
  const message = isEdit.value
    ? "确认取消修改吗？已修改的内容将不会保存。"
    : "确认取消新增吗？已填写的内容将不会保存。";
  proxy.$modal.confirm(message).then(() => {
    router.push('/data/api');
  });
};

const handlePrevStep = () => {
  if (activeStep.value > 0) activeStep.value--;
};

const handleNextStep = async () => {
  try {
    if (activeStep.value === 0) {
      await step1Ref.value.validate();
    } else if (activeStep.value === 1) {
      await step2Ref.value.validate();
    }
    activeStep.value++;
  } catch (e) {
    // 校验失败
  }
};

const handleSubmit = async () => {
  submitLoading.value = true;
  try {
    if (form.id) {
      await updateModelDataApi(form);
      proxy.$modal.msgSuccess("修改成功");
    } else {
      await addModelDataApi(form);
      proxy.$modal.msgSuccess("新增成功");
    }
    router.push('/data/api');
  } catch (e) {
    proxy.$modal.msgError(e.msg || "保存失败");
  } finally {
    submitLoading.value = false;
  }
};
</script>

<style lang="scss" scoped>
.model-api-add-page {
  background-color: #f0f2f5;
  display: flex;
  flex-direction: column;
  height: 100%;
  position: relative;
  overflow: hidden;
}

.custom-card {
  width: 100%;
  height: 100px;
  padding: 34px 177px 26px 189px;
  background: #fff;
  box-sizing: border-box;
  margin-bottom: 15px;

  .zl-step {
    list-style: none;
    display: flex;
    align-items: center;
    padding: 0;
    margin: 0;
    height: 30px;

    li {
      position: relative;
      flex: 1;
      height: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: #d7d8da;
      color: #666;
      font-weight: 500;
      transition: all 0.3s;

      &.step-1 {
        z-index: 3;
        clip-path: polygon(0 0, calc(100% - 20px) 0, 100% 50%, calc(100% - 20px) 100%, 0 100%);
      }
      &.step-2 {
        z-index: 2;
        margin-left: -10px;
        clip-path: polygon(0 0, calc(100% - 20px) 0, 100% 50%, calc(100% - 20px) 100%, 0 100%);
        &::before { content: ""; position: absolute; left: 0; top: 0; width: 20px; height: 100%; background: #fff; clip-path: polygon(0 0, 100% 50%, 0 100%); z-index: 2; }
      }
      &.step-3 {
        z-index: 1;
        margin-left: -10px;
        clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
        &::before { content: ""; position: absolute; left: 0; top: 0; width: 20px; height: 100%; background: #fff; clip-path: polygon(0 0, 100% 50%, 0 100%); z-index: 2; }
      }

      &.statusEnd { background: linear-gradient(270deg, #e9effe 0%, #5589fa 100%); color: #2666fb !important; }
      &.prevStep { background: #e9effe !important; color: #2666fb !important; }
      &.cur { background: #f1f1f5; color: #404040; }
    }

    .step-circle {
      width: 26px;
      height: 26px;
      border-radius: 50%;
      background: #f1f1f5;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      margin-right: 11px;
      font-size: 18px;
      font-weight: bold;
      border: 1px solid #b2b2b2;
      flex-shrink: 0;
      transition: all 0.3s;
      &.active { background: #2666fb; color: #fff; border-color: #fff; }
      &.prev { background: #f1f1f5 !important; border: 1px solid #2666fb !important; color: #2666fb !important; }
    }

    .step-name {
      font-size: 16px;
      font-weight: 500;
    }
  }
}

.pagecont-top {
  flex: 1;
  background-color: #fff;
  overflow: hidden;
  position: relative;
}

.main {
  height: 100%;
  padding: 0px 25px 70px;
  overflow-y: auto;
  box-sizing: border-box;
}

.button-style {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 15px 35px 25px 0px;
  background: #fff;
  text-align: right;
  z-index: 10;
  border-top: none; // 去除边框
}
</style>