<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<template>
    <div class="app-container" ref="app-container">
        <div class="pagecont-top">
            <el-form
                class="btn-style"
                :model="queryParams"
                ref="queryRef"
                :inline="true"
                label-width="68px"
            >
                <el-form-item label="登录地址" prop="ipaddr">
                    <el-input
                        v-model="queryParams.ipaddr"
                        placeholder="请输入登录地址"
                        clearable
                        class="el-form-input-width"
                        @keyup.enter="handleQuery"
                    />
                </el-form-item>
                <el-form-item label="用户名称" prop="userName">
                    <el-input
                        v-model="queryParams.userName"
                        placeholder="请输入用户名称"
                        clearable
                        class="el-form-input-width"
                        @keyup.enter="handleQuery"
                    />
                </el-form-item>
                <el-form-item>
                    <el-button
                        plain
                        type="primary"
                        @click="handleQuery"
                        @mousedown="(e) => e.preventDefault()"
                    >
                        <i class="iconfont-mini icon-a-zu22377 mr5"></i>查询
                    </el-button>
                    <el-button @click="resetQuery" @mousedown="(e) => e.preventDefault()">
                        <i class="iconfont-mini icon-a-zu22378 mr5"></i>重置
                    </el-button>
                </el-form-item>
            </el-form>
        </div>
        <div class="pagecont-bottom">
            <el-table
                height="58vh"
                stripe
                v-loading="loading"
                :data="onlineList.slice((pageNum - 1) * pageSize, pageNum * pageSize)"
                style="width: 100%"
            >
                <el-table-column label="编号" width="80" type="index" align="center">
                    <template #default="scope">
                        <span>{{ (pageNum - 1) * pageSize + scope.$index + 1 }}</span>
                    </template>
                </el-table-column>
                <el-table-column
                    label="会话编号"
                    prop="tokenId"
                    :show-overflow-tooltip="{ effect: 'light' }"
                />
                <el-table-column
                    label="登录名称"
                    prop="nickName"
                    :show-overflow-tooltip="{ effect: 'light' }"
                />
                <el-table-column
                    label="所属部门"
                    align="center"
                    prop="deptName"
                    :show-overflow-tooltip="{ effect: 'light' }"
                />
                <el-table-column
                    label="主机"
                    align="center"
                    prop="ipaddr"
                    :show-overflow-tooltip="{ effect: 'light' }"
                />
                <el-table-column
                    label="登录地点"
                    align="center"
                    prop="loginLocation"
                    :show-overflow-tooltip="{ effect: 'light' }"
                />
                <el-table-column
                    label="操作系统"
                    align="center"
                    prop="os"
                    :show-overflow-tooltip="{ effect: 'light' }"
                />
                <el-table-column
                    label="浏览器"
                    align="center"
                    prop="browser"
                    :show-overflow-tooltip="{ effect: 'light' }"
                />
                <el-table-column label="登录时间" align="center" prop="loginTime" width="180">
                    <template #default="scope">
                        <span>{{ parseTime(scope.row.loginTime) }}</span>
                    </template>
                </el-table-column>
                <el-table-column
                    label="操作"
                    align="center"
                    class-name="small-padding fixed-width"
                    fixed="right"
                    width="240"
                >
                    <template #default="scope">
                        <el-button
                            link
                            type="danger"
                            @click="handleForceLogout(scope.row)"
                            v-hasPermi="['monitor:online:forceLogout']"
                        >
                            <i class="iconfont-mini icon-a-shanchuxianxing"></i>
                            强退</el-button
                        >
                    </template>
                </el-table-column>
            </el-table>

            <pagination
                v-show="total > 0"
                :total="total"
                v-model:page="pageNum"
                v-model:limit="pageSize"
            />
        </div>
    </div>
</template>

<script setup name="Online">
    import { forceLogout, list as initData } from '@/api/system/monitor/online.js';

    const { proxy } = getCurrentInstance();

    const onlineList = ref([]);
    const loading = ref(true);
    const total = ref(0);
    const pageNum = ref(1);
    const pageSize = ref(10);

    const queryParams = ref({
        ipaddr: undefined,
        userName: undefined
    });

    /** 查询登录日志列表 */
    function getList() {
        loading.value = true;
        initData(queryParams.value).then((response) => {
            onlineList.value = response.rows;
            total.value = response.total;
            loading.value = false;
        });
    }

    /** 搜索按钮操作 */
    function handleQuery() {
        pageNum.value = 1;
        getList();
    }

    /** 重置按钮操作 */
    function resetQuery() {
        proxy.resetForm('queryRef');
        handleQuery();
    }

    /** 强退按钮操作 */
    function handleForceLogout(row) {
        proxy.$modal
            .confirm('是否确认强退名称为"' + row.userName + '"的用户?')
            .then(function () {
                return forceLogout(row.tokenId);
            })
            .then(() => {
                getList();
                proxy.$modal.msgSuccess('删除成功');
            })
            .catch(() => {});
    }

    getList();
</script>
