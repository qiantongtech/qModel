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
