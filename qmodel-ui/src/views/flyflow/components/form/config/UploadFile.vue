<script setup lang="ts">
import { computed, defineExpose } from "vue";

let props = defineProps({
  id: {
    type: String,
    default: "",
  },
});

import {getCurrentConfig} from "../../../utils/objutil";

var config = computed(() => {

	return getCurrentConfig(props.id);
});


</script>

<template>
	<div v-if="config">

    <el-form-item label="最小数量">
      <el-input-number
        v-model="config.props.min"
        style="width: 100%"
        controls-position="right"
        :min="1"
		value-on-clear="min"

        :max="10"
      />
    </el-form-item>
    <el-form-item label="最大数量">
      <el-input-number
        v-model="config.props.max"
        style="width: 100%"
        controls-position="right"
        :min="1"
		value-on-clear="max"

        :max="10"
      />
    </el-form-item>

    <el-form-item label="文件大小(MB)">
      <el-input-number
        v-model="config.props.maxSize"
        style="width: 100%"
        controls-position="right"
        :min="0.01"
		value-on-clear="max"

        :max="10"
      />
    </el-form-item>

    <el-form-item label="文件后缀(jpg,jpeg,png)">
      <el-select
        v-model="config.props.suffixArray"
        style="width: 100%"
        multiple
        filterable
        allow-create
        default-first-option
        :reserve-keyword="false"
        placeholder="请输入支持的后缀，回车确定"
      >
      </el-select>
    </el-form-item>
  </div>
</template>

<style scoped lang="less"></style>
