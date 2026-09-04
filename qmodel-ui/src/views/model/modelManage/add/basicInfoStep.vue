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
          <div class="access-type-item"
               :class="{active: formData.accessType === item.value,}"
               @click="handleAccessTypeChange(item.value)"
          >
            <el-radio
                v-model="formData.accessType"
                :label="item.value"
                class="radio-label-hidden"
                :disabled="route.name !== 'ModelManageAdd'"
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
              :disabled="['modelVersionAdd','modelVersionEdit'].includes(route.name)"
          />
        </el-form-item>
      </el-col>
      <el-col :span="12">
        <el-form-item label="模型编码" prop="code">
          <el-input
              v-model="formData.code"
              placeholder="请输入模型编码"
              show-word-limit
              :disabled="['modelVersionAdd','modelVersionEdit'].includes(route.name)"
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
              :disabled="['modelVersionAdd','modelVersionEdit'].includes(route.name)"
          />
        </el-form-item>
      </el-col>
      <el-col :span="12">
        <el-form-item label="作者" prop="author">
          <el-input v-model="formData.author" placeholder="请输入作者"
                    :disabled="['modelVersionAdd','modelVersionEdit'].includes(route.name)"/>
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="12">
        <el-form-item label="标签" prop="tags">
          <div class="tag-list">
            <el-tag
                v-for="tag in tagsList"
                :key="tag.name"
                :closable="!['modelVersionAdd','modelVersionEdit'].includes(route.name)"
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
                maxlength="4"
                @keyup.enter="handleTagConfirm"
                @blur="handleTagConfirm"
            />
            <el-button
                v-else-if="canAddTag"
                class="button-new-tag"
                size="small"
                @click="showTagInput"
                :disabled="['modelVersionAdd','modelVersionEdit'].includes(route.name)"
            >
              + 添加标签
            </el-button>
          </div>
        </el-form-item>
      </el-col>
      <el-col :span="12">
        <el-form-item label="图标" prop="icon">
          <image-upload v-model="formData.icon" :limit="1" :file-size="5"
                        :disabled="['modelVersionAdd','modelVersionEdit'].includes(route.name)"/>
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
              :disabled="['modelVersionAdd','modelVersionEdit'].includes(route.name)"
          />
        </el-form-item>
      </el-col>
    </el-row>
  </el-form>

  <el-form
      ref="modelVersionFormRef"
      :model="modelVersion"
      :rules="modelVersionRules"
      label-width="170px"
      style="padding-right: 90px"
  >
    <div class="h2-titles">版本信息</div>

    <el-row :gutter="20">
      <el-col :span="12">
        <el-form-item label="版本号" prop="modelVersion">
          <el-input v-model="modelVersion.modelVersion" placeholder="请输入版本号"
                    :disabled="['ModelManageEdit','modelVersionEdit'].includes(route.name)" />
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="24">
        <el-form-item label="版本描述" prop="description">
          <el-input
              v-model="modelVersion.description"
              type="textarea"
              :rows="4"
              placeholder="请输入版本描述"
              maxlength="512个字符"
              show-word-limit
              :disabled="route.name === 'ModelManageEdit'"
          />
        </el-form-item>
      </el-col>
    </el-row>
  </el-form>
</template>

<script setup name="BasicInfoStep">
import { ref, computed, watch, nextTick } from 'vue'
import { WarningFilled } from '@element-plus/icons-vue'
import ImageUpload from '@/components/ImageUpload'
import { useRoute } from "vue-router";
import {isModelVersionExists} from "@/api/model/version.js";

const formData = defineModel('formData', {
  type: Object,
  required: true
})

const modelVersion = defineModel('modelVersion', {
  type: Object,
  required: true
})

const { proxy } = getCurrentInstance();
const { model_from } = proxy.useDict("model_from");
const route = useRoute();

const tagsList = ref([])
const inputVisible = ref(false)
const inputTagValue = ref('')
const tagInputRef = ref(null)
const modelVersionFormRef = ref(null)

const MAX_TAG_COUNT = 2
const MAX_TAG_LENGTH = 4
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
    proxy.$modal.msgWarning(`最多只能添加 ${MAX_TAG_COUNT} 个标签`)
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
    proxy.$modal.msgWarning(`最多只能添加 ${MAX_TAG_COUNT} 个标签`)
    inputVisible.value = false
    inputTagValue.value = ''
    return
  }
  if (value.length > MAX_TAG_LENGTH) {
    proxy.$modal.msgWarning(`每个标签最多 ${MAX_TAG_LENGTH} 个字`)
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
  let options = [
    { value: 'API', label: 'API 接口模型', desc: '外部部署，通过 HTTP 协议调用模型接口，适用于已部署在服务器或云端的模型服务。' },
    { value: 'PYTHON', label: 'Python 本地模型', desc: '上传包含模型代码的 zip 包，由平台沙箱环境加载运行，适用于本地 Python 模型。' },
    { value: '上传镜像', label: '上传镜像', desc: '上传 .tar / .tar.gz 镜像归档，由平台导入 Docker 运行。' },
    { value: '构建镜像', label: '构建镜像', desc: '上传代码，平台生成 Dockerfile 并自动构建镜像。' }
  ]
  options.splice(2, 2,
    { value: 'UPLOAD_IMAGE', label: '上传镜像', desc: '上传 .tar / .tar.gz 镜像归档，由平台导入 Docker 运行。' },
    { value: 'BUILD_IMAGE', label: '构建镜像', desc: '上传代码，平台生成 Dockerfile 并自动构建镜像。' }
  )

  options = options.filter((opt) => !['UPLOAD_IMAGE', 'BUILD_IMAGE'].includes(opt.value))
  if (props.dictAccessType && props.dictAccessType.length > 0) {
    return options.map((opt) => {
      const dictItem = props.dictAccessType.find((d) => d.value === opt.value)
      return {
        ...opt,
        label: dictItem ? dictItem.label : opt.label
      }
    })
  }
  return options
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
  description: [{ max: 256, message: '长度不能超过 256 个字符', trigger: 'blur' }],
  remark: [{ max: 512, message: '长度不能超过 512 个字符', trigger: 'blur' }]
}

const modelVersionRules = {
  modelVersion: [
    { required: true, message: '请输入版本号', trigger: 'blur' },
    {
      trigger: 'blur',
      validator: function (rule, value, callback) {
        if (!value) return callback()
        let modelId = formData.value.id;
        if (!modelId) return callback();
        if(['modelVersionEdit','ModelManageEdit'].includes(route.name)) return callback();
        let debounceTimer = null
        clearTimeout(debounceTimer)
        debounceTimer = setTimeout(function () {
          isModelVersionExists(modelId,value)
              .then(function (res) {
                if (res.data) {
                  callback(new Error('该版本号已存在，请更换'))
                } else {
                  callback()
                }
              })
              .catch(function () {
                callback(new Error('校验版本号失败，请稍后重试'))
              })
        }, 500)
      }
    }
  ],
  description: [{ max: 256, message: '长度不能超过 256 个字符', trigger: 'blur' }],
}

const handleAccessTypeChange = (value) => {
  formData.value.accessType = value
}

const validate = () => {
  // return basicFormRef.value.validate()

  return Promise.allSettled([
    basicFormRef.value.validate(),
    modelVersionFormRef.value.validate()
  ]).then(([r1, r2]) => {
    // 两个全部成功 → resolve(true)
    if (r1.status === 'fulfilled' && r2.status === 'fulfilled') {
      return true
    } else {
      // 任意一个校验失败，抛出异常，和原生el‑form.validate()行为一致
      throw new Error('')
    }
  })
}

defineExpose({
  validate
})
</script>

<style lang="scss" scoped>
.basic-info-step {
  //height: 100%;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;

  :deep(.el-form-item) {
    margin-bottom: 16px;
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
