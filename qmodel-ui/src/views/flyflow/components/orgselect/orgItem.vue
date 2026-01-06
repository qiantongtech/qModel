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
