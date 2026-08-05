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
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom: 15px">
      <div class="infotop">
        <div class="infotop-title mb15">
          <div class="task-item">
            <div class="task-id">
              {{ calcDetail.id || "-" }}
            </div>
            <div class="task-name">
              <el-tooltip :content="calcDetail.name || ''" placement="top" effect="light">
                <span class="ellipsis-text">{{ calcDetail.name || "" }}</span>
              </el-tooltip>
            </div>
            <dict-tag
              v-if="calcDetail.status !== undefined"
              :options="model_calc_status"
              :value="calcDetail.status"
              style="margin-left: 10px"
            />
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
                  iconClass="fhs"
                />
                返回
              </el-button>
            </el-col>
          </el-row>
        </div>

        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">计算编码</div>
              <div class="infotop-row-value">
                <el-tooltip :content="calcDetail.code || '-'" placement="top" effect="light">
                  <span class="ellipsis-text">{{ calcDetail.code || "-" }}</span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">模型分类</div>
              <div class="infotop-row-value">
                <el-tooltip :content="calcDetail.classifyName || '-'" placement="top" effect="light">
                  <span class="ellipsis-text">{{ calcDetail.classifyName || "-" }}</span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">版本号</div>
              <div class="infotop-row-value">
                <el-tooltip :content="calcDetail.modelVersion || '-'" placement="top" effect="light">
                  <span class="ellipsis-text">{{ calcDetail.modelVersion || "-" }}</span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
        </el-row>

        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">模型名称</div>
              <div class="infotop-row-value" style="display: inline-flex; align-items: center; gap: 8px;">
                <el-tooltip :content="calcDetail.modelName || '-'" placement="top" effect="light">
                  <span class="ellipsis-text">{{ calcDetail.modelName || "-" }}</span>
                </el-tooltip>
                <dict-tag
                  v-if="calcDetail.calcType !== undefined && calcDetail.calcType !== null"
                  :options="model_access_type"
                  :value="getAccessTypeByCalcType(calcDetail.calcType)"
                />
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">优先级</div>
              <div class="infotop-row-value">
                <dict-tag
                  v-if="calcDetail.priority !== undefined"
                  :options="model_calc_priority"
                  :value="calcDetail.priority"
                />
                <span v-else>-</span>
              </div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">耗时</div>
              <div class="infotop-row-value">
                <el-tooltip :content="formatDuration(calcDetail.duration)" placement="top" effect="light">
                  <span class="ellipsis-text">{{ formatDuration(calcDetail.duration) }}</span>
                </el-tooltip>
              </div>
            </div>
          </el-col>
        </el-row>

        <el-row :gutter="3" style="margin-bottom: 3px">
          <el-col :span="24">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">任务描述</div>
              <div class="infotop-row-value">
                <el-tooltip :content="calcDetail.description || '-'" placement="top" effect="light">
                  <div class="ellipsis-2">{{ calcDetail.description || "-" }}</div>
                </el-tooltip>
              </div>
            </div>
          </el-col>
        </el-row>

        <el-row :gutter="3">
          <el-col :span="24">
            <div class="infotop-row border-top">
              <div class="infotop-row-lable">备注</div>
              <div class="infotop-row-value">
                <el-tooltip :content="calcDetail.remark || '-'" placement="top" effect="light">
                  <div class="ellipsis-2">{{ calcDetail.remark || "-" }}</div>
                </el-tooltip>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>

    <div class="pagecont-bottom">
      <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
        <el-tab-pane name="inputParams">
          <template #label>输入参数</template>
          <div v-if="activeName === 'inputParams'" class="tab-content">
            <div class="justify-between mb15">
              <div></div>
              <div class="justify-end top-right-btn">
                <right-toolbar
                    :search="false"
                    :columns="inputParamColumns"
                ></right-toolbar>
              </div>
            </div>
            <el-table
              stripe
              v-loading="inputParamLoading"
              :data="inputParamList"
              style="width: 100%"
            >
              <el-table-column
                v-if="getInputParamColumnVisibility(0)"
                label="参数名"
                align="left"
                prop="name"
                min-width="160"
              />
              <el-table-column
                v-if="getInputParamColumnVisibility(1)"
                label="是否必填"
                align="center"
                min-width="90"
              >
                <template #default="{ row }">
                  <span>{{ row.required ? '是' : '否' }}</span>
                </template>
              </el-table-column>
              <el-table-column
                v-if="getInputParamColumnVisibility(2)"
                label="参数值"
                align="left"
                min-width="220"
              >
                <template #default="{ row }">
                  <span v-if="row.type === 'file'">
                    <el-link v-if="row.value" type="primary" :href="row.value" target="_blank">
                      {{ row.value }}
                    </el-link>
                    <span v-else>-</span>
                  </span>
                  <el-tooltip
                    v-else-if="typeof row.value === 'string' && row.value.length > 60"
                    effect="light"
                    :content="row.value"
                    placement="top"
                  >
                    <span>{{ row.value || '-' }}</span>
                  </el-tooltip>
                  <span v-else>{{ row.value || '-' }}</span>
                </template>
              </el-table-column>
              <el-table-column
                v-if="getInputParamColumnVisibility(3)"
                label="类型"
                align="center"
                width="100"
              >
                <template #default="{ row }">
                  <span>{{ row.type || '-' }}</span>
                </template>
              </el-table-column>
              <el-table-column
                v-if="getInputParamColumnVisibility(4)"
                label="说明"
                align="left"
                min-width="260"
                prop="description"
                :show-overflow-tooltip="{ effect: 'light' }"
              >
                <template #default="scope">
                  <span>{{ scope.row.description || '-' }}</span>
                </template>
              </el-table-column>

              <template #empty>
                <div class="emptyBg">
                  <img src="@/assets/system/images/no_data/noData.png" alt="" />
                  <p>暂无输入参数</p>
                </div>
              </template>
            </el-table>
          </div>
        </el-tab-pane>

        <el-tab-pane name="execRecord">
          <template #label>执行记录</template>
          <div v-if="activeName === 'execRecord'" class="tab-content">
            <div class="justify-between mb15">
              <div></div>
              <div class="justify-end top-right-btn">
                <right-toolbar
                  :search="false"
                  @queryTable="getExecRecordList"
                  :columns="execRecordColumns"
                ></right-toolbar>
              </div>
            </div>

            <el-table
              stripe
              v-loading="execRecordLoading"
              :data="execRecordList"
              :default-sort="execRecordDefaultSort"
              @sort-change="handleExecRecordSortChange"
            >
              <el-table-column
                v-if="getExecRecordColumnVisibility(0)"
                label="编号"
                align="center"
                width="80"
                prop="id"
                sortable="custom"
                :sort-orders="['descending', 'ascending']"
              />
              <el-table-column
                v-if="getExecRecordColumnVisibility(1)"
                label="执行批次号"
                align="left"
                prop="executionNo"
              >
                <template #default="scope">
                  {{ scope.row.executionNo || "-" }}
                </template>
              </el-table-column>
              <el-table-column
                v-if="getExecRecordColumnVisibility(2)"
                label="执行模式"
                align="center"
                prop="executionMode"
              >
                <template #default="scope">
                  {{ getExecutionModeLabel(scope.row.executionMode) }}
                </template>
              </el-table-column>
              <el-table-column
                v-if="getExecRecordColumnVisibility(3)"
                label="耗时"
                align="center"
                prop="duration"
              >
                <template #default="scope">
                  {{ formatDuration(scope.row.duration) }}
                </template>
              </el-table-column>
              <el-table-column
                v-if="getExecRecordColumnVisibility(4)"
                label="执行状态"
                align="center"
                prop="status"
              >
                <template #default="scope">
                  <dict-tag :options="model_calc_status" :value="scope.row.status" />
                </template>
              </el-table-column>
              <el-table-column
                v-if="getExecRecordColumnVisibility(5)"
                label="开始时间"
                align="center"
                prop="startTime"
                width="180"
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
                v-if="getExecRecordColumnVisibility(6)"
                label="结束时间"
                align="center"
                prop="endTime"
                width="180"
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
                v-if="getExecRecordColumnVisibility(8)"
                label="操作"
                align="center"
                class-name="small-padding fixed-width"
                width="100"
              >
                <template #default="scope">
                  <el-button
                    link
                    type="primary"
                    icon="view"
                    @click="handleExecRecordDetail(scope.row)"
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
              v-show="execRecordTotal > 0"
              :total="execRecordTotal"
              v-model:page="execRecordQueryParams.pageNum"
              v-model:limit="execRecordQueryParams.pageSize"
              @pagination="getExecRecordList"
            />
          </div>
        </el-tab-pane>

<!--        <el-tab-pane name="realTimeLog" v-if="false">-->
<!--          <template #label>实时日志</template>-->
<!--          <div v-if="activeName === 'realTimeLog'" class="tab-content">-->
<!--            <div class="log-body">-->
<!--              <div-->
<!--                v-for="(line, index) in logList"-->
<!--                :key="index"-->
<!--                :class="['log-line', line.type]"-->
<!--              >-->
<!--                <span class="log-time">{{ line.time }}</span>-->
<!--                <span class="log-content">{{ line.content }}</span>-->
<!--              </div>-->
<!--              <div v-if="logList.length === 0" class="log-empty">-->
<!--                > 暂无日志记录-->
<!--              </div>-->
<!--            </div>-->
<!--          </div>-->
<!--        </el-tab-pane>-->

        <el-tab-pane name="outputResult">
          <template #label>输出结果</template>
          <div v-if="activeName === 'outputResult'" class="tab-content output-result-tab">
            <OutputResult :calc-detail="calcDetail" />
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>

    <!-- 执行记录详情对话框 -->
    <el-dialog
      :title="execRecordDetailTitle"
      v-model="openExecRecordDetail"
      width="1000px"
      :append-to="$refs['app-container']"
      draggable
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ execRecordDetailTitle }}
        </span>
      </template>
      <el-form ref="execRecordDetailRef" :model="execRecordForm" label-width="130px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="执行批次号" prop="executionNo">
              <div class="form-readonly">{{ execRecordForm.executionNo || "-" }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="执行模式" prop="executionMode">
              <div class="form-readonly">{{ getExecutionModeLabel(execRecordForm.executionMode) }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="执行状态" prop="status">
              <dict-tag :options="model_calc_status" :value="execRecordForm.status" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="耗时" prop="duration">
              <div class="form-readonly">{{ formatDuration(execRecordForm.duration) }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="开始时间" prop="startTime">
              <div class="form-readonly">
                {{ parseTime(execRecordForm.startTime, "{y}-{m}-{d} {h}:{i}") || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="结束时间" prop="endTime">
              <div class="form-readonly">
                {{ parseTime(execRecordForm.endTime, "{y}-{m}-{d} {h}:{i}") || "-" }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="当前重试次数" prop="retryCount">
              <div class="form-readonly">{{ execRecordForm.retryCount ?? 0 }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="创建时间" prop="createTime">
              <div class="form-readonly">
                {{ parseTime(execRecordForm.createTime, "{y}-{m}-{d} {h}:{i}") || "-" }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="输入参数" prop="inputParams">
              <pre class="form-readonly textarea json-pre">{{ execRecordForm.inputParams || "-" }}</pre>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="输出结果" prop="outputResult">
              <pre class="form-readonly textarea json-pre">{{ execRecordForm.outputResult || "-" }}</pre>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="执行日志" prop="executionLog">
              <div class="form-readonly textarea log-box">{{ execRecordForm.executionLog || "-" }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="错误信息" prop="errorMessage">
              <div class="form-readonly textarea error-text">{{ execRecordForm.errorMessage || "-" }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="资源使用情况" prop="resourceUsage">
              <pre class="form-readonly textarea json-pre">{{ execRecordForm.resourceUsage || "-" }}</pre>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="mini" @click="closeExecRecordDetail">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="CalcDetail">
import { ref, computed, watch, getCurrentInstance, reactive } from "vue";
import { useRouter, useRoute } from "vue-router";
import { getCalc } from "@/api/model/calc/calc";
import { listCalcExecution, getCalcExecution } from "@/api/model/calcExecution/calcExecution";
import RightToolbar from "@/components/RightToolbar/index.vue";
import OutputResult from "./OutputResult.vue";

const { proxy } = getCurrentInstance();
const router = useRouter();
const route = useRoute();

const { model_calc_status, model_access_type, model_calc_priority } = proxy.useDict("model_calc_status", "model_access_type", "model_calc_priority");

const showSearch = ref(true);
const activeName = ref("inputParams");

const calcDetail = ref({});

// 输入参数列表相关
const inputParamLoading = ref(false);
const inputParamColumns = ref([
  { key: 0, label: "参数名", visible: true },
  { key: 1, label: "是否必填", visible: true },
  { key: 2, label: "参数值", visible: true },
  { key: 3, label: "类型", visible: true },
  { key: 4, label: "说明", visible: true },
]);

function getInputParamColumnVisibility(key) {
  const column = inputParamColumns.value.find((col) => col.key === key);
  if (!column) return true;
  return column.visible;
}

/** 输入参数「刷新」按钮：其实是给 right-toolbar 用的，输入参数是本地 computed，不需要真正刷新，留空即可 */
function refreshInputParams() {}

// 执行记录列表相关
const execRecordList = ref([]);
const execRecordLoading = ref(false);
const execRecordTotal = ref(0);
const execRecordDefaultSort = ref({ prop: "createTime", order: "descending" });
const openExecRecordDetail = ref(false);
const execRecordDetailTitle = ref("");

const execRecordColumns = ref([
  { key: 0, label: "编号", visible: true },
  { key: 1, label: "执行批次号", visible: true },
  { key: 2, label: "执行模式", visible: true },
  { key: 3, label: "耗时", visible: true },
  { key: 4, label: "执行状态", visible: true },
  { key: 5, label: "开始时间", visible: true },
  { key: 6, label: "结束时间", visible: true },
  { key: 8, label: "操作", visible: true },
]);

const execRecordQueryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  calcId: null,
  orderByColumn: "createTime",
  isAsc: "desc",
});

const execRecordForm = reactive({});

function getExecRecordColumnVisibility(key) {
  const column = execRecordColumns.value.find((col) => col.key === key);
  if (!column) return true;
  return column.visible;
}

const handleClick = (tab, event) => {
  if (tab.props.name === "execRecord") {
    getExecRecordList();
  }
};

const goBack = () => {
  router.back();
};

/** 监听 id 变化 */
watch(
  () => route.query.id,
  (newId) => {
    if (newId) {
      getCalcDetailById(newId);
    }
  },
  { immediate: true }
);

/** 获取详情 */
function getCalcDetailById(id) {
  getCalc(id).then((response) => {
    calcDetail.value = response.data || {};
    execRecordQueryParams.calcId = id;
  });
}

/** 获取执行记录列表 */
function getExecRecordList() {
  if (!execRecordQueryParams.calcId) return;
  execRecordLoading.value = true;
  listCalcExecution(execRecordQueryParams).then((response) => {
    execRecordList.value = response.data.rows;
    execRecordTotal.value = response.data.total;
    execRecordLoading.value = false;
  }).catch(() => {
    execRecordLoading.value = false;
  });
}

/** 执行记录排序 */
function handleExecRecordSortChange(column) {
  execRecordQueryParams.orderByColumn = column.prop;
  execRecordQueryParams.isAsc = column.order === "ascending" ? "asc" : "desc";
  getExecRecordList();
}

/** 执行记录详情 */
function handleExecRecordDetail(row) {
  resetExecRecordForm();
  getCalcExecution(row.id).then((response) => {
    Object.assign(execRecordForm, response.data);
    openExecRecordDetail.value = true;
    execRecordDetailTitle.value = "执行记录详情";
  });
}

/** 重置执行记录表单 */
function resetExecRecordForm() {
  Object.assign(execRecordForm, {
    id: null,
    calcId: null,
    modelId: null,
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

/** 关闭执行记录详情 */
function closeExecRecordDetail() {
  openExecRecordDetail.value = false;
  resetExecRecordForm();
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

/** 获取访问类型 */
function getAccessTypeByCalcType(calcType) {
  if (calcType === 0 || calcType === '0') return 'API'
  if (calcType === 1 || calcType === '1') return 'PYTHON'
  return calcType
}

/** 输入参数列表 */
const inputParamList = computed(() => {
  const params = calcDetail.value.inputParams;
  if (!params) return [];
  if (Array.isArray(params)) return params;
  try {
    const parsed = typeof params === "string" ? JSON.parse(params) : params;
    if (parsed && parsed.params && Array.isArray(parsed.params)) {
      return parsed.params;
    }
    return [];
  } catch {
    return [];
  }
});

/** 日志列表（模拟数据，实际应从后端获取） */
const logList = computed(() => {
  const logs = [];
  if (calcDetail.value.createTime) {
    logs.push({
      time: formatTime(calcDetail.value.createTime),
      content: "任务创建成功，等待执行...",
      type: "info",
    });
  }
  if (calcDetail.value.startTime) {
    logs.push({
      time: formatTime(calcDetail.value.startTime),
      content: "开始执行计算任务...",
      type: "info",
    });
  }
  if (calcDetail.value.status === 2 && calcDetail.value.endTime) {
    logs.push({
      time: formatTime(calcDetail.value.endTime),
      content: "计算任务执行成功",
      type: "success",
    });
  }
  if (calcDetail.value.status === 3 && calcDetail.value.endTime) {
    logs.push({
      time: formatTime(calcDetail.value.endTime),
      content: "计算任务执行失败：" + (calcDetail.value.errorMessage || "未知错误"),
      type: "error",
    });
  }
  if (calcDetail.value.status === 4) {
    logs.push({
      time: formatTime(calcDetail.value.endTime || calcDetail.value.updateTime),
      content: "任务已被用户终止",
      type: "warn",
    });
  }
  return logs;
});

function formatTime(timeStr) {
  if (!timeStr) return "";
  const d = new Date(timeStr);
  return `${d.getHours().toString().padStart(2, "0")}:${d
    .getMinutes()
    .toString()
    .padStart(2, "0")}:${d.getSeconds().toString().padStart(2, "0")}`;
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

/** 获取类型标签颜色 */
function getTypeTagType(type) {
  const map = {
    string: "",
    integer: "warning",
    number: "warning",
    file: "info",
    boolean: "success",
  };
  return map[type] || "";
}
</script>

<style lang="scss" scoped>


.output-result-tab {
  padding-top: 0;
}

.output-section-title {
  display: flex;
  align-items: center;
  gap: 6px;
  font-size: 14px;
  font-weight: 500;
}

.error-box {
  background-color: #fef0f0;
  border: 1px solid #fde2e2;
  border-radius: 4px;
  padding: 12px 15px;

  pre {
    margin: 0;
    white-space: pre-wrap;
    word-break: break-all;
    color: #f56c6c;
    font-size: 13px;
    line-height: 1.6;
  }
}

.log-body {
  background-color: #1e1e1e;
  color: #d4d4d4;
  padding: 15px;
  font-family: "Consolas", "Monaco", monospace;
  font-size: 13px;
  line-height: 1.6;
  border-radius: 4px;
  overflow-y: auto;
  min-height: 300px;
  max-height: 500px;
}

.log-line {
  white-space: pre-wrap;
  word-break: break-all;
  margin-bottom: 4px;
}

.log-time {
  color: #858585;
  margin-right: 8px;
}

.log-content {
  color: #d4d4d4;
}

.log-line.success .log-content {
  color: #7ee787;
}

.log-line.error .log-content {
  color: #f85149;
}

.log-line.warn .log-content {
  color: #ffa657;
}

.log-line.code .log-content {
  color: #79c0ff;
}

.log-empty {
  color: #7ee787;
}

.el-empty {
  --el-empty-padding: 0px !important;
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
