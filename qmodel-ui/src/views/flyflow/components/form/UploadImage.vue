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

      <multi-upload 	 v-if="mode==='D'"
					  :disabled="true"/>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			<template v-for="item in form.props.value">-->
<!--				<el-image-->
<!--						style="width: 100px; height: 100px"-->
<!--						:src="item.url"-->
<!--						:zoom-rate="1.2"-->
<!--						:max-scale="7"-->
<!--						:min-scale="0.2"-->
<!--						:preview-src-list="form.props.value.map(res=>res.url)"-->
<!--						:initial-index="4"-->
<!--						fit="cover"-->
<!--				/>-->
<!--			</template>-->

<!--		</template>-->
      <multi-upload v-else
					v-model="form.props.value"
										:limit="form.props.max"
										:maxSize="form.props.maxSize"
					:disabled="form.perm === 'R'"
			/>
  </div>
</template>
<script lang="ts" setup>
import MultiUpload from "../Upload/MultiUpload.vue";

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
<style scoped lang="less">

</style>
