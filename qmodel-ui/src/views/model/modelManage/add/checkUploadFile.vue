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
        <span class="title-icon">!</span>
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

    <div v-if="!uploadedFile && checkStatus === 'initial'" class="upload-area" @click="triggerFileInput" @drop.prevent="handleDrop" @dragover.prevent>
      <div class="upload-icon">
        <el-icon size="48"><Upload /></el-icon>
      </div>
      <div class="upload-text">点击或拖拽上传 ZIP 包</div>
      <div class="upload-hint">最大支持 500MB</div>
      <input ref="fileInputRef" type="file" accept=".zip" class="file-input" @change="handleFileChange" />
    </div>

    <div v-if="checkStatus === 'checking'" class="checking-status">
      <div class="status-icon">
        <el-icon size="48" class="loading-icon"><Loading /></el-icon>
      </div>
      <div class="status-text">正在上传算法模型包，并进行兼容性检测……</div>
    </div>

    <div v-if="checkStatus === 'success'" class="success-status">
      <span class="reupload-btn" @click="handleReupload">重新上传</span>
      <div class="status-header">
        <div class="status-icon success">
          <el-icon size="48"><CircleCheck /></el-icon>
        </div>
        <div class="status-text success">算法包校验通过</div>
      </div>
      <div class="check-results">
        <span class="result-tag success">✓ main.py 存在</span>
        <span class="result-tag success">✓ predict 函数存在</span>
        <span class="result-tag success">✓ requirements.txt 存在</span>
      </div>
    </div>

    <div v-if="checkStatus === 'failed'" class="failed-status">
      <span class="reupload-btn" @click="handleReupload">重新上传</span>
      <div class="status-header">
        <div class="status-icon failed">
          <el-icon size="48"><CircleClose /></el-icon>
        </div>
        <div class="status-text failed">算法包校验未通过</div>
      </div>
      <div class="check-results">
        <span class="result-tag" :class="checkDetail.mainPy ? 'success' : 'failed'">
          {{ checkDetail.mainPy ? '✓' : '✗' }} main.py {{ checkDetail.mainPy ? '存在' : '不存在' }}
        </span>
        <span class="result-tag" :class="checkDetail.predictFunction ? 'success' : 'failed'">
          {{ checkDetail.predictFunction ? '✓' : '✗' }} predict 函数{{ checkDetail.predictFunction ? '存在' : '不存在' }}
        </span>
        <span class="result-tag" :class="checkDetail.requirementsTxt ? 'success' : 'failed'">
          {{ checkDetail.requirementsTxt ? '✓' : '✗' }} requirements.txt {{ checkDetail.requirementsTxt ? '存在' : '不存在' }}
        </span>
      </div>
    </div>
  </div>
</template>

<script setup name="CheckUploadFile">
import { ref, reactive } from 'vue'
import { Upload, Loading, CircleCheck, CircleClose } from '@element-plus/icons-vue'
import { checkUploadFile } from '@/api/model/fileResource'
import { ElMessage } from 'element-plus'

const emit = defineEmits(['fileChecked'])

const fileInputRef = ref(null)
const uploadedFile = ref(null)
const checkStatus = ref('initial')
const checkDetail = reactive({
  mainPy: false,
  predictFunction: false,
  requirementsTxt: false
})

const triggerFileInput = () => {
  fileInputRef.value?.click()
}

const handleFileChange = (event) => {
  const file = event.target.files?.[0]
  if (file) {
    processFile(file)
  }
}

const handleDrop = (event) => {
  const file = event.dataTransfer?.files?.[0]
  if (file) {
    processFile(file)
  }
}

const processFile = async (file) => {
  if (!file.name.toLowerCase().endsWith('.zip')) {
    ElMessage.warning('请上传 ZIP 格式的文件')
    return
  }

  if (file.size > 500 * 1024 * 1024) {
    ElMessage.warning('文件大小不能超过 500MB')
    return
  }

  uploadedFile.value = file
  checkStatus.value = 'checking'

  try {
    const result = await checkUploadFile(file)
    handleCheckResult(result)
  } catch (error) {
    handleCheckError(error)
  }
}

const handleCheckResult = (result) => {
  const data = result.data || {}
  if (data.pass) {
    checkStatus.value = 'success'
    checkDetail.mainPy = true
    checkDetail.predictFunction = true
    checkDetail.requirementsTxt = true
    emit('fileChecked', { pass: true, file: uploadedFile.value, filePath: data.filePath })
  } else {
    checkStatus.value = 'failed'
    checkDetail.mainPy = data.mainPy || false
    checkDetail.predictFunction = data.predictFunction || false
    checkDetail.requirementsTxt = data.requirementsTxt || false
    emit('fileChecked', { pass: false, errors: data.errors })
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
  emit('fileChecked', { pass: false, errors })
}

const handleReupload = () => {
  uploadedFile.value = null
  checkStatus.value = 'initial'
  checkDetail.mainPy = false
  checkDetail.predictFunction = false
  checkDetail.requirementsTxt = false
  fileInputRef.value.value = ''
  emit('fileChecked', { pass: null })
}

const validate = () => {
  return checkStatus.value === 'success'
}

defineExpose({
  validate,
  checkStatus
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

  .title-icon {
    width: 24px;
    height: 24px;
    border-radius: 50%;
    background: #3b82f6;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 14px;
    font-weight: bold;
    margin-right: 8px;
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

.upload-area {
  border: 2px dashed #d9d9d9;
  border-radius: 8px;
  padding: 60px 40px;
  text-align: center;
  cursor: pointer;
  transition: all 0.3s ease;
  height: 260px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  &:hover {
    border-color: #409eff;
    background-color: #f5fafc;
  }

  &:active {
    border-color: #409eff;
  }
}

.upload-icon {
  color: #c0c4cc;
  margin-bottom: 16px;

  &:hover {
    color: #409eff;
  }
}

.upload-text {
  font-size: 16px;
  color: #606266;
  margin-bottom: 8px;
}

.upload-hint {
  font-size: 13px;
  color: #909399;
}

.file-input {
  display: none;
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
  height: 260px;
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

  &.failed {
    color: #f56c6c;
    font-weight: 600;
  }
}

.success-status {
  background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
  border-radius: 8px;
  padding: 60px 40px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
  height: 260px;
}

.failed-status {
  background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%);
  border-radius: 8px;
  padding: 60px 40px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
  height: 260px;
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

.reupload-btn {
  color: #409eff;
  font-size: 14px;
  cursor: pointer;
  position: absolute;
  top: 16px;
  right: 16px;

  &:hover {
    text-decoration: underline;
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
  padding: 2px 5px;
}

.result-tag {
  padding: 3px 20px;
  font-size: 13px;

  &.success {
    color: #2e7d32;
  }

  &.failed {
    color: #c62828;
  }
}
</style>
