<template>
  <div class="invoke-history">
    <div class="pagecont-bottom">
      <el-table stripe height="58vh" v-loading="loading" :data="modelInvokeHistoryList" :default-sort="defaultSort" @sort-change="handleSortChange">
        <el-table-column label="编号" align="center" prop="id" sortable />
        <el-table-column label="客户端IP" align="center" prop="clientIp">
          <template #default="scope">
            {{ scope.row.clientIp || '-' }}
          </template>
        </el-table-column>
        <el-table-column label="请求时间" align="center" prop="createTime" width="180" sortable>
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="耗时" align="center" prop="duration">
          <template #default="scope">
            {{ scope.row.duration || '-' }}ms
          </template>
        </el-table-column>
        <el-table-column label="调用状态" align="center" prop="status">
          <template #default="scope">
            <dict-tag :options="invoke_history_status" :value="scope.row.status" class="con-value access-tag" />
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="100">
          <template #default="scope">
            <el-button link type="primary" icon="view" @click="handleDetail(scope.row)">详情</el-button>
          </template>
        </el-table-column>

        <template #empty>
          <div class="emptyBg">
            <img src="@/assets/system/images/no_data/noData.png" alt="" />
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

    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="modelInvokeHistoryRef" :model="form" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="模型编号" prop="modelId">
              <div>{{ form.modelId || '-' }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模型名称" prop="modelName">
              <div>{{ form.modelName || '-' }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="客户端IP" prop="clientIp">
              <div>{{ form.clientIp || '-' }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="调用状态" prop="status">
              <dict-tag :options="invoke_history_status" :value="form.status" class="con-value access-tag" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="开始时间" prop="startTime">
              <div>{{ parseTime(form.startTime, '{y}-{m}-{d} {h}:{i}:{s}') || '-' }}</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="结束时间" prop="endTime">
              <div>{{ parseTime(form.endTime, '{y}-{m}-{d} {h}:{i}:{s}') || '-' }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="执行耗时" prop="duration">
              <div>{{ form.duration || '-' }}ms</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="输入参数" prop="inputParams">
              <pre class="json-pre">{{ form.inputParams || '-' }}</pre>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="输出结果" prop="outputResult">
              <pre class="json-pre">{{ form.outputResult || '-' }}</pre>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="错误信息" prop="errorMessage">
              <div>{{ form.errorMessage || '-' }}</div>
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

<script setup name="InvokeHistory">
import { listModelInvokeHistory, getModelInvokeHistory } from "@/api/model/invokeHistory/modelInvokeHistory";
import {ref, reactive, onMounted, watch, getCurrentInstance} from "vue";
import DictTag from "@/components/DictTag/index.vue";

const props = defineProps({
  modelId: {
    type: [Number, String],
    default: null
  }
})

const { proxy } = getCurrentInstance();
const { invoke_history_status } = proxy.useDict('invoke_history_status');
const modelInvokeHistoryList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);
const title = ref("");
const defaultSort = ref({ prop: "createTime", order: "desc" });
const openDetail = ref(false);

const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  modelId: null,
  modelName: null,
  resourceId: null,
  versionId: null,
  requestMethod: null,
  invokeType: null,
  inputParams: null,
  outputResult: null,
  startTime: null,
  endTime: null,
  duration: null,
  errorMessage: null,
  status: null,
  clientIp: null,
  createTime: null,
  orderByColumn: "createTime",  // 添加默认排序字段
  isAsc: "desc",
});

const form = reactive({});

const getList = () => {
  loading.value = true;
  queryParams.modelId = props.modelId;
  listModelInvokeHistory(queryParams).then(response => {
    modelInvokeHistoryList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

const cancel = () => {
  openDetail.value = false;
};

const reset = () => {
  Object.assign(form, {
    id: null,
    modelId: null,
    modelName: null,
    resourceId: null,
    versionId: null,
    requestMethod: null,
    invokeType: null,
    inputParams: null,
    outputResult: null,
    startTime: null,
    endTime: null,
    duration: null,
    errorMessage: null,
    status: null,
    clientIp: null,
    validFlag: null,
    delFlag: null,
    createBy: null,
    creatorId: null,
    createTime: null,
    updateBy: null,
    updatorId: null,
    updateTime: null,
    remark: null
  });
};

const handleQuery = () => {
  queryParams.pageNum = 1;
  getList();
};

const resetQuery = () => {
  Object.keys(queryParams).forEach((key) => {
    if (key !== 'pageNum' && key !== 'pageSize') {
      queryParams[key] = null;
    }
  });
  queryParams.pageNum = 1;
  handleQuery();
};

const handleSortChange = (column, prop, order) => {
  queryParams.orderByColumn = column.prop;
  queryParams.isAsc = column.order;
  getList();
};

const handleDetail = (row) => {
  reset();
  const _id = row.id;
  getModelInvokeHistory(_id).then(response => {
    Object.assign(form, response.data);
    openDetail.value = true;
    title.value = "调用记录详情";
  });
};

watch(() => props.modelId, () => {
  getList();
});

onMounted(() => {
  getList();
});
</script>

<style lang="scss" scoped>
.invoke-history {
  min-height: 0;
  background: transparent;
}

.json-pre {
  background: #f5f5f5;
  padding: 10px;
  border-radius: 4px;
  font-family: 'Consolas', 'Monaco', monospace;
  font-size: 12px;
  max-height: 200px;
  overflow-y: auto;
  white-space: pre-wrap;
  word-break: break-all;
}
</style>
