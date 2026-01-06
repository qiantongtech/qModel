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
            <i
              :class="
                hidden
                  ? 'el-icon-caret-right'
                  : 'el-icon-caret-bottom el-icon-blue'
              "
            ></i>
          </el-link>
          <i v-else style="margin-left: 14px"></i>
        </div>
        <div
          class="item-key item-cell"
        >
          <el-input
            v-model="item.key"
            :placeholder="parent.type == 'Array' ? '' : '请输入键'"
            :size="size"
            :disabled="!deleteFlag"
            @change="judgement(item.key)"
          ></el-input>
        </div>
        <div class="item-type item-cell">
          <el-select
            v-model="item.type"
            :size="size"
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
            :size="size"
            v-model="item.value"
            v-if="item.type != 'Number' && item.type != 'Boolean'"
            :placeholder="
              item.type == 'Array' || item.type == 'Object' ? '' : '请输入值'
            "
            :disabled="
              item.type == 'Array' || item.type == 'Object' || !deleteFlag ? true : false
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
            :size="size"
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
            :size="size"
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
            <el-link :underline="false" @click="addItem()"><i class="el-icon-plus el-icon-blue"></i></el-link>
          </el-tooltip>
          <el-popconfirm
            title="确定删除当前节点吗？"
            @confirm="delItem"
            v-if="!item.isRoot"
          >
            <template #reference>
<el-link

              :underline="false"
              class="item-control-cell"
            ><i class="el-icon-close el-icon-dim"></i></el-link>
</template>
          </el-popconfirm>
        </div>
      </div>
    </el-row>
    <div :style="hidden ? 'display: none' : 'display: block'">
      <template v-if="item.childs && item.type == 'Object'">
        <span v-for="(child, index) in item.childs" :key="index">
          <VueJsonItem
            :size="size"
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
            :size="size"
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

<script>
export default {
  name: "VueJsonItem",
  props: {
    item: {
      type: Object,
      default: {
        key: "",
        value: "",
        type: "",
        remark: "",
      },
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
      default: true
    }
  },
  mounted() {
    this.getName()
  },
  watch: {
    deleteFlag() {
      console.log(this.deleteFlag)
    }
  },
  data() {
    return {
      hidden: !this.openFlag,
      newdeep: this.deep + 1,
      options: [
        { value: "String", labal: "String" },
        { value: "Object", labal: "Object" },
        { value: "Array", labal: "Array" },
        { value: "Number", labal: "Number" },
        { value: "Boolean", labal: "Boolean" },
      ],
      rootOptions: [
        { value: "Object", labal: "Object" },
        { value: "Array", labal: "Array" },
      ],
    };
  },
  methods: {
    /**增加元素 */
    addItem() {
      let childs = this.item.childs;
      let type = this.item.type;
      let count = 0;
      if (childs[childs.length - 1] != undefined) {
        count = parseInt(childs[childs.length - 1].key) + 1;
      }
      let additem = undefined;
      if (type != "Array") {
        additem = { type: "String", childs: null, value: "" };
      } else {
        console.log(childs[childs.length - 1])
        additem = {
          key: count,
          type: childs[childs.length - 1] == undefined ? "String" : childs[childs.length - 1].type,
          childs: childs[childs.length - 1] == undefined ? [] : childs[childs.length - 1].childs,
          value: "",
        };
      }
      this.$set(childs, childs.length, additem);
    },
    /**删除元素 */
    delItem() {
      let childs = this.parent.childs;
      let item = this.item;
      for (let i in childs) {
        if (childs[i] == item) {
          childs.splice(i, 1);
        }
      }
    },
    /** 判断key值是否重复 */
    judgement(key) {
    },
    /** 备注说明添加 */
    addIllustrate(item) {
      this.$emit('addIllustrate', item);
    },
    /**更改类型 */
    changeSelect(option) {
      if (option == "Array" || option == "Object") {
        this.item.childs = [];
        this.item.value = null;
      } else if (option == "Number") {
        this.item.childs = null;
        this.item.value = 0;
      } else if (option == "Boolean") {
        this.item.childs = null;
        this.item.value = true;
      }
    },
    /**判断是否为空 */
    isNull(e) {
      let flag = false;
      if (e == null || e == "" || e == undefined) {
        flag = true;
      }
      if (e == 0) {
        flag = false;
      }
      return flag;
    },
    /**通过key获取中文 */
    getName() {
      let n = undefined;
      let names = this.names;
      for (let i in names) {
        let name = names[i];
        if (Object.keys(name)[0] == this.item.key) {
          n = name[Object.keys(name)[0]];
          break;
        }
      }
      if (n != undefined) {
        this.item.remark=n
      } else {
        this.item.remark=""
      }
    },
  },
};
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

