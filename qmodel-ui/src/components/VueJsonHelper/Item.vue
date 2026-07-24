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

<template>
  <div>
    <el-row
      :style="'padding-left: ' + (newdeep - 1) * 15 + 'px; margin-top: 5px'"
    >
      <div class="item" v-if="rootFlag">
        <div
          :class="
            size == 'mini'
              ? 'item-control-mini'
              : size == 'small'
              ? 'item-control-small'
              : 'item-control-medium'
          "
          @click="hidden = !hidden"
        >
          <el-link :underline="false" v-if="item.childs != null">
            <CaretRight v-if="hidden" class="el-icon" />
            <CaretBottom v-else class="el-icon el-icon-blue" />
          </el-link>
          <span v-else style="display: inline-block; width: 14px"></span>
        </div>
        <div class="item-key item-cell">
          <el-input
            v-model="item.key"
            :placeholder="parent.type == 'Array' ? '' : '请输入键'"
            :disabled="!deleteFlag"
            @change="judgement(item.key)"
          ></el-input>
        </div>
        <div class="item-type item-cell">
          <el-select
            v-model="item.type"
            placeholder="请选择"
            :disabled="!deleteFlag"
            @change="changeSelect"
            class="select-body"
          >
            <el-option
              v-for="type in item.isRoot ? rootOptions : options"
              :key="type.value"
              :label="type.label"
              :value="type.value"
            >
            </el-option>
          </el-select>
        </div>
        <div class="item-value item-cell">
          <el-input
            v-model="item.value"
            v-if="item.type != 'Number' && item.type != 'Boolean'"
            :placeholder="
              item.type == 'Array' || item.type == 'Object' ? '' : '请输入值'
            "
            :disabled="
              item.type == 'Array' || item.type == 'Object' || !deleteFlag
                ? true
                : false
            "
            :class="
              size == 'mini'
                ? 'el-width-mini'
                : size == 'small'
                ? 'el-width-small'
                : 'el-width-medium'
            "
          ></el-input>
          <el-input-number
            v-model="item.value"
            v-else-if="item.type == 'Number'"
            :disabled="!deleteFlag"
            :class="
              size == 'mini'
                ? 'el-width-mini'
                : size == 'small'
                ? 'el-width-small'
                : 'el-width-medium'
            "
          ></el-input-number>
          <el-radio-group
            v-model="item.value"
            v-else
            :disabled="!deleteFlag"
            :class="
              size == 'mini'
                ? 'el-width-mini'
                : size == 'small'
                ? 'el-width-small'
                : 'el-width-medium'
            "
          >
            <el-radio class="el-radio" :label="true">是</el-radio>
            <el-radio class="el-radio" :label="false">否</el-radio>
          </el-radio-group>
        </div>
        <div class="item-value item-cell input-cell" v-if="!item.isRoot">
          <el-input
            v-model="item.remark"
            placeholder="备注说明"
            :disabled="!deleteFlag"
            @change="addIllustrate(item)"
            :class="
              size == 'mini'
                ? 'el-width-mini'
                : size == 'small'
                ? 'el-width-small'
                : 'el-width-medium'
            "
          >
          </el-input>
        </div>
        <div
          :class="
            size == 'mini'
              ? 'item-control-mini'
              : size == 'small'
              ? 'item-control-small'
              : 'item-control-medium'
          "
          v-if="deleteFlag"
        >
          <el-tooltip
            class="item-control-cell"
            content="添加子元素"
            placement="top"
            v-if="item.type == 'Array' || item.type == 'Object'"
          >
            <el-link
              :underline="false"
              @click="addItem()"
              class="item-control-cell"
            >
              <Plus class="el-icon el-icon-blue"
            /></el-link>
          </el-tooltip>
          <el-popconfirm
            title="确定删除当前节点吗？"
            @confirm="delItem"
            v-if="!item.isRoot"
          >
            <template #reference>
              <el-link :underline="false" class="item-control-cell"
                ><Close class="el-icon el-icon-dim"></Close
              ></el-link>
            </template>
          </el-popconfirm>
        </div>
      </div>
    </el-row>
    <div :style="hidden ? 'display: none' : 'display: block'">
      <template v-if="item.childs && item.type == 'Object'">
        <span v-for="(child, index) in item.childs" :key="index">
          <VueJsonItem
            :item="child"
            :parent="item"
            :names="names"
            :deep="newdeep"
            :delete-flag="deleteFlag"
            :openFlag="openFlag"
            @addIllustrate="addIllustrate"
          />
        </span>
      </template>
      <template v-if="item.childs && item.type == 'Array'">
        <span v-for="(child, index) in item.childs" :key="index">
          <VueJsonItem
            :item="child"
            :parent="item"
            :index="index"
            :names="names"
            :delete-flag="deleteFlag"
            :deep="newdeep"
            :openFlag="openFlag"
            @addIllustrate="addIllustrate"
            v-if="index < 50"
          />
        </span>
      </template>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, watch, onMounted } from "vue";

// Define component name
defineOptions({
  name: "VueJsonItem",
});

// Props
const props = defineProps({
  item: {
    type: Object,
    default: () => ({
      key: "",
      value: "",
      type: "",
      remark: "",
    }),
  },
  names: {
    type: Array,
  },
  parent: {
    type: Object,
  },
  index: {
    type: Number,
    default: 0,
  },
  deep: {
    type: Number,
    default: 0,
  },
  size: {
    type: String,
    default: "small",
  },
  rootFlag: {
    type: Boolean,
    default: true,
  },
  openFlag: {
    type: Boolean,
    default: true,
  },
  deleteFlag: {
    type: Boolean,
    default: true,
  },
});

// Emits
const emit = defineEmits(["addIllustrate"]);

// Reactive data
const hidden = ref(!props.openFlag);
const newdeep = ref(props.deep + 1);
const options = ref([
  { value: "String", label: "String" },
  { value: "Object", label: "Object" },
  { value: "Array", label: "Array" },
  { value: "Number", label: "Number" },
  { value: "Boolean", label: "Boolean" },
]);
const rootOptions = ref([
  { value: "Object", label: "Object" },
  { value: "Array", label: "Array" },
]);

// Check if there's a typo in the options - there isn't one based on the original content

// Methods
/**增加元素 */
const addItem = () => {
  let childs = props.item.childs;
  let type = props.item.type;
  let count = 0;
  if (childs && childs.length > 0 && childs[childs.length - 1] != undefined) {
    count = parseInt(childs[childs.length - 1].key) + 1;
  }
  let additem = undefined;
  if (type != "Array") {
    additem = { type: "String", childs: null, value: "" };
  } else {
    console.log(
      childs && childs.length > 0 ? childs[childs.length - 1] : undefined
    );
    additem = {
      key: count,
      type:
        childs && childs.length > 0 && childs[childs.length - 1] == undefined
          ? "String"
          : childs[childs.length - 1].type,
      childs:
        childs && childs.length > 0 && childs[childs.length - 1] == undefined
          ? []
          : childs[childs.length - 1].childs,
      value: "",
    };
  }
  if (childs) {
    childs.push(additem);
  }
};

/**删除元素 */
const delItem = () => {
  let childs = props.parent.childs;
  let item = props.item;
  for (let i in childs) {
    if (childs[i] == item) {
      childs.splice(i, 1);
    }
  }
};

/** 判断key值是否重复 */
const judgement = (key) => {
  // 空实现
};

/** 备注说明添加 */
const addIllustrate = (item) => {
  emit("addIllustrate", item);
};

/**更改类型 */
const changeSelect = (option) => {
  if (option == "Array" || option == "Object") {
    props.item.childs = [];
    props.item.value = null;
  } else if (option == "Number") {
    props.item.childs = null;
    props.item.value = 0;
  } else if (option == "Boolean") {
    props.item.childs = null;
    props.item.value = true;
  }
};

/**判断是否为空 */
const isNull = (e) => {
  let flag = false;
  if (e == null || e == "" || e == undefined) {
    flag = true;
  }
  if (e == 0) {
    flag = false;
  }
  return flag;
};

/**通过key获取中文 */
const getName = () => {
  let n = undefined;
  let names = props.names;
  if (names) {
    for (let i in names) {
      let name = names[i];
      if (Object.keys(name)[0] == props.item.key) {
        n = name[Object.keys(name)[0]];
        break;
      }
    }
  }
  if (n != undefined) {
    props.item.remark = n;
  } else {
    props.item.remark = "";
  }
};

// Watchers
watch(
  () => props.deleteFlag,
  (newVal) => {
    console.log(newVal);
  }
);

// Lifecycle hooks
onMounted(() => {
  getName();
});
</script>

<style scoped lang="scss">
/*@import "element-ui/lib/theme-chalk/index.css";*/
.item {
  display: flex;
}

.item-control-mini {
  height: 26px;
  line-height: 24px;
}

.item-control-small {
  height: 30px;
  line-height: 28px;
}

.item-control-medium {
  height: 32px;
  line-height: 30px;
}

.item-control-cell {
  margin-left: 10px;
  font-size: 16px;
}

.item-cell {
  padding-left: 10px;
}

.el-icon-blue {
  color: #409eff;
}

.el-icon-green {
  color: #67c23a;
}

.el-icon-dim {
  color: #909399;
}

.item-key {
  width: 150px;
}

.item-type {
  width: 120px;
}

.el-tag {
  text-align: center;
  width: 100px;
}

.el-width-medium {
  width: 208.67px;
  height: 34px;
  line-height: 34px;
  text-align: center;
}

.el-width-small {
  width: 193.33px;
  height: 30px;
  line-height: 30px;
  text-align: center;
}

.el-width-mini {
  width: 178px;
  height: 26px;
  line-height: 26px;
  text-align: center;
}

.el-radio {
  height: 32px;
  line-height: 32px;
}

.item-name-medium {
  height: 35px;
  line-height: 33px;
}

.item-name-small {
  height: 32px;
  line-height: 30px;
}

.item-name-mini {
  height: 28px;
  line-height: 26px;
}

@media screen and (max-width: 700px) {
  .select-body {
    width: 100px;
  }
  .input-body {
    width: 130px;
  }
}
</style>
