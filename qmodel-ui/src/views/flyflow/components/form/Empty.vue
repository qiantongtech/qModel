<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<template>
	<div style="text-align: center;border: 0px solid red;">


		<el-text type="primary">
			<el-icon>
				<DocumentAdd />
			</el-icon>
			请点击左侧组件拖拽到此处
		</el-text>

	</div>
</template>
<script lang="ts" setup>
import {Check, Plus, DocumentAdd,ElementPlus} from "@element-plus/icons-vue";

let props = defineProps({

	mode: {
		type: String,
		default: 'D'
	},


	form: {
		type: Object, default: () => {

		}
	}

});
import * as util from '../../utils/objutil'


</script>
<style scoped lang="less"></style>
