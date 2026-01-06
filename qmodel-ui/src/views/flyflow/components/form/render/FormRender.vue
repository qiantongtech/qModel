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
import getFormName from "../../../utils/getFormWidget";
import {onMounted, reactive, ref} from 'vue'
import {computed, getCurrentInstance, watch} from "vue";
import type {FormRules} from 'element-plus'

const getFormWidget = (name: string) => {
	//写的时候，组件的起名一定要与dragList中的element名字一模一样，不然会映射不上
	return getFormName[name];
};

let props = defineProps({


	index: {
		type: Number,
		default: -1
	},


	formList: {
		type: Array, default: () => []
	},

	formChangeRecord: {
		type: Object, default: () => {}
	}


});

onMounted(() => {
	handleFormRule(props.formList);
})

const handleFormRule = (n) => {

	let formList = n

	if(!n){
		formList = props.formList;
	}

	for (var item of formList) {
		let id = item.id;
		let validateRule = getFormRuleConfig(item);

		rules[id] = validateRule;


	}



}



const ruleFormRef = ref();

const rules = reactive<FormRules>({})

const validate = (f) => {
	ruleFormRef.value.validate((valid) => {
		f(valid);
	})
}

//获取表单值
function getFormValueObj(v) {

	return getFormValue(v)

}

const formValue = computed(() => {

	return getFormValue(props.formList);
})


import {useFlowStore} from "../../../stores/flow";
import {assiginObj, getFormValue, getFormRuleConfig, deepCopy} from "../../../utils/objutil";

let flowStore = useFlowStore();


watch(() => formValue.value, (v) => {
	if (props.index < 0) {
		flowStore.setFormValue(v)
	}
})


function isShow(item) {
	if (item.perm === 'H') {
		return false;
	}
	if (item.perm === 'E') {
		return true;
	}


	// return !item.props.isBlank;
	return  true;
}


defineExpose({validate, handleFormRule, getFormValueObj});

</script>

<template>
<div>
	<el-form label-position="top"
					 :rules="rules"
					 :model="formValue"
					 ref="ruleFormRef"
	>


		<template v-for="(item,index) in formList">

				<el-form-item v-if="isShow(item)"
											:label="(item.name+(item.props.unit?'('+item.props.unit+')':''))"
											:prop="!item?'':item.id" :required="!item?false:item.required" style="margin-bottom: 20px;">


					<component style="width: 100%"   :formValue="formValue"

										 :is="getFormWidget(item.type)" :index="props.index>=0?props.index:-1"
										 mode="RUN" :ref="'form'+item.id"
										 :formIndex="index"
										 :form="item"
					></component>


				</el-form-item>
			</template>

	</el-form>
</div>

</template>

<style scoped lang="less">

</style>
