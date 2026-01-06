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
import FlowNodeFormat from "./FlowNodeFormat.vue";
import {formatStartNodeShow} from "../../api/base";
import {defineExpose, onMounted, ref, watch} from "vue";
import {deepCopy} from "../../utils/objutil";

const row = ref([]);
const selectUserNodeIdList = ref([]);
const disableSelect = ref(true);

const paramMapData = ref({})

const queryData = (p, fid, pid, tid, f) => {
	var data = {
		flowId: fid,
		processInstanceId: pid,
		paramMap: p,
		taskId: tid,
		from: f
	}
	paramMapData.value = data;
	refresh();

}

const refresh = () => {
	formatStartNodeShow(paramMapData.value).then(res => {
		row.value = res.data.processNodeShowDtoList;
		disableSelect.value = res.data.disableSelectUser
		selectUserNodeIdList.value = res.data.selectUserNodeIdList;
		handleExistNodeUser(row.value)
	})
}

//处理已经存在的需要选择人员处理节点
function handleExistNodeUser(list) {
	// nodeUser.value={};
	let filter = list
			.filter(res => res.status == 0)
			.filter(res => res.selectUser == true)
			.filter(res => res.type == 1);

	for (var item of filter) {
		let userVoList =deepCopy( item.userVoList);
		if (userVoList && userVoList.length > 0) {
			for (var u of userVoList) {
				u.type = 'user'
			}
			nodeUser.value[item.id] = userVoList;
		}
		item.userVoList=[];
	}
}

onMounted(() => {
})

const validate = (op) => {
	if(op!=='pass'){
		//只有通过 才校验
			return true;
	}




	return true;

}

const nodeUser = ref({})

const formatSelectNodeUser = () => {

	var obj = {}



	return obj;
}

defineExpose({validate, refresh, formatSelectNodeUser, queryData});


</script>

<template>

	<flow-node-format :row="row" :node-user="nodeUser" :disableSelect="disableSelect"
										ref="flowNodeFormatRef"></flow-node-format>
</template>

<style scoped lang="less">

</style>
