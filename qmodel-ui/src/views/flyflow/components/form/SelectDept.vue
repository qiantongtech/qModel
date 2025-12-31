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
