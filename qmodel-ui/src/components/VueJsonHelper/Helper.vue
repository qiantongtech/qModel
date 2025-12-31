<template>
  <el-row :class="borderFlag?'el-row-border':''" :style="shadowFlag?'box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)':''">
    <el-col v-if="isJson" class="item-body">
      <div class="tip">
        注！每一个输入框或者下拉框按顺序所对应的含义分别是：
        <span>参数名称</span>-<span>参数类型</span>-<span>参数值</span>-<span>参数说明</span><br>
        <template v-if="namesTwo != null && namesTwo.length != 0">
          <div style="display: flex">
            <div style="width: 48%;">
              <span>当前接口输出参数有：</span><br>
              <span v-for="(value,index) in names" :key="index" style="margin-left: 32px;" v-if="JSON.stringify(jsonStr).indexOf(Object.keys(value)[0]) != -1">
                <span v-for="(valueTwo,key) in value" v-if="JSON.stringify(jsonStr).indexOf(key) != -1">
                  {{ key }}:{{ valueTwo }}
                </span><br>
              </span>
            </div>
            <div style="width: 48%;">
              <span>当前接口设置参数有：</span><br>
              <span v-for="(value,index) in namesTwo" :key="index" style="margin-left: 32px;">
                <span v-for="(valueTwo,key) in value">
                    {{ key }}:{{ valueTwo }}
                </span><br>
              </span>
            </div>
          </div>

        </template>
      </div>
      <Item
        :item="item"
        :deep="deep"
        :parent="item"
        :names="names"
        :size="size"
        :index="0"
        :rootFlag="rootFlag"
        :openFlag="openFlag"
        :delete-flag="deleteFlag"
        @addIllustrate="handleAddIllustrate"
      />
    </el-col>
    <el-col v-else>
      <i>{{ errorResult }}</i>
    </el-col>
    <el-backtop v-if="backTopFlag"></el-backtop>
  </el-row>
</template>

<script>
import Item from "./Item";

export default {
  name: "VueJsonHelper",
  components: {
    "Item": Item,
  },
  data() {
    return {
      deep: 0,
      isJson: false,
      jsonData: undefined,
      errorResult: undefined,
      item: {
        key: "根",
        value: null,
        type: null,
        remark: null,
        isRoot: true,
        childs: [],
      },
    };
  },
  props: {
    names: {
      type: Array,
    },
    namesTwo: {
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
  },
  watch: {
    item: {
      handler(newVal, oldVal) {
        if (newVal == oldVal) {
          var json = this.handleJsonData(newVal);
          if (json != undefined) {
            this.$emit("jsonListener", json);
          }
        }
      },
      immediate: true,
      deep: true,
    },
    jsonStr: {
      handler(newVal, oldVal) {
        this.isJson = this.judgeJson();
        this.item.childs = this.handleJson(this.jsonData);
        this.item.type = this.handleType();
      }
    }
  },
  created() {
    this.isJson = this.judgeJson();
    this.item.childs = this.handleJson(this.jsonData);
    this.item.type = this.handleType();
  },
  computed:{

  },
  methods: {
    handleAddIllustrate(item) {
      this.$emit('handleAddIllustrate', item);
    },
    /**判断是否为json */
    judgeJson() {
      var flag = false;
      try {
        this.jsonData = JSON.parse(this.jsonStr);
        flag = true;
      } catch (e) {
        this.errorResult = e;
        flag = false;
      }
      return flag;
    },
    /**处理JSONData数据 */
    handleJsonData(jsonData) {
      var objs = {};
      var arr = [];
      let type = jsonData.type;
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
            objs[childs[i].key] = this.handleJsonData(childs[i]);
          } else if (type == "Array") {
            arr.push(this.handleJsonData(childs[i]));
          }
        }
      }
      if (type == "Object") {
        return objs;
      } else if (type == "Array") {
        return arr;
      }
    },
    /**处理JSON数据 */
    handleJson(json) {
      var jsonData = [];
      for (var i in json) {
        let type = this.judgeType(json[i]);
        let n = undefined;
        let names = this.names;
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
            childs: this.handleJson(json[i]),
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
    },
    /**判断数据类型 */
    judgeType(data) {
      let type = Object.prototype.toString.call(data);
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
    },
    /**处理根节点数据类型 */
    handleType() {
      return this.judgeType(this.jsonData);
    },
  },
};
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

.el-row-border {
  padding: 20px 10px;
  border: 1px solid #eeeeee;
  border-radius: 10px;
}

.tip {
  font-family: Helvetica Neue, Helvetica, PingFang SC, Hiragino Sans GB, Microsoft YaHei, SimSun, sans-serif;
  font-weight: 400;
  -webkit-font-smoothing: antialiased;
  -webkit-tap-highlight-color: transparent;
  padding: 8px 16px;
  background-color: #ecf8ff;
  border-radius: 4px;
  border-left: 5px solid #50bfff;
}
</style>
