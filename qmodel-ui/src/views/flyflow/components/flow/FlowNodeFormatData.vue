<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.

  This file is part of qModel Module Platform (Open Source Edition).

  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.

  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.

  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
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
