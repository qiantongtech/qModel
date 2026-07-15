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
      ref="queryFormRef"
      :inline="true"
      v-show="showSearch"
      @submit.prevent
    >
      <el-form-item label="模型版名称" prop="modelVersion">
        <el-input
            v-model="queryParams.name"
            placeholder="请输入模型名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleQuery">
          <i class="iconfont-mini icon-a-zu22377 mr5"></i>搜索</el-button
        >
        <el-button @click="resetQuery" class="btn">
          <i class="iconfont-mini icon-a-zu22378 mr5"></i>重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button type="primary" plain @click="handleAdd">-->
<!--          <i class="iconfont-mini icon-xinzeng"></i>新增-->
<!--        </el-button>-->
<!--      </el-col>-->
<!--      <right-toolbar-->
<!--        v-model:showSearch="showSearch"-->
<!--        @queryTable="getList"-->
<!--      ></right-toolbar>-->
    </el-row>

    <el-table
      v-loading="loading"
      :data="versionList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column label="编号" align="center" prop="version">
        <template #default="scope">
          1
        </template>
      </el-table-column>
      <el-table-column label="模型版本号" align="center" prop="version">
        <template #default="scope">
          <el-tag size="small">Version {{ scope.row.version }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="变更类型" align="center" prop="description"/>
      <el-table-column label="变更详情" align="center" prop="description"/>
      <el-table-column label="操作人" align="center" prop="updateBy">
        <template #default="scope">
          <span>{{ scope.row.createBy }}</span>
        </template>
      </el-table-column>
      <el-table-column label="版本生成时间" align="center" prop="createTime" >
        <template #default="scope">
          <span>{{ scope.row.createTime }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">

          <el-button link type="primary" @click="handleCompare(scope.row)">
<!--            <Edit class="icon-mini" />-->
            版本对比
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
      <el-form ref="formRef" :model="form" :rules="rules" label-width="180px">
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
        <el-row v-if="props.model.accessMode == 0">
          <el-col :span="20">
            <el-form-item label="上传文件：" prop="fileName">
              <file-name-upload
                :fileType="['zip']"
                v-model="form.fileAddress"
                :limit="1"
                :fileSize="200"
                :editName="form.fileName"
                :style="'width: 540px'"
              />
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
        </div></template
      >
    </el-dialog>
  </div>
</template>

<script setup>
import {
  getVersion,
  delVersion,
  addVersion,
  updateVersion,
  getVersionList,
  handoffVersion,
} from "@/api/modelReconstitution/version";
import { getModel } from "@/api/modelReconstitution/model";
import { listClassify } from "@/api/modelReconstitution/classify";
import FileNameUpload from "@/components/FileNameUpload/index.vue";
import { ref, reactive, computed, onMounted, watch } from "vue";
import { useRoute } from "vue-router";
import { ElMessage, ElMessageBox } from "element-plus";

const route = useRoute();

// Props
const props = defineProps({
  model: {
    type: Object,
    default: {},
  },
});

// Emits
const emit = defineEmits(["refresh"]);

// 响应式数据
const classifyOptions = ref([]);
const isEdit = ref(true);
const isFormat = ref(null);
const loading = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const showSearch = ref(true);
const total = ref(0);
const versionList = ref([]);
const title = ref("");
const open = ref(false);
const modelForm = ref({});
const queryFormRef = ref();
const formRef = ref();
const versionData = ref([]);
// 查询参数
const queryParams = reactive({
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
});

// 表单参数
const form = reactive({});

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
  interfaceAddress: [
    { required: true, message: "上传接口不能为空", trigger: "blur" },
  ],
  fileAddress: [
    { required: true, message: "上传文件不能为空", trigger: "blur" },
  ],
});

// 计算属性
const modelId = computed(() => {
  return route.query.modelId;
});

// 监听器
watch(
    () => props.model,
    (newModel) => {
      if (newModel && newModel.version) {
        getList();
      }
    },
    { deep: true }
);

// 方法
const fileModelName = (res) => {
  console.log(res);
  form.fileName = res.originalFilename.substring(
    0,
    res.originalFilename.lastIndexOf(".")
  );
};

/** 查询版本管理列表 */
const getList = () => {
  loading.value = true;
  const mid = route.query.modelId;
  queryParams.modelId = mid;
  let data =  [];
  if (data.length === 0 && props.model && props.model.version) {
    data = [{
      id: null,
      modelId: mid,
      modelName: props.model.name,
      version: props.model.version,
      status: 1,
      description: '-',
      createBy: props.model.createBy || '张三',
      createTime: props.model.createTime || '2025-09-18 15:13',
    }];
  }
  versionList.value = data;
  total.value = data.length;
  loading.value = false;

};

// 取消按钮
const cancel = () => {
  open.value = false;
  reset();
};

/** 版本对比 */

const handleCompare = (row) => {
  ElMessage.info("功能正在开发中");
}

// 表单重置
const reset = () => {
  Object.assign(form, {
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
    remark: null,
  });
  isEdit.value = false;
  if (formRef.value) {
    formRef.value.clearValidate();
  }
};

/** 查询分类下拉树结构 */
const getTreeselect = () => {
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
    classifyOptions.value = result;
  });
};

/** 转换菜单数据结构 */
const normalizer = (node) => {
  if (node.children && !node.children.length) {
    delete node.children;
  }
  return {
    id: node.id,
    label: node.name,
    children: node.children,
  };
};

// 节点单击事件
const handleNodeClick = (data) => {
  queryParams.classifyId = data.id;
  handleQuery();
};

// 是否启用
const handleEnable = (row) => {
  ElMessageBox.confirm("你确定要切换当前模型的版本吗？", "提示", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      let beforeVersionId = null;
      let beforeVersionVersion = null;
      versionList.value.forEach((item) => {
        if (item.status == 1) {
          beforeVersionId = item.id;
          beforeVersionVersion = item.version;
        }
      });

      let obj = {
        modelId: modelForm.value.id,
        modelName: modelForm.value.name,
        beforeVersionId: beforeVersionId,
        beforeVersion: beforeVersionVersion,
        afterVersionId: row.id,
        afterVersion: row.version,
      };
      handoffVersion(obj).then((res) => {
        ElMessage({
          type: "success",
          message: "切换成功!",
        });
        getList();
        emit("refresh", modelForm.value.id);
      });
    })
    .catch(() => {});
};

/** 搜索按钮操作 */
const handleQuery = () => {
  queryParams.pageNum = 1;
  getList();
};

/** 重置按钮操作 */
const resetQuery = () => {
  reset();
  Object.keys(queryParams).forEach((key) => {
    queryParams[key] = null;
  });
  queryParams.pageNum = 1;
  queryParams.pageSize = 10;
  handleQuery();
};

// 多选框选中数据
const handleSelectionChange = (selection) => {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length !== 1;
  multiple.value = !selection.length;
};

/** 新增按钮操作 */
const handleAdd = () => {
  reset();
  open.value = true;
  const mid = route.query.modelId;
  form.modelId = mid;
  getModel(mid).then((response) => {
    form.modelName = response.data.name;
  });
  title.value = "添加版本管理";
};

/** 修改按钮操作 */
const handleUpdate = (row) => {
  reset();
  const id = row.id || ids.value;
  const modelName = row.modelName;
  const status = row.status;
  if (status == 1) {
    ElMessageBox.confirm(
      "【" + modelName + "】模型已启用，请先切换到别的版本然后进行修改！"
    ).catch(() => {});
  } else {
    getVersion(id).then((response) => {
      Object.assign(form, response.data);
      form.modelName = modelForm.value.name;
      open.value = true;
      title.value = "修改版本管理";
      isEdit.value = true;
    });
  }
};

/** 提交按钮 */
const submitForm = () => {
  if (formRef.value) {
    formRef.value.validate((valid) => {
      if (valid) {
        console.log(versionList.value, "shuju");

        let versionListFiltered = versionList.value.filter((item) => {
          if (item.version == form.version) {
            return true;
          }
        });
        // if (versionListFiltered.length == 0) {
        form.modelId = modelForm.value.id;
        form.modelName = modelForm.value.name;
        if (form.fileAddress && form.fileAddress.length > 0) {
          form.fileName = form.fileAddress[0].name;
          form.fileAddress = form.fileAddress[0].url;
        }
        console.log(form);
        if (form.id != null) {
          updateVersion(form).then((response) => {
            ElMessage.success("修改成功");
            open.value = false;
            getList();
          });
        } else {
          addVersion(form).then((response) => {
            ElMessage.success("新增成功");
            open.value = false;
            getList();
          });
        }
        // } else {
        //   ElMessage.error("已有此版本，请重新输入或者删除之前的版本！");
        // }
      }
    });
  }
};

/** 删除按钮操作 */
const handleDelete = (row) => {
  const idsToDelete = row.id || ids.value;
  const modelName = modelForm.value.name;
  const status = row.status;
  if (status == 1) {
    ElMessageBox.confirm(
      "【" + modelName + "】该版本已启用，请先停用后在删除！"
    ).catch(() => {});
  } else {
    ElMessageBox.confirm(
      '是否确认删除版本管理编号为"' + idsToDelete + '"的数据项？'
    )
      .then(function () {
        return delVersion(idsToDelete);
      })
      .then(() => {
        getList();
        ElMessage.success("删除成功");
      })
      .catch(() => {});
  }
};

// 下载
const handleDownload = (row) => {
  // location.href(row.fileAddress)
  downloadFile(
    modelForm.value.interfaceorfileAddress,
    modelForm.value.name + "模型文件"
  );
};

const downloadFile = (urls, name) => {
  fetch(urls).then((res) => {
    res.blob().then((blob) => {
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      // 获取文件后缀
      let fileNameAnd = getFileNameAnd(urls);
      //   doc", "xls", "ppt", "txt", "pdf
      a.download = name + fileNameAnd;

      a.click();

      window.URL.revokeObjectURL(url);
    });
  });
};

const getFileNameAnd = (url) => {
  let filename = url.substring(url.lastIndexOf("/") + 1);
  // 获取文件后缀，判断是文件还是图片
  let subName = filename.substring(filename.length - 4, filename.length);
  return subName;
};

// 组件挂载时执行
onMounted(() => {
  getList();
  getTreeselect();
});
</script>

<style lang="scss" scoped>
.app-container {
  min-height: 0;
  background: transparent;
  .icon-mini {
    width: 1em;
    height: 1em;
    margin-right: 8px;
  }
}
</style>
