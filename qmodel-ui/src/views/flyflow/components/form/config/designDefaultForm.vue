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
import {defineProps} from 'vue'
import {Calendar} from "@element-plus/icons-vue";
import {isNotBlank} from "../../../utils/objutil";

let props = defineProps({



	icon: {
		type: Object, default: () => {

		}
	},
	form: {
		type: Object, default: () => {

		}
	},
	height:{
		type:Number,default:34
	}


});
</script>

<template>
<div style="border: 1px solid #D9D9D9;border-radius: 2px;background-color: #fff;color: #ababb2;padding-left: 10px;"
:style="{height:height+'px'}"
>

	<template v-if="isNotBlank(icon)">
	  <el-button size="small" text  :icon="$icon[icon]"
		>
<!--			{{ element.name }}-->
				{{!form?'':form.placeholder}}
                  </el-button>



	</template>
	<template v-else>
		{{!form?'':form.placeholder}}
	</template>
</div>
</template>

<style scoped lang="less">

</style>
