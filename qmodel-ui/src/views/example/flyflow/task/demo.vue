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
    <div class="app-container">
        <div class="page-content">
            <div class="tabs-wrap">
                <el-tabs v-model="activeName">
                    <el-tab-pane
                        :label="item.name"
                        :name="item.value"
                        v-for="item in tabList"
                        :key="item.value"
                    />
                </el-tabs>
            </div>

            <div class="coms-wrap">
                <PendingComponent v-if="activeName === 'pending'" />
                <StartedComponent v-if="activeName === 'started'" />
                <CompletedComponent v-if="activeName === 'completed'" />
                <CcComponent v-if="activeName === 'cc'" />
            </div>
        </div>
    </div>
</template>

<script setup>
    import PendingComponent from '@/views/flyflow/task/pending.vue';
    import StartedComponent from '@/views/flyflow/task/started.vue';
    import CompletedComponent from '@/views/flyflow/task/completed.vue';
    import CcComponent from '@/views/flyflow/task/cc.vue';

    const activeName = ref('pending');
    const tabList = [
        {
            name: '代办任务',
            value: 'pending'
        },
        {
            name: '我发起的',
            value: 'started'
        },
        {
            name: '我的已办',
            value: 'completed'
        },
        {
            name: '抄送我的',
            value: 'cc'
        }
    ];
</script>

<style lang="scss" scoped>
    .tabs-wrap {
        background-color: #fff;
        padding: 0 15px;
        ::v-deep(.el-tabs__header) {
            margin-bottom: 0px;
        }
    }

    .page-content {
        background-color: #f1f2f5;
    }
</style>

<style lang="scss">
    .coms-wrap {
        .app-container {
            margin: 0;
            background-color: #f1f2f5;
            min-height: fit-content;
        }
    }
</style>
