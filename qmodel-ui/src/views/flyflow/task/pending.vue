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

<script setup lang="ts">
    import TaskHandle from '../components/task/handler/task.vue';

    import { ref, reactive, onMounted } from 'vue';

    import { getTask, queryMineTask } from '../api/task';

    import pagination from '../components/pagination.vue';
    import { Picture, DocumentCopy, Position } from '@element-plus/icons-vue';
    import { copyToBoard, isNotBlank } from '../utils/objutil';

    const loading = ref(false);
    const total = ref(0);

    const copy = (value) => {
        copyToBoard(value);
    };

    const queryParams = reactive({
        pageNum: 1,
        pageSize: 10
    });

    const roleList = ref();

    const taskHandler = ref();
    /**
     * 点击开始处理
     * @param row
     */
    const deal = (row) => {
        getTask(row.taskId).then((res) => {
            var d = {
                taskId: row.taskId,
                processInstanceId: row.processInstanceId,
                flowId: row.flowId
            };

            taskHandler.value.deal(d);
        });
    };

    //流程编码的表格宽度
    const processInstanceBizCodeWidth = ref(200);

    /**
     * 查询
     */
    function handleQuery() {
        loading.value = true;
        queryMineTask(queryParams)
            .then(({ data }) => {
                for (var itm of data.records) {
                    let number = itm.processInstanceBizCode?.length * 12;
                    if (number > processInstanceBizCodeWidth.value) {
                        processInstanceBizCodeWidth.value = number;
                    }
                }
                roleList.value = data.records;
                total.value = data.total;
            })
            .finally(() => {
                loading.value = false;
            });
    }
    import { LocationQuery, LocationQueryValue, useRoute, useRouter } from 'vue-router';

    const route = useRoute();

    onMounted(() => {
        handleQuery();

        const query: LocationQuery = route.query;

        if (isNotBlank(query.taskId)) {
            //跳转过来的
            deal({ taskId: query.taskId });
        }
    });
</script>

<template>
    <div class="app-container">
		<div class="pagecont-top" style="margin-bottom: 15px">
            <el-form
                class="btn-style"
                :model="queryParams"
                ref="queryRef"
                :inline="true"
                label-width="75px"
            >
                <el-form-item label="流程编码" prop="id">
                    <el-input
                        class="el-form-input-width"
                        v-model="queryParams.id"
                        placeholder="请输入流程编码"
                        clearable
                    />
                </el-form-item>

                <el-form-item label="发起人" prop="leader">
                    <el-input
                        class="el-form-input-width"
                        v-model="queryParams.leader"
                        placeholder="请输入发起人"
                        clearable
                    />
                </el-form-item>
                <el-form-item>
                    <el-button type="primary">
                        <i class="iconfont-mini icon-a-chaxunxianxing mr5"></i>查询
                    </el-button>
                    <el-button>
                        <i class="iconfont-mini icon-a-shuaxinxianxing mr5"></i>重置
                    </el-button>
                </el-form-item>
            </el-form>
        </div>
        <el-card shadow="never">
            <el-table
                ref="dataTableRef"
                v-loading="loading"
                :data="roleList"
                highlight-current-row
                
            >
                <el-table-column label="分组" prop="groupName" min-width="100" />
                <el-table-column label="流程" prop="processName" min-width="200" />
                <el-table-column
                    label="编码"
                    prop="processInstanceBizCode"
                    :width="processInstanceBizCodeWidth"
                >
                    <template #default="scope">
                        <el-text>
                            <el-icon @click="copy(scope.row.processInstanceBizCode)">
                                <DocumentCopy />
                            </el-icon>
                            {{ scope.row.processInstanceBizCode }}
                        </el-text>
                    </template>
                </el-table-column>
                <el-table-column label="发起人" prop="rootUserName" width="150" />
                <el-table-column label="发起时间" prop="startTime" width="180" />
                <el-table-column label="当前节点" prop="taskName" width="150" />
                <el-table-column label="任务时间" prop="taskCreateTime" width="180" />

                <el-table-column fixed="right" width="100" label="操作">
                    <template #default="scope">
                        <el-button type="primary" size="small" link @click="deal(scope.row)">
                            <el-icon>
                                <Position />
                            </el-icon>
                            开始处理
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>

            <pagination
                v-if="total > 0"
                v-model:total="total"
                v-model:page="queryParams.pageNum"
                v-model:limit="queryParams.pageSize"
                @pagination="handleQuery"
                class="pagination-container"
            />
        </el-card>
        <task-handle ref="taskHandler" @taskSubmitEvent="handleQuery"></task-handle>
    </div>
</template>
