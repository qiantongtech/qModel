<template>
	<div>


		<template 	v-if="mode==='D'">
			<design-default-form :form="form"></design-default-form>
		</template>
<!--		<template v-else-if="form.perm === 'R'">-->
<!--			{{form.props.value}}-->
<!--		</template>-->
			<template v-else>
		  <el-input-number
						   style="width: 100%"
						   controls-position="right"
						   v-model="form.props.value"
						   :precision="form.props.radixNum"

						   :disabled="form.perm === 'R'"
						   :placeholder="form.placeholder"
		  />
        <template v-if="form.props.showChinese">
          <el-text>
            大写：

          </el-text>
          <el-text type="info">
            {{convertCurrency(form.props.value)}}

          </el-text>
        </template>

			</template>

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
import {convertCurrency} from "../../utils/objutil";


</script>
<style scoped lang="less"></style>
