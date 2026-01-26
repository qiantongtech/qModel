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
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
    >
      <el-form-item label="模型版本：" prop="versionId">
        <el-select
          v-model="queryParams.versionId"
          placeholder="请选择模型类别"
          clearable
          class="el-form-input-width"
        >
          <el-option
            v-for="item in versionList"
            :key="item.id"
            :label="'Version ' + item.version"
            :value="item.id"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="请求方式：" prop="requestMethod">
        <el-select
          v-model="queryParams.requestMethod"
          placeholder="请选择模型类别"
          clearable
          class="el-form-input-width"
        >
          <el-option
            v-for="item in model_access_mode"
            :key="item.value"
            :label="item.label"
            :value="item.value * 1"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="mini" @click="handleQuery"
          ><i class="iconfont-mini icon-a-zu22377 mr5"></i> 搜索</el-button
        >
        <el-button size="mini" @click="resetQuery"
          ><i class="iconfont-mini icon-a-zu22378 mr5"></i>重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          @click="handleAdd"
          v-hasPermi="['modelReconstitution:interfaceAddress:add']"
          ><i class="iconfont-mini icon-xinzeng"></i>添加接口地址</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="interfaceAddressList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column
        label="接口地址"
        align="center"
        prop="interfaceAddress"
      />
      <el-table-column
        label="模型版本"
        align="center"
        prop="version"
        width="150px"
      >
        <template #default="scope">
          <el-tag size="small">Version {{ scope.row.version }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="请求方式"
        align="center"
        prop="requestMethod"
        width="150px"
      >
        <template #default="scope">
          <dict-tag
            :options="model_access_mode"
            :value="scope.row.requestMethod"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="创建人"
        align="center"
        prop="createBy"
        width="150px"
      />
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="150px"
      />
      <el-table-column label="接口说明" align="center" prop="remark" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
        width="200px"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['modelReconstitution:interfaceAddress:edit']"
          >
            <Edit class="icon-mini" />修改</el-button
          >
          <el-button
            link
            type="danger"
            @click="handleDelete(scope.row)"
            v-hasPermi="['modelReconstitution:interfaceAddress:remove']"
            ><Delete class="icon-mini" />删除</el-button
          >
          <el-button link type="primary" @click="setTheParameters(scope.row)"
            ><Setting class="icon-mini" />设置参数</el-button
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

    <!-- 添加或修改接口地址对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      :close-on-click-modal="false"
      append-to-body
    >
      <el-form ref="formref" :model="form" :rules="rules" label-width="150px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="模型版本：" prop="versionId">
              <el-select
                style="width: 100%"
                v-model="form.versionId"
                placeholder="请选择模型版本"
                clearable
              >
                <el-option
                  v-for="item in versionList"
                  :key="item.id"
                  :label="'Version ' + item.version"
                  :value="item.id"
                >
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="API请求方式：" prop="requestMethod">
              <el-select
                style="width: 100%"
                v-model="form.requestMethod"
                placeholder="请选择模型类别"
                clearable
              >
                <el-option
                  v-for="item in model_access_mode"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value * 1"
                >
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="接口地址：" prop="interfaceAddress">
              <el-input
                clearable
                v-model="form.interfaceAddress"
                placeholder="请输入接口地址"
              >
                <!-- <template #prepend>{{
                  model.interfaceorfileAddress + ":" + model.port
                }}</template> -->
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="接口说明：" prop="remark">
              <el-input
                clearable
                v-model="form.remark"
                type="textarea"
                :rows="3"
                placeholder="请输入接口说明"
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
  </div>
</template>

<script setup>
import { ref, reactive, watch, onMounted, getCurrentInstance } from "vue";
import { useRouter } from "vue-router";
import { ElMessage, ElMessageBox } from "element-plus";
import {
  listInterfaceAddress,
  getInterfaceAddress,
  delInterfaceAddress,
  addInterfaceAddress,
  updateInterfaceAddress,
} from "@/api/modelReconstitution/interfaceAddress";
import { getVersionList } from "@/api/modelReconstitution/version";
import { useDict } from "@/utils/dict.js";

// 获取当前实例以访问路由和其他属性
const { proxy } = getCurrentInstance();
const router = useRouter();

// 定义 props
const props = defineProps({
  model: {
    type: Object,
    default: {},
  },
});

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
// 接口地址表格数据
const interfaceAddressList = ref([]);
// 版本管理表格数据
const versionList = ref([]);
// 弹出层标题
const title = ref("");
// 是否显示弹出层
const open = ref(false);
// 查询参数
const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  companyId: null,
  modelId: null,
  interfaceAddress: null,
  versionId: null,
  requestMethod: null,
  inputParameter: null,
  outputParameter: null,
  creatorId: null,
  updatorId: null,
});
// 表单参数
const form = ref({
  id: null,
  companyId: null,
  modelId: null,
  interfaceAddress: null,
  versionId: null,
  requestMethod: null,
  inputParameter: null,
  outputParameter: null,
  inputParameterIllustrate: null,
  outputParameterIllustrate: null,
  delFlag: null,
  createBy: null,
  creatorId: null,
  createTime: null,
  updateBy: null,
  updatorId: null,
  updateTime: null,
  remark: null,
});
// 表单校验
const rules = reactive({});
const model_access_mode = useDict("model_access_mode").model_access_mode;

// 模板引用
const queryFormRef = ref(null);
const formRef = ref(null);

// 监听器
watch(
  () => props.model,
  (newVal, oldVal) => {
    getVersionList({ modelId: newVal.id }).then((response) => {
      versionList.value = response.data;
      queryParams.versionId = newVal.versionId;
      getList();
    });
  },
  {
    deep: true, // 开启深度监听
    immediate: true,
  }
);

// 方法定义
/** 查询接口地址列表 */
const getList = () => {
  loading.value = true;
  listInterfaceAddress(queryParams).then((response) => {
    interfaceAddressList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

const setTheParameters = (row) => {
  let modelId = row.modelId;
  let interfaceAddressId = row.id;
  router.push({
    path: "/model/modelInputAndOutput",
    query: {
      modelId,
      interfaceAddressId,
    },
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
    modelId: null,
    interfaceAddress: null,
    versionId: null,
    requestMethod: null,
    inputParameter: null,
    outputParameter: null,
    inputParameterIllustrate: null,
    outputParameterIllustrate: null,
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
  queryParams.versionId = props.model.versionId;
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
  title.value = "添加接口地址";
};

/** 修改按钮操作 */
const handleUpdate = (row) => {
  reset();
  const id = row.id || ids.value;
  getInterfaceAddress(id).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改接口地址";
  });
};

/** 提交按钮 */
const submitForm = () => {
  form.value.modelId = props.model.id;
  form.value.modelNam = props.model.name;
  form.value.versionId = props.model.versionId;
  form.value.version = props.model.version;
  form.value.description = props.model.description;
  // if (!form.value.interfaceAddress.startsWith("/")) {
  //   form.value.interfaceAddress = "/" + form.value.interfaceAddress;
  // }
  // if (props.model.interfaceorfileAddress.endsWith("/")) {
  //   props.model.interfaceorfileAddress =
  //     props.model.interfaceorfileAddress.replace(/\/$/, "");
  // }
  // form.value.interfaceAddress =
  //   props.model.interfaceorfileAddress +
  //   ":" +
  //   props.model.port +
  //   form.value.interfaceAddress;
  // if (formRef.value) {
  //   formRef.value.validate((valid) => {
  //     if (valid) {
  if (form.value.id != null) {
    updateInterfaceAddress(form.value).then((response) => {
      ElMessage.success("修改成功");
      open.value = false;
      getList();
    });
  } else {
    addInterfaceAddress(form.value).then((response) => {
      ElMessage.success("新增成功");
      open.value = false;
      getList();
    });
  }
};
//     });
//   }
// };

/** 删除按钮操作 */
const handleDelete = (row) => {
  const idsToDelete = row.id || ids.value;
  ElMessageBox.confirm(
    `是否确认删除接口地址编号为"${idsToDelete}"的数据项？`,
    "警告",
    {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    }
  )
    .then(() => {
      return delInterfaceAddress(idsToDelete);
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
    "modelReconstitution/interfaceAddress/export",
    {
      ...queryParams,
    },
    `interfaceAddress_${new Date().getTime()}.xlsx`
  );
};

// 组件挂载后执行
onMounted(() => {
  // getList();
});
</script>
<style scoped lang="scss">
.app-container {
  min-height: 0;
  background: transparent;
}
</style>
