<template>
    <div class="app-container">
        <div class="pagecont-top" v-show="showSearch">
            <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="68px" class="btn-style">
                <el-form-item label="分类名称" prop="name">
                    <el-input
                            v-model="queryParams.name"
                            placeholder="请输入分类名称"
                            clearable
                            @keyup.enter="handleQuery"
                    />
                </el-form-item>


                <el-form-item>
                    <el-button plain type="primary" @click="handleQuery" @mousedown="(e) => e.preventDefault()">
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
                        <el-button
                                type="info"
                                plain
                                @click="toggleExpandAll"
                        >
                            <i class="iconfont-mini icon-paixubiaozhi"></i>展开/折叠
                        </el-button>
                    </el-col>
                </el-row>
                <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
            </div>

            <el-table
                    v-if="refreshTable"
                    v-loading="loading"
                    :data="classifyList"
                    row-key="id"
                    :default-expand-all="isExpandAll"
                    :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
            >
                <el-table-column label="分类名称" prop="name"/>
                <el-table-column label="分类描述" align="center" prop="description"/>
                <el-table-column label="备注" align="center" prop="remark"/>
                <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                    <template #default="scope">
                        <el-button
                                link type="primary"
                                @click="handleAdd(scope.row)"
                                v-hasPermi="['model:classify:add']"
                        >
                            <i class="iconfont-mini icon-xinzeng"></i>新增
                        </el-button>
                        <el-button
                                link type="primary"
                                @click="handleUpdate(scope.row)"
                                v-hasPermi="['model:classify:edit']"
                        >
                            <i class="iconfont-mini icon-a-xiugaixianxing"></i>修改
                        </el-button>

                        <el-button
                                link type="danger"
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

        <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
            <template #header="{ close, titleId, titleClass }">
                <span role="heading" aria-level="2" class="el-dialog__title">
                  {{ title }}
                </span>
            </template>
            <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                <el-form-item label="上级分类" prop="parentId">
                    <el-tree-select v-model="form.parentId" :data="classifyOptions" :props="{ value: 'id', label: 'name', children: 'children' }" placeholder="请选择上级分类" />
                </el-form-item>
                <el-form-item label="分类名称" prop="name">
                    <el-input v-model="form.name" placeholder="请输入分类名称"/>
                </el-form-item>
                <el-form-item label="分类描述" prop="description">
                    <el-input v-model="form.description" type="textarea" placeholder="请输入内容" maxlength="200" show-word-limit/>
                </el-form-item>
                <el-form-item label="备注" prop="remark">
                    <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" maxlength="200" show-word-limit/>
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

<script>
import {listClassify, getClassify, delClassify, addClassify, updateClassify} from "@/api/modelReconstitution/classify";


export default {
    name: "Classify",
    data() {
        return {
            // 遮罩层
            loading: true,
            // 显示搜索条件
            showSearch: true,
            // 模型分类表格数据
            classifyList: [],
            // 模型分类树选项
            classifyOptions: [],
            // 弹出层标题
            title: "",
            // 是否显示弹出层
            open: false,
            // 是否展开，默认全部展开
            isExpandAll: false,
            // 重新渲染表格状态
            refreshTable: true,
            total: 0,
            // 查询参数
            queryParams: {
                parentId: null,
                ancestors: null,
                name: null,
                description: null,
                validFlag: null,
                creatorId: null,
                updatorId: null,
                pageNum: 1,
                pageSize: 10,

            },
            // 表单参数
            form: {},
            // 表单校验
            rules: {
                validFlag: [
                    {required: true, message: "是否有效 0：无效，1：有效不能为空", trigger: "blur"}
                ],
                delFlag: [
                    {required: true, message: "删除标志 1：已删除，0：未删除不能为空", trigger: "blur"}
                ],
                createTime: [
                    {required: true, message: "创建时间不能为空", trigger: "blur"}
                ],
                updateTime: [
                    {required: true, message: "更新时间不能为空", trigger: "blur"}
                ],
            }
        };
    },
    created() {
        this.getList();
    },
    methods: {
        /** 查询模型分类列表 */
        getList() {
            this.loading = true;
            listClassify(this.queryParams).then(response => {
                this.classifyList = this.handleTree(response.rows, "id", "parentId");
                this.loading = false;
            });
        },
        /** 查询模型分类下拉树结构 */
        getTreeselect() {
            listClassify().then(response => {
                this.classifyOptions = [];
                const data = {id: 0, name: '顶级节点', children: []};
                data.children = this.handleTree(response.rows, "id", "parentId");
                this.classifyOptions.push(data);
            });
        },
        // 取消按钮
        cancel() {
            this.open = false;
            this.reset();
        },
        // 表单重置
        reset() {
            this.form = {
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
            };
            this.resetForm("form");
        },
        /** 搜索按钮操作 */
        handleQuery() {
            this.queryParams.pageNum = 1;
            this.getList();
        },
        /** 重置按钮操作 */
        resetQuery() {
            this.resetForm("queryForm");
            this.handleQuery();
        },
        /** 新增按钮操作 */
        handleAdd(row) {
            this.reset();
            this.getTreeselect();
            if (row != null && row.id) {
                this.form.parentId = row.id;
            } else {
                this.form.parentId = 0;
            }
            this.open = true;
            this.title = "添加模型分类";
        },
        /** 展开/折叠操作 */
        toggleExpandAll() {
            this.refreshTable = false;
            this.isExpandAll = !this.isExpandAll;
            this.$nextTick(() => {
                this.refreshTable = true;
            });
        },
        /** 修改按钮操作 */
        handleUpdate(row) {
            this.reset();
            this.getTreeselect();
            if (row != null) {
                this.form.parentId = row.id;
            }
            getClassify(row.id).then(response => {
                this.form = response.data;
                this.open = true;
                this.title = "修改模型分类";
            });
        },
        /** 提交按钮 */
        submitForm() {
            this.$refs["form"].validate(valid => {
                if (valid) {
                    if (this.form.id != null) {
                        updateClassify(this.form).then(response => {
                            this.$modal.msgSuccess("修改成功");
                            this.open = false;
                            this.getList();
                        });
                    } else {
                        addClassify(this.form).then(response => {
                            this.$modal.msgSuccess("新增成功");
                            this.open = false;
                            this.getList();
                        });
                    }
                }
            });
        },
        /** 删除按钮操作 */
        handleDelete(row) {
            this.$modal.confirm('是否确认删除模型分类名称为"' + row.name + '"的数据项？').then(function () {
                return delClassify(row.id);
            }).then(() => {
                this.getList();
                this.$modal.msgSuccess("删除成功");
            }).catch(() => {
            });
        }
    }
};
</script>
