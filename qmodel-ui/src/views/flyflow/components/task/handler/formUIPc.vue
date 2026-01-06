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

import FormRender from "../../form/render/FormRender.vue";
import * as util from "../../../utils/objutil";
import $func from "../../../utils";
import {dynamicFormList} from '../../../api/form'


import {ref, defineExpose, watch, computed} from 'vue'
import {getRandomId, sameJson} from "../../../utils/objutil";


const formList = ref([])


const formUniqueId = ref();
const flowId = ref();
const processInstanceId = ref();
const taskId = ref();
const ccId = ref();
const nodeId = ref();
const loadSuccess = ref(false)
const containDynamic = ref(true)

function loadData(d, fid, nId, pId, tId, cId, cd, fValChange) {


	formUniqueId.value = util.getRandomId();
	formList.value = d;
	flowId.value = fid;
	nodeId.value = nId;
	processInstanceId.value = pId;
	taskId.value = tId;
	ccId.value = cId;
	containDynamic.value = cd;
}




const formRenderRef = ref()


//验证表单参数
const validate = (f) => {
	formRenderRef.value.handleFormRule(formList.value);
	formRenderRef.value.validate(function (valid) {

		f(valid, formValue.value)
	})
}


const formValue = computed(() => {
	let formValueObj = formRenderRef.value?.getFormValueObj(formList.value);
	return formValueObj;
})


function getFormValue() {
	let value = formValue.value;
	return value;
}


defineExpose({validate, loadData, getFormValue});
const emits = defineEmits(["formValueChange"]);

//判断是否触发表单变化
const triggerChange = ref(true)
//随机字符串
const randomId = ref('')
onMounted(() => {
	randomId.value = getRandomId();
})

///监控表单变化
watch(() => formValue.value, (v) => {


	$func.debounce(async () => {
		if (!triggerChange.value) {
			triggerChange.value = true;
			return;
		}

		if (!containDynamic.value) {
			loadSuccess.value = true

			emits('formValueChange', v)
			return
		}





	})()

})

</script>

<template>

	<el-form label-position="top">
		
		<form-render v-show="loadSuccess" v-if="formList&&formList.length>0"
								 ref="formRenderRef"
								 :form-list="formList"></form-render>

	</el-form>

</template>

<style scoped lang="less">

</style>
