<template>
	<div>

		<template 	v-if="mode==='D'">
			<design-default-form  :form="form"></design-default-form>
		</template>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			{{form.props.value}}-->
<!--		</template>-->
	  <el-date-picker
		v-else
	class="formDate"
	value-format="YYYY-MM-DD"

	v-model="form.props.value"
	:disabled="form.perm === 'R'"
	:placeholder="form.placeholder"
			  type="date"

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
import {Calendar} from "@element-plus/icons-vue";


</script>
<style scoped lang="less">

:deep( .formDate div.el-input__wrapper){
  width: 100% !important;
}
:deep( .formDate){
  width: 100% !important;
}

</style>
