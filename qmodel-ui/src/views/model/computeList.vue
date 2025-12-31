<template>
    <div class="app-container">
        <div class="pagecont-top" v-show="showSearch">
            <el-form
                    :model="queryParams"
                    ref="queryForm"
                    :inline="true"
                    v-show="showSearch"
                    class="btn-style"
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
        </div>

        <div class="pagecont-bottom">
            <div class="justify-between mb15">

                <el-row :gutter="10" class="btn-style">
                    <el-col :span="1.5">
                        <el-button type="primary" plain @click="handleAdd" v-hasPermi="['model:cacl:add']">
                            <i class="iconfont-mini icon-xinzeng mr5"></i>新增
                        </el-button>
                    </el-col>
                </el-row>
                <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>

            </div>

            <el-table
                    v-loading="loading"
                    :data="caclList"
                    @selection-change="handleSelectionChange"
            >
                <el-table-column label="计算编码" align="center" prop="id"/>
                <el-table-column label="计算名称" align="center" prop="name"/>
                <el-table-column label="模型名称" align="center" prop="modelName"/>
                <el-table-column label="版本号" align="center" prop="modelVersion">
                    <template #default="scope">
                        <el-tag size="small">Version {{ scope.row.modelVersion }}</el-tag>
                    </template>
                </el-table-column>
                <el-table-column
                        label="开始时间"
                        align="center"
                        prop="startTime"
                        width="180"
                >
                </el-table-column>
                <el-table-column
                        label="结束时间"
                        align="center"
                        prop="endTime"
                        width="180"
                >
                </el-table-column>
<!--                <el-table-column label="计算状态" align="center" prop="status">-->
<!--                              <template #default="scope">-->
<!--                              <dict-tag-->
<!--                                :options="dict.type.calculation_status"-->
<!--                                :value="scope.row.status + ''"-->
<!--                              />-->
<!--                              </template>-->
<!--                </el-table-column>-->
                <el-table-column
                        label="操作"
                        align="center"
                        class-name="small-padding fixed-width"
                        width="300"
                >
                    <template #default="scope">
                        <el-button link type="primary" icon="Edit" @click="setParams(scope.row)">设置参数</el-button>
                        <el-button link type="primary" icon="cpu" @click="handleCompute(scope.row)">开始计算</el-button>
                        <el-button link type="primary" icon="view" @click="handleView(scope.row)">查看计算结果</el-button>
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
        <!-- 添加或修改模型计算管理 对话框 -->
        <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
             <template #header="{ close, titleId, titleClass }">
                 <span role="heading" aria-level="2" class="el-dialog__title">
                    {{ title }}
                  </span>
             </template>
             <el-form ref="form" :model="form" :rules="rules" label-width="150px">
                <el-row>
                    <el-col :span="20">
                        <el-form-item label="计算名称：" prop="name">
                            <el-input
                                    clearable
                                    v-model="form.name"
                                    placeholder="请输入计算名称"
                            />
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
                                    style="width: 100%"
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
import {
    findAllModel,
    findAllModelVersion,
    getAllInputJson
} from "@/api/modelReconstitution/input";
import {waterSurfaceProfileAndQzhb} from "@/api/modelReconstitution/output";
import moment from "moment";

// const { proxy } = getCurrentInstance();
// const { calculation_status } = proxy.useDict("calculation_status");
export default {
    name: "modelCompute",
    data() {
        return {
            inputMap: new Map(),
            inputMultipleContent: [],
            csDatas: [
                "CS1", "CS2", "CS3", "CS4", "CS5", "CS6", "CS7", "CS8", "CS9", "CS10",
                "CS11", "CS12", "CS13", "CS14", "CS15", "CS16", "CS17", "CS18", "CS19", "CS20",
                "CS21", "CS22", "CS23", "CS24", "CS25", "CS26", "CS27", "CS28", "CS29", "CS30",
                "CS31", "CS32", "cs东1", "cs东2", "cs西2", "cs东3", "cs西3"
            ],
            csChineseName: [
                "小山口一级电站下游断面", "小山口一、二级之间断面", "小山口二级电站上游断面", "小山口二级电站下游断面", "小山口三级电站上游断面(0-2312)", "开都河一枢纽上游断面(0-0669)", "开都河一枢纽下游河道断面(2+021)",
                "开都河一枢纽河道断面(4+079)", "开都河一枢纽河道断面(6+0533)", "开都河一枢纽河道断面(9+888)", "开都河一枢纽河道断面(12+089)", "开都河一枢纽河道断面(15+574)", "开都河一枢纽河道断面(18+838)", "开都河一枢纽河道断面(21+060)",
                "开都河一枢纽河道断面(23+993)", "开都河一枢纽河道断面(26+293)", "开都河一枢纽河道断面(27+783)", "开都河一枢纽河道断面(30+349)", "开都河一枢纽河道断面(35+508)", "开都河一枢纽河道断面(38+245)", "开都河一枢纽河道断面(42+202)",
                "开都河一枢纽河道断面(45+253)", "开都河二枢纽闸前断面(47+855)", "开都河二枢纽河道断面(50+235)", "开都河二枢纽河道断面(53+424)", "开都河二枢纽吐和高速公路桥断面(55+002)", "开都河二枢纽焉耆大桥断面(58+961)", "开都河二枢纽河道断面(60+633)",
                "开都河二枢纽河道断面(62+106)", "开都河二枢纽河道断面(64+151)", "开都河二枢纽河道断面(66+882)", "开都河三枢纽闸前断面(68+909)", "cs东1", "cs东2", "cs西2", "cs东3", "cs西3"
            ],
            inputContentJsonData: {},
            modelCacl: {},
            // 查看结果的数据json
            outputJsonData: [],
            // 模型输出结果获取
            modelOutputOutcome: {},
            inputSingleValueData: {},
            outputSingleValueData: {},
            // 单值的树形数据
            inputSingleValue: [],
            outputSingleValue: [],
            // 树形被选择的节点
            currentNodeKey: "",
            // 输出的树形结构
            outputData: [],
            defaultProps: {
                children: "children",
                label: "label",
            },
            // 输出文件显示的数据
            outputEntity: {},
            fileTitle: null,
            isView: false,
            modelDetails: {},
            datFileJson: [],
            inputJson: [],
            inputJsonTwo: [],
            showInputJson: [],
            inputTitles: [],
            inputTitlesTwo: [],
            inputPage: {
                pageNum: 1,
                pageSize: 10
            },
            chooseInputTitle: "小山口流量",
            waterSurfaceProfileAndQzhb: [],
            inputList: [],
            outputList: [],
            modelList: [],
            versionList: [],
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
            },
            titleParams: "",
            openParams: false,
            formParams: {},
            rulesParams: {},
        };
    },
    computed: {
        toChinesNum() {
            return function (num) {
                let changeNum = [
                    "零",
                    "一",
                    "二",
                    "三",
                    "四",
                    "五",
                    "六",
                    "七",
                    "八",
                    "九",
                ]; //changeNum[0] = "零"
                let unit = ["", "十", "百", "千", "万"];
                num = parseInt(num);
                let getWan = (temp) => {
                    let strArr = temp.toString().split("").reverse();
                    let newNum = "";
                    for (var i = 0; i < strArr.length; i++) {
                        newNum =
                            (i == 0 && strArr[i] == 0
                                ? ""
                                : i > 0 && strArr[i] == 0 && strArr[i - 1] == 0
                                    ? ""
                                    : changeNum[strArr[i]] + (strArr[i] == 0 ? unit[0] : unit[i])) +
                            newNum;
                    }
                    return newNum;
                };
                let overWan = Math.floor(num / 10000);
                let noWan = num % 10000;
                if (noWan.toString().length < 4) noWan = "0" + noWan;
                return overWan ? getWan(overWan) + "万" + getWan(noWan) : getWan(num);
            };
        },
        fileType() {
            return function (file) {
                if (file) {
                    let type = file.substring(file.lastIndexOf("/") + 1, file.length);
                    return type;
                }
            };
        },
        isDateFormat() {
            return function (str) {
                const date = new Date(str);
                return !isNaN(date);
            }
        }
    },
    created() {
        this.getAllModel();
    },
    props: {
        model: {
            type: Object,
            default: {}
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
                this.queryParams.modelVersion = newVal.version
                this.queryParams.modelId = newVal.id
                this.getList();
                this.getAllModelVersion(this.form.modelId)
            },
            deep: true, // 开启深度监听
            immediate: true
        }
    },
    methods: {
        rowStyle({row, rowIndex}) {
            if (rowIndex >= (this.inputPage.pageNum - 1) * this.inputPage.pageSize && rowIndex < this.inputPage.pageNum * this.inputPage.pageSize) return;
            return {
                "display": "none"
            };
        },
        // 获取输入参数
        getInputList(param) {
            return new Promise((resolve) => {
                findModelInputById(param).then((res) => {
                    this.inputList = res.data.modelInputList;
                    for (let i = 0; i < this.inputList.length; i++) {
                        this.inputList[i].singleContent = JSON.parse(
                            this.inputList[i].singleContent
                        );
                        this.inputList[i].multipleContent = JSON.parse(
                            this.inputList[i].multipleContent
                        );
                        this.inputList[i].pageNum = 1;
                        this.inputList[i].pageSize = 10;
                    }
                    resolve(this.inputList);
                });
            });
        },
        // 获取输出参数
        getOutputList(param) {
            return new Promise((resolve) => {
                findModelOutputById(param).then((res) => {
                    this.inputList = res.data.modelOutputList;
                    for (let i = 0; i < this.inputList.length; i++) {
                        this.inputList[i].singleContent = JSON.parse(
                            this.inputList[i].singleContent
                        );
                        this.inputList[i].multipleContent = JSON.parse(
                            this.inputList[i].multipleContent
                        );
                    }
                    resolve(this.inputList);
                });
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
            this.isView = false;
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
            this.timer = null;
            this.queryParams.endTime = null;
            this.queryParams.startTime = null;
            this.resetForm("queryForm");
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
        async setParams(row) {
            this.$message.warning(`由于服务器资源问题，暂不支持在演示站中计算，请在本地搭建计算。`);
            return;

            const id = row.id;
            const res = await this.getInputList(id);
            if (res.length == 0) {
                this.$message.warning(`模型名称【${row.modelName}】未设置输入参数`);
                return;
            }
            await this.$tab.openPage("设置参数", "/modelReconstitution/waterConserve/fileInputOrOutput", {
                modelId: this.model.id,
                computeId: id,
                isInputOrOut: 0
            });
        },

        /** 操作-计算 */
        handleCompute(row) {

            this.$message.warning(`由于服务器资源问题，暂不支持在演示站中计算，请在本地搭建计算。`);
            return;

            const ids = row.id || this.ids;
            this.$modal
                .confirm("是否开始计算模型名称为【 " + row.name + " 】的数据项？")
                .then(function () {
                    startCacl(ids).then(res => {
                        this.$modal.msgSuccess("模型计算完毕");
                        this.getList();
                    })
                })
                .then(() => {
                    this.getList();
                    this.$modal.msgSuccess("已成功开始计算");
                })
                .catch(() => {
                });
        },
        /** 操作-查看结果 */
        async handleView(row) {

            this.$message.warning(`由于服务器资源问题，暂不支持在演示站中计算，请在本地搭建计算。`);
            return;

            const id = row.id;
            if (row.status == 0) {
                this.$message.warning(`模型数据处于待开始状态，请点击计算后等待计算完成`);
                return;
            }
            if (row.status == 1) {
                this.$message.warning(`模型数据处于计算中状态，请耐心等待计算完成`);
                return;
            }
            const res = await this.getOutputList(id);
            if (res.length == 0) {
                this.$message.warning(`模型名称【${row.modelName}】未设置输出参数`);
                return;
            } else {

                await this.$tab.openPage("查看计算结果", "/model/waterConserve/fileInputOrOutput", {
                    modelId: this.model.id,
                    computeId: id,
                    isInputOrOut: 1
                });
            }
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
        submitFormParams() {
            this.openParams = false;

            let name = this.inputList.filter(item => {
                if (item.engName == "qqsp_xsk.dat") {
                    return true;
                }
                return false;
            })[0].name
            let hsgName = this.inputList.filter(item => {
                if (item.engName == "Qin_huangshuigou.dat") {
                    return true;
                }
                return false;
            })[0].name

            let wltName = this.inputList.filter(item => {
                if (item.engName == "Qin_wulasitaihe.dat") {
                    return true;
                }
                return false;
            })[0].name

            let zmName = this.inputList.filter(item => {
                if (item.engName == "shuniu_zhamenkongzhi.dat") {
                    return true;
                }
                return false;
            })[0].name

            let firstNorth = this.inputList.filter(item => {
                if (item.engName == "Qout_diyishuniu_beiganfenshui.dat") {
                    return true;
                }
                return false;
            })[0].name

            let secondNorth = this.inputList.filter(item => {
                if (item.engName == "Qout_diershuniu_beiganfenshui.dat") {
                    return true;
                }
                return false;
            })[0].name

            let firstSouth = this.inputList.filter(item => {
                if (item.engName == "Qout_diyishuniu_nanganfenshui.dat") {
                    return true;
                }
                return false;
            })[0].name

            let secondSouth = this.inputList.filter(item => {
                if (item.engName == "Qout_diershuniu_nanganfenshui.dat") {
                    return true;
                }
                return false;
            })[0].name

            let hedaosunshi = this.inputList.filter(item => {
                if (item.engName == "hedaosunshi.dat") {
                    return true;
                }
                return false;
            })[0].name

            let timeSet = new Set();
            for (let i = 0; i < this.inputJson[name].length; i++) {
                timeSet.add(moment(this.inputJson[name][i][0]).format("YYYY-MM-DD"))
            }
            let beginDate = moment(this.inputJson[name][0][0]).format("YYYY-MM-DD");
            let endDate = moment(this.inputJson[name][this.inputJson[name].length - 1][0]).format("YYYY-MM-DD");

            let hsgArray = [];
            let xskArray = [];
            let firstNorthArray = [];
            let secondNorthArray = [];
            let firstSouthArray = [];
            let secondSouthArray = [];
            timeSet.forEach(item => {
                for (let i = 0; i < this.inputJson[hsgName].length; i++) {
                    if (this.inputJson[hsgName][i][0].indexOf(item) != -1) {
                        hsgArray.push({time: item, val: this.inputJson[hsgName][i][1]})
                    }
                }
                for (let i = 0; i < this.inputJson[name].length; i++) {
                    if (this.inputJson[name][i][0].indexOf(item) != -1) {
                        xskArray.push({time: item, val: this.inputJson[name][i][1]})
                    }
                }
                for (let i = 0; i < this.inputJson[firstNorth].length; i++) {
                    if (this.inputJson[firstNorth][i][0].indexOf(item) != -1) {
                        firstNorthArray.push({time: item, val: this.inputJson[firstNorth][i][1]})
                    }
                }
                for (let i = 0; i < this.inputJson[secondNorth].length; i++) {
                    if (this.inputJson[secondNorth][i][0].indexOf(item) != -1) {
                        secondNorthArray.push({time: item, val: this.inputJson[secondNorth][i][1]})
                    }
                }
                for (let i = 0; i < this.inputJson[firstSouth].length; i++) {
                    if (this.inputJson[firstSouth][i][0].indexOf(item) != -1) {
                        firstSouthArray.push({time: item, val: this.inputJson[firstSouth][i][1]})
                    }
                }
                for (let i = 0; i < this.inputJson[secondSouth].length; i++) {
                    if (this.inputJson[secondSouth][i][0].indexOf(item) != -1) {
                        secondSouthArray.push({time: item, val: this.inputJson[secondSouth][i][1]})
                    }
                }
            })

            hsgArray = hsgArray.filter((obj, index, self) =>
                index === self.findIndex((o) => o.time === obj.time)
            );

            xskArray = xskArray.filter((obj, index, self) =>
                index === self.findIndex((o) => o.time === obj.time)
            );

            firstNorthArray = firstNorthArray.filter((obj, index, self) =>
                index === self.findIndex((o) => o.time === obj.time)
            );

            secondNorthArray = secondNorthArray.filter((obj, index, self) =>
                index === self.findIndex((o) => o.time === obj.time)
            );

            firstSouthArray = firstSouthArray.filter((obj, index, self) =>
                index === self.findIndex((o) => o.time === obj.time)
            );

            secondSouthArray = secondSouthArray.filter((obj, index, self) =>
                index === self.findIndex((o) => o.time === obj.time)
            );

            let diyishuniuArray = [];
            let diershuniuArray = [];
            let disanshuniuArray = [];
            for (let i = 1; i <= this.inputJson[zmName].length; i++) {
                if (i < 11) {
                    diyishuniuArray.push({
                        id: i,
                        waterLevel: this.inputJson[zmName][i - 1][1],
                        status: this.inputJson[zmName][i - 1][2]
                    })
                } else if (i < 25) {
                    diershuniuArray.push({
                        id: i - 10,
                        waterLevel: this.inputJson[zmName][i - 1][1],
                        status: this.inputJson[zmName][i - 1][2]
                    })
                } else if (i < 35) {
                    disanshuniuArray.push({
                        id: i - 24,
                        waterLevel: this.inputJson[zmName][i - 1][1],
                        status: this.inputJson[zmName][i - 1][2]
                    })
                }
            }

            let firstShunshi = 0;
            let secondShunshi = 0;
            let thirdShunshi = 0;

            for (let i = 0; i <= this.inputJson[hedaosunshi].length; i++) {
                if (i == 0) {
                    firstShunshi = this.inputJson[hedaosunshi][i][1].replace("-", "");
                }
                if (i == 1) {
                    secondShunshi = this.inputJson[hedaosunshi][i][1].replace("-", "");
                }
                if (i == 2) {
                    thirdShunshi = this.inputJson[hedaosunshi][i][1].replace("-", "");
                }
            }
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
        handleAddMultiple(name) {
            this.inputJson[name].push([])
        },
        /** 多列值 删除按钮操作 */
        handleDeleteMultiple(name, index) {
            this.inputJson[name].splice(index, 1);
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

.descriptionsStyle {
  ::v-deep .el-tag--medium {
    height: 20px;
    line-height: 20px;
  }
}

.params-tree {
  // 必须有高度 overflow 为自动
  overflow: auto;
  padding: 12px 0px;
  height: 708px;
  //设置文字省略
  ::v-deep .el-tree-node__label {
    font-size: 14px;
    width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
  }

  ::v-deep .el-tree-node__label:hover {
    white-space: normal; /* 设置鼠标悬浮时文本正常显示 */
  }
}

// 滚动条的样式,宽高分别对应横竖滚动条的尺寸
.params-tree::-webkit-scrollbar {
  width: 3px;
}

// 滚动条里面默认的小方块,自定义样式
.params-tree::-webkit-scrollbar-thumb {
  background: #8798af;
  border-radius: 2px;
}

// 滚动条里面的轨道
.params-tree::-webkit-scrollbar-track {
  background: transparent;
}

::v-deep .el-tree--highlight-current .el-tree-node.is-current > .el-tree-node__content {
  background-color: #e9f0ff;
  color: #316efb;
}

.params-item {
  .params-title {
    font-weight: bold;
    font-size: 16px;
    padding: 10px;
    border-bottom: 1px solid #eee;
  }

  .params-con {
    padding: 12px 0px;
  }
}
</style>
