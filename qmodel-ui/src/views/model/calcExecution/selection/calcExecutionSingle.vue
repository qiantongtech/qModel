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
      title="模型计算执行记录-单选"
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
      <el-form-item label="计算任务ID" prop="calcId">
        <el-input
            style="width:240px"
            v-model="queryParams.calcId"
            placeholder="请输入计算任务ID"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模型id" prop="modelId">
        <el-input
            style="width:240px"
            v-model="queryParams.modelId"
            placeholder="请输入模型id"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="执行批次号" prop="executionNo">
        <el-input
            style="width:240px"
            v-model="queryParams.executionNo"
            placeholder="请输入执行批次号"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="执行模式：1-手动触发 2-定时调度 3-重试执行" prop="executionMode">
        <el-input
            style="width:240px"
            v-model="queryParams.executionMode"
            placeholder="请输入执行模式：1-手动触发 2-定时调度 3-重试执行"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中" prop="status">
        <el-select style="width:240px" v-model="queryParams.status" placeholder="请选择执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中" clearable>
          <el-option
              v-for="dict in ${dictType}"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
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
      <el-form-item label="当前重试次数" prop="retryCount">
        <el-input
            style="width:240px"
            v-model="queryParams.retryCount"
            placeholder="请输入当前重试次数"
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
      <el-table-column label="计算任务ID" align="center" prop="calcId">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.calcId"/>
        </template>
      </el-table-column>
      <el-table-column label="模型id" align="center" prop="modelId">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.modelId"/>
        </template>
      </el-table-column>
      <el-table-column label="执行批次号" align="center" prop="executionNo">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.executionNo"/>
        </template>
      </el-table-column>
      <el-table-column label="执行模式：1-手动触发 2-定时调度 3-重试执行" align="center" prop="executionMode">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.executionMode"/>
        </template>
      </el-table-column>
      <el-table-column label="执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中" align="center" prop="status">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.status"/>
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
      <el-table-column label="输入参数快照(JSON，记录执行时的实际参数)" align="center" prop="inputParams">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.inputParams"/>
        </template>
      </el-table-column>
      <el-table-column label="输出结果(JSON)" align="center" prop="outputResult">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.outputResult"/>
        </template>
      </el-table-column>
      <el-table-column label="执行日志" align="center" prop="executionLog">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.executionLog"/>
        </template>
      </el-table-column>
      <el-table-column label="错误信息" align="center" prop="errorMessage">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.errorMessage"/>
        </template>
      </el-table-column>
      <el-table-column label="当前重试次数" align="center" prop="retryCount">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.retryCount"/>
        </template>
      </el-table-column>
      <el-table-column label="资源使用情况(JSON，如CPU、内存、GPU使用)" align="center" prop="resourceUsage">
        <template #default="scope">
              <dict-tag :options="${column.dictType}" :value="scope.row.resourceUsage"/>
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

<script setup name="CalcExecutionSingle">
  import { listCalcExecution } from "@/api/model/calcExecution/calcExecution";
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
    listCalcExecution(proxy.addDateRange(queryParams.value, daterangeCreateTime.value)).then(
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
