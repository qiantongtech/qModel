<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryFormRef"
      :inline="true"
      v-show="showSearch"
    >
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
      <el-form-item label="起止时间：" prop="timer">
        <el-date-picker
          clearable
          v-model="timer"
          type="daterange"
          range-separator="至"
          start-placeholder="开始时间"
          end-placeholder="结束时间"
          value-format="YYYY-MM-DD"
          @change="timerChange"
        >
        </el-date-picker>
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
          ><i class="iconfont-mini icon-xinzeng"></i> 新增</el-button
        >
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" />
    </el-row>

    <el-table
      v-loading="loading"
      :data="caclList"
      @selection-change="handleSelectionChange"
    >
      <!--      <el-table-column label="计算编码" align="center" prop="id" />-->
      <el-table-column label="计算名称" align="center" prop="name" />
      <!--      <el-table-column label="模型名称" align="center" prop="modelName" />-->
      <el-table-column label="版本号" align="center" prop="modelVersion">
        <template #default="scope">
          <el-tag size="small">Version {{ scope.row.modelVersion }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="开始时间"
        align="center"
        prop="startTime"
        width="180"
      >
        <template #default="scope">
          <span v-if="scope.row.startTime == null">--</span>
          <span v-else>{{
            parseTime(scope.row.startTime, "{y}-{m}-{d}")
          }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="结束时间"
        align="center"
        prop="endTime"
        width="180"
      >
        <template #default="scope">
          <span v-if="scope.row.endTime == null">--</span>
          <span v-else>{{ parseTime(scope.row.endTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="计算状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="model_type" :value="scope.row.status + ''" />
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button type="primary" link @click="setParams(scope.row)"
            >输入参数设置</el-button
          >
          <el-button type="primary" link @click="handleCompute(scope.row)"
            >开始计算</el-button
          >
          <el-button type="primary" link @click="handleView(scope.row)"
            >查看计算结果</el-button
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

    <!-- 添加或修改模型计算管理 对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      :close-on-click-modal="false"
      append-to="body"
      draggable
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" :id="titleId" :class="titleClass">{{
          title
        }}</span>
      </template>
      <el-form ref="formRef" :model="form" :rules="rules" label-width="150px">
        <el-row>
          <el-col :span="20">
            <el-form-item label="计算名称：" prop="name">
              <el-input
                clearable
                v-model="form.name"
                placeholder="请输入计算名称"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="模型名称：" prop="modelId">
              <el-select
                v-model="form.modelId"
                placeholder="请选择所属模型"
                clearable
                class="el-form-input-width"
                :disabled="true"
                @change="
                  getAllModelVersion(form.modelId), (form.modelVersion = null)
                "
                value-key="id"
              >
                <el-option
                  v-for="dict in modelList"
                  :key="dict.id"
                  :label="dict.name"
                  :value="dict.id"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="模型版本：" prop="modelVersion">
              <el-select
                v-model="form.modelVersion"
                placeholder="请先选择所属模型"
                clearable
                class="el-form-input-width"
                @change="
                  getInterfaceAddress(form.modelId.id, form.modelVersion),
                    (form.addressId = null)
                "
              >
                <el-option
                  v-for="dict in versionList"
                  :key="dict.id"
                  :label="'Version ' + dict.version"
                  :value="dict.version"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="接口选择：" prop="addressId">
              <el-select
                v-model="form.addressId"
                placeholder="请先选择模型接口"
                clearable
                style="width: 100%"
              >
                <el-option
                  v-for="dict in interfaceAddressList"
                  :key="dict.id"
                  :label="dict.interfaceAddress"
                  :value="dict.id"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancel">取 消</el-button>
          <el-button type="primary" @click="submitForm">确 定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import {
  ref,
  reactive,
  computed,
  watch,
  onMounted,
  getCurrentInstance,
} from "vue";
import { useRoute } from "vue-router";
import { ElMessage, ElMessageBox } from "element-plus";
import {
  listCacl,
  getCacl,
  delCacl,
  addCacl,
  updateCacl,
  startCacl,
  findModelInputById,
  findModelOutputById,
} from "@/api/modelReconstitution/cacl";
import {
  findAllModel,
  findAllModelVersion,
} from "@/api/modelReconstitution/input";
import { listInterfaceAddress } from "@/api/modelReconstitution/interfaceAddress";
import { useDict } from "@/utils/dict.js";

// 获取当前实例以访问路由和其他属性
const { proxy } = getCurrentInstance();
const route = useRoute();

// props
const props = defineProps({
  model: {
    type: Object,
  },
});

// 响应式数据
const size = ref("small");
const deleteFlag = ref(true);
const names = ref([
  { success: "请求状态" },
  { errorCode: "状态值" },
  { message: "请求是否成功" },
  { data: "数据" },
  { buildingId: "设备id" },
  { buildingName: "设备名称" },
  { buildingType: "设备类型" },
  { buildingTypeName: "设备类型名称" },
  { useable: "是否可用" },
  { realFlow: "实时流量" },
  { pumpSate: "泵组状态" },
  { maxTheoryFlow: "流量上限" },
  { minTheoryFlow: "流量下限" },
]);
const jsonStr = ref({
  success: true,
  errorCode: "2000",
  message: "操作成功",
  data: [
    {
      buildingId: "SGJZ00000849",
      buildingName: "西泵站 5#机组",
      buildingType: "100008",
      buildingTypeName: "泵站",
      useable: true,
      realFlow: 0,
      pumpSate: 0,
      maxTheoryFlow: 8,
      minTheoryFlow: 0,
    },
  ],
});
const inputList = ref([]);
const outputList = ref([]);
const modelList = ref([]);
const versionList = ref([]);
const interfaceAddressList = ref([]);
const cacl = ref({});
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
// 模型计算管理 表格数据
const caclList = ref([]);
// 弹出层标题
const title = ref("");
// 是否显示弹出层
const open = ref(false);
// 查询参数
const timer = ref(null);
const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  modelName: null,
  modelVersion: null,
  startTime: null,
  endTime: null,
});
// 表单参数
const form = ref({
  modelId: null,
});
// 表单校验
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
});
const titleParams = ref("");
const openParams = ref(false);
const formParams = ref({});
const rulesParams = ref({});

// 字典数据
const model_type = useDict("calculation_status").calculation_status;

// 模板引用
const queryFormRef = ref(null);
const formRef = ref(null);

// 计算属性
const dialogAppendTo = computed(() => {
  return proxy?.$refs?.appContainer || "body";
});

// 方法定义
// 获取输入参数
const getInputList = (param) => {
  findModelInputById(param).then((res) => {
    jsonStr.value =
      JSON.parse(res.data.modelInputJson) == null
        ? {}
        : JSON.parse(res.data.modelInputJson);
    let namesCpoy = JSON.parse(res.data.modelInputNames);

    names.value = [];
    for (let key in namesCpoy) {
      names.value.push({ [key]: namesCpoy[key] });
    }
  });
};

// 获取输出参数
const getOutputList = (param) => {
  findModelOutputById(param).then((res) => {
    jsonStr.value =
      JSON.parse(res.data.modelOutputJson) == null
        ? {}
        : JSON.parse(res.data.modelOutputJson);
    let namesCpoy = JSON.parse(res.data.modelOutputNames);

    names.value = [];
    for (let key in namesCpoy) {
      names.value.push({ [key]: namesCpoy[key] });
    }
  });
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
    console.log(res, "banben1");

    if (param) {
      versionList.value = res.data;
    } else {
      versionList.value = [];
    }
  });
};

/**监听json数据变化 */
const jsonListener = (json) => {
  console.log(json);
  jsonStr.value = json;
};

// 获取接口列表
const getInterfaceAddress = (modelId, version) => {
  let versionId = versionList.value.filter((item) => {
    if (item.version == version) {
      return true;
    }
  })[0].id;
  const data = { modelId: modelId, versionId: versionId };
  listInterfaceAddress(data).then((response) => {
    interfaceAddressList.value = response.data.rows;
  });
};

const selectCacl = (id) => {
  getCacl(id).then((res) => {
    cacl.value = res.data;
  });
};

const timerChange = (e) => {
  if (e) {
    queryParams.startTime = e[0];
    queryParams.endTime = e[1];
  } else {
    queryParams.startTime = null;
    queryParams.endTime = null;
  }
};

/** 查询模型计算管理 列表 */
const getList = () => {
  loading.value = true;
  listCacl(queryParams).then((response) => {
    caclList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

// 取消按钮
const cancel = () => {
  open.value = false;
  reset();
  openParams.value = false;
  resetParams();
};

// 表单重置
const reset = () => {
  form.value = {
    id: null,
    code: null,
    name: null,
    modelId: null,
    modelName: null,
    modelVersion: null,
    startTime: null,
    endTime: null,
    status: 0,
    inputIds: null,
    outputIds: null,
    validFlag: null,
    delFlag: null,
    createBy: null,
    creatorId: null,
    createTime: null,
    updateBy: null,
    updatorId: null,
    updateTime: null,
    remark: null,
    addressId: null,
    addressType: null,
    address: null,
    requestMethod: null,
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
  timer.value = null;
  timerChange();
  queryParams.modelVersion = props.model.version;
  handleQuery();
};

// 多选框选中数据
const handleSelectionChange = (selection) => {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length !== 1;
  multiple.value = !selection.length;
};

// 表单重置
const resetParams = () => {
  formParams.value = {
    id: null,
    code: null,
    name: null,
    modelId: null,
    modelName: null,
    modelVersion: null,
    startTime: null,
    endTime: null,
    status: 0,
    inputIds: null,
    outputIds: null,
    validFlag: null,
    delFlag: null,
    createBy: null,
    creatorId: null,
    createTime: null,
    updateBy: null,
    updatorId: null,
    updateTime: null,
    remark: null,
    addressId: null,
    addressType: null,
    address: null,
    requestMethod: null,
  };
  if (proxy?.$refs?.formParams) {
    proxy.$refs.formParams.resetFields();
  }
};

/** 新增按钮操作 */
const handleAdd = () => {
  reset();
  open.value = true;
  title.value = "添加模型计算管理";
  if (props.model) {
    form.value.modelId = props.model.id;
    form.value.modelName = props.model.name;
    getAllModelVersion(props.model.id);
  }
};

/** 操作-设置参数 */
const setParams = (row) => {
  const id = row.id;
  resetParams();
  // openParams.value = true;
  // titleParams.value = "输入参数设置";
  // deleteFlag.value = true;

  proxy.$tab.openPage(
    "/model/modelComputeInputOrOutput?modelId=" +
      props.model.id +
      "&computeId=" +
      id +
      "&isInputOrOut=0&deleteFlag:1"
  );
  /*getInputList(id);
            selectCacl(id);*/
};

/** 操作-计算 */
const handleCompute = (row) => {
  const id = row.id;
  caclList.value.forEach((item) => {
    if (item.id == id) {
      item.status = 1;
    }
  });
  startCacl(id).then((res) => {
    ElMessage.success("模型计算完毕");
    getList();
  });
};

/** 操作-查看结果 */
const handleView = (row) => {
  const id = row.id;
  const modelId = row.modelId;
  getCacl(id).then((res) => {
    cacl.value = res.data;
    if (cacl.value.status !== 1) {
      ElMessage.error("模型还没有计算完成，请耐心等待.....");
      return;
    }
    // openParams.value = true;
    // titleParams.value = "查看结果";
    // deleteFlag.value = false;
    proxy.$tab.openPage(
      "/model/modelComputeInputOrOutput?modelId=" +
        modelId +
        "&computeId=" +
        id +
        "&isInputOrOut=1&deleteFlag:1"
    );
    /*getOutputList(id);
     */
  });
};

/** 修改按钮操作 */
const handleUpdate = (row) => {
  reset();
  const id = row.id || ids.value;
  getCacl(id).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改模型计算管理 ";
  });
};

/** 提交按钮 */
const submitForm = () => {
  if (formRef.value) {
    formRef.value.validate((valid) => {
      if (valid) {
        let model = modelList.value.filter((item) => {
          if (item.id == form.value.modelId) {
            return true;
          }
        })[0];
        form.value.modelName = model.name;
        form.value.addressType = model.accessMode;
        const formData = { ...form.value };
        if (formData.id != null) {
          updateCacl(formData).then((response) => {
            ElMessage.success("修改成功");
            open.value = false;
            getList();
          });
        } else {
          addCacl(formData).then((response) => {
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
    '是否确认删除模型计算管理编号为"' + idsToDelete + '"的数据项？'
  )
    .then(function () {
      return delCacl(idsToDelete);
    })
    .then(() => {
      getList();
      ElMessage.success("删除成功");
    })
    .catch(() => {});
};

// 关闭弹窗
const close = (done) => {
  if (timer.value) {
    clearInterval(timer.value);
    timer.value = null;
  }
  done();
};

// 设置参数保存
const submitJsonForm = () => {
  let caclData = {
    id: cacl.value.id,
    inputContent: JSON.stringify(jsonStr.value),
  };
  updateCacl(caclData).then((response) => {
    ElMessage.success("参数设置成功");
    openParams.value = false;
    getList();
  });
};

/** 删除按钮操作 (duplicate, using the one defined earlier) */

/** 导出按钮操作 */
const handleExport = () => {
  proxy.$download(
    "model/cacl/export",
    {
      ...queryParams,
    },
    `cacl_${new Date().getTime()}.xlsx`
  );
};

/** 单值 添加按钮操作 */
const handleAddSingle = () => {
  let obj = {};
  obj.param = "";
  obj.name = "";
  obj.value = "";
  form.value.singleContent.push(obj);
};

/** 单值 删除按钮操作 */
const handleDeleteSingle = (row) => {
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
  let obj = {};
  obj.name = "";
  obj.value = "";
  obj.order = "";
  form.value.multipleContent.push(obj);
};

/** 多列值 删除按钮操作 */
const handleDeleteMultiple = (row) => {
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
  checkedMultiple.value = selection.map((item) => item.index);
};

// 监听器
watch(
  () => props.model,
  (newVal, oldVal) => {
    if (newVal != null && oldVal != null && newVal.id == oldVal.id) return;
    if (newVal) {
      form.value.modelId = newVal.id;
      queryParams.modelVersion = newVal.version;
      queryParams.modelId = newVal.id;
      form.value.modelId = newVal.id;
    }
    getList();
    getAllModelVersion(form.value.modelId);
  },
  { deep: true, immediate: true }
);

// 组件挂载后执行
onMounted(() => {
  getAllModel();
});
</script>
<style lang="scss" scoped>
.app-container {
  min-height: 0;
  background: transparent;
}

.params-item {
  .params-title {
    font-weight: bold;
    font-size: 16px;
    padding: 10px;
    border-bottom: 1px solid #eee;
  }

  .params-con {
    padding: 20px 0px;
  }
}
</style>
