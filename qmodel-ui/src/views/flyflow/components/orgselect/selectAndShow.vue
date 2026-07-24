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
import employeesDialog from "./employeesDialog.vue";
import orgItem from "./orgItem.vue";
import {ref, computed} from "vue";
import {deepCopy} from "../../utils/objutil";

let selectUserDialogVisible = ref(false);
const afterSelectUser = (data) => {
	//选择人员变化
	selectUserDialogVisible.value = false;
	emits("update:orgList", data)
};

var defaultValue = computed(
		{
			get: () => {
				let orgList = props.orgList;
				return orgList;
			},
			set: (r) => {
				emits("update:orgList", r)

			}
		}
)
let emits = defineEmits(['update:orgList'])


let props = defineProps({
	disableSelectChildrenDept:{ //禁止选择下级部门
		type:Boolean,
		default:true
	},
	orgList: {
		type: Array,
		default: () => []
	},
	disableUser: {
		type: Array,
		default: () => []
	},
	type: {
		type: String,
		default: 'org'
	},
	multiple: {
		type: Boolean,
		default: true
	},
	disabled: {
		type: Boolean,
		default: false
	},
	showStyle:{
		type:Number,
		default:1
	},
	placeholder:{
		type:String,
		default:'请选择'
	}
});

const inputShowValue=computed(()=>{
		if(!defaultValue.value){
				return ''
		}
	return defaultValue.value.map(re=>re.name).join(",");
})

</script>

<template>
	<div>
		<employees-dialog
				v-model:visible="selectUserDialogVisible"
				:data="defaultValue"
				:type="type"
				:disable-select-children-dept="disableSelectChildrenDept"
				:multiple="multiple"
				:disable-user="disableUser"
				@change="afterSelectUser"
		/>
	</div>
	<template v-if="showStyle===1">
		<div class="org-list">
			<org-item v-model:data="defaultValue" :disabled="disabled"/>
		</div>

		<el-button :type="disabled?'info':'primary'" :disabled="disabled" :icon="$icon['Plus']" circle size="large" @click="selectUserDialogVisible=true"
		>
		</el-button>
	</template>
	<template v-if="showStyle===2">
		<el-input
				v-model="inputShowValue"
				:placeholder="placeholder"
				clearable
				readonly
				:disabled="disabled"
				style="width: 200px"
				@click="selectUserDialogVisible=true"

		/>
	</template>

</template>

<style scoped lang="less">

</style>
