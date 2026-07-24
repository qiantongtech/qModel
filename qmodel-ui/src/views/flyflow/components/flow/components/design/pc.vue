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

import {Close} from "@element-plus/icons-vue";
import {computed, ref} from "vue";
import * as util from "../../../../utils/objutil";
import {useFlowStore} from "../../../../stores/flow";
import getFormName from "../../../../utils/getFormWidget";
import draggable from "vuedraggable";


const getFormWidget = (name: string) => {
	//写的时候，组件的起名一定要与dragList中的element名字一模一样，不然会映射不上
	return getFormName[name];
};




let flowStore = useFlowStore();
let targetList = computed({
	get: () => {
		let value = step2List.value;
		if (value?.length == 0) {
			return [{
				type: 'Empty',
				name: ''
			}]
		}
		return value;
	},
	set: (v) => {

		let value = v.filter(res => res.type != 'Empty');
		flowStore.setStep2Form(util.deepCopy(value));

	}
})

const deleteForm = (id) => {


	flowStore.setStep2Form(step2List.value.filter(res => res.id !== id));

	if (currentFormCom.value && currentFormCom.value?.id === id) {
		currentFormCom.value = undefined
	}

};

var emit=defineEmits(['setCurrentForm']);

var step2Object = computed(() => {
	var obj = {}

	step2List.value.forEach(res => obj[res.id] = res)

	return obj;
});
var step2List = computed(() => {
	let step2 = flowStore.step2Form;
	return step2;
});

//定义当前打开的表单
const currentForm = ref();
//判断是否选中当前表单显示边框
var isCurrentForm = (fid) => {
	if (!currentFormCom.value) {
		return false;
	}
	if (currentFormCom.value.id === fid) {
		return true;
	}



	return false;
}
const showCurrentPageConfigPanel = (id) => {
	currentFormCom.value = step2List.value.filter(res => res.id === id)[0];

};
const showPanel = (form) => {

	currentFormCom.value = form;
}

var currentFormCom=computed({
	get(){
		return currentForm.value
	},
	set(v){
		currentForm.value=v;
		emit('setCurrentForm',v)
	}
})



</script>

<template>
	<div
			class="drag-content"

	>
		<div class="drag-content-inner">


			<el-form :label-position="'top'" :class="step2List.length?'':'empty-form'"    label-width="100px">
				<draggable
						disabled
						v-model="targetList"
						style="background-color: #fff"
						item-key="index"
						:sort="true"
						effect="dark"
						:group="{ name: 'dragFormList', pull: true, put:true }"
						class="draggable"
				>
					<template #item="{ element, index }">
						<div
								class="okcomponent border line  " effect="dark"
								:class="{'active-component':isCurrentForm(element.id)}"
								@click.stop="showCurrentPageConfigPanel(element.id)"
						>


							<el-icon v-if="element.type!='Empty'" class="deleteIcon"
											 @click.stop="deleteForm(element.id)">
								<Close/>
							</el-icon>

								<el-form-item :label="step2Object[element.id]?.name"   :style="{marginBottom:(element.type==='Empty'?'0px':'18px')}"
															:required="step2Object[element.id]?.required">

									<component style="width: 100%"
														 @showPanel="showPanel"
														 :index="index"
														 :is="getFormWidget(element.type)"
														 :id="element.id"
														 :from="1"
														 v-model:form="step2Object[element.id]"
									></component>
								</el-form-item>


						</div>
					</template>
				</draggable>
			</el-form>
		</div>
	</div>
</template>

<style scoped lang="less">
.leftItem {
	padding-left: 0px;
}

.zj {
	display: inline-block;
	width: 140px;
	margin: 5px;
}

@f22_width: 400px;

@center_width: 360px;
.drag-content {
	height: calc(100% - 42px);
	padding: 12px 18px;
	background-color: white;
	box-sizing: border-box;
	overflow-y: auto;
	overflow-x: hidden;
}

.drag-content-inner {
	background-color: var(--el-bg-color-page);
	border-radius: var(--el-border-radius-base);
	min-height: 100%;
	height: 100%;
	.empty-form{
		height: 100%;

	}

	.draggable{
			height: 100%;
		}
}

.f11 {
	width: calc(100% - @f22_width);

}

.f22 {
	width: @f22_width;

}

.okcomponent {
	border-radius: 2px;
	margin-bottom: 17px;
	background: #F5F7FB;
	position: relative;
	padding: 13px 14px 17px 23px;

	.el-form-item{
		margin-bottom: 0 !important;
	}

	::v-deep(.el-form-item__label){
		font-family: PingFang SC, PingFang SC;
		font-size: 14px;
		color: #000;
	}

	::v-deep(.is-required){
		.el-form-item__label::before{
			position: absolute;
			left: 12px;
			top: 4px;
		}
	}
}

.active-component {
	border: 1px solid var(--el-color-primary);
}

.deleteIcon {
	position: absolute;
	right: 20px;
	z-index: 20;
	color: #9B9898;
}

.deleteIcon:hover {
	cursor: pointer;
	color: palevioletred;
}

.el-form{
	min-height: 100%;
	height: 100%;
}
</style>
