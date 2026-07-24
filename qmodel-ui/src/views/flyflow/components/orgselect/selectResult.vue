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

<template>
	<div class="select-result l">

		<el-row style="margin-top: 20px;">
			<el-col :span="15">
				已选（{{ total }}）
			</el-col>
			<el-col :span="6">
				<template v-if="!disableSelectChildrenDept">
					下级部门
				</template>
			</el-col>
			<el-col :span="3">
				<a @click="emits('del')">清空</a>
			</el-col>
		</el-row>
		<ul style="margin-top: 20px;">
			<template v-for="({type, data, cancel}) in list" :key="type">

					<li v-for="item in data" :key="item.id">

						<el-row>
							<el-col :span="3"  >

								<div style="padding-top: 6px;">
									<el-image v-if="type==='dept'" style="width: 20px;height: 20px;"  :src="DeptImg" />
									<el-avatar v-if="type==='user'" shape="square" :size="20" :src="item.avatar">{{item.name.substring(0,1)}}</el-avatar>
									<el-icon v-if="type==='role'" style="font-size: 20px"><Share /></el-icon>

								</div>


							</el-col>
							<el-col :span="(disableSelectChildrenDept||type==='user'||type==='role')?18:13">
								<div style="height: 32px;line-height: 32px">

								<el-text  truncated>
										{{ item.name }}
								</el-text>

								</div>

							</el-col>
							<el-col :span="(disableSelectChildrenDept||type==='user'||type==='role')?0:5">


								<el-checkbox :disabled="disableSelectChildrenDept" v-model="item.containChildrenDept"  />

							</el-col>
							<el-col :span="3">
								<div style="padding-top: 7px;text-align: center">

								<el-icon @click="cancel(item)" style="cursor: pointer;"><Delete/></el-icon>
								</div>
							</el-col>
						</el-row>

					</li>

			</template>
		</ul>
	</div>
</template>
<script setup>

import {
  CircleClose,
  Delete,
  Edit, Grid, Share,
  Message,
  Search,
  Star, Picture,
} from '@element-plus/icons-vue'
import DeptIconImg from '../../assets/images/depticon.png'
import DeptImg from "@/views/flyflow/assets/images/dept.png";

defineProps({
	total: {
		type: Number,
		default: 0
	},
	disableSelectChildrenDept:{ //禁止选择下级部门
		type:Boolean,
		default:true
	},
	list: {
		type: Array,
		default: () => [{type: 'role', data, cancel}]
	}
})
let emits = defineEmits(['del'])
</script>

<style lang="less" scoped>
.select-result {
	width: 276px;
	height: 100%;
	font-size: 12px;
}

</style>
