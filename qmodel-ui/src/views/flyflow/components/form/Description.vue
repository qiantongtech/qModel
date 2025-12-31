<template>
	<div>

			<text


			>{{!form?'':form.placeholder}}</text>


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



</script>
<style scoped lang="less"></style>
