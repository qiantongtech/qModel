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
<!--			{{form.props.value}}-->
<!--		</template>-->
			<template v-else>
		  <el-input-number
						   style="width: 100%"
						   controls-position="right"
						   v-model="form.props.value"
						   :precision="form.props.radixNum"

						   :disabled="form.perm === 'R'"
						   :placeholder="form.placeholder"
		  />
        <template v-if="form.props.showChinese">
          <el-text>
            大写：

          </el-text>
          <el-text type="info">
            {{convertCurrency(form.props.value)}}

          </el-text>
        </template>

			</template>

	</div>
</template>
<script lang="ts" setup>
import DesignDefaultForm from "./config/designDefaultForm.vue";


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
import * as util from '../../utils/objutil'

import {defineExpose} from "vue";
import {convertCurrency} from "../../utils/objutil";


</script>
<style scoped lang="less"></style>
