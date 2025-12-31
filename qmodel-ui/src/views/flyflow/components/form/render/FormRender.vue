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
