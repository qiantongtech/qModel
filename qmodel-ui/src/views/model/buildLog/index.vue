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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch">
      <el-form class="btn-style" :model="queryParams" ref="queryRef" :inline="true" label-width="75px"
               v-show="showSearch" @submit.prevent>
        <el-form-item label="模型名称" prop="modelName">
          <el-input
              class="el-form-input-width"
              v-model="queryParams.modelName"
              placeholder="请输入模型名称"
              clearable
              @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="构建状态" prop="status">
          <el-select
              v-model="queryParams.status"
              placeholder="请选择构建状态"
              clearable
              style="width: 210px"
          >
            <el-option
                v-for="dict in build_status"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
            />
          </el-select>
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
        <el-row :gutter="15" class="btn-style">
          <el-col :span="1.5">
            <el-button type="danger" plain :disabled="multiple" @click="handleDelete" v-hasPermi="['model:buildLog:buildlog:remove']"
                       @mousedown="(e) => e.preventDefault()">
              <i class="iconfont-mini icon-shanchu-huise mr5"></i>删除
            </el-button>
          </el-col>
        </el-row>
        <div class="justify-end top-right-btn">
          <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </div>
      </div>
      <el-table stripe height="58vh" v-loading="loading" :data="modelBuildLogList"
                @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column v-if="getColumnVisibility(0)" label="编号" align="center" width="80" prop="id"
                         sortable="custom"
                         :sort-orders="['descending', 'ascending']"/>
        <el-table-column v-if="getColumnVisibility(1)" label="模型名称" align="left" prop="modelName"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            {{ scope.row.modelName || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(2)" label="模型编码" align="left" prop="code"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            {{ scope.row.code || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(3)" label="模型版本" align="left" prop="versionId">
          <template #default="scope">
            {{ scope.row.version || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(4)" label="构建状态" align="center" prop="status" width="120">
          <template #default="scope">
            <dict-tag
                :options="build_status"
                :value="scope.row.status"
                class="con-value access-tag"
            />
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(8)" label="创建人" align="center" prop="createBy" width="120">
          <template #default="scope">
            {{ scope.row.createBy || '-' }}
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(5)" label="开始时间" align="center" prop="createTime" width="180"
                         sortable="custom" :sort-orders="['descending', 'ascending']">
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}") }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(6)" label="结束时间" align="center" prop="endTime" width="180">
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}") }}</span>
          </template>
        </el-table-column>
        <!--       <el-table-column v-if="getColumnVisibility(7)" label="执行耗时" align="center" prop="duration" width="120">-->
        <!--         <template #default="scope">-->
        <!--           {{ scope.row.duration ? scope.row.duration + ' ms' : '-' }}-->
        <!--         </template>-->
        <!--       </el-table-column>-->

        <el-table-column v-if="getColumnVisibility(9)" label="操作" align="center"
                         class-name="small-padding fixed-width" fixed="right" width="140">
          <template #default="scope">
            <el-button link type="primary" icon="view" @click="handleDetail(scope.row)"
                       v-hasPermi="['model:buildLog:buildlog:query']">详情
            </el-button>
          </template>
        </el-table-column>
        <template #empty>
          <div class="emptyBg">
            <img src="@/assets/system/images/no_data/noData.png" alt=""/>
            <p>暂无记录</p>
          </div>
        </template>
      </el-table>

      <pagination
          v-show="total>0"
          :total="total"
          v-model:page="queryParams.pageNum"
          v-model:limit="queryParams.pageSize"
          @pagination="getList"
      />
    </div>

    <!-- 构建日志详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="modelBuildLogRef" :model="form" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="编号" prop="id">
              <div class="form-readonly">
                {{ form.id || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模型名称" prop="modelName">
              <div class="form-readonly">
                {{ form.modelName || "-" }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模型编码" prop="versionId">
              <div class="form-readonly">
                {{ form.code }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模型版本" prop="versionId">
              <div class="form-readonly">
                {{ form.version }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="构建状态" prop="status">
              <dict-tag
                  :options="build_status"
                  :value="form.status"
                  class="con-value access-tag"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="创建人" prop="createBy">
              <div class="form-readonly">
                {{ form.createBy }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="开始时间" prop="createTime">
              <div class="form-readonly">
                {{ form.createTime }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="结束时间" prop="endTime">
              <div class="form-readonly">
                {{ form.endTime }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="构建日志" prop="startTime">
              <div ref="logRef" class="log-body">
                <div v-for="(line, index) in logs" :key="index" :class="['log-line', line.type]">
                  <span class="log-time">{{ line.time }}</span>
                  <span class="log-content-text">{{ line.content }}</span>
                </div>
                <div v-if="logs === 0" class="log-empty">
                  > 暂无构建日志<br/>
                  > 构建日志将展示在此处
                </div>
              </div>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="mini" @click="cancel">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="ModelBuildLog">
import {
  listModelBuildLog,
  getModelBuildLog,
  delModelBuildLog,
  addModelBuildLog,
  updateModelBuildLog
} from "@/api/model/buildLog/modelBuildLog";
import {getToken} from "@/utils/auth.js";
import {ref, nextTick} from "vue";

const {proxy} = getCurrentInstance();

const modelBuildLogList = ref([]);

// 列显隐信息
const columns = ref([
  {key: 0, label: "编号", visible: true},
  {key: 1, label: "模型名称", visible: true},
  {key: 2, label: "模型编码", visible: true},
  {key: 3, label: "模型版本", visible: true},
  {key: 4, label: "构建状态", visible: true},
  {key: 8, label: "创建人", visible: true},
  {key: 5, label: "开始时间", visible: true},
  {key: 6, label: "结束时间", visible: true},
  // { key: 7, label: "执行耗时", visible: true },
  {key: 9, label: "操作", visible: true}
]);

const getColumnVisibility = (key) => {
  const column = columns.value.find(col => col.key === key);
  // 如果没有找到对应列配置，默认显示
  if (!column) return true;
  // 如果找到对应列配置，根据visible属性来控制显示
  return column.visible;
};

const {build_status} = proxy.useDict("build_status");
const logRef = ref(null);
const open = ref(false);
const openDetail = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const defaultSort = ref({prop: "createTime", order: "descending"});
const router = useRouter();
const logs = ref([]);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    resourceId: null,
    modelId: null,
    modelName: null,
    versionId: null,
    buildType: null,
    status: null,
    startTime: null,
    endTime: null,
    duration: null,
    installedPackages: null,
    missingPackages: null,
    failedPackages: null,
    dockerfileContent: null,
    buildLog: null,
    errorMessage: null,
    requirements: null,
    createTime: null,
  },
  rules: {
    resourceId: [{required: true, message: "模型文件id不能为空", trigger: "blur"}],
    validFlag: [{required: true, message: "是否有效不能为空", trigger: "blur"}],
    delFlag: [{required: true, message: "删除标志不能为空", trigger: "blur"}],
    createTime: [{required: true, message: "创建时间不能为空", trigger: "blur"}],
    updateTime: [{required: true, message: "更新时间不能为空", trigger: "blur"}],
  }
});

const {queryParams, form, rules} = toRefs(data);

/** 查询构建日志列表 */
function getList() {
  loading.value = true;
  listModelBuildLog(queryParams.value).then(response => {
    modelBuildLogList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  openDetail.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    resourceId: null,
    modelId: null,
    modelName: null,
    versionId: null,
    buildType: null,
    status: null,
    startTime: null,
    endTime: null,
    duration: null,
    installedPackages: null,
    missingPackages: null,
    failedPackages: null,
    dockerfileContent: null,
    buildLog: null,
    errorMessage: null,
    requirements: null,
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
  proxy.resetForm("modelBuildLogRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}


/** 排序触发事件 */
function handleSortChange(column, prop, order) {
  queryParams.value.orderByColumn = column.prop;
  queryParams.value.isAsc = column.order;
  getList();
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加构建日志";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getModelBuildLog(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改构建日志";
  });
}

const parseLogContent = (logContent) => {
  if (!logContent) return [];

  const lines = logContent.split('\n');
  return lines.map(line => {
    let type = 'info';
    if (line.includes('SUCCESS') || line.includes('Successed')) {
      type = 'success';
    } else if (line.includes('ERROR') || line.includes('failed')) {
      type = 'error';
    } else if (line.includes('WARN') || line.includes('warning')) {
      type = 'warn';
    } else if (line.includes('Starting') || line.includes('Running')) {
      type = 'info';
    }

    const match = line.match(/\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})\]/);
    let time = '';
    let content = line;
    if (match) {
      time = match[1].split(' ')[1];
      content = line.replace(match[0], '').trim();
    }

    return {time, content, type};
  }).filter(line => line.content.trim());
};

/** 详情按钮操作 */
function handleDetail(row) {
  reset();
  const _id = row.id || ids.value
  getModelBuildLog(_id).then(response => {
    form.value = response.data;
    form.value.version = row.version;
    form.value.code = row.code;
    openDetail.value = true;
    title.value = "构建日志详情";
    logs.value = parseLogContent(response.data.buildLog || '');
    nextTick(() => {
      if (logRef.value) {
        logRef.value.scrollTop = logRef.value.scrollHeight;
      }
    });
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["modelBuildLogRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateModelBuildLog(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        }).catch(error => {
        });
      } else {
        addModelBuildLog(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        }).catch(error => {
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除构建日志编号为"' + _ids + '"的数据项？').then(function () {
    return delModelBuildLog(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

function routeTo(link, row) {
  if (link !== "" && link.indexOf("http") !== -1) {
    window.location.href = link;
    return
  }
  if (link !== "") {
    if (link === router.currentRoute.value.path) {
      window.location.reload();
    } else {
      router.push({
        path: link,
        query: {
          id: row.id
        }
      });
    }
  }
}

getList();
</script>

<style lang="scss" scoped>

.form-readonly {
  width: 100%;
  border: 1px solid #f1f1f1;
  padding: 0px 10px;
  min-height: 34px;
  background-color: #fcfcfc;
  border-radius: 2px;
  color: #333;
  display: flex;
  align-items: center;
  white-space: pre-wrap;
  word-wrap: break-word;
  word-break: break-all;
}

.build-log {
  min-height: 0;
  background: transparent;
}

.build-status-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
}

.status-info {
  flex: 1;
  display: flex;
  align-items: center;
  gap: 8px;

  .h2-titles {
    margin: 0;
  }
}

.image-tag-info {
  margin-left: 20px;
}

.log-content {
  margin-bottom: 20px;
}

.h2-titles {
  font-size: 16px;
  color: rgba(0, 0, 0, 0.85);
  display: flex;
  align-items: center;
  font-weight: 500;
  margin: 8px 0 15px 0;
}

.h2-titles::before {
  display: inline-block;
  content: '';
  width: 6px;
  height: 16px;
  border-radius: 3px;
  background: var(--el-color-primary);
  margin-right: 8px;
}

.log-body {
  background-color: #1e1e1e;
  color: #d4d4d4;
  padding: 15px;
  font-family: 'Consolas', 'Monaco', monospace;
  font-size: 13px;
  line-height: 1.6;
  border-radius: 4px;
  overflow-y: auto;
  height: 320px;
  width: 100%;
}

.log-line {
  white-space: pre-wrap;
  word-break: break-all;
  margin-bottom: 4px;
}

.log-time {
  color: #858585;
  margin-right: 8px;
}

.log-content-text {
  color: #d4d4d4;
}

.log-line.success .log-content-text {
  color: #7ee787;
}

.log-line.error .log-content-text {
  color: #f85149;
}

.log-line.warn .log-content-text {
  color: #ffa657;
}

.log-empty {
  color: #7ee787;
}

.build-info {
  margin-top: 20px;
}
</style>
