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

<script setup lang="ts">
import {getCurrentInstance, computed, onMounted, ref, watch} from "vue";


let props = defineProps({

  nodeConfig: {
    type: Object, default: () => {

    }
  }

});






import {useStore} from "../../../stores";



let emits = defineEmits(['updateData']);


const updateParentData = (d) => {
  emits("updateData", d);

}


//TODO
let store = useStore();
let {


  setDelay,

  setDelayConfig,

} = store;


let _uid = getCurrentInstance().uid;



function open(){

  //TODO
  setDelay(true);
  setDelayConfig({
    value: JSON.parse(JSON.stringify(props.nodeConfig)),
    flag: false,
    id: _uid,
  });
}

import NodeTemplate from "./node-template.vue";

</script>

<template>
  <node-template :uid="_uid" store-data-key="delayConfigData" @updateData="updateParentData" place-holder-method-name="delayStr" check-method-name="checkDelay" @open="open"   :node-config="nodeConfig"></node-template>
</template>

<style scoped lang="less">
</style>
