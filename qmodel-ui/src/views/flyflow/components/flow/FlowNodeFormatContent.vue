<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<script setup lang="ts">


let props = defineProps({

	nodeUser: {
		type: Object,
		dafault: () => {
		}
	},
	row: {
		type: Array,
		dafault: () => []
	},
	disableSelect: {
		type: Boolean,
		default: false
	}


});




import {Loading, Finished, Refresh, Clock, CircleCloseFilled} from "@element-plus/icons-vue";
import {isBlank, isNotBlank} from "../../utils/objutil";

import {ref} from 'vue'

const activeNodeId = ref('')
const activeNodeFunc = (n) => {
	activeNodeId.value = n.id
}


</script>

<template>


	<template v-for="(node, index) in row" :key="index">


		<el-timeline-item size="large"
											:type="node.status!=2?(
        node.status==1?'success':(node.status==3?'warning':'info')
      ):'primary'"
											:icon="node.status==2?Finished:(node.status==1?Loading:(node.status==3?CircleCloseFilled:Clock))"
		>
			<template v-if="!disableSelect&&node.selectUser&&(!nodeUser[node.id]||nodeUser[node.id]?.length==0)">
				<p style="color: red">{{ node.name }}
					<template v-if="node.placeholder&&node.placeholder.length>0">[{{ node.placeholder }}]</template>
				</p>
			</template>
			<template v-else>
				<div style="display: flex;flex-direction: row">
					<div class="f21" style="font-weight: bold;font-size: 15px;">{{ node.name }} </div>
					<div class="f22">{{ node.showTimeStr }}</div>
				</div>
				<div style="font-size: 12px;font-weight: normal;margin-top: 5px;" v-if="isNotBlank(node.placeholder)">
					[{{ node.placeholder }}]
				</div>

			</template>



			<!--					渲染用户头像列表-->
			<div v-if="node.userVoList&&node.userVoList.length>0" style="display: flex;flex-direction: row;flex-wrap: wrap">
				<div class="box-card" v-for="(item1,index1) in node.userVoList" :key="index1"
						 style="margin-bottom: 10px;border: 0px solid red;width: 60px;text-align: center">

					<div class="node-show">
						<div style="overflow: hidden;">
							<div class="d1">

								<div style="padding-top: 20px;"  >

									<el-badge :value="12" is-dot
														:type="item1.status==1?'success':(item1.status==2?'primary':(item1.status==3?'warning':'info'))"
														class="item">

										<el-avatar shape="square" :size="30" :type="item1.status==1?'success':(item1.status==2?'primary':(item1.status==3?'warning':'info'))" :src="item1.avatar">{{ item1.name.substring(0, 1) }}
										</el-avatar>

									</el-badge>

								</div>


								<div
										style="font-size: 12px;font-weight: bold; text-align: center;text-overflow: ellipsis;white-space: nowrap;overflow: hidden">

									{{ item1.name }}
								</div>

							</div>


						</div>


					</div>

				</div>


			</div>


			<!--					渲染审批评论-->
			<div v-for="(item1,index1) in node.approveDescList" :key="index1" style="margin-top: 10px">


				<div style="display: flex;flex-direction: row;padding-left: 10px;">
					<div class="f1">

						<el-avatar shape="square" :size="30" :src="item1.user.avatar">{{ item1.user.name.substring(0, 1) }}
						</el-avatar>


					</div>
					<div class="f2">
						<div class="f211">

							{{ item1.user.name }}
							<el-tag size="small" type="danger">{{ item1.descTypeStr }}</el-tag>


						</div>
						<div class="f212">

							{{ item1.showTimeStr }}


						</div>
					</div>


				</div>
				<div v-if="!item1.sys">
					<el-text size="small" style="margin-left: 10px" type="primary">{{ JSON.parse(item1.desc).title }}</el-text>
				</div>
				<div class="box-card"
						 style="padding: 5px;background-color:var(--el-fill-color-light);display: flex; align-items: center;margin-left: 10px;">
					<el-tag v-if="item1.sys" type="success" style="margin-right: 6px;">系统</el-tag>
					<el-text type="info">{{ JSON.parse(item1.desc).content }}</el-text>

					<div v-if="item1.approveImageList?.length>0" style="margin-top: 10px;margin-bottom: 10px;">
						<el-image v-for="im in item1.approveImageList"
											style="width: 60px; height: 60px"
											:src="im.url"
											:zoom-rate="1.2"
											:max-scale="7"
											:min-scale="0.2"
											:preview-src-list="[im.url]"
											:initial-index="4"
											fit="cover"
						/>
					</div>

					<template v-if="item1.approveFileList?.length>0">
						<div v-for="ifi in item1.approveFileList">
							<el-link target="_blank" :href="ifi.url" type="primary">{{ ifi.name }}</el-link>
						</div>
					</template>

					<template v-if="item1.signUrlList?.length>0">
						<div v-for="ifi in item1.signUrlList">
							<el-row>
								<el-col :span="8">
									<div style="height: 66px;line-height: 66px">
										签字：

									</div>
								</el-col>
								<el-col :span="16">
									<el-image
											style="width: 150px;  "
											:src="ifi"
											:zoom-rate="1.2"
											:max-scale="7"
											:min-scale="0.2"
											:preview-src-list="[ifi]"
											:initial-index="4"
											fit="cover"
									/>
								</el-col>
							</el-row>

						</div>
					</template>
				</div>

				<el-divider v-if="index1!=node.approveDescList.length-1"/>

			</div>



			<!--					分支处理-->
			<el-button-group style="margin-top: 10px;">
				<el-button @click="activeNodeFunc(node1)" size="small"
									 :type="(isBlank(activeNodeId)?(index1==0?'primary':'default'):(activeNodeId===node1.id?'primary':'default'))"
									 v-for="(node1, index1) in node.branch">分支{{ index1 + 1 }}
				</el-button>
			</el-button-group>
			<template v-for="(node1, index1) in node.branch">
				<div v-if="isBlank(activeNodeId)?(index1==0):(node1.id===activeNodeId)"
						 style="font-size: 12px;margin-top: 5px;">
					<template v-if="node1.placeholder&&node1.placeholder.length>0">[{{ node1.placeholder }}]</template>

				</div>
			</template>


		</el-timeline-item>

		<template v-if="node.branch?.length>0">


			<template v-for="(node1, index1) in node.branch">
				<template v-if="isBlank(activeNodeId)?(index1==0):(node1.id===activeNodeId)">

					<flow-node-format-content :node-user="nodeUser" :disableSelect="disableSelect"
																		:row="node1.children"></flow-node-format-content>


				</template>
			</template>
		</template>

	</template>

</template>

<style scoped lang="less">
.f1 {
	width: 40px;
	text-align: center;

	padding-top: 5px;
}

.f2 {
	height: 50px;
	font-size: 10px;
	margin-left: 5px;
	width: calc(100% - 45px);
	padding-top: 5px;

}

.f211 {
	font-weight: bold;
	font-size: 12px;
}

.f212 {
	font-size: 10px;
}

.f00 {
	width: 10px;
	height: 10px;
	display: inline-block;
	background-color: green;
	position: fixed;
	top: 62px;

}

.f21 {
	width: calc(100% - 150px);
}

.f22 {
	width: 150px;
	text-align: right;
}

.d1{
	.el-avatar[type=success]{
		background-color: var(--el-color-success);
	}
	.el-avatar[type=primary]{
		background-color: var(--el-color-primary);
	}
	.el-avatar[type=warning]{
		background-color: var(--el-color-warning);
	}
	.el-avatar[type=info]{
		background-color: var(--el-color-info);
	}
}

.el-timeline-item__tail{
	border-style: dashed;
}
</style>
