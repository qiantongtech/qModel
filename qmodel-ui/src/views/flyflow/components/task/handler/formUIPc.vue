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
