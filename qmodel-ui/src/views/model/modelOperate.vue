<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
    >
      <el-form-item label="模型名称：" prop="moduleName">
        <el-input
          v-model="queryParams.moduleName"
          placeholder="模型名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          >导出
        </el-button>
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="operateList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column label="操作模块" align="center" prop="moduleName">
      </el-table-column>
      <el-table-column label="操作类型" align="center" prop="type">
        <template #default="scope">
          <dict-tag
            :options="dict.type.action_history_operate_type"
            :value="scope.row.type"
          />
        </template>
      </el-table-column>
      <el-table-column label="操作内容" align="center" prop="content" />
      <el-table-column label="操作人员" align="center" prop="createBy" />
      <el-table-column label="操作日期" align="center" prop="createTime" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-fold"
            @click="handleView(scope.row)"
            >详情
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

    <!-- 添加或修改模型历史管理 对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      :close-on-click-modal="false"
      append-to-body
    >
      <el-form ref="form" :model="form" label-width="100px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item label="操作人员："
              >{{ form.createBy }}  </el-form-item
            >
          </el-col>
          <el-col :span="12">
            <el-form-item label="操作方法：">{{
              typeFormat("action_history_operate_type", form.type)
            }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="修改前信息：" v-if="form.type != 0 && form.type != 2">
              <!-- {{ form.reqContent }} -->
              <json-viewer
                :value="form.reqContent != undefined ? JSON.parse(form.reqContent) : JSON.parse(reqContent) "
                :expand-depth="5"
                boxed
                sort
                :show-array-index="false"
                copyable
                :expanded="true"
              >
                <template slot="copy">
                  <i class="el-icon-document-copy" title="复制"></i>
                </template>
              </json-viewer>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item :label="form.type == 0 ? '操作细节：' : '修改后信息：'">
              <!-- {{ form.respContent }} -->
              <json-viewer
                :value="form.respContent != undefined ? JSON.parse(form.respContent) : JSON.parse(respContent) "
                :expand-depth="1"
                boxed
                sort
                :show-array-index="false"
                copyable
                :expanded="true"
              >
                <template slot="copy">
                  <i class="el-icon-document-copy" title="复制"></i>
                </template>
              </json-viewer>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="操作时间：">{{
              parseTime(form.createTime)
            }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="异常信息：" v-if="form.status === 1">{{
              form.errorMsg
            }}</el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <!-- <template #footer>
            <div class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div> -->
    </el-dialog>
  </div>
</template>

<script>
import {
  listOperate,
  getOperate,
  delOperate,
  addOperate,
  updateOperate,
} from "@/api/modelReconstitution/operate";
import JsonViewer from "json-editor-vue";

export default {
  name: "Operate",
  components: { JsonViewer },
  dicts: [
    "sys_common_status",
    "action_history_operate_name",
    "action_history_operate_type",
    "action_history_request_method",
  ],
  data() {
    return {
      reqContent:
        '{"searchValue":null,"createBy":"演示账号","createTime":"2023-10-08 13:55:32","updateBy":null,"updateTime":"2023-10-08 13:55:30","remark":null,"params":{},"id":3,"companyId":1005,"name":"塔河2","engName":"123","type":1,"modelId":1047,"modelName":"塔河大坝监控","modelVersion":"1","description":"参数23","singleContent":"[]","multipleContent":"[{\\"name\\":\\"参数1\\",\\"value\\":\\"1\\",\\"order\\":0,\\"index\\":1},{\\"name\\":\\"参数2\\",\\"value\\":\\"2\\",\\"order\\":2,\\"index\\":2}]","validFlag":true,"delFlag":false,"creatorId":480,"updatorId":null}',
      respContent:
        '{"msg":"操作成功","code":200,"data":{"searchValue":null,"createBy":null,"createTime":"2023-08-28 17:37:28","updateBy":null,"updateTime":"2023-09-14 14:16:14","remark":null,"params":{},"id":1002,"name":"开都-孔雀河流域数字孪生","companyName":"开都-孔雀河流域数字孪生","companyId":1005,"licence":"苏ICP备2022008519号-1","loginTemplate":1,"loginBannerOne":"https://s.qiantongkeji.com/2023/71/31/7f26c416-88cd-43e4-8601-b51d1b7366c4.png","loginBannerTwo":"[{\\"image\\":\\"https://s.qiantongkeji.com/2023/81/13/3c63e5d2-6ea8-42a5-8e07-3a96a6299089.png\\",\\"title\\":\\"开都-孔雀河流域数字孪生\\",\\"enTitle\\":\\"TA HE SHU ZI LUAN SHENG\\",\\"digest\\":\\"虚拟仿真、实时联动、智能决策\\",\\"content\\":\\"伊犁州直水利综合信息监管平台致力于水资源的智能化管理，旨在提升水利行业的效率和可持续发展。平台通过数字孪生、虚拟仿真、云计算技术，实现水利业务“四预”流程的智慧模拟、仿真推演，为水利业务提供决策支持。\\"}]","loginLogo":"https://s.qiantongkeji.com/2023/81/14/0f2d8a63-4918-45a7-8a97-267a7c517df7.png","phone":"400-660-8208","email":"support@qiantong.tech","messageLogo":"https://s.qiantongkeji.com/2023/81/14/c1a621ae-b1cf-4f80-8de1-37888ad67031.png","logo":"https://s.qiantongkeji.com/2023/81/14/e9ac588f-256e-4648-bca0-b66f89c2ea16.png","favicon":"https://s.qiantongkeji.com/2023/71/31/9a1f6192-739b-4a19-893a-034644857c0c.png","validFlag":1,"delFlag":false,"creatorId":null,"updatorId":null}}',
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
      // 模型历史管理 表格数据
      operateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        companyId: null,
        moduleName: null,
        type: null,
        content: null,
        method: null,
        reqContent: null,
        respContent: null,
        ip: null,
        address: null,
        status: null,
        validFlag: null,
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
          { required: true, message: "创建时间不能为空", trigger: "blur" },
        ],
        updateTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" },
        ],
      },
    };
  },
  computed: {
    // 操作日志类型字典翻译
    typeFormat() {
      return function (dict, row) {
        return this.selectDictLabel(this.dict.type[dict], row);
      };
    },
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询模型历史管理 列表 */
    getList() {
      this.loading = true;
      listOperate(this.queryParams).then((response) => {
        this.operateList = response.rows;
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
        moduleName: null,
        type: null,
        content: null,
        method: null,
        reqContent: null,
        respContent: null,
        ip: null,
        address: null,
        status: 0,
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
      this.reset();
      this.open = true;
      this.title = "添加模型历史管理 ";
    },
    /** 详细按钮操作 */
    handleView(row) {
      this.open = true;
      this.form = row;
      this.title = "历史记录详情 ";
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateOperate(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOperate(this.form).then((response) => {
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
        .confirm('是否确认删除模型历史管理 编号为"' + ids + '"的数据项？')
        .then(function () {
          return delOperate(ids);
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
        "model/operate/export",
        {
          ...this.queryParams,
        },
        `operate_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
<style lang="scss" scoped>
::v-deep .jv-container .jv-code.boxed {
  max-height: 140px;
}
</style>
