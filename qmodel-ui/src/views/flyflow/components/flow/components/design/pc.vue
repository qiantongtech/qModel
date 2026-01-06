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
