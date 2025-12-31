
<template>
	<div>


		<template 	v-if="mode==='D'">
			<design-default-form :form="form" :height="68"></design-default-form>
		</template>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			{{form.props.value}}-->
<!--		</template>-->
			<el-input v-else
				type="textarea"
				:resize="(form.perm === 'R') ? 'none' : 'vertical'"

					  v-model="form.props.value"
					  :disabled="form.perm === 'R'"
					  :placeholder="form.placeholder"
			/>
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



</script>
<style scoped lang="less"></style>
