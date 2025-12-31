<template>
	<div>

		<template 	v-if="mode==='D'">
			<design-default-form :form="form"></design-default-form>
		</template>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			{{form.props.value?.length==1?form.props.value[0].value:''}}-->
<!--		</template>-->
		<el-select v-else style="width: 100%"
							 filterable
							 v-model="formValue"
			   :disabled="form.perm === 'R'"
			   :placeholder="form.placeholder"
						 size="large"
		>
		<el-option
				v-for="item in form.props.options"
				:key="item.key"
				:label="item.value"
				:value="item.key"
		/>
		</el-select>

	</div>
</template>
<script lang="ts" setup>
import {defineExpose,computed} from "vue";
import DesignDefaultForm from "./config/designDefaultForm.vue";

var formValue = computed({
	get() {
		let value = props.form.props.value;
		return (value&&value.length==1)?value[0].key:undefined;
	},
	set(t) {
		let filterElement = props.form.props.options.filter(res=>res.key===t);
	  props.form.props.value = filterElement
	}
})

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
