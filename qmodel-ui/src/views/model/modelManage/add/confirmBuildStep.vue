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
        模型运行环境
      </div>
      <div class="dockerfile-body">
        <div v-if="loading" class="dockerfile-empty">
          <el-icon size="48" class="empty-icon"><Loading /></el-icon>
          <div class="empty-text">加载中...</div>
        </div>
        <pre v-else class="dockerfile-content">{{ envContent }}</pre>
      </div>
    </div>
  </div>
</template>

<script setup name="ConfirmBuildStep">
import { ref, computed, onMounted, watch } from 'vue'
import { InfoFilled, Document, Loading } from '@element-plus/icons-vue'
import { ElMessage } from 'element-plus'
import { getBuildEnvInfo } from '@/api/model/fileResource'

const props = defineProps({
  filePath: {
    type: String,
    default: ''
  }
})

const loading = ref(false)
const pythonVersion = ref('')
const requirements = ref([])

const envContent = computed(() => {
  if (!pythonVersion.value && requirements.value.length === 0) {
    return ''
  }
  let content = `python:${pythonVersion.value}-alpine\n`
  requirements.value.forEach(req => {
    content += `${req}\n`
  })
  return content
})

const fetchEnvInfo = async () => {
  if (!props.filePath) return

  loading.value = true
  try {
    const result = await getBuildEnvInfo(props.filePath)
    const data = result.data || {}
    pythonVersion.value = data.pythonVersion || '3.11'
    requirements.value = data.requirements || []
  } catch (error) {
    console.error('[ConfirmBuildStep] 获取构建环境信息失败:', error)
    requirements.value = []
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  fetchEnvInfo()
})

watch(() => props.filePath, () => {
  fetchEnvInfo()
})

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
  background: linear-gradient(135deg, #e8f0fe 0%, #dbeafe 100%);
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 24px;

  .tip-icon {
    color: #3b82f6;
    margin-right: 12px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    line-height: 1;
    padding-top: 3px;
  }

  .tip-content {
    flex: 1;
  }

  .tip-title {
    font-size: 16px;
    font-weight: 700;
    color: #1e40af;
    margin-bottom: 6px;
  }

  .tip-desc {
    font-size: 14px;
    color: #3b82f6;
    line-height: 1.6;
  }
}

.dockerfile-section {
  .section-title {
    font-size: 16px;
    color: rgba(0, 0, 0, 0.85);
    display: flex;
    align-items: center;
    font-weight: 500;
    margin: 8px 0 15px;
  }

  .section-title::before {
    display: inline-block;
    content: '';
    width: 6px;
    height: 16px;
    border-radius: 3px;
    background: var(--el-color-primary);
    margin-right: 8px;
  }

  .dockerfile-body {
    background-color: #1e1e1e;
    color: #d4d4d4;
    padding: 15px;
    font-family: 'Consolas', 'Monaco', monospace;
    font-size: 13px;
    line-height: 1.6;
    border-radius: 4px;
    overflow-y: auto;
    height: 320px;
  }

  .dockerfile-empty {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100%;
    color: #858585;

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
    padding: 0;
    font-family: 'Consolas', 'Monaco', monospace;
    font-size: 13px;
    line-height: 1.6;
    color: #d4d4d4;
    background-color: transparent;
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
