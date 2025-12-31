<template>
	<div>

		<template 	v-if="mode==='D'">
			<design-default-form :form="form"></design-default-form>
		</template>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			{{form.props.value?.length>=1?form.props.value.map(res=>res.value).join('；'):''}}-->
<!--		</template>-->
			<el-select v-else style="width: 100%"
				 multiple
								 filterable
				 collapse-tags
				 collapse-tags-tooltip
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
	  return (value&&value.length>0)?(value.map(res=>res.key)):undefined;

  },
	set(t) {
		let filterElement = props.form.props.options.filter(res=>t.indexOf(res.key)>=0);
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
