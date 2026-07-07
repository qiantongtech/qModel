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
  <div class="basic-info-step">
    <el-form
      ref="basicFormRef"
      :model="formData"
      :rules="rules"
      label-width="120px"
      class="basic-form"
    >
      <el-form-item label="模型接入方式" prop="accessType">
        <div class="access-type-cards">
          <div
            v-for="item in accessTypeOptions"
            :key="item.value"
            class="access-type-card"
            :class="{ active: formData.accessType === item.value }"
            @click="handleAccessTypeChange(item.value)"
          >
            <div class="card-icon">
              <el-icon v-if="item.value === 'API'" size="28"><Link /></el-icon>
              <el-icon v-else size="28"><SetUp /></el-icon>
            </div>
            <div class="card-content">
              <div class="card-title">{{ item.label }}</div>
              <div class="card-desc">{{ item.desc }}</div>
            </div>
          </div>
        </div>
      </el-form-item>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="模型名称" prop="name">
            <el-input
              v-model="formData.name"
              placeholder="请输入模型名称"
              maxlength="128"
              show-word-limit
            />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="模型编码" prop="code">
            <el-input
              v-model="formData.code"
              placeholder="请输入模型编码"
              maxlength="128"
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

      <el-form-item label="描述" prop="description">
        <el-input
          v-model="formData.description"
          type="textarea"
          :rows="4"
          placeholder="请输入描述"
          maxlength="256"
          show-word-limit
        />
      </el-form-item>

      <el-form-item label="备注" prop="remark">
        <el-input
          v-model="formData.remark"
          type="textarea"
          :rows="4"
          placeholder="请输入备注"
          maxlength="512"
          show-word-limit
        />
      </el-form-item>
    </el-form>
  </div>
</template>

<script setup name="BasicInfoStep">
import { ref, computed } from 'vue'
import { Link, SetUp } from '@element-plus/icons-vue'

const formData = defineModel('formData', {
  type: Object,
  required: true
})

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
      desc: item.value === 'API' ? '外部部署，通过 HTTP 调用' : '上传 ZIP，沙箱运行'
    }))
  }
  return [
    { value: 'API', label: 'API 接口模型', desc: '外部部署，通过 HTTP 调用' },
    { value: 'PYTHON', label: 'Python 本地模型', desc: '上传 ZIP，沙箱运行' }
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
  padding: 20px 0;
}

.basic-form {
  width: 100%;
}

.access-type-cards {
  display: flex;
  gap: 20px;
}

.access-type-card {
  flex: 1;
  display: flex;
  align-items: center;
  padding: 20px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.3s;

  &:hover {
    border-color: #409eff;
  }

  &.active {
    border-color: #409eff;
    background-color: #f0f7ff;
  }

  .card-icon {
    width: 50px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f5f7fa;
    border-radius: 4px;
    margin-right: 15px;
    color: #606266;
  }

  &.active .card-icon {
    background-color: #e6f2ff;
    color: #409eff;
  }

  .card-content {
    flex: 1;
  }

  .card-title {
    font-size: 16px;
    font-weight: 500;
    color: #303133;
    margin-bottom: 6px;
  }

  .card-desc {
    font-size: 13px;
    color: #909399;
  }
}
</style>
