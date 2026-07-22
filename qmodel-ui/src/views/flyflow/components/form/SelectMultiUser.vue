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
import {computed, defineExpose} from "vue";
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
