<script setup lang="ts">
import {ref, getCurrentInstance, onMounted, watch} from 'vue'

import {setWebVersion,getWebVersion} from '../../api/base/index'

const version = ref('')
const onSubmit=()=>{
		setWebVersion(version.value).then(res=>{
		ElMessage.success("提交成功！");

		})
}

onMounted(()=>{
	getWebVersion().then(res=>{
			version.value=res.data;
	})
})

</script>

<template>
<div style="width: 300px;">
	<el-form  label-width="120px" >
		<el-form-item label="前端版本号">
			<el-input v-model="version" placeholder="2.0.8" />
		</el-form-item>
	  <el-form-item>
		  <el-button type="primary" @click="onSubmit">提交</el-button>

	  </el-form-item>
	</el-form>
</div>
</template>

<style scoped lang="less">

</style>
