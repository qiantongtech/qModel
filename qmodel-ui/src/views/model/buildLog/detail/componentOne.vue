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
    <div class="justify-between mb15">
        <el-row :gutter="15" class="btn-style">
            <el-col :span="1.5">
                <el-button
                    type="primary"
                    plain
                    @click="handleAdd"
                    v-hasPermi="['buildLog:modelBuildLog:add']"
                    @mousedown="(e) => e.preventDefault()"
                >
                    <i class="iconfont-mini icon-xinzeng mr5"></i>新增
                </el-button>
            </el-col>
            <el-col :span="1.5">
                <el-button
                    type="warning"
                    plain
                    :disabled="multiple"
                    @click="handleExport"
                    v-hasPermi="['buildLog:modelBuildLog:export']"
                    @mousedown="(e) => e.preventDefault()"
                >
                    <i class="iconfont-mini icon-download-line mr5"></i>导出
                </el-button>
            </el-col>
        </el-row>
        <div class="justify-end top-right-btn">
            <right-toolbar
                v-model:showSearch="showSearch"
                @queryTable="getList"
                :columns="columns"
            ></right-toolbar>
        </div>
    </div>
    <el-table
        stripe
        height="374px"
        v-loading="loading"
        :data="modelBuildLogList"
        @selection-change="handleSelectionChange"
        :default-sort="defaultSort"
        @sort-change="handleSortChange"
    >
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column v-if="columns[0].visible" label="ID" align="center" prop="id" />
        <el-table-column
            v-if="columns[1].visible"
            label="模型文件id"
            align="center"
            prop="resourceId"
        >
            <template #default="scope">
                {{ scope.row.resourceId || '-' }}
            </template>
        </el-table-column>
        <el-table-column v-if="columns[2].visible" label="模型id" align="center" prop="modelId">
            <template #default="scope">
                {{ scope.row.modelId || '-' }}
            </template>
        </el-table-column>
        <el-table-column v-if="columns[3].visible" label="模型名称" align="center" prop="modelName">
            <template #default="scope">
                {{ scope.row.modelName || '-' }}
            </template>
        </el-table-column>
        <el-table-column v-if="columns[4].visible" label="版本id" align="center" prop="versionId">
            <template #default="scope">
                {{ scope.row.versionId || '-' }}
            </template>
        </el-table-column>
        <el-table-column v-if="columns[5].visible" label="构建类型" align="center" prop="buildType">
            <template #default="scope">
                {{ scope.row.buildType || '-' }}
            </template>
        </el-table-column>
        <el-table-column v-if="columns[6].visible" label="构建状态" align="center" prop="status">
            <template #default="scope">
                {{ scope.row.status || '-' }}
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[7].visible"
            label="开始时间"
            align="center"
            prop="startTime"
            width="180"
        >
            <template #default="scope">
                <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[8].visible"
            label="结束时间"
            align="center"
            prop="endTime"
            width="180"
        >
            <template #default="scope">
                <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
            </template>
        </el-table-column>
        <el-table-column v-if="columns[9].visible" label="执行耗时" align="center" prop="duration">
            <template #default="scope">
                {{ scope.row.duration || '-' }}
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[10].visible"
            label="已存在的依赖包列表JSON"
            align="center"
            prop="installedPackages"
        >
            <template #default="scope">
                {{ scope.row.installedPackages || '-' }}
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[11].visible"
            label="缺失失败的依赖包列表JSON"
            align="center"
            prop="missingPackages"
        >
            <template #default="scope">
                {{ scope.row.missingPackages || '-' }}
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[12].visible"
            label="安装失败的依赖包列表JSON"
            align="center"
            prop="failedPackages"
        >
            <template #default="scope">
                {{ scope.row.failedPackages || '-' }}
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[13].visible"
            label="dockerFile内容"
            align="center"
            prop="dockerfileContent"
        >
            <template #default="scope">
                {{ scope.row.dockerfileContent || '-' }}
            </template>
        </el-table-column>
        <el-table-column v-if="columns[14].visible" label="构建日志" align="center" prop="buildLog">
            <template #default="scope">
                {{ scope.row.buildLog || '-' }}
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[15].visible"
            label="错误日志"
            align="center"
            prop="errorMessage"
        >
            <template #default="scope">
                {{ scope.row.errorMessage || '-' }}
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[16].visible"
            label="requirements.txt 内容"
            align="center"
            prop="requirements"
        >
            <template #default="scope">
                {{ scope.row.requirements || '-' }}
            </template>
        </el-table-column>
        <el-table-column v-if="columns[19].visible" label="创建人" align="center" prop="createBy">
            <template #default="scope">
                {{ scope.row.createBy || '-' }}
            </template>
        </el-table-column>
        <el-table-column
            v-if="columns[21].visible"
            label="创建时间"
            align="center"
            prop="createTime"
            width="180"
            sortable="custom"
            :sort-orders="['descending', 'ascending']"
        >
            <template #default="scope">
                <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
            </template>
        </el-table-column>
        <el-table-column v-if="columns[25].visible" label="备注" align="center" prop="remark">
            <template #default="scope">
                {{ scope.row.remark || '-' }}
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
                    type="primary"
                    icon="Edit"
                    @click="handleUpdate(scope.row)"
                    v-hasPermi="['buildLog:modelBuildLog:edit']"
                    >修改</el-button
                >
                <el-button
                    link
                    type="danger"
                    icon="Delete"
                    @click="handleDelete(scope.row)"
                    v-hasPermi="['buildLog:modelBuildLog:remove']"
                    >删除</el-button
                >
                <el-button
                    link
                    type="primary"
                    icon="view"
                    @click="handleDetail(scope.row)"
                    v-hasPermi="['buildLog:modelBuildLog:edit']"
                    >详情</el-button
                >
            </template>
        </el-table-column>

        <template #empty>
            <div class="emptyBg">
                <img src="@/assets/system/images/no_data/noData.png" alt="" />
                <p>暂无记录</p>
            </div>
        </template>
    </el-table>

    <pagination
        v-show="total > 0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 添加或修改构建日志对话框 -->
    <el-dialog
        :title="title"
        v-model="open"
        width="800px"
        :append-to="$refs['app-container']"
        draggable
    >
        <template #header="{ close, titleId, titleClass }">
            <span role="heading" aria-level="2" class="el-dialog__title">
                {{ title }}
                <el-icon size="20" style="color: #909399; font-size: 16px">
                    <InfoFilled />
                </el-icon>
            </span>
            <button aria-label="el.dialog.close" class="el-dialog__headerbtn" type="button">
                <i class="el-icon el-dialog__close"
                    ><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024">
                        <path
                            fill="currentColor"
                            d="M764.288 214.592 512 466.88 259.712 214.592a31.936 31.936 0 0 0-45.12 45.12L466.752 512 214.528 764.224a31.936 31.936 0 1 0 45.12 45.184L512 557.184l252.288 252.288a31.936 31.936 0 0 0 45.12-45.12L557.12 512.064l252.288-252.352a31.936 31.936 0 1 0-45.12-45.184z"
                        ></path></svg
                ></i>
            </button>
        </template>
        <el-form ref="modelBuildLogRef" :model="form" :rules="rules" label-width="80px">
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="模型文件id" prop="resourceId">
                        <el-input v-model="form.resourceId" placeholder="请输入模型文件id" />
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="模型id" prop="modelId">
                        <el-input v-model="form.modelId" placeholder="请输入模型id" />
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="模型名称" prop="modelName">
                        <el-input v-model="form.modelName" placeholder="请输入模型名称" />
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="版本id" prop="versionId">
                        <el-input v-model="form.versionId" placeholder="请输入版本id" />
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20"> </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="开始时间" prop="startTime">
                        <el-date-picker
                            clearable
                            v-model="form.startTime"
                            type="date"
                            value-format="YYYY-MM-DD"
                            placeholder="请选择开始时间"
                        >
                        </el-date-picker>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="结束时间" prop="endTime">
                        <el-date-picker
                            clearable
                            v-model="form.endTime"
                            type="date"
                            value-format="YYYY-MM-DD"
                            placeholder="请选择结束时间"
                        >
                        </el-date-picker>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="执行耗时" prop="duration">
                        <el-input v-model="form.duration" placeholder="请输入执行耗时" />
                    </el-form-item>
                </el-col>
                <el-col :span="24">
                    <el-form-item label="已存在的依赖包列表JSON" prop="installedPackages">
                        <el-input
                            v-model="form.installedPackages"
                            type="textarea"
                            placeholder="请输入内容"
                        />
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="24">
                    <el-form-item label="缺失失败的依赖包列表JSON" prop="missingPackages">
                        <el-input
                            v-model="form.missingPackages"
                            type="textarea"
                            placeholder="请输入内容"
                        />
                    </el-form-item>
                </el-col>
                <el-col :span="24">
                    <el-form-item label="安装失败的依赖包列表JSON" prop="failedPackages">
                        <el-input
                            v-model="form.failedPackages"
                            type="textarea"
                            placeholder="请输入内容"
                        />
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="24">
                    <el-form-item label="dockerFile内容">
                        <editor v-model="form.dockerfileContent" :min-height="192" />
                    </el-form-item>
                </el-col>
                <el-col :span="24">
                    <el-form-item label="构建日志" prop="buildLog">
                        <el-input
                            v-model="form.buildLog"
                            type="textarea"
                            placeholder="请输入内容"
                        />
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="24">
                    <el-form-item label="错误日志" prop="errorMessage">
                        <el-input
                            v-model="form.errorMessage"
                            type="textarea"
                            placeholder="请输入内容"
                        />
                    </el-form-item>
                </el-col>
                <el-col :span="24">
                    <el-form-item label="requirements.txt 内容" prop="requirements">
                        <el-input
                            v-model="form.requirements"
                            type="textarea"
                            placeholder="请输入内容"
                        />
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="24">
                    <el-form-item label="备注" prop="remark">
                        <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>
        <template #footer>
            <div class="dialog-footer">
                <el-button size="mini" @click="cancel">取 消</el-button>
                <el-button type="primary" size="mini" @click="submitForm">确 定</el-button>
            </div>
        </template>
    </el-dialog>

    <!-- 构建日志详情对话框 -->
    <el-dialog
        :title="title"
        v-model="openDetail"
        width="800px"
        :append-to="$refs['app-container']"
        draggable
    >
        <template #header="{ close, titleId, titleClass }">
            <span role="heading" aria-level="2" class="el-dialog__title">
                {{ title }}
                <el-icon size="20" style="color: #909399; font-size: 16px">
                    <InfoFilled />
                </el-icon>
            </span>
            <button aria-label="el.dialog.close" class="el-dialog__headerbtn" type="button">
                <i class="el-icon el-dialog__close"
                    ><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024">
                        <path
                            fill="currentColor"
                            d="M764.288 214.592 512 466.88 259.712 214.592a31.936 31.936 0 0 0-45.12 45.12L466.752 512 214.528 764.224a31.936 31.936 0 1 0 45.12 45.184L512 557.184l252.288 252.288a31.936 31.936 0 0 0 45.12-45.12L557.12 512.064l252.288-252.352a31.936 31.936 0 1 0-45.12-45.184z"
                        ></path></svg
                ></i>
            </button>
        </template>
        <el-form ref="modelBuildLogRef" :model="form" label-width="80px">
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="模型文件id" prop="resourceId">
                        <div>
                            {{ form.resourceId }}
                        </div>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="模型id" prop="modelId">
                        <div>
                            {{ form.modelId }}
                        </div>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="模型名称" prop="modelName">
                        <div>
                            {{ form.modelName }}
                        </div>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="版本id" prop="versionId">
                        <div>
                            {{ form.versionId }}
                        </div>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="构建类型" prop="buildType">
                        <div>
                            {{ form.buildType }}
                        </div>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="构建状态" prop="status">
                        <div>
                            {{ form.status }}
                        </div>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="开始时间" prop="startTime">
                        <el-date-picker
                            clearable
                            v-model="form.startTime"
                            type="date"
                            value-format="YYYY-MM-DD"
                            placeholder="请选择开始时间"
                        >
                        </el-date-picker>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="结束时间" prop="endTime">
                        <el-date-picker
                            clearable
                            v-model="form.endTime"
                            type="date"
                            value-format="YYYY-MM-DD"
                            placeholder="请选择结束时间"
                        >
                        </el-date-picker>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="执行耗时" prop="duration">
                        <div>
                            {{ form.duration }}
                        </div>
                    </el-form-item>
                </el-col>
                <el-col :span="24">
                    <el-form-item label="已存在的依赖包列表JSON" prop="installedPackages">
                        <div>
                            {{ form.installedPackages }}
                        </div>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="24">
                    <el-form-item label="缺失失败的依赖包列表JSON" prop="missingPackages">
                        <div>
                            {{ form.missingPackages }}
                        </div>
                    </el-form-item>
                </el-col>
                <el-col :span="24">
                    <el-form-item label="安装失败的依赖包列表JSON" prop="failedPackages">
                        <div>
                            {{ form.failedPackages }}
                        </div>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="dockerFile内容">
                        <div v-html="form.dockerfileContent"></div>
                    </el-form-item>
                </el-col>
                <el-col :span="24">
                    <el-form-item label="构建日志" prop="buildLog">
                        <div>
                            {{ form.buildLog }}
                        </div>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="24">
                    <el-form-item label="错误日志" prop="errorMessage">
                        <div>
                            {{ form.errorMessage }}
                        </div>
                    </el-form-item>
                </el-col>
                <el-col :span="24">
                    <el-form-item label="requirements.txt 内容" prop="requirements">
                        <div>
                            {{ form.requirements }}
                        </div>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="24">
                    <el-form-item label="备注" prop="remark">
                        <div>
                            {{ form.remark }}
                        </div>
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>
        <template #footer>
            <div class="dialog-footer">
                <el-button size="mini" @click="cancel">关 闭</el-button>
            </div>
        </template>
    </el-dialog>
</template>

<script setup name="ComponentOne">
    import {
        listModelBuildLog,
        getModelBuildLog,
        delModelBuildLog,
        addModelBuildLog,
        updateModelBuildLog
    } from '@/api/model/buildLog/modelBuildLog';

    const { proxy } = getCurrentInstance();

    const modelBuildLogList = ref([]);

    // 列显隐信息
    const columns = ref([
        { key: 0, label: 'ID', visible: true },
        { key: 1, label: '模型文件id', visible: true },
        { key: 2, label: '模型id', visible: true },
        { key: 3, label: '模型名称', visible: true },
        { key: 4, label: '版本id', visible: true },
        { key: 5, label: '构建类型', visible: true },
        { key: 6, label: '构建状态', visible: true },
        { key: 7, label: '开始时间', visible: true },
        { key: 8, label: '结束时间', visible: true },
        { key: 9, label: '执行耗时', visible: true },
        { key: 10, label: '已存在的依赖包列表JSON', visible: true },
        { key: 11, label: '缺失失败的依赖包列表JSON', visible: true },
        { key: 12, label: '安装失败的依赖包列表JSON', visible: true },
        { key: 13, label: 'dockerFile内容', visible: true },
        { key: 14, label: '构建日志', visible: true },
        { key: 15, label: '错误日志', visible: true },
        { key: 16, label: 'requirements.txt 内容', visible: true },
        { key: 17, label: '是否有效', visible: true },
        { key: 18, label: '删除标志', visible: true },
        { key: 19, label: '创建人', visible: true },
        { key: 20, label: '创建人id', visible: true },
        { key: 21, label: '创建时间', visible: true },
        { key: 22, label: '更新人', visible: true },
        { key: 23, label: '更新人id', visible: true },
        { key: 24, label: '更新时间', visible: true },
        { key: 25, label: '备注', visible: true }
    ]);

    const open = ref(false);
    const openDetail = ref(false);
    const loading = ref(true);
    const showSearch = ref(true);
    const ids = ref([]);
    const single = ref(true);
    const multiple = ref(true);
    const total = ref(0);
    const title = ref('');
    const defaultSort = ref({ prop: 'createTime', order: 'desc' });

    const data = reactive({
        modelBuildLogDetail: {},
        form: {},
        queryParams: {
            pageNum: 1,
            pageSize: 10,
            resourceId: null,
            modelId: null,
            modelName: null,
            versionId: null,
            buildType: null,
            status: null,
            startTime: null,
            endTime: null,
            duration: null,
            installedPackages: null,
            missingPackages: null,
            failedPackages: null,
            dockerfileContent: null,
            buildLog: null,
            errorMessage: null,
            requirements: null,
            createTime: null
        },
        rules: {
            resourceId: [{ required: true, message: '模型文件id不能为空', trigger: 'blur' }],
            validFlag: [{ required: true, message: '是否有效不能为空', trigger: 'blur' }],
            delFlag: [{ required: true, message: '删除标志不能为空', trigger: 'blur' }],
            createTime: [{ required: true, message: '创建时间不能为空', trigger: 'blur' }],
            updateTime: [{ required: true, message: '更新时间不能为空', trigger: 'blur' }]
        }
    });

    const { queryParams, form, modelBuildLogDetail, rules } = toRefs(data);

    /** 查询构建日志列表 */
    function getList() {
        loading.value = true;
        listModelBuildLog(queryParams.value).then((response) => {
            modelBuildLogList.value = response.data.rows;
            total.value = response.data.total;
            loading.value = false;
        });
    }

    // 取消按钮
    function cancel() {
        open.value = false;
        openDetail.value = false;
        reset();
    }

    // 表单重置
    function reset() {
        form.value = {
            id: null,
            resourceId: null,
            modelId: null,
            modelName: null,
            versionId: null,
            buildType: null,
            status: null,
            startTime: null,
            endTime: null,
            duration: null,
            installedPackages: null,
            missingPackages: null,
            failedPackages: null,
            dockerfileContent: null,
            buildLog: null,
            errorMessage: null,
            requirements: null,
            validFlag: null,
            delFlag: null,
            createBy: null,
            creatorId: null,
            createTime: null,
            updateBy: null,
            updatorId: null,
            updateTime: null,
            remark: null
        };
        proxy.resetForm('modelBuildLogRef');
    }

    /** 搜索按钮操作 */
    function handleQuery() {
        queryParams.value.pageNum = 1;
        getList();
    }

    /** 重置按钮操作 */
    function resetQuery() {
        proxy.resetForm('queryRef');
        handleQuery();
    }

    // 多选框选中数据
    function handleSelectionChange(selection) {
        ids.value = selection.map((item) => item.id);
        single.value = selection.length != 1;
        multiple.value = !selection.length;
    }

    /** 排序触发事件 */
    function handleSortChange(column, prop, order) {
        queryParams.value.orderByColumn = column.prop;
        queryParams.value.isAsc = column.order;
        getList();
    }

    /** 新增按钮操作 */
    function handleAdd() {
        reset();
        open.value = true;
        title.value = '添加构建日志';
    }

    /** 修改按钮操作 */
    function handleUpdate(row) {
        reset();
        const _id = row.id || ids.value;
        getModelBuildLog(_id).then((response) => {
            form.value = response.data;
            open.value = true;
            title.value = '修改构建日志';
        });
    }

    /** 详情按钮操作 */
    function handleDetail(row) {
        reset();
        const _id = row.id || ids.value;
        getModelBuildLog(_id).then((response) => {
            form.value = response.data;
            openDetail.value = true;
            title.value = '构建日志详情';
        });
    }

    /** 提交按钮 */
    function submitForm() {
        proxy.$refs['modelBuildLogRef'].validate((valid) => {
            if (valid) {
                if (form.value.id != null) {
                    updateModelBuildLog(form.value)
                        .then((response) => {
                            proxy.$modal.msgSuccess('修改成功');
                            open.value = false;
                            getList();
                        })
                        .catch((error) => {});
                } else {
                    addModelBuildLog(form.value)
                        .then((response) => {
                            proxy.$modal.msgSuccess('新增成功');
                            open.value = false;
                            getList();
                        })
                        .catch((error) => {});
                }
            }
        });
    }

    /** 删除按钮操作 */
    function handleDelete(row) {
        const _ids = row.id || ids.value;
        proxy.$modal
            .confirm('是否确认删除构建日志编号为"' + _ids + '"的数据项？')
            .then(function () {
                return delModelBuildLog(_ids);
            })
            .then(() => {
                getList();
                proxy.$modal.msgSuccess('删除成功');
            })
            .catch(() => {});
    }

    /** 导出按钮操作 */
    function handleExport() {
        proxy.download(
            'model/modelBuildLog/export',
            {
                ...queryParams.value
            },
            `modelBuildLog_${new Date().getTime()}.xlsx`
        );
    }

    getList();
</script>
