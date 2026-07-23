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
        <el-form-item label="模型id" prop="modelId">
          <el-input
              class="el-form-input-width"
              v-model="queryParams.modelId"
              placeholder="请输入模型id"
              clearable
              @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="申请时间" prop="applyTime">
          <el-date-picker class="el-form-input-width"
                          clearable
                          v-model="queryParams.applyTime"
                          type="date"
                          value-format="YYYY-MM-DD"
                          placeholder="请选择申请时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="审核状态" prop="auditStatus">
          <el-select class="el-form-input-width" v-model="queryParams.auditStatus" placeholder="请选择审核状态"
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
        <el-table-column v-if="getColumnVisibility(2)" label="模型编码" align="left" prop="code"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            {{ scope.row.code || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(3)" label="申请人" align="center" prop="applyId">
          <template #default="scope">
            <dict-tag :options="model_audit_status" :value="scope.row.applyId"/>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(4)" label="申请时间" align="center" prop="applyTime" width="180"
                         sortable="custom" :sort-orders="['descending', 'ascending']">
          <template #default="scope">
            <span>{{ parseTime(scope.row.applyTime, '{y}-{m}-{d}  {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(5)" label="申请理由" align="left" prop="applyReason">
          <template #default="scope">
            <dict-tag :options="model_audit_status" :value="scope.row.applyReason"/>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(6)" label="审核状态" align="center" prop="auditStatus">
          <template #default="scope">
            <dict-tag :options="model_audit_status" :value="scope.row.auditStatus"/>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(7)" label="审核人" align="center" prop="auditorId">
          <template #default="scope">
            <dict-tag :options="model_audit_status" :value="scope.row.auditorId"/>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(8)" label="审核时间" align="center" prop="auditTime" width="180">
          <template #default="scope">
            <span>{{ parseTime(scope.row.auditTime, "{y}-{m}-{d} {h}:{i}") }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(9)" label="审核理由" align="left" prop="auditReason">
          <template #default="scope">
            <dict-tag :options="model_audit_status" :value="scope.row.auditReason"/>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(10)" label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="180">
          <template #default="scope">
            <el-button link type="success" icon="Check" @click="handleUpdate(scope.row)"
                       v-hasPermi="['model:modelAudit:audit:edit']">通过
            </el-button>
            <el-button link type="danger" icon="Close" @click="handleDetail(scope.row)"
                       v-hasPermi="['model:modelAudit:audit:edit']">驳回
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

    <!-- 添加或修改模型审批对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="auditRef" :model="form" :rules="rules" label-width="80px" @submit.prevent>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="模型id" prop="modelId">
              <el-input v-model="form.modelId" placeholder="请输入模型id"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请人" prop="applyId">
              <el-input v-model="form.applyId" placeholder="请输入申请人"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="申请时间" prop="applyTime">
              <el-date-picker clearable
                              style="width: 100%"
                              v-model="form.applyTime"
                              type="date"
                              value-format="YYYY-MM-DD HH:mm:ss"
                              placeholder="请选择申请时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请理由" prop="applyReason">
              <el-input v-model="form.applyReason" placeholder="请输入申请理由"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="审核状态" prop="auditStatus">
              <el-radio-group v-model="form.auditStatus">
                <el-radio
                    v-for="dict in model_audit_status"
                    :key="dict.value"
                    :label="dict.value"
                >{{ dict.label }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="审核人" prop="auditorId">
              <el-input v-model="form.auditorId" placeholder="请输入审核人"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="审核时间" prop="auditTime">
              <el-date-picker clearable
                              style="width: 100%"
                              v-model="form.auditTime"
                              type="date"
                              value-format="YYYY-MM-DD HH:mm:ss"
                              placeholder="请选择审核时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="审核理由" prop="auditReason">
              <el-input v-model="form.auditReason" placeholder="请输入审核理由"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"/>
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

    <!-- 模型审批详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="auditRef" :model="form" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="模型id" prop="modelId">
              <div>
                {{ form.modelId }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请人" prop="applyId">
              <div>
                {{ form.applyId }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="申请时间" prop="applyTime">
              <el-date-picker clearable
                              style="width: 100%"
                              v-model="form.applyTime"
                              type="date"
                              value-format="YYYY-MM-DD"
                              placeholder="请选择申请时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请理由" prop="applyReason">
              <div>
                {{ form.applyReason }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="审核人" prop="auditorId">
              <div>
                {{ form.auditorId }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="审核时间" prop="auditTime">
              <el-date-picker clearable
                              style="width: 100%"
                              v-model="form.auditTime"
                              type="date"
                              value-format="YYYY-MM-DD"
                              placeholder="请选择审核时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="审核理由" prop="auditReason">
              <div>
                {{ form.auditReason }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <div>
                {{ form.remark }}
              </div>
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

const auditList = ref([]);

// 列显隐信息
const columns = ref([
  {key: 1, label: "模型id", visible: true},
  {key: 2, label: "申请人", visible: true},
  {key: 3, label: "申请时间", visible: true},
  {key: 4, label: "申请理由", visible: true},
  {key: 5, label: "审核状态", visible: true},
  {key: 6, label: "审核人", visible: true},
  {key: 7, label: "审核时间", visible: true},
  {key: 8, label: "审核理由", visible: true},
  {key: 11, label: "创建人", visible: true},
  {key: 13, label: "创建时间", visible: true},
  {key: 17, label: "备注", visible: true}
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
    modelId: null,
    applyId: null,
    applyTime: null,
    applyReason: null,
    auditStatus: null,
    auditorId: null,
    auditTime: null,
    auditReason: null,
    createTime: null,
  },
  rules: {
    modelId: [{required: true, message: "模型id不能为空", trigger: "blur"}],
    applyId: [{required: true, message: "申请人不能为空", trigger: "blur"}],
    applyTime: [{required: true, message: "申请时间不能为空", trigger: "blur"}],
    validFlag: [{required: true, message: "是否有效不能为空", trigger: "blur"}],
    delFlag: [{required: true, message: "删除标志不能为空", trigger: "blur"}],
    createTime: [{required: true, message: "创建时间不能为空", trigger: "blur"}],
    updateTime: [{required: true, message: "更新时间不能为空", trigger: "blur"}],
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
    auditStatus: null,
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
  const _id = row.id || ids.value
  getAudit(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改模型审批";
  });
}

/** 详情按钮操作 */
function handleDetail(row) {
  reset();
  const _id = row.id || ids.value
  getAudit(_id).then(response => {
    form.value = response.data;
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
          proxy.$modal.msgSuccess("修改成功");
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
