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
