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

			<el-button
					v-if="mode==='D'"
					:disabled="true"
					circle
					:icon="$icon['Plus']"

			></el-button>

			<select-show v-else
						 :disabled="form.perm === 'R'" v-model:orgList="form.props.value" type="dept" :multiple="form.props.multi"></select-show>

	</div>
</template>
<script lang="ts" setup>
import selectShow from "../orgselect/selectAndShow.vue";
import {defineExpose} from "vue";

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
