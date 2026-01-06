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
  <div>

      <el-button
			  v-if="mode==='D'"
			  :disabled="true"
								 circle
		:icon="$icon['Plus']"

	  ></el-button>

		<select-show v-else
				 :disabled="form.perm === 'R'" v-model:orgList="form.props.value" type="user" :multiple="form.props.multi" :disable-user="disableUserIdList"></select-show>

  </div>
</template>
<script lang="ts" setup>
import selectShow from "../orgselect/selectAndShow.vue";
import {defineExpose} from "vue";


import {useUserStore} from "../../stores/user";



const userStore = useUserStore();

const currentUserId = computed(() => {
	return userStore.userId;
})


//禁止选择的用户id
const disableUserIdList=computed(()=>{
	let self = props.form.props.self;
	//不能选择自己
	if(!self){
		return [currentUserId.value];
	}else{
		return [];
	}
})

let props = defineProps({

	mode:{
		type:String,
		default:'D'
	},


	form: {
		type: Object, default: () => {

		}
	}

});

onMounted(()=>{
})


</script>
<style scoped lang="less"></style>
