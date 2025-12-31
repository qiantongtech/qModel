<script setup lang="ts">

import {computed, ref,reactive} from "vue";
import * as util from "../utils/objutil";
import {useFlowStore} from "../stores/flow";
import {FormRules} from "element-plus";

let props = defineProps({

	form: {
		type: Object,
		dafault: () => {
		}
	}
,
	colSpan:{
		type:Number,
		default:20
	}

});

const rules = reactive<FormRules>({
	url: [
		{required: true, message: "请填写请求地址", type: 'url', trigger: "blur"}
	]
});



const addOneLine = (k2) => {
	props.form[k2].push({
		field: '',
		valueMode: true,
		value: ''
	})
}
const delOneLine = (k2, index) => {
	props.form[k2].splice(index, 1)


}
const modeChange = (k2, index) => {
	props.form[k2][index].value = '';


}

let flowStore = useFlowStore();

var formList = computed(() => {
	return flowStore.step2.filter(res => res.type != 'Description');
});

var formListWithRoot = computed(() => {
	let step2 = util.deepCopy(formList.value);
	step2.push({
		id: 'rootUser',
		type: 'SelectUser',
		name: '发起人'
	})
	return step2;
});

const formRef=ref()

const validate=(f)=>{
	formRef.value.validate((valid, fields) => {
	  if (!valid) {
		  var arr = [];

		  for (var err in fields) {
			  arr.push(fields[err][0].message)
		  }
		  f(valid, arr);
	  } else {

		  f(valid);

	  }
  });
};
defineExpose({validate});

</script>

<template>
	<el-form   :model="form" ref="formRef" :rules="rules"
			 label-width="120px" label-position="top">
		<el-form-item label="请求地址" prop="url">
			<el-alert type="warning" show-icon :closable="false">
				<p>仅支持POST请求，以请求体方式接收参数</p>
			</el-alert>
			<el-input style="margin-top: 10px" :maxlength="100" v-model="form.url"
					  placeholder="http://www.flyflow.cc"/>
		</el-form-item>

		<el-form-item label="请求头">
			<el-row style="width: 100%;margin-bottom: 20px" :gutter="colSpan"
					v-for="(item,index) in form.header">
				<el-col :span="8">
					<el-form-item
							:prop="'header.' + index + '.field'"
							:rules="[
       	{required: true, message: '请填写字段名称', trigger: 'blur'},
				  { min: 1, max: 50, message: '1<字段名称长度<50', trigger: 'blur' },
      ]"
					>
						<el-input v-model="item.field" :maxlength="100" placeholder="接收字段，比如userName"/>

					</el-form-item>

				</el-col>
				<el-col :span="8">
					<el-switch
							@change="modeChange('header',index)"
							v-model="item.valueMode"
							size="large"
							active-text="固定值"
							inactive-text="表单"
					/>
				</el-col>
				<el-col :span="7">
					<el-form-item
							:prop="'header.' + index + '.value'"
							:rules="[
       	{required: true, message: '请填写字段对应值', trigger: 'blur'},
				  { min: 1, max: 50, message: '1<字段对应值长度<50', trigger: 'blur' },
      ]"
					>

						<el-input v-if="item.valueMode" :maxlength="100" v-model="item.value" placeholder="固定内容"/>
						<el-select v-else v-model="item.value" placeholder="选择表单" style="width: 100%">
							<el-option
									v-for="f in formListWithRoot"
									:key="f.id"
									:label="f.name"
									:value="f.id"
							/>
						</el-select>
					</el-form-item>
				</el-col>
				<el-col :span="1">
					<el-button @click="delOneLine('header',index)" text :icon="$icon['Delete']"></el-button>
				</el-col>
			</el-row>
			<el-button text type="primary" @click="addOneLine('header')" :icon="$icon['Plus']">添加一行
			</el-button>
		</el-form-item>
		<el-form-item label="请求体">
			<el-row style="width: 100%;margin-bottom: 20px" :gutter="colSpan" v-for="(item,index) in form.body">
				<el-col :span="8">
					<el-form-item
							:prop="'body.' + index + '.field'"
							:rules="[
       	{required: true, message: '请填写字段名称', trigger: 'blur'},
				  { min: 1, max: 50, message: '1<字段名称长度<50', trigger: 'blur' },
      ]"
					>
						<el-input v-model="item.field" :maxlength="100" placeholder="接收字段，比如userName"/>

					</el-form-item>

				</el-col>
				<el-col :span="8">
					<el-switch
							@change="modeChange('body',index)"
							v-model="item.valueMode"
							size="large"
							active-text="固定值"
							inactive-text="表单"
					/>
				</el-col>
				<el-col :span="7">
					<el-form-item
							:prop="'body.' + index + '.value'"
							:rules="[
       	{required: true, message: '请填写字段对应值', trigger: 'blur'},
				  { min: 1, max: 50, message: '1<字段对应值长度<50', trigger: 'blur' },
      ]"
					>

						<el-input v-if="item.valueMode" :maxlength="100" v-model="item.value" placeholder="固定内容"/>
						<el-select v-else v-model="item.value" placeholder="选择表单" style="width: 100%">
							<el-option
									v-for="f in formListWithRoot"
									:key="f.id"
									:label="f.name"
									:value="f.id"
							/>
						</el-select>
					</el-form-item>
				</el-col>
				<el-col :span="1">
					<el-button @click="delOneLine('body',index)" text :icon="$icon['Delete']"></el-button>
				</el-col>
			</el-row>
			<el-button text type="primary" @click="addOneLine('body')" :icon="$icon['Plus']">添加一行
			</el-button>
		</el-form-item>


			<slot></slot>

<!--			返回值-->


	</el-form>
</template>

<style scoped lang="less">

</style>
