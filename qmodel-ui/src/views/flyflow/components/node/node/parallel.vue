<script setup lang="ts">


import {computed, getCurrentInstance, ref, watch} from "vue";

import {bgColors, placeholderList} from "../../../utils/const";

import addNode from "../addNode.vue"
import nodeWrap from "../nodeWrap.vue"

import {useStore} from "../../../stores";

import * as util from "../../../utils/objutil";
import {resetNodeId} from "../../../utils/nodeutil";

let isInputList = ref([]);
let props = defineProps({


	nodeConfig: {
		type: Object, default: () => {

		}
	}

});
let emits = defineEmits(['updateData']);


const updateParentData = (d) => {
	emits("updateData", d);

}
const resetConditionNodesErr = () => {
	return;


}

const arrTransfer = (index, type = 1) => {
	//向左-1,向右1
	props.nodeConfig.conditionNodes[index] = props.nodeConfig.conditionNodes.splice(
			index + type,
			1,
			props.nodeConfig.conditionNodes[index]
	)[0];
	props.nodeConfig.conditionNodes.map((item, index) => {
		item.priorityLevel = index + 1;
	});
	resetConditionNodesErr()
	updateParentData(props.nodeConfig);
};

const blurEvent = (index) => {

	isInputList.value[index] = false;
	props.nodeConfig.conditionNodes[index].nodeName = props.nodeConfig.conditionNodes[index].nodeName || "条件";

};
const clickEvent = (index) => {

	isInputList.value[index] = true;

};
const reData = (data, addData) => {
	if (!data.childNode) {
		data.childNode = addData;
	} else {
		reData(data.childNode, addData);
	}
};
//复制
const copyTerm=(index)=>{
  let conditionNode = props.nodeConfig.conditionNodes[index];
  let deepCopy = util.deepCopy(conditionNode);
  resetNodeId(deepCopy,deepCopy.parentId);
  props.nodeConfig.conditionNodes.splice(index, 0,deepCopy);
  props.nodeConfig.conditionNodes.map((item, index) => {
    item.priorityLevel = index + 1;
    //item.nodeName = `条件${index + 1}`;
  });
  resetConditionNodesErr()
  updateParentData(props.nodeConfig);
  if (props.nodeConfig.conditionNodes.length == 1) {
    if (props.nodeConfig.childNode) {
      if (props.nodeConfig.conditionNodes[0].childNode) {
        reData(props.nodeConfig.conditionNodes[0].childNode, props.nodeConfig.childNode);
      } else {
        props.nodeConfig.conditionNodes[0].childNode = props.nodeConfig.childNode;
      }
    }
    updateParentData(props.nodeConfig.conditionNodes[0].childNode);
  }
}
const delTerm = (index) => {
	props.nodeConfig.conditionNodes.splice(index, 1);
	props.nodeConfig.conditionNodes.map((item, index) => {
		item.priorityLevel = index + 1;
		item.nodeName = `条件${index + 1}`;
	});
	resetConditionNodesErr()
	updateParentData(props.nodeConfig);
	if (props.nodeConfig.conditionNodes.length == 1) {
		if (props.nodeConfig.childNode) {
			if (props.nodeConfig.conditionNodes[0].childNode) {
				reData(props.nodeConfig.conditionNodes[0].childNode, props.nodeConfig.childNode);
			} else {
				props.nodeConfig.conditionNodes[0].childNode = props.nodeConfig.childNode;
			}
		}
		updateParentData(props.nodeConfig.conditionNodes[0].childNode);
	}
};


let store = useStore();
let {



} = store;



const readOnly = inject('readOnlyAtFlow') // 导入



const addTerm = () => {

  if(readOnly){
    return
  }

	let len = props.nodeConfig.conditionNodes.length + 1;
	props.nodeConfig.conditionNodes.push({
		nodeName: "分支" + len,
		type: 3,
		id: util.getRandomId('node'),
		placeHolder: '满足条件',
		parentId: props.nodeConfig.id,

		priorityLevel: len,
		conditionList: [{

			conditionList: []
		}],
		nodeUserList: [],
		childNode: null,
	});
	updateParentData(  props.nodeConfig);

};

//节点状态
const nodeStatusMap = inject('nodeStatusMapAtFlow') // 导入
//边框颜色
const outBorder = computed(() => {

	let conditionNodes = props.nodeConfig.conditionNodes;

	var arr = [];

	for (var c of conditionNodes) {

		if (readOnly && nodeStatusMap && nodeStatusMap.d) {
			let nodeStatusMapElement = nodeStatusMap.d[c.id];
			if (!nodeStatusMapElement) {
				arr.push('')
				continue
			}
			if (nodeStatusMapElement == 1) {
				arr.push('active being')
				continue

			}
			if (nodeStatusMapElement == 2) {
				arr.push('active finished')
				continue
			}
			if (nodeStatusMapElement == 3) {
				arr.push('active canceled')
				continue
			}

		} else if (c.error) {
			arr.push('active error ')
			continue

		}
		arr.push('')
		continue
	}

	return arr;
})
</script>

<template>
	<div class="branch-wrap">
		<div class="branch-box-wrap">
			<div class="branch-box">
				<button class="add-branch" :style="`color: rgb(${bgColors[nodeConfig.type]});`" @click="addTerm">添加条件
				</button>
				<div class="col-box" v-for="(item, index) in nodeConfig.conditionNodes" :key="index">

					<div class="condition-node">
						<div class="condition-node-box">
							<div class="auto-judge" :class=" outBorder[index]">
								<div class="sort-left" v-if="!readOnly&&index != 0" @click="arrTransfer(index, -1)">&lt;</div>
								<div class="title-wrapper">
									<input
											style="width: 50%"
											v-if="isInputList[index]&&!readOnly"
											type="text"
											class="ant-input editable-title-input"
											@blur="blurEvent(index)"
											@focus="$event.currentTarget.select()"
											v-focus
											v-model="item.nodeName"
									/>
									<span v-else class="editable-title" :style="`color: rgb(${bgColors[nodeConfig.type]});`"
												@click="clickEvent(index)">{{ item.nodeName }}</span>
									<span class="priority-title"  >优先级{{
											item.priorityLevel
										}}</span>
									<i v-if="!readOnly" class="anticon anticon-close close" @click="delTerm(index)"></i>
                  <i v-if="!readOnly&&(index != nodeConfig.conditionNodes.length - 1)" class="anticon anticon-docs close" style="right: 10px;display: none" @click="copyTerm(index)"></i>

								</div>
								<div class="sort-right" v-if="!readOnly&&index != nodeConfig.conditionNodes.length - 1"
										 @click="arrTransfer(index)">&gt;
								</div>

								<div class="content" >{{ item.placeHolder }}</div>
								<div class="error_tip" v-if="item.error">
									<i class="anticon anticon-exclamation-circle"></i>
								</div>
							</div>
							<addNode v-model:childNodeP="item.childNode" :current-node="item"/>
						</div>
					</div>
					<nodeWrap v-if="item.childNode" v-model:nodeConfig="item.childNode"/>
					<template v-if="index == 0">
						<div class="top-left-cover-line"></div>
						<div class="bottom-left-cover-line"></div>
					</template>
					<template v-if="index == nodeConfig.conditionNodes.length - 1">
						<div class="top-right-cover-line"></div>
						<div class="bottom-right-cover-line"></div>
					</template>
				</div>
			</div>
			<addNode v-model:childNodeP="nodeConfig.childNode" :current-node="nodeConfig"/>
		</div>
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
