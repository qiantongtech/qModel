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
        <div class="pagecont-top" v-show="showSearch">
            <el-form
                :model="queryParams"
                ref="queryFormRef"
                :inline="true"
                label-width="68px"
                class="btn-style"
            >
                <el-form-item label="分类名称" prop="name">
                    <el-input
                        v-model="queryParams.name"
                        placeholder="请输入分类名称"
                        clearable
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
            <div class="justify-between mb15">
                <el-row :gutter="10" class="btn-style">
                    <el-col :span="1.5">
                        <el-button
                            type="primary"
                            plain
                            @click="handleAdd"
                            v-hasPermi="['model:classify:add']"
                        >
                            <i class="iconfont-mini icon-xinzeng"></i>新增
                        </el-button>
                    </el-col>
                    <el-col :span="1.5">
                        <el-button type="info" plain @click="toggleExpandAll">
                            <i class="iconfont-mini icon-paixubiaozhi"></i>展开/折叠
                        </el-button>
                    </el-col>
                </el-row>
                <right-toolbar
                    v-model:showSearch="showSearch"
                    @queryTable="getList"
                ></right-toolbar>
            </div>

            <el-table
                v-if="refreshTable"
                v-loading="loading"
                :data="classifyList"
                row-key="id"
                :default-expand-all="isExpandAll"
                :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
            >
                <el-table-column label="分类名称" prop="name" />
                <el-table-column label="分类描述" align="center" prop="description" />
                <el-table-column label="备注" align="center" prop="remark" />
                <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                    <template #default="scope">
                        <el-button
                            link
                            type="primary"
                            @click="handleAdd(scope.row)"
                            v-hasPermi="['model:classify:add']"
                        >
                            <i class="iconfont-mini icon-xinzeng"></i>新增
                        </el-button>
                        <el-button
                            link
                            type="primary"
                            @click="handleUpdate(scope.row)"
                            v-hasPermi="['model:classify:edit']"
                        >
                            <i class="iconfont-mini icon-a-xiugaixianxing"></i>修改
                        </el-button>

                        <el-button
                            link
                            type="danger"
                            @click="handleDelete(scope.row)"
                            v-hasPermi="['model:classify:remove']"
                        >
                            <i class="iconfont-mini icon-a-shanchuxianxing"></i>删除
                        </el-button>
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
        </div>

        <el-dialog :title="title" v-model="open" width="800px" append-to="body" draggable>
            <template #header="{ close, titleId, titleClass }">
                <span role="heading" aria-level="2" class="el-dialog__title">
                    {{ title }}
                </span>
            </template>
            <el-form ref="formRef" :model="form" :rules="rules" label-width="80px">
                <el-form-item label="上级分类" prop="parentId">
                    <el-tree-select
                        v-model="form.parentId"
                        :data="classifyOptions"
                        :props="{ value: 'id', label: 'name', children: 'children' }"
                        placeholder="请选择上级分类"
                    />
                </el-form-item>
                <el-form-item label="分类名称" prop="name">
                    <el-input v-model="form.name" placeholder="请输入分类名称" />
                </el-form-item>
                <el-form-item label="分类描述" prop="description">
                    <el-input
                        v-model="form.description"
                        type="textarea"
                        placeholder="请输入内容"
                        maxlength="200"
                        show-word-limit
                    />
                </el-form-item>
                <el-form-item label="备注" prop="remark">
                    <el-input
                        v-model="form.remark"
                        type="textarea"
                        placeholder="请输入内容"
                        maxlength="200"
                        show-word-limit
                    />
                </el-form-item>
            </el-form>
            <template #footer>
                <div class="dialog-footer">
                    <el-button @click="cancel">取 消</el-button>
                    <el-button type="primary" @click="submitForm">确 定</el-button>
                </div>
            </template>
        </el-dialog>
    </div>
</template>

<script setup>
    import { ref, reactive, onMounted, nextTick, getCurrentInstance } from 'vue';
    import {
        listClassify,
        getClassify,
        delClassify,
        addClassify,
        updateClassify
    } from '@/api/modelReconstitution/classify';
    import { ElMessage, ElMessageBox } from 'element-plus';

    // Get access to the current instance to use globally registered functions
    const { proxy } = getCurrentInstance();

    // Define refs for form elements
    const queryFormRef = ref(null);
    const formRef = ref(null);

    // 遮罩层
    const loading = ref(true);
    // 显示搜索条件
    const showSearch = ref(true);
    // 模型分类表格数据
    const classifyList = ref([]);
    // 模型分类树选项
    const classifyOptions = ref([]);
    // 弹出层标题
    const title = ref('');
    // 是否显示弹出层
    const open = ref(false);
    // 是否展开，默认全部展开
    const isExpandAll = ref(false);
    // 重新渲染表格状态
    const refreshTable = ref(true);
    const total = ref(0);

    // 查询参数
    const queryParams = reactive({
        parentId: null,
        ancestors: null,
        name: null,
        description: null,
        validFlag: null,
        creatorId: null,
        updatorId: null,
        pageNum: 1,
        pageSize: 10
    });

    // 表单参数
    const form = reactive({
        id: null,
        companyId: null,
        parentId: null,
        ancestors: null,
        name: null,
        description: null,
        validFlag: null,
        delFlag: null,
        createBy: null,
        creatorId: null,
        createTime: null,
        updateBy: null,
        updatorId: null,
        updateTime: null,
        remark: null
    });

    // 表单校验
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
        updateTime: [{ required: true, message: '更新时间不能为空', trigger: 'blur' }]
    });

    onMounted(() => {
        getList();
    });

    /** 查询模型分类列表 */
    const getList = () => {
        loading.value = true;
        listClassify(queryParams).then((response) => {
            classifyList.value = proxy.handleTree(response.rows, 'id', 'parentId');
            loading.value = false;
        });
    };

    /** 查询模型分类下拉树结构 */
    const getTreeselect = () => {
        listClassify().then((response) => {
            classifyOptions.value = [];
            const data = { id: 0, name: '顶级节点', children: [] };
            data.children = proxy.handleTree(response.rows, 'id', 'parentId');
            classifyOptions.value.push(data);
        });
    };

    // 取消按钮
    const cancel = () => {
        open.value = false;
        reset();
    };

    // 表单重置
    const reset = () => {
        Object.assign(form, {
            id: null,
            companyId: null,
            parentId: null,
            ancestors: null,
            name: null,
            description: null,
            validFlag: null,
            delFlag: null,
            createBy: null,
            creatorId: null,
            createTime: null,
            updateBy: null,
            updatorId: null,
            updateTime: null,
            remark: null
        });
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

    /** 新增按钮操作 */
    const handleAdd = (row) => {
        reset();
        getTreeselect();
        if (row != null && row.id) {
            form.parentId = row.id;
        } else {
            form.parentId = 0;
        }
        open.value = true;
        title.value = '添加模型分类';
    };

    /** 展开/折叠操作 */
    const toggleExpandAll = () => {
        refreshTable.value = false;
        isExpandAll.value = !isExpandAll.value;
        nextTick(() => {
            refreshTable.value = true;
        });
    };

    /** 修改按钮操作 */
    const handleUpdate = (row) => {
        reset();
        getTreeselect();
        if (row != null) {
            form.parentId = row.id;
        }
        getClassify(row.id).then((response) => {
            Object.assign(form, response.data);
            open.value = true;
            title.value = '修改模型分类';
        });
    };

    /** 提交按钮 */
    const submitForm = () => {
        if (formRef.value) {
            formRef.value.validate((valid) => {
                if (valid) {
                    if (form.id != null) {
                        updateClassify(form).then((response) => {
                            ElMessage.success('修改成功');
                            open.value = false;
                            getList();
                        });
                    } else {
                        addClassify(form).then((response) => {
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
        ElMessageBox.confirm('是否确认删除模型分类名称为"' + row.name + '"的数据项？', '警告', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
        })
            .then(() => {
                return delClassify(row.id);
            })
            .then(() => {
                getList();
                ElMessage.success('删除成功');
            })
            .catch(() => {});
    };
</script>
