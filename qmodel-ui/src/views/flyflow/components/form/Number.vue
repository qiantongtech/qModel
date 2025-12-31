<template>
	<div>

		<template 	v-if="mode==='D'">
			<design-default-form :form="form"></design-default-form>
		</template>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			{{form.props.value}}-->
<!--		</template>-->
			<el-input-number v-else
							style="width: 100%"
			  controls-position="right"
					   :precision="form.props.radixNum"
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




</script>
<style scoped lang="less"></style>
