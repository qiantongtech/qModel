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
      ref="queryForm"
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
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="inputList"
      @selection-change="handleSelectionChange"
    >
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
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
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
      append-to-body
    >
      <el-form
        ref="form"
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
                  getAllModelVersion(form.modelId.id),
                    (form.modelVersion = null)
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
              <el-input
                clearable
                v-model="form.name"
                placeholder="请输入参数名称"
              />
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
      append-to-body
    >
      <el-form
        ref="form"
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
              {{ formView.description == null ? "--" : formView.description }}
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import {
  listInput,
  getInput,
  delInput,
  addInput,
  updateInput,
  findAllModel,
  findAllModelVersion,
  getAllDatFileJson,
} from "@/api/modelReconstitution/input";
import { useRoute } from "vue-router";
import { useDict } from "@/utils/dict.js";
import { getFileList } from "@/api/modelReconstitution/model.js";

export default {
  name: "modelInput",
  data() {
    return {
      jsonFile: [],
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
      // 模型输入管理 表格数据
      inputList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 弹出层标题
      titleView: "",
      // 是否显示弹出层
      openView: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        modelName: null,
        modelVersion: null,
      },
      // 表单参数
      form: {
        singleContent: [],
        multipleContent: [],
        changeFlag: null,
      },
      // 表单参数
      formView: {},
      // 表单校验
      rulesView: {},
      // 可编辑表格
      checkedSingle: [],
      checkedMultiple: [],
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
          { required: true, message: "创建时间不能为空", trigger: "blur" },
        ],
        updateTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" },
        ],
        modelId: [
          { required: true, message: "请选择所属模型", trigger: "change" },
        ],
        modelVersion: [
          { required: true, message: "请选择所属模型版本", trigger: "change" },
        ],
        engName: [
          { required: true, message: "文件名称不能为空", trigger: "blur" },
        ],
      },
      $route: useRoute(),
      model_type: useDict("model_type").model_type,
    };
  },
  computed: {
    modelId() {
      return this.$route.query.modelId;
    },
    modelName() {
      return this.$route.query.modelName;
    },
  },
  created() {
    this.getAllModel();
  },
  props: {
    model: {
      type: Object,
    },
  },
  watch: {
    model: {
      handler(newVal, oldVal) {
        if (newVal != null && oldVal != null && newVal.id == oldVal.id) return;
        if (newVal) {
          this.form.modelId = newVal.id;
          this.queryParams.modelVersion = newVal.version;
          this.queryParams.modelId = newVal.id;
          this.form.modelId = newVal.id;
        }
        this.getList();
        this.getAllModelVersion(this.form.modelId);
      },
      deep: true, // 开启深度监听
      immediate: true,
    },
  },
  methods: {
    //测试json数据
    getAllJson() {
      getFileList({ fileUrl: this.model.interfaceorfileAddress }).then(
        (res) => {
          this.jsonFile = res;
          console.log(this.jsonFile, "========");
          console.log(res, "++++++++++");
        }
      );
    },
    // 获取模型
    getAllModel() {
      findAllModel({}).then((res) => {
        this.modelList = res.data;
      });
    },
    // 获取版本
    getAllModelVersion(param) {
      const data = { modelId: param };
      findAllModelVersion(data).then((res) => {
        if (param) {
          this.versionList = res.data;
        } else {
          this.versionList = [];
        }
      });
    },
    /** 查询模型输入管理 列表 */
    getList() {
      this.loading = true;
      let modelId = this.$route.query.modelId;
      if (modelId) {
        this.queryParams.modelId = parseInt(modelId);
      }
      console.log(this.queryParams, "this.queryParams");
      listInput(this.queryParams).then((response) => {
        this.inputList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        changeFlag: null,
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.getAllJson();
      this.reset();
      this.open = true;
      this.title = "添加模型输入管理";
      if (this.modelId) {
        this.form.modelId = {
          id: parseInt(this.modelId),
          name: this.modelName,
        };
        this.getAllModelVersion(this.form.modelId.id);
        this.form.modelVersion = null;
      }
    },
    /** 修改按钮操作 */
    async handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getInput(id).then((response) => {
        this.form = response.data;
        this.form.modelId = {
          id: response.data.modelId,
          name: response.data.modelName,
        };
        if (this.form.changeFlag != null) {
          this.form.changeFlag = this.form.changeFlag.toString();
        }
        this.form.singleContent = JSON.parse(this.form.singleContent);
        this.form.multipleContent = JSON.parse(this.form.multipleContent);
        this.getAllModelVersion(this.form.modelId.id);
        this.open = true;
        this.title = "修改模型输入管理";
      });
    },
    /** 详情按钮操作 */
    handleView(row) {
      this.reset();
      const id = row.id || this.ids;
      getInput(id).then((response) => {
        this.formView = response.data;
        this.formView.singleContent = JSON.parse(this.formView.singleContent);
        this.formView.multipleContent = JSON.parse(
          this.formView.multipleContent
        );
        if (this.formView.changeFlag != null) {
          this.formView.changeFlag = this.formView.changeFlag.toString();
        }
        this.openView = true;
        this.titleView = "模型输入管理详情";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          this.form.modelName = this.form.modelId.name;
          this.form.modelId = this.form.modelId.id;
          this.form.singleContent = JSON.stringify(this.form.singleContent);
          this.form.multipleContent = JSON.stringify(this.form.multipleContent);
          if (this.form.id != null) {
            updateInput(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInput(this.form).then((response) => {
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
      this.$modal
        .confirm('是否确认删除模型输入管理 编号为"' + ids + '"的数据项？')
        .then(function () {
          return delInput(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "model/input/export",
        {
          ...this.queryParams,
        },
        `input_${new Date().getTime()}.xlsx`
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
    singleIndex({ row, rowIndex }) {
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
    multipleIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 复选框选中数据 */
    handleMultipleChange(selection) {
      this.checkedMultiple = selection.map((item) => item.index);
    },
  },
};
</script>

