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
