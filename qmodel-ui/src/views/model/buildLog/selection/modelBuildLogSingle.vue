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
  <el-dialog
      title="构建日志-单选"
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
      <el-form-item label="模型文件id" prop="resourceId">
        <el-input
            style="width:240px"
            v-model="queryParams.resourceId"
            placeholder="请输入模型文件id"
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
      <el-form-item label="模型名称" prop="modelName">
        <el-input
            style="width:240px"
            v-model="queryParams.modelName"
            placeholder="请输入模型名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版本id" prop="versionId">
        <el-input
            style="width:240px"
            v-model="queryParams.versionId"
            placeholder="请输入版本id"
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
      <el-form-item label="执行耗时" prop="duration">
        <el-input
            style="width:240px"
            v-model="queryParams.duration"
            placeholder="请输入执行耗时"
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
      <el-table-column label="模型文件id" align="center" prop="resourceId">
        <template #default="scope">
          {{ scope.row.resourceId || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="模型id" align="center" prop="modelId">
        <template #default="scope">
          {{ scope.row.modelId || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="模型名称" align="center" prop="modelName">
        <template #default="scope">
          {{ scope.row.modelName || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="版本id" align="center" prop="versionId">
        <template #default="scope">
          {{ scope.row.versionId || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="构建类型" align="center" prop="buildType">
        <template #default="scope">
          {{ scope.row.buildType || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="构建状态" align="center" prop="status">
        <template #default="scope">
          {{ scope.row.status || '-' }}
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
      <el-table-column label="执行耗时" align="center" prop="duration">
        <template #default="scope">
          {{ scope.row.duration || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="已存在的依赖包列表JSON" align="center" prop="installedPackages">
        <template #default="scope">
          {{ scope.row.installedPackages || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="缺失失败的依赖包列表JSON" align="center" prop="missingPackages">
        <template #default="scope">
          {{ scope.row.missingPackages || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="安装失败的依赖包列表JSON" align="center" prop="failedPackages">
        <template #default="scope">
          {{ scope.row.failedPackages || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="dockerFile内容" align="center" prop="dockerfileContent">
        <template #default="scope">
          {{ scope.row.dockerfileContent || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="构建日志" align="center" prop="buildLog">
        <template #default="scope">
          {{ scope.row.buildLog || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="错误日志" align="center" prop="errorMessage">
        <template #default="scope">
          {{ scope.row.errorMessage || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="requirements.txt 内容" align="center" prop="requirements">
        <template #default="scope">
          {{ scope.row.requirements || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="createBy">
        <template #default="scope">
          {{ scope.row.createBy || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark">
        <template #default="scope">
          {{ scope.row.remark || '-' }}
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

<script setup name="ModelBuildLogSingle">
  import { listModelBuildLog } from "@/api/model/buildLog/modelBuildLog";
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
      resourceId: null,
      modelId: null,
      modelName: null,
      versionId: null,
      buildType: null,
      status: null,
      startTime: null,
      endTime: null,
      duration: null,
      installedPackages: null,
      missingPackages: null,
      failedPackages: null,
      dockerfileContent: null,
      buildLog: null,
      errorMessage: null,
      requirements: null,
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
    listModelBuildLog(proxy.addDateRange(queryParams.value, daterangeCreateTime.value)).then(
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
