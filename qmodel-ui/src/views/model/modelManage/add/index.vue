<!--
  Copyright (c) 2026 Jiangsu Qiantong Technology Co., Ltd.
   *
  Software Name: qModel Algorithm Model Platform (Commercial Edition)

   *
  [RIGHTS AND LICENSE STATEMENT]
  This file contains non-public commercial source code of which Jiangsu Qiantong
  Technology Co., Ltd. lawfully possesses complete intellectual property rights.
   *
  Access and use are limited to entities or individuals who have signed a valid
  commercial license agreement, within the scope stipulated in the agreement.
  The "accessibility" of this source code is premised on lawful authorization
  and does not constitute any form of transfer of intellectual property rights
  or implied licensing.
   *
  [PROHIBITIONS]
  Unless explicitly agreed in the license agreement, the following acts in any
  form are strictly prohibited:
  1. Copying, disseminating, disclosing, selling, renting, or redistributing
  this source code;
  2. Providing the software's functionality to third parties via SaaS, PaaS,
  cloud hosting, or other means;
  3. Using this software or its derivative versions to develop products that
  compete with the Right Holder;
  4. Providing or displaying this source code or related technical information
  to unauthorized third parties;
  5. Tampering with, circumventing, or destroying copyright notices, license
  verifications, or other technical protection measures.
   *
  [LEGAL LIABILITY]
  Any unauthorized use constitutes an infringement of trade secrets and
  intellectual property rights.
   *
  The Right Holder will strictly pursue liability for breach of contract and
  infringement in accordance with the commercial agreement and laws such as
  the "Copyright Law of the People's Republic of China" and the "Anti-Unfair
  Competition Law".
   *
  ============================================================================
   *
  Copyright (c) 2026 江苏千桐科技有限公司
   *
  软件名称：qModel 算法模型平台（商业版）
   *
  【权利与授权声明】
  本文件属于江苏千桐科技有限公司依法享有完全知识产权的非公开商业源代码。
  仅限已签署有效商业授权合同的单位或个人在约定范围内查阅和使用。
  源代码的“可访问性”均以合法授权为前提，不构成任何形式的知识产权转让或默示授权。
   *
  【禁止事项】
  除授权合同明确约定外，严禁任何形式的：
  1. 复制、传播、披露、出售、出租或再分发本源代码；
  2. 通过 SaaS、PaaS、云托管等方式向第三方提供本软件功能；
  3. 将本软件或其衍生版本用于开发与权利人构成竞争的产品；
  4. 向未授权第三方提供或展示本源代码或相关技术信息；
  5. 篡改、规避或破坏版权标识、授权校验及其他技术保护措施。
   *
  【法律责任】
  任何未经授权的利用行为，均构成对商业秘密及知识产权的侵害。
  权利人将依据商业合同及《中华人民共和国著作权法》《反不正当竞争法》
  等法律法规，严厉追究违约与侵权责任。
-->

<template>
  <div class="app-container model-add-page" ref="app-container">
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
      <div class="main" :class="{ 'step-3': activeStep === 2 }">
        <BasicInfoStep v-if="activeStep === 0"
            ref="basicStepRef"
            v-model:form-data="model"
            v-model:model-version="modelVersion"
            :classify-options="classifyOptions"
            :dict-access-type="model_access_type"
        />

        <ApiConfigStep v-if="activeStep === 1 && model.accessType === 'API'"
            ref="apiStepRef"
            v-model:form-data="modelConfig"
            :dict-request-method="model_access_mode"
            :dict-content-type="content_type"
            :dict-auth-type="auth_type"
            :dict-inject-position="auth_inject_position"
        />

        <CheckUploadFile v-if="activeStep === 1 && model.accessType === 'PYTHON'"
            ref="checkUploadFileRef"
            :file-resource="fileResource"
            @file-checked="handleFileChecked"
        />

        <ParamDefineStep v-if="activeStep === 2"
            ref="paramStepRef"
            v-model:form-data="inputSchema"
        />

        <TestSaveStep v-if="activeStep === 3 && model.accessType === 'API'"
            ref="testStepRef"
            v-model:form-data="modelConfig"
        />

        <ConfirmBuildStep v-if="activeStep === 3 && model.accessType === 'PYTHON'"
            ref="confirmBuildStepRef"
            :file-path="fileResource.filePath"
            v-model:build-type="fileResource.buildType"
        />
      </div>
    </div>

    <div class="button-style" :class="{ 'step-3': activeStep === 2 }">
      <el-button type="primary" @click="handleCancel">返回列表</el-button>
      <el-button v-if="activeStep > 0" @click="handlePrevStep">上一步</el-button>
      <el-button v-if="activeStep < 3" @click="handleNextStep">下一步</el-button>
      <el-button
          v-if="activeStep === 3 && model.accessType === 'API'"
          type="primary"
          :loading="submitLoading"
          @click="handleSubmit"
      >
        确定并退出
      </el-button>
      <el-button
          v-if="activeStep === 3 && model.accessType === 'PYTHON'"
          type="primary"
          :loading="submitLoading"
          @click="handleSubmit"
      >
        确认并开始构建
      </el-button>
    </div>
  </div>
</template>

<script setup name="ModelManageAdd">
import {computed, onMounted, ref} from "vue";
import {useRoute, useRouter} from "vue-router";
import {addModelVO, getModelVO, updateModelVO,addModelVersion,updateModelVersion} from "@/api/model/model";
import {listClassify} from "@/api/model/classify";
import BasicInfoStep from "./basicInfoStep.vue";
import ApiConfigStep from "./apiConfigStep.vue";
import CheckUploadFile from "./checkUploadFile.vue";
import ParamDefineStep from "./paramDefineStep.vue";
import TestSaveStep from "./testSaveStep.vue";
import ConfirmBuildStep from "./confirmBuildStep.vue";

const {proxy} = getCurrentInstance();
const route = useRoute();
const router = useRouter();

const {
  model_access_type,
  model_access_mode,
  content_type,
  auth_type,
  auth_inject_position,
} = proxy.useDict(
    "model_access_type",
    "model_access_mode",
    "content_type",
    "auth_type",
    "auth_inject_position"
);

const activeStep = ref(0);
const submitLoading = ref(false);
const classifyOptions = ref([]);
const basicStepRef = ref(null);
const apiStepRef = ref(null);
const checkUploadFileRef = ref(null);
const paramStepRef = ref(null);
const testStepRef = ref(null);
const confirmBuildStepRef = ref(null);

const model = ref({})
const modelVersion = ref({})
const modelConfig = ref({})
const fileResource = ref({});

const accessType = ref("");

const stepsList = computed(() => {
  if (model.value.accessType === "PYTHON") {
    return [
      {name: "基础配置", id: 0},
      {name: "文件上传与校验", id: 1},
      {name: "参数定义", id: 2},
      {name: "确认构建", id: 3},
    ];
  }
  return [
    {name: "基础配置", id: 0},
    {name: "API 配置", id: 1},
    {name: "参数定义", id: 2},
    {name: "测试与保存", id: 3},
  ];
});

const inputSchema = computed({
  get() {
    if (model.value.accessType === "API") {
      return modelConfig.value;
    } else if (model.value.accessType === "PYTHON") {
      return fileResource.value;
    }
  },
  set(newVal) {
    if (model.value.accessType === "API") {
      modelConfig.value = newVal;
    } else if (model.value.accessType === "PYTHON") {
      fileResource.value = newVal;
    }
  }
})

let tipText = "新增模型";

onMounted(() => {
  getClassifyOptions();
  tipText = route.meta.title;
  const editId = route.query.id;
  const version = route.query.version;
  if (editId) {
    loadModelData(editId,version);
  }
});

const loadModelData = async (id,version) => {
  try {
    const modelRes = await getModelVO(id,version);
    model.value = modelRes.data.model;
    const modelData = modelRes.data.model;
    accessType.value = modelData.accessType;
    modelVersion.value = modelRes.data.modelVersion;
    if (!modelVersion.value.baseVersion){
      modelVersion.value.baseVersion = version;
    }

    if (model.value.accessType === "API") {
      modelConfig.value = modelRes.data.modelConfig;
    } else if (model.value.accessType === "PYTHON") {
      fileResource.value = modelRes.data.fileResource;
    }
  } catch (error) {
    proxy.$modal.msgError("加载模型数据失败");
  }
};

const getClassifyOptions = () => {
  listClassify().then((res) => {
    const data = res.data || [];
    for (let i = 0; i < data.length; i++) {
      const arrTemp = [];
      for (let j = 0; j < data.length; j++) {
        if (data[i].id == data[j].parentId) {
          data[i].children = arrTemp;
          arrTemp.push(data[j]);
        }
      }
    }
    const result = [];
    for (let i = 0; i < data.length; i++) {
      if (data[i].parentId == 0) {
        result.push(data[i]);
      }
    }
    classifyOptions.value = result;
  });
};

const handleFileChecked = (result) => {
  if (result.pass) {
    fileResource.value.uploadedFile = result.file;
    fileResource.value.filePath = result.filePath || "";
    if (result.fileName){
      fileResource.value.fileName = result.fileName
    }
    if (result.fileSize){
      fileResource.value.fileSize = result.fileSize;
    }
    fileResource.value.inputSchema = fileResource.value.inputSchema || "";
  } else {
    fileResource.value.uploadedFile = null;
    fileResource.value.filePath = "";
    fileResource.value.fileName = "";
    fileResource.value.inputSchema = fileResource.value.inputSchema || "";
  }
};

// 取消
const handleCancel = () => {
  const message = "确认取消" + tipText + "吗？已修改的内容将不会保存。"
  proxy.$modal.confirm(message)
      .then(() => {cancel();});
};

// 返回
function cancel() {
  let param;
  if (['ModelManageAdd','ModelManageEdit'].includes(route.name)){
    param = {path: "/model/manage"}
  }else if (['modelVersionAdd','modelVersionEdit'].includes(route.name)){
    param = {
      path: "/model/modelManageView",
      query: { modelId: model.value.id, tab: "version" },
    }
  }
  router.push(param);
}

// 上一步
const handlePrevStep = () => {
  if (activeStep.value > 0) {
    activeStep.value--;
  }
};

// 下一步
const handleNextStep = async () => {
  try {
    if (activeStep.value === 0) {
      await basicStepRef.value.validate();
    }
    if (activeStep.value === 1) {
      if (model.value.accessType === "API") {
        await apiStepRef.value.validate();
      } else if (model.value.accessType === "PYTHON") {
        if (!checkUploadFileRef.value) {
          throw new Error("请上传并检测通过 ZIP 模型包");
        }
        checkUploadFileRef.value.validate();
      }
    }
    if (activeStep.value === 2) {
      await paramStepRef.value.validate();
    }
    if (activeStep.value === 3) {
      await testStepRef.value.validate();
    }
    if (activeStep.value < 3) {
      activeStep.value++;
    }
  } catch (error) {
    if (error.message !== ""){
      proxy.$modal.msgError(error?.message || "请上传并检测通过 ZIP 模型包");
    }
  }
};

// 提交
const handleSubmit = async () => {
  model.value.version = modelVersion.value.modelVersion;
  const param = {
    model: model.value,
    modelVersion: modelVersion.value,
    modelConfig: modelConfig.value,
    fileResource: fileResource.value,
  }

  try {
    switch (route.name){
      case 'ModelManageAdd'://新增模型
        await addModelVO(param);break;
      case 'ModelManageEdit':// 修改模型
        await updateModelVO(param);break;
      case 'modelVersionAdd':// 新增模型版本
        await addModelVersion(param);break;
      case 'modelVersionEdit':// 修改模型版本
        await updateModelVersion(param);break;
    }

    const successMsg = tipText + "成功";
    proxy.$modal.msgSuccess(successMsg);
    cancel();
  } catch (error) {
    proxy.$modal.msgError(error?.msg || error?.message || "保存模型失败，请检查网络或数据");
  } finally {
    submitLoading.value = false;
  }
};
</script>

<style lang="scss" scoped>
.model-add-page {
  position: relative;
  background-color: #f0f2f5;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  height: 100%;
}

.custom-card {
  width: 100%;
  height: 100px;
  padding: 34px 177px 26px 189px;
  background: #fff;
  box-sizing: border-box;
  margin-bottom: 15px;

  .steps-inner {
    padding: 0 10px;
    padding-left: 20px;
    display: flex;
    width: auto;
    color: #303133;
    transition: 0.3s;
    transform: translateZ(0);

    &::-webkit-scrollbar {
      height: 5px;
    }

    .zl-step {
      list-style: none;
      width: 100%;
      height: 30px;
      padding: 0;
      margin: 0 auto;
      cursor: pointer;
      display: flex;
      align-items: center;

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
        transition: background 0.3s;

        &.step-1 {
          z-index: 4;
          clip-path: polygon(
                  0 0,
                  calc(100% - 20px) 0,
                  100% 50%,
                  calc(100% - 20px) 100%,
                  0 100%
          );
        }

        &.step-2 {
          z-index: 3;
          margin-left: -10px;
          clip-path: polygon(
                  0 0,
                  calc(100% - 20px) 0,
                  100% 50%,
                  calc(100% - 20px) 100%,
                  0 100%
          );

          &::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 20px;
            height: 100%;
            background: #fff;
            clip-path: polygon(0 0, 100% 50%, 0 100%);
            z-index: 2;
          }
        }

        &.step-3 {
          z-index: 2;
          margin-left: -10px;
          clip-path: polygon(
                  0 0,
                  calc(100% - 20px) 0,
                  100% 50%,
                  calc(100% - 20px) 100%,
                  0 100%
          );

          &::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 20px;
            height: 100%;
            background: #fff;
            clip-path: polygon(0 0, 100% 50%, 0 100%);
            z-index: 2;
          }
        }

        &.step-4 {
          z-index: 1;
          margin-left: -10px;
          clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);

          &::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 20px;
            height: 100%;
            background: #fff;
            clip-path: polygon(0 0, 100% 50%, 0 100%);
            z-index: 2;
          }
        }

        &.statusEnd {
          background: linear-gradient(270deg, #e9effe 0%, #5589fa 100%);
          color: #2666fb !important;
        }

        &.prevStep {
          background: #e9effe !important;
          font-weight: normal;
          font-size: 16px !important;
          color: #2666fb !important;
        }

        &.cur {
          background: #f1f1f5;
          color: #404040;
          font-weight: 500;
        }
      }
    }

    .step-circle {
      width: 26px;
      height: 26px;
      border-radius: 50%;
      background: #f1f1f5;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-size: 18px;
      font-weight: bold;
      margin-right: 11px;
      border: 1px solid #b2b2b2;
      flex-shrink: 0;
      transition: all 0.3s;

      &.active {
        background: #2666fb;
        color: #fff;
        border: 1px solid #fff;
      }

      &.prev {
        background: #f1f1f5 !important;
        border: 1px solid #2666fb !important;
        color: #2666fb !important;
      }
    }

    .step-name {
      font-family: PingFang SC, PingFang SC;
      font-weight: 500;
      font-size: 16px;
    }
  }
}

.pagecont-top {
  flex: 1;
  height: auto;
  min-height: 0;
  position: relative;
  overflow: hidden;
  background-color: #fff;
}

.main {
  height: 100%;
  background-color: white;
  padding: 0px 25px 70px;
  overflow-y: auto;
  box-sizing: border-box;

  &.step-3 {
    padding-bottom: 90px;
  }
}

.button-style {
  //position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  padding: 15px 35px 25px 0px;
  background: #fff;
  text-align: right;
  z-index: 10;

  &.step-3 {
    height: 64px;
    padding: 0 35px 18px 0;
    display: flex;
    align-items: center;
    justify-content: flex-end;
  }
}
</style>
