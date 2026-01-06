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
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="模型版本：" prop="versionId">
        <el-select
          style="width: 100%"
          v-model="queryParams.versionId"
          placeholder="请选择模型类别"
          clearable
        >
          <el-option
            v-for="item in versionList"
            :key="item.id"
            :label="'Version ' + item.version"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="请求方式：" prop="requestMethod">
        <el-select
          style="width: 100%"
          v-model="queryParams.requestMethod"
          placeholder="请选择模型类别"
          clearable
        >
          <el-option
            v-for="item in model_type"
            :key="item.value"
            :label="item.label"
            :value="item.value * 1">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          @click="handleAdd"
          v-hasPermi="['modelReconstitution:interfaceAddress:add']"
        >添加接口地址</el-button>
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="interfaceAddressList" @selection-change="handleSelectionChange">
      <el-table-column label="接口地址" align="center" prop="interfaceAddress" />
      <el-table-column label="模型版本" align="center" prop="version" width="150px">
        <template #default="scope">
          <el-tag size="small">Version {{ scope.row.version }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="请求方式" align="center" prop="requestMethod" width="150px" >
        <template #default="scope">
          <dict-tag
            :options="model_type"
            :value="scope.row.requestMethod"
          />
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="createBy" width="150px"/>
      <el-table-column label="创建时间" align="center" prop="createTime" width="150px"/>
      <el-table-column label="接口说明" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200px">
        <template #default="scope">
          <el-button
              link
            @click="handleUpdate(scope.row)"
            v-hasPermi="['modelReconstitution:interfaceAddress:edit']"
          >修改</el-button>
          <el-button
              link
            @click="handleDelete(scope.row)"
            v-hasPermi="['modelReconstitution:interfaceAddress:remove']"
          >删除</el-button>
          <el-button
              link
            @click="setTheParameters(scope.row)"
          >设置参数</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改接口地址对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" :close-on-click-modal="false" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="150px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="模型版本：" prop="versionId">
              <el-select
                style="width: 100%"
                v-model="form.versionId"
                placeholder="请选择模型版本"
                clearable
              >
                <el-option
                  v-for="item in versionList"
                  :key="item.id"
                  :label="'Version ' + item.version"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="API请求方式：" prop="requestMethod">
              <el-select
                style="width: 100%"
                v-model="form.requestMethod"
                placeholder="请选择模型类别"
                clearable
              >
                <el-option
                  v-for="item in model_type"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value * 1">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="接口地址：" prop="interfaceAddress">
              <el-input clearable v-model="form.interfaceAddress" placeholder="请输入接口地址">
                <template #prepend>{{model.interfaceorfileAddress + ":" + model.port}}</template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="接口说明：" prop="remark">
              <el-input clearable v-model="form.remark" type="textarea" :rows="3" placeholder="请输入接口说明" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
            <div class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div></template>
    </el-dialog>
  </div>
</template>

<script>
import { listInterfaceAddress, getInterfaceAddress, delInterfaceAddress, addInterfaceAddress, updateInterfaceAddress } from "@/api/modelReconstitution/interfaceAddress";
import {getVersionList} from "@/api/modelReconstitution/version";
import {useDict} from "@/utils/dict.js";

export default {
  name: "InterfaceAddress",
  data() {
    return {
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
      // 接口地址表格数据
      interfaceAddressList: [],
      // 版本管理表格数据
      versionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        companyId: null,
        modelId: null,
        interfaceAddress: null,
        versionId: null,
        requestMethod: null,
        inputParameter: null,
        outputParameter: null,
        creatorId: null,
        updatorId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      model_type: useDict("model_type").model_type,
    };
  },
  props: {
    model:{
      type:Object,
      default:{}
    }
  },
  watch:{
    model:{
      handler(newVal, oldVal) {
        getVersionList({modelId:newVal.id}).then((response) => {
          this.versionList = response.rows;
          this.queryParams.versionId = newVal.versionId
          this.getList();
        });
      },
      deep: true, // 开启深度监听
      immediate:true
    }
  },
  created() {
    // this.getList();
  },
  methods: {
    /** 查询接口地址列表 */
    getList() {
      this.loading = true;
      listInterfaceAddress(this.queryParams).then(response => {
        this.interfaceAddressList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    setTheParameters(row){
      let modelId = row.modelId
      let interfaceAddressId = row.id
      this.$router.push({
        path: "/modelReconstitution/waterConserve/modelInputAndOutput",
        query: {
          modelId,
          interfaceAddressId
        },
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
        modelId: null,
        interfaceAddress: null,
        versionId: null,
        requestMethod: null,
        inputParameter: null,
        outputParameter: null,
        inputParameterIllustrate: null,
        outputParameterIllustrate: null,
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
      this.queryParams.versionId = this.model.versionId
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加接口地址";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getInterfaceAddress(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改接口地址";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.form.modelId = this.model.id
      this.form.modelNam = this.model.name
      this.form.versionId = this.model.versionId
      this.form.version = this.model.version
      this.form.description = this.model.description
      if (!this.form.interfaceAddress.startsWith("/")){
        this.form.interfaceAddress = "/" + this.form.interfaceAddress
      }
      if (this.model.interfaceorfileAddress.endsWith("/")){
        this.model.interfaceorfileAddress = this.model.interfaceorfileAddress.replace(/\/$/, "")
      }
      this.form.interfaceAddress = this.model.interfaceorfileAddress + ":" + this.model.port + this.form.interfaceAddress
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateInterfaceAddress(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInterfaceAddress(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除接口地址编号为"' + ids + '"的数据项？').then(function() {
        return delInterfaceAddress(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('modelReconstitution/interfaceAddress/export', {
        ...this.queryParams
      }, `interfaceAddress_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
