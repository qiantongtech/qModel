<template>
    <div class="app-container">
        <el-container>
            <!-- 左侧可调整的部分 -->
            <el-aside
                    :style="{ width: `${leftWidth}px` }"
                    class="left-pane"
            >
                <div class="left-tree">
                    <div class="head-container">
                        <el-input
                                v-model="classifyName"
                                placeholder="请输入分类名称"
                                clearable
                                prefix-icon="Search"
                                style="margin-bottom: 20px"
                        />
                    </div>
                    <div class="head-container">
                        <el-tree
                                :data="classifyOptions"
                                :props="defaultProps"
                                :expand-on-click-node="false"
                                :filter-node-method="filterNode"
                                ref="tree"
                                node-key="id"
                                default-expand-all
                                highlight-current
                                @node-click="handleNodeClick"
                        />
                    </div>
                </div>
            </el-aside>
            <!-- 拖拽条 -->
            <div class="resize-bar" @mousedown="startResize">
                <div class="resize-handle-sx">
                    <span class="zjsx"></span>
                </div>
            </div>

            <el-main>
                <!--用户数据-->
                <div class="pagecont-top" v-show="showSearch">
                    <el-form
                            :model="queryParams"
                            ref="queryForm"
                            :inline="true"
                            v-show="showSearch"
                            class="btn-style"
                    >
                        <el-form-item label="模型名称：" prop="name">
                            <el-input
                                    v-model="queryParams.name"
                                    placeholder="请输入模型名称"
                                    clearable
                                    @keyup.enter="handleQuery"
                                    style="width: 180px"
                            />
                        </el-form-item>
                        <el-form-item label="模型接入方式：" prop="accessMode">
                            <el-select
                                    v-model="queryParams.accessMode"
                                    placeholder="请选择模型类别"
                                    clearable
                                    class="el-form-input-width"
                            >
                                <el-option key="0" label="单机程序（exe）" value="0"/>
                                <el-option key="1" label="api接口" value="1"/>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="模型类别：" prop="type">
                            <el-select
                                    v-model="queryParams.type"
                                    placeholder="请选择模型类别"
                                    clearable
                                    class="el-form-input-width"
                            >
                                <el-option
                                        v-for="dict in model_type"
                                        :key="dict.value"
                                        :label="dict.label"
                                        :value="dict.value"
                                ></el-option>
                            </el-select>
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
                                        v-hasPermi="['model:model:add']"
                                >
                                    <i class="iconfont-mini icon-xinzeng"></i>新增
                                </el-button>
                            </el-col>
                            <el-col :span="1.5"></el-col>
                        </el-row>
                        <right-toolbar
                                v-model:showSearch="showSearch"
                                @queryTable="getList"
                        ></right-toolbar>
                    </div>
                    <el-row :gutter="20" v-loading="loading">
                        <el-col
                                :sm="12" :md="12" :lg="8" :xl="6" style="margin-bottom: 20px"
                                :key="index" v-for="(item, index) in modelList"
                        >
                            <el-card
                                    style="border-radius: 8px"
                                    :body-style="{ padding: '16px 16px 0' }"
                                    shadow="never"
                            >
                                <div class="card-item">
                                    <div class="item-top">
                                        <div class="top-title ellipsis">
                                            <i class="el-icon-s-tools"/><span>{{ item.name }}</span>
                                        </div>
                                    </div>
                                    <div
                                            v-if="false"
                                            class="item-desc ellipsis-3"
                                            :title="item.description"
                                    >
                                        {{ item.description }}
                                    </div>
                                    <div class="item-con">
                                        <div class="con-l">
                                            <div class="con-view">
                                                <div class="con-view-title">版本号：</div>
                                                <el-tag size="small" type="info">Version {{ item.version }}</el-tag>
                                            </div>
                                            <div class="con-view">
                                                <div class="con-view-title">接入方式：</div>
                                                <span v-if="item.accessMode == 1">API接口</span>
                                                <span v-else>单机程序（exe）</span>
                                            </div>
                                            <!--                      <div class="con-view">
                                                                    <div class="con-view-title">接入方式：</div>
                                                                    <dict-tag
                                                                      style="height: 17px;line-height: 15px"
                                                                      :options="dict.type.model_access_mode"
                                                                      :value="item.requestMethod"
                                                                    />
                                                                  </div>-->
                                            <div class="con-view">
                                                <div class="con-view-title">发布时间：</div>
                                                <span v-if="item.publishTime == null">-,-</span>
                                                <span v-else>{{ item.publishTime }}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-btns">
                                        <el-button
                                                type="primary"
                                                style="padding-right: 8px; padding-left: 8px"
                                                title="编辑"
                                                @click="handleUpdate(item)"
                                        >
                                            <i class="iconfont-mini icon-a-xiugaixianxing mr5"></i>
                                        </el-button>
                                        <el-button
                                                type="warning"
                                                style="padding-right: 8px; padding-left: 8px"
                                                title="详情"
                                                @click="handleView(item)"
                                        >
                                            <i class="iconfont-mini icon-a-yincangxianxing mr5"></i>
                                        </el-button>
                                        <el-button
                                                type="danger"
                                                style="padding-right: 8px; padding-left: 8px"
                                                title="删除"
                                                @click="handleDelete(item)"
                                        >
                                            <i class="iconfont-mini icon-a-shanchuxianxing mr5"></i>
                                        </el-button>
                                    </div>
                                </div>
                            </el-card>
                        </el-col>
                    </el-row>

                    <el-empty
                            description="暂无数据，请添加模型"
                            v-if="total == 0"
                    ></el-empty>

                    <pagination
                            :pageSizes="[12, 24, 36, 48]"
                            v-show="total > 0"
                            :total="total"
                            v-model:page="queryParams.pageNum"
                            v-model:limit="queryParams.pageSize"
                            @pagination="getList"
                    />
                </div>
            </el-main>
        </el-container>

        <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
            <template #header="{ close, titleId, titleClass }">
                <span role="heading" aria-level="2" class="el-dialog__title">
                  {{ title }}
                </span>
            </template>
            <el-form ref="form" :model="form" :rules="rules" label-width="130px" >
                <el-form-item label="模型名称：" prop="name">
                    <el-input
                        clearable
                        v-model="form.name"
                        placeholder="请输入模型名称"
                    />
                </el-form-item>
                <el-form-item label="模型分类：" prop="classifyId" class="formClass">
                    <el-tree-select
                        v-model="form.classifyId"
                        :data="classifyOptions"
                        :props="{ value: 'id', label: 'name', children: 'children' }"
                        :show-count="true"
                        placeholder="请选择模型分类"
                        noResultsText="暂无数据"
                        :disabled="isEdit"
                    />
                </el-form-item>
                <el-form-item label="是否预置：" prop="builtin">
                    <el-radio :disabled="isEdit" v-model="form.builtin" :label="Number(1)">是</el-radio>
                    <el-radio :disabled="isEdit" v-model="form.builtin" :label="Number(0)">否</el-radio>
                    <el-tooltip class="item" effect="dark" content="选择是之后则不可去设置修改输入参数"
                                placement="right">
                        <i class="el-icon-question"></i>
                    </el-tooltip>
                </el-form-item>
                <el-form-item label="接入方式：" prop="accessMode">
                    <el-radio :disabled="isEdit" v-model="form.accessMode" :value="0">单机程序(exe)
                    </el-radio>
                    <el-radio :disabled="isEdit" v-model="form.accessMode" :value="1">API接口</el-radio>
                    <el-tooltip placement="top" v-if="mess">
                        <template #content>
                            Tips: 核心信息请在详情页版本控制里面修改
                        </template>
                        <!-- elementui图标库：显示黑色的问号图标   -->
                        <el-icon>
                            <QuestionFilled/>
                        </el-icon>
                    </el-tooltip>
                </el-form-item>
                <el-form-item label="上传文件：" prop="fileName" v-if="form.accessMode == 0">
                    <file-name-upload :disabled="isEdit" :fileType="['zip']"
                                      v-model="form.interfaceorfileAddress"
                                      :limit="1"
                                      :fileSize="200" :editName="form.fileName" :style="'width: 420px'"
                                      :upload-success="uploadSuccess"
                                      :delete-success="() => form.runnableFileAddress = null"
                    />
                </el-form-item>
                <el-form-item label="可执行文件：" prop="runnableFileAddress" v-if="form.accessMode == 0">
                    <el-input v-model="form.runnableFileAddress"
                              placeholder="请上传压缩包后在文件列表处选择运行模型的文件"
                              disabled/>
                </el-form-item>
                <el-form-item label="API地址：" prop="interfaceorfileAddress" v-if="form.accessMode == 1">
                    <el-input
                        clearable
                        :disabled="isEdit"
                        v-model="form.interfaceorfileAddress"
                        placeholder="请输入API接口"
                    />
                </el-form-item>
                <el-form-item label="端口号：" prop="port" v-if="form.accessMode == 1">
                    <el-input
                        clearable
                        :disabled="isEdit"
                        v-model="form.port"
                        placeholder="请输入接口端口号"
                    />
                </el-form-item>
                <el-form-item label="版本号：" prop="version" v-if="form.id == null">
                    <el-input :disabled="isEdit" v-model="form.version" placeholder="请输入版本号">
                        <template #append>Version</template>
                    </el-input>
                </el-form-item>
                <el-form-item label="版本发布说明：" prop="description">
                    <el-input
                        :disabled="isEdit"
                        v-model="form.description"
                        :rows="3"
                        type="textarea"
                        placeholder="请输入版本发布说明"
                    />
                </el-form-item>

                <el-form-item label="模型介绍：" prop="remark">
                    <el-input
                        v-model="form.remark"
                        :rows="3"
                        type="textarea"
                        placeholder="请输入内容"
                    />
                </el-form-item>
            </el-form>
            <el-tree :data="form.fileList" default-expand-all
                     v-if="this.form.accessMode == 0 && this.form.interfaceorfileAddress && this.form.interfaceorfileAddress.length > 0"
            >
                <template #default="{ data }">
                      <span class="custom-tree-node">
                        <span v-if="data.children">{{ data.fileName }}</span>
                        <el-radio v-model="form.runnableFileAddress" :label="data.fileName" v-if="!data.children">{{
                                data.fileName
                            }}</el-radio>
                      </span>
                </template>
            </el-tree>
            <template #footer>
                <div class="dialog-footer">
                    <el-button @click="cancel">取 消</el-button>
                    <el-button type="primary" @click="submitForm">确 定</el-button>
                </div>
            </template>
        </el-dialog>

        <!-- 添加或修改模型管理 对话框 -->
<!--        <el-dialog
                :title="title"
                v-model="open"
                :width="dialogWidth"
                :close-on-click-modal="false"
                append-to-body
        >
            <div style="display: flex">
                <el-form ref="form" :model="form" :rules="rules" label-width="180px" style="width: 750px">
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="模型名称：" prop="name">
                                <el-input
                                        clearable
                                        v-model="form.name"
                                        placeholder="请输入模型名称"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="模型分类：" prop="classifyId" class="formClass">
                                <el-tree-select
                                        v-model="form.classifyId"
                                        :data="classifyOptions"
                                        :props="{ value: 'id', label: 'name', children: 'children' }"
                                        :show-count="true"
                                        placeholder="请选择模型分类"
                                        noResultsText="暂无数据"
                                        :disabled="isEdit"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="是否预置：" prop="builtin">
                                <el-radio :disabled="isEdit" v-model="form.builtin" :label="Number(1)">是</el-radio>
                                <el-radio :disabled="isEdit" v-model="form.builtin" :label="Number(0)">否</el-radio>
                                <el-tooltip class="item" effect="dark" content="选择是之后则不可去设置修改输入参数"
                                            placement="right">
                                    <i class="el-icon-question"></i>
                                </el-tooltip>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="接入方式：" prop="accessMode">
                                <el-radio :disabled="isEdit" v-model="form.accessMode" :value="0">单机程序(exe)
                                </el-radio>
                                <el-radio :disabled="isEdit" v-model="form.accessMode" :value="1">API接口</el-radio>
                                <el-tooltip placement="top" v-if="mess">
                                    <template #content>
                                        Tips: 核心信息请在详情页版本控制里面修改
                                    </template>
                                    &lt;!&ndash; elementui图标库：显示黑色的问号图标   &ndash;&gt;
                                    <el-icon>
                                        <QuestionFilled/>
                                    </el-icon>
                                </el-tooltip>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-if="form.accessMode == 0">
                        <el-col :span="20">
                            <el-form-item label="上传文件：" prop="fileName">
                                <file-name-upload :disabled="isEdit" :fileType="['zip']"
                                                  v-model="form.interfaceorfileAddress"
                                                  :limit="1"
                                                  :fileSize="200" :editName="form.fileName" :style="'width: 420px'"
                                                  :upload-success="uploadSuccess"
                                                  :delete-success="() => form.runnableFileAddress = null"
                                />
                                &lt;!&ndash;              <FileUpload&ndash;&gt;
                                &lt;!&ndash;                v-model="form.interfaceorfileAddress"&ndash;&gt;
                                &lt;!&ndash;                @fileModelName="fileModelName"&ndash;&gt;
                                &lt;!&ndash;                :fileStyle2="true"&ndash;&gt;
                                &lt;!&ndash;                :disabled="isEdit"&ndash;&gt;
                                &lt;!&ndash;                :isModelOrImg="false"&ndash;&gt;
                                &lt;!&ndash;                :limit="1"&ndash;&gt;
                                &lt;!&ndash;                :fileType="['zip']"&ndash;&gt;
                                &lt;!&ndash;                :fileSize="200"&ndash;&gt;
                                &lt;!&ndash;              />&ndash;&gt;
                            </el-form-item>
                        </el-col>
                        <el-col :span="20">
                            <el-form-item label="可执行文件：" prop="runnableFileAddress">
                                <el-input v-model="form.runnableFileAddress"
                                          placeholder="请上传压缩包后在文件列表处选择运行模型的文件"
                                          disabled/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-if="form.accessMode == 1">
                        <el-col :span="20">
                            <el-form-item label="API地址：" prop="interfaceorfileAddress">
                                <el-input
                                        clearable
                                        :disabled="isEdit"
                                        v-model="form.interfaceorfileAddress"
                                        placeholder="请输入API接口"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-if="form.accessMode == 1">
                        <el-col :span="20">
                            <el-form-item label="端口号：" prop="port">
                                <el-input
                                        clearable
                                        :disabled="isEdit"
                                        v-model="form.port"
                                        placeholder="请输入接口端口号"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-if="form.id == null">
                        <el-col :span="20">
                            <el-form-item label="版本号：" prop="version">
                                <el-input :disabled="isEdit" v-model="form.version" placeholder="请输入版本号">
                                    <template #append>Version</template>
                                </el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="版本发布说明：" prop="description">
                                <el-input
                                        :disabled="isEdit"
                                        v-model="form.description"
                                        :rows="3"
                                        type="textarea"
                                        placeholder="请输入版本发布说明"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="模型介绍：" prop="remark">
                                <el-input
                                        v-model="form.remark"
                                        :rows="3"
                                        type="textarea"
                                        placeholder="请输入内容"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
                <el-tree :data="form.fileList" default-expand-all
                         v-if="this.form.accessMode == 0 && this.form.interfaceorfileAddress && this.form.interfaceorfileAddress.length > 0"
                >
                    <template #default="{ data }">
                      <span class="custom-tree-node">
                        <span v-if="data.children">{{ data.fileName }}</span>
                        <el-radio v-model="form.runnableFileAddress" :label="data.fileName" v-if="!data.children">{{
                            data.fileName
                            }}</el-radio>
                      </span>
                    </template>
                </el-tree>
            </div>
            <template #footer>
                <div class="dialog-footer">
                    <el-button type="primary" @click="submitForm">确 定</el-button>
                    <el-button @click="cancel">取 消</el-button>
                </div>
            </template>
        </el-dialog>-->
    </div>
</template>

<script>
import {
    listModel,
    getModel,
    delModel,
    addModel,
    updateModel,
    getFileList
} from "@/api/modelReconstitution/model";
import {listClassify} from "@/api/modelReconstitution/classify";
import {useDict} from "@/utils/dict.js";
import FileNameUpload from "@/components/FileNameUpload/index.vue";
import {QuestionFilled} from "@element-plus/icons-vue";

export default {
    name: "Model",
    components: {QuestionFilled, FileNameUpload},

    data() {
        return {
            mess: false,
            // 遮罩层
            loading: true,
            // 选中数组
            ids: [],
            // 非单个禁用
            single: true,
            // 非多个禁用
            multiple: true,
            // 显示搜索条件
            showSearch: true,
            // 总条数
            total: 0,
            // 模型管理 表格数据
            modelList: [],
            //分类数据
            projectInfo: [],
            classifyName: undefined,
            //分类树选项
            classifyOptions: [],
            // 默认选中的节点的 key 值
            defaultSelectedKey: '',
            // 弹出层标题
            title: "",
            // 是否显示弹出层
            open: false,
            isEdit: false, //是否编辑
            //启用状态禁止删除
            isStatus: false,
            defaultProps: {
                children: "children",
                label: "name",
            },
            // 查询参数
            queryParams: {
                pageNum: 1,
                pageSize: 12,
                orderByColumn: 'create_time',
                isAsc: 'desc',
                companyId: null,
                name: null,
                classifyId: null,
                builtin: null,
                accessMode: null,
                requestMethod: null,
                interfaceorfileAddress: null,
                versionId: null,
                whetherPublish: null,
                publishTime: null,
                creatorId: null,
                updatorId: null,
            },
            // 表单参数
            form: {},
            // 表单校验
            rules: {
                validFlag: [
                    {
                        required: true,
                        message: "是否有效 0：无效，1：有效不能为空",
                        trigger: "blur",
                    },
                ],
                delFlag: [
                    {
                        required: true,
                        message: "删除标志 1：已删除，0：未删除不能为空",
                        trigger: "blur",
                    },
                ],
                createTime: [
                    {required: true, message: "创建时间不能为空", trigger: "blur"},
                ],
                updateTime: [
                    {required: true, message: "更新时间不能为空", trigger: "blur"},
                ],
                classifyId: [
                    {required: true, message: "模型分类不能为空", trigger: "blur"},
                ],
                name: [
                    {required: true, message: "模型名称不能为空", trigger: "blur"},
                ],
                version: [
                    {required: true, message: "版本号不能为空", trigger: "blur"},
                ],
                description: [
                    {required: true, message: "版本发布说明不能为空", trigger: "blur"},
                ],
                interfaceorfileAddress: [
                    {required: true, message: "地址不能为空", trigger: "blur"},
                ],
                port: [
                    {required: true, message: "端口不能为空", trigger: "blur"},
                ],
            },
            model_type: useDict("model_type").model_type,

            leftWidth: 300, isResizing: false, startX: 0,
        };
    },
    created() {
        this.getTreeselect();
    },
    computed: {
        dialogWidth() {
            console.log(123)
            return this.form.accessMode == 0 && this.form.interfaceorfileAddress && this.form.interfaceorfileAddress.length > 0
                ? "1200px" : "750px";
        }
    },
    watch: {
        // 根据名称筛选分类树
        classifyName(val) {
            this.$refs.tree.filter(val);
        },
    },
    methods: {
        startResize(event) {
            this.isResizing = true;
            this.startX = event.clientX;
            // 使用 requestAnimationFrame 减少重绘频率
            document.addEventListener('mousemove', this.updateResize);
            document.addEventListener('mouseup', this.stopResize);
        },

        updateResize(event) {
            if (this.isResizing) {
                const delta = event.clientX - this.startX; // 计算鼠标移动距离
                this.leftWidth += delta; // 修改左侧宽度
                this.startX = event.clientX; // 更新起始位置
                // 使用 requestAnimationFrame 来减少页面重绘频率
                requestAnimationFrame(() => {

                });
            }
        },
        stopResize() {
            this.isResizing = false;
            document.removeEventListener('mousemove', this.updateResize);
            document.removeEventListener('mouseup', this.stopResize);
        },
        uploadSuccess(val) {
            if (val == null || val.length == 0) {
                this.form.fileList = []
            } else {
                getFileList({fileUrl: val[0].url}).then(res => {
                    this.form.fileList = res.data
                })
            }
        },
        fileModelName(res) {
            this.form.fileName = res.originalFilename.substring(0, res.originalFilename.lastIndexOf("."))
        },
        /** 查询模型管理 列表 */
        getList() {
            this.loading = true;
            listModel(this.queryParams).then((response) => {
                this.modelList = response.rows;
                this.total = response.total;
                this.loading = false;
            });
        },
        /** 查询分类下拉树结构 */
        getTreeselect() {
            listClassify().then((res) => {
                for (let i = 0; i < res.rows.length; i++) {
                    let arrTemp = [];
                    for (let j = 0; j < res.rows.length; j++) {
                        if (res.rows[i].id == res.rows[j].parentId) {
                            res.rows[i].children = arrTemp;
                            arrTemp.push(res.rows[j]);
                        }
                    }
                }
                const result = [];
                for (let i = 0; i < res.rows.length; i++) {
                    if (res.rows[i].parentId == 0) {
                        result.push(res.rows[i]);
                    }
                }
                this.classifyOptions = result;
                this.$nextTick(() => {
                    this.$refs.tree.setCurrentKey(this.classifyOptions[0].id)
                })
                this.handleNodeClick(this.classifyOptions[0]);
            });
        },
        // 筛选节点
        filterNode(value, data) {
            if (!value) return true;
            // 使用默认的 label 属性进行比较
            const label = data[this.defaultProps.label];
            return label.indexOf(value) !== -1;
        },
        // 节点单击事件
        handleNodeClick(data) {
            this.queryParams.classifyId = data.id;
            this.handleQuery();
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
                name: null,
                classifyId: null,
                classifyName: null,
                builtin: null,
                accessMode: null,
                requestMethod: null,
                interfaceorfileAddress: null,
                fileList: [],
                runnableFileAddress: null,
                versionId: null,
                version: null,
                description: null,
                whetherPublish: null,
                publishTime: null,
                delFlag: null,
                createBy: null,
                creatorId: null,
                createTime: null,
                updateBy: null,
                updatorId: null,
                updateTime: null,
                remark: null
            };
            this.isEdit = false;
            this.resetForm("form");
            this.handleNodeClick(this.classifyOptions[0]);
        },
        /** 搜索按钮操作 */
        handleQuery() {
            this.queryParams.pageNum = 1;
            this.getList();
        },
        /** 重置按钮操作 */
        resetQuery() {
            this.resetForm("queryForm");
            this.queryParams.classifyId = undefined;
            this.handleNodeClick(this.classifyOptions[0]);
            this.handleQuery();
            this.$refs.tree.setCurrentKey(null);
        },
        // 多选框选中数据
        handleSelectionChange(selection) {
            this.ids = selection.map((item) => item.id);
            this.single = selection.length !== 1;
            this.multiple = !selection.length;
        },
        /** 新增按钮操作 */
        handleAdd() {
            this.reset();
            this.open = true;
            this.title = "添加模型管理 ";
            this.mess = false;
        },
        /** 修改按钮操作 */
        handleUpdate(row) {
            this.reset();
            const id = row.id || this.ids;
            getModel(id).then((response) => {
                this.form = response.data;
                this.open = true;
                this.title = "修改模型管理 ";
                if (this.form.type) {
                    this.form.type = this.form.type.toString();
                }
                if (this.form.dimensions) {
                    this.form.dimensions = this.form.dimensions.toString();
                }
                if (this.form.builtin) {
                    this.form.builtin = parseInt(this.form.builtin);
                }
                if (this.form.format) {
                    this.form.format = parseInt(this.form.format);
                }
                this.isEdit = this.form.builtin == 1 ? true : this.form.whetherPublish == 1 ? true : false;
                this.mess = true;
                if (this.form.accessMode == 0) {
                    getFileList({fileUrl: this.form.interfaceorfileAddress}).then(res => {
                        this.form.fileList = res.data
                    })
                }
            });
        },
        // 详情
        handleView(row) {

            this.$message.warning(`模型详情正在开发中，敬请期待～`);
            return;

            const modelId = row.id;
            const modelName = row.name;
            this.$router.push({
                path: "/model/modelManageView",
                query: {
                    modelId,
                    modelName,
                    pageNum: this.queryParams.pageNum,
                },
            });
        },
        /** 提交按钮 */
        submitForm() {
            this.$refs["form"].validate((valid) => {
                if (valid) {
                    let form = JSON.parse(JSON.stringify(this.form))
                    if (form.interfaceorfileAddress && form.interfaceorfileAddress.length > 0) {
                        form.fileName = form.interfaceorfileAddress[0].name;
                        form.interfaceorfileAddress = form.interfaceorfileAddress[0].url;
                    }
                    if (form.id != null) {
                        updateModel(form).then(() => {
                            this.$modal.msgSuccess("修改成功");
                            this.open = false;
                            this.getList();
                        });
                    } else {
                        addModel(form).then(() => {
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
            const ids = row.id || this.ids;
            const name = row.name;
            const uploadStatus = row.uploadStatus;
            if (uploadStatus == 1) {
                this.$modal
                    .confirm("【" + name + "】模型已启用，请先停用！")
                    .catch(() => {
                    });
            } else {
                this.$modal
                    .confirm("是否确认删除名称为【" + name + "】的模型数据吗？")
                    .then(function () {
                        return delModel(ids);
                    })
                    .then(() => {
                        this.getList();
                        this.$modal.msgSuccess("删除成功");
                    })
                    .catch(() => {
                    });
            }
        },
        /** 导出按钮操作 */
        handleExport() {
            this.download(
                "modelReconstitution/model/export",
                {
                    ...this.queryParams,
                },
                `model_${new Date().getTime()}.xlsx`
            );
        },
    },
};
</script>
<style lang="scss" scoped>
.pagecont-bottom {
  flex: 1;
  min-height: calc(100vh - 250px);
  padding: 13px 15px;
  background-color: #ffffff;
  border-radius: 2px;
  box-shadow: 0 5px 8px rgba(128, 145, 165, 0.1);
}

::v-deep {
  .selectlist .el-tag.el-tag--info {
    background: #F3F8FF !important;
    border: 0px solid #6BA7FF !important;
    color: #2666fb !important;
  }
}

.left-pane {
  background-color: #ffffff;
  overflow: hidden;
  transition: width 0s; /* 可以根据需要调整过渡时间 */
}

.resize-bar {
  cursor: ew-resize;
  background-color: #f0f2f5;
  height: 86vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.resize-handle-sx {
  width: 15px;
  text-align: center;
  //   cursor:pointer
}

.zjsx {
  display: inline-block;
  width: 5px;
  height: 50px;
  border-left: 1px solid #ccc;
  border-right: 1px solid #ccc;
}

.el-main {
  padding: 2px 0px;
  // box-shadow: 1px 1px 3px rgba(0, 0, 0, .2);
}

.el-aside {
  padding: 2px 0px;
  margin-bottom: 0px;
  background-color: #f0f2f5;
}

.custom-tree-node {
  display: flex;
  align-items: center;
}

.treelable {
  margin-left: 5px;
}

.zjiconimg {
  font-size: 12px;
}

.colorxz {
  color: var(--el-color-primary);
  font-size: 16px;
}

.colorwxz {
  color: var(--el-color-primary-light-6);
  font-size: 16px;
}

.iconimg {
  font-size: 15px;

}

//上传附件样式调整
:deep {
  // .el-upload-list{
  //    display: flex;
  // }
  .el-upload-list__item {
    width: 100%;
    height: 25px;
  }

  .el-tree--highlight-current .el-tree-node.is-current > .el-tree-node__content {
    background-color: var(--el-color-primary-light-9) !important;
    border-right: 2px solid var(--el-color-primary);
    color: var(--el-color-primary);
  }
}

.card-item {
  .item-top {
    display: flex;
    align-items: center;
    justify-content: space-between;

    .top-title {
      width: 85%;
      font-weight: bold;
      font-size: 16px;
      line-height: 22px;
      // i {
      //   vertical-align: middle;
      // }
      span {
        margin-left: 5px;
      }
    }

    .top-status {
      width: 25%;
      display: flex;
      align-items: center;

      .status-icon {
        margin-right: 3px;
        width: 7px;
        height: 7px;
        border-radius: 50%;
        // background-color: rgb(255, 217, 74);
      }

      .status-name {
        // color: rgb(255, 217, 74);
        font-size: 14px;
        font-weight: bold;
      }
    }
  }

  .item-desc {
    min-height: 52px;
    color: #999;
    font-size: 14px;
    font-weight: 400;
    margin: 10px 0;
    line-height: 1.2;
  }

  .item-con {
    display: flex;
    align-items: center;
    border-top: 1px solid #ebeef5;
    border-bottom: 1px solid #ebeef5;
    padding: 10px 0;
    margin-top: 10px;

    .con-l {
      width: 100%;

      .con-view {
        display: flex;
        align-items: center;
        text-align: left;
        font-weight: 400;
        line-height: 1.5;
        font-size: 14px;

        &:last-child {
          padding-bottom: 0px;
        }

        .con-view-title {
          width: 72px;
          color: rgb(144, 136, 156);
        }

        ::v-deep .el-tag {
          height: 17px;
          line-height: 15px;
          margin-bottom: 3px;
        }
      }
    }
  }
}

.card-btns {
  width: 100%;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 6px 0 10px;
}

.formClass {

  ::v-deep .vue-treeselect--disabled .vue-treeselect__control {
    background-color: #f5f7fa
  }

  ::v-deep .vue-treeselect--disabled .vue-treeselect__single-value {
    color: #c0c4cc;
  }
}

.head-container {
  ::v-deep .el-tree--highlight-current .el-tree-node.is-current > .el-tree-node__content {
    background-color: #cee5ff;
  }
}
</style>
