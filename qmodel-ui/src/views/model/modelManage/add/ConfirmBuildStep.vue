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
  <div class="confirm-build-step">
    <div class="build-tip">
      <div class="tip-icon">
        <el-icon size="20"><InfoFilled /></el-icon>
      </div>
      <div class="tip-content">
        <div class="tip-title">即将开始异步构建运行环境</div>
        <div class="tip-desc">
          系统将读取您上传脚本包内的requirements.txt自动安装第三方依赖；后续发起推理时，平台会加载入口文件main.py并调用标准predict函数执行运算。点击「确认并开始构建」后弹窗将关闭，您可在资源列表页查看任务运行状态与完整执行日志。        </div>
      </div>
    </div>

    <div class="dockerfile-section">
      <div class="section-title">
        <span class="title-icon">
          <el-icon><Document /></el-icon>
        </span>
        <span>模型运行环境</span>
      </div>
      <div class="dockerfile-preview">
        <div v-if="!dockerfileContent" class="dockerfile-empty">
          <el-icon size="48" class="empty-icon"><Loading /></el-icon>
          <div class="empty-text">加载中...</div>
        </div>
        <pre v-else class="dockerfile-content">{{ dockerfileContent }}</pre>
      </div>
    </div>
  </div>
</template>

<script setup name="ConfirmBuildStep">
import { ref } from 'vue'
import { InfoFilled, Document, Loading } from '@element-plus/icons-vue'

const dockerfileContent = ref(`python:3.11-alpine
json5:0.9.14
fastapi:0.103.0
uvicorn:0.27.1
onnxruntime:1.15.0
numpy:1.26.2
`)

const validate = () => {
  return Promise.resolve()
}

defineExpose({
  validate
})
</script>

<style lang="scss" scoped>
.confirm-build-step {
  padding: 20px 0;
}

.build-tip {
  display: flex;
  align-items: flex-start;
  background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%);
  border-radius: 8px;
  padding: 16px 20px;
  margin-bottom: 24px;

  .tip-icon {
    color: #d97706;
    margin-right: 12px;
    flex-shrink: 0;
  }

  .tip-content {
    flex: 1;
  }

  .tip-title {
    font-size: 16px;
    font-weight: 600;
    color: #92400e;
    margin-bottom: 8px;
  }

  .tip-desc {
    font-size: 14px;
    color: #b45309;
    line-height: 1.6;
  }
}

.dockerfile-section {
  background-color: #fff;
  border: 1px solid #e4e7ed;
  border-radius: 8px;
  padding: 20px;

  .section-title {
    display: flex;
    align-items: center;
    font-size: 16px;
    font-weight: 600;
    color: #303133;
    margin-bottom: 16px;

    .title-icon {
      margin-right: 8px;
      color: #409eff;
    }
  }

  .dockerfile-preview {
    border: 1px solid #d9d9d9;
    border-radius: 8px;
    overflow: hidden;
    min-height: 200px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .dockerfile-empty {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #909399;

    .empty-icon {
      margin-bottom: 12px;
      animation: rotate 1.5s linear infinite;
    }

    .empty-text {
      font-size: 14px;
    }
  }

  .dockerfile-content {
    margin: 0;
    padding: 16px;
    font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
    font-size: 14px;
    line-height: 1.6;
    color: #303133;
    background-color: #fafafa;
    white-space: pre-wrap;
    word-break: break-all;
    width: 100%;
    box-sizing: border-box;
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
</style>
