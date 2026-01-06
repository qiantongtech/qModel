<!--
  Copyright © 2026 Qiantong Technology Co., Ltd.
  qModel Model Platform(Open Source Edition)
   *
  License:
  Released under the Apache License, Version 2.0.
  You may use, modify, and distribute this software for commercial purposes
  under the terms of the License.
   *
  Special Notice:
  All derivative versions are strictly prohibited from modifying or removing
  the default system logo and copyright information.
  For brand customization, please apply for brand customization authorization via official channels.
   *
  More information: https://qmodel.qiantong.tech/business.html
   *
  ============================================================================
   *
  版权所有 © 2026 江苏千桐科技有限公司
  qModel 模型平台（开源版）
   *
  许可协议：
  本项目基于 Apache License 2.0 开源协议发布，
  允许在遵守协议的前提下进行商用、修改和分发。
   *
  特别说明：
  所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
  如需定制品牌，请通过官方渠道申请品牌定制授权。
   *
  更多信息请访问：https://qmodel.qiantong.tech/business.html
-->

<script setup lang="ts">

import {ArrowDown,Select,Close} from "@element-plus/icons-vue";

import {ref, onMounted, defineExpose, watch} from 'vue'
import AgreeHandle from "../handler/agree.vue";

import {queryTaskOperData} from "../../../api/base";
import RefuseHandle from "../handler/refuse.vue";

defineExpose({handle});

//是否是委派任务
const delegationTask = ref(false);

const taskId = ref();
const processInstanceId = ref();

const taskExist = ref(false)


function handle(tId) {
	if (!tId || tId.length == 0) {
		return;
	}
	taskId.value = tId;

	queryTaskOperData(tId).then(res => {
		let data = res.data;

		processInstanceId.value = data.processInstanceId;

		nodeId.value = data.nodeId;
    needSignature.value = data.needSignature;
		delegationTask.value = data.frontJoinTask;
		taskExist.value = data.taskExist;
		process.value = data.process;
		let node = (data.node);
		if (node?.operList) {
			operList.value = node.operList.filter(k => k.checked);
		}
	})
}

const nodeId = ref();
const needSignature = ref(false);
const process = ref();

/**
 * 提交任务
 */
const submitTask = (name, fv) => {


	agreeHandler.value.handle(processInstanceId.value, taskId.value, fv, delegationTask.value, name,needSignature.value);


}

/**
 * 拒绝任务
 */
const refuseTask = (name, fv) => {


	refuseHandler.value.handle(processInstanceId.value, taskId.value, fv, name,needSignature.value);


}


const operList = ref([]);
const executeOperMethod = (op) => {

	emit('validateForm', op,function (valid, fv) {
		if (valid) {

			let name = operList.value.filter(res => res.key === op)[0].name;


			if (op === 'refuse') {
				refuseTask(name, fv);
				return
			}
			if (op === 'pass') {
				submitTask(name, fv);
				return
			}

		}
	})

}
const emit = defineEmits(["taskSubmitEvent", "validateForm"]);


const taskSubmitEvent = () => {


	emit('taskSubmitEvent')
}


const agreeHandler = ref();
const refuseHandler = ref();

</script>

<template>
	<div>

		<!--			同意提交处理-->
		<agree-handle @taskSubmitEvent="taskSubmitEvent" ref="agreeHandler"></agree-handle>
		<!--			拒绝审核处理-->
		<refuse-handle @taskSubmitEvent="taskSubmitEvent" ref="refuseHandler"></refuse-handle>


		<div style="flex: auto" v-if="taskExist">

			<template v-if="delegationTask">
				<el-button size="large" :icon="Select"  type="primary" @click="executeOperMethod('pass')">
					提交
				</el-button>
			</template>
			<template v-else>

				<template v-if="operList.length>2">

					<el-dropdown style="margin-right: 20px" @command="executeOperMethod">
						<el-button :dark="true">
							更多
							<el-icon class="el-icon--right">
								<arrow-down/>
							</el-icon>
						</el-button>
						<template #dropdown>
							<el-dropdown-menu>

								<template v-for="(item,index) in operList">

									<el-dropdown-item :command="item.key" :icon="$icon[item.icon]" v-if="index>1">{{ item.name }}
									</el-dropdown-item>
								</template>

							</el-dropdown-menu>
						</template>
					</el-dropdown>

					<template v-for="(item,index) in operList">

						<!--									{{item}}-->
						<el-button v-if="index<=1" :icon="(item.key==='pass'?Select:(item.key==='refuse'?Close:''))" :type="item.type" :dark="true" @click="executeOperMethod(item.key)">
							{{ item.name }}
						</el-button>
					</template>
				</template>

				<template v-else>

					<template v-for="(item,index) in operList">


						<el-button :type="item.type" :icon="(item.key==='pass'?Select:(item.key==='refuse'?Close:''))" :dark="true" @click="executeOperMethod(item.key)">
							{{ item.name }}
						</el-button>
					</template>
				</template>

			</template>

		</div>

	</div>
</template>

<style scoped lang="less">

</style>
