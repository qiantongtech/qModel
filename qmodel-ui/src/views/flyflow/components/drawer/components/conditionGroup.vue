<template>
	<div>

		<el-form label-width="120px" >
			<el-form-item label="固定关系">
				<el-switch v-model="conditionConfig.mode" active-text="且"
									 inactive-text="或"/>
			</el-form-item>
		</el-form>

		<el-card class="box-card" v-for="(item,index) in conditionConfig.conditionList" :key="index"
						 style="margin-bottom: 20px">
			<template #header>
				<div class="card-header">
					<span>条件组{{ index + 1 }}</span>
					<el-switch v-model="item.mode" active-text="且"
										 inactive-text="或"/>

					<el-button text v-if="conditionConfig.conditionList.length>1"
										 @click="deleteGroup(index)"
										 :icon="$icon['Delete']"

					></el-button>
				</div>
			</template>
			<div v-for="(item1,index1) in item.conditionList" :key="index1">

				<div style="display: flex;flex-direction: row;justify-content: space-between">
					<div>
						{{ index1 == 0 ? '当' : (item.mode ? '且' : '或') }}
					</div>
					<div>
						<el-button text
											 @click="deleteCondition(index,index1)"
											 v-if="item.conditionList.length>1"
											 :icon="$icon['Delete']"

						></el-button>
					</div>
				</div>

				<condition :above-form-id="aboveFormId" :condition="item1"></condition>

			</div>
			<el-button   type="success" size="small" text :icon="Plus" style="margin-top: 20px;"
								 @click="addOneCondition(item,index)">添加条件
			</el-button>

		</el-card>
		<el-button dark type="primary" text :icon="Plus" @click="addOneConditionGroup">添加条件组</el-button>


	</div>
</template>

<script setup type="ts">
import {ref, watch, computed, getCurrentInstance} from 'vue'




var props = defineProps({

	data: {
		type: Object,
		default: () => {
		}
	},
	aboveFormId: {
		type: String, default: ''
	}
})


let conditionConfig = computed({
	get() {
		return props.data
	},
	set(t) {
		emits("update:data", t)

	}
})

//删除条件组
const deleteGroup = (index) => {
	conditionConfig.value?.conditionList.splice(index, 1)
}
//刪除单个条件
const deleteCondition = (index, index1) => {
	conditionConfig.value?.conditionList[index].conditionList.splice(index1, 1)

}
let emits = defineEmits(['update:data'])

//添加一个条件组
const addOneConditionGroup = () => {

	conditionConfig.value?.conditionList.push({
		mode: true,
		conditionList: [{}]
	})
}
//添加组内一个条件
const addOneCondition = (item, index) => {
	let conditionList = item.conditionList;
	if (!conditionList) {
		conditionList = [];
	}
	conditionList.push({});
	item.conditionList = conditionList;
}

import Condition from './condition.vue'
import {Plus} from "@element-plus/icons-vue";





</script>
<style lang="less" scoped>
.card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}


.demo-tagInput {
	width: 100%;
	height: auto;
	margin: 10px;

	:deep {
		.tag-demo-con {
			.tag-wrap {
				height: 25px;
				line-height: 25px;

				.tag {
					display: inline-block;
					padding: 2px 8px;
					box-sizing: border-box;
					border-radius: 16px;
					background: #d8eeff;
					color: #174c76;
					border: 1px solid #bbd6ea;
					margin: 0 4px;
				}

				// padding: 4px;
				// margin: 4px;
				// border: 1px solid #ccc;
				// border-radius: 5px;
				// line-height: 1em;
				// min-width: 25px;
			}
		}
	}

	.tag-wrap {
		margin-top: 10px;
	}
}
</style>
