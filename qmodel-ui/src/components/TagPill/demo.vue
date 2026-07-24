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
    <div class="demo-container">
        <div class="demo-header">
            <h2>QtTagPill 圆角标签组件演示</h2>
            <el-button type="primary" plain @click="goToQtTag" class="nav-button">
                返回QtTag样式
            </el-button>
        </div>

        <!-- 六种类型演示 -->
        <div class="demo-section">
            <h3>1. 六种类型标签</h3>
            <QtTagPill type="default" name="默认标签" />
            <QtTagPill type="primary" name="主要标签" />
            <QtTagPill type="success" name="成功标签" />
            <QtTagPill type="warning" name="警告标签" />
            <QtTagPill type="danger" name="危险标签" />
            <QtTagPill type="info" name="信息标签" />
        </div>

        <!-- 大小控制 -->
        <div class="demo-section">
            <h3>2. 大小控制</h3>
            <QtTagPill type="primary" name="大标签" size="large" />
            <QtTagPill type="primary" name="默认标签" size="default" />
            <QtTagPill type="primary" name="小标签" size="small" />
        </div>

        <!-- 组合使用 -->
        <div class="demo-section">
            <h3>3. 组合使用示例</h3>
            <div>
                <QtTagPill type="success" name="已完成" size="small" />
                <QtTagPill type="warning" name="进行中" size="default" />
                <QtTagPill type="danger" name="已取消" size="large" />
            </div>
        </div>

        <!-- 实际应用场景 -->
        <div class="demo-section">
            <h3>4. 实际应用场景</h3>
            <div class="scenario">
                <p>任务状态：</p>
                <QtTagPill type="success" name="已完成" />
                <QtTagPill type="warning" name="待处理" />
                <QtTagPill type="danger" name="已过期" />
            </div>
            <div class="scenario">
                <p>优先级：</p>
                <QtTagPill type="danger" name="紧急" />
                <QtTagPill type="warning" name="高" />
                <QtTagPill type="primary" name="中" />
                <QtTagPill type="info" name="低" />
            </div>
        </div>
    </div>
</template>

<script setup>
    import { useRouter } from 'vue-router';
    import QtTagPill from './index.vue';

    const router = useRouter();

    // 跳转到QtTag页面
    const goToQtTag = () => {
        router.push('/Tag');
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
        background: #f8f9fa;
        border-radius: 8px;
        border: 1px solid #e4e7ed;
    }

    h3 {
        color: #606266;
        margin-bottom: 15px;
        font-size: 16px;
    }

    .qt-tag-pill {
        margin-right: 10px;
        margin-bottom: 10px;
    }

    .scenario {
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .scenario p {
        margin: 0;
        color: #606266;
        font-weight: 500;
        min-width: 80px;
    }

    /* 响应式设计 */
    @media (max-width: 768px) {
        .demo-container {
            padding: 10px;
        }

        .scenario {
            flex-direction: column;
            align-items: flex-start;
        }

        .scenario p {
            margin-bottom: 5px;
        }
    }
</style>
