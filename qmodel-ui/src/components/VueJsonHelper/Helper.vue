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
    <el-row
        :class="borderFlag ? 'el-row-border' : ''"
        :style="shadowFlag ? 'box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)' : ''"
    >
        <el-col v-if="isJson" class="item-body">
            <div class="tip">
                注！每一个输入框或者下拉框按顺序所对应的含义分别是：
                <span>参数名称</span>-<span>参数类型</span>-<span>参数值</span>-<span>参数说明</span
                ><br />
                <template v-if="namesTwo != null && namesTwo.length != 0">
                    <div style="display: flex">
                        <div style="width: 48%">
                            <span>当前接口输出参数有：</span><br />
                            <span
                                v-for="(value, index) in names"
                                :key="index"
                                style="margin-left: 32px"
                                v-if="JSON.stringify(jsonStr).indexOf(Object.keys(value)[0]) != -1"
                            >
                                <span
                                    v-for="(valueTwo, key) in value"
                                    v-if="JSON.stringify(jsonStr).indexOf(key) != -1"
                                >
                                    {{ key }}:{{ valueTwo }} </span
                                ><br />
                            </span>
                        </div>
                        <div style="width: 48%">
                            <span>当前接口设置参数有：</span><br />
                            <span
                                v-for="(value, index) in namesTwo"
                                :key="index"
                                style="margin-left: 32px"
                            >
                                <span v-for="(valueTwo, key) in value">
                                    {{ key }}:{{ valueTwo }} </span
                                ><br />
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

<script setup>
    import { ref, reactive, watch, onMounted } from 'vue';
    import Item from './Item';

    // Define component name
    defineOptions({
        name: 'VueJsonHelper'
    });

    // Props
    const props = defineProps({
        names: {
            type: Array
        },
        namesTwo: {
            type: Array
        },
        size: {
            type: String,
            default: 'small'
        },
        jsonStr: {
            type: String
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
        key: '根',
        value: null,
        type: null,
        remark: null,
        isRoot: true,
        childs: []
    });

    // Methods
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
        let type = jsonData.type;
        var childs = jsonData.childs;
        for (var i in childs) {
            if (childs[i].type != 'Object' && childs[i].type != 'Array') {
                if (type == 'Object') {
                    objs[childs[i].key] = childs[i].value;
                } else if (type == 'Array') {
                    arr.push(childs[i].value);
                }
            } else {
                if (type == 'Object') {
                    objs[childs[i].key] = handleJsonData(childs[i]);
                } else if (type == 'Array') {
                    arr.push(handleJsonData(childs[i]));
                }
            }
        }
        if (type == 'Object') {
            return objs;
        } else if (type == 'Array') {
            return arr;
        }
    };

    /**处理JSON数据 */
    const handleJson = (json) => {
        var jsonData = [];
        for (var i in json) {
            let type = judgeType(json[i]);
            let n = undefined;
            let names = props.names;
            for (let j in names) {
                let name = names[j];
                if (Object.keys(name)[0] == i) {
                    n = name[Object.keys(name)[0]];
                    break;
                }
            }
            if (type == 'Object' || type == 'Array') {
                var item = {
                    key: i,
                    value: null,
                    type: type,
                    remark: n == undefined ? '' : n,
                    childs: handleJson(json[i])
                };
                jsonData.push(item);
            } else {
                var item = {
                    key: i,
                    value: json[i],
                    type: type,
                    remark: n == undefined ? '' : n
                };
                jsonData.push(item);
            }
        }
        return jsonData;
    };

    /**判断数据类型 */
    const judgeType = (data) => {
        let type = Object.prototype.toString.call(data);
        if (type === '[object String]') {
            type = 'String';
        } else if (type === '[object Number]') {
            type = 'Number';
        } else if (type === '[object Boolean]') {
            type = 'Boolean';
        } else if (type === '[object Array]') {
            type = 'Array';
        } else if (type === '[object Object]') {
            type = 'Object';
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
    watch(
        item,
        (newVal, oldVal) => {
            var json = handleJsonData(newVal);
            if (json != undefined) {
                emit('jsonListener', json);
            }
        },
        {
            immediate: true,
            deep: true
        }
    );

    watch(
        () => props.jsonStr,
        (newVal, oldVal) => {
            isJson.value = judgeJson();
            item.childs = handleJson(jsonData.value);
            item.type = handleType();
        }
    );

    // Lifecycle hooks
    onMounted(() => {
        isJson.value = judgeJson();
        item.childs = handleJson(jsonData.value);
        item.type = handleType();
        console.log(props.size, 'daixo');
    });

    // Other methods
    const handleAddIllustrate = (item) => {
        emit('handleAddIllustrate', item);
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
        font-family: Helvetica Neue, Helvetica, PingFang SC, Hiragino Sans GB, Microsoft YaHei,
            SimSun, sans-serif;
        font-weight: 400;
        -webkit-font-smoothing: antialiased;
        -webkit-tap-highlight-color: transparent;
        padding: 8px 16px;
        background-color: #ecf8ff;
        border-radius: 4px;
        border-left: 5px solid #50bfff;
    }
</style>
