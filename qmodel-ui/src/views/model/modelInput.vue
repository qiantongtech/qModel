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
        <el-form
            :model="queryParams"
            ref="queryFormRef"
            :inline="true"
            v-show="showSearch"
            class="btn-style"
        >
            <el-form-item label="模型名称1：" prop="modelName">
                <el-input
                    v-model="queryParams.modelName"
                    placeholder="请输入模型名称："
                    clearable
                    @keyup.enter="handleQuery"
                />
            </el-form-item>
            <el-form-item label="版本号：" prop="modelVersion">
                <el-select
                    v-model="queryParams.modelVersion"
                    placeholder="请输入版本号"
                    clearable
                    class="el-form-input-width"
                >
                    <el-option
                        v-for="item in versionList"
                        :key="item.id"
                        :label="'Version ' + item.version"
                        :value="item.version"
                    >
                    </el-option>
                </el-select>
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

        <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
                <el-button type="primary" plain @click="handleAdd">新增</el-button>
            </el-col>
            <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="inputList" @selection-change="handleSelectionChange">
            <el-table-column label="参数名称" align="center" prop="name" />
            <el-table-column label="参数类型" align="center" prop="type">
                <template #default="scope">
                    <dict-tag :options="model_type" :value="scope.row.type" />
                </template>
            </el-table-column>
            <el-table-column label="所属模型" align="center" prop="modelName" />
            <el-table-column label="所属版本" align="center" prop="modelVersion">
                <template #default="scope">
                    <el-tag size="small">Version {{ scope.row.modelVersion }}</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                <template #default="scope">
                    <el-button link @click="handleView(scope.row)">详情</el-button>
                    <el-button link @click="handleUpdate(scope.row)">修改</el-button>
                    <el-button link @click="handleDelete(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <pagination
            v-show="total > 0"
            :total="total"
            v-model:page="queryParams.pageNum"
            v-model:limit="queryParams.pageSize"
            @pagination="getList"
        />

        <!-- 添加或修改模型输入管理 对话框 -->
        <el-dialog
            :title="title"
            v-model="open"
            width="800px"
            :close-on-click-modal="false"
            append-to="body"
        >
            <el-form
                ref="formRef"
                :model="form"
                :rules="rules"
                label-width="150px"
                style="max-height: 600px; overflow: hidden auto"
            >
                <el-row>
                    <el-col :span="20">
                        <!-- modelName -->
                        <el-form-item label="所属模型：" prop="modelId">
                            <el-select
                                v-model="form.modelId"
                                placeholder="请选择所属模型"
                                clearable
                                style="width: 100%"
                                :disabled="modelId != null"
                                @change="
                                    getAllModelVersion(form.modelId.id), (form.modelVersion = null)
                                "
                                value-key="id"
                            >
                                <el-option
                                    v-for="dict in modelList"
                                    :key="dict.id"
                                    :label="dict.name"
                                    :value="dict"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="所属版本：" prop="modelVersion">
                            <el-select
                                v-model="form.modelVersion"
                                placeholder="请先选择所属模型"
                                clearable
                                style="width: 100%"
                            >
                                <el-option
                                    v-for="dict in versionList"
                                    :key="dict.id"
                                    :label="dict.version"
                                    :value="parseInt(dict.version)"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="form.modelVersion != null && form.modelId != null">
                    <el-col :span="20">
                        <el-form-item label="参数名称：" prop="name">
                            <el-input clearable v-model="form.name" placeholder="请输入参数名称" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="form.modelVersion != null && form.modelId != null">
                    <el-col :span="20">
                        <el-form-item label="文件路径名称：" prop="engName">
                            <el-input
                                clearable
                                v-model="form.engName"
                                placeholder="请输入文件路径名称"
                            />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="form.modelVersion != null && form.modelId != null">
                    <el-col :span="20">
                        <el-form-item label="是否可变：" prop="changeFlag">
                            <el-radio v-model="form.changeFlag" label="true">是</el-radio>
                            <el-radio v-model="form.changeFlag" label="false">否</el-radio>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="form.modelVersion != null && form.modelId != null">
                    <el-col :span="20">
                        <el-form-item label="参数类型：" prop="type">
                            <el-select
                                v-model="form.type"
                                placeholder="请选择参数类型"
                                clearable
                                style="width: 100%"
                            >
                                <el-option
                                    v-for="dict in model_type"
                                    :key="dict.value"
                                    :label="dict.label"
                                    :value="parseInt(dict.value)"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="form.type === 0">
                    <el-col :span="20">
                        <el-form-item label="单值默认值：" prop="singleContent">
                            <el-input
                                clearable
                                v-model="form.singleContent"
                                placeholder="请输入单值默认值"
                            />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="form.type === 1">
                    <el-col :span="20">
                        <el-form-item label="多列数示例：" prop="multipleContent">
                            <el-row type="flex" justify="end">
                                <el-col :span="1.5" class="mb8">
                                    <el-button type="primary" @click="handleAddMultiple"
                                        >添加</el-button
                                    >
                                </el-col>
                                <!-- <el-col :span="1.5">
                                  <el-button
                                    type="danger"
                                    icon="el-icon-delete"
                                    size="mini"
                                    :disabled="checkedTaskCar.length == 0"
                                    @click="handleDeleteTaskCar"
                                    >删除</el-button
                                  >
                                </el-col> -->
                            </el-row>
                            <el-table
                                :data="form.multipleContent"
                                style="width: auto"
                                :row-class-name="multipleIndex"
                                @selection-change="handleMultipleChange"
                            >
                                <el-table-column label="行名称" prop="form.multiple.name">
                                    <template #default="scope">
                                        <el-input v-model="scope.row.name" placeholder="行名称" />
                                    </template>
                                </el-table-column>
                                <el-table-column label="行默认值" prop="form.multiple.value">
                                    <template #default="scope">
                                        <el-input
                                            v-model="scope.row.value"
                                            placeholder="行默认值"
                                        />
                                    </template>
                                </el-table-column>
                                <el-table-column label="行排序" prop="form.multiple.order">
                                    <template #default="scope">
                                        <el-input-number
                                            v-model="scope.row.order"
                                            controls-position="right"
                                            :min="0"
                                            style="width: 100%"
                                        />
                                    </template>
                                </el-table-column>
                                <el-table-column align="center" label="操作" width="100">
                                    <template #default="scope">
                                        <el-button
                                            type="danger"
                                            @click="handleDeleteMultiple(scope.row)"
                                            >删除
                                        </el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="form.type === 2">
                    <el-col :span="20">
                        <el-form-item label="参数文件：" prop="paramFile">
                            <FileUpload v-model="form.paramFile" :limit="1" fileStyle2 />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="参数说明：" prop="description">
                            <el-input
                                v-model="form.description"
                                :rows="3"
                                type="textarea"
                                placeholder="请输入内容"
                            />
                        </el-form-item>
                    </el-col>
                </el-row>
                <!-- <el-row>
                  <el-col :span="20">
                    <el-form-item label="参数示例：" prop="example">
                      <FileUpload v-model="form.example" :limit="1" fileStyle2 />
                    </el-form-item>
                  </el-col>
                </el-row> -->
            </el-form>
            <template #footer>
                <div class="dialog-footer">
                    <el-button type="primary" @click="submitForm">确 定</el-button>
                    <el-button @click="cancel">取 消</el-button>
                </div>
            </template>
        </el-dialog>

        <!-- 详情 模型输入管理 对话框 -->
        <el-dialog
            :title="titleView"
            v-model="openView"
            width="800px"
            :close-on-click-modal="false"
            append-to="body"
        >
            <el-form
                ref="formRef"
                :model="formView"
                :rules="rulesView"
                label-width="150px"
                style="max-height: 600px; overflow: hidden auto"
            >
                <el-row>
                    <el-col :span="20">
                        <!-- modelName -->
                        <el-form-item label="所属模型：" prop="modelName">
                            {{ formView.modelName }}
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="所属版本：" prop="modelVersion">
                            {{ formView.modelVersion }}
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="参数名称：" prop="name">
                            {{ formView.name }}
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item
                            :label="formView.type == 1 ? '文件名称：' : '字段名称：'"
                            prop="engName"
                        >
                            {{ formView.engName }}
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="参数类型：" prop="type">
                            <dict-tag :options="model_type" :value="formView.type" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="formView.type === 1">
                    <el-col :span="20">
                        <el-form-item label="各参数信息：" prop="multipleContent">
                            <el-row type="flex" justify="end"> </el-row>
                            <el-table
                                :data="formView.multipleContent"
                                style="width: auto"
                                :row-class-name="multipleIndex"
                                @selection-change="handleMultipleChange"
                            >
                                <el-table-column
                                    label="参数名称"
                                    prop="formView.multiple.name"
                                    width="300"
                                >
                                    <template #default="scope">
                                        {{ scope.row.name }}
                                    </template>
                                </el-table-column>
                                <el-table-column
                                    label="列排序"
                                    prop="formView.multiple.order"
                                    width="150"
                                >
                                    <template #default="scope">
                                        {{ scope.row.order }}
                                    </template>
                                </el-table-column>
                            </el-table>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-if="formView.type === 2">
                    <el-col :span="20">
                        <el-form-item label="参数文件：" prop="paramFile">
                            <FileUpload
                                v-model="formView.paramFile"
                                :limit="1"
                                fileStyle2
                                disabled
                            />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="参数说明：" prop="description">
                            {{ formView.description == null ? '--' : formView.description }}
                        </el-form-item>
                    </el-col>
                </el-row>
            </el-form>
        </el-dialog>
    </div>
</template>

<script setup>
    import { ref, reactive, computed, onMounted, watch, getCurrentInstance } from 'vue';
    import { useRoute } from 'vue-router';
    import { ElMessageBox, ElMessage } from 'element-plus';
    import {
        listInput,
        getInput,
        delInput,
        addInput,
        updateInput,
        findAllModel,
        findAllModelVersion,
        getAllDatFileJson
    } from '@/api/modelReconstitution/input';
    import { useDict } from '@/utils/dict.js';
    import { getFileList } from '@/api/modelReconstitution/model.js';

    const { proxy } = getCurrentInstance();
    const route = useRoute();

    // 响应式数据
    const jsonFile = ref([]);
    const modelList = ref([]);
    const versionList = ref([]);
    // 遮罩层
    const loading = ref(true);
    // 选中数组
    const ids = ref([]);
    // 非单个禁用
    const single = ref(true);
    // 非多个禁用
    const multiple = ref(true);
    // 显示搜索条件
    const showSearch = ref(true);
    // 总条数
    const total = ref(0);
    // 模型输入管理 表格数据
    const inputList = ref([]);
    // 弹出层标题
    const title = ref('');
    // 是否显示弹出层
    const open = ref(false);
    // 弹出层标题
    const titleView = ref('');
    // 是否显示弹出层
    const openView = ref(false);
    // 查询参数
    const queryParams = reactive({
        pageNum: 1,
        pageSize: 10,
        modelName: null,
        modelVersion: null
    });
    // 表单参数
    const form = ref({
        singleContent: [],
        multipleContent: [],
        changeFlag: null
    });
    // 表单参数
    const formView = ref({});
    // 表单校验
    const rulesView = ref({});
    // 可编辑表格
    const checkedSingle = ref([]);
    const checkedMultiple = ref([]);

    // 表单校验规则
    const rules = reactive({
        validFlag: [
            {
                required: true,
                message: '是否有效 0：无效，1：有效不能为空',
                trigger: 'blur'
            }
        ],
        delFlag: [
            {
                required: true,
                message: '删除标志 1：已删除，0：未删除不能为空',
                trigger: 'blur'
            }
        ],
        createTime: [{ required: true, message: '创建时间不能为空', trigger: 'blur' }],
        updateTime: [{ required: true, message: '更新时间不能为空', trigger: 'blur' }],
        modelId: [{ required: true, message: '请选择所属模型', trigger: 'change' }],
        modelVersion: [{ required: true, message: '请选择所属模型版本', trigger: 'change' }],
        engName: [{ required: true, message: '文件名称不能为空', trigger: 'blur' }]
    });

    // 计算属性
    const modelId = computed(() => route.query.modelId);
    const modelName = computed(() => route.query.modelName);

    // 模板引用
    const queryFormRef = ref(null);
    const formRef = ref(null);

    // props
    const props = defineProps({
        model: {
            type: Object
        }
    });

    // 获取字典数据
    const model_type = useDict('model_type').model_type;

    //测试json数据
    const getAllJson = () => {
        getFileList({ fileUrl: props.model.interfaceorfileAddress }).then((res) => {
            jsonFile.value = res;
            console.log(jsonFile.value, '========');
            console.log(res, '++++++++++');
        });
    };

    // 获取模型
    const getAllModel = () => {
        findAllModel({}).then((res) => {
            modelList.value = res.data;
        });
    };

    // 获取版本
    const getAllModelVersion = (param) => {
        const data = { modelId: param };
        findAllModelVersion(data).then((res) => {
            if (param) {
                versionList.value = res.data;
            } else {
                versionList.value = [];
            }
        });
    };

    /** 查询模型输入管理 列表 */
    const getList = () => {
        loading.value = true;
        let modelId = route.query.modelId;
        if (modelId) {
            queryParams.modelId = parseInt(modelId);
        }
        console.log(queryParams, 'this.queryParams');
        listInput(queryParams).then((response) => {
            inputList.value = response.rows;
            total.value = response.total;
            loading.value = false;
        });
    };

    // 取消按钮
    const cancel = () => {
        open.value = false;
        reset();
    };

    // 表单重置
    const reset = () => {
        form.value = {
            id: null,
            companyId: null,
            name: null,
            engName: null,
            type: null,
            modelId: null,
            modelName: null,
            modelVersion: null,
            description: null,
            example: null,
            singleContent: [],
            multipleContent: [],
            changeFlag: null
        };
        if (formRef.value) {
            formRef.value.clearValidate();
        }
    };

    /** 搜索按钮操作 */
    const handleQuery = () => {
        queryParams.pageNum = 1;
        getList();
    };

    /** 重置按钮操作 */
    const resetQuery = () => {
        if (queryFormRef.value) {
            queryFormRef.value.resetFields();
        }
        handleQuery();
    };

    // 多选框选中数据
    const handleSelectionChange = (selection) => {
        ids.value = selection.map((item) => item.id);
        single.value = selection.length !== 1;
        multiple.value = !selection.length;
    };

    /** 新增按钮操作 */
    const handleAdd = () => {
        getAllJson();
        reset();
        open.value = true;
        title.value = '添加模型输入管理';
        if (modelId.value) {
            form.value.modelId = {
                id: parseInt(modelId.value),
                name: modelName.value
            };
            getAllModelVersion(form.value.modelId.id);
            form.value.modelVersion = null;
        }
    };

    /** 修改按钮操作 */
    const handleUpdate = async (row) => {
        reset();
        const id = row.id || ids.value;
        getInput(id).then((response) => {
            form.value = response.data;
            form.value.modelId = {
                id: response.data.modelId,
                name: response.data.modelName
            };
            if (form.value.changeFlag != null) {
                form.value.changeFlag = form.value.changeFlag.toString();
            }
            form.value.singleContent = JSON.parse(form.value.singleContent);
            form.value.multipleContent = JSON.parse(form.value.multipleContent);
            getAllModelVersion(form.value.modelId.id);
            open.value = true;
            title.value = '修改模型输入管理';
        });
    };

    /** 详情按钮操作 */
    const handleView = (row) => {
        reset();
        const id = row.id || ids.value;
        getInput(id).then((response) => {
            formView.value = response.data;
            formView.value.singleContent = JSON.parse(formView.value.singleContent);
            formView.value.multipleContent = JSON.parse(formView.value.multipleContent);
            if (formView.value.changeFlag != null) {
                formView.value.changeFlag = formView.value.changeFlag.toString();
            }
            openView.value = true;
            titleView.value = '模型输入管理详情';
        });
    };

    /** 提交按钮 */
    const submitForm = () => {
        if (formRef.value) {
            formRef.value.validate((valid) => {
                if (valid) {
                    const formData = { ...form.value };
                    formData.modelName = formData.modelId.name;
                    formData.modelId = formData.modelId.id;
                    formData.singleContent = JSON.stringify(formData.singleContent);
                    formData.multipleContent = JSON.stringify(formData.multipleContent);
                    if (formData.id != null) {
                        updateInput(formData).then((response) => {
                            ElMessage.success('修改成功');
                            open.value = false;
                            getList();
                        });
                    } else {
                        addInput(formData).then((response) => {
                            ElMessage.success('新增成功');
                            open.value = false;
                            getList();
                        });
                    }
                }
            });
        }
    };

    /** 删除按钮操作 */
    const handleDelete = (row) => {
        const idsToDelete = row.id || ids.value;
        ElMessageBox.confirm(
            '是否确认删除模型输入管理 编号为"' + idsToDelete + '"的数据项？',
            '警告',
            {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }
        )
            .then(function () {
                return delInput(idsToDelete);
            })
            .then(() => {
                getList();
                ElMessage.success('删除成功');
            })
            .catch(() => {});
    };

    /** 导出按钮操作 */
    const handleExport = () => {
        proxy.download(
            'model/input/export',
            {
                ...queryParams
            },
            `input_${new Date().getTime()}.xlsx`
        );
    };

    /** 单值 添加按钮操作 */
    const handleAddSingle = () => {
        let obj = {};
        obj.param = '';
        obj.name = '';
        obj.value = '';
        form.value.singleContent.push(obj);
    };

    /** 单值 删除按钮操作 */
    const handleDeleteSingle = (row) => {
        const id = row.index;
        const singleContent = form.value.singleContent;
        form.value.singleContent = singleContent.filter(function (item) {
            return item.index != id;
        });
    };

    /** 单值 序号 */
    const singleIndex = ({ row, rowIndex }) => {
        row.index = rowIndex + 1;
    };

    /** 复选框选中数据 */
    const handleSingleChange = (selection) => {
        checkedSingle.value = selection.map((item) => item.index);
    };

    /** 多列值 添加按钮操作 */
    const handleAddMultiple = () => {
        let obj = {};
        obj.name = '';
        obj.value = '';
        obj.order = '';
        form.value.multipleContent.push(obj);
    };

    /** 多列值 删除按钮操作 */
    const handleDeleteMultiple = (row) => {
        const id = row.index;
        const multipleContent = form.value.multipleContent;
        form.value.multipleContent = multipleContent.filter(function (item) {
            return item.index != id;
        });
    };

    /** 多列值 序号 */
    const multipleIndex = ({ row, rowIndex }) => {
        row.index = rowIndex + 1;
    };

    /** 复选框选中数据 */
    const handleMultipleChange = (selection) => {
        checkedMultiple.value = selection.map((item) => item.index);
    };

    // 监听器
    watch(
        () => props.model,
        (newVal, oldVal) => {
            if (newVal != null && oldVal != null && newVal.id == oldVal.id) return;
            if (newVal) {
                form.value.modelId = newVal.id;
                queryParams.modelVersion = newVal.version;
                queryParams.modelId = newVal.id;
                form.value.modelId = newVal.id;
            }
            getList();
            getAllModelVersion(form.value.modelId);
        },
        { deep: true, immediate: true }
    );

    // 组件挂载后执行
    onMounted(() => {
        getAllModel();
    });
</script>
