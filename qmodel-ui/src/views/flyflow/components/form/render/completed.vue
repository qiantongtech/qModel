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

<script setup lang="ts">

import {defineExpose, onMounted} from "vue";

onMounted(()=>{
  handleQuery()
})
const props = defineProps({
  flowIdList: {
    type: Array,
    default: ()=>[]
  }
});
import {
  queryMineDoneProcessInstance
} from "../../../api/task";
const loading = ref(false);
const total = ref(0);

const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  flowIdList:props.flowIdList

});
const roleList = ref();

/**
 * 查询
 */
function handleQuery() {
  loading.value = true;
  queryMineDoneProcessInstance(queryParams)
      .then(({data}) => {
        roleList.value = data.records;
        total.value = data.total;
      })
      .finally(() => {
        loading.value = false;
      });
}
const multipleSelection=ref([])
const handleSelectionChange = (val) => {
  multipleSelection.value = val
}
const dataTableRef=ref()

const  clear=()=>{
  dataTableRef.value!.clearSelection()
}
const  getData=()=>{
  let value = multipleSelection.value;
  console.log("已办数据：",value)
  var arr=[]
  for(var it of value){
    arr.push({
      processInstanceId:it.processInstanceId,
      processName:it.processName,
      flowId:it.flowId
    })
  }
  return arr
}
defineExpose({clear,getData});
</script>

<template>
<div>

  <el-table
      ref="dataTableRef"
      v-loading="loading"
      :data="roleList"
      highlight-current-row
      border
      @selection-change="handleSelectionChange"

  >
    <el-table-column type="selection" width="55" />
    <el-table-column label="分组" prop="groupName" width="100"/>
    <el-table-column label="流程" prop="processName" width="200"/>
    <el-table-column label="发起人" prop="startUserName" width="150"/>
    <el-table-column label="发起时间" prop="startTime" width="160"/>
    <el-table-column label="结束时间" prop="endTime" width="160"/>
    <el-table-column label="状态" prop="taskCreateTime" width="100">
      <template #default="scope">
        <el-tag v-if="scope.row.processInstanceStatus == 1" type="success">进行中</el-tag>
        <el-tag v-else-if="scope.row.processInstanceStatus == 3" type="danger">已撤销</el-tag>
        <el-tag v-else>已结束</el-tag>

      </template>
    </el-table-column>
    <el-table-column label="审批结果" prop="taskCreateTime"  >
      <template #default="scope">
        <el-tag v-if="scope.row.processInstanceResult == 1" type="success">同意</el-tag>
        <el-tag v-else-if="scope.row.processInstanceResult == 2" type="danger">拒绝</el-tag>
        <el-tag v-else-if="scope.row.processInstanceResult == 3" type="warning">撤销</el-tag>


      </template>
    </el-table-column>


  </el-table>

  <pagination
      v-if="total > 0"
      v-model:total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="handleQuery"
  />
</div>
</template>

<style scoped lang="less">

</style>
