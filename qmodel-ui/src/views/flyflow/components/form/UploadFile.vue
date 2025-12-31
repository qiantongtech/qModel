<template>
	<div>

		<multi-upload-file v-if="mode==='D'"
											 :disabled="true"/>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			<template v-for="item in form.props.value">-->
<!--				<el-link target="_blank" :href="item.url"> {{item.name}} </el-link>-->
<!--			</template>-->
<!--		</template>-->
		<multi-upload-file v-else
											 v-model="form.props.value"
                       :suffix-array="form.props.suffixArray"
											 :disabled="form.perm === 'R'"
		/>
	</div>
</template>
<script lang="ts" setup>

import MultiUploadFile from "../Upload/MultiUploadFile.vue";

import {defineExpose} from "vue";

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



</script>
<style scoped lang="less"></style>
