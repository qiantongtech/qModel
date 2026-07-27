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
  <el-dialog
      title="模型计算任务-单选"
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
      <el-form-item label="租户/公司ID" prop="companyId">
        <el-input
            style="width:240px"
            v-model="queryParams.companyId"
            placeholder="请输入租户/公司ID"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="计算编码" prop="code">
        <el-input
            style="width:240px"
            v-model="queryParams.code"
            placeholder="请输入计算编码"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任务名称" prop="name">
        <el-input
            style="width:240px"
            v-model="queryParams.name"
            placeholder="请输入任务名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模型分类ID" prop="classifyId">
        <el-input
            style="width:240px"
            v-model="queryParams.classifyId"
            placeholder="请输入模型分类ID"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模型分类名称" prop="classifyName">
        <el-input
            style="width:240px"
            v-model="queryParams.classifyName"
            placeholder="请输入模型分类名称"
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
      <el-form-item label="模型名称" prop="modelName">
        <el-input
            style="width:240px"
            v-model="queryParams.modelName"
            placeholder="请输入模型名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模型版本号" prop="modelVersion">
        <el-input
            style="width:240px"
            v-model="queryParams.modelVersion"
            placeholder="请输入模型版本号"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模型版本ID" prop="modelVersionId">
        <el-input
            style="width:240px"
            v-model="queryParams.modelVersionId"
            placeholder="请输入模型版本ID"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开始时间" prop="startTime">
        <el-date-picker style="width:240px"
                        clearable
                        v-model="queryParams.startTime"
                        type="date"
                        value-format="YYYY-MM-DD"
                        placeholder="请选择开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结束时间" prop="endTime">
        <el-date-picker style="width:240px"
                        clearable
                        v-model="queryParams.endTime"
                        type="date"
                        value-format="YYYY-MM-DD"
                        placeholder="请选择结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="耗时(毫秒)" prop="duration">
        <el-input
            style="width:240px"
            v-model="queryParams.duration"
            placeholder="请输入耗时(毫秒)"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中" prop="status">
        <el-select style="width:240px" v-model="queryParams.status" placeholder="请选择计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中" clearable>
          <el-option
              v-for="dict in ${dictType}"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="超时时间(秒)" prop="timeoutSeconds">
        <el-input
            style="width:240px"
            v-model="queryParams.timeoutSeconds"
            placeholder="请输入超时时间(秒)"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="已重试次数" prop="retryCount">
        <el-input
            style="width:240px"
            v-model="queryParams.retryCount"
            placeholder="请输入已重试次数"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="最大重试次数" prop="maxRetryCount">
        <el-input
            style="width:240px"
            v-model="queryParams.maxRetryCount"
            placeholder="请输入最大重试次数"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优先级:1-高,2-中,3-低" prop="priority">
        <el-input
            style="width:240px"
            v-model="queryParams.priority"
            placeholder="请输入优先级:1-高,2-中,3-低"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件或接口资源ID" prop="resourceId">
        <el-input
            style="width:240px"
            v-model="queryParams.resourceId"
            placeholder="请输入文件或接口资源ID"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="接入方式: 0-API接口, 1-Python本地" prop="calcType">
        <el-select style="width:240px" v-model="queryParams.calcType" placeholder="请选择接入方式: 0-API接口, 1-Python本地" clearable>
          <el-option
              v-for="dict in ${dictType}"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
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
        ref="tableRef"
        stripe
        height="300px"
        v-loading="loading"
        :data="dataList"
        highlight-current-row
        row-key="id"
        @current-change="handleCurrentChange"
    >
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="租户/公司ID" align="center" prop="companyId">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.companyId"/>
        </template>
      </el-table-column>
      <el-table-column label="计算编码" align="center" prop="code">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.code"/>
        </template>
      </el-table-column>
      <el-table-column label="任务名称" align="center" prop="name">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.name"/>
        </template>
      </el-table-column>
      <el-table-column label="模型分类ID" align="center" prop="classifyId">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.classifyId"/>
        </template>
      </el-table-column>
      <el-table-column label="模型分类名称" align="center" prop="classifyName">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.classifyName"/>
        </template>
      </el-table-column>
      <el-table-column label="关联模型ID" align="center" prop="modelId">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.modelId"/>
        </template>
      </el-table-column>
      <el-table-column label="模型名称" align="center" prop="modelName">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.modelName"/>
        </template>
      </el-table-column>
      <el-table-column label="模型版本号" align="center" prop="modelVersion">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.modelVersion"/>
        </template>
      </el-table-column>
      <el-table-column label="模型版本ID" align="center" prop="modelVersionId">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.modelVersionId"/>
        </template>
      </el-table-column>
      <el-table-column label="描述" align="center" prop="description">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.description"/>
        </template>
      </el-table-column>
      <el-table-column label="输入参数(JSON格式)" align="center" prop="inputParams">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.inputParams"/>
        </template>
      </el-table-column>
      <el-table-column label="输出结果(JSON格式)" align="center" prop="outputResult">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.outputResult"/>
        </template>
      </el-table-column>
      <el-table-column label="开始时间" align="center" prop="startTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="耗时(毫秒)" align="center" prop="duration">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.duration"/>
        </template>
      </el-table-column>
      <el-table-column label="计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中" align="center" prop="status">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="超时时间(秒)" align="center" prop="timeoutSeconds">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.timeoutSeconds"/>
        </template>
      </el-table-column>
      <el-table-column label="已重试次数" align="center" prop="retryCount">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.retryCount"/>
        </template>
      </el-table-column>
      <el-table-column label="最大重试次数" align="center" prop="maxRetryCount">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.maxRetryCount"/>
        </template>
      </el-table-column>
      <el-table-column label="优先级:1-高,2-中,3-低" align="center" prop="priority">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.priority"/>
        </template>
      </el-table-column>
      <el-table-column label="错误信息" align="center" prop="errorMessage">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.errorMessage"/>
        </template>
      </el-table-column>
      <el-table-column label="文件或接口资源ID" align="center" prop="resourceId">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.resourceId"/>
        </template>
      </el-table-column>
      <el-table-column label="接入方式: 0-API接口, 1-Python本地" align="center" prop="calcType">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.calcType"/>
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="createBy">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.createBy"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.remark"/>
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

<script setup name="CalcSingle">
  import { listCalc } from "@/api/model/Calc/calc";
  import { ref } from "vue";
  const { proxy } = getCurrentInstance();


  const dataList = ref([]);
  const loading = ref(true);
  const showSearch = ref(true);
  const total = ref(0);
  const data = reactive({
    form: {},
    queryParams: {
      pageNum: 1,
      pageSize: 10,
      companyId: null,
      code: null,
      name: null,
      classifyId: null,
      classifyName: null,
      modelId: null,
      modelName: null,
      modelVersion: null,
      modelVersionId: null,
      description: null,
      inputParams: null,
      outputResult: null,
      startTime: null,
      endTime: null,
      duration: null,
      status: null,
      timeoutSeconds: null,
      retryCount: null,
      maxRetryCount: null,
      priority: null,
      errorMessage: null,
      resourceId: null,
      calcType: null,
      createTime: null,
    }
  });
  const { queryParams, form} = toRefs(data);

  // -------------------------------------------
  const visible = ref(false);
  // 定义单选数据
  const single = ref();
  // 当前界面table
  const tableRef = ref();

  const emit = defineEmits(["open", "confirm", "cancel"]);

  /** 单选选中事件 */
  function handleCurrentChange(selection) {
    if (selection) {
      single.value = selection;
    }
  }

  /**
   * 设置当前行
   * @param {Object} row 行对象
   * @returns 更改选中对象
   */
  function setCurrentRow(row) {
    if (row) {
      let data = dataList.value.filter((item) => item.id == row.id);
      tableRef.value?.setCurrentRow(data[0]);
    }
  }

  /**
   * 打开选择框
   * @param {Array} val 选中的对象数组
   */
  function open(val) {
    visible.value = true;
    single.value = val;
    resetQuery();
    getList();
  }

  /**
   * 取消按钮
   * @description 取消按钮时，重置所有状态
   */
  function cancel() {
    queryParams.value.pageNum = 1;
    proxy.resetForm("queryRef");
    visible.value = false;
  }

  /**
   * 确定按钮
   * @description 确定按钮时，emit confirm 事件，以便父组件接收到选中的数据
   */
  function confirm() {
    if (!single.value) {
      proxy.$modal.msgWarning("请选择数据！");
      return;
    }
    emit("confirm", single.value);
    visible.value = false;
  }

  /** 查询字典类型列表 */
  function getList() {
    loading.value = true;
    listCalc(proxy.addDateRange(queryParams.value, daterangeCreateTime.value)).then(
        async (response) => {
          dataList.value = response.data.rows;
          total.value = response.data.total;
          loading.value = false;
          // 初始化及分页切换选中逻辑
          await nextTick();
          setCurrentRow(single.value);
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
