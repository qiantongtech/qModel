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
    <span
        class="qt-tag-pill"
        :class="[type, size]"
        :style="{
            backgroundColor: computedBackgroundColor,
            color: computedColor
        }"
    >
        {{ name }}
    </span>
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
            default: '标签'
        },
        // 标签大小
        size: {
            type: String,
            default: '',
            validator: (value) => ['large', 'small'].includes(value)
        }
    });

    // 字体颜色（固定为白色）
    const computedColor = computed(() => '#ffffff');

    // 根据类型计算背景颜色
    const computedBackgroundColor = computed(() => {
        const bgColorMap = {
            default: '#909399',
            primary: ' #2666FB',
            success: '#009E21',
            warning: '#8737A3',
            danger: '#FF8C00',
            info: '#EC544D'
        };
        return bgColorMap[props.type] || '#909399';
    });
</script>

<style scoped>
    .qt-tag-pill {
        display: inline-block;
        padding: 0 9px;
        height: 22px;
        line-height: 22px;
        font-size: 14px;
        border-radius: 8px 8px 8px 0px;
        box-sizing: border-box;
        white-space: nowrap;
        font-weight: 500;
        border: none;
        cursor: default;
        user-select: none;
    }

    /* 大小样式 */
    .qt-tag-pill.small {
        padding: 0 9px;
        height: 20px;
        line-height: 20px;
        font-size: 14px;
        border-radius: 6px 6px 6px 0px;
    }

    .qt-tag-pill.large {
        padding: 0 9px;
        height: 24px;
        line-height: 24px;
        font-size: 14px;
        border-radius: 10px 10px 10px 0px;
    }

    /* 类型样式 */
    .qt-tag-pill.default {
        background-color: #909399;
        color: #ffffff;
    }

    .qt-tag-pill.primary {
        background-color: #409eff;
        color: #ffffff;
    }

    .qt-tag-pill.success {
        background-color: #67c23a;
        color: #ffffff;
    }

    .qt-tag-pill.warning {
        background-color: #e6a23c;
        color: #ffffff;
    }

    .qt-tag-pill.danger {
        background-color: #f56c6c;
        color: #ffffff;
    }

    .qt-tag-pill.info {
        background-color: #909399;
        color: #ffffff;
    }

    /* 悬停效果 */
    .qt-tag-pill:hover {
        opacity: 0.9;
        transition: opacity 0.2s ease;
    }

    /* 禁用状态 */
    .qt-tag-pill:disabled {
        opacity: 0.6;
        cursor: not-allowed;
    }
</style>
