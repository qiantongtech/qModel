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
