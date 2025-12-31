<script setup lang="ts">
import {computed, ref} from "vue";

let props = defineProps({
	id: {
		type: String,
		default: "",
	},
});

import {getCurrentConfig} from "../../../utils/objutil";

var config = computed(() => {

	return getCurrentConfig(props.id);
});

var options = computed(() => {
	return config.value.props.options;
});


import {Check, Close, Delete, Edit, Search, Share, Upload} from "@element-plus/icons-vue";

const addOption = () => {
	options.value.push({
		key: "",
		value: "",
	});
};
const deleteOption = (index) => {
	options.value.splice(index, 1);
};



import ValueCom from './components/value/SingleSelect.vue'



</script>

<template>
	<div v-if="config">

		<el-form-item label="选项" required>

			<template v-if="config.props.dataFrom===1">
				<div v-for="(item, index) in options" :key="index" class="class_option">
					<div class="f1">
						<el-input v-model="item.key" placeholder="选项值key"/>
					</div>
					<div class="f2">
						<el-input v-model="item.value" placeholder="选项标签value"/>
					</div>
					<div class="f3">
						<el-icon :size="20" @click.stop="deleteOption(index)">
							<Delete/>
						</el-icon>
					</div>
				</div>
				<el-link type="primary" @click.stop="addOption">添加选项</el-link>
			</template>

		</el-form-item>

		<el-form-item label="默认值">
      <value-com :id="id" :value-config="config.props"></value-com>

    </el-form-item>
	</div>
</template>

<style scoped lang="less">
@f1_width: 150px;
@f3_width: 40px;
.class_option {
	display: flex;
	flex-direction: row;
	width: 100%;

	.f1 {
		width: @f1_width;
	}

	.f2 {
		margin-left: 5px;
		width: calc(100% - @f1_width - @f3_width - 5px);
	}

	.f3 {
		width: @f3_width;
		text-align: center;
		padding-top: 5px;
		height: 35.6px;
	}
}
</style>
