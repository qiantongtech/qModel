<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.

  This file is part of qModel Module Platform (Open Source Edition).

  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.

  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.

  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<template>
  <div class="invoke-history">
    <div class="justify-between mb15">
      <div></div>
      <div class="justify-end top-right-btn">
        <right-toolbar
          :search="false"
          @queryTable="getList"
          :columns="columns"
        ></right-toolbar>
      </div>
    </div>

    <el-table
      stripe
      v-loading="loading"
      :data="modelInvokeHistoryList"
      :default-sort="defaultSort"
      @sort-change="handleSortChange"
    >
      <el-table-column
        v-if="getColumnVisibility(0)"
        label="编号"
        align="center"
        width="80"
        prop="id"
        sortable="custom"
        :sort-orders="['descending', 'ascending']"
      />
      <el-table-column
        v-if="getColumnVisibility(1)"
        label="客户端IP"
        align="center"
        prop="clientIp"
      >
        <template #default="scope">
          {{ scope.row.clientIp || "-" }}
        </template>
      </el-table-column>

      <el-table-column
        v-if="getColumnVisibility(3)"
        label="耗时"
        align="center"
        prop="duration"
      >
        <template #default="scope">
          {{ scope.row.duration || "-" }}ms
        </template>
      </el-table-column>
      <el-table-column
        v-if="getColumnVisibility(4)"
        label="调用状态"
        align="center"
        prop="status"
      >
        <template #default="scope">
          <dict-tag
            :options="invoke_history_status"
            :value="scope.row.status"
            class="con-value access-tag"
          />
        </template>
      </el-table-column>
      <el-table-column
        v-if="getColumnVisibility(2)"
        label="请求时间"
        align="center"
        prop="createTime"
        width="180"
        sortable="custom"
        :sort-orders="['descending', 'ascending']"
      >
        <template #default="scope">
          <span>{{
            parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}")
          }}</span>
        </template>
      </el-table-column>
      <el-table-column
        v-if="getColumnVisibility(5)"
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="view"
            @click="handleDetail(scope.row)"
            >详情</el-button
          >
        </template>
      </el-table-column>

      <template #empty>
        <div class="emptyBg">
          <img src="@/assets/system/images/no_data/noData.png" alt="" />
          <p>暂无记录</p>
        </div>
      </template>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
  </div>

  <el-dialog
    :title="title"
    v-model="openDetail"
    width="1000px"
    :append-to="$refs['app-container']"
    draggable
  >
    <template #header="{ close, titleId, titleClass }">
      <span role="heading" aria-level="2" class="el-dialog__title">
        {{ title }}
      </span>
    </template>
    <el-form ref="modelInvokeHistoryRef" :model="form" label-width="110px">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="模型编号" prop="modelId">
            <div class="form-readonly">{{ form.modelId || "-" }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="模型名称" prop="modelName">
            <div class="form-readonly">{{ form.modelName || "-" }}</div>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="客户端IP" prop="clientIp">
            <div class="form-readonly">{{ form.clientIp || "-" }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="调用状态" prop="status">
            <dict-tag
              :options="invoke_history_status"
              :value="form.status"
              class="con-value access-tag"
            />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="开始时间" prop="startTime">
            <div class="form-readonly">
              {{ parseTime(form.startTime, "{y}-{m}-{d} {h}:{i}:{s}") || "-" }}
            </div>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="结束时间" prop="endTime">
            <div class="form-readonly">
              {{ parseTime(form.endTime, "{y}-{m}-{d} {h}:{i}:{s}") || "-" }}
            </div>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="执行耗时" prop="duration">
            <div class="form-readonly">{{ form.duration || "-" }}ms</div>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-form-item label="输入参数" prop="inputParams">
            <pre class="form-readonly textarea json-pre">{{ form.inputParams || "-" }}</pre>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-form-item label="输出结果" prop="outputResult">
            <pre class="form-readonly textarea json-pre">{{ form.outputResult || "-" }}</pre>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-form-item label="错误信息" prop="errorMessage">
            <div class="form-readonly textarea">{{ form.errorMessage || "-" }}</div>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button size="mini" @click="cancel">关 闭</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup name="InvokeHistory">
import {
  listModelInvokeHistory,
  getModelInvokeHistory,
} from "@/api/model/invokeHistory/modelInvokeHistory";
import { ref, reactive, onMounted, watch, getCurrentInstance } from "vue";
import DictTag from "@/components/DictTag/index.vue";
import RightToolbar from "@/components/RightToolbar/index.vue";

const props = defineProps({
  modelId: {
    type: [Number, String],
    default: null,
  },
});

const { proxy } = getCurrentInstance();
const { invoke_history_status } = proxy.useDict("invoke_history_status");
const modelInvokeHistoryList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);
const title = ref("");
const defaultSort = ref({ prop: "createTime", order: "descending" });
const openDetail = ref(false);

const columns = ref([
  { key: 0, label: "编号", visible: true },
  { key: 1, label: "客户端IP", visible: true },
  { key: 2, label: "请求时间", visible: true },
  { key: 3, label: "耗时", visible: true },
  { key: 4, label: "调用状态", visible: true },
  { key: 5, label: "操作", visible: true },
]);

const getColumnVisibility = (key) => {
  const column = columns.value.find((col) => col.key === key);
  if (!column) return true;
  return column.visible;
};

const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  modelId: null,
  modelName: null,
  resourceId: null,
  versionId: null,
  requestMethod: null,
  invokeType: null,
  inputParams: null,
  outputResult: null,
  startTime: null,
  endTime: null,
  duration: null,
  errorMessage: null,
  status: null,
  clientIp: null,
  createTime: null,
  orderByColumn: "createTime",
  isAsc: "desc",
});

const form = reactive({});

const getList = () => {
  loading.value = true;
  queryParams.modelId = props.modelId;
  listModelInvokeHistory(queryParams).then((response) => {
    modelInvokeHistoryList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

const cancel = () => {
  openDetail.value = false;
};

const reset = () => {
  Object.assign(form, {
    id: null,
    modelId: null,
    modelName: null,
    resourceId: null,
    versionId: null,
    requestMethod: null,
    invokeType: null,
    inputParams: null,
    outputResult: null,
    startTime: null,
    endTime: null,
    duration: null,
    errorMessage: null,
    status: null,
    clientIp: null,
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
};

const handleQuery = () => {
  queryParams.pageNum = 1;
  getList();
};

const resetQuery = () => {
  Object.keys(queryParams).forEach((key) => {
    if (key !== "pageNum" && key !== "pageSize") {
      queryParams[key] = null;
    }
  });
  queryParams.pageNum = 1;
  handleQuery();
};

const handleSortChange = (column, prop, order) => {
  queryParams.orderByColumn = column.prop;
  queryParams.isAsc = column.order;
  getList();
};

const handleDetail = (row) => {
  reset();
  const _id = row.id;
  getModelInvokeHistory(_id).then((response) => {
    Object.assign(form, response.data);
    openDetail.value = true;
    title.value = "调用记录详情";
  });
};

watch(
  () => props.modelId,
  () => {
    getList();
  }
);

onMounted(() => {
  getList();
});
</script>

<style lang="scss" scoped>
.invoke-history {
  min-height: 0;
  background: transparent;
}

.form-readonly {
  width: 100%;
  border: 1px solid #f1f1f1;
  padding: 0px 10px;
  min-height: 34px;
  background-color: #fcfcfc;
  border-radius: 2px;
  color: #333;
  display: flex;
  align-items: center;
  white-space: pre-wrap;
  word-wrap: break-word;
  word-break: break-all;
}

.form-readonly.textarea {
  min-height: 80px;
  padding: 10px;
  align-items: flex-start;
}

.json-pre {
  font-family: "Consolas", "Monaco", monospace;
  font-size: 12px;
  max-height: 200px;
  overflow-y: auto;
}

.justify-between {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.justify-end {
  display: flex;
  justify-content: flex-end;
}

.mb15 {
  margin-bottom: 15px;
}

.top-right-btn {
  display: flex;
  align-items: center;
}
</style>
