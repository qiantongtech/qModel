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
  <el-form
    ref="basicFormRef"
    :model="formData"
    :rules="rules"
    label-width="170px"
    style="padding-right: 90px"
    class="basic-info-step"
  >
    <div class="h2-titles">模型接入方式</div>

    <el-form-item prop="accessType" label-width="0">
      <div class="access-type-group">
        <div
          v-for="item in accessTypeOptions"
          :key="item.value"
          class="access-type-row"
        >
          <div
          class="access-type-item"
          :class="{
            active: formData.accessType === item.value,

          }"
          @click="handleAccessTypeChange(item.value)"
        >
          <el-radio
            v-model="formData.accessType"
            :label="item.value"
            class="radio-label-hidden"
          />
            <div class="access-type-title">
              <span>{{ item.label }}</span>
            </div>
          </div>
          <div class="access-type-desc">
            <el-icon class="desc-icon"><WarningFilled /></el-icon>
            {{ item.desc }}
          </div>
        </div>
      </div>
    </el-form-item>

    <div class="h2-titles">基础信息</div>
    <el-row :gutter="20">
      <el-col :span="12">
        <el-form-item label="模型名称" prop="name">
          <el-input
            v-model="formData.name"
            placeholder="请输入模型名称"
            show-word-limit
          />
        </el-form-item>
      </el-col>
      <el-col :span="12">
        <el-form-item label="模型编码" prop="code">
          <el-input
            v-model="formData.code"
            placeholder="请输入模型编码"
            show-word-limit
          />
        </el-form-item>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :span="12">
        <el-form-item label="模型分类" prop="classifyId">
          <el-tree-select
            v-model="formData.classifyId"
            :data="classifyOptions"
            :props="{ value: 'id', label: 'name', children: 'children' }"
            :render-after-expand="false"
            placeholder="请选择模型分类"
            clearable
            filterable
            check-strictly
            style="width: 100%"
          />
        </el-form-item>
      </el-col>
      <el-col :span="12">
        <el-form-item label="版本号" prop="version">
          <el-input v-model="formData.version" placeholder="请输入版本号" />
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="12">
        <el-form-item label="作者" prop="author">
          <el-input v-model="formData.author" placeholder="请输入作者" />
        </el-form-item>
      </el-col>
      <el-col :span="12">
        <el-form-item label="标签" prop="tags">
          <div class="tag-list">
            <el-tag
                v-for="tag in tagsList"
                :key="tag.name"
                closable
                :disable-transitions="false"
                @close="handleCloseTag(tag)"
            >
              {{ tag.name }}
            </el-tag>
            <el-input
                v-if="inputVisible"
                ref="tagInputRef"
                v-model="inputTagValue"
                class="tag-input"
                size="small"
                @keyup.enter="handleTagConfirm"
                @blur="handleTagConfirm"
            />
            <el-button
                v-else-if="canAddTag"
                class="button-new-tag"
                size="small"
                @click="showTagInput"
            >
              + 添加标签
            </el-button>
          </div>
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="24">
        <el-form-item label="图标" prop="icon">
          <image-upload v-model="formData.icon" :limit="1" :file-size="5" />
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="24">
        <el-form-item label="描述" prop="description">
          <el-input
            v-model="formData.description"
            type="textarea"
            :rows="4"
            placeholder="请输入描述"
            maxlength="512个字符"
            show-word-limit
          />
        </el-form-item>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :span="24">
        <el-form-item label="备注" prop="remark">
          <el-input
            v-model="formData.remark"
            type="textarea"
            :rows="4"
            placeholder="请输入备注"
            maxlength="512个字符"
            show-word-limit
          />
        </el-form-item>
      </el-col>
    </el-row>
  </el-form>
</template>

<script setup name="BasicInfoStep">
import { ref, computed, watch, nextTick } from 'vue'
import { ElMessage } from 'element-plus'
import { WarningFilled } from '@element-plus/icons-vue'
import ImageUpload from '@/components/ImageUpload'

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const tagsList = ref([])
const inputVisible = ref(false)
const inputTagValue = ref('')
const tagInputRef = ref(null)

const MAX_TAG_COUNT = 2
const canAddTag = computed(() => tagsList.value.length < MAX_TAG_COUNT)

const parseTags = (val) => {
  if (!val) return []
  try {
    const parsed = JSON.parse(val)
    if (Array.isArray(parsed)) {
      return parsed.filter((item) => item && item.name)
    }
  } catch {
    return []
  }
  return []
}

watch(
  () => formData.value.tags,
  (val) => {
    tagsList.value = parseTags(val)
  },
  { immediate: true }
)

const syncTags = () => {
  formData.value.tags = tagsList.value.length > 0 ? JSON.stringify(tagsList.value) : ''
}

const handleCloseTag = (tag) => {
  tagsList.value = tagsList.value.filter((item) => item.name !== tag.name)
  syncTags()
}

const showTagInput = () => {
  if (!canAddTag.value) {
    ElMessage.warning(`最多只能添加 ${MAX_TAG_COUNT} 个标签`)
    return
  }
  inputVisible.value = true
  nextTick(() => {
    tagInputRef.value?.input?.focus()
  })
}

const handleTagConfirm = () => {
  const value = inputTagValue.value.trim()
  if (!value) {
    inputVisible.value = false
    inputTagValue.value = ''
    return
  }
  if (!canAddTag.value) {
    ElMessage.warning(`最多只能添加 ${MAX_TAG_COUNT} 个标签`)
    inputVisible.value = false
    inputTagValue.value = ''
    return
  }
  if (!tagsList.value.some((item) => item.name === value)) {
    tagsList.value.push({ name: value })
    syncTags()
  }
  inputVisible.value = false
  inputTagValue.value = ''
}

const props = defineProps({
  classifyOptions: {
    type: Array,
    default: () => []
  },
  dictAccessType: {
    type: Array,
    default: () => []
  }
})

const basicFormRef = ref(null)

const accessTypeOptions = computed(() => {
  if (props.dictAccessType && props.dictAccessType.length > 0) {
    return props.dictAccessType.map((item) => ({
      value: item.value,
      label: item.label,
      desc: item.value === 'API' ? '外部部署，通过 HTTP 协议调用模型接口，适用于已部署在服务器或云端的模型服务。' : '上传包含模型代码的 Zip 包，由平台沙箱环境加载运行，适用于本地 Python 模型。'
    }))
  }
  return [
    { value: 'API', label: 'API 接口模型', desc: '外部部署，通过 HTTP 协议调用模型接口，适用于已部署在服务器或云端的模型服务。' },
    { value: 'PYTHON', label: 'Python 本地模型', desc: '上传包含模型代码的 Zip 包，由平台沙箱环境加载运行，适用于本地 Python 模型。' }
  ]
})

const rules = {
  accessType: [{ required: true, message: '请选择模型接入方式', trigger: 'change' }],
  name: [
    { required: true, message: '请输入模型名称', trigger: 'blur' },
    { min: 1, max: 128, message: '长度在 1 到 128 个字符', trigger: 'blur' }
  ],
  code: [
    { required: true, message: '请输入模型编码', trigger: 'blur' },
    { min: 1, max: 128, message: '长度在 1 到 128 个字符', trigger: 'blur' }
  ],
  classifyId: [{ required: true, message: '请选择模型分类', trigger: 'change' }],
  version: [{ required: true, message: '请输入版本号', trigger: 'blur' }],
  description: [{ max: 256, message: '长度不能超过 256 个字符', trigger: 'blur' }],
  remark: [{ max: 512, message: '长度不能超过 512 个字符', trigger: 'blur' }]
}

const handleAccessTypeChange = (value) => {
  if (value === 'PYTHON') return
  formData.value.accessType = value
}

const validate = () => {
  return basicFormRef.value.validate()
}

defineExpose({
  validate
})
</script>

<style lang="scss" scoped>
.basic-info-step {
  height: 100%;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;

  :deep(.el-form-item) {
    margin-bottom: 10px;
  }
}

.h2-titles {
  font-size: 16px;
  color: rgba(0, 0, 0, 0.85);
  display: flex;
  align-items: center;
  font-weight: 500;
  margin: 8px 0;
}

.h2-titles::before {
  display: inline-block;
  content: '';
  width: 6px;
  height: 16px;
  border-radius: 3px;
  background: var(--el-color-primary);
  margin-right: 8px;
}

.access-type-group {
  display: flex;
  flex-direction: column;
  margin-left: 85px;

  .access-type-row {
    display: flex;
    align-items: center;
    margin-top: 13px;

    &:first-child {
      margin-top: 0;
    }
  }

  .access-type-item {
    display: flex;
    align-items: center;
    cursor: pointer;
    transition: all 0.2s;
    margin-left: 17px;

    &.disabled {
      cursor: not-allowed;
      opacity: 0.6;
    }

    .access-type-title {
      min-width: 110px;
      font-size: 14px;
      font-family: PingFang SC-Medium, Microsoft YaHei, sans-serif;
      color: rgba(0, 0, 0, 0.85);
      line-height: 22px;
    }
  }

  .access-type-desc {
    display: flex;
    align-items: center;
    margin-left: 18px;
    font-size: 14px;
    line-height: 22px;
    font-family: Microsoft YaHei-Regular;
    color: #888888;

    .desc-icon {
      margin-right: 3px;
    }
  }
}

.radio-label-hidden {
  margin-right: 15px;

  :deep(.el-radio__label) {
    display: none !important;
  }
}

.tag-list {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px;
}

.tag-input {
  width: 100px;
}

.button-new-tag {
  padding: 0 10px;
}
</style>
