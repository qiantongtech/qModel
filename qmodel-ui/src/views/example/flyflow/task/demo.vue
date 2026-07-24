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
