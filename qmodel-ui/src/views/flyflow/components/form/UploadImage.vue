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
