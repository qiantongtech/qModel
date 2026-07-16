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
    <div class="pagecont-top" v-show="showSearch">
      <el-form
        :model="queryParams"
        ref="queryForm"
        :inline="true"
        v-show="showSearch"
        class="btn-style"
      >
        <el-form-item label="计算名称" prop="modelVersion">
          <el-input
            class="el-form-input-width"
            v-model="queryParams.name"
            placeholder="请输入计算名称"
            clearable
          />
        </el-form-item>
        <el-form-item label="模型名称" prop="modelVersion">
          <el-input
            class="el-form-input-width"
            v-model="queryParams.modelName"
            placeholder="请输入模型名称"
            clearable
          />
        </el-form-item>
        <el-form-item label="计算时间" prop="timer">
          <el-date-picker
            clearable
            v-model="timer"
            type="daterange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            value-format="YYYY-MM-DD"
            @change="timerChange"
            style="width: 210px"
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
    </div>

    <div class="pagecont-bottom">
      <div class="justify-between mb15">
        <el-row :gutter="10" class="btn-style">
          <el-col :span="1.5">
            <el-button
              type="primary"
              plain
              @click="handleAdd"
              v-hasPermi="['model:cacl:add']"
            >
              <i class="iconfont-mini icon-xinzeng mr5"></i>新增
            </el-button>
          </el-col>
        </el-row>
        <right-toolbar
          v-model:showSearch="showSearch"
          @queryTable="getList"
          :columns="columns"
        ></right-toolbar>
      </div>

      <el-table
        v-loading="loading"
        :data="caclList"
        :default-sort="defaultSort"
        @selection-change="handleSelectionChange"
        @sort-change="handleSortChange"
      >
        <el-table-column v-if="getColumnVisibility(0)" label="编号" align="center" prop="id" width="85" sortable="custom"  :sort-orders="['descending', 'ascending']"/>
        <el-table-column v-if="getColumnVisibility(1)" label="计算名称" align="left" prop="name" width="250"/>
        <el-table-column v-if="getColumnVisibility(3)" label="模型名称" align="left" prop="modelName" />
        <el-table-column v-if="getColumnVisibility(4)" label="版本号" align="center" prop="modelVersion">
          <template #default="scope">
            <el-tag size="small">Version {{ scope.row.modelVersion }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(5)"
          label="开始时间"
          align="center"
          prop="startTime"
          width="180"
        >
          <template #default="scope">
            <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(6)"
          label="结束时间"
          align="center"
          prop="endTime"
          width="180"
        >
          <template #default="scope">
            <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column
            v-if="getColumnVisibility(7)"
            label="创建人"
            align="center"
            prop="createBy"
        >
        </el-table-column>
        <el-table-column
            v-if="getColumnVisibility(8)"
            label="创建时间"
            align="center"
            prop="createTime"
            sortable="custom"
            :sort-orders="['descending', 'ascending']"
        >
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(9)"
          label="操作"
          align="center"
          class-name="small-padding fixed-width"
          width="300"
        >
          <template #default="scope">
            <el-button
              link
              type="primary"
              icon="Edit"
              @click="setParams(scope.row)"
              >设置参数</el-button
            >
            <el-button
              link
              type="primary"
              icon="cpu"
              @click="handleCompute(scope.row)"
              >开始计算</el-button
            >
            <el-button
              link
              type="primary"
              icon="view"
              @click="handleView(scope.row)"
              >查看结果</el-button
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
    </div>
    <!-- 添加或修改模型计算管理 对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      :append-to="$refs['app-container']"
      draggable
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="formref" :model="form" :rules="rules" label-width="95px">
        <el-form-item label="计算名称" prop="name">
          <el-input
            clearable
            v-model="form.name"
            placeholder="请输入计算名称"
          />
        </el-form-item>
        <el-form-item label="模型名称" prop="modelId">
          <el-select
            v-model="form.modelId"
            placeholder="请选择模型名称"
            clearable
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
        <el-form-item label="模型版本" prop="modelVersion">
          <el-select
            v-model="form.modelVersion"
            placeholder="请选择模型版本"
            clearable
          >
            <el-option
              v-for="dict in versionList"
              :key="dict.id"
              :label="'Version ' + dict.version"
              :value="dict.version"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
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
  onMounted,
  getCurrentInstance,
  watch,
  nextTick,
} from "vue";
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
  getAllInputJson,
} from "@/api/modelReconstitution/input";
import { waterSurfaceProfileAndQzhb } from "@/api/modelReconstitution/output";
import moment from "moment";

// Get access to the current instance to use router and other properties
const { proxy } = getCurrentInstance();
// Define refs for form elements
const queryFormRef = ref(null);
const formRef = ref(null);

// Component state
const inputMap = ref(new Map());
const inputMultipleContent = ref([]);
const csDatas = ref([
  "CS1",
  "CS2",
  "CS3",
  "CS4",
  "CS5",
  "CS6",
  "CS7",
  "CS8",
  "CS9",
  "CS10",
  "CS11",
  "CS12",
  "CS13",
  "CS14",
  "CS15",
  "CS16",
  "CS17",
  "CS18",
  "CS19",
  "CS20",
  "CS21",
  "CS22",
  "CS23",
  "CS24",
  "CS25",
  "CS26",
  "CS27",
  "CS28",
  "CS29",
  "CS30",
  "CS31",
  "CS32",
  "cs东1",
  "cs东2",
  "cs西2",
  "cs东3",
  "cs西3",
]);
const csChineseName = ref([
  "小山口一级电站下游断面",
  "小山口一、二级之间断面",
  "小山口二级电站上游断面",
  "小山口二级电站下游断面",
  "小山口三级电站上游断面(0-2312)",
  "开都河一枢纽上游断面(0-0669)",
  "开都河一枢纽下游河道断面(2+021)",
  "开都河一枢纽河道断面(4+079)",
  "开都河一枢纽河道断面(6+0533)",
  "开都河一枢纽河道断面(9+888)",
  "开都河一枢纽河道断面(12+089)",
  "开都河一枢纽河道断面(15+574)",
  "开都河一枢纽河道断面(18+838)",
  "开都河一枢纽河道断面(21+060)",
  "开都河一枢纽河道断面(23+993)",
  "开都河一枢纽河道断面(26+293)",
  "开都河一枢纽河道断面(27+783)",
  "开都河一枢纽河道断面(30+349)",
  "开都河一枢纽河道断面(35+508)",
  "开都河一枢纽河道断面(38+245)",
  "开都河一枢纽河道断面(42+202)",
  "开都河一枢纽河道断面(45+253)",
  "开都河二枢纽闸前断面(47+855)",
  "开都河二枢纽河道断面(50+235)",
  "开都河二枢纽河道断面(53+424)",
  "开都河二枢纽吐和高速公路桥断面(55+002)",
  "开都河二枢纽焉耆大桥断面(58+961)",
  "开都河二枢纽河道断面(60+633)",
  "开都河二枢纽河道断面(62+106)",
  "开都河二枢纽河道断面(64+151)",
  "开都河二枢纽河道断面(66+882)",
  "开都河三枢纽闸前断面(68+909)",
  "cs东1",
  "cs东2",
  "cs西2",
  "cs东3",
  "cs西3",
]);
const inputContentJsonData = ref({});
const modelCacl = ref({});
// 查看结果的数据json
const outputJsonData = ref([]);
// 模型输出结果获取
const modelOutputOutcome = ref({});
const inputSingleValueData = ref({});
const outputSingleValueData = ref({});
// 单值的树形数据
const inputSingleValue = ref([]);
const outputSingleValue = ref([]);
// 树形被选择的节点
const currentNodeKey = ref("");
// 输出的树形结构
const outputData = ref([]);
const defaultProps = ref({
  children: "children",
  label: "label",
});
// 输出文件显示的数据
const outputEntity = ref({});
const fileTitle = ref(null);
const isView = ref(false);
const modelDetails = ref({});
const datFileJson = ref([]);
const inputJson = ref([]);
const inputJsonTwo = ref([]);
const showInputJson = ref([]);
const inputTitles = ref([]);
const inputTitlesTwo = ref([]);
const inputPage = ref({
  pageNum: 1,
  pageSize: 10,
});
const chooseInputTitle = ref("小山口流量");
const inputList = ref([]);
const outputList = ref([]);
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
const form = ref({});
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
const defaultSort = ref({ prop: 'createTime', order: 'desc' });
// 列显隐信息
const columns = ref([
  { key: 0, label: '编号', visible: true },
  { key: 1, label: '计算名称', visible: true },
  { key: 3, label: '模型名称', visible: true },
  { key: 4, label: '版本号', visible: true },
  { key: 5, label: '开始时间', visible: true },
  { key: 6, label: '结束时间', visible: true },
  { key: 7, label: '创建人', visible: true },
  { key: 8, label: '创建时间', visible: true },
  { key: 9, label: '操作', visible: true },
]);
const getColumnVisibility = (key) => {
  const column = columns.value.find((col) => col.key === key);
  // 如果没有找到对应列配置，默认显示
  if (!column) return true;
  // 如果找到对应列配置，根据visible属性来控制显示
  return column.visible;
};
const titleParams = ref("");
const openParams = ref(false);
const formParams = ref({});
const rulesParams = ref({});
// Computed properties
const toChinesNum = computed(() => {
  return function (num) {
    let changeNum = [
      "零",
      "一",
      "二",
      "三",
      "四",
      "五",
      "六",
      "七",
      "八",
      "九",
    ]; //changeNum[0] = "零"
    let unit = ["", "十", "百", "千", "万"];
    num = parseInt(num);
    let getWan = (temp) => {
      let strArr = temp.toString().split("").reverse();
      let newNum = "";
      for (var i = 0; i < strArr.length; i++) {
        newNum =
          (i == 0 && strArr[i] == 0
            ? ""
            : i > 0 && strArr[i] == 0 && strArr[i - 1] == 0
            ? ""
            : changeNum[strArr[i]] + (strArr[i] == 0 ? unit[0] : unit[i])) +
          newNum;
      }
      return newNum;
    };
    let overWan = Math.floor(num / 10000);
    let noWan = num % 10000;
    if (noWan.toString().length < 4) noWan = "0" + noWan;
    return overWan ? getWan(overWan) + "万" + getWan(noWan) : getWan(num);
  };
});

const fileType = computed(() => {
  return function (file) {
    if (file) {
      let type = file.substring(file.lastIndexOf("/") + 1, file.length);
      return type;
    }
  };
});

const isDateFormat = computed(() => {
  return function (str) {
    const date = new Date(str);
    return !isNaN(date);
  };
});

// Props
const props = defineProps({
  model: {
    type: Object,
    default: {},
  },
});

// Methods converted to standalone functions
const rowStyle = ({ row, rowIndex }) => {
  if (
    rowIndex >= (inputPage.value.pageNum - 1) * inputPage.value.pageSize &&
    rowIndex < inputPage.value.pageNum * inputPage.value.pageSize
  )
    return;
  return {
    display: "none",
  };
};

// 获取输入参数
const getInputList = (param) => {
  return new Promise((resolve) => {
    findModelInputById(param).then((res) => {
      inputList.value = res.data.modelInputJson;
      for (let i = 0; i < inputList.value.length; i++) {
        inputList.value[i].singleContent = JSON.parse(
          inputList.value[i].singleContent
        );
        inputList.value[i].multipleContent = JSON.parse(
          inputList.value[i].multipleContent
        );
        inputList.value[i].pageNum = 1;
        inputList.value[i].pageSize = 10;
      }
      resolve(inputList.value);
    });
  });
};

// 获取输出参数
const getOutputList = (param) => {
  return new Promise((resolve) => {
    findModelOutputById(param).then((res) => {
      inputList.value = res.data.modelOutputList;
      for (let i = 0; i < inputList.value.length; i++) {
        inputList.value[i].singleContent = JSON.parse(
          inputList.value[i].singleContent
        );
        inputList.value[i].multipleContent = JSON.parse(
          inputList.value[i].multipleContent
        );
      }
      resolve(inputList.value);
    });
  });
};

// 获取模型
const getAllModel = () => {
  findAllModel({}).then((res) => {
    modelList.value = res.data;
  });
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

// 获取版本
const getAllModelVersion = (param) => {
  const data = { modelId: param };
  findAllModelVersion(data).then((res) => {
    console.log(res, "版本信息");

    // if (param) {
    versionList.value = res.data;
    // } else {
    //   versionList.value = [];
    // }
  });
};

const timerChange = (e) => {
  console.log(e);

  if (e) {
    queryParams.startTime = e[0];
    queryParams.endTime = e[1];
  } else {
    queryParams.startTime = null;
    queryParams.endTime = null;
  }
};

// Watch
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
    queryParams.modelVersion = newVal.version;
    queryParams.modelId = newVal.id;
    getList();
    getAllModelVersion(form.value.modelId);
  },
  { deep: true, immediate: true }
);

onMounted(() => {
  getAllModel();
});

// 取消按钮
const cancel = () => {
  open.value = false;
  reset();
  openParams.value = false;
  resetParams();
  isView.value = false;
};

// 表单重置
const reset = () => {
  Object.assign(form.value, {
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
  timer.value = null;
  queryParams.endTime = null;
  queryParams.startTime = null;
  queryParams.name = null;
  queryParams.modelName = null;
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

// 表单重置
const resetParams = () => {
  Object.assign(formParams.value, {
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
  });
  if (formRef.value) {
    // This might need to be a different ref
    formRef.value.clearValidate();
  }
};

/** 新增按钮操作 */
const handleAdd = () => {
  reset();
  form.value.modelId = props.model.id;
  open.value = true;
  title.value = "添加模型计算";
};

/** 操作-设置参数 */
const setParams = async (row) => {
  // ElMessage.warning(
  //   `由于服务器资源问题，暂不支持在演示站中计算，请在本地搭建计算。`
  // );
  // return;

  const id = row.id;
  const modelId = row.modelId;
  // const res = await getInputList(id);
  // if (res.length == 0) {
  //   ElMessage.warning(`模型名称【${row.modelName}】未设置输入参数`);
  //   return;
  // }
  console.log(row, "zi");

  // Note: The tab functionality may need to be implemented differently in Vue 3
  await proxy.$tab.openPage(
    "/model/modelComputeInputOrOutput?modelId=" +
      modelId +
      "&computeId=" +
      id +
      "&isInputOrOut=0&deleteFlag:1"
  );
};

/** 操作-计算 */
const handleCompute = (row) => {
  // ElMessage.warning(
  //   `由于服务器资源问题，暂不支持在演示站中计算，请在本地搭建计算。`
  // );
  // return;

  const calcIds = row.id || ids.value;
  ElMessageBox.confirm("是否开始计算模型名称为【 " + row.name + " 】的数据项？")
    .then(function () {
      startCacl(calcIds).then((res) => {
        ElMessage.success("模型计算完毕");
        getList();
      });
    })
    .then(() => {
      getList();
      ElMessage.success("已成功开始计算");
    })
    .catch(() => {});
};

/** 操作-查看结果 */
const handleView = async (row) => {
  // ElMessage.warning(
  //   `由于服务器资源问题，暂不支持在演示站中计算，请在本地搭建计算。`
  // );
  // return;
  console.log(row, "12312");

  const id = row.id;
  const modelId = row.modelId;
  await proxy.$tab.openPage(
    "/model/modelComputeInputOrOutput?modelId=" +
      modelId +
      "&computeId=" +
      id +
      "&isInputOrOut=1&deleteFlag:1"
  );
};

/** 修改按钮操作 */
const handleUpdate = (row) => {
  reset();
  const id = row.id || ids.value;
  getCacl(id).then((response) => {
    Object.assign(form.value, response.data);
    open.value = true;
    title.value = "修改模型计算管理 ";
  });
};

/** 提交按钮 */
const submitForm = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      let model = modelList.value.filter((item) => {
        if (item.id == form.value.modelId) {
          return true;
        }
      })[0];
      form.value.modelName = model.name;
      form.value.addressType = model.accessMode;
      if (form.value.id != null) {
        updateCacl(form.value).then((response) => {
          ElMessage.success("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCacl(form.value).then((response) => {
          ElMessage.success("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
};

const submitFormParams = () => {
  openParams.value = false;

  let name = inputList.value.filter((item) => {
    if (item.engName == "qqsp_xsk.dat") {
      return true;
    }
    return false;
  })[0].name;
  let hsgName = inputList.value.filter((item) => {
    if (item.engName == "Qin_huangshuigou.dat") {
      return true;
    }
    return false;
  })[0].name;

  let wltName = inputList.value.filter((item) => {
    if (item.engName == "Qin_wulasitaihe.dat") {
      return true;
    }
    return false;
  })[0].name;

  let zmName = inputList.value.filter((item) => {
    if (item.engName == "shuniu_zhamenkongzhi.dat") {
      return true;
    }
    return false;
  })[0].name;

  let firstNorth = inputList.value.filter((item) => {
    if (item.engName == "Qout_diyishuniu_beiganfenshui.dat") {
      return true;
    }
    return false;
  })[0].name;

  let secondNorth = inputList.value.filter((item) => {
    if (item.engName == "Qout_diershuniu_beiganfenshui.dat") {
      return true;
    }
    return false;
  })[0].name;

  let firstSouth = inputList.value.filter((item) => {
    if (item.engName == "Qout_diyishuniu_nanganfenshui.dat") {
      return true;
    }
    return false;
  })[0].name;

  let secondSouth = inputList.value.filter((item) => {
    if (item.engName == "Qout_diershuniu_nanganfenshui.dat") {
      return true;
    }
    return false;
  })[0].name;

  let hedaosunshi = inputList.value.filter((item) => {
    if (item.engName == "hedaosunshi.dat") {
      return true;
    }
    return false;
  })[0].name;

  let timeSet = new Set();
  for (let i = 0; i < inputJson.value[name].length; i++) {
    timeSet.add(moment(inputJson.value[name][i][0]).format("YYYY-MM-DD"));
  }
  let beginDate = moment(inputJson.value[name][0][0]).format("YYYY-MM-DD");
  let endDate = moment(
    inputJson.value[name][inputJson.value[name].length - 1][0]
  ).format("YYYY-MM-DD");

  let hsgArray = [];
  let xskArray = [];
  let firstNorthArray = [];
  let secondNorthArray = [];
  let firstSouthArray = [];
  let secondSouthArray = [];
  timeSet.forEach((item) => {
    for (let i = 0; i < inputJson.value[hsgName].length; i++) {
      if (inputJson.value[hsgName][i][0].indexOf(item) != -1) {
        hsgArray.push({ time: item, val: inputJson.value[hsgName][i][1] });
      }
    }
    for (let i = 0; i < inputJson.value[name].length; i++) {
      if (inputJson.value[name][i][0].indexOf(item) != -1) {
        xskArray.push({ time: item, val: inputJson.value[name][i][1] });
      }
    }
    for (let i = 0; i < inputJson.value[firstNorth].length; i++) {
      if (inputJson.value[firstNorth][i][0].indexOf(item) != -1) {
        firstNorthArray.push({
          time: item,
          val: inputJson.value[firstNorth][i][1],
        });
      }
    }
    for (let i = 0; i < inputJson.value[secondNorth].length; i++) {
      if (inputJson.value[secondNorth][i][0].indexOf(item) != -1) {
        secondNorthArray.push({
          time: item,
          val: inputJson.value[secondNorth][i][1],
        });
      }
    }
    for (let i = 0; i < inputJson.value[firstSouth].length; i++) {
      if (inputJson.value[firstSouth][i][0].indexOf(item) != -1) {
        firstSouthArray.push({
          time: item,
          val: inputJson.value[firstSouth][i][1],
        });
      }
    }
    for (let i = 0; i < inputJson.value[secondSouth].length; i++) {
      if (inputJson.value[secondSouth][i][0].indexOf(item) != -1) {
        secondSouthArray.push({
          time: item,
          val: inputJson.value[secondSouth][i][1],
        });
      }
    }
  });

  hsgArray = hsgArray.filter(
    (obj, index, self) => index === self.findIndex((o) => o.time === obj.time)
  );

  xskArray = xskArray.filter(
    (obj, index, self) => index === self.findIndex((o) => o.time === obj.time)
  );

  firstNorthArray = firstNorthArray.filter(
    (obj, index, self) => index === self.findIndex((o) => o.time === obj.time)
  );

  secondNorthArray = secondNorthArray.filter(
    (obj, index, self) => index === self.findIndex((o) => o.time === obj.time)
  );

  firstSouthArray = firstSouthArray.filter(
    (obj, index, self) => index === self.findIndex((o) => o.time === obj.time)
  );

  secondSouthArray = secondSouthArray.filter(
    (obj, index, self) => index === self.findIndex((o) => o.time === obj.time)
  );

  let diyishuniuArray = [];
  let diershuniuArray = [];
  let disanshuniuArray = [];
  for (let i = 1; i <= inputJson.value[zmName].length; i++) {
    if (i < 11) {
      diyishuniuArray.push({
        id: i,
        waterLevel: inputJson.value[zmName][i - 1][1],
        status: inputJson.value[zmName][i - 1][2],
      });
    } else if (i < 25) {
      diershuniuArray.push({
        id: i - 10,
        waterLevel: inputJson.value[zmName][i - 1][1],
        status: inputJson.value[zmName][i - 1][2],
      });
    } else if (i < 35) {
      disanshuniuArray.push({
        id: i - 24,
        waterLevel: inputJson.value[zmName][i - 1][1],
        status: inputJson.value[zmName][i - 1][2],
      });
    }
  }

  let firstShunshi = 0;
  let secondShunshi = 0;
  let thirdShunshi = 0;

  for (let i = 0; i <= inputJson.value[hedaosunshi].length; i++) {
    if (i == 0) {
      firstShunshi = inputJson.value[hedaosunshi][i][1].replace("-", "");
    }
    if (i == 1) {
      secondShunshi = inputJson.value[hedaosunshi][i][1].replace("-", "");
    }
    if (i == 2) {
      thirdShunshi = inputJson.value[hedaosunshi][i][1].replace("-", "");
    }
  }
};

/** 删除按钮操作 */
const handleDelete = (row) => {
  const calcIds = row.id || ids.value;
  ElMessageBox.confirm(
    '是否确认删除模型计算管理 编号为"' + calcIds + '"的数据项？'
  )
    .then(function () {
      return delCacl(calcIds);
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
  // Note: This variable is not defined in the original data, may need to be added if used
  // checkedSingle.value = selection.map((item) => item.index);
};

/** 多列值 添加按钮操作 */
const handleAddMultiple = (name) => {
  inputJson.value[name].push([]);
};

/** 多列值 删除按钮操作 */
const handleDeleteMultiple = (name, index) => {
  inputJson.value[name].splice(index, 1);
};

/** 多列值 序号 */
const multipleIndex = ({ row, rowIndex }) => {
  row.index = rowIndex + 1;
};

/** 复选框选中数据 */
const handleMultipleChange = (selection) => {
  // Note: This variable is not defined in the original data, may need to be added if used
  // checkedMultiple.value = selection.map((item) => item.index);
};

function handleSortChange(column, prop, order) {
  queryParams.value.orderByColumn = column.prop;
  queryParams.value.isAsc = column.order;
  getList();
}

</script>
<style lang="scss" scoped>
.modelCompute {
}

.descriptionsStyle {
  ::v-deep .el-tag--medium {
    height: 20px;
    line-height: 20px;
  }
}

.params-tree {
  // 必须有高度 overflow 为自动
  overflow: auto;
  padding: 12px 0px;
  height: 708px;
  //设置文字省略
  ::v-deep .el-tree-node__label {
    font-size: 14px;
    width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
  }

  ::v-deep .el-tree-node__label:hover {
    white-space: normal; /* 设置鼠标悬浮时文本正常显示 */
  }
}

// 滚动条的样式,宽高分别对应横竖滚动条的尺寸
.params-tree::-webkit-scrollbar {
  width: 3px;
}

// 滚动条里面默认的小方块,自定义样式
.params-tree::-webkit-scrollbar-thumb {
  background: #8798af;
  border-radius: 2px;
}

// 滚动条里面的轨道
.params-tree::-webkit-scrollbar-track {
  background: transparent;
}

::v-deep
  .el-tree--highlight-current
  .el-tree-node.is-current
  > .el-tree-node__content {
  background-color: #e9f0ff;
  color: #316efb;
}
.params-item {
  .params-title {
    font-weight: bold;
    font-size: 16px;
    padding: 10px;
    border-bottom: 1px solid #eee;
  }

  .params-con {
    padding: 12px 0px;
  }
}
</style>
