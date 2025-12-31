<script setup lang="ts">
import TaskHandle from "../../../components/task/handler/task.vue"

defineOptions({
  name: "Role",
  inheritAttrs: false,
});

import {ref,onMounted ,reactive} from "vue";


import {
	queryMessageList, deleteMsg, readMsg, readAllMsg
} from "../../../api/message";
import {Check, Delete, Plus, Position, Refresh, CircleCheck} from "@element-plus/icons-vue";

const queryFormRef = ref();


const loading = ref(false);
const ids = ref<number[]>([]);
const total = ref(0);

const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
});

const roleList = ref<[]>();




function taskSubmit(){
	//置为已读
		readMsg(currentData.value.id).then(res=>{
		handleQuery()

		})
}

/**
 * 查询
 */
function handleQuery() {
  loading.value = true;
	queryMessageList(queryParams)
    .then(({ data }) => {
      roleList.value = data.records;
      total.value = data.total;
    })
    .finally(() => {
      loading.value = false;
    });
}
/**
 * 重置查询
 */
function resetQuery() {
  queryFormRef.value.resetFields();
  queryParams.pageNum = 1;
	queryParams.readed=undefined
  handleQuery();
}







/**
 * 删除
 */
function handleDelete(roleId?: number) {
  const roleIds = [roleId || ids.value].join(",");
  if (!roleIds) {
    ElMessage.warning("请勾选删除项");
    return;
  }

  ElMessageBox.confirm("确认删除已选中的数据项?", "警告", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  }).then(() => {
    loading.value = true;
    deleteMsg(roleIds)
      .then(() => {
        ElMessage.success("删除成功");
        resetQuery();
      })
      .finally(() => (loading.value = false));
  });
}
const taskHandler = ref();
const currentData = ref();
const taskSignContractHandler = ref();


/**
 * 已读
 */
function handleRead(roleId?: number) {
  const roleIds = [roleId || ids.value].join(",");
  if (!roleIds) {
    ElMessage.warning("请勾选删除项");
    return;
  }

	loading.value = true;
	readMsg(roleIds)
		.then(() => {
			resetQuery();
		})
		.finally(() => (loading.value = false));
}

/**
 * 已读
 */
function handleReadAll() {


	loading.value = true;
	readAllMsg()
		.then(() => {
			resetQuery();
		})
		.finally(() => (loading.value = false));
}


onMounted(() => {
  handleQuery();
});
</script>

<template>
  <div class="app-container">
    <div class="search">
      <el-form ref="queryFormRef" :model="queryParams" :inline="true">

        <el-form-item prop="keywords" label="是否已读">
			<el-select clearable  v-model="queryParams.readed"   placeholder="选择"  >
				<el-option

						:key="true"
						label="已读"
						:value="true"
				/>
				<el-option

						:key="false"
						label="未读"
						:value="false"
				/>
			</el-select>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="handleQuery" :icon="Plus"
            > 搜索</el-button
          >
          <el-button @click="resetQuery" :icon="Refresh"> 重置</el-button>
          <el-button type="success" @click="handleReadAll" :icon="CircleCheck"> 全部已读</el-button>
        </el-form-item>
      </el-form>
    </div>

    <el-card shadow="never">


      <el-table
        ref="dataTableRef"
        v-loading="loading"
        :data="roleList"
        highlight-current-row
        border
      >
<!--        <el-table-column type="selection" width="55" align="center" />-->
        <el-table-column label="标题" prop="title" min-width="200" />
					<el-table-column label="内容" prop="dataScope" min-width="250" >
			  <template #default="scope">
	{{(scope.row.content)}}

			  </template>
					</el-table-column>
		  <el-table-column label="时间" prop="createTime" width="180" />

        <el-table-column label="状态" align="center" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.readed " type="success">已读</el-tag>
            <el-tag v-else type="info">未读</el-tag>
          </template>
        </el-table-column>

        <el-table-column fixed="right" label="操作" width="130">
          <template #default="scope">

            <el-button
              type="success"
              size="small"
              link
							:disabled="scope.row.readed"
              @click="handleRead(scope.row.id)"
            >
              <el-icon><Check/></el-icon>
              已读
            </el-button>

            <el-button
              type="danger"
              size="small"
              link
              @click="handleDelete(scope.row.id)"
            >
              <el-icon><Delete/></el-icon>
              删除
            </el-button>
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
    </el-card>


		<task-sign-contract ref="taskSignContractHandler" @taskSubmitEvent="taskSubmit"></task-sign-contract>


	  <task-handle ref="taskHandler"  @taskSubmitEvent="taskSubmit" ></task-handle>

  </div>
</template>
