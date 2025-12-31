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
