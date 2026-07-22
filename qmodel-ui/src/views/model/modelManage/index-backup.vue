<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<template>
  <div class="app-container">
    <el-container>
      <!-- 左侧可调整的部分 -->
      <el-aside :style="{ width: `${leftWidth}px` }" class="left-pane">
        <div class="left-tree">
          <div class="head-container">
            <el-input
              v-model="classifyName"
              placeholder="请输入分类名称"
              clearable
              prefix-icon="Search"
              style="margin-bottom: 20px"
            />
          </div>
          <div class="head-container">
            <el-tree
              :data="classifyOptions"
              :props="defaultProps"
              :expand-on-click-node="false"
              :filter-node-method="filterNode"
              ref="treeRef"
              node-key="id"
              default-expand-all
              highlight-current
              @node-click="handleNodeClick"
            />
          </div>
        </div>
      </el-aside>
      <!-- 拖拽条 -->
      <div class="resize-bar" @mousedown="startResize">
        <div class="resize-handle-sx">
          <span class="zjsx"></span>
        </div>
      </div>

      <el-main>
        <!--用户数据-->
        <div class="pagecont-top" v-show="showSearch">
          <el-form
            :model="queryParams"
            ref="queryFormRef"
            :inline="true"
            v-show="showSearch"
            class="btn-style"
          >
            <el-form-item label="模型名称：" prop="name">
              <el-input
                v-model="queryParams.name"
                placeholder="请输入模型名称"
                clearable
                @keyup.enter="handleQuery"
                style="width: 180px"
              />
            </el-form-item>
            <el-form-item label="模型接入方式：" prop="accessMode">
              <el-select
                v-model="queryParams.accessMode"
                placeholder="请选择模型类别"
                clearable
                class="el-form-input-width"
              >
                <el-option key="0" label="python脚本" value="0" />
                <el-option key="1" label="api接口" value="1" />
              </el-select>
            </el-form-item>
            <!-- <el-form-item label="模型类别：" prop="type">
              <el-select
                v-model="queryParams.type"
                placeholder="请选择模型类别"
                clearable
                class="el-form-input-width"
              >
                <el-option
                  v-for="dict in model_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item> -->

            <el-form-item>
              <el-button
                plain
                type="primary"
                @click="handleQuery"
                @mousedown="(e) => e.preventDefault()"
              >
                <i class="iconfont-mini icon-a-zu22377 mr5"></i>查询
              </el-button>
              <el-button
                @click="resetQuery"
                @mousedown="(e) => e.preventDefault()"
                class="btn"
              >
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
                  type="primary"
                  plain
                  @click="handleAdd"
                  v-hasPermi="['model:model:add']"
                >
                  <i class="iconfont-mini icon-xinzeng"></i>新增
                </el-button>
              </el-col>
              <el-col :span="1.5"></el-col>
            </el-row>
            <right-toolbar
              v-model:showSearch="showSearch"
              @queryTable="getList"
            ></right-toolbar>
          </div>
          <!-- <el-row v-loading="loading" :gutter="15">
            <el-col
              :sm="12"
              :md="12"
              :lg="8"
              :xl="6"
              style="margin-bottom: 15px"
              v-for="(item, index) in 10"
              :key="index"
            > -->
          <div class="card-box" v-loading="loading" v-if="total > 0">
            <el-card
              :body-style="{ padding: '16px 16px 0' }"
              shadow="never"
              v-for="(item, index) in modelList"
              :key="index"
            >
              <div class="card-item" @click="handleView(item)">
                <div class="item-top">
                  <div class="top-title ellipsis">
                    <img
                      src="@/assets/system/images/model/version/card-title.svg"
                      alt=""
                    /><span class="title-name">{{ item.name }}</span>
                  </div>
                  <el-popover
                    placement="bottom"
                    trigger="click"
                    popper-class="custom-popover-width"
                    :popper-style="{ minWidth: '60px', width: '90px' }"
                  >
                    <template #reference>
                      <div class="imgbox" @click.stop>
                        <img
                          src="@/assets/system/images/model/version/more.svg"
                          alt=""
                        />
                      </div>
                    </template>
                    <div class="popover-content">
                      <el-button
                        type="primary"
                        text
                        @click="handleUpdate(item)"
                      >
                        <Edit class="icon-mini" />
                        编辑</el-button
                      >
                      <el-button type="danger" text @click="handleDelete(item)">
                        <Delete class="icon-mini" />
                        删除</el-button
                      >
                    </div>
                  </el-popover>
                </div>
                <div
                  v-if="false"
                  class="item-desc ellipsis-3"
                  :title="item.description"
                >
                  {{ item.description }}
                </div>
                <div class="item-con">
                  <div class="con-l">
                    <div class="con-view">
                      <div class="con-view-title">版本号</div>
                      <tag
                        size="small"
                        type="primary"
                        :name="'Version' + item.version"
                      ></tag>
                    </div>
                    <div class="con-view">
                      <div class="con-view-title">接入方式</div>
                      <span v-if="item.accessMode == 1">API接口</span>
                      <span v-else>python脚本</span>
                    </div>

                    <div class="con-view">
                      <div class="con-view-title">发布时间</div>
                      <span v-if="item.publishTime == null">-,-</span>
                      <span v-else>{{ item.publishTime }}</span>
                    </div>
                  </div>
                </div>
                <!-- <div class="card-btns">
                    <el-button
                      type="primary"
                      style="padding-right: 8px; padding-left: 8px"
                      title="编辑"
                      @click="handleUpdate(item)"
                    >
                      <i class="iconfont-mini icon-a-xiugaixianxing mr5"></i>
                    </el-button>
                    <el-button
                      type="warning"
                      style="padding-right: 8px; padding-left: 8px"
                      title="详情"
                      @click="handleView(item)"
                    >
                      <i class="iconfont-mini icon-a-yincangxianxing mr5"></i>
                    </el-button>
                    <el-button
                      type="danger"
                      style="padding-right: 8px; padding-left: 8px"
                      title="删除"
                      @click="handleDelete(item)"
                    >
                      <i class="iconfont-mini icon-a-shanchuxianxing mr5"></i>
                    </el-button>
                  </div> -->
              </div>
            </el-card>
          </div>
          <!-- </el-col>
          </el-row> -->

          <el-empty
            description="暂无数据，请添加模型"
            v-if="total == 0"
          ></el-empty>
          <div class="pagefy" v-if="total > 0">
            <pagination
              :pageSizes="[12, 24, 36, 48]"
              :total="total"
              v-model:page="queryParams.pageNum"
              v-model:limit="queryParams.pageSize"
              @pagination="getList"
            />
          </div>
        </div>
      </el-main>
    </el-container>

    <el-dialog
      :title="title"
      v-model="open"
      width="800px"
      append-to="body"
      draggable
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="formRef" :model="form" :rules="rules" label-width="130px">
        <el-form-item label="模型名称：" prop="name">
          <el-input
            clearable
            v-model="form.name"
            placeholder="请输入模型名称"
          />
        </el-form-item>
        <el-form-item label="模型分类：" prop="classifyId" class="formClass">
          <el-tree-select
            v-model="form.classifyId"
            :data="classifyOptions"
            :props="{ value: 'id', label: 'name', children: 'children' }"
            :show-count="true"
            placeholder="请选择模型分类"
            noResultsText="暂无数据"
            :disabled="isEdit"
          />
        </el-form-item>
        <el-form-item label="是否预置：" prop="builtin">
          <el-radio :disabled="isEdit" v-model="form.builtin" :label="Number(1)"
            >是</el-radio
          >
          <el-radio :disabled="isEdit" v-model="form.builtin" :label="Number(0)"
            >否</el-radio
          >
          <el-tooltip
            class="item"
            effect="dark"
            content="选择是之后则不可去设置修改输入参数"
            placement="right"
          >
            <i class="el-icon-question"></i>
          </el-tooltip>
        </el-form-item>
        <el-form-item label="接入方式：" prop="accessMode">
          <el-radio :disabled="isEdit" v-model="form.accessMode" :value="0"
            >python脚本
          </el-radio>
          <el-radio :disabled="isEdit" v-model="form.accessMode" :value="1"
            >API接口</el-radio
          >
          <el-tooltip placement="top" v-if="mess">
            <template #content>
              Tips: 核心信息请在详情页版本控制里面修改
            </template>
            <!-- elementui图标库：显示黑色的问号图标   -->
            <el-icon>
              <QuestionFilled />
            </el-icon>
          </el-tooltip>
        </el-form-item>
        <el-form-item
          label="上传文件："
          prop="fileName"
          v-if="form.accessMode == 0"
        >
          <file-name-upload
            :disabled="isEdit"
            :fileType="['zip']"
            v-model="form.interfaceorfileAddress"
            :limit="1"
            :fileSize="200"
            :editName="form.fileName"
            :style="'width: 420px'"
            :upload-success="uploadSuccess"
            :delete-success="() => (form.runnableFileAddress = null)"
          />
        </el-form-item>
        <el-form-item
          label="可执行文件："
          prop="runnableFileAddress"
          v-if="form.accessMode == 0"
        >
          <el-input
            v-model="form.runnableFileAddress"
            placeholder="请上传压缩包后在文件列表处选择运行模型的文件"
            disabled
          />
        </el-form-item>
        <el-form-item
          label="API地址："
          prop="interfaceorfileAddress"
          v-if="form.accessMode == 1"
        >
          <!-- <el-input
            clearable
            :disabled="isEdit"
            v-model="form.interfaceorfileAddress"
            placeholder="请输入API接口"
          /> -->
          <el-input
            clearable
            v-model="form.interfaceorfileAddress"
            placeholder="请输入API接口"
          />
        </el-form-item>
        <el-form-item label="端口号：" prop="port" v-if="form.accessMode == 1">
          <!-- <el-input
            clearable
            :disabled="isEdit"
            v-model="form.port"
            placeholder="请输入接口端口号"
          /> -->
          <el-input
            clearable
            v-model="form.port"
            placeholder="请输入接口端口号"
          />
        </el-form-item>
        <el-form-item label="版本号：" prop="version" v-if="form.id == null">
          <!-- <el-input
            :disabled="isEdit"
            v-model="form.version"
            placeholder="请输入版本号"
          >
            <template #append>Version</template>
          </el-input> -->
          <el-input v-model="form.version" placeholder="请输入版本号">
            <template #append>Version</template>
          </el-input>
        </el-form-item>
        <el-form-item label="版本发布说明：" prop="description">
          <!-- <el-input
            :disabled="isEdit"
            v-model="form.description"
            :rows="3"
            type="textarea"
            placeholder="请输入版本发布说明"
          /> -->
          <el-input
            v-model="form.description"
            :rows="3"
            type="textarea"
            placeholder="请输入版本发布说明"
          />
        </el-form-item>

        <el-form-item label="模型介绍：" prop="remark">
          <el-input
            v-model="form.remark"
            :rows="3"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
      </el-form>
      <el-tree
        :data="form.fileList"
        default-expand-all
        v-if="
          form.accessMode == 0 &&
          form.interfaceorfileAddress &&
          form.interfaceorfileAddress.length > 0
        "
      >
        <template #default="{ data }">
          <span class="custom-tree-node">
            <span v-if="data.children">{{ data.fileName }}</span>
            <el-radio
              v-model="form.runnableFileAddress"
              :label="data.fileName"
              v-if="!data.children"
              >{{ data.fileName }}</el-radio
            >
          </span>
        </template>
      </el-tree>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancel">取 消</el-button>
          <el-button type="primary" @click="submitForm" class="btn"
            >确 定</el-button
          >
        </div>
      </template>
    </el-dialog>

    <!-- 添加或修改模型管理 对话框 -->
    <!--        <el-dialog
                :title="title"
                v-model="open"
                :width="dialogWidth"
                :close-on-click-modal="false"
                append-to-body
        >
            <div style="display: flex">
                <el-form ref="formRef" :model="form" :rules="rules" label-width="180px" style="width: 750px">
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="模型名称：" prop="name">
                                <el-input
                                        clearable
                                        v-model="form.name"
                                        placeholder="请输入模型名称"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="模型分类：" prop="classifyId" class="formClass">
                                <el-tree-select
                                        v-model="form.classifyId"
                                        :data="classifyOptions"
                                        :props="{ value: 'id', label: 'name', children: 'children' }"
                                        :show-count="true"
                                        placeholder="请选择模型分类"
                                        noResultsText="暂无数据"
                                        :disabled="isEdit"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="是否预置：" prop="builtin">
                                <el-radio :disabled="isEdit" v-model="form.builtin" :label="Number(1)">是</el-radio>
                                <el-radio :disabled="isEdit" v-model="form.builtin" :label="Number(0)">否</el-radio>
                                <el-tooltip class="item" effect="dark" content="选择是之后则不可去设置修改输入参数"
                                            placement="right">
                                    <i class="el-icon-question"></i>
                                </el-tooltip>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="接入方式：" prop="accessMode">
                                <el-radio :disabled="isEdit" v-model="form.accessMode" :value="0">python脚本
                                </el-radio>
                                <el-radio :disabled="isEdit" v-model="form.accessMode" :value="1">API接口</el-radio>
                                <el-tooltip placement="top" v-if="mess">
                                    <template #content>
                                        Tips: 核心信息请在详情页版本控制里面修改
                                    </template>
                                    &lt;!&ndash; elementui图标库：显示黑色的问号图标   &ndash;&gt;
                                    <el-icon>
                                        <QuestionFilled/>
                                    </el-icon>
                                </el-tooltip>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-if="form.accessMode == 0">
                        <el-col :span="20">
                            <el-form-item label="上传文件：" prop="fileName">
                                <file-name-upload :disabled="isEdit" :fileType="['zip']"
                                                  v-model="form.interfaceorfileAddress"
                                                  :limit="1"
                                                  :fileSize="200" :editName="form.fileName" :style="'width: 420px'"
                                                  :upload-success="uploadSuccess"
                                                  :delete-success="() => form.runnableFileAddress = null"
                                />
                                &lt;!&ndash;              <FileUpload&ndash;&gt;
                                &lt;!&ndash;                v-model="form.interfaceorfileAddress"&ndash;&gt;
                                &lt;!&ndash;                @fileModelName="fileModelName"&ndash;&gt;
                                &lt;!&ndash;                :fileStyle2="true"&ndash;&gt;
                                &lt;!&ndash;                :disabled="isEdit"&ndash;&gt;
                                &lt;!&ndash;                :isModelOrImg="false"&ndash;&gt;
                                &lt;!&ndash;                :limit="1"&ndash;&gt;
                                &lt;!&ndash;                :fileType="['zip']"&ndash;&gt;
                                &lt;!&ndash;                :fileSize="200"&ndash;&gt;
                                &lt;!&ndash;              />&ndash;&gt;
                            </el-form-item>
                        </el-col>
                        <el-col :span="20">
                            <el-form-item label="可执行文件：" prop="runnableFileAddress">
                                <el-input v-model="form.runnableFileAddress"
                                          placeholder="请上传压缩包后在文件列表处选择运行模型的文件"
                                          disabled/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-if="form.accessMode == 1">
                        <el-col :span="20">
                            <el-form-item label="API地址：" prop="interfaceorfileAddress">
                                <el-input
                                        clearable
                                        :disabled="isEdit"
                                        v-model="form.interfaceorfileAddress"
                                        placeholder="请输入API接口"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-if="form.accessMode == 1">
                        <el-col :span="20">
                            <el-form-item label="端口号：" prop="port">
                                <el-input
                                        clearable
                                        :disabled="isEdit"
                                        v-model="form.port"
                                        placeholder="请输入接口端口号"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-if="form.id == null">
                        <el-col :span="20">
                            <el-form-item label="版本号：" prop="version">
                                <el-input :disabled="isEdit" v-model="form.version" placeholder="请输入版本号">
                                    <template #append>Version</template>
                                </el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="版本发布说明：" prop="description">
                                <el-input
                                        :disabled="isEdit"
                                        v-model="form.description"
                                        :rows="3"
                                        type="textarea"
                                        placeholder="请输入版本发布说明"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="20">
                            <el-form-item label="模型介绍：" prop="remark">
                                <el-input
                                        v-model="form.remark"
                                        :rows="3"
                                        type="textarea"
                                        placeholder="请输入内容"
                                />
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
                <el-tree :data="form.fileList" default-expand-all
                         v-if="this.form.accessMode == 0 && this.form.interfaceorfileAddress && this.form.interfaceorfileAddress.length > 0"
                >
                    <template #default="{ data }">
                      <span class="custom-tree-node">
                        <span v-if="data.children">{{ data.fileName }}</span>
                        <el-radio v-model="form.runnableFileAddress" :label="data.fileName" v-if="!data.children">{{
                            data.fileName
                            }}</el-radio>
                      </span>
                    </template>
                </el-tree>
            </div>
            <template #footer>
                <div class="dialog-footer">
                    <el-button type="primary" @click="submitForm">确 定</el-button>
                    <el-button @click="cancel">取 消</el-button>
                </div>
            </template>
        </el-dialog>-->
  </div>
</template>

<script setup>
import {
  computed,
  getCurrentInstance,
  nextTick,
  onMounted,
  reactive,
  ref,
  watch,
} from "vue";
import {
  addModel,
  delModel,
  getFileList,
  getModel,
  listModel,
  updateModel,
} from "@/api/modelReconstitution/model";
import { listClassify } from "@/api/modelReconstitution/classify";
import { useDict } from "@/utils/dict.js";
import FileNameUpload from "@/components/FileNameUpload/index.vue";
import { QuestionFilled } from "@element-plus/icons-vue";
import { ElMessage, ElMessageBox } from "element-plus";

// Get access to the current instance to use globally registered functions
const { proxy } = getCurrentInstance();

// Define refs for form elements
const queryFormRef = ref(null);
const formRef = ref(null);
const treeRef = ref(null);

// Component state
const mess = ref(false);
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
// 模型管理 表格数据
const modelList = ref([]);
//分类数据
const projectInfo = ref([]);
const classifyName = ref(undefined);
//分类树选项
const classifyOptions = ref([]);
// 默认选中的节点的 key 值
const defaultSelectedKey = ref("");
// 弹出层标题
const title = ref("");
// 是否显示弹出层
const open = ref(false);
const isEdit = ref(false); //是否编辑
//启用状态禁止删除
const isStatus = ref(false);

const defaultProps = {
  children: "children",
  label: "name",
};

// 查询参数
const queryParams = reactive({
  pageNum: 1,
  pageSize: 12,
  orderByColumn: "create_time",
  isAsc: "desc",
  companyId: null,
  name: null,
  classifyId: null,
  builtin: null,
  accessMode: null,
  requestMethod: null,
  interfaceorfileAddress: null,
  versionId: null,
  whetherPublish: null,
  publishTime: null,
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
  classifyId: [
    { required: true, message: "模型分类不能为空", trigger: "blur" },
  ],
  name: [{ required: true, message: "模型名称不能为空", trigger: "blur" }],
  // version: [{ required: true, message: "版本号不能为空", trigger: "blur" }],
  // description: [
  //   { required: true, message: "版本发布说明不能为空", trigger: "blur" },
  // ],
  // interfaceorfileAddress: [
  //   { required: true, message: "地址不能为空", trigger: "blur" },
  // ],
  // port: [{ required: true, message: "端口不能为空", trigger: "blur" }],
});

const model_type = useDict("model_type").model_type;

const leftWidth = ref(300);
const isResizing = ref(false);
const startX = ref(0);

// Computed property for dialog width
const dialogWidth = computed(() => {
  console.log(123);
  return form.accessMode == 0 &&
    form.interfaceorfileAddress &&
    form.interfaceorfileAddress.length > 0
    ? "1200px"
    : "750px";
});

// Watch for classifyName changes
watch(classifyName, (val) => {
  if (treeRef.value) {
    treeRef.value.filter(val);
  }
});

onMounted(() => {
  getTreeselect();
});

// Methods converted to standalone functions
const startResize = (event) => {
  isResizing.value = true;
  startX.value = event.clientX;
  // 使用 requestAnimationFrame 减少重绘频率
  document.addEventListener("mousemove", updateResize);
  document.addEventListener("mouseup", stopResize);
};

const updateResize = (event) => {
  if (isResizing.value) {
    const delta = event.clientX - startX.value; // 计算鼠标移动距离
    leftWidth.value += delta; // 修改左侧宽度
    startX.value = event.clientX; // 更新起始位置
    // 使用 requestAnimationFrame 来减少页面重绘频率
    requestAnimationFrame(() => {});
  }
};

const stopResize = () => {
  isResizing.value = false;
  document.removeEventListener("mousemove", updateResize);
  document.removeEventListener("mouseup", stopResize);
};

const uploadSuccess = (val) => {
  if (val == null || val.length == 0) {
    form.fileList = [];
  } else {
    getFileList({ fileUrl: val[0].url }).then((res) => {
      form.fileList = res.data;
    });
  }
};

const fileModelName = (res) => {
  form.fileName = res.originalFilename.substring(
    0,
    res.originalFilename.lastIndexOf(".")
  );
};

/** 查询模型管理 列表 */
const getList = () => {
  loading.value = true;
  listModel(queryParams).then((response) => {
    modelList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

/** 查询分类下拉树结构 */
const getTreeselect = () => {
  listClassify().then((res) => {
    for (let i = 0; i < res.data.length; i++) {
      let arrTemp = [];
      for (let j = 0; j < res.data.length; j++) {
        if (res.data[i].id == res.data[j].parentId) {
          res.data[i].children = arrTemp;
          arrTemp.push(res.data[j]);
        }
      }
    }
    const result = [];
    for (let i = 0; i < res.data.length; i++) {
      if (res.data[i].parentId == 0) {
        result.push(res.data[i]);
      }
    }
    classifyOptions.value = result;
    nextTick(() => {
      if (treeRef.value) {
        treeRef.value.setCurrentKey(classifyOptions.value[0].id);
      }
    });
    handleNodeClick(classifyOptions.value[0]);
  });
};

// 筛选节点
const filterNode = (value, data) => {
  if (!value) return true;
  // 使用默认的 label 属性进行比较
  const label = data[defaultProps.label];
  return label.indexOf(value) !== -1;
};

// 节点单击事件
const handleNodeClick = (data) => {
  queryParams.classifyId = data.id;
  handleQuery();
};

// 取消按钮
const cancel = () => {
  open.value = false;
  Object.assign(form, {
    id: null,
    companyId: null,
    name: null,
    classifyId: null,
    classifyName: null,
    builtin: null,
    accessMode: null,
    requestMethod: null,
    interfaceorfileAddress: null,
    fileList: [],
    runnableFileAddress: null,
    versionId: null,
    version: null,
    description: null,
    whetherPublish: null,
    publishTime: null,
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

// 表单重置
const reset = () => {
  Object.assign(form, {
    id: null,
    companyId: null,
    name: null,
    classifyId: null,
    classifyName: null,
    builtin: null,
    accessMode: null,
    requestMethod: null,
    interfaceorfileAddress: null,
    fileList: [],
    runnableFileAddress: null,
    versionId: null,
    version: null,
    description: null,
    whetherPublish: null,
    publishTime: null,
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
  handleNodeClick(classifyOptions.value[0]);
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
  queryParams.classifyId = undefined;
  handleNodeClick(classifyOptions.value[0]);
  handleQuery();
  if (treeRef.value) {
    treeRef.value.setCurrentKey(null);
  }
};

// 多选框选中数据
const handleSelectionChange = (selection) => {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length !== 1;
  multiple.value = !selection.length;
};

/** 新增按钮操作 */
const handleAdd = () => {
  Object.assign(form, {
    id: null,
    companyId: null,
    name: null,
    classifyId: null,
    classifyName: null,
    builtin: null,
    accessMode: null,
    requestMethod: null,
    interfaceorfileAddress: null,
    fileList: [],
    runnableFileAddress: null,
    versionId: null,
    version: null,
    description: null,
    whetherPublish: null,
    publishTime: null,
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
  open.value = true;
  title.value = "添加模型管理 ";
  mess.value = false;
};

/** 修改按钮操作 */
const handleUpdate = (row) => {
  Object.assign(form, {
    id: null,
    companyId: null,
    name: null,
    classifyId: null,
    classifyName: null,
    builtin: null,
    accessMode: null,
    requestMethod: null,
    interfaceorfileAddress: null,
    fileList: [],
    runnableFileAddress: null,
    versionId: null,
    version: null,
    description: null,
    whetherPublish: null,
    publishTime: null,
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
  const id = row.id || ids.value;
  getModel(id).then((response) => {
    Object.assign(form, response.data);
    open.value = true;
    title.value = "修改模型管理 ";
    if (form.type) {
      form.type = form.type.toString();
    }
    if (form.dimensions) {
      form.dimensions = form.dimensions.toString();
    }
    if (form.builtin) {
      form.builtin = parseInt(form.builtin);
    }
    if (form.format) {
      form.format = parseInt(form.format);
    }
    isEdit.value =
      form.builtin == 1 ? true : form.whetherPublish == 1 ? true : false;
    mess.value = true;
    if (form.accessMode == 0) {
      getFileList({ fileUrl: form.interfaceorfileAddress }).then((res) => {
        form.fileList = res.data;
      });
    }
  });
};

// 详情
const handleView = (row) => {
  const modelId = row.id;
  const modelName = row.name;
  // Assuming router is available via proxy
  proxy.$router.push({
    path: "/model/modelManageView",
    query: {
      modelId,
      modelName,
      pageNum: queryParams.pageNum,
    },
  });
};

/** 提交按钮 */
const submitForm = () => {
    if (formRef.value) {
        formRef.value.validate((valid) => {
            if (valid) {
                let formData = JSON.parse(JSON.stringify(form));
                // 只有当 interfaceorfileAddress 是数组时才进行处理（文件上传场景）
                // API接口场景下它是字符串，不需要处理
                if (Array.isArray(formData.interfaceorfileAddress) &&
                    formData.interfaceorfileAddress.length > 0) {
                    formData.fileName = formData.interfaceorfileAddress[0].name;
                    formData.interfaceorfileAddress =
                        formData.interfaceorfileAddress[0].url;
                }
                if (formData.id != null) {
                    updateModel(formData).then(() => {
                        ElMessage.success("修改成功");
                        open.value = false;
                        getList();
                    });
                } else {
                    addModel(formData).then(() => {
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
  const ids = row.id || ids.value;
  const name = row.name;
  const uploadStatus = row.uploadStatus;
  if (uploadStatus == 1) {
    ElMessageBox.confirm("【" + name + "】模型已启用，请先停用！", "警告", {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    }).catch(() => {});
  } else {
    ElMessageBox.confirm(
      "是否确认删除模型名称为【" + name + "】的模型数据吗？",
      "警告",
      {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }
    )
      .then(() => {
        return delModel(ids);
      })
      .then(() => {
        getList();
        ElMessage.success("删除成功");
      })
      .catch(() => {});
  }
};

/** 导出按钮操作 */
const handleExport = () => {
  // Assuming download function is available via proxy
  if (proxy && proxy.download) {
    proxy.download(
      "modelReconstitution/model/export",
      {
        ...queryParams,
      },
      `model_${new Date().getTime()}.xlsx`
    );
  }
};
</script>
<style lang="scss" scoped>
.pagecont-bottom {
  position: relative;
  flex: 1;
  min-height: calc(100vh - 250px);
  padding: 0px;
  background-color: transparent;
  border-radius: 2px;
  box-shadow: 0 5px 8px rgba(128, 145, 165, 0.1);
}
.card-box {
  width: 100%;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 15px;
  padding: 0;
  height: calc(100vh - 355px);
  overflow: auto;
  // height: 100px;
}
.pagefy {
  position: absolute;
  bottom: 0;
  width: 100%;
  background: #fff;
  padding: 11px 15px;
}

::v-deep {
  .selectlist .el-tag.el-tag--info {
    background: #f3f8ff !important;
    border: 0px solid #6ba7ff !important;
    color: #2666fb !important;
  }
}

.left-pane {
  height: calc(100vh - 124px);
  background-color: #ffffff;
  transition: width 0s; /* 可以根据需要调整过渡时间 */
}

.resize-bar {
  cursor: ew-resize;
  background-color: #f0f2f5;
  height: calc(100vh - 124px);
  display: flex;
  align-items: center;
  justify-content: center;
}

.resize-handle-sx {
  width: 15px;
  text-align: center;
  //   cursor:pointer
}

.zjsx {
  display: inline-block;
  width: 5px;
  height: 50px;
  border-left: 1px solid #ccc;
  border-right: 1px solid #ccc;
}

.el-main {
  padding: 2px 0px;
  // box-shadow: 1px 1px 3px rgba(0, 0, 0, .2);
}

.el-aside {
  padding: 2px 0px;
  margin-bottom: 0px;
  background-color: #f0f2f5;
}

.custom-tree-node {
  display: flex;
  align-items: center;
}

.treelable {
  margin-left: 5px;
}

.zjiconimg {
  font-size: 12px;
}

.colorxz {
  color: var(--el-color-primary);
  font-size: 16px;
}

.colorwxz {
  color: var(--el-color-primary-light-6);
  font-size: 16px;
}

.iconimg {
  font-size: 15px;
}

//上传附件样式调整
:deep {
  // .el-upload-list{
  //    display: flex;
  // }
  .el-upload-list__item {
    width: 100%;
    height: 25px;
  }

  .el-tree--highlight-current
    .el-tree-node.is-current
    > .el-tree-node__content {
    background-color: var(--el-color-primary-light-9) !important;
    border-right: 2px solid var(--el-color-primary);
    color: var(--el-color-primary);
  }
}

.card-item {
  .item-top {
    display: flex;
    align-items: center;
    justify-content: space-between;

    .top-title {
      width: 85%;
      font-weight: bold;
      font-size: 16px;
      display: flex;
      align-items: center;
      // line-height: 22px;
      // i {
      //   vertical-align: middle;
      // }
      span {
        margin-left: 11px;
      }
    }
    .imgbox {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      // background: #2666fb;
    }

    .top-status {
      width: 25%;
      display: flex;
      align-items: center;

      .status-icon {
        margin-right: 3px;
        width: 7px;
        height: 7px;
        border-radius: 50%;
        // background-color: rgb(255, 217, 74);
      }

      .status-name {
        // color: rgb(255, 217, 74);
        font-size: 14px;
        font-weight: bold;
      }
    }
  }

  .item-desc {
    min-height: 52px;
    color: #999;
    font-size: 14px;
    font-weight: 400;
    margin: 10px 0;
    line-height: 1.2;
  }

  .item-con {
    display: flex;
    align-items: center;
    border-top: 1px solid #ebeef5;
    // border-bottom: 1px solid #ebeef5;
    // padding: 10px 0;
    margin-top: 14px;

    .con-l {
      width: 100%;
      margin-top: 5px;
      .con-view {
        display: flex;
        align-items: center;
        text-align: left;
        font-weight: 400;
        margin-top: 11px;
        font-size: 14px;

        &:last-child {
          padding-bottom: 0px;
        }

        .con-view-title {
          width: 72px;
          color: rgb(144, 136, 156);
        }

        ::v-deep .el-tag {
          height: 17px;
          line-height: 15px;
          margin-bottom: 3px;
        }
      }
    }
  }
}

.card-btns {
  width: 100%;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 6px 0 10px;
}

.formClass {
  ::v-deep .vue-treeselect--disabled .vue-treeselect__control {
    background-color: #f5f7fa;
  }

  ::v-deep .vue-treeselect--disabled .vue-treeselect__single-value {
    color: #c0c4cc;
  }
}
:deep(.left-tree) {
  padding: 15px;
  overflow: hidden;
}
.head-container {
  ::v-deep
    .el-tree--highlight-current
    .el-tree-node.is-current
    > .el-tree-node__content {
    background-color: #cee5ff;
  }
}
:deep(.el-tree) {
  height: calc(100vh - 210px);
  overflow: auto;
}
:deep(.pagination-container) {
  margin-top: 4px !important;
  background: transparent;
}
:deep(.justify-between) {
  padding: 13px 15px;
  background: #fff;
}
:deep(.el-card) {
  border: 0px;
  border-radius: 2px 2px 2px 2px !important;
}
:deep(.el-col) {
  cursor: pointer;
}

.popover-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  // padding: 10px 0;
  min-width: 60px;
}
.btn {
  margin-left: 12px !important;
}

:deep(.el-button + .el-button) {
  margin-left: 12px;
}
:deep(.tag-rect) {
  border: 0;
}
:deep(.el-card__body) {
  padding: 12px 20px 13px 20px !important;
}
:deep(.el-card) {
  height: 178px;
  cursor: pointer;
}
:deep(.el-empty) {
  height: calc(100vh - 355px);
}
</style>
