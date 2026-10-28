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
  <el-dialog
      title="模型数据API接入-多选"
      v-model="visible"
      width="1200px"
      :append-to="$refs['app-container']"
      draggable
      destroy-on-close
      @close="cancel"
  >
    <el-form
        class="btn-style"
        :model="queryParams"
        ref="queryRef"
        :inline="true"
        v-show="showSearch"
        label-width="68px"
    >
      <el-form-item label="API数据名称" prop="name">
        <el-input
            style="width:240px"
            v-model="queryParams.name"
            placeholder="请输入API数据名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联模型ID" prop="modelId">
        <el-input
            style="width:240px"
            v-model="queryParams.modelId"
            placeholder="请输入关联模型ID"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="API类型" prop="apiType">
        <el-select style="width:240px" v-model="queryParams.apiType" placeholder="请选择API类型" clearable>
          <el-option
              v-for="dict in model_data_api_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="请求方式" prop="requestMethod">
        <el-select style="width:240px" v-model="queryParams.requestMethod" placeholder="请选择请求方式" clearable>
          <el-option
              v-for="dict in requestMethodOptions"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="内容类型" prop="contentType">
        <el-select style="width:240px" v-model="queryParams.contentType" placeholder="请选择内容类型" clearable>
          <el-option
              v-for="dict in content_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="鉴权类型" prop="authType">
        <el-select style="width:240px" v-model="queryParams.authType" placeholder="请选择鉴权类型" clearable>
          <el-option
              v-for="dict in auth_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="鉴权方式：apiKey、bearer" prop="authMethod">
        <el-input
            style="width:240px"
            v-model="queryParams.authMethod"
            placeholder="请输入鉴权方式：apiKey、bearer"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="注入位置：header、query" prop="authInjectPos">
        <el-input
            style="width:240px"
            v-model="queryParams.authInjectPos"
            placeholder="请输入注入位置：header、query"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="鉴权键名" prop="authKeyName">
        <el-input
            style="width:240px"
            v-model="queryParams.authKeyName"
            placeholder="请输入鉴权键名"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Token前缀" prop="authTokenPrefix">
        <el-input
            style="width:240px"
            v-model="queryParams.authTokenPrefix"
            placeholder="请输入Token前缀"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="动态获取Token方式" prop="authDynMethod">
        <el-input
            style="width:240px"
            v-model="queryParams.authDynMethod"
            placeholder="请输入动态获取Token方式"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Token提取路径(JSONPath)" prop="authExtractPath">
        <el-input
            style="width:240px"
            v-model="queryParams.authExtractPath"
            placeholder="请输入Token提取路径(JSONPath)"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-date-picker style="width:240px"
                        clearable
                        v-model="queryParams.createTime"
                        type="date"
                        value-format="YYYY-MM-DD"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="更新人ID" prop="updaterId">
        <el-input
            style="width:240px"
            v-model="queryParams.updaterId"
            placeholder="请输入更新人ID"
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

    <el-table
        ref="multipletableRef"
        stripe
        height="300px"
        v-loading="loading"
        :data="dataList"
        reserve-selection
        row-key="id"
        :default-sort="{ prop: 'createTime', order: 'descending' }"
        @selection-change="handleSelectionChange"
        @row-click="handleRowClick"
        @sort-change="handleSortChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" sortable="custom" :sort-orders="['descending', 'ascending']" />
      <el-table-column label="API数据名称" align="center" prop="name" />
      <el-table-column label="关联模型ID" align="center" prop="modelId" />
      <el-table-column label="API类型" align="center" prop="apiType">
        <template #default="scope">
          <dict-tag :options="model_data_api_type" :value="scope.row.apiType"/>
        </template>
      </el-table-column>
      <el-table-column label="接口地址" align="center" prop="apiUrl" :show-overflow-tooltip="true" />
      <el-table-column label="请求方式" align="center" prop="requestMethod">
        <template #default="scope">
          <dict-tag :options="requestMethodOptions" :value="scope.row.requestMethod"/>
        </template>
      </el-table-column>
      <el-table-column label="内容类型" align="center" prop="contentType">
        <template #default="scope">
          <dict-tag :options="content_type" :value="scope.row.contentType"/>
        </template>
      </el-table-column>
      <el-table-column label="超时时间(秒)" align="center" prop="timeoutSeconds" />
      <el-table-column label="鉴权类型" align="center" prop="authType">
        <template #default="scope">
          <dict-tag :options="auth_type" :value="scope.row.authType"/>
        </template>
      </el-table-column>
      <el-table-column label="鉴权方式" align="center" prop="authMethod" />
      <el-table-column label="注入位置" align="center" prop="authInjectPos" />
      <el-table-column label="鉴权键名" align="center" prop="authKeyName" />
      <el-table-column label="Token前缀" align="center" prop="authTokenPrefix" />
      <el-table-column label="固定Token值" align="center" prop="authTokenValue" />
      <el-table-column label="动态获取方式" align="center" prop="authDynMethod" />
      <el-table-column label="动态获取地址" align="center" prop="authDynUrl" />
      <el-table-column label="动态获取请求头" align="center" prop="authDynHeaders" />
      <el-table-column label="动态获取参数" align="center" prop="authDynParams" />
      <el-table-column label="动态获取体" align="center" prop="authDynBody" />
      <el-table-column label="Token提取路径" align="center" prop="authExtractPath" />
      <el-table-column label="请求参数模板" align="center" prop="requestTemplate" />
      <el-table-column label="批量请求参数" align="center" prop="batchParams" />
      <el-table-column label="入参Schema" align="center" prop="inputSchema" />
      <el-table-column label="出参Schema" align="center" prop="outputSchema" />
      <el-table-column label="描述" align="center" prop="description" />
      <el-table-column label="创建人" align="center" prop="createBy" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180" sortable="custom" :sort-orders="['descending', 'ascending']">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新人ID" align="center" prop="updaterId" />
      <el-table-column label="备注" align="center" prop="remark" />
    </el-table>

    <pagination
        v-show="total > 0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />
    <template #footer>
      <div class="dialog-footer">
        <el-button size="mini" @click="cancel">取 消</el-button>
        <el-button type="primary" size="mini" @click="confirm">
          确 定
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup name="ModelDataApiMultiple">
  import { listModelDataApi } from "@/api/model/modelData/modelDataApi";
  import { ref, reactive, toRefs, computed, getCurrentInstance, nextTick } from "vue";
  import { parseTime } from "@/utils/anivia.js";

  const { proxy } = getCurrentInstance();

  // 字典数据
  const { model_data_api_type, model_access_mode, content_type, auth_type } = proxy.useDict(
    "model_data_api_type",
    "model_access_mode",
    "content_type",
    "auth_type"
  );

  // 请求方式转换
const requestMethodOptions = computed(() => {
  if (model_access_mode.value?.length) return model_access_mode.value;
  return [
    { label: 'GET', value: 'GET' },
    { label: 'POST', value: 'POST' },
    { label: 'PUT', value: 'PUT' },
    { label: 'DELETE', value: 'DELETE' }
  ];
});


  const dataList = ref([]);
  const loading = ref(true);
  const showSearch = ref(true);
  const total = ref(0);
  const dateRange = ref([]);
  const data = reactive({
    form: {},
    queryParams: {
      pageNum: 1,
      pageSize: 10,
      name: null,
      modelId: null,
      apiType: null,
      apiUrl: null,
      requestMethod: null,
      contentType: null,
      timeoutSeconds: null,
      authType: null,
      authMethod: null,
      authInjectPos: null,
      authKeyName: null,
      authTokenPrefix: null,
      authTokenValue: null,
      authDynMethod: null,
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
      createTime: null,
      updaterId: null,
      orderByColumn: 'createTime',
      isAsc: 'desc'
    }
  });
  const { queryParams, form } = toRefs(data);

  // -------------------------------------------
  const visible = ref(false);
  // 定义多选数据
  const multiple = ref([]);
  // 定义上次勾选数据==用于对比删除
  const oldSelection = ref([]);
  // 是否分页切换
  const isAuto = ref(false);
  // 当前界面table
  const multipletableRef = ref();

  const emit = defineEmits(["open", "confirm", "cancel"]);

  /** 多选框选中事件 */
  function handleSelectionChange(selection) {
    // console.log(selection, "===handleSelectionChange");
    if (selection.length > 0) {
      // 如果选中值不是空值且少选了一个值
      if (oldSelection.value.length > selection.length) {
        oldSelection.value.forEach((item) => {
          let index = selection.findIndex((ece) => ece.id == item.id);
          if (index == -1) {
            multiple.value = multiple.value.filter(
                (ece) => item.id != ece.id
            );
          }
        });
      }
      if (multiple.value.length > 0) {
        selection.forEach((item) => {
          let index = multiple.value.findIndex(
              (ece) => ece.id == item.id
          );
          if (index == -1) {
            multiple.value.push(item);
          }
        });
      } else {
        multiple.value.push(...selection);
      }
    } else {
      // 如果不是分页导致的
      if (!isAuto.value) {
        // 如果选中值，取消到没有选择任何值
        oldSelection.value.forEach((item) => {
          let index = selection.findIndex((ece) => ece.id == item.id);
          if (index == -1) {
            multiple.value = multiple.value.filter(
                (ece) => item.id != ece.id
            );
          }
        });
      }
    }
    oldSelection.value = selection;
  }

  /** 行单机事件 */
  function handleRowClick(row) {
    // 检查当前行是否已经在 multiple 中
    const index = multiple.value.findIndex(item => item.id === row.id);

    // 如果行已经被选中，移除它
    if (index > -1) {
      multiple.value = multiple.value.filter(item => item.id !== row.id);
    } else {
      // 如果行未被选中，添加到 multiple 中
      multiple.value.push(row);
    }

    // 同步更新表格的选中状态
    multipletableRef.value.toggleRowSelection(row, index === -1);
  }

  /**
   * 选中table的复选框
   * @param {Array} rows 选中的对象数组
   * @param {Boolean} ignoreSelectable 是否忽略可选
   */
  function setSelectionRow(rows, ignoreSelectable) {
    // 选中数据
    if (rows.length > 0) {
      rows.forEach((row) => {
        let data = dataList.value.filter((item) => item.id == row.id);
        if (data.length > 0) {
          multipletableRef.value.toggleRowSelection(data[0], undefined, ignoreSelectable);
        }
      });
    }
  }

  function rest(){
    queryParams.value.pageNum = 1;
    proxy.resetForm("queryRef");
    oldSelection.value = []
  }

  /**
   * 打开选择框
   * @param {Array} val 选中的对象数组
   */
  function open(val) {
    if (!Array.isArray(val)) {
      val = [val];  // 将非可迭代值转化为数组
    }
    visible.value = true;
    multiple.value = [...val];
    getList();
  }

  /**
   * 取消按钮
   * @description 取消按钮时，重置所有状态
   */
  function cancel() {
    rest();
    visible.value = false;
  }

  /**
   * 确定按钮
   * @description 确定按钮时，emit confirm 事件，以便父组件接收到选中的数据
   */
  function confirm() {
    if (multiple.value.length == 0) {
      proxy.$modal.msgWarning("未选择数据！");
      return;
    }
    emit("confirm", [...multiple.value]);
    rest();
    visible.value = false;
  }

  /** 查询字典类型列表 */
  function getList() {
    loading.value = true;
    listModelDataApi(proxy.addDateRange(queryParams.value, dateRange.value)).then(
        async (response) => {
          dataList.value = response.data.rows;
          total.value = response.data.total;
          loading.value = false;
          // 初始化及分页切换选中逻辑
          isAuto.value = true;
          await nextTick();
          setSelectionRow(multiple.value);
          isAuto.value = false;
        }
    );
  }

  /** 搜索按钮操作 */
  function handleQuery() {
    getList();
  }

  /** 重置按钮操作 */
  function resetQuery() {
    proxy.resetForm("queryRef");
    queryParams.value.pageNum = 1;
    handleQuery();
  }

  defineExpose({ open });
</script>