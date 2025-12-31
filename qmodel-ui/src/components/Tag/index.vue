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
