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
  <div class="actionHistory pagecont-top">
    <el-form
      ref="queryForm"
      :inline="true"
      @submit.prevent
    >
      <el-form-item label="启用版本号：" prop="modelVersion">
        <el-select
            class="el-form-input-width"
          v-model="modelVersion"
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
      <el-form-item>
        <el-button type="primary" @click="handleQuery">搜索</el-button>
        <el-button @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table
      v-loading="loading"
      :data="historyList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column label="操作人" align="center" prop="updateBy" />
      <el-table-column label="操作内容" align="center" prop="context">
      </el-table-column>
      <el-table-column label="操作时间" align="center" prop="updateTime">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updateTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="启用版本号" align="center" prop="modelVersion" >
        <template #default="scope">
          <el-tag size="small">Version {{ scope.row.modelVersion }}</el-tag>
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
</template>

<script>
import { historyList } from "@/api/modelReconstitution/history";
import {getVersionList} from "@/api/modelReconstitution/version";

export default {
  name: "actionHistory",
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
      // 模型管理 表格数据
      historyList: [],
      // 版本管理表格数据
      versionList: [],
      modelVersion: null,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        modelId: null,
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  props: {
    model:{
      type:Object
    }
  },
  computed: {
    modelId() {
      return this.$route.query.modelId;
    },
  },
  watch:{
    model(){
      getVersionList({modelId:this.model.id}).then((response) => {
        this.versionList = response.rows;
        this.modelVersion = this.model.version
      });
    }
  },
  created() {
    this.getList();
  },
  mounted() {},
  methods: {
    /** 重置按钮操作 */
    resetQuery() {
      this.modelVersion = this.model.version;
      this.queryParams.pageNum = 1;
      this.getList()
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.queryParams.modelVersion = this.modelVersion
      historyList(this.queryParams).then((response) => {
        this.historyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询模型管理 列表 */
    getList() {
      this.loading = true;
      const mId = this.$route.query.modelId;
      this.queryParams.modelId = mId;
      this.queryParams.modelVersion = this.model.version
      historyList(this.queryParams).then((response) => {
        this.historyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
  },
};
</script>
<style lang="scss" scoped>
.actionHistory {
}
</style>
