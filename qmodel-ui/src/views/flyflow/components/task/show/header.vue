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

<script setup >

import {onMounted} from 'vue'
import {ref, defineExpose} from "vue";

defineExpose({loadData})

const emits = defineEmits(['getFlowValue']);


function loadData(d) {
    emits('getFlowValue',d);
    currentData.value=d;
}

const currentData = ref({})

onMounted(() => {

});



</script>

<template>
  <div style="position: relative">


    <div style="display: flex;flex-direction: row">
      <div class="f11">
        <img src="../../../assets/images/task-icon.png" alt="" srcset="">
      </div>
      <div class="f22">
        <div class="tit">
          <div class="f01"> {{ currentData?.processName }}</div>
        </div>
        <div class="code">
          {{ currentData?.processInstanceBizCode }}
        </div>
      </div>
    </div>
    <img v-if="currentData.processInstanceResult==1" class="iconclass" src="../../../assets/images/pass.png"/>
    <img v-if="currentData.processInstanceResult==2" class="iconclass" src="../../../assets/images/refuse.png"/>
    <img v-if="currentData.processInstanceResult==3" class="iconclass" src="../../../assets/images/canceled.png"/>

  </div>

</template>

<style scoped lang="less">
.f11 {
  padding: 10px;
  text-align: center;
  img{
    height: 45px;
  }
}

.f22 {
  display: flex;
  flex-direction: column;
  justify-content: center;
  .tit{
    font-family: PingFang SC, PingFang SC;
    font-weight: 600;
    font-size: 14px;
    color: #333333;
  }

  .code{
    font-family: Microsoft YaHei, Microsoft YaHei;
    font-weight: 400;
    font-size: 14px;
    color: #949494;
  }
}

.iconclass {
  height: 64px;
  position: absolute;
  top: 0px;
  right: 30px;
}
@f02_width:20px;

.f01{
  width: calc(100% - @f02_width);
}
.f02{
  width: @f02_width;
  cursor: pointer;
}
</style>
