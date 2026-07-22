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

<script setup lang="ts">

import {defineExpose,ref} from "vue";
import {completeTask, resolveTask} from "../../../api/task";

const dialogVisible = ref(false);


const commentContent = ref({})

const frontJoinTask = ref(false);
const needSignature = ref(false);
const formValue = ref();
const dialogTitle = ref("");
const processInstanceId = ref("");
const taskId = ref("");

const handle = (pid, tid, formData, dt, dialogTitle1, needSignature1) => {
  dialogTitle.value = dialogTitle1;
  frontJoinTask.value = dt;
  needSignature.value = needSignature1;

  formValue.value = formData;

  processInstanceId.value = pid
  taskId.value = tid

  dialogVisible.value = true;
}

defineExpose({handle});
const emit = defineEmits(["taskSubmitEvent"]);

const loading=ref(false)

const submit = () => {
	loading.value=true;

  var param = {
    paramMap: formValue.value,
    approveResult: true,
    processInstanceId: processInstanceId.value,
    taskId: taskId.value

  };
  param = {...param, ...commentContent.value};

  if (frontJoinTask.value) {
    //前加签
    resolveTask(param).then(res => {
      dialogVisible.value = false;


      emit("taskSubmitEvent")
    }).finally(()=>{
			loading.value=false;

		})
  } else {
    completeTask(param).then(res => {
      dialogVisible.value = false;


      emit("taskSubmitEvent")
    }).finally(()=>{
			loading.value=false;

		})
  }

}
const dialogClosed = () => {
  commentContent.value = {}

}

import CommentHandle from './components/comment.vue'
import {isBlank} from "../../../utils/objutil";


</script>

<template>
  <div class="agree-dialog">
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
        <el-button :loading="loading" type="primary" @click="submit">
          确定
        </el-button>
      </span>
      </template>
    </el-dialog>

  </div>
</template>

<style  lang="less">
.agree-dialog{
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
