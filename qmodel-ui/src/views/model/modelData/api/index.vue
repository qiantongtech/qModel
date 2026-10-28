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
      <el-form class="btn-style" :model="queryParams" ref="queryRef" :inline="true" label-width="80px" v-show="showSearch" @submit.prevent>
        <el-form-item label="API名称" prop="name">
          <el-input
            class="el-form-input-width"
            v-model="queryParams.name"
            placeholder="请输入API数据名称"
            clearable
            @keyup.enter="handleQuery"
          />
        </el-form-item>

        <el-form-item label="请求方式" prop="requestMethod">
          <el-select class="el-form-input-width" v-model="queryParams.requestMethod" placeholder="请选择请求方式" clearable>
            <el-option
              v-for="dict in requestMethodOptions"
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
        <el-row :gutter="15" class="btn-style">
          <el-col :span="1.5">
            <el-button type="primary" plain @click="handleAdd" v-hasPermi="['model:modelData:dataapi:add']"
                       @mousedown="(e) => e.preventDefault()">
              <i class="iconfont-mini icon-xinzeng mr5"></i>新增
            </el-button>
          </el-col>
        </el-row>
        <div class="justify-end top-right-btn">
          <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </div>
      </div>
      <el-table stripe v-loading="loading" :data="modelDataApiList" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
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
          label="API名称"
          align="left"
          prop="name"
          :show-overflow-tooltip="{ effect: 'light' }"
          min-width="200"
        />



        <el-table-column
          v-if="getColumnVisibility(3)"
          label="请求地址"
          align="left"
          prop="apiUrl"
          :show-overflow-tooltip="{ effect: 'light' }"
          min-width="220"
        />

        <el-table-column v-if="getColumnVisibility(2)" label="请求方式" align="center" prop="requestMethod" width="100">
          <template #default="scope">
            <dict-tag :options="requestMethodOptions" :value="scope.row.requestMethod"/>
          </template>
        </el-table-column>

        <el-table-column
          v-if="getColumnVisibility(3)"
          label="备注"
          align="left"
          prop="remark"
          :show-overflow-tooltip="{ effect: 'light' }"
          min-width="220"
        />

        <el-table-column v-if="getColumnVisibility(4)" label="创建人" align="center" prop="createBy" width="100" />

        <el-table-column
          v-if="getColumnVisibility(5)"
          label="创建时间"
          align="center"
          prop="createTime"
          width="160"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
        >
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="180">
          <template #default="scope">
            <el-button link type="primary" icon="View" @click="handleDetail(scope.row)"
                       v-hasPermi="['model:modelData:dataapi:query']">详情</el-button>
            <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                       v-hasPermi="['model:modelData:dataapi:edit']">修改</el-button>
            <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)"
                       v-hasPermi="['model:modelData:dataapi:remove']">删除</el-button>

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
        v-show="total>0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
      />
    </div>

    <!-- 详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to-body="true" draggable>
      <el-form :model="form" label-width="120px" class="detail-form">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="API名称">
              <div class="form-readonly">{{ form.name }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="关联模型">
              <div class="form-readonly">{{ form.modelId }}</div>
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="请求方式">
              <dict-tag :options="requestMethodOptions" :value="form.requestMethod"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="接口地址">
              <div class="form-readonly">{{ form.apiUrl }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="超时时间">
              <div class="form-readonly">{{ form.timeoutSeconds }} 秒</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="鉴权类型">
              <dict-tag :options="auth_type" :value="form.authType"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="描述">
              <div class="form-readonly textarea">{{ form.description || '-' }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="参数模板">
              <div class="form-readonly textarea code">{{ form.requestTemplate || '-' }}</div>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="openDetail = false">关 闭</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" v-model="upload.open" width="400px" :append-to-body="true" draggable>
      <el-upload
        ref="uploadRef"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <el-icon class="el-icon--upload"><upload-filled /></el-icon>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <template #tip>
          <div class="el-upload__tip text-center">
            <div class="el-upload__tip">
              <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的数据
            </div>
            <span>仅允许导入xls、xlsx格式文件。</span>
            <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;" @click="importTemplate">下载模板</el-link>
          </div>
        </template>
      </el-upload>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="upload.open = false">取 消</el-button>
          <el-button type="primary" @click="submitFileForm">确 定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="ModelDataApi">
import { ref, reactive, toRefs, computed, getCurrentInstance } from 'vue';
import { useRouter } from 'vue-router';
import { listModelDataApi, getModelDataApi, delModelDataApi, addModelDataApi, updateModelDataApi } from "@/api/model/modelData/modelDataApi";
import { getToken } from "@/utils/auth.js";
import { parseTime } from "@/utils/anivia.js";
import { Edit, Delete, View, UploadFilled } from '@element-plus/icons-vue';

const { proxy } = getCurrentInstance();
const router = useRouter();

const modelDataApiList = ref([]);
const openDetail = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const defaultSort = ref({ prop: "createTime", order: "descending" });

// 字典数据
const { model_data_api_type, model_access_mode, content_type, auth_type } = proxy.useDict(
  "model_data_api_type",
  "model_access_mode",
  "content_type",
  "auth_type"
);

// 请求方式转换，与新增页面保持一致
const requestMethodOptions = computed(() => {
  if (model_access_mode.value?.length) return model_access_mode.value;
  return [
    { label: 'GET', value: 'GET' },
    { label: 'POST', value: 'POST' },
    { label: 'PUT', value: 'PUT' },
    { label: 'DELETE', value: 'DELETE' }
  ];
});

// 列显隐信息
const columns = ref([
  { key: 0, label: "编号", visible: true },
  { key: 1, label: "API名称", visible: true },
  { key: 2, label: "请求方式", visible: true },
  { key: 3, label: "备注", visible: true },
  { key: 4, label: "创建人", visible: true },
  { key: 5, label: "创建时间", visible: true }
]);

const getColumnVisibility = (key) => {
  const column = columns.value.find(col => col.key === key);
  return column ? column.visible : true;
};

/*** 用户导入参数 */
const upload = reactive({
  open: false,
  title: "",
  isUploading: false,
  updateSupport: 0,
  headers: { Authorization: "Bearer " + getToken() },
  url: import.meta.env.VITE_APP_BASE_API + "/model/modelDataApi/importData"
});

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: null,
    modelId: null,
    apiType: null,
    requestMethod: null,
    authType: null,
    orderByColumn: 'createTime',
    isAsc: 'desc'
  }
});

const { queryParams, form } = toRefs(data);

/** 查询列表 */
function getList() {
  loading.value = true;
  listModelDataApi(queryParams.value).then(response => {
    modelDataApiList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    name: null,
    modelId: null,
    apiType: null,
    apiUrl: null,
    requestMethod: '1',
    contentType: 'application/json',
    timeoutSeconds: 30,
    authType: 'none',
    authMethod: null,
    authInjectPos: 'header',
    authKeyName: null,
    authTokenPrefix: null,
    authTokenValue: null,
    authDynMethod: 'POST',
    authDynUrl: null,
    authDynHeaders: null,
    authDynParams: null,
    authDynBody: null,
    authExtractPath: null,
    requestTemplate: null,
    batchParams: null,
    inputSchema: null,
    outputSchema: null,
    description: null,
    remark: null
  };
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
function handleSortChange(column) {
  queryParams.value.orderByColumn = column.prop;
  queryParams.value.isAsc = column.order === "ascending" ? "asc" : "desc";
  getList();
}

/** 新增按钮操作 */
function handleAdd() {
  router.push('/data/api/add');
}

/** 修改按钮操作 */
function handleUpdate(row) {
  const _id = row.id || ids.value[0];
  router.push('/data/api/edit?id=' + _id);
}

/** 详情按钮操作 */
function handleDetail(row) {
  const _id = row.id || ids.value[0];
  router.push('/data/api/detail?id=' + _id);
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除编号为"' + _ids + '"的数据项？').then(function() {
    return delModelDataApi(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('model/modelDataApi/export', {
    ...queryParams.value
  }, `model_api_${new Date().getTime()}.xlsx`)
}

/** 导入按钮操作 */
function handleImport() {
  upload.title = "数据导入";
  upload.open = true;
}

/** 下载模板操作 */
function importTemplate() {
  proxy.download("model/modelDataApi/importTemplate", {}, `model_api_template_${new Date().getTime()}.xlsx`)
}

/** 提交上传文件 */
function submitFileForm() {
  proxy.$refs["uploadRef"].submit();
}

const handleFileUploadProgress = () => {
  upload.isUploading = true;
};

const handleFileSuccess = (response) => {
  upload.open = false;
  upload.isUploading = false;
  proxy.$refs["uploadRef"].handleRemove();
  proxy.$alert("<div style='overflow: auto;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
  getList();
};

getList();
</script>

<style lang="scss" scoped>
.form-readonly {
  background-color: #f5f7fa;
  border-radius: 4px;
  padding: 0 15px;
  min-height: 32px;
  line-height: 32px;
  color: #606266;
  border: 1px solid #e4e7ed;

  &.textarea {
    line-height: 1.5;
    padding: 10px 15px;
    min-height: 60px;
    white-space: pre-wrap;
  }

  &.code {
    font-family: Consolas, Monaco, monospace;
    font-size: 12px;
  }
}

.detail-form {
  :deep(.el-form-item) {
    margin-bottom: 15px;
  }
}
</style>