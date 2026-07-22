<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
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
                cur: index > activeStep
              },
              `step-${index + 1}`
            ]"
          >
            <div
              class="step-circle"
              :class="{
                active: activeStep === index,
                prev: index < activeStep
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
        <BasicInfoStep
          v-show="activeStep === 0"
          ref="basicStepRef"
          v-model:form-data="form"
          :classify-options="classifyOptions"
          :dict-access-type="model_access_type"
        />

        <ApiConfigStep
          v-show="activeStep === 1 && form.accessType === 'API'"
          ref="apiStepRef"
          v-model:form-data="form"
          :dict-request-method="model_access_mode"
          :dict-content-type="content_type"
          :dict-auth-type="auth_type"
          :dict-inject-position="auth_inject_position"
        />

        <CheckUploadFile
          v-show="activeStep === 1 && form.accessType === 'PYTHON'"
          ref="checkUploadFileRef"
          :file-resource="fileResource"
          @file-checked="handleFileChecked"
        />

        <ParamDefineStep
          v-show="activeStep === 2"
          ref="paramStepRef"
          v-model:form-data="form"
        />

        <TestSaveStep
          v-show="activeStep === 3 && form.accessType === 'API'"
          ref="testStepRef"
          v-model:form-data="form"
        />

        <ConfirmBuildStep
          v-show="activeStep === 3 && form.accessType === 'PYTHON'"
          ref="confirmBuildStepRef"
          :file-path="form.filePath"
        />
      </div>
    </div>

    <div class="button-style" :class="{ 'step-3': activeStep === 2 }">
      <el-button type="primary" @click="handleCancel">返回列表</el-button>
      <el-button v-if="activeStep > 0" @click="handlePrevStep">上一步</el-button>
      <el-button v-if="activeStep < 3" @click="handleNextStep">下一步</el-button>
      <el-button v-if="activeStep === 3 && form.accessType === 'API'" type="primary" :loading="submitLoading" @click="handleSubmit">
        确定并退出
      </el-button>
      <el-button v-if="activeStep === 3 && form.accessType === 'PYTHON'" type="primary" :loading="submitLoading" @click="handleSubmit">
        确认并开始构建
      </el-button>
    </div>
  </div>
</template>

<script setup name="ModelManageAdd">
import { ref, reactive, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import useTagsViewStore from '@/store/system/tagsView'
import { addModel, getModel, updateModel, saveModelWithConfig } from '@/api/model/model'
import { listModelConfig } from '@/api/model/config'
import { listClassify } from '@/api/modelReconstitution/classify'
import BasicInfoStep from './basicInfoStep.vue'
import ApiConfigStep from './apiConfigStep.vue'
import CheckUploadFile from './checkUploadFile.vue'
import ParamDefineStep from './paramDefineStep.vue'
import TestSaveStep from './testSaveStep.vue'
import ConfirmBuildStep from './confirmBuildStep.vue'
import { listModelFileResource } from "@/api/model/fileResource.js";

const { proxy } = getCurrentInstance()
const route = useRoute()
const router = useRouter()
const tagsViewStore = useTagsViewStore()

const updateRouteTitle = (title) => {
  route.meta.title = title
  tagsViewStore.updateVisitedView(route)
}

const {
  model_access_type,
  model_access_mode,
  content_type,
  auth_type,
  auth_inject_position
} = proxy.useDict(
  'model_access_type',
  'model_access_mode',
  'content_type',
  'auth_type',
  'auth_inject_position'
)

const activeStep = ref(0)
const submitLoading = ref(false)
const classifyOptions = ref([])
const basicStepRef = ref(null)
const apiStepRef = ref(null)
const checkUploadFileRef = ref(null)
const paramStepRef = ref(null)
const testStepRef = ref(null)
const confirmBuildStepRef = ref(null)
const isEdit = ref(false)
const configId = ref(null)
const fileResource = ref(null)

const stepsList = computed(() => {
  if (form.accessType === 'PYTHON') {
    return [
      { name: '基础配置', id: 0 },
      { name: '文件上传与校验', id: 1 },
      { name: '参数定义', id: 2 },
      { name: '确认构建', id: 3 }
    ]
  }
  return [
    { name: '基础配置', id: 0 },
    { name: 'API 配置', id: 1 },
    { name: '参数定义', id: 2 },
    { name: '测试与保存', id: 3 }
  ]
})

const form = reactive({
  // 基础配置
  id: null,
  companyId: null,
  name: '',
  code: '',
  classifyId: null,
  accessType: 'API',
  version: 'V1.0',
  author: '',
  status: '0',
  tags: '',
  icon: '',
  description: '',
  remark: '',
  // API 配置
  apiUrl: '',
  requestMethod: 'POST',
  contentType: 'application/json',
  timeoutSeconds: 30,
  authType: 'NONE',
  authMethod: 'bearer',
  authInjectPosition: 'Header',
  authKeyName: null,
  authTokenPrefix: '',
  authTokenValue: '',
  authDynamicMethod: 'POST',
  authDynamicUrl: '',
  authDynamicHeaders: '',
  authDynamicParams: '',
  authDynamicBody: '',
  authExtractPath: '',
  // 参数定义
  inputSchema: '',
  outputSchema: '',
  // 测试与保存
  testBody: '',
  // Python 文件上传
  uploadedFile: null,
  filePath: '',
  fileName: '',
  fileResourceId: null
})

onMounted(() => {
  getClassifyOptions()
  const editId = route.query.id
  if (editId) {
    isEdit.value = true
    updateRouteTitle('修改模型')
    loadModelData(editId)
  } else {
    updateRouteTitle('新增模型')
  }
})

const normalizeAccessType = (val) => {
  if (val == null) return 'API'
  const str = String(val).toUpperCase()
  // 表结构注释：0-API接口, 1-Python本地
  if (str === 'API' || str === '0' || str === 'API接口') return 'API'
  if (str === 'PYTHON' || str === '1' || str === 'Python本地' || str === 'PYTHON本地') return 'PYTHON'
  return 'API'
}

const normalizeAuthType = (val) => {
  if (val == null) return 'NONE'
  const str = String(val).toUpperCase()
  if (str === 'NONE' || str === '0' || str === '无') return 'NONE'
  if (str === 'FIXED' || str === '1' || str === '固定TOKEN' || str === '固定 Token / API Key'.toUpperCase()) return 'FIXED'
  if (str === 'DYNAMIC' || str === '2' || str === '动态TOKEN' || str === '动态 Token API'.toUpperCase()) return 'DYNAMIC'
  return 'NONE'
}

const loadModelData = async (id) => {
  try {
    const modelRes = await getModel(id)
    const modelData = modelRes.data || {}
    const accessType = normalizeAccessType(modelData.accessType)
    Object.assign(form, {
      id: modelData.id,
      companyId: modelData.companyId,
      name: modelData.name || '',
      code: modelData.code || '',
      classifyId: modelData.classifyId || null,
      accessType,
      version: modelData.version || 'V1.0',
      author: modelData.author || '',
      status: modelData.status != null ? String(modelData.status) : '0',
      tags: modelData.tags || '',
      icon: modelData.icon || '',
      description: modelData.description || '',
      remark: modelData.remark || ''
    })

    if (accessType === 'API') {
      const configRes = await listModelConfig({ modelId: id })
      // listModelConfig 返回分页结构 { rows: [], total: 0 }
      const configList = configRes.data?.rows || configRes.data || []
      if (configList.length > 0) {
        const config = configList[0]
        configId.value = config.id
        const authType = normalizeAuthType(config.authType)
        Object.assign(form, {
          apiUrl: config.apiUrl || '',
          requestMethod: config.requestMethod || 'POST',
          contentType: config.contentType || 'application/json',
          timeoutSeconds: config.timeoutSeconds || 30,
          authType,
          authMethod: config.authMethod || 'apiKey',
          authInjectPosition: config.authInjectPosition || 'Header',
          authKeyName: config.authKeyName,
          authTokenPrefix: config.authTokenPrefix || '',
          authTokenValue: config.authTokenValue || '',
          authDynamicMethod: config.authDynamicMethod || 'POST',
          authDynamicUrl: config.authDynamicUrl || '',
          authDynamicHeaders: config.authDynamicHeaders || '',
          authDynamicParams: config.authDynamicParams || '',
          authDynamicBody: config.authDynamicBody || '',
          authExtractPath: config.authExtractPath || '',
          inputSchema: config.inputSchema || '',
          outputSchema: config.outputSchema || ''
        })
      }
    } else if (accessType === 'PYTHON') {
      const fileResRes = await listModelFileResource({ modelId: id })
      const fileResList = fileResRes.data?.rows || fileResRes.data || []
      if (fileResList.length > 0) {
        const fileRes = fileResList[0]
        fileResource.value = fileRes
        Object.assign(form, {
          fileResourceId: fileRes.id,
          filePath: fileRes.filePath || '',
          fileName: fileRes.fileName || '',
          inputSchema: fileRes.inputSchema || '',
          outputSchema: fileRes.outputSchema || ''
        })
      }
    }
  } catch (error) {
    ElMessage.error('加载模型数据失败')
    console.error(error)
  }
}

const getClassifyOptions = () => {
  listClassify().then((res) => {
    const data = res.data || []
    for (let i = 0; i < data.length; i++) {
      const arrTemp = []
      for (let j = 0; j < data.length; j++) {
        if (data[i].id == data[j].parentId) {
          data[i].children = arrTemp
          arrTemp.push(data[j])
        }
      }
    }
    const result = []
    for (let i = 0; i < data.length; i++) {
      if (data[i].parentId == 0) {
        result.push(data[i])
      }
    }
    classifyOptions.value = result
  })
}

const handleFileChecked = (result) => {
  console.log('[ModelAdd] handleFileChecked', result)
  if (result.pass) {
    form.uploadedFile = result.file
    form.filePath = result.filePath || ''
    form.fileName = result.fileName || ''
  } else {
    form.uploadedFile = null
    form.filePath = ''
    form.fileName = ''
  }
}

const handleCancel = () => {
  const message = isEdit.value ? '确认取消修改模型吗？已修改的内容将不会保存。' : '确认取消新增模型吗？已填写的内容将不会保存。'
  proxy.$modal
    .confirm(message)
    .then(() => {
      router.push('/model/version')
    })
    .catch(() => {})
}

const handlePrevStep = () => {
  if (activeStep.value > 0) {
    activeStep.value--
  }
}

const handleNextStep = async () => {
  try {
    if (activeStep.value === 0) {
      await basicStepRef.value.validate()
    }
    if (activeStep.value === 1) {
      if (form.accessType === 'API') {
        await apiStepRef.value.validate()
      } else if (form.accessType === 'PYTHON') {
        if (!checkUploadFileRef.value) {
          throw new Error('请上传并检测通过 ZIP 模型包')
        }
        checkUploadFileRef.value.validate()
      }
    }
    if (activeStep.value === 2) {
      await paramStepRef.value.validate()
    }
    if (activeStep.value === 3) {
      await testStepRef.value.validate()
    }
    if (activeStep.value < 3) {
      activeStep.value++
    }
  } catch (error) {
    ElMessage.error(error?.message || '请上传并检测通过 ZIP 模型包')
  }
}

const buildModelData = () => {
  const modelData = {
    id: isEdit.value ? form.id : undefined,
    companyId: form.companyId,
    name: form.name,
    code: form.code,
    classifyId: form.classifyId,
    accessType: form.accessType,
    version: form.version,
    author: form.author || null,
    status: form.status || '0',
    tags: form.tags || null,
    icon: form.icon || '',
    description: form.description || null,
    remark: form.remark || null
  }

  if (form.accessType === 'PYTHON') {
    modelData.filePath = form.filePath || undefined
    modelData.fileName = form.fileName || form.uploadedFile?.name || undefined
    modelData.fileSize = form.uploadedFile?.size ? Math.round(form.uploadedFile.size / (1024 * 1024)) : undefined
    modelData.scriptName = 'main.py'
    modelData.resourceType = '2'
    modelData.status = '2'
    modelData.modelVersion = 1
    modelData.inputSchema = form.inputSchema || undefined
    modelData.outputSchema = form.outputSchema || undefined
    modelData.fileResourceId = isEdit.value ? form.fileResourceId : undefined
    modelData.accessType = 'PYTHON'
  }

  return modelData
}

const buildConfigData = (modelId) => {
  const configData = {
    id: isEdit.value ? configId.value : undefined,
    companyId: form.companyId,
    modelId: modelId,
    apiUrl: form.apiUrl,
    requestMethod: form.requestMethod,
    contentType: form.contentType,
    timeoutSeconds: form.timeoutSeconds,
    authType: form.authType,
    inputSchema: form.inputSchema || null,
    outputSchema: form.outputSchema || null,
    remark: form.remark || null
  }

  if (form.authType === 'FIXED') {
    configData.authMethod = form.authMethod || null
    configData.authTokenValue = form.authTokenValue || null
    configData.authInjectPosition = form.authInjectPosition || null
    configData.authKeyName = form.authKeyName || null
    configData.authTokenPrefix = form.authTokenPrefix || null
  }

  if (form.authType === 'DYNAMIC') {
    configData.authDynamicMethod = form.authDynamicMethod || null
    configData.authDynamicUrl = form.authDynamicUrl || null
    configData.authDynamicHeaders = form.authDynamicHeaders || null
    configData.authDynamicParams = form.authDynamicParams || null
    configData.authDynamicBody = form.authDynamicBody || null
    configData.authExtractPath = form.authExtractPath || null
    configData.authTokenPrefix = form.authTokenPrefix || null
    configData.authInjectPosition = form.authInjectPosition || null
    configData.authKeyName = form.authKeyName || null
  }

  return configData
}

const handleSubmit = async () => {
  submitLoading.value = true
  console.log('[ModelAdd] handleSubmit start', { form, isEdit: isEdit.value })
  try {
    const modelData = buildModelData()
    console.log('[ModelAdd] modelData', modelData)

    if (form.accessType === 'API') {
      const configData = buildConfigData(modelData.id)
      const payload = {
        model: modelData,
        config: configData
      }
      await saveModelWithConfig(payload)
      if (form.authType === 'NONE') {
        apiStepRef.value?.clearAuthState()
      }
    } else {
      if (isEdit.value) {
        await updateModel(modelData)
      } else {
        await addModel(modelData)
      }
    }

    const successMsg = isEdit.value ? '修改模型成功' : '新增模型成功'
    ElMessage.success(successMsg)
    router.push('/model/version')
  } catch (error) {
    console.error('[ModelAdd] 保存模型失败：', error)
    ElMessage.error(error?.msg || error?.message || '保存模型失败，请检查网络或数据')
  } finally {
    submitLoading.value = false
    console.log('[ModelAdd] handleSubmit end')
  }
}
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
            content: '';
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
            content: '';
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
          clip-path: polygon(
              0 0,
              100% 0,
              100% 100%,
              0 100%
          );
          &::before {
            content: '';
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
      font-family:
          PingFang SC,
          PingFang SC;
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
  position: absolute;
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
