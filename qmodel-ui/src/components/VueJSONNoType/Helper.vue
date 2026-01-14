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
  <el-row :class="borderFlag?'el-row-border':''" :style="shadowFlag?'box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)':''">
    <el-col v-if="isJson"  class="item-body">
      <Item
        :item="item"
        :deep="deep"
        :parent="item"
        :names="names"
        :size="size"
        :index="0"
        :delete-flag="deleteFlag"
        :rootFlag="rootFlag"
        :openFlag="openFlag"
        @addIllustrate="handleAddIllustrate"
      />
    </el-col>
    <el-col v-else>
      <i>{{ errorResult }}</i>
    </el-col>
    <el-backtop v-if="backTopFlag"></el-backtop>
  </el-row>
</template>

<script setup>
import { ref, reactive, watch, onMounted } from 'vue';
import Item from "./Item";

// Define component name
defineOptions({
  name: "VueJsonHelperNoType"
});

// Props
const props = defineProps({
  names: {
    type: Array,
  },
  size: {
    type: String,
    default: 'small'
  },
  jsonStr: {
    type: String,
  },
  rootFlag: {
    type: Boolean,
    default: true
  },
  openFlag: {
    type: Boolean,
    default: true
  },
  borderFlag: {
    type: Boolean,
    default: true
  },
  shadowFlag: {
    type: Boolean,
    default: false
  },
  backTopFlag: {
    type: Boolean,
    default: false
  },
  deleteFlag: {
    type: Boolean,
    default: true
  }
});

// Emits
const emit = defineEmits(['jsonListener', 'handleAddIllustrate']);

// Reactive data
const deep = ref(0);
const isJson = ref(false);
const jsonData = ref(undefined);
const errorResult = ref(undefined);
const item = reactive({
  key: "Root",
  value: null,
  type: null,
  remark: null,
  isRoot: true,
  childs: [],
});

// Methods
const handleAddIllustrate = (item) => {
  emit('handleAddIllustrate', item);
};

/**判断是否为json */
const judgeJson = () => {
  var flag = false;
  try {
    jsonData.value = JSON.parse(props.jsonStr);
    flag = true;
  } catch (e) {
    errorResult.value = e;
    flag = false;
  }
  return flag;
};

/**处理JSONData数据 */
const handleJsonData = (jsonData) => {
  var objs = {};
  var arr = [];
  var type = jsonData.type;
  var childs = jsonData.childs;
  for (var i in childs) {
    if (childs[i].type != "Object" && childs[i].type != "Array") {
      if (type == "Object") {
        objs[childs[i].key] = childs[i].value;
      } else if (type == "Array") {
        arr.push(childs[i].value);
      }
    } else {
      if (type == "Object") {
        objs[childs[i].key] = handleJsonData(childs[i]);
      } else if (type == "Array") {
        arr.push(handleJsonData(childs[i]));
      }
    }
  }
  if (type == "Object") {
    return objs;
  } else if (type == "Array") {
    return arr;
  }
};

/**处理JSON数据 */
const handleJson = (json) => {
  var jsonData = [];
  for (var i in json) {
    var type = judgeType(json[i]);
    let n = undefined;
    let names = props.names;
    for (let j in names) {
      let name = names[j];
      if (Object.keys(name)[0] == i) {
        n = name[Object.keys(name)[0]];
        break;
      }
    }
    if (type == "Object" || type == "Array") {
      var item = {
        key: i,
        value: null,
        type: type,
        remark: n == undefined ? "" : n,
        childs: handleJson(json[i]),
      };
      jsonData.push(item);
    } else {
      var item = {
        key: i,
        value: json[i],
        type: type,
        remark: n == undefined ? "" : n,
      };
      jsonData.push(item);
    }
  }
  return jsonData;
};

/**判断数据类型 */
const judgeType = (data) => {
  var type = Object.prototype.toString.call(data);
  if (type === "[object String]") {
    type = "String";
  } else if (type === "[object Number]") {
    type = "Number";
  } else if (type === "[object Boolean]") {
    type = "Boolean";
  } else if (type === "[object Array]") {
    type = "Array";
  } else if (type === "[object Object]") {
    type = "Object";
  } else {
    type = null;
  }
  return type;
};

/**处理根节点数据类型 */
const handleType = () => {
  return judgeType(jsonData.value);
};

// Watchers
watch(item, (newVal, oldVal) => {
  if (newVal == oldVal) {
    var json = handleJsonData(newVal);
    if (json != undefined) {
      emit("jsonListener", json);
    }
  }
}, { immediate: true, deep: true });

watch(() => props.jsonStr, (newVal, oldVal) => {
  isJson.value = judgeJson();
  item.childs = handleJson(jsonData.value);
  item.type = handleType();
});

// Lifecycle hooks
onMounted(() => {
  isJson.value = judgeJson();
  item.childs = handleJson(jsonData.value);
  item.type = handleType();
});
</script>

<style scoped>
/*@import "element-ui/lib/theme-chalk/index.css";*/
@media screen and (max-width: 700px) {
  .item-body {
    white-space: nowrap;
    overflow-x: scroll;
    overflow-y: hidden;
  }
}
.content {
  color: #888;
}
.el-row-border{
  padding: 20px 10px;
  border: 1px solid #eeeeee ;
  border-radius: 10px;
  height: 500px;
  width: 740px;
  margin-left: 10px;
  overflow: auto;
}

.el-row-border::-webkit-scrollbar {
  width: 3px;
}

.el-row-border::-webkit-scrollbar-thumb {
  background: #8798af;
  border-radius: 2px;
}

.el-row-border::-webkit-scrollbar-track {
  background: transparent;
}
</style>
