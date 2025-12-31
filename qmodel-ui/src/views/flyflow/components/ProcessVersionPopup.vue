<script setup lang="ts">

import {ref,defineExpose,defineEmits} from 'vue'
import {getListByUniqueId,setMainProcess} from "../api/flow";
import {Position} from "@element-plus/icons-vue";
const dialogTableVisible=ref(false);
const uniqueId=ref()
const show=(uid)=>{
	uniqueId.value=uid;

	handleQuery(function (){
	  dialogTableVisible.value=true

	})

}
//查询数据
function handleQuery(f){
	getListByUniqueId(uniqueId.value).then(res=>{

		gridData.value=res.data;

		if(f){
			f();
		}

	})
}

//设置主流程
function setMainProcessFunc(item){

		setMainProcess(item.flowId).then(res=>{
			handleQuery(undefined);
		})
}

const gridData=ref([])


defineExpose({show})


const emit=defineEmits(['closeDialogEvent'])

function closedEvent(){
	emit('closeDialogEvent')
}

</script>

<template>

	<el-dialog v-model="dialogTableVisible" @closed="closedEvent" title="版本管理">
			<div>
		  <el-table :data="gridData">
			  <el-table-column property="name" label="流程名称" width="200" />
		  <el-table-column label="流程版本" prop="taskCreateTime" width="100">
			  <template #default="scope">

						V:{{scope.row.version}}
			  </template>
		  </el-table-column>
		  <el-table-column label="主版本" prop="taskCreateTime" width="100">
			  <template #default="scope">
				  <el-tag v-if="!scope.row.stop" type="primary">是</el-tag>
				  <el-tag v-else type="danger">否</el-tag>


			  </template>
		  </el-table-column>
		  <el-table-column property="createTime" label="创建时间" width="200" />
		  <el-table-column width="200" fixed="right" label="操作">
			  <template #default="scope">

				  <el-button :disabled="!scope.row.stop"
						  type="primary"
						  size="small"
						  link
						  @click="setMainProcessFunc(scope.row)"
				  >
					  <el-icon ><Position/></el-icon>

					  设为主版本
				  </el-button>
				</template>
			</el-table-column>
		  </el-table>
			</div>
	  <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogTableVisible = false">关闭</el-button>
      </span>
	  </template>
	</el-dialog>

</template>

<style scoped lang="less">

</style>
