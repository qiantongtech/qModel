<template>
	<div>


		<template 	v-if="mode==='D'">
			<design-default-form :form="form"></design-default-form>
		</template>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			{{form.props.value}}-->
<!--		</template>-->
			<el-input v-else
								v-model="form.props.value"
								:disabled="form.perm === 'R'"
								:placeholder="form.placeholder"
			/>

	</div>
</template>
<script lang="ts" setup>
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
import * as util from '../../utils/objutil'
import DesignDefaultForm from "./config/designDefaultForm.vue";



</script>
<style scoped lang="less"></style>
