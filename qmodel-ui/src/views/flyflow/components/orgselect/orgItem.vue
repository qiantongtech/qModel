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
	<div  >
		<div class="org-item" v-for="(item, index) in data" :key="item.id">
			<div class="img">
			<img src="../../assets/images/org.png" alt="">
		</div>
	  <el-tag
			 style=" margin-right: 5px;margin-top: 5px;"

			:hit="item.containChildrenDept"
	  :closable="!disabled" @close="removeItem(index,item.id,item.type)"
	  :type="item.type==='dept'?'primary':(item.type==='user'?'danger':'success')" size="large"
	  >
		  {{ item.name }}
	  </el-tag>
		</div>
	</div>
</template>

<script setup>

let emits = defineEmits(['update:data'])

let props = defineProps({

	data: {
		type: Array,
		default: () => []
	},
	disabled: {
		type: Boolean,
		default: false
	}

});

const  removeItem = (index,id,type) =>{

	emits("update:data",props.data.filter(res=>!(res.id===id&&res.type===type)))
}

</script>
<style lang="less" scoped>
.org-item{
	display: flex;
	flex-direction: column;
	align-items: center;

	::v-deep(.el-tag){
		background: none !important;
		margin-top: 0px !important;

		.el-tag__close,
		.el-tag__content {
			color: #000 !important;
		}

		.el-tag__close{
			margin-left: 4px !important;
		}

		.el-tag__close:hover{
			background-color: transparent !important;
		}
	}




}


.img{
	width: 46px;
	height: 46px;
	background-color: #2666FB;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	img{
		display: block;
		width: 22px;
	}
}
</style>
