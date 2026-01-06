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
    <div class="demo-container">
        <div class="demo-header">
            <h2>QtTag 组件演示</h2>
            <el-button type="primary" plain @click="goToQtTagPill" class="nav-button">
                QtTagPill样式
            </el-button>
        </div>

        <!-- 基本用法 -->
        <div class="demo-section">
            <h3>1. 基本用法</h3>
            <QtTag type="primary" name="主要标签" />
            <QtTag type="success" name="成功标签" />
            <QtTag type="warning" name="警告标签" />
            <QtTag type="danger" name="危险标签" />
            <QtTag type="info" name="信息标签" />
            <QtTag type="default" name="默认标签" />
        </div>

        <!-- 大小控制 -->
        <div class="demo-section">
            <h3>2. 大小控制</h3>
            <QtTag type="primary" name="大标签" size="large" />
            <QtTag type="primary" name="默认标签" size="default" />
            <QtTag type="primary" name="小标签" size="small" />
        </div>

        <!-- 六种类型默认颜色 -->
        <div class="demo-section">
            <h3>3. 六种类型默认颜色</h3>
            <div class="color-grid">
                <div class="color-item">
                    <QtTag type="default" name="默认" />
                    <span>default - 灰色</span>
                </div>
                <div class="color-item">
                    <QtTag type="primary" name="主要" />
                    <span>primary - 蓝色</span>
                </div>
                <div class="color-item">
                    <QtTag type="success" name="成功" />
                    <span>success - 绿色</span>
                </div>
                <div class="color-item">
                    <QtTag type="warning" name="警告" />
                    <span>warning - 黄色</span>
                </div>
                <div class="color-item">
                    <QtTag type="danger" name="危险" />
                    <span>danger - 红色</span>
                </div>
                <div class="color-item">
                    <QtTag type="info" name="信息" />
                    <span>info - 紫色</span>
                </div>
            </div>
        </div>

        <!-- 可关闭标签
        <div class="demo-section">
            <h3>4. 可关闭标签</h3>
            <QtTag type="primary" name="可关闭标签" :closable="true" @close="handleClose" />
            <QtTag type="success" name="成功标签" :closable="true" @close="handleClose" />
            <QtTag type="danger" name="危险标签" :closable="true" @close="handleClose" />
        </div> -->

        <!-- 边框描边 -->
        <!-- <div class="demo-section">
            <h3>5. 边框描边</h3>
            <QtTag type="primary" name="有边框标签" :hit="true" />
            <QtTag type="success" name="无边框标签" :hit="false" />
        </div> -->

        <!-- 主题效果 -->
        <!-- <div class="demo-section">
            <h3>6. 主题效果</h3>
            <QtTag type="primary" name="浅色主题" effect="light" />
            <QtTag type="primary" name="深色主题" effect="dark" />
            <QtTag type="primary" name="朴素主题" effect="plain" />
        </div> -->

        <!-- 点击事件 -->
        <!-- <div class="demo-section">
            <h3>7. 点击事件</h3>
            <QtTag type="primary" name="点击我" @click="handleClick" />
            <QtTag type="success" name="可点击标签" @click="handleClick" />
            <QtTag type="warning" name="警告标签" @click="handleClick" />
        </div> -->

        <!-- 组合使用 -->
        <!-- <div class="demo-section">
            <h3>8. 组合使用示例</h3>
            <QtTag
                type="success"
                name="小成功标签"
                size="small"
                :closable="true"
                :hit="true"
                @close="handleClose"
                @click="handleClick"
            />
            <QtTag
                type="danger"
                name="大危险标签"
                size="large"
                :closable="true"
                effect="dark"
                @close="handleClose"
                @click="handleClick"
            />
        </div> -->

        <!-- 实际应用场景 -->
        <div class="demo-section">
            <h3>9. 实际应用场景</h3>
            <div class="scenario">
                <p>任务状态：</p>
                <QtTag type="success" name="已完成" />
                <QtTag type="warning" name="进行中" />
                <QtTag type="danger" name="已取消" />
            </div>
            <div class="scenario">
                <p>优先级：</p>
                <QtTag type="danger" name="紧急" />
                <QtTag type="warning" name="高" />
                <QtTag type="primary" name="中" />
                <QtTag type="info" name="低" />
            </div>
            <div class="scenario">
                <p>用户角色：</p>
                <QtTag type="primary" name="管理员" />
                <QtTag type="success" name="编辑者" />
                <QtTag type="default" name="查看者" />
            </div>
        </div>

        <!-- 动态数据演示 -->
        <!-- <div class="demo-section">
            <h3>10. 动态数据演示</h3>
            <div class="dynamic-tags">
                <QtTag
                    v-for="tag in dynamicTags"
                    :key="tag.id"
                    :type="tag.type"
                    :name="tag.name"
                    :size="tag.size"
                    :closable="tag.closable"
                    @close="() => removeTag(tag.id)"
                />
            </div>
            <button @click="addTag" class="add-btn">添加标签</button>
        </div> -->
    </div>
</template>

<script setup>
    import { ref } from 'vue';
    import { useRouter } from 'vue-router';
    import QtTag from './index.vue';

    const router = useRouter();

    // 跳转到QtTagPill页面
    const goToQtTagPill = () => {
        router.push('/TagPill');
    };

    // 事件处理函数
    const handleClose = () => {
        console.log('标签关闭事件触发');
        ElMessage.success('标签已关闭');
    };

    const handleClick = () => {
        console.log('标签点击事件触发');
        ElMessage.info('标签被点击了');
    };

    // 动态标签数据
    const dynamicTags = ref([
        { id: 1, type: 'primary', name: '动态标签1', size: 'default', closable: true },
        { id: 2, type: 'success', name: '动态标签2', size: 'small', closable: true },
        { id: 3, type: 'warning', name: '动态标签3', size: 'default', closable: false }
    ]);

    let tagId = 4;

    const addTag = () => {
        const types = ['primary', 'success', 'warning', 'danger', 'info', 'default'];
        const sizes = ['small', 'default', 'large'];

        const newTag = {
            id: tagId++,
            type: types[Math.floor(Math.random() * types.length)],
            name: `标签${tagId}`,
            size: sizes[Math.floor(Math.random() * sizes.length)],
            closable: Math.random() > 0.5
        };

        dynamicTags.value.push(newTag);
    };

    const removeTag = (id) => {
        dynamicTags.value = dynamicTags.value.filter((tag) => tag.id !== id);
    };
</script>

<style scoped>
    .demo-container {
        padding: 20px;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        background: #f5f7fa;
        min-height: 100vh;
    }

    .demo-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 2px solid #409eff;
    }

    .demo-header h2 {
        color: #303133;
        margin: 0;
        text-align: left;
    }

    .nav-button {
        margin-left: auto;
    }

    .demo-section {
        margin-bottom: 30px;
        padding: 20px;
        background: #ffffff;
        border-radius: 8px;
        border: 1px solid #e4e7ed;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h3 {
        color: #606266;
        margin-bottom: 15px;
        font-size: 16px;
        font-weight: 600;
    }

    .qt-tag {
        margin-right: 10px;
        margin-bottom: 10px;
    }

    .color-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 15px;
    }

    .color-item {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px;
        background: #f8f9fa;
        border-radius: 6px;
    }

    .color-item span {
        color: #606266;
        font-size: 14px;
    }

    .scenario {
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px;
        background: #f8f9fa;
        border-radius: 6px;
    }

    .scenario p {
        margin: 0;
        color: #606266;
        font-weight: 500;
        min-width: 80px;
    }

    .dynamic-tags {
        margin-bottom: 15px;
        min-height: 40px;
        border: 1px dashed #dcdfe6;
        border-radius: 4px;
        padding: 10px;
        background: #fafafa;
    }

    .add-btn {
        padding: 8px 16px;
        background: #409eff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }

    .add-btn:hover {
        background: #66b1ff;
    }

    /* 响应式设计 */
    @media (max-width: 768px) {
        .demo-container {
            padding: 10px;
        }

        .color-grid {
            grid-template-columns: 1fr;
        }

        .scenario {
            flex-direction: column;
            align-items: flex-start;
        }

        .scenario p {
            margin-bottom: 5px;
        }
    }
    :deep(.el-tag) {
        margin-right: 10px;
    }
</style>
