<template>
	<el-drawer :append-to-body="true" title="条件设置" v-model="visible" :show-close="false" :size="550"

						 @open="openEvent"


						 :before-close="saveCondition">
		<template #header="{ titleId, titleClass }">
			<h3 :id="titleId" :class="titleClass">条件设置</h3>

		</template>
		 <condtion-group v-model:data="conditionConfig"></condtion-group>
	</el-drawer>
</template>
<script setup type="ts">
import {ref, watch, computed, getCurrentInstance} from 'vue'
import $func from '../../utils/index'
import {useStore} from '../../stores/index'

import CondtionGroup from './components/conditionGroup.vue'





let conditionsConfig = ref({
	conditionNodes: [],
})
let conditionConfig = ref({
	groupRelation:[]
})
let PriorityLevel = ref('')

let store = useStore()
let {setCondition, setConditionsConfig} = store
let conditionsConfig1 = computed(() => store.conditionsConfig1)
let conditionDrawer = computed(() => store.conditionDrawer)
let visible = computed({
	get() {
		return conditionDrawer.value
	},
	set() {
		closeDrawer()
	}
})




const openEvent = () => {


}


watch(conditionsConfig1, (val) => {



	conditionsConfig.value = val.value;
	PriorityLevel.value = val.priorityLevel
	conditionConfig.value = val.priorityLevel
			? conditionsConfig.value.conditionNodes[val.priorityLevel - 1]
			: {nodeUserList: [], conditionList: []}
})

const saveCondition = () => {
	closeDrawer()
	var a = conditionsConfig.value.conditionNodes.splice(PriorityLevel.value - 1, 1)//截取旧下标
	conditionsConfig.value.conditionNodes.splice(conditionConfig.value.priorityLevel - 1, 0, a[0])//填充新下标
	conditionsConfig.value.conditionNodes.map((item, index) => {
		item.priorityLevel = index + 1
	});

	for (var i = 0; i < conditionsConfig.value.conditionNodes.length; i++) {
		let conditionNode = conditionsConfig.value.conditionNodes[i];

		conditionNode.error = false;
		if (i != conditionsConfig.value.conditionNodes.length - 1) {


			conditionNode.error = !$func.checkCondition(conditionsConfig.value,i).ok;
			conditionNode.errorMsg = $func.checkCondition(conditionsConfig.value,i).msg;

		}


		conditionNode.placeHolder = $func.conditionStr(conditionsConfig.value, i);
	}
	setConditionsConfig({
		value: conditionsConfig.value,
		flag: true,
		id: conditionsConfig1.value.id
	})
}

const closeDrawer = (val) => {
	setCondition(false)
}
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
