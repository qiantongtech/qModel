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

    <div class="fd-nav-content">
      <section class="dingflow-design">
        <div class="zoom" v-if="!readOnly">
          <div class="zoom-out" :class="nowVal == 50 && 'disabled'" @click="zoomSize(1)"></div>
          <span>{{ nowVal }}%</span>
          <div class="zoom-in" :class="nowVal == 300 && 'disabled'" @click="zoomSize(2)"></div>
        </div>
        <div class="box-scale" :style="`transform: scale(${ nowVal / 100});`" style="z-index: 1">
          <nodeWrap v-model:nodeConfig="nodeConfig"/>
          <div class="end-node">
            <div class="end-node-circle"></div>
            <div class="end-node-text">流程结束</div>
          </div>
        </div>
      </section>
    </div>
    <promoterDrawer/>
    <approverDrawer/>
    <copyerDrawer/>
    <conditionDrawer/>

    <delayDrawer/>

  </div>
</template>

<script setup>
import nodeWrap from "../node/nodeWrap.vue"
import {ref,inject,watch ,defineExpose} from "vue";
import promoterDrawer from "../drawer/promoterDrawer.vue";
import approverDrawer from "../drawer/approverDrawer.vue";
import copyerDrawer from "../drawer/copyerDrawer.vue";
import delayDrawer from "../drawer/delayDrawer.vue";
import conditionDrawer from "../drawer/conditionDrawer.vue";

import {useFlowStore} from "../../stores/flow";

const readOnly = inject('readOnlyAtFlow') // 导入

import {nodeData} from "../../utils/const.js";
import {getAllNodeExceptBranch} from "../../utils/nodeutil.js";
import {deepCopy} from "../../utils/objutil.js";


let tipList = ref([]);
let nowVal = ref(100);
let nodeConfig = ref();

let props = defineProps({


  nodeConfigObj: {
    type: Object,
    default: () => {
    }
  }
});


watch(() => props.nodeConfigObj, (val) => {
	if(val.length==0){
	  nodeConfig.value=deepCopy(nodeData[0])
	}else{
	  nodeConfig.value = val
	}
}, {deep: true})

const reErr = (childNode) => {
  if (childNode) {

    let {type, error, nodeName, conditionNodes} = childNode;

    if (type == 3) {
      reErr(childNode.childNode);
    } else if (type == 4 || type == 8) {
      reErr(childNode.childNode);
			var nullNum=0;

      for (var i = 0; i < conditionNodes.length; i++) {
				let conditionNode = conditionNodes[i];
				if (conditionNode.error) {
          tipList.value.push('请设置' + conditionNode.nodeName + '的条件');
        }
        reErr(conditionNode.childNode);

				if(!conditionNode.childNode){
					nullNum++;
				}
      }
			if(nullNum===conditionNodes.length){
				tipList.value.push(nodeName + " ：分支下节点不能为空");
			}
    } else if (type == 5) {
      reErr(childNode.childNode);
			var nullNum=0;
      for (var i = 0; i < conditionNodes.length; i++) {
				let cNode = conditionNodes[i].childNode;
			 	if(!cNode){
					nullNum++;
				}
				reErr(cNode);
      }
			if(nullNum===conditionNodes.length){
				tipList.value.push(nodeName + " ：分支下节点不能为空");
			}
    } else {
      if (error) {

        tipList.value.push(nodeName + " ：未配置完成");
      }
      reErr(childNode.childNode);
    }
  } else {
    childNode = null;
  }
};

let store = useFlowStore();


watch(() => nodeConfig.value, (v) => {
  store.setStep3(v)
}, {deep: true})
const getProcessData = async () => {

  return nodeConfig.value
};
const zoomSize = (type) => {
  if (type == 1) {
    if (nowVal.value == 50) {
      return;
    }
    nowVal.value -= 10;
  } else {
    if (nowVal.value == 300) {
      return;
    }
    nowVal.value += 10;
  }
};
const validate = (f) => {


  tipList.value = [];

  let allNodeExportBranch = getAllNodeExceptBranch(nodeConfig.value);

  if (allNodeExportBranch.length==0) {
    tipList.value = ['请完善流程节点']
  }


  reErr(nodeConfig.value);
  if (tipList.value.length != 0) {
    f(false, tipList.value)
    return
  }
  f(true)
}
defineExpose({validate, getProcessData});

</script>
<style scoped>
@import "../../css/workflow.css";

.error-modal-list {
  width: 455px;
}
</style>
