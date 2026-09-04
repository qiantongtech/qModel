<!--
  Copyright (c) 2026 Jiangsu Qiantong Technology Co., Ltd.
   *
  Software Name: qModel Algorithm Model Platform (Commercial Edition)

   *
  [RIGHTS AND LICENSE STATEMENT]
  This file contains non-public commercial source code of which Jiangsu Qiantong
  Technology Co., Ltd. lawfully possesses complete intellectual property rights.
   *
  Access and use are limited to entities or individuals who have signed a valid
  commercial license agreement, within the scope stipulated in the agreement.
  The "accessibility" of this source code is premised on lawful authorization
  and does not constitute any form of transfer of intellectual property rights
  or implied licensing.
   *
  [PROHIBITIONS]
  Unless explicitly agreed in the license agreement, the following acts in any
  form are strictly prohibited:
  1. Copying, disseminating, disclosing, selling, renting, or redistributing
  this source code;
  2. Providing the software's functionality to third parties via SaaS, PaaS,
  cloud hosting, or other means;
  3. Using this software or its derivative versions to develop products that
  compete with the Right Holder;
  4. Providing or displaying this source code or related technical information
  to unauthorized third parties;
  5. Tampering with, circumventing, or destroying copyright notices, license
  verifications, or other technical protection measures.
   *
  [LEGAL LIABILITY]
  Any unauthorized use constitutes an infringement of trade secrets and
  intellectual property rights.
   *
  The Right Holder will strictly pursue liability for breach of contract and
  infringement in accordance with the commercial agreement and laws such as
  the "Copyright Law of the People's Republic of China" and the "Anti-Unfair
  Competition Law".
   *
  ============================================================================
   *
  Copyright (c) 2026 江苏千桐科技有限公司
   *
  软件名称：qModel 算法模型平台（商业版）
   *
  【权利与授权声明】
  本文件属于江苏千桐科技有限公司依法享有完全知识产权的非公开商业源代码。
  仅限已签署有效商业授权合同的单位或个人在约定范围内查阅和使用。
  源代码的“可访问性”均以合法授权为前提，不构成任何形式的知识产权转让或默示授权。
   *
  【禁止事项】
  除授权合同明确约定外，严禁任何形式的：
  1. 复制、传播、披露、出售、出租或再分发本源代码；
  2. 通过 SaaS、PaaS、云托管等方式向第三方提供本软件功能；
  3. 将本软件或其衍生版本用于开发与权利人构成竞争的产品；
  4. 向未授权第三方提供或展示本源代码或相关技术信息；
  5. 篡改、规避或破坏版权标识、授权校验及其他技术保护措施。
   *
  【法律责任】
  任何未经授权的利用行为，均构成对商业秘密及知识产权的侵害。
  权利人将依据商业合同及《中华人民共和国著作权法》《反不正当竞争法》
  等法律法规，严厉追究违约与侵权责任。
-->

<template>
  <div class="app-container">
    <div class="justify-between mb15">
      <el-row :gutter="15" class="btn-style">
        <el-col :span="1.5">
          <div style="display: flex; align-items: center;">
            <el-button
                type="primary"
                plain
                @click="handleAdd"
                v-hasPermi="['model:calc:calc:add']"
                @mousedown="(e) => e.preventDefault()"
            >
              <i class="iconfont-mini icon-xinzeng mr5"></i>新增
            </el-button>
            <div class="info-tip" style="margin-top: 0">
              <el-icon><InfoFilled /></el-icon><span>基于当前版本新增</span>
            </div>
          </div>
        </el-col>
      </el-row>
      <div class="justify-end top-right-btn">
        <right-toolbar
            @queryTable="getList"
            :columns="columns"
            :search="false"
        ></right-toolbar>
      </div>
    </div>

    <el-table stripe v-loading="loading"
              :data="versionList"
              :default-sort="defaultSort"
              @sort-change="handleSortChange"
    >
      <el-table-column v-if="getColumnVisibility(0)" label="编号" align="center" width="80" prop="id" sortable>
        <template #default="scope"> {{ scope.row.id }}</template>
      </el-table-column>
      <el-table-column v-if="getColumnVisibility(1)" label="版本号" align="left" prop="modelVersion" width="200px"
                       :show-overflow-tooltip="{ effect: 'light' }">
        <template #default="scope">
          <span>{{ scope.row.modelVersion }}</span>
          <el-tag v-if="props.model.version === scope.row.modelVersion" type="primary" style="margin-left: 5px">
            当前版本
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column v-if="getColumnVisibility(2)" label="版本描述" align="left" prop="description"
                       :show-overflow-tooltip="{ effect: 'light' }">
        <template #default="scope">
          {{ scope.row.description || "-" }}
        </template>
      </el-table-column>
      <el-table-column v-if="getColumnVisibility(3)" label="版本摘要" align="left" prop="description" width="340">
        <template #default="scope">
          <div v-if="scope.row.baseVersion && scope.row.baseVersion !== '' ">
            <div>基于 {{ scope.row.baseVersion }} 版本</div>
            <div style="display: flex;flex-direction: row;gap: 3px;">
              <dict-tag v-if="scope.row.digest"
                  v-for="digest in scope.row.digest.split(',')" :key="digest"
                  :options="model_version_digest"
                  :value="digest.trim()"
              />
            </div>
          </div>
          <div v-else>
            <el-tag type="primary">初始版本</el-tag>
          </div>
        </template>
      </el-table-column>
      <el-table-column v-if="getColumnVisibility(4)" label="创建人" align="center" prop="createBy" width="140"
                       :show-overflow-tooltip="{ effect: 'light' }">
        <template #default="scope">
          <span>{{ scope.row.createBy }}</span>
        </template>
      </el-table-column>
      <el-table-column v-if="getColumnVisibility(5)" label="创建时间" align="center" prop="createTime" width="160"
                       sortable>
        <template #default="scope">
          <span>{{
              parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}")
            }}</span>
        </template>
      </el-table-column>

      <el-table-column v-if="getColumnVisibility(6)" label="操作" align="center" width="250"
                       class-name="small-padding fixed-width"
                       fixed="right">
        <template #default="scope">
          <el-button link type="primary" @click="handleCompare(scope.row)">
            <svg-icon icon-class="meta-version" class="handle-svg-icon"/>
            版本对比
          </el-button>
          <el-button :disabled="props.model.version === scope.row.modelVersion"
                     link type="primary" icon="Switch"
                     @click="handleChange(scope.row)">
            版本切换
          </el-button>
          <el-popover placement="bottom" :width="120" trigger="click">
            <template #reference>
              <el-button link type="primary" icon="ArrowDown">更多</el-button>
            </template>
            <div class="task-action-list">
              <el-button
                  v-if="scope.row.status === 1"
                  link
                  type="primary"
                  icon="CircleClose"
                  @click="handleStop(scope.row)"
                  style="margin-left: 0;"
              >复制
              </el-button>
              <el-button :disabled="props.model.version === scope.row.modelVersion"
                         link
                         type="primary"
                         icon="Edit"
                         @click="handleUpdate(scope.row)"
                         v-hasPermi="['model:calc:calc:edit']"
                         style="margin-left: 0;"
              >修改
              </el-button>
              <el-button :disabled="props.model.version === scope.row.modelVersion"
                         link
                         type="danger"
                         icon="Delete"
                         @click="handleDelete(scope.row)"
                         v-hasPermi="['model:calc:calc:remove']"
                         style="margin-left: 0;"
              >删除
              </el-button>
            </div>
          </el-popover>
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

<script setup>
import {
  listVersion,
  changeVersion,
  getVersion,
  delVersion,
  addVersion,
  updateVersion
} from "@/api/model/version";
import { getModel } from "@/api/model/model";
import { listClassify } from "@/api/model/classify";
import FileNameUpload from "@/components/FileNameUpload/index.vue";

import RightToolbar from "@/components/RightToolbar/index.vue";
import {ref, reactive, computed, onMounted, watch, getCurrentInstance} from "vue";
import {useRoute} from "vue-router";

const route = useRoute();
const {proxy} = getCurrentInstance();
const {model_version_digest} = proxy.useDict("model_version_digest");

const props = defineProps({
  model: {
    type: Object,
    default: {},
  },
});

const loading = ref(true);
const ids = ref([]);
const multiple = ref(true);
const total = ref(0);
const versionList = ref([]);
const title = ref("");
const open = ref(false);
const defaultSort = ref({prop: "createTime", order: "descending"});

const columns = ref([
  {key: 0, label: "编号", visible: true},
  {key: 1, label: "版本号", visible: true},
  {key: 2, label: "版本描述", visible: true},
  {key: 3, label: "版本摘要", visible: true},
  {key: 4, label: "创建人", visible: true},
  {key: 5, label: "创建时间", visible: true},
  {key: 6, label: "操作", visible: true},
]);

const getColumnVisibility = (key) => {
  const column = columns.value.find((col) => col.key === key);
  if (!column) return true;
  return column.visible;
};
// 查询参数
const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  modelId: null,
  orderByColumn: defaultSort.value.prop,
  isAsc: defaultSort.value.order
});

// 表单参数
const form = reactive({});

// 监听器
watch(
    () => props.model,
    (newModel) => {
      if (newModel && newModel.version) {
        getList();
      }
    },
    {deep: true}
);

/** 排序触发事件 */
function handleSortChange(column) {
  queryParams.value.orderByColumn = column.prop;
  queryParams.value.isAsc = column.order;
  getList();
}

/** 查询版本管理列表 */
const getList = () => {
  loading.value = true;
  queryParams.modelId = props.model.id;
  listVersion(queryParams).then((response) => {
    versionList.value = response.data.list;
    total.value = response.data.total;
    loading.value = false;
  });
  loading.value = false;
};

/** 版本对比 */
const handleCompare = (row) => {
  proxy.$router.push({
    path: "/model/modelManageView/modelVersionDiff",
    query: {modelId: props.model.id, compareVersion: row.modelVersion, currentVersion: props.model.version},
  });
};

// 版本切换
function handleChange(row) {
  let param = {
    modelId: props.model.id,
    modelVersion: row.modelVersion
  }
  if (props.model.status === '10'){
    proxy.$modal.msgWarning("模型已上架模型市场，请先下架模型");
    return;
  }
  proxy.$modal
      .confirm('是否确认切换到版本【' + row.modelVersion + '】？')
      .then(() => {
        return changeVersion(param)
      })
      .then((response) => {
        if (response && response.data) {
          proxy.$router.push({
            path: "/model/modelManageView",
            query: {modelId: props.model.id, tab: "version"},
          });
          props.model.version = row.modelVersion;
          proxy.$modal.msgSuccess("切换成功");
        }
      })
}

/** 新增按钮操作 */
const handleAdd = () => {
  proxy.$router.push({
    path: "/model/modelManageView/modelVersion/add",
    query: { id: props.model.id ,version: props.model.version },
  });
};

/** 修改按钮操作 */
const handleUpdate = (row) => {
  proxy.$router.push({
    path: "/model/modelManageView/modelVersion/edit",
    query: { id: props.model.id ,version: row.modelVersion },
  });
};

/** 删除按钮操作 */
const handleDelete = (row) => {
  const idsToDelete = row.id || ids.value;
  proxy.$modal
      .confirm('是否确认删除编号为"' + idsToDelete + '"的数据项？')
      .then(() => {
        return delVersion(idsToDelete);
      })
      .then((response) => {
        getList();
        proxy.$modal.msgSuccess("删除成功");
      });
};

// 组件挂载时执行
onMounted(() => {
  getList();
});
</script>

<style lang="scss" scoped>
.app-container {
  min-height: 0;
  background: transparent;

  .icon-mini {
    width: 1em;
    height: 1em;
    margin-right: 6px;
  }
}

.justify-between {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.justify-end {
  display: flex;
  justify-content: flex-end;
}

.mb15 {
  margin-bottom: 15px;
}

.top-right-btn {
  display: flex;
  align-items: center;
}

.task-action-list {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0 auto;
  gap: 8px;

  :deep(.el-button) {
    margin: 0 !important;
  }
}

.info-tip {
  display: flex;
  flex-direction: row;
  align-items: center;
  font-size: x-small;
  color: #a8aaae;
  margin-left: 5px;
  margin-top: 5px;
  justify-content: flex-start;
  gap: 5px;
}
</style>
