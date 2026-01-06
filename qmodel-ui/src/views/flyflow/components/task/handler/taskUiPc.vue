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

<script setup>

import FlowNodeFormat from "../../flow/FlowNodeFormatData.vue";

import FormUI from "./formUIPc.vue";


import HeaderUI from "../show/header.vue";

import OperUI from "../show/oper.vue";
import {
  queryHeaderShow
} from "../../../api/base";


import {getFormDetail} from '../../../api/form'


const rightDrawerVisible = ref(false)
const headerUIRef = ref();


/**
 * 点击开始处理
 */
const deal = (tId, pId, fId, ccId, nId) => {

  taskId.value = tId
  flowId.value = fId
  processInstanceId.value = pId
  copyId.value = ccId


  //////////////////////////////////////////////////////////////////



  queryHeaderShow({
    processInstanceId: pId,
    taskId: tId,
    flowId: fId,
    ccId: ccId
  }).then(res => {
    headerUIRef.value.loadData(res.data);


  });


	getFormDetail({
    flowId: fId,
    processInstanceId: pId,
    taskId: tId,
    ccId: ccId
  }, true).then(res => {
    let data = res.data;


		startUserDeptList.value=data.startUserDeptList

		selectStartDept.value=data.selectStartDept;
		if(data.selectStartDept){//是否发起人需要选择部门
			startUserMainDeptId.value=data.startUserDeptList[0].id
		}

    formUIRef.value.loadData(data.formList, fId, nId, pId, tId, ccId,data.dynamic,data.formChangeRecord)

    operUIRef.value.handle(tId);
  })

  rightDrawerVisible.value = true;


  // }


}


import {ref,onMounted, computed } from "vue";
import * as util from "../../../utils/objutil";


defineExpose({deal});

const taskSubmitEvent = () => {
  rightDrawerVisible.value = false;

  emit('taskSubmitEvent')
}

//验证表单
function validateForm(op,f) {

  let validate = flowNodeFormatRef.value.validate(op);
  if (!validate) {
    f(false)
    return
  }
  let param = flowNodeFormatRef.value.formatSelectNodeUser();


  formUIRef.value.validate(function (a, b) {

    if (param) {
      f(a, {...b, ...param});

    } else {
      f(a, b);

    }
  })
}

const formUIRef = ref();

onMounted(() => {

});
const emit = defineEmits(["taskSubmitEvent"]);




const formValueChange = (v) => {
	v['startUserMainDeptId']=startUserMainDeptId.value;


  flowNodeFormatRef.value.queryData(v, flowId.value, processInstanceId.value, taskId.value)

}
const flowNodeFormatRef = ref();
const operUIRef = ref();
const flowId = ref('');
const taskId = ref('');
const copyId = ref();

const processInstanceId = ref('');


const flowValue = ref([]);
const getFlowValue = (val) => {
    flowValue.value = val;
}



//发起人的部门
const startUserDeptList = ref([]);
import {Delete, Edit, Search, Share, Upload} from '@element-plus/icons-vue'


//发起的主部门id
const startUserMainDeptId=ref();
//是否需要选择发起人部门
const selectStartDept=ref(false);
//发起人主部门id变化了
function startUserMainDeptChangeEvent(e){
	let formValue = formUIRef.value.getFormValue();


	formValue['startUserMainDeptId']=e;
	flowNodeFormatRef.value.queryData(formValue, flowId.value, processInstanceId.value, taskId.value,'start')
}

</script>

<template>
  <div class="task-ui-pc">
		<el-dialog v-model="rightDrawerVisible" :show-close="false" width="1100px" destroy-on-close>

			<template #header="{ close, titleId, titleClass }">
				<div class="cus-header">
					<div class="title">
						{{ flowValue?.processName }}
					</div>

					<el-icon class="close" style="cursor: pointer;" @click="close"><Close /></el-icon>
				</div>
				<div class="head-info">
					<header-u-i style="width: 100%;" @getFlowValue="getFlowValue" ref="headerUIRef"></header-u-i>
				</div>
			</template>



    <!--			右侧抽屉-->

			<div class="body-wrap">
				<div class="body-form">
					<el-scrollbar  style="padding-right: 0px;height: 490px">

					<div style="height: 490px">

						<template v-if="selectStartDept&&startUserDeptList.length>1">

							<h4>请选择您当前所在部门</h4>
							<el-select @change="startUserMainDeptChangeEvent" v-model="startUserMainDeptId" placeholder="请选择您当前所在部门" style="width: 100%">
								<el-option
										v-for="item in startUserDeptList"
										:key="item.id"
										:label="item.name"
										:value="item.id"
								/>
							</el-select>

							<el-divider></el-divider>
						</template>

						<form-u-i
								@formValueChange="formValueChange" ref="formUIRef"></form-u-i>

					</div>

					</el-scrollbar>

					<div style="display: flex;justify-content: center">

						<div>
							<oper-u-i ref="operUIRef" @taskSubmitEvent="taskSubmitEvent" @validateForm="validateForm" :flow-id="flowId"
												:task-id="taskId"
												:process-instance-id="processInstanceId"></oper-u-i>
						</div>
					</div>
				</div>
				<div class="body-timeline">
					<el-scrollbar height="490px">

					<flow-node-format
							ref="flowNodeFormatRef"></flow-node-format>
					</el-scrollbar>
				</div>
			</div>
		</el-dialog>

  </div>
</template>
<style lang="less">
.task-ui-pc{
	.el-dialog{
		.el-dialog__header{
			padding: 0 !important;
		}

		.el-form-item__label{
			font-family: PingFang SC, PingFang SC;
			font-size: 14px;
			color: #333;
		}

		.el-dialog__body{
			background-color: rgba(240, 242, 245, 1);
			height: 580px;
			padding: 14px 0 0 !important;
		}
	}

	.cus-header{
		display: flex;
		justify-content: space-between;
		align-items: center;
		background: #F8F8F8;
		height: 42px;
		padding: 0 20px 0 20px;

		.title{
			font-weight: 600;
			font-size: 16px;
			color: #3f3f3f;
			font-family: Microsoft YaHei, Microsoft YaHei;
		}
	}

	.head-info{
		height: 94px;
		background: #FFFFFF;
		// margin-bottom: 14px;
		display: flex;
		align-items: center;
		padding-left: 37px;
		border-top: 1px solid #E5E5E5;
	}

	.body-wrap{
		display: flex;
		height: 100%;
		.body-form{
			width: 688px;
			margin-right: 15px;
			padding: 20px 40px 0 45px;
			background-color: #fff;
		}

		.body-timeline{
		    width: 395px;
			background-color: #fff;
			padding: 30px 25px;
		}
	}
}



</style>
