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
  <div class="check-upload-file">
    <div class="upload-conditions">
      <div class="conditions-title">
        <div class="tip-icon">
          <el-icon size="20">
            <InfoFilled/>
          </el-icon>
        </div>
        <span>上传前提条件</span>
      </div>
      <ul class="conditions-list">
        <li>
          <span class="condition-icon">•</span>
          <span>模型包格式必须为 <span class="keyword">.zip</span></span>
        </li>
        <li>
          <span class="condition-icon">•</span>
          <span>根目录必须包含 <span class="keyword">main.py</span> (统一执行入口)</span>
        </li>
        <li>
          <span class="condition-icon">•</span>
          <span><span>main.py</span> 中必须包含 <span class="keyword">predict</span> 函数 (用于返回结果)</span>
        </li>
        <li>
          <span class="condition-icon">•</span>
          <span>根目录必须包含 <span class="keyword">requirements.txt</span> (声明依赖库)</span>
        </li>
      </ul>
    </div>

    <div>
      <FileUpload
          :limit="1"
          :file-type="['zip']"
          :file-size="500"
          :drag-flag="true"
          :is-show-tip="true"
          @update:model-value="handleFileUpload"
          @update:file-name="handleFileName"
      ></FileUpload>
    </div>
  </div>
</template>

<script setup name="CheckUploadFile">
import {ref, reactive, watch} from 'vue'
import {Loading, CircleCheck, CircleClose, InfoFilled} from '@element-plus/icons-vue'
import FileUpload from '@/components/ModelFileUpload/index.vue'
import {checkUploadFile} from '@/api/model/fileResource'
import {ElMessage} from 'element-plus'

const emit = defineEmits(['fileChecked'])

const props = defineProps({
  fileResource: {
    type: Object,
    default: null
  }
})

const fileName = ref('')
const filePath = ref('')
const checkStatus = ref('initial')
const checkDetail = reactive({
  mainPy: false,
  predictFunction: false,
  requirementsTxt: false
})

watch(() => props.fileResource, (val) => {
  if (val && val.fileName && val.filePath) {
    fileName.value = val.fileName
    filePath.value = val.filePath
    checkStatus.value = 'success'
    checkDetail.mainPy = true
    checkDetail.predictFunction = true
    checkDetail.requirementsTxt = true
    emit('fileChecked', {pass: true, filePath: val.filePath})
  }
}, {immediate: true})

const handleFileName = (name) => {
  fileName.value = name
}

const handleFileUpload = async (value) => {
  if (!value) return

  checkStatus.value = 'checking'

  try {
    const response = await fetch(value)
    const blob = await response.blob()
    const file = new File([blob], fileName.value || 'model.zip', {type: 'application/zip'})
    const result = await checkUploadFile(file)
    handleCheckResult(result)
  } catch (error) {
    handleCheckError(error)
  }
}

const handleCheckResult = (result) => {
  const data = result.data || {}
  fileName.value = data.fileName || fileName.value
  filePath.value = data.filePath || ''
  if (data.pass) {
    checkStatus.value = 'success'
    checkDetail.mainPy = true
    checkDetail.predictFunction = true
    checkDetail.requirementsTxt = true
    ElMessage.success('算法包校验通过')
    emit('fileChecked', {pass: true, filePath: data.filePath})
  } else {
    checkStatus.value = 'failed'
    checkDetail.mainPy = data.mainPy || false
    checkDetail.predictFunction = data.predictFunction || false
    checkDetail.requirementsTxt = data.requirementsTxt || false
    
    let errorMsg = '模型包校验未通过：'
    if (!checkDetail.mainPy) errorMsg += 'main.py不存在；'
    if (!checkDetail.predictFunction) errorMsg += 'predict函数不存在；'
    if (!checkDetail.requirementsTxt) errorMsg += 'requirements.txt不存在；'
    
    ElMessage.error(errorMsg)
    emit('fileChecked', {pass: false, errors: data.errors})
  }
}

const handleCheckError = (error) => {
  checkStatus.value = 'failed'
  checkDetail.mainPy = false
  checkDetail.predictFunction = false
  checkDetail.requirementsTxt = false

  let errors = []
  const errorData = error?.response?.data || error?.data || {}

  if (errorData.mainPy !== undefined) {
    checkDetail.mainPy = errorData.mainPy
  }
  if (errorData.predictFunction !== undefined) {
    checkDetail.predictFunction = errorData.predictFunction
  }
  if (errorData.requirementsTxt !== undefined) {
    checkDetail.requirementsTxt = errorData.requirementsTxt
  }

  if (errorData.errors) {
    errors = errorData.errors
  } else if (errorData.msg) {
    errors = [errorData.msg]
  } else if (error?.message) {
    errors = [error.message]
  } else {
    errors = ['文件检测失败']
  }

  ElMessage.error(errors[0] || '文件检测失败')
  emit('fileChecked', {pass: false, errors})
}

const validate = () => {
  if (checkStatus.value !== 'success') {
    if (checkStatus.value === 'initial') {
      throw new Error('请先上传并校验模型包')
    } else if (checkStatus.value === 'failed') {
      let errorMsg = '模型包校验未通过：'
      if (!checkDetail.mainPy) errorMsg += 'main.py不存在；'
      if (!checkDetail.predictFunction) errorMsg += 'predict函数不存在；'
      if (!checkDetail.requirementsTxt) errorMsg += 'requirements.txt不存在；'
      throw new Error(errorMsg)
    } else if (checkStatus.value === 'checking') {
      throw new Error('正在校验中，请稍后')
    }
  }
  return true
}

defineExpose({
  validate,
  checkStatus,
  fileName,
  filePath
})
</script>

<style lang="scss" scoped>
.check-upload-file {
  padding: 20px 0;
}

.upload-conditions {
  background: linear-gradient(135deg, #e8f0fe 0%, #dbeafe 100%);
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 24px;
}

.conditions-title {
  display: flex;
  align-items: center;
  font-size: 18px;
  font-weight: 700;
  color: #1e40af;
  margin-bottom: 16px;

  .tip-icon {
    color: #3b82f6;
    margin-right: 12px;
    flex-shrink: 0;
  }
}

.conditions-list {
  list-style: none;
  padding: 0;
  margin: 0;

  li {
    display: flex;
    align-items: center;
    padding: 2px 0;
    font-size: 14px;
    color: #3b82f6;

    .condition-icon {
      color: #3b82f6;
      margin-right: 8px;
      flex-shrink: 0;
      font-size: 25px;
      display: flex;
      align-items: center;
      justify-content: center;
      line-height: 1;
    }

    .keyword {
      color: #1e40af;
      font-weight: 700;
    }
  }
}

.checking-status {
  background: linear-gradient(135deg, #e8f0fe 0%, #dbeafe 100%);
  border-radius: 8px;
  padding: 60px 40px;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 16px;
}

.status-icon {
  margin-bottom: 16px;

  .loading-icon {
    color: #3b82f6;
    animation: rotate 1.5s linear infinite;
  }

  &.success {
    color: #67c23a;
  }

  &.failed {
    color: #f56c6c;
  }
}

@keyframes rotate {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.status-text {
  font-size: 16px;

  &.success {
    color: #67c23a;
    font-weight: 600;
  }

  .file-name {
    font-weight: 700;
    color: black;
  }

  &.failed {
    color: #f56c6c;
    font-weight: 600;
  }
}

.success-status {
  background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
  border-radius: 8px;
  padding: 40px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 16px;
}

.failed-status {
  background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%);
  border-radius: 8px;
  padding: 40px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 16px;
}

.status-header {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-bottom: 20px;

  .status-icon {
    margin-bottom: 12px;
  }

  .status-text {
    text-align: center;
  }
}

.check-results {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
  justify-content: center;
  background-color: #fff;
  border: 1px solid #e4e7ed;
  border-radius: 8px;
  padding: 12px 20px;
}

.result-tag {
  padding: 4px 16px;
  font-size: 13px;
  border-radius: 4px;

  &.success {
    color: #2e7d32;
    background-color: #f0fdf4;
  }

  &.failed {
    color: #c62828;
    background-color: #fef2f2;
  }
}
</style>
