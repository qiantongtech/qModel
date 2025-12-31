<template>
  <div class="app-container pagecont-top">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      @submit.prevent
    >
      <el-form-item label="版本号：" prop="modelVersion">
        <el-select
          v-model="queryParams.version"
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
        <el-button type="primary"
          @click="handleQuery"
          >搜索</el-button>
        <el-button @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          @click="handleAdd"
          >新增</el-button>
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="versionList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column label="模型版本号" align="center" prop="version" >
        <template #default="scope">
          <el-tag size="small">Version {{ scope.row.version }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="版本是否被启用" align="center" prop="status">
        <template #default="scope">
          <el-tag v-if="scope.row.status == 1">是</el-tag>
          <el-tag type="info" v-else>否</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="版本发布说明" align="center" prop="description" />
<!--      <el-table-column label="模型介绍" align="center" prop="remark" >
        <template #default="scope">
          {{modelForm.remark}}
        </template>
      </el-table-column>-->
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button v-if="scope.row.status != 1" type="text" @click="handleEnable(scope.row)">
            版本切换
          </el-button>
          <el-button type="text" @click="handleUpdate(scope.row)">
            修改
          </el-button>
          <el-button type="text" @click="handleDelete(scope.row)">
            删除
          </el-button>
          <el-button type="text"@click="handleDownload(scope.row)" v-if="modelForm.accessMode == 0">
            下载
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

    <!-- 添加或修改版本管理对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="750px"
      :close-on-click-modal="false"
      append-to-body
    >
      <el-form ref="form" :model="form" :rules="rules" label-width="180px">
        <el-row>
          <el-col :span="20">
            <el-form-item label="模型名称：" prop="modelName">
              <el-input
                :disabled="true"
                clearable
                v-model="form.modelName"
                placeholder="请输入模型名称"
              />
            </el-form-item>
          </el-col>
        </el-row>
<!--        <el-row v-if="isFormat == 1">
          <el-col :span="20">
            <el-form-item label="上传接口：" prop="interfaceAddress">
              <el-input
                clearable
                v-model="form.interfaceAddress"
                placeholder="请输入上传接口"
              />
            </el-form-item>
          </el-col>
        </el-row>-->
        <el-row>
          <el-col :span="20">
            <el-form-item label="模型版本号：" prop="version">
              <el-input
                v-model="form.version"
                :rows="3"
                type="number"
                :disabled="isEdit"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="model.accessMode == 0">
          <el-col :span="20">
            <el-form-item label="上传文件：" prop="fileName">
              <file-name-upload :fileType="['zip']" v-model="form.fileAddress" :limit="1" :fileSize="200"  :editName="form.fileName" :style="'width: 540px'" />
              <!--              <FileUpload-->
              <!--                v-model="form.fileAddress"-->
              <!--                @fileModelName="fileModelName"-->
              <!--                :fileStyle2="true"-->
              <!--                :isModelOrImg="false"-->
              <!--                :limit="1"-->
              <!--                :fileType="['zip']"-->
              <!--                :fileSize="200"-->
              <!--              />-->
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="版本发布说明：" prop="description">
              <el-input
                v-model="form.description"
                :rows="3"
                type="textarea"
                maxlength="200"
                show-word-limit
                placeholder="请输入版本发布说明"
              />
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
import {
  getVersion,
  delVersion,
  addVersion,
  updateVersion,
  getVersionList,
  handoffVersion
} from "@/api/modelReconstitution/version";
import { getModel } from "@/api/modelReconstitution/model";
import { listClassify } from "@/api/modelReconstitution/classify";
import FileNameUpload from "@/components/FileNameUpload/index.vue";

export default {
  name: "Version",
  components: {FileNameUpload},
  data() {
    return {
      //分类树选项
      classifyOptions: [],
      //判断是否显示版本号
      isEdit: true,
      isFormat: null,
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
      // 版本管理表格数据
      versionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      modelForm:{},
      // 查询参数
      queryParams: {
        classifyId: null,
        pageNum: 1,
        pageSize: 10,
        companyId: null,
        modelId: null,
        modelName: null,
        version: null,
        fileAddress: null,
        interfaceAddress: null,
        status: null,
        description: null,
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
        interfaceAddress: [
          { required: true, message: "上传接口不能为空", trigger: "blur" },
        ],
        fileAddress: [
          { required: true, message: "上传文件不能为空", trigger: "blur" },
        ],
      },
    };
  },
  computed: {
    modelId() {
      return this.$route.query.modelId;
    },
  },
  created() {
    this.getList();
    this.getTreeselect();
  },
  props: {
    model:{
      type:Object,
      default:{}
    }
  },
  watch: {
    // 根据名称筛选分类树
    classifyName(val) {
      this.$refs.tree.filter(val);
    },
  },
  methods: {
    fileModelName(res){
      console.log(res)
      this.form.fileName = res.originalFilename.substring(0, res.originalFilename.lastIndexOf("."))
    },
    /** 查询版本管理列表 */
    getList() {
      this.loading = true;
      const mid = this.$route.query.modelId;
      this.queryParams.modelId = mid;
      getVersionList(this.queryParams).then((response) => {
        this.versionList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
      getModel(mid).then((response => {
        this.isFormat = response.data.accessMode;
        this.modelForm = response.data
      }));
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
        modelName: null,
        version: null,
        fileAddress: null,
        interfaceAddress: null,
        status: 0,
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
      this.isEdit = false;
      this.resetForm("form");
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
      });
    },
    /** 转换菜单数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.id,
        label: node.name,
        children: node.children,
      };
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.classifyId = data.id;
      this.handleQuery();
    },
    // 是否启用
    handleEnable(row) {
      this.$confirm('你确定要切换当前模型的版本吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let beforeVersionId = null;
        let beforeVersionVersion = null;
        this.versionList.forEach(item => {
          if (item.status == 1){
            beforeVersionId = item.id
            beforeVersionVersion = item.version
          }
        })

        let obj = {
          modelId:this.modelForm.id,
          modelName:this.modelForm.name,
          beforeVersionId:beforeVersionId,
          beforeVersion:beforeVersionVersion,
          afterVersionId: row.id,
          afterVersion: row.version
        }
        handoffVersion(obj).then(res => {
          this.$message({
            type: 'success',
            message: '切换成功!'
          });
          this.getList();
          this.$emit('refresh', this.modelForm.id);
        })
      }).catch(() => {
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.reset();
      this.queryParams = {}
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
      const mid = this.$route.query.modelId;
      this.form.modelId = mid;
      getModel(mid).then((response => {
        this.form.modelName = response.data.name;
      }));
      this.title = "添加版本管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      const modelName = row.modelName;
      const status = row.status;
      if (status == 1) {
        this.$modal
          .confirm("【" + modelName + "】模型已启用，请先切换到别的版本然后进行修改！")
          .catch(() => {});
      } else {
        getVersion(id).then((response) => {
          this.form = response.data;
          this.form.modelName = this.modelForm.name
          this.open = true;
          this.title = "修改版本管理";
          this.isEdit = true;
        })
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          let versionList = this.versionList.filter(item => {
            if (item.version == this.form.version){
              return true;
            }
          })
          if (versionList.length == 0){
            this.form.modelId = this.modelForm.id
            this.form.modelName = this.modelForm.name
            if (this.form.fileAddress && this.form.fileAddress.length > 0) {
              this.form.fileName = this.form.fileAddress[0].name;
              this.form.fileAddress = this.form.fileAddress[0].url;
            }
            console.log(this.form)
            if (this.form.id != null) {
              updateVersion(this.form).then((response) => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addVersion(this.form).then((response) => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }else {
            this.$modal.alertError("以有此版本，请重新输入或者删除之前的版本！")
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      const modelName = this.modelForm.name;
      const status = row.status;
      if (status == 1) {
        this.$modal
          .confirm("【" + modelName + "】该版本已启用，请先停用后在删除！")
          .catch(() => {});
      }else{
        this.$modal
        .confirm('是否确认删除版本管理编号为"' + ids + '"的数据项？')
        .then(function () {
          return delVersion(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
      }
    },
    //下载
    handleDownload(row) {
      // location.href(row.fileAddress)
      this.downloadFile(this.modelForm.interfaceorfileAddress, this.modelForm.name + "模型文件");
    },
    downloadFile(urls, name) {
      fetch(urls).then((res) => {
        res.blob().then((blob) => {
          const url = window.URL.createObjectURL(blob);
          const a = document.createElement("a");
          a.href = url;
          // 获取文件后缀
          let fileNameAnd = this.getFileNameAnd(urls);
          //   doc", "xls", "ppt", "txt", "pdf
          a.download = name + fileNameAnd;

          a.click();

          window.URL.revokeObjectURL(url);
        });
      });
    },
    getFileNameAnd(url) {
      let filename = url.substring(url.lastIndexOf("/") + 1);
      // 获取文件后缀，判断是文件还是图片
      let subName = filename.substring(filename.length - 4, filename.length);
      return subName;
    },
  },
};
</script>

<style lang="scss" scoped>
.app-container {
  min-height: 0;
}
</style>
