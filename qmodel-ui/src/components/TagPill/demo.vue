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
