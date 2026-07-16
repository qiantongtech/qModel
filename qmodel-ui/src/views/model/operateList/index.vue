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
    <div class="pagecont-top" v-show="showSearch">
      <el-form
        :model="queryParams"
        ref="queryFormRef"
        :inline="true"
        v-show="showSearch"
        class="btn-style"
      >
        <el-form-item label="模型名称" prop="moduleName">
          <el-input
            v-model="queryParams.moduleName"
            placeholder="请输入模型名称"
            clearable
            @keyup.enter="handleQuery"
          />
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
    </div>

    <div class="pagecont-bottom">
      <div class="justify-between mb15">
        <el-row :gutter="10" class="btn-style">
          <el-col :span="1.5">
            <el-button
              type="warning"
              plain
              :disabled="multiple"
              @click="handleExport"
              v-hasPermi="['system:user:export']"
            >
              <i class="iconfont-mini icon-daochu"></i>
              导出
            </el-button>
          </el-col>
        </el-row>
        <right-toolbar
          v-model:showSearch="showSearch"
          @queryTable="getList"
          :columns="columns"
        ></right-toolbar>
      </div>

      <el-table
        v-loading="loading"
        :data="operateList"
        @selection-change="handleSelectionChange"
      >
        <el-table-column v-if="getColumnVisibility(0)" label="编号" align="center" prop="id" width="65">
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(1)" label="操作模块" align="left" prop="moduleName">
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(2)" label="操作类型" align="center" prop="type">
          <template #default="scope">
            <dict-tag
              :options="model_access_mode"
              :value="scope.row.type"
            />
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(3)" label="操作内容" align="left" prop="content" />
        <el-table-column v-if="getColumnVisibility(4)" label="创建人" align="center" prop="createBy" />
        <el-table-column
            v-if="getColumnVisibility(5)"
            label="创建时间"
            align="center"
            prop="createTime"
            sortable="custom"
            :sort-orders="['descending', 'ascending']"
        >
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column
          v-if="getColumnVisibility(6)"
          label="操作"
          align="center"
          class-name="small-padding fixed-width"
        >
          <template #default="scope">
            <el-button
                link
                type="primary"
                icon="view"
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
    </div>

    <!-- 添加或修改模型历史管理 对话框 -->
    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      :close-on-click-modal="false"
      append-to="body"
    >
      <el-form ref="formRef" :model="form" label-width="100px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item label="操作人员：">{{ form.createBy }} </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="操作方法："
              >{{ form.type }}
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item
              label="修改前信息："
              v-if="form.type != 0 && form.type != 2"
            >
              <!-- {{ form.reqContent }} -->
              <json-viewer
                :value="
                  form.reqContent != undefined
                    ? JSON.parse(form.reqContent)
                    : JSON.parse(reqContent)
                "
                :expand-depth="5"
                boxed
                sort
                :show-array-index="false"
                copyable
                :expanded="true"
              >
                <template #copy>
                  <i class="el-icon-document-copy" title="复制"></i>
                </template>
              </json-viewer>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item
              :label="form.type == 0 ? '操作细节：' : '修改后信息：'"
            >
              <!-- {{ form.respContent }} -->
              <json-viewer
                :value="
                  form.respContent != undefined
                    ? JSON.parse(form.respContent)
                    : JSON.parse(respContent)
                "
                :expand-depth="1"
                boxed
                sort
                :show-array-index="false"
                copyable
                :expanded="true"
              >
                <template #copy>
                  <i class="el-icon-document-copy" title="复制"></i>
                </template>
              </json-viewer>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="操作时间："
              >{{ proxy ? proxy.parseTime(form.createTime) : "" }}
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="异常信息：" v-if="form.status === 1"
              >{{ form.errorMsg }}
            </el-form-item>
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

<script setup>
import { ref, reactive, onMounted, getCurrentInstance } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import {
  listOperate,
  delOperate,
  addOperate,
  updateOperate,
} from "@/api/modelReconstitution/operate";
import JsonViewer from "json-editor-vue";

const { proxy } = getCurrentInstance();

// 数据属性
const reqContent = ref(
  '{"searchValue":null,"createBy":"演示账号","createTime":"2023-10-08 13:55:32","updateBy":null,"updateTime":"2023-10-08 13:55:30","remark":null,"params":{},"id":3,"companyId":1005,"name":"塔河2","engName":"123","type":1,"modelId":1047,"modelName":"塔河大坝监控","modelVersion":"1","description":"参数23","singleContent":"[]","multipleContent":"[{\\"name\\":\\"参数1\\",\\"value\\":\\"1\\",\\"order\\":0,\\"index\\":1},{\\"name\\":\\"参数2\\",\\"value\\":\\"2\\",\\"order\\":2,\\"index\\":2}]","validFlag":true,"delFlag":false,"creatorId":480,"updatorId":null}'
);
const respContent = ref(
  '{"msg":"操作成功","code":200,"data":{"searchValue":null,"createBy":null,"createTime":"2023-08-28 17:37:28","updateBy":null,"updateTime":"2023-09-14 14:16:14","remark":null,"params":{},"id":1002,"name":"开都-孔雀河流域数字孪生","companyName":"开都-孔雀河流域数字孪生","companyId":1005,"licence":"苏ICP备2022008519号-1","loginTemplate":1,"loginBannerOne":"https://s.qiantongkeji.com/2023/71/31/7f26c416-88cd-43e4-8601-b51d1b7366c4.png","loginBannerTwo":"[{\\"image\\":\\"https://s.qiantongkeji.com/2023/81/13/3c63e5d2-6ea8-42a5-8e07-3a96a6299089.png\\",\\"title\\":\\"开都-孔雀河流域数字孪生\\",\\"enTitle\\":\\"TA HE SHU ZI LUAN SHENG\\",\\"digest\\":\\"虚拟仿真、实时联动、智能决策\\",\\"content\\":\\"伊犁州直水利综合信息监管平台致力于水资源的智能化管理，旨在提升水利行业的效率和可持续发展。平台通过数字孪生、虚拟仿真、云计算技术，实现水利业务"四预"流程的智慧模拟、仿真推演，为水利业务提供决策支持。\\"}]","loginLogo":"https://s.qiantongkeji.com/2023/81/14/0f2d8a63-4918-45a7-8a97-267a7c517df7.png","phone":"400-660-8208","email":"support@qiantong.tech","messageLogo":"https://s.qiantongkeji.com/2023/81/14/c1a621ae-b1cf-4f80-8de1-37888ad67031.png","logo":"https://s.qiantongkeji.com/2023/81/14/e9ac588f-256e-4648-bca0-b66f89c2ea16.png","favicon":"https://s.qiantongkeji.com/2023/71/31/9a1f6192-739b-4a19-893a-034644857c0c.png","validFlag":1,"delFlag":false,"creatorId":null,"updatorId":null}}'
);

const { model_access_mode } = proxy.useDict('model_access_mode');
const columns = ref([
  { key: 0, label: '编号', visible: true },
  { key: 1, label: '操作模块', visible: true },
  { key: 2, label: '操作类型', visible: true },
  { key: 3, label: '操作内容', visible: true },
  { key: 4, label: '创建人', visible: true },
  { key: 5, label: '创建时间', visible: true },
  { key: 6, label: '操作', visible: true },
]);
const getColumnVisibility = (key) => {
  const column = columns.value.find((col) => col.key === key);
  // 如果没有找到对应列配置，默认显示
  if (!column) return true;
  // 如果找到对应列配置，根据visible属性来控制显示
  return column.visible;
};
// 遮罩层
const loading = ref(true);
// 选中数组
const ids = ref([]);
// 非单个禁用
const single = ref(true);
// 非多个禁用
const multiple = ref(true);
// 显示搜索条件
const showSearch = ref(true);
// 总条数
const total = ref(0);
// 模型历史管理 表格数据
const operateList = ref([]);
// 弹出层标题
const title = ref("");
// 是否显示弹出层
const open = ref(false);
// 查询参数
const queryParams = reactive({
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
});
// 表单参数
const form = ref({});
// 表单校验
const rules = reactive({
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
});

// 模板引用
const queryFormRef = ref(null);
const formRef = ref(null);

// 计算属性 - 操作日志类型字典翻译
const typeFormat = (dict, row) => {
  return proxy ? proxy.selectDictLabel(proxy.dict.type[dict], row) : "";
};

// 方法定义
/** 查询模型历史管理 列表 */
const getList = () => {
  loading.value = true;
  listOperate(queryParams).then((response) => {
    operateList.value = response.data.rows;
    total.value = response.total;
    loading.value = false;
  });
};

// 取消按钮
const cancel = () => {
  open.value = false;
  reset();
};

// 表单重置
const reset = () => {
  form.value = {
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
  if (formRef.value) {
    formRef.value.clearValidate();
  }
};

/** 搜索按钮操作 */
const handleQuery = () => {
  queryParams.pageNum = 1;
  getList();
};

/** 重置按钮操作 */
const resetQuery = () => {
  if (queryFormRef.value) {
    queryFormRef.value.resetFields();
  }
  handleQuery();
};

// 多选框选中数据
const handleSelectionChange = (selection) => {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length !== 1;
  multiple.value = !selection.length;
};

/** 详细按钮操作 */
const handleView = (row) => {
  open.value = true;
  form.value = row;
  title.value = "历史记录详情 ";
};

/** 提交按钮 */
const submitForm = () => {
  if (formRef.value) {
    formRef.value.validate((valid) => {
      if (valid) {
        if (form.value.id != null) {
          updateOperate(form.value).then((response) => {
            ElMessage.success("修改成功");
            open.value = false;
            getList();
          });
        } else {
          addOperate(form.value).then((response) => {
            ElMessage.success("新增成功");
            open.value = false;
            getList();
          });
        }
      }
    });
  }
};

/** 删除按钮操作 */
const handleDelete = (row) => {
  const operateIds = row.id || ids.value;
  ElMessageBox.confirm(
    '是否确认删除模型历史管理 编号为"' + operateIds + '"的数据项？'
  )
    .then(function () {
      return delOperate(operateIds);
    })
    .then(() => {
      getList();
      ElMessage.success("删除成功");
    })
    .catch(() => {});
};

/** 导出按钮操作 */
const handleExport = () => {
  // 使用 proxy 访问全局 download 方法
  if (proxy && proxy.download) {
    proxy.download(
      "model/operate/export",
      {
        ...queryParams,
      },
      `operate_${new Date().getTime()}.xlsx`
    );
  } else {
    // 如果没有全局 download 方法，使用替代方法
    const link = document.createElement("a");
    link.href = `/model/operate/export?${new URLSearchParams(
      queryParams
    ).toString()}`;
    link.download = `operate_${new Date().getTime()}.xlsx`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }
};

// 组件挂载后执行
onMounted(() => {
  getList();
});
</script>
<style lang="scss" scoped>
::v-deep .jv-container .jv-code.boxed {
  max-height: 140px;
}
</style>
