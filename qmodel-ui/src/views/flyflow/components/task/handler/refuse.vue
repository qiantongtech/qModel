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

import {ref} from 'vue'
import {completeTask} from "../../../api/task";

const dialogVisible = ref(false);


const formValue = ref();
const  dialogTitle=ref("");
const processInstanceId = ref("");
const taskId = ref("");
const needSignature = ref(false);

const handle = (pid, tid, formData,dialogTitle1,needSignature1) => {
	dialogTitle.value=dialogTitle1;
	needSignature.value = needSignature1;

	processInstanceId.value = pid
	taskId.value = tid

	formValue.value = formData;

	dialogVisible.value = true;
}

defineExpose({handle});
const emit = defineEmits(["taskSubmitEvent"]);

const loading=ref(false)

const submit = () => {
	loading.value=true;


	var param = {
		paramMap: formValue.value,
		approveResult:false,
		processInstanceId:processInstanceId.value,
		taskId: taskId.value


	};
	param={...param,...commentContent.value};

	completeTask(param).then(res => {
		dialogVisible.value = false;


		emit("taskSubmitEvent")
	}).finally(()=>{
		loading.value=false;

	})
}
const dialogClosed=()=>{
	commentContent.value={}
}
const  commentContent=ref({})

import  CommentHandle from './components/comment.vue'
import {isBlank} from "../../../utils/objutil";


</script>

<template>
	<div class="refuse-dialog">
		<el-dialog
				v-model="dialogVisible"
				:title="dialogTitle"
				width="400px"
				destroy-on-close
				@closed="dialogClosed"
				:show-close="false"
		>
			<template #header="{ close, titleId, titleClass }">
				<div class="cus-header">
					<div class="title">
						{{ dialogTitle }}
					</div>

					<el-icon class="close" style="cursor: pointer;" @click="close"><Close /></el-icon>
				</div>
			</template>
			<comment-handle :content="commentContent"></comment-handle>

			<template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" :loading="loading" @click="submit">
          确定
        </el-button>
      </span>
			</template>
		</el-dialog>
	</div>
</template>

<style  lang="less">
.refuse-dialog{
	.el-overlay-dialog{
		.el-dialog{
			.el-dialog__body{
				background-color: #fff !important;
				padding: 20px 40px !important;
			}
		}
	}
}
</style>
