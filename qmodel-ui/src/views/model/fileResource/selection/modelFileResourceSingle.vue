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
      title="模型文件部署-单选"
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
      <el-form-item label="原始上传文件名" prop="fileName">
        <el-input
            style="width:240px"
            v-model="queryParams.fileName"
            placeholder="请输入原始上传文件名"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="脚本名称(入口文件)" prop="scriptName">
        <el-input
            style="width:240px"
            v-model="queryParams.scriptName"
            placeholder="请输入脚本名称(入口文件)"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件存储地址" prop="filePath">
        <el-input
            style="width:240px"
            v-model="queryParams.filePath"
            placeholder="请输入文件存储地址"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="依赖文件路径" prop="depsFilePath">
        <el-input
            style="width:240px"
            v-model="queryParams.depsFilePath"
            placeholder="请输入依赖文件路径"
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
      <el-form-item label="文件大小MB" prop="fileSize">
        <el-input
            style="width:240px"
            v-model="queryParams.fileSize"
            placeholder="请输入文件大小MB"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="运行日志文件路径" prop="logFilePath">
        <el-input
            style="width:240px"
            v-model="queryParams.logFilePath"
            placeholder="请输入运行日志文件路径"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="请求超时秒数" prop="execTimeout">
        <el-input
            style="width:240px"
            v-model="queryParams.execTimeout"
            placeholder="请输入请求超时秒数"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="自动生成dockerFile文件地址" prop="dockerFilePath">
        <el-input
            style="width:240px"
            v-model="queryParams.dockerFilePath"
            placeholder="请输入自动生成dockerFile文件地址"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="构建镜像标签" prop="imageTag">
        <el-input
            style="width:240px"
            v-model="queryParams.imageTag"
            placeholder="请输入构建镜像标签"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="镜像版本" prop="imageVersion">
        <el-input
            style="width:240px"
            v-model="queryParams.imageVersion"
            placeholder="请输入镜像版本"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="镜像构建时间" prop="imageBuildTime">
        <el-input
            style="width:240px"
            v-model="queryParams.imageBuildTime"
            placeholder="请输入镜像构建时间"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="镜像构建日志文件地址" prop="imageBuildLog">
        <el-input
            style="width:240px"
            v-model="queryParams.imageBuildLog"
            placeholder="请输入镜像构建日志文件地址"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="容器暴露端口" prop="containerPorts">
        <el-input
            style="width:240px"
            v-model="queryParams.containerPorts"
            placeholder="请输入容器暴露端口"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="宿主机端口" prop="mappedHostPort">
        <el-input
            style="width:240px"
            v-model="queryParams.mappedHostPort"
            placeholder="请输入宿主机端口"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="容器id" prop="containerId">
        <el-input
            style="width:240px"
            v-model="queryParams.containerId"
            placeholder="请输入容器id"
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
      <el-table-column label="原始上传文件名" align="center" prop="fileName">
        <template #default="scope">
          {{ scope.row.fileName || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="脚本名称(入口文件)" align="center" prop="scriptName">
        <template #default="scope">
          {{ scope.row.scriptName || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="文件存储地址" align="center" prop="filePath">
        <template #default="scope">
          {{ scope.row.filePath || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="依赖文件路径" align="center" prop="depsFilePath">
        <template #default="scope">
          {{ scope.row.depsFilePath || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="模型版本号" align="center" prop="modelVersion">
        <template #default="scope">
          {{ scope.row.modelVersion || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)" align="center" prop="resourceType">
        <template #default="scope">
          {{ scope.row.resourceType || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="文件大小MB" align="center" prop="fileSize">
        <template #default="scope">
          {{ scope.row.fileSize || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="运行日志文件路径" align="center" prop="logFilePath">
        <template #default="scope">
          {{ scope.row.logFilePath || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="请求超时秒数" align="center" prop="execTimeout">
        <template #default="scope">
          {{ scope.row.execTimeout || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="自动生成dockerFile文件地址" align="center" prop="dockerFilePath">
        <template #default="scope">
          {{ scope.row.dockerFilePath || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="构建镜像标签" align="center" prop="imageTag">
        <template #default="scope">
          {{ scope.row.imageTag || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="镜像版本" align="center" prop="imageVersion">
        <template #default="scope">
          {{ scope.row.imageVersion || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="镜像构建状态" align="center" prop="imageBuildStatus">
        <template #default="scope">
          {{ scope.row.imageBuildStatus || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="镜像构建时间" align="center" prop="imageBuildTime">
        <template #default="scope">
          {{ scope.row.imageBuildTime || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="镜像构建日志文件地址" align="center" prop="imageBuildLog">
        <template #default="scope">
          {{ scope.row.imageBuildLog || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb" align="center" prop="resourceLimit">
        <template #default="scope">
          {{ scope.row.resourceLimit || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="容器自定义环境变量，JSON数组格式" align="center" prop="containerEnv">
        <template #default="scope">
          {{ scope.row.containerEnv || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="容器额外挂载目录配置，JSON数组格式" align="center" prop="containerMounts">
        <template #default="scope">
          {{ scope.row.containerMounts || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="容器暴露端口" align="center" prop="containerPorts">
        <template #default="scope">
          {{ scope.row.containerPorts || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="宿主机端口" align="center" prop="mappedHostPort">
        <template #default="scope">
          {{ scope.row.mappedHostPort || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)" align="center" prop="containerStatus">
        <template #default="scope">
          {{ scope.row.containerStatus || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="容器id" align="center" prop="containerId">
        <template #default="scope">
          {{ scope.row.containerId || '-' }}
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

<script setup name="ModelFileResourceSingle">
  import { listModelFileResource } from "@/api/model/modelFileResource";
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
      fileName: null,
      scriptName: null,
      filePath: null,
      depsFilePath: null,
      modelVersion: null,
      resourceType: null,
      fileSize: null,
      logFilePath: null,
      execTimeout: null,
      dockerFilePath: null,
      imageTag: null,
      imageVersion: null,
      imageBuildStatus: null,
      imageBuildTime: null,
      imageBuildLog: null,
      resourceLimit: null,
      containerEnv: null,
      containerMounts: null,
      containerPorts: null,
      mappedHostPort: null,
      containerStatus: null,
      containerId: null,
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
    listModelFileResource(proxy.addDateRange(queryParams.value, daterangeCreateTime.value)).then(
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
