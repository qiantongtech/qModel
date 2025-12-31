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


  setPromoter,

  setStarterConfig,

} = store;


let _uid = getCurrentInstance().uid;




function open(){

  //TODO
  setPromoter(true);
  setStarterConfig({
    value: JSON.parse(JSON.stringify(props.nodeConfig)),
    flag: false,
    id: _uid,
  });
}

import NodeTemplate from "./node-template.vue";

</script>

<template>
  <node-template :uid="_uid" store-data-key="starterConfigData" @updateData="updateParentData" place-holder-method-name="starterStr" check-method-name="checkStarter" @open="open"   :node-config="nodeConfig"></node-template>
</template>

<style scoped lang="less">
</style>
