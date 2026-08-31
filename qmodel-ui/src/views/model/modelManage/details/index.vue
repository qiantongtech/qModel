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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom: 15px">
      <div class="infotop">
        <div class="infotop-title mb15">
          <div class="task-item">
            <!-- 正方形编号 -->
            <div class="task-id">
              {{ viewInfo.id || "-" }}
            </div>

            <!-- 名称 -->
            <div class="task-name">
              <el-tooltip
                  :content="viewInfo.name || ''"
                  placement="top"
                  effect="light"
                  :disabled="!textOverflowMap.name"
              >
                <span
                    class="ellipsis-text"
                    @mouseenter="(event) => checkTextOverflow(event, 'name')"
                >
                  {{ viewInfo.name || "" }}
                </span>
              </el-tooltip>
            </div>
            <div>
              <dict-tag :options="model_status" :value="viewInfo.status" />
            </div>

          </div>
          <el-row :gutter="15" class="btn-style" style="margin-left: auto">
            <el-col :span="1.5">
              <el-button
                  type="primary"
                  size="small"
                  class="fhbtn"
                  plain
                  @click="goBack"
                  @mousedown="(e) => e.preventDefault()"
              >
                <svg-icon
                    style="width: 12px; height: 12px; margin-right: 3px"
                    :iconClass="'fhs'"
                />
                返回
              </el-button>
            </el-col>
          </el-row>
        </div>

        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">模型编号</div>
              <div class="infotop-row-value">
                <el-tooltip
                    :content="viewInfo.code || '-'"
                    placement="top"
                    effect="light"
                    :disabled="!textOverflowMap.code"
                >
                  <span
                      class="ellipsis-text"
                      @mouseenter="(event) => checkTextOverflow(event, 'code')"
                  >
                    {{ viewInfo.code || "-" }}
                  </span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">模型分类</div>
              <div class="infotop-row-value">
                <el-tooltip
                    :content="viewInfo.classifyName || '-'"
                    placement="top"
                    effect="light"
                    :disabled="!textOverflowMap.classifyName"
                >
                  <span
                      class="ellipsis-text"
                      @mouseenter="
                      (event) => checkTextOverflow(event, 'classifyName')
                    "
                  >
                    {{ viewInfo.classifyName || "-" }}
                  </span>
                </el-tooltip>
              </div>
            </div>
          </el-col>

          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">图标</div>
              <div class="infotop-row-value">
                <img
                    v-if="viewInfo.icon"
                    :src="getIconUrl(viewInfo.icon)"
                    class="icon-preview"
                    @click="previewIcon"
                    alt="图标"
                />
                <span v-else>-</span>
              </div>
            </div>
          </el-col>
        </el-row>

        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">当前版本</div>
              <div class="infotop-row-value">
                <el-tooltip
                    :content="viewInfo.version || '-'"
                    placement="top"
                    effect="light"
                    :disabled="!textOverflowMap.version"
                >
                  <span
                      class="ellipsis-text"
                      @mouseenter="(event) => checkTextOverflow(event, 'version')"
                  >
                    {{ viewInfo.version || "-" }}
                  </span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">作者</div>
              <div class="infotop-row-value">
                <el-tooltip
                    :content="viewInfo.author || '-'"
                    placement="top"
                    effect="light"
                    :disabled="!textOverflowMap.author"
                >
                  <span
                      class="ellipsis-text"
                      @mouseenter="(event) => checkTextOverflow(event, 'author')"
                  >
                    {{ viewInfo.author || "-" }}
                  </span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">标签</div>
              <div class="infotop-row-value tag-list">
                <el-tag
                    v-for="tag in parsedTags"
                    :key="tag.name"
                    size="small"
                    class="mr3"
                >
                  {{ tag.name }}
                </el-tag>
                <span v-if="parsedTags.length === 0">-</span>
              </div>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="24">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">描述</div>
              <div class="infotop-row-value">
                <el-tooltip
                    :content="viewInfo.description || '-'"
                    placement="top"
                    effect="light"
                    :disabled="!textOverflowMap.description"
                >
                  <span
                      class="ellipsis-text"
                      @mouseenter="
                      (event) => checkTextOverflow(event, 'description')
                    "
                  >
                    {{ viewInfo.description || "-" }}
                  </span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>

    <div class="pagecont-bottom">
      <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">

        <el-tab-pane name="modelApi" >
          <template #label>API 接口</template>
          <ModelApi
              v-if="activeName === 'modelApi'"
              :model="viewInfo"
              style="margin: 0; padding: 0"
          />
        </el-tab-pane>

        <el-tab-pane name="onlineTest">
          <template #label>在线调试</template>
          <OnlineTest
              v-if="activeName === 'onlineTest'"
              :model-id="viewInfo.id"
              :model-name="viewInfo.name"
              :access-mode="viewInfo.accessType === 'API' ? 1 : 0"
              :model-version="viewInfo.version"
              style="margin: 0; padding: 0"
          />
        </el-tab-pane>

        <el-tab-pane name="invokeHistory">
          <template #label>调用记录</template>
          <InvokeHistory
              v-if="activeName === 'invokeHistory'"
              :model-id="viewInfo.id"
              style="margin: 0; padding: 0"
          />
        </el-tab-pane>

        <el-tab-pane name="buildLog" v-if="viewInfo.accessType === 'PYTHON'">
          <template #label>构建日志</template>
          <BuildLog
              v-if="activeName === 'buildLog'"
              :model-id="viewInfo.id"
              style="margin: 0; padding: 0"
          />
        </el-tab-pane>

        <el-tab-pane name="modelAudit" >
          <template #label>模型审批</template>
          <ModelAudit
              v-if="activeName === 'modelAudit'"
              :model="viewInfo"
              style="margin: 0; padding: 0"
          />
        </el-tab-pane>

        <el-tab-pane name="modelCalc" >
          <template #label>计算任务</template>
          <ModelCalc
              v-if="activeName === 'modelCalc'"
              :model="viewInfo"
              style="margin: 0; padding: 0"
          />
        </el-tab-pane>

        <el-tab-pane name="version">
          <template #label>版本管理</template>
          <VersionManage
              v-if="activeName === 'version'"
              @refresh="getModelById"
              :model="viewInfo"
              style="margin: 0; padding: 0"
          />
        </el-tab-pane>

      </el-tabs>
    </div>



    <el-image-viewer
        v-if="iconPreviewVisible"
        @close="closeIconPreview"
        :url-list="[iconPreviewUrl]"
        :src="iconPreviewUrl"
        z-index="9999"
    />
  </div>
</template>

<script setup>
import {
  ref,
  reactive,
  computed,
  onMounted,
  getCurrentInstance,
  watch,
} from "vue";
import { useRouter, useRoute } from "vue-router";
import { ElImageViewer } from "element-plus";
import { getModel } from "@/api/model/model";
import { listClassify } from "@/api/model/classify";
import { useDict } from "@/utils/dict.js";
import VersionManage from "./modelVersion.vue";
import OnlineTest from "./onlineTest.vue";
import InvokeHistory from "./invokeHistory.vue";
import BuildLog from "./buildLog.vue";
import ModelCalc from "@/views/model/modelManage/details/modelCalc.vue";
import ModelApi from "@/views/model/modelManage/details/modelApi.vue";
import ModelAudit from "@/views/model/modelManage/details/modelAudit.vue";

const { proxy } = getCurrentInstance();
const router = useRouter();
const route = useRoute();

const viewInfo = ref({});
const form = ref({});
const title = ref("");
const open = ref(false);
const classifyOptions = ref([]);
const activeName = ref("modelApi");
const showSearch = ref(true);
const textOverflowMap = reactive({});

const iconPreviewVisible = ref(false);
const iconPreviewUrl = ref("");

const { model_status } = proxy.useDict("model_status");

const parsedTags = computed(() => {
  const tags = viewInfo.value.tags;
  if (!tags) return [];
  try {
    const parsed = JSON.parse(tags);
    if (Array.isArray(parsed)) {
      return parsed.filter((item) => item && item.name);
    }
  } catch {
    return [];
  }
  return [];
});

const model_type = useDict("model_type").model_type;

const modelId = computed(() => route.query.modelId);

const formRef = ref(null);

const checkTextOverflow = (event, field) => {
  const element = event.currentTarget;
  if (element) {
    textOverflowMap[field] = element.scrollWidth > element.clientWidth;
  }
};

const getModelById = (params) => {
  getModel(params).then((res) => {
    viewInfo.value = res.data;
    if (route.query.tab) {
      activeName.value = route.query.tab;
    }
  });
};

const goBack = () => {
  router.push({
    path: "/model/manage",
    query: {
      pageNum: 1,
    },
  });
  reset();
};

const handleClick = (tab, event) => {
  activeName.value = tab.paneName;
};

const cancel = () => {
  open.value = false;
  reset();
};

const reset = () => {
  form.value = {
    id: null,
    companyId: null,
    name: null,
    classifyId: null,
    classifyName: null,
    builtin: null,
    accessMode: null,
    requestMethod: null,
    interfaceorfileAddress: null,
    versionId: null,
    version: null,
    description: null,
    whetherPublish: null,
    publishTime: null,
    delFlag: null,
    createBy: null,
    creatorId: null,
    createTime: null,
    updateBy: null,
    updatorId: null,
    updateTime: null,
    remark: null,
  };
  if (formRef.value) {
    formRef.value.clearValidate();
  }
};

const getIconUrl = (icon) => {
  if (!icon) return "";
  if (/^https?:\/\//.test(icon)) {
    return icon;
  }
  if (icon.startsWith("/profile")) {
    return `${import.meta.env.VITE_APP_BASE_API}${icon}`;
  }
  if (icon.startsWith("/")) {
    return `${import.meta.env.VITE_APP_BASE_API}/profile${icon}`;
  }
  return `${import.meta.env.VITE_APP_BASE_API}/profile/${icon}`;
};

const previewIcon = () => {
  iconPreviewUrl.value = getIconUrl(viewInfo.value.icon);
  iconPreviewVisible.value = true;
};

const closeIconPreview = () => {
  iconPreviewVisible.value = false;
};

const getTreeSelect = () => {
  listClassify().then((res) => {
    for (let i = 0; i < res.data.length; i++) {
      let arrTemp = [];
      for (let j = 0; j < res.data.length; j++) {
        if (res.data[i].id == res.data[j].parentId) {
          res.data[i].children = arrTemp;
          arrTemp.push(res.data[j]);
        }
      }
    }
    const result = [];
    for (let i = 0; i < res.data.length; i++) {
      if (res.data[i].parentId == 0) {
        result.push(res.data[i]);
      }
    }
    classifyOptions.value = result;
  });
};

const handleUpdate = (row) => {
  reset();
  const id = modelId.value;
  getModel(id).then((res) => {
    form.value = res.data;
    if (form.value.type != null) {
      form.value.type = form.value.type.toString();
    }
    if (form.value.dimensions != null) {
      form.value.dimensions = form.value.dimensions.toString();
    }
    open.value = true;
    title.value = "修改模型管理 ";
  });
};

const normalizer = (node) => {
  if (node.children && !node.children.length) {
    delete node.children;
  }
  return {
    id: node.id,
    label: node.name,
    children: node.children,
  };
};

// const submitForm = () => {
//   if (formRef.value) {
//     formRef.value.validate((valid) => {
//       if (valid) {
//         const formData = { ...form.value };
//         if (formData.id != null) {
//           updateModel(formData).then((response) => {
//             proxy.$modal.msgSuccess("修改成功");
//             open.value = false;
//             getList();
//           });
//         } else {
//           addModel(formData).then((response) => {
//             proxy.$modal.msgSuccess("新增成功");
//             open.value = false;
//             getList();
//           });
//         }
//       }
//     });
//   }
// };

const getList = () => {
  getModelById(modelId.value);
};

watch(
    () => route.query.modelId,
    (newId) => {
      if (newId) {
        getModelById(newId);
      }
    }
);

onMounted(() => {
  getModelById(modelId.value);
  getTreeSelect();
  if (route.query.tab) {
    activeName.value = route.query.tab;
  }
});
</script>

<style lang="scss" scoped>
.ellipsis-text {
  display: inline-block;
  width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  vertical-align: middle;
}

.id-tag {
  display: inline-flex;
  justify-content: center;
  align-items: center;
  padding: 1px 2px;
  background-color: #2666fb;
  color: #fff;
  border-radius: 4px;
  font-size: 12px;
  white-space: nowrap;
  min-width: 30px;
}

.fhbtn {
  .svg-icon {
    font-size: 12px;
    margin-right: 3px;
    vertical-align: middle;
    margin-top: -3px;
  }
  &:hover {
    .svg-icon {
      filter: brightness(0) invert(1) !important;
    }
  }
}

.icon-mini {
  width: 1em;
  height: 1em;
  margin-right: 6px;
}

.icon-preview {
  width: 28px;
  height: 28px;
  border-radius: 4px;
  cursor: pointer;
  object-fit: cover;
  transition: transform 0.2s;

  &:hover {
    transform: scale(1.1);
  }
}
</style>
