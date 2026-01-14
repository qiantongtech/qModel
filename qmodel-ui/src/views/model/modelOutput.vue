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
  <div class="app-container">
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
        <el-select
          class="el-form-input-width"
          v-model="queryParams.modelVersion"
          placeholder="请输入版本号"
          clearable
        >
          <el-option
            v-for="item in versionList"
            :key="item.id"
            :label="'Version ' + item.version"
            :value="item.version"
          >
          </el-option>
        </el-select>
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain @click="handleAdd"
          ><i class="iconfont-mini icon-xinzeng"></i>新增</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="inputList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column label="输出名称" align="center" prop="name" />
      <el-table-column label="输出类型" align="center" prop="type">
        <template #default="scope">
          <dict-tag :options="model_input_param_type" :value="scope.row.type" />
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
          <el-button type="primary" link @click="handleView(scope.row)"
            ><View class="icon-mini" /> 详情</el-button
          >
          <el-button type="primary" link @click="handleUpdate(scope.row)"
            ><Edit class="icon-mini" /> 修改</el-button
          >
          <el-button type="danger" link @click="handleDelete(scope.row)"
            ><Delete class="icon-mini" /> 删除</el-button
          >
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

    <!-- 添加或修改模型输入管理 对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      :close-on-click-modal="false"
      append-to-body
    >
      <el-form
        ref="formRef"
        :model="form"
        :rules="rules"
        label-width="150px"
        style="max-height: 600px; overflow: hidden auto"
      >
        <el-row>
          <el-col :span="20">
            <!-- modelName -->
            <el-form-item label="所属模型：" prop="modelId">
              <el-select
                v-model="form.modelId"
                placeholder="请选择所属模型"
                clearable
                class="el-form-input-width"
                :disabled="modelId != null"
                @change="
                  getAllModelVersion(form.modelId.id),
                    (form.modelVersion = null)
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
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="所属版本：" prop="modelVersion">
              <el-select
                v-model="form.modelVersion"
                placeholder="请先选择所属模型"
                clearable
                class="el-form-input-width"
              >
                <el-option
                  v-for="dict in versionList"
                  :key="dict.id"
                  :label="dict.version"
                  :value="parseInt(dict.version)"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.modelVersion != null && form.modelId != null">
          <el-col :span="20">
            <el-form-item label="输出名称：" prop="name">
              <el-input
                clearable
                v-model="form.name"
                placeholder="请输入输出名称"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.modelVersion != null && form.modelId != null">
          <el-col :span="20">
            <el-form-item label="文件路径名称：" prop="engName">
              <el-input
                clearable
                v-model="form.engName"
                placeholder="请输入文件路径名称"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="输出类型：" prop="type">
              <el-select
                v-model="form.type"
                placeholder="请选择输出类型"
                clearable
                class="el-form-input-width"
              >
                <el-option
                  v-for="dict in model_input_param_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.type == 0">
          <el-col :span="20">
            <el-form-item label="单值默认返回数据：" prop="singleContent">
              <el-input
                clearable
                v-model="form.singleContent"
                placeholder="请输入单值默认返回数据"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.type == 1">
          <el-col :span="20">
            <el-form-item label="多列数示例：" prop="multipleContent">
              <el-row type="flex" justify="end">
                <el-col :span="1.5" class="mb8">
                  <el-button type="primary" @click="handleAddMultiple"
                    >添加</el-button
                  >
                </el-col>
                <!-- <el-col :span="1.5">
                                  <el-button
                                    type="danger"
                                    icon="el-icon-delete"
                                    size="mini"
                                    :disabled="checkedTaskCar.length == 0"
                                    @click="handleDeleteTaskCar"
                                    >删除</el-button
                                  >
                                </el-col> -->
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
                    <el-input
                      v-model="scope.row.value"
                      placeholder="列默认值"
                    />
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
          </el-col>
        </el-row>
        <el-row v-if="form.type == 2">
          <el-col :span="20">
            <el-form-item label="输出文件：" prop="paramFile">
              <FileUpload v-model="form.paramFile" :limit="1" fileStyle2 />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="输出说明：" prop="description">
              <el-input
                v-model="form.description"
                :rows="3"
                type="textarea"
                placeholder="请输入内容"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <!--        <el-row>
                          <el-col :span="20">
                            <el-form-item label="输出示例：" prop="example">
                              <FileUpload v-model="form.example" :limit="1" fileStyle2 />
                            </el-form-item>
                          </el-col>
                        </el-row>-->
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 详情 模型输入管理 对话框 -->
    <el-dialog
      :title="titleView"
      v-model="openView"
      width="800px"
      :close-on-click-modal="false"
      append-to-body
    >
      <el-form
        ref="formRef"
        :model="formView"
        :rules="rulesView"
        label-width="150px"
        style="max-height: 600px; overflow: hidden auto"
      >
        <el-row>
          <el-col :span="20">
            <el-form-item label="输出名称：" prop="name">
              {{ formView.name }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item
              :label="formView.accessMode == 0 ? '文件名称：' : '字段名称：'"
              prop="engName"
            >
              {{ formView.engName }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <!-- modelName -->
            <el-form-item label="所属模型：" prop="modelName">
              {{ formView.modelName }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="所属版本：" prop="modelVersion">
              {{ formView.modelVersion }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="输出类型：" prop="type">
              <!--              <dict-tag-->
              <!--                :options="model_type"-->
              <!--                :value="formView.type"-->
              <!--              />-->
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="formView.type === 1">
          <el-col :span="20">
            <el-form-item label="各参数信息：" prop="multipleContent">
              <el-row type="flex" justify="end"> </el-row>
              <el-table
                :data="formView.multipleContent"
                style="width: auto"
                :row-class-name="multipleIndex"
                @selection-change="handleMultipleChange"
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
                <!-- <el-table-column align="center" label="操作" width="100">
                                  <template #default="scope">
                                    <el-button
                                      type="danger"
                                      icon="el-icon-delete"
                                      size="mini"
                                      @click="handleDeleteMultiple(scope.row)"
                                      >删除</el-button
                                    >
                                  </template>
                                </el-table-column> -->
              </el-table>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="formView.type === 2">
          <el-col :span="20">
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
        <el-row>
          <el-col :span="20">
            <el-form-item label="输出说明：" prop="description">
              {{ formView.description == null ? "--" : formView.description }}
            </el-form-item>
          </el-col>
        </el-row>
        <!--        <el-row>
                          <el-col :span="20">
                            <el-form-item label="输出示例：" prop="example">
                              <FileUpload
                                v-model="formView.example"
                                :limit="1"
                                fileStyle2
                                disabled
                              />
                            </el-form-item>
                          </el-col>
                        </el-row>-->
      </el-form>
      <!-- <template #footer>
                  <div class="dialog-footer">
              <el-button type="primary" @click="submitForm">确 定</el-button>
              <el-button @click="cancel">取 消</el-button>
            </div> -->
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, watch, onMounted, getCurrentInstance } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import {
  listOutput,
  getOutput,
  delOutput,
  addOutput,
  updateOutput,
} from "@/api/modelReconstitution/output";

import { useDict } from "@/utils/dict.js";

// 获取当前实例以访问全局方法
const { proxy } = getCurrentInstance();

const model_input_param_type = useDict(
  "model_input_param_type"
).model_input_param_type;
// 响应式数据

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
// 模型输出管理 表格数据
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
  modelId: null,
  modelName: null,
  modelVersion: null,
  name: null,
  engName: null,
  type: null,
  description: null,
  singleContent: null,
  multipleContent: null,
  paramFile: null,
  example: null,
  validFlag: null,
  delFlag: null,
  createBy: null,
  creatorId: null,
  createTime: null,
  updateBy: null,
  updatorId: null,
  updateTime: null,
  remark: null,
});
// 表单参数
const form = ref({});
// 表单参数
const formView = ref({});
// 表单校验
const rules = reactive({
  modelId: [
    {
      required: true,
      message: "所属模型不能为空",
      trigger: "blur",
    },
  ],
  modelVersion: [
    {
      required: true,
      message: "所属版本不能为空",
      trigger: "blur",
    },
  ],
  name: [
    {
      required: true,
      message: "输出名称不能为空",
      trigger: "blur",
    },
  ],
  engName: [
    {
      required: true,
      message: "文件路径名称不能为空",
      trigger: "blur",
    },
  ],
  type: [
    {
      required: true,
      message: "输出类型不能为空",
      trigger: "blur",
    },
  ],
  description: [
    {
      required: true,
      message: "输出说明不能为空",
      trigger: "blur",
    },
  ],
});

// 模板引用
const queryFormRef = ref(null);
const formRef = ref(null);

// 选中的数据
const checkedSingle = ref([]);
const checkedMultiple = ref([]);

// 获取路由信息
const $route = useRoute();

// 方法定义

/** 查询模型输出管理 列表 */
const getList = () => {
  loading.value = true;
  let modelId = $route.query.modelId;
  if (modelId) {
    queryParams.modelId = parseInt(modelId);
  }
  listOutput(queryParams).then((response) => {
    console.log(response, "shuju");

    inputList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
    console.log(inputList.value, "qqqqqqqqqqqqqqqqqqqqqqqqqq");
  });
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
    engName: null,
    type: null,
    modelId: null,
    modelName: null,
    modelVersion: null,
    description: null,
    example: null,
    singleContent: [],
    multipleContent: [],
  };
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
  form.value.multipleContent = [];
  form.value.singleContent = [];
  // 如果有路由参数，则设置默认模型ID
  const modelId = $route.query.modelId;
  if (modelId) {
    form.value.modelId = parseInt(modelId);
  }
};

/** 修改按钮操作 */
const handleUpdate = (row) => {
  reset();
  const id = row.id || ids.value;
  getOutput(id).then((response) => {
    form.value = response.data;
    if (form.value.multipleContent != null) {
      form.value.multipleContent = JSON.parse(form.value.multipleContent);
    } else {
      form.value.multipleContent = [];
    }
    if (form.value.singleContent != null) {
      form.value.singleContent = JSON.parse(form.value.singleContent);
    } else {
      form.value.singleContent = [];
    }
    open.value = true;
    title.value = "修改模型输出管理";
  });
};

/** 详细按钮操作 */
const handleView = (row) => {
  reset();
  const id = row.id || ids.value;
  getOutput(id).then((response) => {
    formView.value = response.data;
    if (formView.value.multipleContent != null) {
      formView.value.multipleContent = JSON.parse(
        formView.value.multipleContent
      );
    } else {
      formView.value.multipleContent = [];
    }
    if (formView.value.singleContent != null) {
      formView.value.singleContent = JSON.parse(formView.value.singleContent);
    } else {
      formView.value.singleContent = [];
    }
    openView.value = true;
    titleView.value = "模型输出管理详情";
  });
};

/** 提交按钮 */
const submitForm = () => {
  if (formRef.value) {
    formRef.value.validate((valid) => {
      if (valid) {
        const formData = { ...form.value }; // 创建副本以避免直接修改响应式数据
        if (formData.id != null) {
          if (formData.type == 1) {
            formData.multipleContent = JSON.stringify(formData.multipleContent);
          } else if (formData.type == 0) {
            formData.singleContent = JSON.stringify(formData.singleContent);
          }
          updateOutput(formData).then((response) => {
            ElMessage.success("修改成功");
            open.value = false;
            getList();
          });
        } else {
          if (formData.type == 1) {
            formData.multipleContent = JSON.stringify(formData.multipleContent);
          } else if (formData.type == 0) {
            formData.singleContent = JSON.stringify(formData.singleContent);
          }
          addOutput(formData).then((response) => {
            ElMessage.success("新增成功");
            open.value = false;
            getList();
          });
        }
      }
    });
  }
};

/** 删除按钮操作 */
const handleDelete = (row) => {
  const idsToDelete = row.id || ids.value;
  ElMessageBox.confirm(
    `是否确认删除模型输出管理编号为"${idsToDelete}"的数据项？`,
    "警告",
    {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    }
  )
    .then(() => {
      return delOutput(idsToDelete);
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
  if (!form.value.singleContent) {
    form.value.singleContent = [];
  }
  let obj = {};
  obj.name = "";
  obj.value = "";
  obj.order = "";
  form.value.singleContent.push(obj);
};

/** 单值 删除按钮操作 */
const handleDeleteSingle = (row) => {
  if (!form.value.singleContent) {
    form.value.singleContent = [];
    return;
  }
  const id = row.index;
  const singleContent = form.value.singleContent;
  form.value.singleContent = singleContent.filter(function (item) {
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
  if (!form.value.multipleContent) {
    form.value.multipleContent = [];
  }
  let obj = {};
  obj.name = "";
  obj.value = "";
  obj.order = "";
  form.value.multipleContent.push(obj);
};

/** 多列值 删除按钮操作 */
const handleDeleteMultiple = (row) => {
  if (!form.value.multipleContent) {
    form.value.multipleContent = [];
    return;
  }
  const id = row.index;
  const multipleContent = form.value.multipleContent;
  form.value.multipleContent = multipleContent.filter(function (item) {
    return item.index != id;
  });
};

/** 多列值 序号 */
const multipleIndex = ({ row, rowIndex }) => {
  row.index = rowIndex + 1;
};

/** 复选框选中数据 */
const handleMultipleChange = (selection) => {
  checkedMultiple.value = selection?.map((item) => item.index) || [];
};

// 组件挂载后执行
onMounted(() => {
  getList();
});
</script>
<style lang="scss" scoped>
.app-container {
  min-height: 0;
  background: transparent;
}
</style>
