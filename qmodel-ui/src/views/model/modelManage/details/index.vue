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
  <el-card class="app-container modelManageView" body-class="pagecont-top">
    <div class="father_box pagecont-top">
      <div class="son_oneBox">
        <span>{{ viewInfo.name }}</span>
      </div>
      <div class="son_twoBox">
        <el-button
          type="primary"
          @click="handleUpdate"
          :disabled="viewInfo.whetherPublish == 0"
          ><Edit class="icon-mini"></Edit> 修改</el-button
        >
        <el-button
          :type="viewInfo.whetherPublish == 1 ? 'danger' : 'primary'"
          @click="isWhetherPublish"
        >
          {{ viewInfo.whetherPublish == 1 ? "取消发布" : "发布" }}
        </el-button>
        <el-button @click="goBack()">返回列表</el-button>
      </div>
    </div>
    <el-row :gutter="0" style="margin-bottom: 10px">
      <el-col :span="24">
        <el-descriptions :column="4" border :labelStyle="{ width: '160px' }">
          <el-descriptions-item label="模型名称" span="1">
            <span>{{ viewInfo.name != null ? viewInfo.name : "--" }}</span>
          </el-descriptions-item>
          <el-descriptions-item label="模型分类" span="1">
            <span>{{
              viewInfo.classifyName != null ? viewInfo.classifyName : "--"
            }}</span>
          </el-descriptions-item>
          <!-- <el-descriptions-item label="所属维度" span="1">
            <dict-tag
              :options="dict.type.model_waterconserve_modelmanage_dimensions"
              :value="viewInfo.dimensions"
            />
          </el-descriptions-item> -->
          <el-descriptions-item label="模型版本号" span="1">
            <el-tag size="small">Version {{ viewInfo.version }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="是否内置" span="1">
            <dict-tag :options="model_type" :value="viewInfo.builtin" />
          </el-descriptions-item>
          <el-descriptions-item label="接入方式" span="1">
            <span v-if="viewInfo.accessMode == 1">API接口</span>
            <span v-else>单机程序（exe）</span>
          </el-descriptions-item>

          <!--          <el-descriptions-item label="请求方式" span="1" v-if="viewInfo.accessMode == 1">
                      <dict-tag
                        :options="dict.type.model_access_mode"
                        :value="viewInfo.requestMethod"
                      />
                    </el-descriptions-item>-->
          <!--          <el-descriptions-item label="数据来源" span="1">
                      <span>{{ viewInfo.source != null ? viewInfo.source : "&#45;&#45;" }}</span>
                    </el-descriptions-item>
                    <el-descriptions-item label="上传状态" span="1">
                      <dict-tag
                        :options="dict.type.model_waterconserve_modelmanage_uploadstatus"
                        :value="viewInfo.uploadStatus"
                      />
                    </el-descriptions-item>-->
          <el-descriptions-item label="创建人" span="1">
            <span>{{
              viewInfo.createBy != null ? viewInfo.createBy : "--"
            }}</span>
          </el-descriptions-item>
          <el-descriptions-item label="上传时间" span="1">
            <span>{{
              viewInfo.createTime != null ? viewInfo.createTime : "--"
            }}</span>
          </el-descriptions-item>
          <el-descriptions-item label="模型介绍" span="1">
            <span>{{ viewInfo.remark != null ? viewInfo.remark : "--" }}</span>
          </el-descriptions-item>
        </el-descriptions>
      </el-col>
    </el-row>

    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane name="one">
        <template #label>版本管理</template>
        <VersionManage
          v-if="activeName === 'one'"
          @refresh="getModelById"
          :model="viewInfo"
          style="margin: 0; padding: 0"
        />
      </el-tab-pane>
      <el-tab-pane name="two" v-if="viewInfo.accessMode === 1">
        <template #label>接口地址管理</template>
        <ModelInterfaceAddress
          v-if="activeName === 'two' && viewInfo.accessMode === 1"
          :model="viewInfo"
          style="margin: 0; padding: 0"
        />
      </el-tab-pane>
      <el-tab-pane name="five" v-if="viewInfo.accessMode == 0">
        <template #label>模型输入管理</template>
        <ModelInput
          v-if="activeName === 'five' && viewInfo.accessMode == 0"
          style="margin: 0; padding: 0"
          :model="viewInfo"
        />
      </el-tab-pane>
      <el-tab-pane name="six" v-if="viewInfo.accessMode == 0">
        <template #label>模型输出管理</template>
        <ModelOutput
          v-if="activeName === 'six' && viewInfo.accessMode == 0"
          style="margin: 0; padding: 0"
          :model="viewInfo"
        />
      </el-tab-pane>
      <el-tab-pane name="three">
        <template #label>模型计算</template>
        <ModelCompute
          v-if="activeName === 'three'"
          :model="viewInfo"
          style="margin: 0; padding: 0"
        />
        <!--        <ModelFileCompute :model="viewInfo" style="margin: 0; padding: 0" v-if="viewInfo.accessMode == 0"/>-->
      </el-tab-pane>
      <el-tab-pane name="four">
        <template #label>操作历史</template>
        <ActionHistory
          v-if="activeName === 'four'"
          ref="actionHistoryRef"
          :model="viewInfo"
        />
      </el-tab-pane>
      <!--      <el-tab-pane name="five" v-if="viewInfo.accessMode == 0">
                <template #label>当前版本文件</template>
                <ModelFiles style="margin: 0; padding: 0" />
              </el-tab-pane>-->
    </el-tabs>

    <!-- 添加或修改模型管理 对话框 -->
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
                >单机程序(exe)</el-radio
              >
              <el-radio v-model="form.accessMode" :label="Number(1)"
                >API接口</el-radio
              >
              <el-tooltip placement="top">
                <template #content>
                  Tips: 核心信息请在详情页版本控制里面修改
                </template>
                <!-- elementui图标库：显示黑色的问号图标   -->
                <i class="el-icon-question" />
              </el-tooltip>
            </el-form-item>
          </el-col>
        </el-row>
        <!--        <el-row v-if="form.accessMode == 1">
                  <el-col :span="20">
                    <el-form-item label="API请求方式：" prop="requestMethod">
                      <el-select
                        style="width: 100%"
                        v-model="form.requestMethod"
                        placeholder="请选择模型类别"
                        clearable
                      >
                        <el-option
                          v-for="item in dict.type.model_access_mode"
                          :key="item.value"
                          :label="item.label"
                          :value="item.value * 1">
                        </el-option>
                      </el-select>
                    </el-form-item>
                  </el-col>
                </el-row>-->
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
        </div></template
      >
    </el-dialog>
  </el-card>
</template>

<script setup>
import { ref, reactive, computed, onMounted, getCurrentInstance } from "vue";
import { useRouter, useRoute } from "vue-router";
import { ElMessage, ElMessageBox } from "element-plus";
import {
  getModel,
  updateModel,
  addModel,
} from "@/api/modelReconstitution/model";
import ActionHistory from "./actionHistory.vue";
import VersionManage from "./modelVersion.vue";
import ModelInput from "./modelInput.vue";
import ModelOutput from "./modelOutput.vue";
import ModelInterfaceAddress from "./modelInterfaceAddress.vue";
import ModelCompute from "./modelCompute.vue";
import { listClassify } from "@/api/modelReconstitution/classify";
import { listInterfaceAddress } from "@/api/modelReconstitution/interfaceAddress";
import { useDict } from "@/utils/dict.js";
import { Edit } from "@element-plus/icons-vue";

// 获取当前实例和路由
const { proxy } = getCurrentInstance();
const router = useRouter();
const route = useRoute();

// 响应式数据
const viewInfo = ref({});
// 表单参数
const form = ref({});
// 弹出层标题
const title = ref("");
// 是否显示弹出层
const open = ref(false);
// 分类树选项
const classifyOptions = ref([]);
// 接口地址表格数据
const interfaceAddressList = ref([]);
// 激活的标签页
const activeName = ref("one");

// 表单校验规则
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

// 字典数据
const model_type = useDict("model_type").model_type;

// 计算属性
const modelId = computed(() => route.query.modelId);

// 模板引用
const formRef = ref(null);
const actionHistoryRef = ref(null);

// 获取详情
const getModelById = (params) => {
  getModel(params).then((res) => {
    viewInfo.value = res.data;
    console.log(viewInfo.value.accessMode, "viewInfo");
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
  console.log(activeName.value, "activeName");
};

// 设置默认激活的tab
const setDefaultActiveTab = () => {
  // 根据接入方式设置默认激活的tab
  if (viewInfo.value.accessMode === 1) {
    // API接口模式：默认显示版本管理
    activeName.value = "one";
  } else if (viewInfo.value.accessMode === 0) {
    // 单机程序模式：默认显示版本管理
    activeName.value = "one";
  } else {
    // 默认显示版本管理
    activeName.value = "one";
  }
};

// 根据模型信息更新可用的tab
const updateAvailableTabs = () => {
  // 模型信息更新后，确保激活的tab是有效的
  const availableTabs = ["one"]; // 版本管理始终可用

  if (viewInfo.value.accessMode === 1) {
    availableTabs.push("two"); // API接口模式下接口地址管理可用
  }

  if (viewInfo.value.accessMode === 0) {
    availableTabs.push("five", "six"); // 单机程序模式下输入输出管理可用
  }

  availableTabs.push("three", "four"); // 模型计算和操作历史始终可用

  // 如果当前激活的tab不可用，则切换到第一个可用的tab
  if (!availableTabs.includes(activeName.value)) {
    activeName.value = availableTabs[0];
  }
};

// 切换到指定tab
const switchToTab = (tabName) => {
  if (activeName.value !== tabName) {
    activeName.value = tabName;
  }
};

// 取消按钮
const cancel = () => {
  open.value = false;
  reset();
};

// 表单重置
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

/** 查询分类下拉树结构 */
const getTreeSelect = () => {
  listClassify().then((res) => {
    for (let i = 0; i < res.rows.length; i++) {
      let arrTemp = [];
      for (let j = 0; j < res.rows.length; j++) {
        if (res.rows[i].id == res.rows[j].parentId) {
          res.rows[i].children = arrTemp;
          arrTemp.push(res.rows[j]);
        }
      }
    }
    const result = [];
    for (let i = 0; i < res.rows.length; i++) {
      if (res.rows[i].parentId == 0) {
        result.push(res.rows[i]);
      }
    }
    classifyOptions.value = result;
  });
};

/** 修改按钮操作 */
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

/** 转换菜单数据结构 */
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

// 发布或取消发布
const isWhetherPublish = () => {
  let whetherPublish = viewInfo.value.whetherPublish == 0 ? 1 : 0;
  if (whetherPublish == 1) {
    listInterfaceAddress({
      modelId: viewInfo.value.id,
      versionId: viewInfo.value.versionId,
    }).then((response) => {
      interfaceAddressList.value = response.rows;
      if (interfaceAddressList.value.length > 0) {
        viewInfo.value.whetherPublish = whetherPublish;
        updateModel(viewInfo.value).then((response) => {
          ElMessage.success(
            viewInfo.value.whetherPublish == 0 ? "以取消发布" : "发布成功"
          );
          getList();
        });
      } else {
        ElMessageBox.alert("发布失败，请添加接口或者文件数据！", "错误", {
          type: "error",
          confirmButtonText: "确定",
        });
      }
    });
  } else {
    viewInfo.value.whetherPublish = whetherPublish;
    updateModel(viewInfo.value).then((response) => {
      ElMessage.success(
        viewInfo.value.whetherPublish == 0 ? "以取消发布" : "发布成功"
      );
      getList();
    });
  }
};

/** 提交按钮 */
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

// 获取列表方法
const getList = () => {
  // 由于此方法在原代码中未定义但被调用，这里补充定义
  getModelById(modelId.value);
};

// 组件挂载后执行
onMounted(() => {
  getModelById(modelId.value);
  getTreeSelect();
});
</script>
<style lang="scss" scoped>
.modelManageView {
  padding: 0;
  .pagecont-top {
    padding: 0;
  }
  .father_box {
    display: flex;
    justify-content: space-between;
    padding-bottom: 10px;
    line-height: 46px;

    .son_oneBox {
      font-size: 20px;
      font-weight: bolder;
    }
    .icon-mini {
      width: 1em;
      height: 1em;
      margin-right: 8px;
    }
  }
  .imgBox {
    border: 1px solid #ebeef5;
    border-left: none;
    width: 100%;
    height: 211px;
    display: flex;
    justify-content: center;
    align-items: center;

    .devImg {
      height: 95%;
    }
  }
}
:deep(.el-card__body) {
  min-height: calc(87vh - 7px);
}
</style>
