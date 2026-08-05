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
        <el-form-item label="字典名称" prop="dictName">
          <el-input
            v-model="queryParams.dictName"
            placeholder="请输入字典名称"
            clearable
            class="el-form-input-width"
            @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="字典类型" prop="dictType">
          <el-input
            v-model="queryParams.dictType"
            placeholder="请输入字典类型"
            clearable
            class="el-form-input-width"
            @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-select
            v-model="queryParams.status"
            placeholder="请选择状态"
            clearable
            class="el-form-input-width"
          >
            <el-option
              v-for="dict in sys_normal_disable"
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
              v-hasPermi="['system:dict:add']"
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
                     v-hasPermi="['system:dict:edit']"
                  >
                    <i class="iconfont-mini icon-a-xiugaixianxing"></i>
                    修改</el-button>
               </el-col> -->
          <el-col :span="1.5">
            <el-button
              type="danger"
              plain
              :disabled="multiple"
              @click="handleDelete"
              v-hasPermi="['system:dict:remove']"
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
              v-hasPermi="['system:dict:export']"
            >
              <i class="iconfont-mini icon-daochu"></i>
              导出</el-button
            >
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="primary"
              plain
              :disabled="multiple"
              @click="handleEnum"
            >
              <i class="iconfont-mini icon-daoru"></i> 下载</el-button
            >
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              plain
              @click="handleRefreshCache"
              v-hasPermi="['system:dict:remove']"
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
        :data="typeList"
        @selection-change="handleSelectionChange"
        :default-sort="defaultSort"
        @sort-change="handleSortChange"
      >
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column
          label="编号"
          align="center"
          prop="dictId"
          width="100"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
        />
        <el-table-column
          label="字典名称"
          align="left"
          prop="dictName"
          :show-overflow-tooltip="{ effect: 'light' }"
          width="250"
        />
        <el-table-column
          label="字典类型"
          align="left"
          width="250"
          :show-overflow-tooltip="{ effect: 'light' }"
        >
          <template #default="scope">
            <router-link
              :to="'/system/dict-data/index/' + scope.row.dictId"
              class="link-type"
            >
              <span>{{ scope.row.dictType }}</span>
            </router-link>
          </template>
        </el-table-column>
        <el-table-column label="状态" align="center" prop="status">
          <template #default="scope">
            <dict-tag :options="sys_normal_disable" :value="scope.row.status" />
          </template>
        </el-table-column>
        <el-table-column
          label="备注"
          align="left"
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
            <el-button link type="primary" @click="handleEnum(scope.row)">
              <i class="iconfont-mini icon-daoru"></i>下载</el-button
            >
            <el-button
              link
              type="primary"
              @click="handleView(scope.row)"
              v-hasPermi="['system:dict:query']"
              icon="view"
            >
              详情</el-button
            >
            <el-popover placement="bottom" :width="150" trigger="click">
              <template #reference>
                <el-button link type="primary" icon="ArrowDown"
                  >更多
                </el-button>
              </template>
              <div style="width: 90px" class="butgdlist">
                <el-button
                  link
                  type="primary"
                  @click="handleUpdate(scope.row)"
                  v-hasPermi="['system:dict:edit']"
                  style="padding-left: 28px"
                >
                  <i class="iconfont-mini icon-a-xiugaixianxing"></i>
                  修改</el-button
                >
                <el-button
                  link
                  type="danger"
                  @click="handleDelete(scope.row)"
                  v-hasPermi="['system:dict:remove']"
                  icon="Delete"
                  style="padding-left: 14px"
                >
                  删除</el-button
                >
              </div>
            </el-popover>
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
      <el-form ref="dictRef" :model="form" :rules="rules" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="字典名称" prop="dictName">
              <el-input v-model="form.dictName" placeholder="请输入字典名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="字典类型" prop="dictType">
              <el-input v-model="form.dictType" placeholder="请输入字典类型" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in sys_normal_disable"
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
                placeholder="请输入备注"
                maxlength="256 个字符"
                show-word-limit
              ></el-input>
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

    <!-- 字典详情 -->
    <el-dialog
      title="字典详情"
      v-model="detailOpen"
      width="800px"
      :append-to="$refs['app-container']"
      draggable
      destroy-on-close
    >
      <el-form :model="detailForm" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="字典编号">
              <div class="form-readonly">
                {{ detailForm.dictId ?? "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="字典名称">
              <div class="form-readonly">
                {{ detailForm.dictName || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="字典类型">
              <div class="form-readonly">
                {{ detailForm.dictType || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="状态">
              <div class="form-readonly">
                {{ statusFormat(detailForm) || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
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

<script setup name="Dict">
import useDictStore from "@/store/system/dict.js";
import {
  listType,
  getType,
  delType,
  addType,
  updateType,
  refreshCache,
} from "@/api/system/system/dict/type.js";

const { proxy } = getCurrentInstance();
const { sys_normal_disable } = proxy.useDict("sys_normal_disable");

const typeList = ref([]);
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
const dictTypes = ref([]);
const defaultSort = ref({ prop: "loginTime", order: "descending" });

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    dictName: undefined,
    dictType: undefined,
    status: undefined,
  },
  rules: {
    dictName: [
      { required: true, message: "字典名称不能为空", trigger: "blur" },
    ],
    dictType: [
      { required: true, message: "字典类型不能为空", trigger: "blur" },
    ],
  },
});

const { queryParams, form, rules } = toRefs(data);

/** 查询字典类型列表 */
function getList() {
  loading.value = true;
  listType(proxy.addDateRange(queryParams.value, dateRange.value)).then(
    (response) => {
      typeList.value = response.rows;
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
    dictId: undefined,
    dictName: undefined,
    dictType: undefined,
    status: "0",
    remark: undefined,
  };
  proxy.resetForm("dictRef");
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

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "新增字典类型";
}

/** 多选框选中数据 */
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.dictId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
  dictTypes.value = selection.map((item) => item.dictType);
}

/** 排序触发事件 */
function handleSortChange(column) {
  queryParams.value.orderByColumn = column.prop;
  queryParams.value.isAsc = column.order;
  getList();
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const dictId = row.dictId || ids.value;
  getType(dictId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改字典类型";
  });
}

/** 字典状态翻译 */
function statusFormat(row) {
  return proxy.selectDictLabel(sys_normal_disable.value, row.status);
}

/** 详情按钮操作 */
function handleView(row) {
  detailForm.value = {};
  getType(row.dictId).then((response) => {
    detailForm.value = response.data;
    detailOpen.value = true;
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["dictRef"].validate((valid) => {
    if (valid) {
      if (form.value.dictId != undefined) {
        updateType(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addType(form.value).then(() => {
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
  const dictIds = row.dictId || ids.value;
  proxy.$modal
    .confirm('是否确认删除字典编号为"' + dictIds + '"的数据项？')
    .then(function () {
      return delType(dictIds);
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
    "system/dict/type/export",
    {
      ...queryParams.value,
    },
    `dict_${new Date().getTime()}.xlsx`
  );
}

/** 刷新缓存按钮操作 */
function handleRefreshCache() {
  refreshCache().then(() => {
    proxy.$modal.msgSuccess("刷新成功");
    useDictStore().cleanDict();
  });
}

/** 生成枚举类操作 */
function handleEnum(row) {
  const dtNames = row.dictType || dictTypes.value;
  if (dtNames == "") {
    proxy.$modal.msgError("请选择要生成的字典");
    return;
  }

  proxy.$download.zip(
    "/system/dict/type/batchDictData?dictTypes=" + dtNames,
    "anivia.zip"
  );
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
