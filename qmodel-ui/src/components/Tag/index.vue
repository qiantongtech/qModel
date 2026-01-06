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
    <el-tag
        :type="type"
        :size="size"
        :color="computedBackgroundColor"
        :style="{
            color: computedColor,
            borderColor: computedBorderColor
        }"
        :closable="closable"
        :disable-transitions="disableTransitions"
        :hit="hit"
        :effect="effect"
    >
        {{ name }}
    </el-tag>
</template>

<script setup>
    import { computed } from 'vue';

    const props = defineProps({
        // 标签类型
        type: {
            type: String,
            default: 'primary',
            validator: (value) =>
                ['default', 'primary', 'success', 'warning', 'danger', 'info'].includes(value)
        },
        // 标签名称
        name: {
            type: String,
            default: 'Tag 1'
        },
        // 标签大小
        size: {
            type: String,
            default: 'default',
            validator: (value) => ['large', 'default', 'small'].includes(value)
        },
        // 是否可关闭
        closable: {
            type: Boolean,
            default: false
        },
        // 是否禁用渐变动画
        disableTransitions: {
            type: Boolean,
            default: false
        },
        // 是否有边框描边
        hit: {
            type: Boolean,
            default: false
        },
        // 主题
        effect: {
            type: String,
            default: 'light',
            validator: (value) => ['dark', 'light', 'plain'].includes(value)
        }
    });

    // 根据类型计算默认颜色
    const computedColor = computed(() => {
        const colorMap = {
            default: '#909399',
            primary: '#2666FB',
            success: '#009E21',
            warning: '#FF8C00',
            danger: '#EC544D',
            info: '#8737A3'
        };
        return colorMap[props.type] || '#606266';
    });

    const computedBackgroundColor = computed(() => {
        const bgColorMap = {
            default: '#f4f5f5',
            primary: '#e9efff',
            success: '#e5f5e8',
            warning: '#fff8e5',
            danger: '#fdeeed',
            info: '#f3ebf6'
        };
        return bgColorMap[props.type] || '#f4f4f5';
    });

    const computedBorderColor = computed(() => {
        const borderColorMap = {
            default: '#d3d4d6',
            primary: '#2666FB',
            success: '#009E21',
            warning: '#FFB800',
            danger: '#EC544D',
            info: '#8737A3'
        };
        return borderColorMap[props.type] || '#d3d4d6';
    });

    // 定义事件
    defineEmits(['close', 'click']);
</script>

<style scoped>
    /* .el-tag {
        margin: 2px;
    } */
    .el-tag {
        font-size: 14px !important;
        padding: 0px 12px !important;
    }
</style>
