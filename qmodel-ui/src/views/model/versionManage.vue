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
    <div class="versionManage">
        <el-row class="mb8">
            <el-col :span="1.5">
                <el-button type="primary" plain icon="Plus" size="mini" @click="handleAdd"
                    >新增
                </el-button>
            </el-col>
        </el-row>
        <el-table v-loading="loading" :data="actionList" @selection-change="handleSelectionChange">
            <el-table-column label="模型名称" align="center" prop="name" />
            <el-table-column label="版本号" align="center" prop="version" />
            <el-table-column label="文件地址" align="center" prop="createBy" />
            <el-table-column label="接口地址" align="center" prop="createBy" />
            <el-table-column label="版本状态" align="center" prop="description" />
            <el-table-column label="描述" align="center" prop="description" />
            <el-table-column label="是否启用" align="center" prop="">
                <template #default="scope">
                    <el-switch
                        v-model="scope.row.validFlag"
                        active-color="#13ce66"
                        @change="handleEnable"
                    >
                    </el-switch>
                </template>
            </el-table-column>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                <template #default="scope">
                    <el-button
                        size="mini"
                        type="text"
                        icon="EditPen"
                        @click="handleUpdate(scope.row)"
                        >编辑</el-button
                    >
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

        <!-- 添加或修改模型管理对话框 -->
        <el-dialog
            :title="title"
            v-model="open"
            width="500px"
            :close-on-click-modal="false"
            append-to-body
        >
            <el-form ref="formRef" :model="form" :rules="rules" label-width="80px">
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="模型名称" prop="name">
                            <el-input v-model="form.name" placeholder="请输入模型名称" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="版本号" prop="version">
                            <el-input v-model="form.version" placeholder="请输入版本号" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="文件地址" prop="fileAddress">
                            <el-input v-model="form.fileAddress" placeholder="请输入文件地址" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="接口地址" prop="interfaceAddress">
                            <el-input
                                v-model="form.interfaceAddress"
                                placeholder="请输入接口地址"
                            />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="描述" prop="description">
                            <el-input
                                v-model="form.description"
                                type="textarea"
                                placeholder="请输入内容"
                            />
                        </el-form-item>
                    </el-col>
                </el-row>
            </el-form>
            <template #footer>
                <div class="dialog-footer">
                    <el-button type="primary" @click="submitForm">确 定</el-button>
                    <el-button @click="cancel">取 消</el-button>
                </div>
            </template>
        </el-dialog>
    </div>
</template>

<script setup>
    import { ref, reactive, computed, onMounted } from 'vue';
    import { useRoute } from 'vue-router';
    import { listModel, getModel, addModel, updateModel } from '@/api/modelReconstitution/model';
    import { ElMessage, ElMessageBox } from 'element-plus';

    const route = useRoute();

    // 响应式数据
    const loading = ref(true);
    const ids = ref([]);
    const single = ref(true);
    const multiple = ref(true);
    const showSearch = ref(true);
    const total = ref(0);
    const actionList = ref([]);
    const title = ref('');
    const open = ref(false);
    const formRef = ref();

    // 查询参数
    const queryParams = reactive({
        pageNum: 1,
        pageSize: 10
    });

    // 表单参数 (added missing variable)
    const form = reactive({});

    // 表单验证规则
    const rules = reactive({
        name: [{ required: true, message: '模型名称不能为空', trigger: 'blur' }],
        version: [{ required: true, message: '版本号不能为空', trigger: 'blur' }]
    });

    // 计算属性
    const modelId = computed(() => {
        return route.query.modelId;
    });

    // 方法
    /** 查询模型管理 列表 */
    const getList = () => {
        loading.value = true;
        listModel(queryParams).then((response) => {
            actionList.value = response.rows;
            total.value = response.total;
            loading.value = false;
        });
    };

    // 多选框选中数据
    const handleSelectionChange = (selection) => {
        ids.value = selection.map((item) => item.id);
        single.value = selection.length !== 1;
        multiple.value = !selection.length;
    };

    // 是否启用
    const handleEnable = (e) => {
        console.log(e, '==e');
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
            name: null,
            version: null,
            fileAddress: null,
            interfaceAddress: null,
            description: null
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

    // 新增
    const handleAdd = () => {
        reset();
        open.value = true;
        title.value = '添加模型管理 ';
    };

    // 修改
    const handleUpdate = (row) => {
        reset();
        const id = row.id || ids.value;
        getModel(id).then((response) => {
            Object.assign(form, response.data);
            open.value = true;
            title.value = '修改模型管理 ';
        });
    };

    /** 提交按钮 */
    const submitForm = () => {
        if (formRef.value) {
            formRef.value.validate((valid) => {
                if (valid) {
                    if (form.id != null) {
                        updateModel(form).then((response) => {
                            ElMessage.success('修改成功');
                            open.value = false;
                            getList();
                        });
                    } else {
                        addModel(form).then((response) => {
                            ElMessage.success('新增成功');
                            open.value = false;
                            getList();
                        });
                    }
                }
            });
        }
    };

    // 组件挂载时执行
    onMounted(() => {
        getList();
    });
</script>
<style lang="scss" scoped>
    .versionManage {
    }
</style>
