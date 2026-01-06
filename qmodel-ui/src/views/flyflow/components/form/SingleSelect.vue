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

		<template 	v-if="mode==='D'">
			<design-default-form :form="form"></design-default-form>
		</template>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			{{form.props.value?.length==1?form.props.value[0].value:''}}-->
<!--		</template>-->
		<el-select v-else style="width: 100%"
							 filterable
							 v-model="formValue"
			   :disabled="form.perm === 'R'"
			   :placeholder="form.placeholder"
						 size="large"
		>
		<el-option
				v-for="item in form.props.options"
				:key="item.key"
				:label="item.value"
				:value="item.key"
		/>
		</el-select>

	</div>
</template>
<script lang="ts" setup>
import {defineExpose,computed} from "vue";
import DesignDefaultForm from "./config/designDefaultForm.vue";

var formValue = computed({
	get() {
		let value = props.form.props.value;
		return (value&&value.length==1)?value[0].key:undefined;
	},
	set(t) {
		let filterElement = props.form.props.options.filter(res=>res.key===t);
	  props.form.props.value = filterElement
	}
})

let props = defineProps({

	mode:{
		type:String,
		default:'D'
	},


	form: {
		type: Object, default: () => {

		}
	}

});




</script>
<style scoped lang="less"></style>
