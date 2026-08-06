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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch">
      <el-form
        :model="queryParams"
        ref="queryFormRef"
        :inline="true"
        v-show="showSearch"
        class="btn-style"
        label-width="85px"
        @submit.prevent
      >
        <el-form-item label="执行批次号" prop="executionNo">
          <el-input
            class="el-form-input-width"
            v-model="queryParams.executionNo"
            placeholder="请输入执行批次号"
            clearable
            @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="执行状态" prop="status">
          <el-select
            class="el-form-input-width"
            v-model="queryParams.status"
            placeholder="请选择执行状态"
            clearable
          >
            <el-option
              v-for="dict in model_calc_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="执行模式" prop="executionMode">
          <el-select
            class="el-form-input-width"
            v-model="queryParams.executionMode"
            placeholder="请选择执行模式"
            clearable
          >
            <el-option label="手动触发" :value="1" />
            <el-option label="定时调度" :value="2" />
            <el-option label="重试执行" :value="3" />
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
    </div>

    <div class="pagecont-bottom">
      <div class="justify-between mb15">
        <div></div>
        <div class="justify-end top-right-btn">
          <right-toolbar
            v-model:showSearch="showSearch"
            @queryTable="getList"
            :columns="columns"
          ></right-toolbar>
        </div>
      </div>

      <el-table
        stripe
        v-loading="loading"
        :data="execRecordList"
        :default-sort="defaultSort"
        @sort-change="handleSortChange"
      >
        <el-table-column
          v-if="getColumnVisibility(0)"
          label="编号"
          align="center"
          prop="id"
          width="80"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
        />
        <el-table-column
          v-if="getColumnVisibility(1)"
          label="任务名称"
          align="left"
          prop="calcName"
          min-width="200"
          :show-overflow-tooltip="{ effect: 'light' }"
        >
          <template #default="scope">
            {{ scope.row.calcName || "-" }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(2)"
          label="模型名称"
          align="left"
          prop="modelName"
          min-width="220"
          :show-overflow-tooltip="{ effect: 'light' }"
        >
          <template #default="scope">
            {{ scope.row.modelName || "-" }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(3)"
          label="执行批次号"
          align="left"
          prop="executionNo"
          min-width="240"
          :show-overflow-tooltip="{ effect: 'light' }"
        >
          <template #default="scope">
            {{ scope.row.executionNo || "-" }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(4)"
          label="执行模式"
          align="center"
          prop="executionMode"
          min-width="120"
        >
          <template #default="scope">
            {{ getExecutionModeLabel(scope.row.executionMode) }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(5)"
          label="耗时"
          align="center"
          prop="duration"
          min-width="120"
        >
          <template #default="scope">
            {{ formatDuration(scope.row.duration) }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(6)"
          label="执行状态"
          align="center"
          prop="status"
          min-width="120"
        >
          <template #default="scope">
            <dict-tag :options="model_calc_status" :value="scope.row.status" />
          </template>
        </el-table-column>

        <el-table-column
          v-if="getColumnVisibility(8)"
          label="开始时间"
          align="center"
          prop="startTime"
          min-width="180"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
        >
          <template #default="scope">
            <span>{{
              parseTime(scope.row.startTime, "{y}-{m}-{d} {h}:{i}") || "-"
            }}</span>
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(9)"
          label="结束时间"
          align="center"
          prop="endTime"
          min-width="180"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
        >
          <template #default="scope">
            <span>{{
              parseTime(scope.row.endTime, "{y}-{m}-{d} {h}:{i}") || "-"
            }}</span>
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(10)"
          label="操作"
          align="center"
          class-name="small-padding fixed-width"
          width="100"
          fixed="right"
        >
          <template #default="scope">
            <el-button
              link
              type="primary"
              icon="view"
              @click="handleDetail(scope.row)"
            >详情</el-button>
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

    <!-- 执行记录详情对话框 -->
    <el-dialog
      :title="detailTitle"
      v-model="openDetail"
      width="1000px"
      class="scrollbar"
      :append-to="$refs['app-container']"
      draggable
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ detailTitle }}
        </span>
      </template>
      <el-form ref="detailFormRef" :model="detailForm" label-width="130px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="任务名称" prop="calcName">
              <div class="form-readonly">{{ detailForm.calcName || "-" }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模型名称" prop="modelName">
              <div class="form-readonly">{{ detailForm.modelName || "-" }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="执行批次号" prop="executionNo">
              <div class="form-readonly">{{ detailForm.executionNo || "-" }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="执行模式" prop="executionMode">
              <div class="form-readonly">{{ getExecutionModeLabel(detailForm.executionMode) }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="执行状态" prop="status">
              <dict-tag :options="model_calc_status" :value="detailForm.status" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="耗时" prop="duration">
              <div class="form-readonly">{{ formatDuration(detailForm.duration) }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="开始时间" prop="startTime">
              <div class="form-readonly">
                {{ parseTime(detailForm.startTime, "{y}-{m}-{d} {h}:{i}") || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="结束时间" prop="endTime">
              <div class="form-readonly">
                {{ parseTime(detailForm.endTime, "{y}-{m}-{d} {h}:{i}") || "-" }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="当前重试次数" prop="retryCount">
              <div class="form-readonly">{{ detailForm.retryCount ?? 0 }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="创建时间" prop="createTime">
              <div class="form-readonly">
                {{ parseTime(detailForm.createTime, "{y}-{m}-{d} {h}:{i}") || "-" }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="输入参数" prop="inputParams">
              <pre class="form-readonly textarea json-pre">{{ detailForm.inputParams || "-" }}</pre>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="输出结果" prop="outputResult">
              <pre class="form-readonly textarea json-pre">{{ detailForm.outputResult || "-" }}</pre>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="执行日志" prop="executionLog">
              <div class="form-readonly textarea log-box">{{ detailForm.executionLog || "-" }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="错误信息" prop="errorMessage">
              <div class="form-readonly textarea error-text">{{ detailForm.errorMessage || "-" }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="资源使用情况" prop="resourceUsage">
              <pre class="form-readonly textarea json-pre">{{ detailForm.resourceUsage || "-" }}</pre>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="mini" @click="closeDetail">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="OperateList">
import { ref, reactive, onMounted, getCurrentInstance } from "vue";
import { listCalcExecution, getCalcExecution } from "@/api/model/calcExecution/calcExecution";

const { proxy } = getCurrentInstance();

const { model_calc_status } = proxy.useDict("model_calc_status");

// 列配置
const columns = ref([
  { key: 0, label: "编号", visible: true },
  { key: 1, label: "任务名称", visible: true },
  { key: 2, label: "模型名称", visible: true },
  { key: 3, label: "执行批次号", visible: true },
  { key: 4, label: "执行模式", visible: true },
  { key: 5, label: "耗时", visible: true },
  { key: 6, label: "执行状态", visible: true },
  { key: 7, label: "创建人", visible: true },
  { key: 8, label: "开始时间", visible: true },
  { key: 9, label: "结束时间", visible: true },
  { key: 10, label: "操作", visible: true },
]);

function getColumnVisibility(key) {
  const column = columns.value.find((col) => col.key === key);
  if (!column) return true;
  return column.visible;
}

// 遮罩层
const loading = ref(true);
// 显示搜索条件
const showSearch = ref(true);
// 总条数
const total = ref(0);
// 执行记录列表
const execRecordList = ref([]);
// 默认排序
const defaultSort = ref({ prop: "createTime", order: "descending" });
// 查询参数
const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  calcName: null,
  modelName: null,
  executionNo: null,
  status: null,
  executionMode: null,
  orderByColumn: "createTime",
  isAsc: "desc",
});
// 详情弹窗
const openDetail = ref(false);
const detailTitle = ref("");
const detailForm = reactive({});

// 模板引用
const queryFormRef = ref(null);
const detailFormRef = ref(null);

/** 查询执行记录列表 */
function getList() {
  loading.value = true;
  listCalcExecution(queryParams).then((response) => {
    execRecordList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  }).catch(() => {
    loading.value = false;
  });
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  if (queryFormRef.value) {
    queryFormRef.value.resetFields();
  }
  handleQuery();
}

/** 排序触发事件 */
function handleSortChange(column) {
  queryParams.orderByColumn = column.prop;
  queryParams.isAsc = column.order === "ascending" ? "asc" : "desc";
  getList();
}

/** 详情按钮操作 */
function handleDetail(row) {
  resetDetailForm();
  getCalcExecution(row.id).then((response) => {
    Object.assign(detailForm, response.data);
    // 补充关联查询出的名称字段
    detailForm.calcName = row.calcName;
    detailForm.modelName = row.modelName;
    openDetail.value = true;
    detailTitle.value = "执行记录详情";
  });
}

/** 重置详情表单 */
function resetDetailForm() {
  Object.assign(detailForm, {
    id: null,
    calcId: null,
    calcName: null,
    modelId: null,
    modelName: null,
    executionNo: null,
    executionMode: null,
    status: null,
    startTime: null,
    endTime: null,
    duration: null,
    inputParams: null,
    outputResult: null,
    executionLog: null,
    errorMessage: null,
    retryCount: null,
    resourceUsage: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null,
  });
}

/** 关闭详情弹窗 */
function closeDetail() {
  openDetail.value = false;
  resetDetailForm();
}

/** 获取执行模式文本 */
function getExecutionModeLabel(mode) {
  const map = {
    1: "手动触发",
    2: "定时调度",
    3: "重试执行",
  };
  return map[mode] || "-";
}

/** 格式化耗时 */
function formatDuration(duration) {
  if (!duration && duration !== 0) return "-";
  const ms = Number(duration);
  if (ms < 1000) return ms + "ms";
  const s = Math.floor(ms / 1000);
  const remainMs = ms % 1000;
  if (s < 60) return remainMs > 0 ? s + "s " + remainMs + "ms" : s + "s";
  const m = Math.floor(s / 60);
  const remainS = s % 60;
  return remainS > 0 ? m + "min " + remainS + "s" : m + "min";
}

// 组件挂载后执行
onMounted(() => {
  getList();
});
</script>

<style lang="scss" scoped>
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

.log-box {
  background-color: #1e1e1e;
  color: #d4d4d4;
  font-family: "Consolas", "Monaco", monospace;
  font-size: 12px;
  max-height: 200px;
  overflow-y: auto;
}

.error-text {
  color: #f56c6c;
}
</style>
