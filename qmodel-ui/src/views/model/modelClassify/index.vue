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
      <el-form
        class="btn-style"
        :model="queryParams"
        ref="queryRef"
        :inline="true"
        v-show="showSearch"
        @submit.prevent
      >
        <el-form-item label="分类名称" prop="name">
          <el-input
            class="el-form-input-width"
            v-model="queryParams.name"
            placeholder="请输入分类名称"
            clearable
            @keyup.enter="handleQuery"
          />
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
        <el-row :gutter="15" class="btn-style">
          <el-col :span="1.5">
            <el-button
              type="primary"
              plain
              @click="handleAdd"
              v-hasPermi="['model:classify:add']"
              @mousedown="(e) => e.preventDefault()"
            >
              <i class="iconfont-mini icon-xinzeng mr5"></i>新增
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button class="toggle-expand-all" type="primary" plain @click="toggleExpandAll">
              <svg-icon v-if="isExpandAll" icon-class="toggle" />
              <svg-icon v-else icon-class="expand" />
              <span>{{ isExpandAll ? ' 折叠' : ' 展开' }}</span>
            </el-button>
          </el-col>
        </el-row>
        <div class="justify-end top-right-btn">
          <right-toolbar
            v-model:showSearch="showSearch"
            @queryTable="getList"
            :columns="columns"
          ></right-toolbar>
        </div>
      </div>
      <el-table
        v-if="refreshTable"
        v-loading="loading"
        :data="classifyList"
        row-key="id"
        :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
        :default-expand-all="isExpandAll"
      >
        <el-table-column
          v-if="getColumnVisibility(1)"
          label="分类名称"
          prop="name"
          align="left"
          width="250px"
          :show-overflow-tooltip="{ effect: 'light' }"
        >
          <template #default="scope">
            {{ scope.row.name || '-' }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(2)"
          label="显示顺序"
          align="center"
          prop="orderNum"
          width="100px"
        >
          <template #default="scope">
            {{ scope.row.orderNum !== null ? scope.row.orderNum : '-' }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(3)"
          label="备注"
          align="left"
          prop="remark"
          :show-overflow-tooltip="{ effect: 'light' }"
        >
          <template #default="scope">
            {{ scope.row.remark || '-' }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(4)"
          label="创建人"
          align="center"
          prop="createBy"
          width="100px"
        >
          <template #default="scope">
            {{ scope.row.createBy || '-' }}
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(5)"
          label="创建时间"
          align="center"
          prop="createTime"
          width="180"
        >
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(6)"
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
              icon="Plus"
              @click="handleAdd(scope.row)"
              v-hasPermi="['model:classify:add']"
            >新增</el-button>
            <el-button
              link
              type="primary"
              icon="Edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['model:classify:edit']"
            >修改</el-button>
            <el-button
              link
              type="danger"
              icon="Delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['model:classify:remove']"
            >删除</el-button>
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

    <!-- 添加或修改模型分类对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      append-to="body"
      draggable
    >
      <template #header>
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form
        ref="classifyRef"
        :model="form"
        :rules="rules"
        label-width="80px"
        @submit.prevent
      >
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="上级分类" prop="parentId">
              <el-tree-select
                v-model="form.parentId"
                :data="categoryOptions"
                :props="{ value: 'id', label: 'name', children: 'children' }"
                value-key="id"
                placeholder="选择上级分类"
                check-strictly
                clearable
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="分类名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入分类名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="显示顺序" prop="orderNum">
              <el-input-number
                style="width: 100%"
                v-model="form.orderNum"
                placeholder="请输入显示顺序"
                controls-position="right"
                :min="0"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input
                v-model="form.remark"
                type="textarea"
                placeholder="请输入备注"
                maxlength="256"
                show-word-limit
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
  </div>
</template>

<script setup name="ModelClassify">
import { ref, reactive, toRefs, nextTick, getCurrentInstance } from "vue";
import {
  listClassify,
  getClassify,
  delClassify,
  addClassify,
  updateClassify,
} from "@/api/modelReconstitution/classify";
import { parseTime } from "@/utils/anivia.js";
import { ElMessage, ElMessageBox } from "element-plus";

const { proxy } = getCurrentInstance();

const classifyList = ref([]);

// 列显隐信息
const columns = ref([
  { key: 1, label: "分类名称", visible: true },
  { key: 2, label: "显示顺序", visible: true },
  { key: 3, label: "备注", visible: true },
  { key: 4, label: "创建人", visible: true },
  { key: 5, label: "创建时间", visible: true },
  { key: 6, label: "操作", visible: true },
]);

const getColumnVisibility = (key) => {
  const column = columns.value.find((col) => col.key === key);
  if (!column) return true;
  return column.visible;
};

const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);
const title = ref("");
const categoryOptions = ref([]);
const refreshTable = ref(true);
const isExpandAll = ref(true);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    parentId: null,
    name: null,
  },
  rules: {
    name: [{ required: true, message: "分类名称不能为空", trigger: "blur" }],
    orderNum: [
      { required: true, message: "显示顺序不能为空", trigger: "blur" },
      { type: "number", message: "显示顺序必须为数字", trigger: "blur" },
    ],
  },
});

const { queryParams, form, rules } = toRefs(data);

/** 查询模型分类列表 */
function getList() {
  loading.value = true;
  listClassify(queryParams.value).then((response) => {
    classifyList.value = proxy.handleTree(response.data, "id", "parentId");
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    companyId: null,
    parentId: null,
    ancestors: null,
    name: null,
    orderNum: 0,
    validFlag: null,
    delFlag: null,
    createBy: null,
    creatorId: null,
    createTime: null,
    updateBy: null,
    updatorId: null,
    updateTime: null,
    remark: null,
  };
  if (proxy.$refs.classifyRef) {
    proxy.$refs.classifyRef.resetFields();
  }
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

/** 新增按钮操作 */
function handleAdd(row) {
  reset();
  listClassify().then((response) => {
    categoryOptions.value = [];
    const top = { id: 0, name: "顶级节点", children: [] };
    top.children = proxy.handleTree(response.data, "id", "parentId");
    categoryOptions.value.push(top);
  });
  if (row) {
    form.value.parentId = row.id;
  }
  open.value = true;
  title.value = "新增模型分类";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  listClassify().then((response) => {
    categoryOptions.value = [];
    const top = { id: 0, name: "顶级节点", children: [] };
    top.children = proxy.handleTree(response.data, "id", "parentId");
    categoryOptions.value.push(top);
  });
  const _id = row.id;
  getClassify(_id).then((response) => {
    form.value = response.data;
    if (form.value.orderNum == null) {
      form.value.orderNum = 0;
    }
    open.value = true;
    title.value = "修改模型分类";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["classifyRef"].validate((valid) => {
    if (valid) {
      if (form.value.parentId == null) {
        form.value.parentId = 0;
      }
      if (form.value.id != null) {
        updateClassify(form.value).then(() => {
          ElMessage.success("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addClassify(form.value).then(() => {
          ElMessage.success("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const name = row.name;

  // 先检查是否存在子分类
  listClassify({ parentId: row.id }).then((res) => {
    console.log(res,'res11111')
    if (res.data && res.data.length > 0) {
      ElMessage.warning("该分类下存有子分类，不可删除");
      return;
    }
    ElMessageBox.confirm(
      '是否确认删除模型分类名称为"' + name + '"的数据项？',
      "警告",
      {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }
    )
      .then(() => delClassify(row.id))
      .then(() => {
        getList();
        ElMessage.success("删除成功");
      })
      .catch(() => {});
  });
}

/** 展开/折叠操作 */
function toggleExpandAll() {
  refreshTable.value = false;
  isExpandAll.value = !isExpandAll.value;
  nextTick(() => {
    refreshTable.value = true;
  });
}

getList();
</script>
<style lang="scss" scoped>
  .toggle-expand-all {
    .svg-icon {
      font-size: 12px;
      margin-right: 6px;
    }
  }
</style>
