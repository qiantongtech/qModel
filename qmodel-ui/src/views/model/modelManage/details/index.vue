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
   *
  ============================================================================
   *
  版权所有 © 2026 江苏千桐科技有限公司
  qModel 模型平台（开源版）
   *
  许可协议：
  本项目基于 Apache License 2.0 开源协议发布，
  允许在遵守协议的前提下进行商用、修改和分发。
   *
  特别说明：
  所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
  如需定制品牌，请通过官方渠道申请品牌定制授权。
   *
  更多信息请访问：https://qmodel.qiantong.tech/business.html
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
              {{ viewInfo.name || "" }}
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
              <div class="infotop-row-value">{{ viewInfo.code || "-" }}</div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">模型分类</div>
              <div class="infotop-row-value">
                {{ viewInfo.classifyName || "-" }}
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
              <div class="infotop-row-lable">版本号</div>
              <div class="infotop-row-value">
                {{ viewInfo.version || "-" }}
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">作者</div>
              <div class="infotop-row-value">
                <span>{{ viewInfo.author || "-" }}</span>
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
                {{ viewInfo.description || "-" }}
              </div>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="3">
          <el-col :span="24">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">备注</div>
              <div class="infotop-row-value">{{ viewInfo.remark || "-" }}</div>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>

    <div class="pagecont-bottom">
      <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
        <el-tab-pane name="version">
          <template #label>版本管理</template>
          <VersionManage
            v-if="activeName === 'version'"
            @refresh="getModelById"
            :model="viewInfo"
            style="margin: 0; padding: 0"
          />
        </el-tab-pane>

        <el-tab-pane name="onlineTest">
          <template #label>在线调用</template>
          <OnlineTest
            v-if="activeName === 'onlineTest'"
            :model-id="viewInfo.id"
            :model-name="viewInfo.name"
            :access-mode="viewInfo.accessType === 'API' ? 1 : 0"
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
      </el-tabs>
    </div>

    <el-dialog
      :title="title"
      v-model="open"
      width="750px"
      :close-on-click-modal="false"
      append-to="body"
    >
      <el-form ref="formRef" :model="form" :rules="rules" label-width="180px">
        <el-row>
          <el-col :span="20">
            <el-form-item label="模型名称：" prop="name">
              <el-input
                clearable
                v-model="form.name"
                placeholder="请输入模型名称"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item
              label="模型分类："
              prop="classifyId"
              class="formClass"
            >
              <el-tree-select
                v-model="form.classifyId"
                :options="classifyOptions"
                :normalizer="normalizer"
                :show-count="true"
                placeholder="请选择模型分类"
                noResultsText="暂无数据"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="是否预置：" prop="builtin">
              <el-radio v-model="form.builtin" :label="Number(1)">是</el-radio>
              <el-radio v-model="form.builtin" :label="Number(0)">否</el-radio>
              <el-tooltip
                class="item"
                effect="dark"
                content="选择是之后则不可去设置修改输入参数"
                placement="right"
              >
                <i class="el-icon-question"></i>
              </el-tooltip>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="接入方式：" prop="accessMode">
              <el-radio v-model="form.accessMode" :label="Number(0)"
                >python脚本</el-radio
              >
              <el-radio v-model="form.accessMode" :label="Number(1)"
                >API接口</el-radio
              >
              <el-tooltip placement="top">
                <template #content>
                  Tips: 核心信息请在详情页版本控制里面修改
                </template>
                <i class="el-icon-question" />
              </el-tooltip>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.accessMode == 1">
          <el-col :span="20">
            <el-form-item label="API地址:端口：" prop="interfaceorfileAddress">
              <el-input
                clearable
                v-model="form.interfaceorfileAddress"
                placeholder="请输入API接口"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.accessMode == 0">
          <el-col :span="20">
            <el-form-item label="上传文件：" prop="uploadFile">
              <FileUpload
                v-model="form.uploadFile"
                :fileStyle2="true"
                :limit="1"
                :fileType="['zip']"
                :fileSize="200"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="模型介绍：" prop="remark">
              <el-input
                v-model="form.remark"
                :rows="3"
                type="textarea"
                placeholder="请输入内容"
              />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

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
import { ElMessage, ElMessageBox, ElImageViewer } from "element-plus";
import { getModel, updateModel, addModel } from "@/api/model/model";
import { listClassify } from "@/api/modelReconstitution/classify";
import { listInterfaceAddress } from "@/api/modelReconstitution/interfaceAddress";
import { useDict } from "@/utils/dict.js";
import { Edit } from "@element-plus/icons-vue";
import VersionManage from "./modelVersion.vue";
import OnlineTest from "./onlineTest.vue";
import InvokeHistory from "./invokeHistory.vue";
import BuildLog from "./buildLog.vue";

const { proxy } = getCurrentInstance();
const router = useRouter();
const route = useRoute();

const viewInfo = ref({});
const form = ref({});
const title = ref("");
const open = ref(false);
const classifyOptions = ref([]);
const interfaceAddressList = ref([]);
const activeName = ref("version");
const showSearch = ref(true);

const iconPreviewVisible = ref(false);
const iconPreviewUrl = ref("");

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

const rules = reactive({
  validFlag: [
    {
      required: true,
      message: "是否有效 0：无效，1：有效不能为空",
      trigger: "blur",
    },
  ],
  delFlag: [
    {
      required: true,
      message: "删除标志 1：已删除，0：未删除不能为空",
      trigger: "blur",
    },
  ],
  createTime: [
    { required: true, message: "创建时间不能为空", trigger: "blur" },
  ],
  updateTime: [
    { required: true, message: "更新时间不能为空", trigger: "blur" },
  ],
  classifyId: [
    { required: true, message: "模型分类不能为空", trigger: "blur" },
  ],
  name: [{ required: true, message: "模型名称不能为空", trigger: "blur" }],
  version: [{ required: true, message: "版本号不能为空", trigger: "blur" }],
  description: [
    { required: true, message: "版本发布说明不能为空", trigger: "blur" },
  ],
  interfaceAddress: [
    { required: true, message: "模型调用接口不能为空", trigger: "blur" },
  ],
});

const model_type = useDict("model_type").model_type;

const modelId = computed(() => route.query.modelId);

const formRef = ref(null);
const actionHistoryRef = ref(null);

const getModelById = (params) => {
  getModel(params).then((res) => {
    viewInfo.value = res.data;
  });
};

const goBack = () => {
  router.push({
    path: "/model/version",
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
    console.log(res);
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

const submitForm = () => {
  if (formRef.value) {
    formRef.value.validate((valid) => {
      if (valid) {
        const formData = { ...form.value };
        if (formData.id != null) {
          updateModel(formData).then((response) => {
            ElMessage.success("修改成功");
            open.value = false;
            getList();
          });
        } else {
          addModel(formData).then((response) => {
            ElMessage.success("新增成功");
            open.value = false;
            getList();
          });
        }
      }
    });
  }
};

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
});
</script>

<style lang="scss" scoped>
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
  margin-right: 8px;
}

.icon-preview {
  width: 40px;
  height: 40px;
  border-radius: 4px;
  cursor: pointer;
  object-fit: cover;
  transition: transform 0.2s;

  &:hover {
    transform: scale(1.1);
  }
}
</style>
