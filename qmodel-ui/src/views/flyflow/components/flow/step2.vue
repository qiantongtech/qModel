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

<template>
	<div>
		<el-container>
			<el-aside width="338px">
				<h4><img src="../../assets/images/zjk.png" alt="" srcset=""> 组件库</h4>
				<el-scrollbar :min-size="1" style="height:calc(100% - 42px);padding: 12px 20px;">
					<div class="dark" effect="dark" style="background-color: white;margin-top: 0px;">
						<template v-for="(item,index) in oriFormList">
							<div class="ori-item">
								<div class="tit">
									<img :src="getAssetsFile(item.icon)" alt="">
									<h5>{{ item.name }}</h5>
								</div>
								<draggable
										disabled
										v-model="item.formList"
										ghost-class="ghost" :force-fallback="true"
										item-key="index"
										:sort="false"
										@end="dragEnd"
										@start="drag=true"
										class="leftItem"
										:animation="300"
										:group="{ name: 'dragFormList', pull: 'clone', put: false }"

										:clone='cloneFunc'
								>

									<template #item="{ element }">
										<div class="zj">
											<el-button class="btn" size="large" style="width: 100%" :icon="$icon[element.icon]"
											>{{ element.name }}
											</el-button>
										</div>
									</template>
								</draggable>
							</div>
						</template>


					</div>

				</el-scrollbar>

			</el-aside>
			<el-main style="padding: 0px;">
				<div style="display: flex;flex-direction: row;height:100%;">
					<div class="f11">
						<h4><img src="../../assets/images/xiangqing.png" alt="" srcset=""> 详情</h4>
						<pc  @setCurrentForm="setCurrentFormFunc"></pc>
					</div>
					<div class="f22" v-if="currentForm">
						<el-card class="box-card">
							<template #header>
								<div class="card-header">
									<component class="icons" :is="currentForm.icon" />
									<span>{{ currentForm?.typeName }}</span>
								</div>
							</template>

									<el-form label-width="120px" label-position="top">
										<el-form-item   label="表单ID">
											<el-input disabled v-model="currentForm.id" maxlength="50">
												<template #append>
													<el-button @click="copyFormId(currentForm.id)" :icon="DocumentCopy" />
												</template>
											</el-input>
										</el-form-item>
										<el-form-item required label="标题">
											<el-input v-model="currentForm.name" maxlength="10"/>
										</el-form-item>

										<el-form-item label="提示" :required="currentForm.type==='Description'">
											<el-input v-model="currentForm.placeholder" maxlength="50"/>
										</el-form-item>



										<component
												:is="getFormConfigWidget(currentForm.type)"
												:id="currentForm.id"
												ref="currentFormConfigRef"
										></component>
										<el-form-item label="其他">
											<el-checkbox v-model="currentForm.required" label="必填"/>

										</el-form-item>
									</el-form>

						</el-card>


					</div>

				</div>

			</el-main>
		</el-container>

	</div>
</template>

<script lang="ts" setup>
import {ref, computed} from "vue";

import {formValidateDict} from '../../utils/formValidate'

import {Monitor, Iphone, DocumentCopy} from "@element-plus/icons-vue";
import {useFlowStore} from "../../stores/flow";
//要注意导入
import getFormConfigName from "../../utils/getFormConfigWidget";
import draggable from "vuedraggable";
import {FormGroupVO} from "../../api/form/types";
import {formGroupConfig} from "../../api/form/data";
import * as util from "../../utils/objutil";



import Pc from "./components/design/pc.vue";

const activeConfigTab = ref('base');

const drag = ref(false);

const currentFormConfigRef = ref();
let flowStore = useFlowStore();


var step2List = computed(() => {
	let step2 = flowStore.step2;
	return step2;
});
var step2FormList = computed(() => {

	if (!flowStore) {
		return undefined;
	}
	let step2 = flowStore.step2Form;
	return step2;
});
//监听表单变化 渲染手机端和pc端
watch(() => step2FormList?.value, (v) => {
	flowStore.setStep2Pc(v);
	var arr = [];
	for (var item of v) {
	 {
			arr.push(item);
		}
	}
	flowStore.setStep2(arr);
}, {deep: true})



//定义当前打开的表单
const currentForm = ref();

function setCurrentFormFunc(v) {
	currentForm.value = v;
}





const cloneFunc = (el) => {
	el.id = util.getRandomId();
	return el;
}


const getFormConfigWidget = (name: string) => {
	//写的时候，组件的起名一定要与dragList中的element名字一模一样，不然会映射不上
	return getFormConfigName[name];
};

function getAssetsFile(url){
  return new URL(`../../assets/images/${url}.png`, import.meta.url).href;
};


const dragEnd = (a) => {
	drag.value = false;
	oriFormList.value = util.deepCopy(oriFormList.value)

}
//复制表单idid
function copyFormId(id){
	util.copyToBoard(id)
}

let oriFormList = ref<FormGroupVO[]>(formGroupConfig);


const validate = (f) => {

	var err = []

	let formList = step2List.value;
	if (formList.length == 0) {
		err.push("表单不能为空")
	}

	var cIndex = 0;
	var indexObj = {};
	for (var form of formList) {
		indexObj[form.id] = cIndex
		cIndex++;
	}
	for (var form of formList) {


		let formValidateDictElement = formValidateDict[form.type];
		if (formValidateDictElement) {
			let result = formValidateDictElement(form);

			if (!result.valid) {
				err.push(result.msg)
			}
		}

		//计算每个表单的顺序


		//检查动态表单配置

		{
			let dynamicFormConfig = form.dynamicFormConfig;
			if (!dynamicFormConfig) {
				dynamicFormConfig = [];
			}
			for (var it of dynamicFormConfig) {
				let list = it.list;
				let conditionList = it?.condition?.conditionList;
				if (conditionList?.length > 0) {
					//判断条件里的顺序
					for (var c of conditionList) {
						console.log(c)
						for (var t of c.conditionList) {
							let key = t.key;
							let indexObjElement = indexObj[key];
							if (indexObjElement) {
								if (indexObjElement >= indexObj[form.id]) {
									err.push("请检查表单[" + form.name + "]的动态表单条件中引用的条件顺序不能在当前表单之下")

								}
							}
						}
					}

					//有条件
					if (list?.length < 1) {
						err.push("请设置表单[" + form.name + "]的动态表单值")

					} else {
						for (var l of list) {
							if (util.isBlank(l.value) || util.isBlank(l.contentConfig)) {
								err.push("请完善表单[" + form.name + "]的动态表单值")
							}
						}
						let arr = list.map(r => r.contentConfig);
						if (util.distinct(arr).length != arr.length) {
							err.push("表单[" + form.name + "]的动态表单不能重复配置")
						}
					}
				}
			}

		}


	}

	//表单唯一名字集合
	let uniqueFormNameList = Array.from(new Set(formList.map(res => res.name)))


	if (uniqueFormNameList.length < formList.length) {

		for(var formName of uniqueFormNameList){
			let length = formList.filter(res=>res.name===formName).length;
			if(length>1){
				err.push("表单名称【"+formName+"】不能重复");
			}
		}

	}

	f(err.length == 0, err);
};
defineExpose({validate});
</script>
<style scoped lang="less">
.leftItem {
	padding-left: 0px;
}

.zj {
	display: inline-block;
	width: 120px;
	margin: 5px 10px 5px 10px;
}

@f22_width: 520px;



.f11 {
	width: calc(100% - @f22_width);
	height: 100%;
	margin-right: 18px;
}

.f22 {
	width: @f22_width;
	height: 100%;
	::v-deep(.el-card){
		height: 100%;
		.el-card__header{
			height: 42px;
			min-height: auto;
			padding: 0 0 0 20px !important;

			font-family: Microsoft YaHei, Microsoft YaHei;
			font-weight: bold;
			font-size: 16px;
			color: #000000;
			display: flex;
			align-items: center;
			height: 42px;
			padding-left: 20px;
			background-color: #fff;

			.card-header{
				display: flex;
				.icons{
					width: 18px;
					display: block;
					margin-right: 8px;
					color: #2566fb;
				}
				span{
					white-space: nowrap;
				}
			}
		}

		.el-card__body{
			height: calc(100% - 40px);
			overflow-y: auto;
			overflow-x: hidden;
			padding: 14px 18px !important;

			.el-form-item{
				padding: 8px 18px 24px 19px;
				.el-form-item__label{
					font-family: Microsoft YaHei, Microsoft YaHei;
					font-size: 14px;
					color: #333;
					line-height: 34px;
				}
			}
		}
	}
	
}

.el-container{
	background-color: #F0F2F5;
	height: 100%;

	h4{
		margin: 0;
		font-family: Microsoft YaHei, Microsoft YaHei;
		font-weight: bold;
		font-size: 16px;
		color: #000000;
		display: flex;
		align-items: center;
		height: 42px;
		padding-left: 20px;
		border-bottom: 1px solid #E8E8E8;
		background-color: #fff;
		img{
			width: 18px;
			display: block;
			margin-right: 8px;
		}
	}
}

.el-aside{
	padding: 0;
	background-color: #fff;
	margin-right: 18px;
	margin-bottom: 0;
	height: 100%;

	.dark{
		.zj{
			margin: 0;
		}

		h5{
			margin: 0;
			line-height: 43px;
			font-family: Microsoft YaHei, Microsoft YaHei;
			font-weight: bold;
			font-size: 16px;
			color: #000;
		}

		.ori-item{
			padding: 2px 20px 16px;
			background: #F5F7FB;
			margin-bottom: 18px;

			.leftItem{
				display: grid;
				row-gap: 9px;
				column-gap: 11px;
				grid-template-columns: 1fr 1fr;
			}

			.tit{
				display: flex;
				align-items: center;
				img{
					width: 21px;
					display: block;
					height: fit-content;
					margin-right: 8px;
				}
			}

			.btn{
				font-family: PingFang SC, PingFang SC;
				font-weight: 500;
				font-size: 15px;
				color: #606266;
			}
		}

		.ori-item:last-child{
			margin-bottom: 0;
		}
	}
}

.el-main{
	height: 100%;
}


</style>
