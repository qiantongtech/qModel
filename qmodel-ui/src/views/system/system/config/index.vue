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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch">
      <el-form
        class="btn-style"
        :model="queryParams"
        ref="queryRef"
        :inline="true"
        label-width="68px"
      >
        <el-form-item label="参数名称" prop="configName">
          <el-input
            v-model="queryParams.configName"
            placeholder="请输入参数名称"
            clearable
            class="el-form-input-width"
            @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="参数键名" prop="configKey">
          <el-input
            v-model="queryParams.configKey"
            placeholder="请输入参数键名"
            clearable
            class="el-form-input-width"
            @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="系统内置" prop="configType">
          <el-select
            class="el-form-input-width"
            v-model="queryParams.configType"
            placeholder="请选择系统是否内置"
            clearable
          >
            <el-option
              v-for="dict in sys_yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="创建时间">
          <el-date-picker
            class="el-form-input-width"
            v-model="dateRange"
            value-format="YYYY-MM-DD"
            type="daterange"
            range-separator="-"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="handleQuery"
            @mousedown="(e) => e.preventDefault()"
          >
            <i class="iconfont-mini icon-a-chaxunxianxing mr5"></i>查询
          </el-button>
          <el-button @click="resetQuery" @mousedown="(e) => e.preventDefault()">
            <i class="iconfont-mini icon-a-shuaxinxianxing mr5"></i>重置
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
              v-hasPermi="['system:config:add']"
            >
              <i class="iconfont-mini icon-xinzeng"></i>
              新增</el-button
            >
          </el-col>
          <!-- <el-col :span="1.5">
            <el-button
              type="primary"
              plain
              :disabled="single"
              @click="handleUpdate"
              v-hasPermi="['system:config:edit']"
            >
              <i class="iconfont-mini icon-a-xiugaixianxing"></i>
              修改</el-button
            >
          </el-col> -->
          <el-col :span="1.5">
            <el-button
              type="danger"
              plain
              :disabled="multiple"
              @click="handleDelete"
              v-hasPermi="['system:config:remove']"
              icon="Delete"
            >
              删除</el-button
            >
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="warning"
              plain
              :disabled="multiple"
              @click="handleExport"
              v-hasPermi="['system:config:export']"
            >
              <i class="iconfont-mini icon-daochu"></i>
              导出</el-button
            >
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              plain
              @click="handleRefreshCache"
              v-hasPermi="['system:config:remove']"
            >
              <i class="iconfont-mini icon-a-shuaxinxianxing"></i>
              刷新缓存</el-button
            >
          </el-col>
        </el-row>
        <right-toolbar
          v-model:showSearch="showSearch"
          @queryTable="getList"
        ></right-toolbar>
      </div>

      <el-table
        stripe
        v-loading="loading"
        :data="configList"
        @selection-change="handleSelectionChange"
        :default-sort="defaultSort"
        @sort-change="handleSortChange"
      >
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column
          label="编号"
          align="center"
          prop="configId"
          width="100"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
        />
        <el-table-column
          label="参数名称"
          prop="configName"
          width="250"
          :show-overflow-tooltip="{ effect: 'light' }"
        />
        <el-table-column
          label="参数键名"
          prop="configKey"
          width="200"
          :show-overflow-tooltip="{ effect: 'light' }"
        />
        <el-table-column
          label="参数键值"
          prop="configValue"
          width="100"
          :show-overflow-tooltip="{ effect: 'light' }"
        >
          <template #default="scope">
            <span>{{ scope.row.configValue || "-" }}</span>
          </template>
        </el-table-column>
        <el-table-column label="系统内置" align="center" prop="configType">
          <template #default="scope">
            <dict-tag :options="sys_yes_no" :value="scope.row.configType" />
          </template>
        </el-table-column>
        <el-table-column
          label="备注"
          prop="remark"
          width="300"
          :show-overflow-tooltip="{ effect: 'light' }"
        />
        <el-table-column
          label="创建时间"
          align="center"
          prop="createTime"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
          width="180"
        >
          <template #default="scope">
            <span>{{
              parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}")
            }}</span>
          </template>
        </el-table-column>
        <el-table-column
          label="操作"
          align="center"
          class-name="small-padding fixed-width"
          fixed="right"
          width="240"
        >
          <template #default="scope">
            <el-button
              link
              type="primary"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:config:edit']"
            >
              <i class="iconfont-mini icon-a-xiugaixianxing"></i>
              修改</el-button
            >
            <el-button
              link
              type="danger"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:config:remove']"
              icon="Delete"
            >
              删除</el-button
            >
            <el-button
              link
              type="primary"
              @click="handleView(scope.row)"
              v-hasPermi="['system:config:query']"
              icon="view"
            >
              详情</el-button
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

    <!-- 添加或修改参数配置对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      :append-to="$refs['app-container']"
      draggable
      destroy-on-close
    >
      <el-form ref="configRef" :model="form" :rules="rules" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="参数名称" prop="configName">
              <el-input
                v-model="form.configName"
                placeholder="请输入参数名称"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="参数键名" prop="configKey">
              <el-input v-model="form.configKey" placeholder="请输入参数键名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="参数键值" prop="configValue">
              <el-input
                v-model="form.configValue"
                placeholder="请输入参数键值"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="系统内置" prop="configType">
              <el-radio-group v-model="form.configType">
                <el-radio
                  v-for="dict in sys_yes_no"
                  :key="dict.value"
                  :value="dict.value"
                  >{{ dict.label }}</el-radio
                >
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input
                v-model="form.remark"
                type="textarea"
                placeholder="请输入内容"
              />
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

    <!-- 参数配置详情 -->
    <el-dialog
      title="参数配置详情"
      v-model="detailOpen"
      width="800px"
      :append-to="$refs['app-container']"
      draggable
      destroy-on-close
    >
      <el-form :model="detailForm" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="参数编号">
              <div class="form-readonly">
                {{ detailForm.configId || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="参数名称">
              <div class="form-readonly">
                {{ detailForm.configName || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="参数键名">
              <div class="form-readonly">
                {{ detailForm.configKey || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="参数键值">
              <div class="form-readonly">
                {{ detailForm.configValue || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="系统内置">
              <div class="form-readonly">
                {{ configTypeFormat(detailForm) || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="创建时间">
              <div class="form-readonly">
                {{ parseTime(detailForm.createTime) || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注">
              <div class="form-readonly textarea">
                {{ detailForm.remark || "-" }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="detailOpen = false">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Config">
import {
  listConfig,
  getConfig,
  delConfig,
  addConfig,
  updateConfig,
  refreshCache,
} from "@/api/system/system/config.js";

const { proxy } = getCurrentInstance();
const { sys_yes_no } = proxy.useDict("sys_yes_no");

const configList = ref([]);
const open = ref(false);
const detailOpen = ref(false);
const detailForm = ref({});
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const dateRange = ref([]);
const defaultSort = ref({ prop: "loginTime", order: "descending" });

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    configName: undefined,
    configKey: undefined,
    configType: undefined,
  },
  rules: {
    configName: [
      { required: true, message: "参数名称不能为空", trigger: "blur" },
    ],
    configKey: [
      { required: true, message: "参数键名不能为空", trigger: "blur" },
    ],
    configValue: [
      { required: true, message: "参数键值不能为空", trigger: "blur" },
    ],
  },
});

const { queryParams, form, rules } = toRefs(data);

/** 查询参数列表 */
function getList() {
  loading.value = true;
  listConfig(proxy.addDateRange(queryParams.value, dateRange.value)).then(
    (response) => {
      configList.value = response.rows;
      total.value = response.total;
      loading.value = false;
    }
  );
}

/** 取消按钮 */
function cancel() {
  open.value = false;
  reset();
}

/** 表单重置 */
function reset() {
  form.value = {
    configId: undefined,
    configName: undefined,
    configKey: undefined,
    configValue: undefined,
    configType: "Y",
    remark: undefined,
  };
  proxy.resetForm("configRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  dateRange.value = [];
  proxy.resetForm("queryRef");
  handleQuery();
  proxy.$refs["logininforRef"].sort(
    defaultSort.value.prop,
    defaultSort.value.order
  );
}

/** 多选框选中数据 */
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.configId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}
/** 排序触发事件 */
function handleSortChange(column) {
  queryParams.value.orderByColumn = column.prop;
  queryParams.value.isAsc = column.order;
  getList();
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "新增参数";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const configId = row.configId || ids.value;
  getConfig(configId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改参数";
  });
}

/** 参数类型字典翻译 */
function configTypeFormat(row) {
  return proxy.selectDictLabel(sys_yes_no.value, row.configType);
}

/** 详情按钮操作 */
function handleView(row) {
  detailForm.value = {};
  getConfig(row.configId).then((response) => {
    detailForm.value = response.data;
    detailOpen.value = true;
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["configRef"].validate((valid) => {
    if (valid) {
      if (form.value.configId != undefined) {
        updateConfig(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addConfig(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const configIds = row.configId || ids.value;
  proxy.$modal
    .confirm('是否确认删除参数编号为"' + configIds + '"的数据项？')
    .then(function () {
      return delConfig(configIds);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download(
    "system/config/export",
    {
      ...queryParams.value,
    },
    `config_${new Date().getTime()}.xlsx`
  );
}

/** 刷新缓存按钮操作 */
function handleRefreshCache() {
  refreshCache().then(() => {
    proxy.$modal.msgSuccess("刷新缓存成功");
  });
}

getList();
</script>

<style lang="scss" scoped>
.form-readonly {
  width: 100%;
  border: 1px solid #f1f1f1;
  padding: 0 10px;
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
</style>
