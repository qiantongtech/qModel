<template>
    <div class="app-container pagecont-top">
        <el-form
                :model="queryParams"
                ref="queryForm"
                :inline="true"
                v-show="showSearch"
        >
            <el-form-item label="版本号：" prop="modelVersion">
                <el-select
                        class="el-form-input-width"
                        v-model="queryParams.modelVersion"
                        placeholder="请输入版本号"
                        clearable
                >
                    <el-option
                            v-for="item in versionList"
                            :key="item.id"
                            :label="'Version ' + item.version"
                            :value="item.version">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="起止时间：" prop="timer">
                <el-date-picker
                        clearable
                        v-model="timer"
                        type="daterange"
                        range-separator="至"
                        start-placeholder="开始时间"
                        end-placeholder="结束时间"
                        value-format="yyyy-MM-dd"
                        @change="timerChange"
                >
                </el-date-picker>
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

        <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
                <el-button type="primary" plain @click="handleAdd">新增</el-button>
            </el-col>
            <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"/>
        </el-row>

        <el-table v-loading="loading" :data="caclList" @selection-change="handleSelectionChange">
            <!--      <el-table-column label="计算编码" align="center" prop="id" />-->
            <el-table-column label="计算名称" align="center" prop="name"/>
            <!--      <el-table-column label="模型名称" align="center" prop="modelName" />-->
            <el-table-column label="版本号" align="center" prop="modelVersion">
                <template #default="scope">
                    <el-tag size="small">Version {{ scope.row.modelVersion }}</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="开始时间" align="center" prop="startTime" width="180">
                <template #default="scope">
                    <span v-if="scope.row.startTime == null">--</span>
                    <span v-else>{{ parseTime(scope.row.startTime, "{y}-{m}-{d}") }}</span>
                </template>
            </el-table-column>
            <el-table-column label="结束时间" align="center" prop="endTime" width="180">
                <template #default="scope">
                    <span v-if="scope.row.endTime == null">--</span>
                    <span v-else>{{ parseTime(scope.row.endTime, "{y}-{m}-{d}") }}</span>
                </template>
            </el-table-column>
            <el-table-column label="计算状态" align="center" prop="status">
                <template #default="scope">
                    <dict-tag :options="model_type" :value="scope.row.status + ''"/>
                </template>
            </el-table-column>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                <template #default="scope">
                    <el-button type="primary" link @click="setParams(scope.row)">输入参数设置</el-button>
                    <el-button type="primary" link @click="handleCompute(scope.row)">开始计算</el-button>
                    <el-button type="primary" link @click="handleView(scope.row)">查看计算结果</el-button>
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

        <!-- 添加或修改模型计算管理 对话框 -->
        <el-dialog
                :title="title"
                v-model="open"
                width="800px"
                :close-on-click-modal="false"
                :append-to="dialogAppendTo"
                draggable
        >
            <template #header="{ close, titleId, titleClass }">
                <span role="heading" aria-level="2" :id="titleId" :class="titleClass">{{ title }}</span>
            </template>
            <el-form ref="form" :model="form" :rules="rules" label-width="150px">
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="计算名称：" prop="name">
                            <el-input clearable v-model="form.name" placeholder="请输入计算名称"/>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="模型名称：" prop="modelId">
                            <el-select
                                    v-model="form.modelId"
                                    placeholder="请选择所属模型"
                                    clearable
                                    class="el-form-input-width"
                                    :disabled="true"
                                    @change="
                  getAllModelVersion(form.modelId),
                    (form.modelVersion = null)
                "
                                    value-key="id"
                            >
                                <el-option
                                        v-for="dict in modelList"
                                        :key="dict.id"
                                        :label="dict.name"
                                        :value="dict.id"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="模型版本：" prop="modelVersion">
                            <el-select
                                    v-model="form.modelVersion"
                                    placeholder="请先选择所属模型"
                                    clearable
                                    class="el-form-input-width"
                                    @change="
                  getInterfaceAddress(form.modelId.id,form.modelVersion),
                    (form.addressId = null)
                "
                            >
                                <el-option
                                        v-for="dict in versionList"
                                        :key="dict.id"
                                        :label="'Version ' + dict.version"
                                        :value="parseInt(dict.version)"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="接口选择：" prop="addressId">
                            <el-select
                                    v-model="form.addressId"
                                    placeholder="请先选择模型接口"
                                    clearable
                                    style="width: 100%"
                            >
                                <el-option
                                        v-for="dict in interfaceAddressList"
                                        :key="dict.id"
                                        :label="dict.interfaceAddress"
                                        :value="dict.id"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
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
import {
    listCacl,
    getCacl,
    delCacl,
    addCacl,
    updateCacl,
    startCacl,
    findModelInputById,
    findModelOutputById,
} from "@/api/modelReconstitution/cacl";
import {findAllModel, findAllModelVersion} from "@/api/modelReconstitution/input";
import {listInterfaceAddress} from "@/api/modelReconstitution/interfaceAddress";
import {useDict} from "@/utils/dict.js";
export default {
    name: "modelCompute",
    data() {
        return {
            size: 'small',
            deleteFlag: true,
            names: [
                {success: "请求状态"},
                {errorCode: "状态值"},
                {message: "请求是否成功"},
                {data: "数据"},
                {buildingId: "设备id"},
                {buildingName: "设备名称"},
                {buildingType: "设备类型"},
                {buildingTypeName: "设备类型名称"},
                {useable: "是否可用"},
                {realFlow: "实时流量"},
                {pumpSate: "泵组状态"},
                {maxTheoryFlow: "流量上限"},
                {minTheoryFlow: "流量下限"},
            ],
            jsonStr: {
                "success": true,
                "errorCode": "2000",
                "message": "操作成功",
                "data": [
                    {
                        "buildingId": "SGJZ00000849",
                        "buildingName": "西泵站 5#机组",
                        "buildingType": "100008",
                        "buildingTypeName": "泵站",
                        "useable": true,
                        "realFlow": 0,
                        "pumpSate": 0,
                        "maxTheoryFlow": 8,
                        "minTheoryFlow": 0
                    }
                ]
            },
            inputList: [],
            outputList: [],
            modelList: [],
            versionList: [],
            interfaceAddressList: [],
            cacl: {},
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
            // 模型计算管理 表格数据
            caclList: [],
            // 弹出层标题
            title: "",
            // 是否显示弹出层
            open: false,
            // 查询参数
            timer: null,
            queryParams: {
                pageNum: 1,
                pageSize: 10,
                modelName: null,
                modelVersion: null,
                startTime: null,
                endTime: null,
            },
            // 表单参数
            form: {
                modelId: null
            },
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
            },
            titleParams: "",
            openParams: false,
            formParams: {},
            rulesParams: {},
            model_type: useDict("calculation_status").model_type,
        };
    },

    created() {
        this.getAllModel();
    },
    props: {
        model: {
            type: Object
        }
    },
    watch: {
        model: {
            handler(newVal, oldVal) {
                if (newVal != null && oldVal != null && newVal.id == oldVal.id)
                    return;
                if (newVal) {
                    this.form.modelId = newVal.id
                    this.queryParams.modelVersion = newVal.version
                    this.queryParams.modelId = newVal.id
                    this.form.modelId = newVal.id
                }
                this.getList();
                this.getAllModelVersion(this.form.modelId)
            },
            deep: true, // 开启深度监听
            immediate: true
        }
    },
    computed: {
        dialogAppendTo() {
            return this.$refs.appContainer || 'body';
        }
    },

    methods: {
        // 获取输入参数
        getInputList(param) {
            findModelInputById(param).then((res) => {
                this.jsonStr = JSON.parse(res.data.modelInputJson) == null ? {} : JSON.parse(res.data.modelInputJson)
                let namesCpoy = JSON.parse(res.data.modelInputNames)

                this.names = [];
                for (let key in namesCpoy) {
                    this.names.push({[key]: namesCpoy[key]})
                }
            });
        },
        // 获取输出参数
        getOutputList(param) {
            findModelOutputById(param).then((res) => {
                this.jsonStr = JSON.parse(res.data.modelOutputJson) == null ? {} : JSON.parse(res.data.modelOutputJson)
                let namesCpoy = JSON.parse(res.data.modelOutputNames)

                this.names = [];
                for (let key in namesCpoy) {
                    this.names.push({[key]: namesCpoy[key]})
                }
            });
        },
        // 获取模型
        getAllModel() {
            findAllModel({}).then((res) => {
                this.modelList = res.data;
            });
        },
        // 获取版本
        getAllModelVersion(param) {
            const data = {modelId: param};
            findAllModelVersion(data).then((res) => {
                if (param) {
                    this.versionList = res.data;
                } else {
                    this.versionList = [];
                }
            });
        },
        /**监听json数据变化 */
        jsonListener(json) {
            console.log(json)
            this.jsonStr = json
        },
        // 获取接口列表
        getInterfaceAddress(modelId, version) {
            let versionId = this.versionList.filter(item => {
                if (item.version == version) {
                    return true;
                }
            })[0].id
            const data = {modelId: modelId, versionId: versionId};
            listInterfaceAddress(data).then(response => {
                this.interfaceAddressList = response.rows;
            });
        },
        selectCacl(id) {
            getCacl(id).then(res => {
                this.cacl = res.data
            })
        },
        timerChange(e) {
            if (e) {
                this.queryParams.startTime = e[0];
                this.queryParams.endTime = e[1];
            } else {
                this.queryParams.startTime = null;
                this.queryParams.endTime = null;
            }
        },
        /** 查询模型计算管理 列表 */
        getList() {
            this.loading = true;
            listCacl(this.queryParams).then((response) => {
                this.caclList = response.rows;
                this.total = response.total;
                this.loading = false;
            });
        },
        // 取消按钮
        cancel() {
            this.open = false;
            this.reset();
            this.openParams = false;
            this.resetParams();
        },
        // 表单重置
        reset() {
            this.form = {
                id: null,
                code: null,
                name: null,
                modelId: null,
                modelName: null,
                modelVersion: null,
                startTime: null,
                endTime: null,
                status: 0,
                inputIds: null,
                outputIds: null,
                validFlag: null,
                delFlag: null,
                createBy: null,
                creatorId: null,
                createTime: null,
                updateBy: null,
                updatorId: null,
                updateTime: null,
                remark: null,
                addressId: null,
                addressType: null,
                address: null,
                requestMethod: null,
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
            this.queryParams.modelVersion = this.model.version
            this.handleQuery();
        },
        // 多选框选中数据
        handleSelectionChange(selection) {
            this.ids = selection.map((item) => item.id);
            this.single = selection.length !== 1;
            this.multiple = !selection.length;
        },
        // 表单重置
        resetParams() {
            this.formParams = {
                id: null,
                code: null,
                name: null,
                modelId: null,
                modelName: null,
                modelVersion: null,
                startTime: null,
                endTime: null,
                status: 0,
                inputIds: null,
                outputIds: null,
                validFlag: null,
                delFlag: null,
                createBy: null,
                creatorId: null,
                createTime: null,
                updateBy: null,
                updatorId: null,
                updateTime: null,
                remark: null,
                addressId: null,
                addressType: null,
                address: null,
                requestMethod: null,
            };
            this.resetForm("formParams");
        },
        /** 新增按钮操作 */
        handleAdd() {
            this.reset();
            this.form.modelId = this.model.id
            this.open = true;
            this.title = "添加模型计算";
        },
        /** 操作-设置参数 */
        setParams(row) {
            const id = row.id;
            this.resetParams();
            // this.openParams = true;
            // this.titleParams = "输入参数设置";
            // this.deleteFlag = true;
            this.$tab.openPage("/model/modelComputeInputOrOutput?modelId="
                + this.model.id
                + "&computeId=" + id
                + "&isInputOrOut=0&deleteFlag:1");
            /*this.getInputList(id);
            this.selectCacl(id);*/
        },
        /** 操作-计算 */
        handleCompute(row) {
            const id = row.id;
            this.caclList.forEach(item => {
                if (item.id == id) {
                    item.status = 1;
                }
            })
            startCacl(id).then(res => {
                this.$modal.msgSuccess("模型计算完毕");
                this.getList();
            })
        },
        /** 操作-查看结果 */
        handleView(row) {
            const id = row.id;
            getCacl(id).then(res => {
                this.cacl = res.data
                if (this.cacl.status != 2) {
                    this.$modal.alertError("模型还没有计算完成，请耐心等待.....")
                    return
                }
                // this.openParams = true;
                // this.titleParams = "查看结果";
                // this.deleteFlag = false;
                this.$tab.openPage("查看计算结果", "/modelReconstitution/waterConserve/modelComputeInputOrOutput", {
                    modelId: this.model.id,
                    computeId: id,
                    isInputOrOut: 1,
                    deleteFlag: false
                });
                /*this.getOutputList(id);
                */
            })
        },
        /** 修改按钮操作 */
        handleUpdate(row) {
            this.reset();
            const id = row.id || this.ids;
            getCacl(id).then((response) => {
                this.form = response.data;
                this.open = true;
                this.title = "修改模型计算管理 ";
            });
        },
        /** 提交按钮 */
        submitForm() {
            this.$refs["form"].validate((valid) => {
                if (valid) {
                    let model = this.modelList.filter(item => {
                        if (item.id == this.form.modelId) {
                            return true
                        }
                    })[0]
                    this.form.modelName = model.name
                    this.form.addressType = model.accessMode
                    if (this.form.id != null) {
                        updateCacl(this.form).then((response) => {
                            this.$modal.msgSuccess("修改成功");
                            this.open = false;
                            this.getList();
                        });
                    } else {
                        addCacl(this.form).then((response) => {
                            this.$modal.msgSuccess("新增成功");
                            this.open = false;
                            this.getList();
                        });
                    }
                }
            });
        },
        // 设置参数保存
        submitJsonForm() {
            let cacl = {id: this.cacl.id, inputContent: JSON.stringify(this.jsonStr)};
            updateCacl(cacl).then((response) => {
                this.$modal.msgSuccess("参数设置成功");
                this.openParams = false;
                this.getList();
            });
        },
        /** 删除按钮操作 */
        handleDelete(row) {
            const ids = row.id || this.ids;
            this.$modal
                .confirm('是否确认删除模型计算管理 编号为"' + ids + '"的数据项？')
                .then(function () {
                    return delCacl(ids);
                })
                .then(() => {
                    this.getList();
                    this.$modal.msgSuccess("删除成功");
                })
                .catch(() => {
                });
        },
        /** 导出按钮操作 */
        handleExport() {
            this.download(
                "model/cacl/export",
                {
                    ...this.queryParams,
                },
                `cacl_${new Date().getTime()}.xlsx`
            );
        },

        /** 单值 添加按钮操作 */
        handleAddSingle() {
            let obj = {};
            obj.param = "";
            obj.name = "";
            obj.value = "";
            this.form.singleContent.push(obj);
        },
        /** 单值 删除按钮操作 */
        handleDeleteSingle(row) {
            const id = row.index;
            const singleContent = this.form.singleContent;
            this.form.singleContent = singleContent.filter(function (item) {
                return item.index != id;
            });
        },
        /** 单值 序号 */
        singleIndex({row, rowIndex}) {
            row.index = rowIndex + 1;
        },
        /** 复选框选中数据 */
        handleSingleChange(selection) {
            this.checkedSingle = selection.map((item) => item.index);
        },

        /** 多列值 添加按钮操作 */
        handleAddMultiple() {
            let obj = {};
            obj.name = "";
            obj.value = "";
            obj.order = "";
            this.form.multipleContent.push(obj);
        },
        /** 多列值 删除按钮操作 */
        handleDeleteMultiple(row) {
            const id = row.index;
            const multipleContent = this.form.multipleContent;
            this.form.multipleContent = multipleContent.filter(function (item) {
                return item.index != id;
            });
        },
        /** 多列值 序号 */
        multipleIndex({row, rowIndex}) {
            row.index = rowIndex + 1;
        },
        /** 复选框选中数据 */
        handleMultipleChange(selection) {
            this.checkedMultiple = selection.map((item) => item.index);
        },
    },
};
</script>
<style lang="scss" scoped>
.modelCompute {
}

.params-item {
  .params-title {
    font-weight: bold;
    font-size: 16px;
    padding: 10px;
    border-bottom: 1px solid #eee;
  }

  .params-con {
    padding: 20px 0px;
  }
}
</style>
