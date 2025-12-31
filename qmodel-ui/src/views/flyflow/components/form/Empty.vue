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
