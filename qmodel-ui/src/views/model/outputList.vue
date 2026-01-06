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
  <div class="app-container modelOutput">
    <div class="pagecont-top" v-show="showSearch">
      <el-form
        :model="queryParams"
        ref="queryFormRef"
        :inline="true"
        v-show="showSearch"
        class="btn-style"
      >
        <el-form-item label="模型名称：" prop="modelName">
          <el-input
            v-model="queryParams.modelName"
            placeholder="请输入模型名称："
            clearable
            @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="版本号：" prop="modelVersion">
          <el-input
            v-model="queryParams.modelVersion"
            placeholder="请输入版本号"
            clearable
            @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button
            plain
            type="primary"
            @click="handleQuery"
            @mousedown="(e) => e.preventDefault()"
          >
            <i class="iconfont-mini icon-a-zu22377 mr5"></i>查询
          </el-button>
          <el-button @click="resetQuery" @mousedown="(e) => e.preventDefault()">
            <i class="iconfont-mini icon-a-zu22378 mr5"></i>重置
          </el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="pagecont-bottom">
      <div class="justify-between mb15">
        <el-row :gutter="10" class="btn-style">
          <el-col :span="1.5">
            <el-button
              type="primary"
              plain
              @click="handleAdd"
              v-hasPermi="['model:input:add']"
              ><i class="iconfont-mini icon-xinzeng mr5"></i>新增
            </el-button>
          </el-col>
        </el-row>
        <right-toolbar
          v-model:showSearch="showSearch"
          @queryTable="getList"
        ></right-toolbar>
      </div>

      <el-table
        v-loading="loading"
        :data="inputList"
        @selection-change="handleSelectionChange"
      >
        <el-table-column label="输出名称" align="center" prop="name" />
        <el-table-column label="输出类型" align="center" prop="type">
          <template #default="scope">
            <dict-tag
              :options="model_input_param_type"
              :value="scope.row.type"
            />
          </template>
        </el-table-column>
        <el-table-column label="所属模型" align="center" prop="modelName" />
        <el-table-column label="所属版本" align="center" prop="modelVersion">
          <template #default="scope">
            <el-tag size="small">Version {{ scope.row.modelVersion }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          label="操作"
          align="center"
          class-name="small-padding fixed-width"
        >
          <template #default="scope">
            <el-button
              type="primary"
              link
              icon="Edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['model:input:edit']"
              >修改
            </el-button>
            <el-button
              type="danger"
              link
              icon="Delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['model:input:remove']"
              >删除
            </el-button>
            <el-button
              type="primary"
              link
              icon="view"
              @click="handleView(scope.row)"
              v-hasPermi="['model:input:edit']"
              >详情
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="total > 0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
      />
    </div>
    <!-- 添加或修改模型输出管理 对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      append-to="body"
      draggable
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="formRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="所属模型：" prop="modelId">
          <el-select
            v-model="form.modelId"
            placeholder="请选择所属模型"
            clearable
            style="width: 100%"
            :disabled="modelId != null"
            @change="
              getAllModelVersion(form.modelId.id), (form.modelVersion = null)
            "
            value-key="id"
          >
            <el-option
              v-for="dict in modelList"
              :key="dict.id"
              :label="dict.name"
              :value="dict"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="所属版本：" prop="modelVersion">
          <el-select
            v-model="form.modelVersion"
            placeholder="请先选择所属模型"
            clearable
            style="width: 100%"
          >
            <el-option
              v-for="dict in versionList"
              :key="dict.id"
              :label="dict.version"
              :value="parseInt(dict.version)"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          v-if="form.modelVersion != null && form.modelId != null"
          label="输出名称："
          prop="name"
        >
          <el-input
            clearable
            v-model="form.name"
            placeholder="请输入输出名称"
          />
        </el-form-item>
        <el-form-item
          v-if="form.modelVersion != null && form.modelId != null"
          :label="form.format == 0 ? '文件名称：' : '字段名称：'"
          prop="engName"
        >
          <el-input
            clearable
            v-model="form.engName"
            :placeholder="
              form.format == 0 ? '请输入文件名称' : '请输入字段名称'
            "
          />
        </el-form-item>
        <el-form-item label="输出类型：" prop="type">
          <el-select
            v-model="form.type"
            placeholder="请选择输出类型"
            clearable
            style="width: 100%"
          >
            <el-option
              v-for="dict in model_input_param_type.slice(0, 2)"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          v-if="form.type === 0"
          label="单值默认返回数据："
          prop="singleContent"
        >
          <el-input
            clearable
            v-model="form.singleContent"
            placeholder="请输入单值默认返回数据"
          />
        </el-form-item>
        <el-form-item
          v-if="form.type === 1"
          label="多列数示例："
          prop="multipleContent"
        >
          <el-row type="flex" justify="end">
            <el-col :span="1.5" class="btn-style">
              <el-button
                type="primary"
                icon="el-icon-plus"
                size="mini"
                @click="handleAddMultiple"
                >添加
              </el-button>
            </el-col>
          </el-row>
          <el-table
            :data="form.multipleContent"
            style="width: auto"
            :row-class-name="multipleIndex"
            @selection-change="handleMultipleChange"
          >
            <el-table-column label="列名称" prop="form.multiple.name">
              <template #default="scope">
                <el-input v-model="scope.row.name" placeholder="列名称" />
              </template>
            </el-table-column>
            <el-table-column label="列默认值" prop="form.multiple.value">
              <template #default="scope">
                <el-input v-model="scope.row.value" placeholder="列默认值" />
              </template>
            </el-table-column>
            <el-table-column label="列排序" prop="form.multiple.order">
              <template #default="scope">
                <el-input-number
                  v-model="scope.row.order"
                  controls-position="right"
                  :min="0"
                  style="width: 100%"
                />
              </template>
            </el-table-column>
            <el-table-column align="center" label="操作" width="100">
              <template #default="scope">
                <el-button
                  type="danger"
                  @click="handleDeleteMultiple(scope.row)"
                  >删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
        <el-form-item
          v-if="form.type === 2"
          label="输出文件："
          prop="paramFile"
        >
          <FileUpload v-model="form.paramFile" :limit="1" fileStyle2 />
        </el-form-item>
        <el-form-item label="输出说明：" prop="description">
          <el-input
            v-model="form.description"
            :rows="3"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancel">取 消</el-button>
          <el-button type="primary" @click="submitForm">确 定</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 详情 模型输入管理 对话框 -->
    <el-dialog
      :title="titleView"
      v-model="openView"
      width="800px"
      append-to="body"
      draggable
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ titleView }}
        </span>
      </template>
      <el-form ref="formRef" :model="formView" label-width="100px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="输出名称：" prop="name">
              <div>{{ formView.name }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item
              :label="
                formView.format !== undefined && formView.format === 0
                  ? '文件名称：'
                  : '字段名称：'
              "
              prop="engName"
            >
              <div>{{ formView.engName }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="所属模型：" prop="modelName">
              <div>{{ formView.modelName }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属版本：" prop="modelVersion">
              <div>{{ formView.modelVersion }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="输出类型：" prop="type">
              <dict-tag
                :options="model_input_param_type"
                :value="formView.type"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20" v-if="formView.type === 1">
          <el-col :span="24">
            <el-form-item label="各参数信息：" prop="multipleContent">
              <el-table
                :data="formView.multipleContent"
                :row-class-name="multipleIndex"
              >
                <el-table-column
                  label="参数名称"
                  prop="formView.multiple.name"
                  width="300"
                >
                  <template #default="scope">
                    {{ scope.row.name }}
                  </template>
                </el-table-column>
                <el-table-column
                  label="列排序"
                  prop="formView.multiple.order"
                  width="150"
                >
                  <template #default="scope">
                    {{ scope.row.order }}
                  </template>
                </el-table-column>
              </el-table>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20" v-if="formView.type === 2">
          <el-col :span="24">
            <el-form-item label="输出文件：" prop="paramFile">
              <FileUpload
                v-model="formView.paramFile"
                :limit="1"
                fileStyle2
                disabled
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="输出说明：" prop="description">
              <div>
                {{ formView.description == null ? "--" : formView.description }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="mini" @click="cancelView">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted, getCurrentInstance } from "vue";
import {
  listOutput,
  getOutput,
  delOutput,
  addOutput,
  updateOutput,
  findAllModel,
  findAllModelVersion,
} from "@/api/modelReconstitution/output";

import { getModel } from "@/api/model/model";
import { useDict } from "@/utils/dict.js";
import { ElMessage, ElMessageBox } from "element-plus";

// Get access to the current instance to use router
const { proxy } = getCurrentInstance();

// Define refs for form elements
const queryFormRef = ref(null);
const formRef = ref(null);

// Component state
const modelList = ref([]);
const versionList = ref([]);
// 遮罩层
const loading = ref(true);
// 选中数组
const ids = ref([]);
// 非单个禁用
const single = ref(true);
// 非多个禁用
const multiple = ref(true);
// 显示搜索条件
const showSearch = ref(true);
// 总条数
const total = ref(0);
// 模型输入管理 表格数据
const inputList = ref([]);
// 弹出层标题
const title = ref("");
// 是否显示弹出层
const open = ref(false);
// 弹出层标题
const titleView = ref("");
// 是否显示弹出层
const openView = ref(false);
// 查询参数
const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  name: null,
  version: null,
});
// 表单参数
const form = reactive({
  singleContent: [],
  multipleContent: [],
});
// 表单参数
const formView = ref({});
// 表单校验
const rulesView = ref({});
// 可编辑表格
const checkedSingle = ref([]);
const checkedMultiple = ref([]);
// 表单校验
const rules = reactive({
  modelId: [
    {
      required: true,
      message: "请指定模型",
      trigger: "blur",
    },
  ],
  modelVersion: [
    {
      required: true,
      message: "请指定模型版本",
      trigger: "blur",
    },
  ],
  name: [
    {
      required: true,
      message: "请输入名称",
      trigger: "blur",
    },
  ],
  engName: [
    {
      required: true,
      message: "请输入字段名称或文件名称",
      trigger: "blur",
    },
  ],
  type: [
    {
      required: true,
      message: "请指定模型版本",
      trigger: "blur",
    },
  ],
});

const model_input_param_type = useDict(
  "model_input_param_type"
).model_input_param_type;

// Computed properties
const modelId = computed(() => {
  return proxy.$route.query.modelId;
});

const modelName = computed(() => {
  return proxy.$route.query.modelName;
});

onMounted(() => {
  getList();
  getAllModel();
});

// Methods converted to standalone functions
const cancelView = () => {
  openView.value = false;
};
// 获取模型
const getAllModel = () => {
  findAllModel({}).then((res) => {
    modelList.value = res.data;
  });
};
// 获取版本
const getAllModelVersion = (param) => {
  const data = { modelId: param };
  findAllModelVersion(data).then((res) => {
    if (param) {
      versionList.value = res.data;
    } else {
      versionList.value = [];
    }
    let model = modelList.value.filter((item) => item.id === param);
    form.format = model[0].format;
  });
};
/** 查询模型输入管理 列表 */
const getList = () => {
  loading.value = true;
  let modelId = proxy.$route.query.modelId;
  if (modelId) {
    queryParams.modelId = parseInt(modelId);
  }
  listOutput(queryParams).then((response) => {
    inputList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
};
// 取消按钮
const cancel = () => {
  open.value = false;
  reset();
};
// 表单重置
const reset = () => {
  Object.assign(form, {
    id: null,
    companyId: null,
    name: null,
    engName: null,
    type: null,
    modelId: null,
    modelName: null,
    modelVersion: null,
    description: null,
    example: null,
    singleContent: [],
    multipleContent: [],
  });
  if (formRef.value) {
    formRef.value.clearValidate();
  }
};
/** 搜索按钮操作 */
const handleQuery = () => {
  queryParams.pageNum = 1;
  getList();
};
/** 重置按钮操作 */
const resetQuery = () => {
  if (queryFormRef.value) {
    queryFormRef.value.resetFields();
  }
  handleQuery();
};
// 多选框选中数据
const handleSelectionChange = (selection) => {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length !== 1;
  multiple.value = !selection.length;
};
/** 新增按钮操作 */
const handleAdd = () => {
  reset();
  open.value = true;
  title.value = "添加模型输出管理";
  if (modelId.value) {
    form.modelId = {
      id: parseInt(modelId.value),
      name: modelName.value,
    };
    getAllModelVersion(form.modelId.id);
    form.modelVersion = null;
  }
};
/** 修改按钮操作 */
const handleUpdate = (row) => {
  reset();
  const id = row.id || ids.value;
  getOutput(id).then((response) => {
    Object.assign(form, response.data);
    form.modelId = {
      id: response.data.modelId,
      name: response.data.modelName,
    };
    form.singleContent = JSON.parse(form.singleContent);
    form.multipleContent = JSON.parse(form.multipleContent);
    getAllModelVersion(form.modelId.id);
    open.value = true;
    title.value = "修改模型输出管理";
  });
};
/** 详情按钮操作 */
const handleView = (row) => {
  reset();
  const id = row.id || ids.value;
  getOutput(id).then((response) => {
    Object.assign(formView.value, response.data);
    getModel(formView.value.modelId)
      .then((res) => {
        formView.value.format = res.data.format;
        // 修复数据格式处理
        if (formView.value.type === 0) {
          formView.value.singleContent =
            formView.value.singleContent === "[]" ||
            formView.value.singleContent === '""'
              ? "--"
              : formView.value.singleContent;
        } else if (formView.value.type === 1) {
          try {
            formView.value.multipleContent = JSON.parse(
              formView.value.multipleContent
            );
          } catch (e) {
            console.error("解析 multipleContent 失败", e);
            formView.value.multipleContent = [];
          }
        }
        openView.value = true;
        titleView.value = "模型输出管理详情";
      })
      .catch((error) => {
        console.error("获取模型信息失败", error);
        // 即使获取模型信息失败，也要显示详情，但 format 会是 undefined
        formView.value.singleContent =
          formView.value.singleContent === "[]" ||
          formView.value.singleContent === '""'
            ? "--"
            : formView.value.singleContent;
        try {
          formView.value.multipleContent = JSON.parse(
            formView.value.multipleContent
          );
        } catch (e) {
          console.error("解析 multipleContent 失败", e);
          formView.value.multipleContent = [];
        }
        openView.value = true;
        titleView.value = "模型输出管理详情";
      });
  });
};

/** 提交按钮 */
const submitForm = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      const formData = { ...form };
      formData.modelName = formData.modelId.name;
      formData.modelId = formData.modelId.id;
      formData.singleContent = JSON.stringify(formData.singleContent);
      formData.multipleContent = JSON.stringify(formData.multipleContent);
      if (formData.id != null) {
        updateOutput(formData).then((response) => {
          ElMessage.success("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addOutput(formData).then((response) => {
          ElMessage.success("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
};
/** 删除按钮操作 */
const handleDelete = (row) => {
  const outputIds = row.id || ids.value;
  ElMessageBox.confirm(
    '是否确认删除模型输出管理 编号为"' + outputIds + '"的数据项？'
  )
    .then(function () {
      return delOutput(outputIds);
    })
    .then(() => {
      getList();
      ElMessage.success("删除成功");
    })
    .catch(() => {});
};
/** 导出按钮操作 */
const handleExport = () => {
  proxy.download(
    "model/output/export",
    {
      ...queryParams,
    },
    `output_${new Date().getTime()}.xlsx`
  );
};

/** 单值 添加按钮操作 */
const handleAddSingle = () => {
  let obj = {};
  obj.param = "";
  obj.name = "";
  obj.value = "";
  form.singleContent.push(obj);
};
/** 单值 删除按钮操作 */
const handleDeleteSingle = (row) => {
  const id = row.index;
  const singleContent = form.singleContent;
  form.singleContent = singleContent.filter(function (item) {
    return item.index != id;
  });
};
/** 单值 序号 */
const singleIndex = ({ row, rowIndex }) => {
  row.index = rowIndex + 1;
};
/** 复选框选中数据 */
const handleSingleChange = (selection) => {
  checkedSingle.value = selection.map((item) => item.index);
};

/** 多列值 添加按钮操作 */
const handleAddMultiple = () => {
  let obj = {};
  obj.name = "";
  obj.value = "";
  obj.order = "";
  form.multipleContent.push(obj);
};
/** 多列值 删除按钮操作 */
const handleDeleteMultiple = (row) => {
  const id = row.index;
  const multipleContent = form.multipleContent;
  form.multipleContent = multipleContent.filter(function (item) {
    return item.index != id;
  });
};
/** 多列值 序号 */
const multipleIndex = ({ row, rowIndex }) => {
  row.index = rowIndex + 1;
};
/** 复选框选中数据 */
const handleMultipleChange = (selection) => {
  checkedMultiple.value = selection.map((item) => item.index);
};
</script>
