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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch">
      <el-form class="btn-style" :model="queryParams" ref="queryRef" :inline="true" label-width="75px"
               v-show="showSearch" @submit.prevent>
        <el-form-item label="模型名称" prop="modelName">
          <el-input
              class="el-form-input-width"
              v-model="queryParams.modelName"
              placeholder="请输入模型名称"
              clearable
              @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="调用类型" prop="versionId">
          <el-input
              class="el-form-input-width"
              v-model="queryParams.versionId"
              placeholder="请输入模型版本id"
              clearable
              @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button plain type="primary" @click="handleQuery" @mousedown="(e) => e.preventDefault()">
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
        <div class="justify-end top-right-btn">
          <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </div>
      </div>
      <el-table stripe height="58vh" v-loading="loading" :data="modelInvokeHistoryList"
                @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column v-if="getColumnVisibility(0)" label="编号" align="center" width="80" prop="id" sortable="custom"
                         :sort-orders="['descending', 'ascending']"/>
        <el-table-column v-if="getColumnVisibility(1)" label="模型名称" align="left" prop="modelName">
          <template #default="scope">
            {{ scope.row.modelName || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(2)" label="模型编码" align="left" prop="code">
          <template #default="scope">
            {{ scope.row.code || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(3)" label="模型版本" align="left" prop="versionId">
          <template #default="scope">
            {{ scope.row.version || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(4)" label="调用类型" align="center" prop="invokeType" width="120">
          <template #default="scope">
            <dict-tag
                :options="invoke_type"
                :value="scope.row.invokeType"
                class="con-value access-tag"
            />
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(5)" label="请求时间" align="center" prop="createTime" width="180"
                         sortable="custom" :sort-orders="['descending', 'ascending']">
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}") }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(6)" label="执行耗时" align="center" prop="duration" width="120">
          <template #default="scope">
            {{ scope.row.duration +' ms' || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(7)" label="调用状态" align="center" prop="status" width="80">
          <template #default="scope">
            <dict-tag
                :options="invoke_history_status"
                :value="scope.row.status"
                class="con-value access-tag"
            />
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(8)" label="客户端IP" align="center" prop="clientIp" width="120">
          <template #default="scope">
            {{ scope.row.clientIp || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(9)" label="调用人" align="center" prop="createBy" width="120">
          <template #default="scope">
            {{ scope.row.createBy || '-' }}
          </template>
        </el-table-column>

        <el-table-column v-if="getColumnVisibility(10)" label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="140">
          <template #default="scope">
            <el-button link type="primary" icon="view" @click="handleDetail(scope.row)"
                       v-hasPermi="['model:invokeHistory:invokehistory:query']">详情
            </el-button>
          </template>
        </el-table-column>

        <template #empty>
          <div class="emptyBg">
            <img src="@/assets/system/images/no_data/noData.png" alt=""/>
            <p>暂无记录</p>
          </div>
        </template>
      </el-table>

      <pagination
          v-show="total>0"
          :total="total"
          v-model:page="queryParams.pageNum"
          v-model:limit="queryParams.pageSize"
          @pagination="getList"
      />
    </div>

    <!-- 模型调用历史记录详情对话框 -->
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
              <div class="form-readonly">{{ form.duration+" ms" || "-" }}</div>
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

  </div>
</template>

<script setup name="ModelInvokeHistory">
import {
  listModelInvokeHistory,
  getModelInvokeHistory,
  delModelInvokeHistory,
  addModelInvokeHistory,
  updateModelInvokeHistory
} from "@/api/model/invokeHistory/modelInvokeHistory";

import {getToken} from "@/utils/auth.js";
import {ref} from "vue";

const {proxy} = getCurrentInstance();

const modelInvokeHistoryList = ref([]);

// 列显隐信息
const columns = ref([
  {key: 0, label: "编号", visible: true},
  {key: 1, label: "模型名称", visible: true},
  {key: 2, label: "模型编码", visible: true},
  {key: 3, label: "模型版本", visible: true},
  {key: 4, label: "调用类型", visible: true},
  {key: 5, label: "请求时间", visible: true},
  {key: 6, label: "执行耗时", visible: true},
  {key: 7, label: "调用状态", visible: true},
  {key: 8, label: "客户端IP", visible: true},
  {key: 9, label: "调用人", visible: true},
  {key: 10, label: "操作", visible: true},
]);
const { invoke_history_status,invoke_type } = proxy.useDict("invoke_history_status","invoke_type");
const open = ref(false);
const openDetail = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const defaultSort = ref({ prop: "createTime", order: "descending" });
const router = useRouter();

const data = reactive({
  form: {},
  queryParams: {
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
  },
  rules: {
    modelId: [{required: true, message: "模型id不能为空", trigger: "blur"}],
    validFlag: [{required: true, message: "是否有效不能为空", trigger: "blur"}],
    delFlag: [{required: true, message: "删除标志不能为空", trigger: "blur"}],
    createTime: [{required: true, message: "创建时间不能为空", trigger: "blur"}],
    updateTime: [{required: true, message: "更新时间不能为空", trigger: "blur"}],
  }
});

const {queryParams, form, rules} = toRefs(data);

const getColumnVisibility = (key) => {
  const column = columns.value.find(col => col.key === key);
  // 如果没有找到对应列配置，默认显示
  if (!column) return true;
  // 如果找到对应列配置，根据visible属性来控制显示
  return column.visible;
};

/** 查询模型调用历史记录列表 */
function getList() {
  loading.value = true;
  listModelInvokeHistory(queryParams.value).then(response => {
    modelInvokeHistoryList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  openDetail.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
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
    remark: null
  };
  proxy.resetForm("modelInvokeHistoryRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 排序触发事件 */
function handleSortChange(column, prop, order) {
  queryParams.value.orderByColumn = column.prop;
  queryParams.value.isAsc = column.order;
  getList();
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加模型调用历史记录";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getModelInvokeHistory(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改模型调用历史记录";
  });
}

/** 详情按钮操作 */
const handleDetail = (row) => {
  reset();
  const _id = row.id;
  getModelInvokeHistory(_id).then((response) => {
    form.value = response.data;
    openDetail.value = true;
    title.value = "调用记录详情";
  });
};

/** 提交按钮 */
function submitForm() {
  proxy.$refs["modelInvokeHistoryRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateModelInvokeHistory(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        }).catch(error => {
        });
      } else {
        addModelInvokeHistory(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        }).catch(error => {
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除模型调用历史记录编号为"' + _ids + '"的数据项？').then(function () {
    return delModelInvokeHistory(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('model/modelInvokeHistory/export', {
    ...queryParams.value
  }, `modelInvokeHistory_${new Date().getTime()}.xlsx`)
}

function routeTo(link, row) {
  if (link !== "" && link.indexOf("http") !== -1) {
    window.location.href = link;
    return
  }
  if (link !== "") {
    if (link === router.currentRoute.value.path) {
      window.location.reload();
    } else {
      router.push({
        path: link,
        query: {
          id: row.id
        }
      });
    }
  }
}

getList();
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
</style>
