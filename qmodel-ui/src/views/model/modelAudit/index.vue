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
        <el-form-item label="模型编码" prop="modelCode">
          <el-input
              class="el-form-input-width"
              v-model="queryParams.modelCode"
              placeholder="请输入模型编码"
              clearable
              @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="审批状态" prop="auditStatus">
          <el-select class="el-form-input-width" v-model="queryParams.auditStatus" placeholder="请选择审批状态"
                     clearable>
            <el-option
                v-for="dict in model_audit_status"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
            />
          </el-select>
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
      <el-table stripe height="58vh" v-loading="loading" :data="auditList" @selection-change="handleSelectionChange"
                :default-sort="defaultSort" @sort-change="handleSortChange">
        <el-table-column v-if="getColumnVisibility(0)" label="编号" align="center" width="80" prop="id" sortable="custom"
                         :sort-orders="['descending', 'ascending']"/>
        <el-table-column v-if="getColumnVisibility(1)" label="模型名称" align="left" prop="modelName"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            {{ scope.row.modelName || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(2)" label="模型编码" align="left" prop="modelCode"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            {{ scope.row.modelCode || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(3)" label="申请人" align="center" prop="applyName" width="80">
          <template #default="scope">
            {{ scope.row.applyName || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(4)" label="申请时间" align="center" prop="applyTime" width="140"
                         sortable="custom" :sort-orders="['descending', 'ascending']">
          <template #default="scope">
            <span>{{ parseTime(scope.row.applyTime, '{y}-{m}-{d}  {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(5)" label="申请理由" align="left" prop="applyReason"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            {{ scope.row.applyReason || "-" }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(6)" label="审批状态" align="center" prop="auditStatus" width="90">
          <template #default="scope">
            <dict-tag :options="model_audit_status" :value="scope.row.auditStatus"/>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(7)" label="审批人" align="center" prop="auditorName" width="80">
          <template #default="scope">
            {{ scope.row.auditorName || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(8)" label="审批时间" align="center" prop="auditTime" width="140">
          <template #default="scope">
            <span>{{ parseTime(scope.row.auditTime, "{y}-{m}-{d} {h}:{i}") || "-" }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(10)" label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="180">
          <template #default="scope">
            <el-button link type="primary" icon="view" @click="handleDetail(scope.row)"
                       v-hasPermi="['model:modelAudit:audit:query']">详情
            </el-button>
            <el-button link type="primary" :disabled="scope.row.auditStatus !== '0'" icon="Finished" @click="handleUpdate(scope.row)"
                       v-hasPermi="['model:modelAudit:audit:edit']">审批
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

    <!-- 审批对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="auditRef" :model="form" :rules="rules" label-width="80px" @submit.prevent>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="编号" prop="id">
              <el-input v-model="form.id" disabled placeholder="请输入编号"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模型名称" prop="modelName">
              <el-input v-model="form.modelName" disabled placeholder="请输入模型名称"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模型编码" prop="modelCode">
              <el-input v-model="form.modelCode" disabled placeholder="请输入模型编码"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="申请人" prop="applyName">
              <el-input v-model="form.applyName" disabled placeholder="请输入申请人"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请时间" prop="applyTime">
              <el-input v-model="form.applyTime" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="申请理由" prop="applyReason">
              <el-input v-model="form.applyReason" type="textarea" disabled placeholder="请输入内容"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="审批状态" prop="auditStatus">
              <el-radio-group v-model="form.auditStatus">
                <el-radio value="1">通过</el-radio>
                <el-radio value="2">拒绝</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col v-if="form.auditStatus === '2'" :span="24">
            <el-form-item label="拒绝理由" prop="auditReason">
              <el-input v-model="form.auditReason" type="textarea" maxlength="256 个字符" show-word-limit placeholder="请输入拒绝理由"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="mini" @click="cancel">取 消</el-button>
          <el-button type="primary" size="mini" @click="submitForm">确 定</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="auditRef" :model="form" label-width="80px">
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
          <el-col :span="12">
            <el-form-item label="模型编码" prop="modelCode">
              <div class="form-readonly">{{ form.modelCode || "-" }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="申请人" prop="applyName">
              <div class="form-readonly">{{ form.applyName || "-" }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请时间" prop="applyTime">
              <div class="form-readonly">
                {{ parseTime(form.applyTime, "{y}-{m}-{d} {h}:{i}:{s}") || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="申请理由" prop="applyReason">
                <div class="form-readonly textarea">{{ form.applyReason || "-" }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="审批状态" prop="auditStatus">
              <dict-tag
                  :options="model_audit_status"
                  :value="form.auditStatus"
                  class="con-value access-tag"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="审批时间" prop="auditTime">
              <div class="form-readonly">
                {{ parseTime(form.auditTime, "{y}-{m}-{d} {h}:{i}:{s}") || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="审批人" prop="auditorName">
              <div class="form-readonly">
                {{ form.auditorName || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="拒绝理由" prop="auditReason">
              <div class="form-readonly textarea">{{ form.auditReason || "-"}}</div>
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

<script setup name="Audit">
import {listAudit, getAudit, updateAudit} from "@/api/model/audit";

const {proxy} = getCurrentInstance();
import { parseTime } from '@/utils/anivia.js'

const auditList = ref([]);

// 列显隐信息
const columns = ref([
  {key: 0, label: "编号", visible: true},
  {key: 1, label: "模型名称", visible: true},
  {key: 2, label: "模型编码", visible: true},
  {key: 3, label: "申请人", visible: true},
  {key: 4, label: "申请时间", visible: true},
  {key: 5, label: "申请理由", visible: true},
  {key: 6, label: "审批状态", visible: true},
  {key: 7, label: "审批人", visible: true},
  {key: 8, label: "审批时间", visible: true},
  {key: 10, label: "操作", visible: true}
]);

const getColumnVisibility = (key) => {
  const column = columns.value.find(col => col.key === key);
  // 如果没有找到对应列配置，默认显示
  if (!column) return true;
  // 如果找到对应列配置，根据visible属性来控制显示
  return column.visible;
};

const open = ref(false);
const openDetail = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const defaultSort = ref({prop: "applyTime", order: "descending"});
const {model_audit_status} = proxy.useDict("model_audit_status");

const router = useRouter();

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    applyTime: null,
    applyReason: null,
    auditStatus: null,
    auditorId: null,
    auditTime: null,
    auditReason: null,
    createTime: null,
    isAsc: "desc",
  },
  rules: {
    auditStatus: [{required: true, message: "审批状态不能为空", trigger: "blur"}]
  }
});

const {queryParams, form, rules} = toRefs(data);

/** 查询模型审批列表 */
function getList() {
  loading.value = true;
  listAudit(queryParams.value).then(response => {
    auditList.value = response.data.rows;
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
    applyId: null,
    applyTime: null,
    applyReason: null,
    auditStatus: '1',
    auditorId: null,
    auditTime: null,
    auditReason: null,
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
  proxy.resetForm("auditRef");
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
  title.value = "添加模型审批";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  form.value = {...row};
  form.value.applyTime = parseTime(row.applyTime, "{y}-{m}-{d} {h}:{i}:{s}")
  form.value.auditStatus = '1';
  open.value = true;
  title.value = "模型审批";
}

/** 详情按钮操作 */
function handleDetail(row) {
  reset();
  const _id = row.id || ids.value
  getAudit(_id).then(response => {
    form.value = {...row};
    form.value.auditReason = response.data.auditReason
    openDetail.value = true;
    title.value = "模型审批详情";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["auditRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateAudit(form.value).then(response => {
          proxy.$modal.msgSuccess("审批成功");
          open.value = false;
          getList();
        }).catch(error => {
        });
      }
    }
  });
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
  align-items: flex-start;
}

.json-pre {
  font-family: "Consolas", "Monaco", monospace;
  font-size: 12px;
  max-height: 200px;
  overflow-y: auto;
}
</style>
