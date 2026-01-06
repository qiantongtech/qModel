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
import {inject, computed, onMounted, ref, watch} from "vue";

let isInput = ref(false);

let props = defineProps({

	nodeConfig: {
		type: Object, default: () => {

		}
	},
	checkMethodName: {
		type: String, default: ''
	},
	placeHolderMethodName: {
		type: String, default: ''
	},
	uid: {
		type: Number, default: undefined
	},
	storeDataKey: {
		type: String, default: ''
	}

});

const readOnly = inject('readOnlyAtFlow') // 导入


onMounted(() => {

	let d = $func[props.checkMethodName](props.nodeConfig);

	if (!d) {
		return
	}
	// let checkApproval = $func.checkApproval(props.nodeConfig);
	props.nodeConfig.error = !(d.ok);
	props.nodeConfig.errorMsg = (d.msg);


});


const blurEvent = () => {

	isInput.value = false;
	props.nodeConfig.nodeName = props.nodeConfig.nodeName || defaultText

};
import {bgColors, placeholderList} from "../../../utils/const";
import addNode from "../addNode.vue"

import $func from "../../../utils";
import {useStore} from "../../../stores";
import {isNotBlank} from "../../../utils/objutil";

let defaultText = computed(() => {
	return placeholderList[props.nodeConfig.type]
});


var placeHolder = computed(() => {

	if (props.nodeConfig.error) {
		return props.nodeConfig.errorMsg;
	}


	return $func[props.placeHolderMethodName](props.nodeConfig);
})
//修改显示内容
watch(()=>placeHolder.value,(v)=>{
  props.nodeConfig.placeHolder=v;
})

const clickEvent = () => {

	isInput.value = true;

};

let emits = defineEmits(['updateData',   'open']);


const updateParentData = (d) => {
	emits("updateData", d);

}

const delNode = () => {
	updateParentData(props.nodeConfig.childNode);
};




//打开右侧抽屉
const openConfigDrawer = () => {

	if (readOnly) {
		return
	}

	//TODO
	emits('open')


};

//节点状态
const nodeStatusMap = inject('nodeStatusMapAtFlow') // 导入
//边框颜色
const outBorder = computed(() => {


	if (readOnly && nodeStatusMap && nodeStatusMap.d) {
		let nodeStatusMapElement = nodeStatusMap.d[props.nodeConfig.id];
		if (!nodeStatusMapElement) {
			return ''
		}
		if (nodeStatusMapElement == 1) {
			return 'active being'

		}
		if (nodeStatusMapElement == 2) {
			return 'active finished'

		}
		if (nodeStatusMapElement == 3) {
			return 'active canceled'

		}

	} else if (props.nodeConfig.error) {
		return 'active error'
	}
	return ''
})
let store = useStore();

//TODO
//审批数据
let approverConfigData = computed(() => store[props.storeDataKey])
watch(approverConfigData, (approver) => {
  if (approver.flag && approver.id === props.uid) {
    updateParentData(approver.value);
  }
});


</script>

<template>
	<div class="node-wrap">
		<div class="node-wrap-box"
				 :class="(nodeConfig.type == 0 ? 'start-node ' : '') +(outBorder)">
			<div class="title" :style="`background: rgb(${bgColors[nodeConfig.type]});`">

				<input
						v-if="isInput&&!readOnly"
						type="text"
						class="ant-input editable-title-input"
						@blur="blurEvent()"
						@focus="$event.currentTarget.select()"
						v-focus
						v-model="nodeConfig.nodeName"
						:placeholder="defaultText"
				/>
				<span v-else class="editable-title" @click="clickEvent()">{{ nodeConfig.nodeName }}</span>
				<i v-if="!readOnly&&nodeConfig.type!=0" class="anticon anticon-close close" @click="delNode"></i>

			</div>
			<div class="content" @click="openConfigDrawer">
				<div class="text">
					<div v-if="nodeConfig.error" class="placeholderError">!</div>
					{{ isNotBlank(placeHolder) ? placeHolder : '请选择' + defaultText }}
				</div>
				<i v-if="!readOnly" class="anticon anticon-right arrow"></i>
			</div>


			<div class="error_tip" v-if="nodeConfig.error">


				<el-popover
						placement="top-start"
						:width="200"
						trigger="hover"
						:content="nodeConfig.errorMsg"
				>
					<template #reference>
						<i class="anticon anticon-exclamation-circle"></i>

					</template>
				</el-popover>

			</div>
		</div>
		<addNode :current-node="nodeConfig" v-model:childNodeP="nodeConfig.childNode"/>
	</div>

</template>

<style scoped lang="less">
@import "../../../css/workflow.css";

.error_tip {
	position: absolute;
	top: 0px;
	right: 0px;
	transform: translate(150%, 0px);
	font-size: 24px;
}

.promoter_person .el-dialog__body {
	padding: 10px 20px 14px 20px;
}

.selected_list {
	margin-bottom: 20px;
	line-height: 30px;
}

.selected_list span {
	margin-right: 10px;
	padding: 3px 6px 3px 9px;
	line-height: 12px;
	white-space: nowrap;
	border-radius: 2px;
	border: 1px solid rgba(220, 220, 220, 1);
}

.selected_list img {
	margin-left: 5px;
	width: 7px;
	height: 7px;
	cursor: pointer;
}
</style>
