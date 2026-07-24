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
  <div class="actionHistory">
    <el-form ref="queryFormRef" :inline="true" @submit.prevent>
      <el-form-item label="启用版本号：" prop="modelVersion">
        <el-select
          class="el-form-input-width"
          v-model="modelVersion"
          placeholder="请输入版本号"
          clearable
        >
          <el-option
            v-for="item in versionList"
            :key="item.id"
            :label="'Version ' + item.version"
            :value="item.version"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleQuery">
          <i class="iconfont-mini icon-a-zu22377 mr5"></i>搜索</el-button
        >
        <el-button @click="resetQuery"
          ><i class="iconfont-mini icon-a-zu22378 mr5"></i>重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-table
      v-loading="loading"
      :data="historyListData"
      @selection-change="handleSelectionChange"
    >
      <el-table-column label="操作人" align="center" prop="updateBy" />
      <el-table-column label="操作内容" align="center" prop="context">
      </el-table-column>
      <el-table-column label="操作时间" align="center" prop="updateTime">
        <template #default="scope">
          <span>{{ scope.row.updateTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="启用版本号" align="center" prop="modelVersion">
        <template #default="scope">
          <el-tag size="small">Version {{ scope.row.modelVersion }}</el-tag>
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
</template>

<script setup>
import {
  ref,
  reactive,
  computed,
  watch,
  onMounted,
  getCurrentInstance,
} from "vue";
import { useRoute } from "vue-router";
import { historyList } from "@/api/modelReconstitution/history";
import { getVersionList } from "@/api/modelReconstitution/version";

// 获取当前实例以访问路由和其他属性
const { proxy } = getCurrentInstance();
const route = useRoute();

// props
const props = defineProps({
  model: {
    type: Object,
  },
});

// 响应式数据
// 遮罩层
const loading = ref(true);
// 选中数组
const ids = ref([]);
// 非单个禁用
const single = ref(true);
// 非多个禁用
const multiple = ref(true);
// 显示搜索条件
const showSearch = ref(true);
// 总条数
const total = ref(0);
// 模型管理 表格数据
const historyListData = ref([]);
// 版本管理表格数据
const versionList = ref([]);
const modelVersion = ref(null);
// 弹出层标题
const title = ref("");
// 是否显示弹出层
const open = ref(false);
// 查询参数
const queryParams = reactive({
  modelId: null,
  pageNum: 1,
  pageSize: 10,
});

// 计算属性
const modelId = computed(() => route.query.modelId);

// 模板引用
const queryFormRef = ref(null);

// 监听器
watch(
  () => props.model,
  (newVal) => {
    if (newVal) {
      getVersionList({ modelId: newVal.id }).then((response) => {
        versionList.value = response.data;
        modelVersion.value = newVal.version;
      });
    }
  }
);

// 方法定义
/** 重置按钮操作 */
const resetQuery = () => {
  modelVersion.value = props.model.version;
  queryParams.pageNum = 1;
  getList();
};

/** 搜索按钮操作 */
const handleQuery = () => {
  queryParams.pageNum = 1;
  queryParams.modelVersion = modelVersion.value;
  historyList(queryParams).then((response) => {
    historyListData.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

/** 查询模型管理 列表 */
const getList = () => {
  loading.value = true;
  const mId = route.query.modelId;
  queryParams.modelId = mId;
  queryParams.modelVersion = props.model.version;
  historyList(queryParams).then((response) => {
    historyListData.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

// 多选框选中数据
const handleSelectionChange = (selection) => {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length !== 1;
  multiple.value = !selection.length;
};

// 组件挂载后执行
onMounted(() => {
  getList();
});
</script>
<style lang="scss" scoped>
.actionHistory {
}
</style>
