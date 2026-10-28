<!--
  Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.

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
        v-if="getColumnVisibility(2)"
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
          />
        </template>
      </el-table-column>
      <el-table-column
        v-if="getColumnVisibility(5)"
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
        v-if="getColumnVisibility(6)"
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
    width="800px"
    draggable
  >
    <el-form ref="modelInvokeHistoryRef" :model="form" label-width="110px">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="编号" prop="id">
            <div class="form-readonly">{{ form.id || "-" }}</div>
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
            <pre class="form-readonly textarea json-pre">{{
              form.inputParams || "-"
            }}</pre>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-form-item label="输出结果" prop="outputResult">
            <pre class="form-readonly textarea json-pre">{{
              form.outputResult || "-"
            }}</pre>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-form-item label="错误信息" prop="errorMessage">
            <div class="form-readonly textarea">
              {{ form.errorMessage || "-" }}
            </div>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button size="default" @click="cancel">关 闭</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup name="ComponentTwo">
import { ref, reactive, onMounted, watch, getCurrentInstance } from "vue";
import { parseTime } from "@/utils/anivia.js";
import RightToolbar from "@/components/RightToolbar/index.vue";

const props = defineProps({
  bidId: {
    type: [Number, String],
    default: null,
  },
});

const { proxy } = getCurrentInstance();
const { invoke_history_status } = proxy.useDict("invoke_history_status");

const modelInvokeHistoryList = ref([]);
const loading = ref(true);
const total = ref(0);
const title = ref("");
const defaultSort = ref({ prop: "createTime", order: "descending" });
const openDetail = ref(false);

const columns = ref([
  { key: 0, label: "编号", visible: true },
  { key: 1, label: "版本号", visible: true },
  { key: 2, label: "客户端IP", visible: true },
  { key: 3, label: "耗时", visible: true },
  { key: 4, label: "调用状态", visible: true },
  { key: 5, label: "请求时间", visible: true },
  { key: 6, label: "操作", visible: true },
]);

const getColumnVisibility = (key) => {
  const column = columns.value.find((col) => col.key === key);
  if (!column) return true;
  return column.visible;
};

const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  bidId: null,
  orderByColumn: "createTime",
  isAsc: "desc",
});

const form = reactive({});

const getList = () => {
  loading.value = true;
  // 模拟假数据
  setTimeout(() => {
    const mockData = [
      {
        id: 1001,
        modelVersion: "v1.0",
        clientIp: "192.168.1.100",
        duration: 256,
        status: 0,
        createTime: "2024-12-16 14:20:00",
        startTime: "2024-12-16 14:20:00.000",
        endTime: "2024-12-16 14:20:00.256",
        modelName: "水位预测接口",
        inputParams: JSON.stringify({ H: 3.5 }, null, 2),
        outputResult: JSON.stringify({ flow: 65.2, predict_time: "2024-12-16 14:20:00" }, null, 2),
        errorMessage: null
      },
      {
        id: 1002,
        modelVersion: "v1.0",
        clientIp: "127.0.0.1",
        duration: 120,
        status: 0,
        createTime: "2024-12-16 15:30:12",
        startTime: "2024-12-16 15:30:12.000",
        endTime: "2024-12-16 15:30:12.120",
        modelName: "水位预测接口",
        inputParams: JSON.stringify({ H: 2.8 }, null, 2),
        outputResult: JSON.stringify({ flow: 42.1, predict_time: "2024-12-16 15:30:12" }, null, 2),
        errorMessage: null
      },
      {
        id: 1003,
        modelVersion: "v1.1",
        clientIp: "192.168.1.50",
        duration: 500,
        status: 1,
        createTime: "2024-12-16 16:45:00",
        startTime: "2024-12-16 16:45:00.000",
        endTime: "2024-12-16 16:45:00.500",
        modelName: "水位预测接口",
        inputParams: JSON.stringify({ H: -1 }, null, 2),
        outputResult: null,
        errorMessage: "Input parameter H must be positive."
      }
    ];
    modelInvokeHistoryList.value = mockData;
    total.value = mockData.length;
    loading.value = false;
  }, 500);
};

const cancel = () => {
  openDetail.value = false;
};

const reset = () => {
  Object.keys(form).forEach(key => delete form[key]);
  Object.assign(form, {
    id: null,
    modelName: null,
    clientIp: null,
    status: null,
    startTime: null,
    endTime: null,
    duration: null,
    inputParams: null,
    outputResult: null,
    errorMessage: null,
  });
};

const handleSortChange = (column) => {
  queryParams.orderByColumn = column.prop;
  queryParams.isAsc = column.order;
  getList();
};

const handleDetail = (row) => {
  reset();
  Object.assign(form, row);
  openDetail.value = true;
  title.value = "调用记录详情";
};

watch(
  () => props.bidId,
  (val) => {
    queryParams.bidId = val;
    getList();
  },
  { immediate: true }
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
  width: 100%;
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