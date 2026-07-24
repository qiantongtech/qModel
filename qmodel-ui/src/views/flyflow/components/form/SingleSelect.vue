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
