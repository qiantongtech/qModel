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

<template>
	<div class="app-container">
		<div class="pagecont-top" v-if="successGroupList.length>0" style="display: flex;justify-content: space-between">
			<div>
				<el-form :inline="true"   class="demo-form-inline">

					<el-form-item label="流程名称">
						<el-input clearable  v-model="searchWord"  placeholder="请输入搜索流程" />
					</el-form-item>

				</el-form>
			</div>
			<div style="text-align: right;margin-bottom: 20px">
			</div>
		</div>


		<div v-if="groupFinalList.length<=0">
			<el-empty :image-size="250"  description="没有可发起的流程哦~" />
		</div>
		<el-card class="box-card" v-for="item in groupFinalList">
			<template #header>
				<div class="card-header">
					<span>{{ item.name }}</span>
					<span>
              <el-button v-if="item.showFlowList&&item.items.length>0" text :icon="ArrowUp" @click.stop="item.showFlowList=false" circle />
			  <el-button v-if="!item.showFlowList&&item.items.length>0"  text :icon="ArrowDown" @click.stop="item.showFlowList=true" circle />

          </span>


				</div>
			</template>
			<div  v-if="item.showFlowList">
				<el-row>
					<el-col :span="6"  v-for="(flow,index1) in item.items" :key="index1">
						<div class="item " @click="startProcess(flow)">
							<div class="f1">
<!--								<el-avatar shape="square" :size="50"-->
<!--													 :src="flow.logo"></el-avatar>-->
                <img :src="flow.logo" style="width: 50px;height: 50px">
							</div>
							<div class="f2">
								<div>
									<el-tooltip
											class="box-item"
											effect="dark"
											:content="flow.name"
											placement="top-start"
									>
										<el-text truncated>{{ flow.name }}</el-text>
									</el-tooltip>
								</div>
								<el-text  style="color: #888" size="small">发起流程</el-text>
								<div></div>
							</div>

						</div>
					</el-col>
				</el-row>

			</div>

		</el-card>


		<start ref="startRef"></start>

	</div>
</template>

<script lang="ts" setup>

import {ArrowDown, ArrowUp, CirclePlus, Plus, Search} from "@element-plus/icons-vue";

const startRef=ref();
import {

	queryMineStartGroupFlowList

} from "../api/group";



import {ref, getCurrentInstance, onMounted} from 'vue'
import {GroupVO} from "../api/group/types";

const successGroupList = ref<GroupVO[]>([]);


import Start from "../components/flow/startFlow.vue";
import {deepCopy, isBlank} from "../utils/objutil";



onMounted(() => {
	handleQuery()
})

//发起流程
const startProcess = (f) => {
	startRef.value.handle(f)
}

function handleQuery() {
	queryMineStartGroupFlowList(false).then(res => {

		const {data} = res;

		for(var it of data){
			it.showFlowList=true;
		}

		successGroupList.value = data
	})
}

const groupFinalList=computed(()=>{
	  let value = successGroupList.value;
		if(isBlank(searchWord.value)){
			return value;
		}

		let arr = deepCopy(value);

		for(var item of arr){
				let items = item.items;
				let f = items.filter(res=>res.name.indexOf(searchWord.value)>=0);
				item.items=f;

		}


		return arr;
})

const searchWord=ref('')


</script>
<style scoped lang="less">
.card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.text {
	font-size: 14px;
}

.item {
	margin: 10px;
  padding: 10px;
	display: flex;
	flex-direction: row;
	border-radius: 0px;
	background-color: #f5f5f7;
	cursor: pointer;
  border-radius: 5px;


	.f2 {
		font-weight: bolder;
		height: 50px;
		margin-left: 15px;
		width: 183px;
    padding-top: 4px;
	}

}

.box-card {
	width: 100%;
	margin-top: 10px;
}
</style>
