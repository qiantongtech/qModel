<template>
  <div class="versionManage">
    <el-row class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          >新增
        </el-button>
      </el-col>
    </el-row>
    <el-table
      v-loading="loading"
      :data="actionList"
      @selection-change="handleSelectionChange"
    >
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
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
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
  </div>
</template>

<script>
import { listModel } from "@/api/modelReconstitution/model";

export default {
  name: "versionManage",
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
      actionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
    };
  },
  computed: {
    modelId() {
      return this.$route.query.modelId;
    },
  },
  watch: {
    // $route: {
    //   handler: function (route) {
    //     this.redirect = route.query && route.query.redirect;
    //   },
    //   immediate: true,
    // },
  },
  created() {
    this.getList();
  },
  mounted() {},
  methods: {
    /** 查询模型管理 列表 */
    getList() {
      this.loading = true;
      listModel(this.queryParams).then((response) => {
        this.actionList = response.rows;
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
    // 是否启用
    handleEnable(e) {
      console.log(e, "==e");
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
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    // 新增
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加模型管理 ";
    },
    // 修改
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getModel(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改模型管理 ";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateModel(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addModel(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
  },
};
</script>
<style lang="scss" scoped>
.versionManage {
}
</style>
