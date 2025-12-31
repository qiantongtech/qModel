<template>
	<el-drawer :append-to-body="true" title="延时器设置" v-model="visible"


						 @open="openEvent"

						 class="set_copyer" :show-close="false" :size="550" :before-close="saveDelay">
    <template #header="{ close, titleId, titleClass }">

      <title-handler :node-config="config"></title-handler>


    </template>

		<el-switch
				v-model="config.mode"
				size="large"
				@change="changeMode"
				active-text="固定时长"
				inactive-text="固定时间点"
		/>

		<div>
			<template v-if="config.mode">

				<el-input
						v-model="config.value"
						type="number"
						placeholder="请输入时长"
						style="width: 250px"
				>

					<template #append>
						<el-select v-model="config.delayUnit" placeholder="Select" style="width: 115px">
							<el-option v-for="item in delayUnitOpts" :label="item.label" :value="item.value"></el-option>

						</el-select>
					</template>
				</el-input>
				后进入下一节点
			</template>
			<template v-else>
				<el-date-picker
						v-model="config.value"
						type="datetime"
						value-format="YYYY-MM-DD HH:mm:ss"
						placeholder="请选择时间点"
				/>
				进入下一节点
			</template>

		</div>

	</el-drawer>
</template>
<script setup lang="ts">

import $func from '../../utils/index'
import {useStore} from '../../stores/index'
import {delayUnitOpts, nodeData} from '../../utils/const'
import {ref, watch, computed, reactive} from 'vue'

let config = ref({})


let store = useStore()
let {setDelayConfig, setDelay} = store
let delayDrawer = computed(() => store.delayDrawer)
let delayConfigData = computed(() => store.delayConfigData)
let visible = computed({
	get() {
		return delayDrawer.value
	},
	set() {
		closeDrawer()
	}
})
watch(delayConfigData, (val) => {
	config.value = {...nodeData[val.value.type],...val.value};
})


import * as util from '../../utils/objutil'
import TitleHandler from "./components/titleHandler.vue";

const changeMode = () => {

	config.value.value = ''

}

const openEvent = () => {

}


const saveDelay = () => {




  config.value.error = !$func.checkDelay(config.value).ok
  config.value.errorMsg = $func.checkDelay(config.value).msg
	setDelayConfig({
		value: config.value,
		flag: true,
		id: delayConfigData.value.id
	})
	closeDrawer();
}
const closeDrawer = () => {
	setDelay(false)
}
</script>

<style lang="less" scoped>
</style>
