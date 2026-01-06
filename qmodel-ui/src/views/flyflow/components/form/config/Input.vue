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
import {computed, defineExpose} from "vue";

let props = defineProps({
	id: {
		type: String,
		default: "",
	}
});



import {getCurrentConfig} from "../../../utils/objutil";

var config = computed(() => {

	return getCurrentConfig(props.id);
});
import ValueCom from './components/value/Input.vue'

</script>

<template>
	<div  v-if="config">
		<el-form-item label="最小长度">
			<el-input-number :step="1" step-strictly v-model="config.props.minLength" style="width: 100%"
											 controls-position="right" :min="1"
											 :max="100"/>
		</el-form-item>
		<el-form-item label="最大长度">
			<el-input-number :step="1" step-strictly v-model="config.props.maxLength" style="width: 100%"
											 controls-position="right" :min="1"
											 :max="100"/>

		</el-form-item>
		<el-form-item label="正则表达式">
			<el-input placeholder="^\d+$" v-model="config.props.regex"/>


		</el-form-item>
		<el-form-item label="正则表达式提示语">
			<el-input placeholder="表单值不符合正则表达式" v-model="config.props.regexDesc"/>


		</el-form-item>
		<el-form-item label="默认值">
      <value-com :id="id" :value-config="config.props"></value-com>
		</el-form-item>
	</div>
</template>

<style scoped lang="less">

</style>
