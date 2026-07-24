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

import {ref} from 'vue'

let props = defineProps({

	content: {
		type: Object,
		dafault: () => {
		}
	},


});


import MultiUpload from "../../../Upload/MultiUpload.vue";
import MultiUploadFile from "../../../Upload/MultiUploadFile.vue";


</script>

<template>

	<div>
		<el-input

				v-model="content.approveDesc"
				type="textarea"
				maxlength="100"
				:rows="5"
				placeholder="审核意见"
				show-word-limit/>

		<div style="margin-top: 10px;text-align: left">
			<div style="font-size: 12px;margin-bottom: 10px;">添加图片</div>
			<multi-upload
					v-model="content.approveImageList"
					:limit="10"
					:maxSize="10"

			/>
		</div>

		<div style="margin-top: 10px;text-align: left">
			<div style="font-size: 12px;margin-bottom: 10px;">添加文件</div>
		<multi-upload-file
						   v-model="content.approveFileList"
		/>
		</div>


	</div>
</template>

<style scoped lang="less">

</style>
