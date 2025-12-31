<script setup lang="ts">

let props = defineProps({

  nodeUser: {
    type: Object,
    dafault: () => {
    }
  },
  row: {
    type: Array,
    dafault: () => []
  },
  disableSelect: {
    type: Boolean,
    default: false
  }

});



import FlowNodeFormatContent from "./FlowNodeFormatContent.vue";

</script>

<template>
  <div style="padding: 10px">

    <el-timeline :reverse="false" style="border: 0px solid red;">
      <flow-node-format-content :disable-select="disableSelect"
      :node-user="nodeUser"
                                :row="row"
      ></flow-node-format-content>
    </el-timeline>


  </div>
</template>

<style scoped lang="less">
ul{
  padding: 0px;
}
</style>
