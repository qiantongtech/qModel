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
