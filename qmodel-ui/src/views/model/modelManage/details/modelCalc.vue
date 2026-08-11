<!--
  Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.

  This file is part of qModel Module Platform (Open Source Edition).

  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.

  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.

  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<template>
  <div class="app-container">
    <!-- 列表区域 -->
    <div class="justify-between mb15">
      <el-row :gutter="15" class="btn-style">
        <el-col :span="1.5">
          <el-button
              type="primary"
              plain
              @click="handleAdd"
              :disabled="props.model.status !== '5'"
              v-hasPermi="['model:calc:calc:add']"
              @mousedown="(e) => e.preventDefault()"
          >
            <i class="iconfont-mini icon-xinzeng mr5"></i>新增
          </el-button>
        </el-col>
      </el-row>
      <div class="justify-end top-right-btn">
        <right-toolbar
            v-model:showSearch="showSearch"
            @queryTable="getList"
            :columns="columns"
        ></right-toolbar>
      </div>
    </div>

    <el-table
        stripe
        height="58vh"
        v-loading="loading"
        :data="calcList"
        @selection-change="handleSelectionChange"
        :default-sort="defaultSort"
        @sort-change="handleSortChange"
    >
      <el-table-column
          v-if="getColumnVisibility(0)"
          label="编号"
          align="center"
          prop="id"
          width="80"
          :show-overflow-tooltip="{ effect: 'light' }"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
      />
      <el-table-column
          v-if="getColumnVisibility(1)"
          label="任务名称"
          align="left"
          prop="name"
          min-width="200"
          :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          {{ scope.row.name || '-' }}
        </template>
      </el-table-column>
      <el-table-column
          v-if="getColumnVisibility(2)"
          label="计算编码"
          align="left"
          prop="code"
          min-width="220"
          :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          {{ scope.row.code || '-' }}
        </template>
      </el-table-column>
      <el-table-column
          v-if="getColumnVisibility(3)"
          label="任务状态"
          align="center"
          prop="status"
          width="120"
          :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          <dict-tag :options="model_calc_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column
          v-if="getColumnVisibility(4)"
          label="优先级"
          align="center"
          prop="priority"
          width="100"
          :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          <dict-tag :options="model_calc_priority" :value="scope.row.priority"/>
        </template>
      </el-table-column>
      <el-table-column
          v-if="getColumnVisibility(7)"
          label="耗时"
          align="center"
          prop="duration"
          width="100"
          :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          {{ formatDuration(scope.row.duration) }}
        </template>
      </el-table-column>
      <el-table-column
          v-if="getColumnVisibility(8)"
          label="备注"
          align="left"
          prop="remark"
          min-width="220"
          :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          {{ scope.row.remark || scope.row.description || '-' }}
        </template>
      </el-table-column>
      <el-table-column
          v-if="getColumnVisibility(5)"
          label="创建人"
          align="center"
          prop="createBy"
          width="100"
          :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          {{ scope.row.createBy || '-' }}
        </template>
      </el-table-column>
      <el-table-column
          v-if="getColumnVisibility(6)"
          label="创建时间"
          align="center"
          prop="createTime"
          width="160"
          sortable="custom"
          :sort-orders="['descending', 'ascending']"
          :show-overflow-tooltip="{ effect: 'light' }"
      >
        <template #default="scope">
          {{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}') }}
        </template>
      </el-table-column>

      <el-table-column
          label="操作"
          align="center"
          class-name="small-padding fixed-width"
          fixed="right"
          width="240"
      >
        <template #default="scope">
          <el-button
              link
              type="primary"
              icon="View"
              @click="handleDetail(scope.row)"
              v-hasPermi="['model:calc:calc:query']"
          >详情
          </el-button>
          <el-button
              link
              type="primary"
              icon="RefreshRight"
              @click="handleRecalc(scope.row)"
          >重新运行
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
              >终止
              </el-button>
              <el-button
                  link
                  type="primary"
                  icon="Edit"
                  @click="handleUpdate(scope.row)"
                  v-hasPermi="['model:calc:calc:edit']"
                  style="margin-left: 0;"
              >修改
              </el-button>
              <el-button
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

      <template #empty>
        <div class="emptyBg">
          <img src="@/assets/system/images/no_data/noData.png" alt=""/>
          <p>暂无记录</p>
        </div>
      </template>
    </el-table>

    <pagination
        v-show="total > 0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 新增/编辑 对话框 -->
    <el-dialog
        v-model="open"
        draggable
        destroy-on-close
        width="60%"
        class="dialog"
        :append-to="$refs['app-container']"
        @open="handleDialogOpen"
    >
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="calcRef" :model="form" :rules="rules" label-width="146px" @submit.prevent>
        <!-- 模型选择 -->
        <div class="h2-title">模型选择</div>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="模型分类" prop="classifyId">
              <el-input v-model="form.classifyName" disabled placeholder="选择模型后自动填充"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模型" prop="modelId">
              <el-input v-model="form.modelName" disabled placeholder="选择模型后自动填充"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="版本" prop="modelVersion">
              <el-input v-model="form.modelVersion" disabled placeholder="选择模型后自动填充"/>
            </el-form-item>
          </el-col>
        </el-row>

        <!-- 任务信息 -->
        <div class="h2-title">任务信息</div>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="任务名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入任务名称"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="任务描述" prop="description">
              <el-input
                  v-model="form.description"
                  type="textarea"
                  :rows="2"
                  placeholder="请输入任务描述"
                  maxlength="512个字符"
                  show-word-limit
              />
            </el-form-item>
          </el-col>
        </el-row>
<!--        <el-row :gutter="20">-->
<!--          <el-col :span="24">-->
<!--            <el-form-item label="备注" prop="remark">-->
<!--              <el-input-->
<!--                  v-model="form.remark"-->
<!--                  type="textarea"-->
<!--                  :rows="2"-->
<!--                  placeholder="请输入备注"-->
<!--                  maxlength="512个字符"-->
<!--                  show-word-limit-->
<!--              />-->
<!--            </el-form-item>-->
<!--          </el-col>-->
<!--        </el-row>-->

        <!-- 输入数据绑定 -->

        <!--        <el-empty v-if="form.inputParams.length === 0" description="请先选择模型，自动填充输入参数" :image-size="60" />-->

        <!-- 运行策略 -->
        <div class="h2-title">运行策略</div>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="超时时间" prop="timeoutSeconds">
              <el-input v-model="form.timeoutSeconds" placeholder="请输入超时时间">
                <template #append>秒</template>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="重试次数" prop="maxRetryCount">
              <el-input v-model="form.maxRetryCount" placeholder="请输入重试次数">
                <template #append>次</template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="优先级" prop="priority">
              <el-radio-group v-model="form.priority">
                <el-radio
                    v-for="dict in model_calc_priority"
                    :key="dict.value"
                    :label="Number(dict.value)"
                >{{ dict.label }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div class="h2-title">数据绑定</div>
      <el-table :data="form.inputParams" border size="small" style="margin-bottom: 12px" max-height="200">
        <el-table-column label="参数名" width="140">
          <template #default="scope">
            <el-input :model-value="scope.row.title || scope.row.name" disabled placeholder="自动填充"/>
          </template>
        </el-table-column>
        <el-table-column label="是否必填" width="90" align="center">
          <template #default="scope">
            <span>{{ scope.row.required ? '是' : '否' }}</span>
          </template>
        </el-table-column>
        <el-table-column label="参数值" min-width="220">
          <template #default="scope">
            <!-- 文件类型：使用 FileUpload2 组件 -->
            <FileUpload
                v-if="scope.row.type === 'file'"
                :model-value="scope.row.value || ''"
                :limit="1"
                :file-size="200"
                :drag-flag="false"
                @update:model-value="(val) => scope.row.value = val"
            />
            <!-- 数字类型：使用 el-input-number -->
            <el-input-number
                v-else-if="scope.row.type === 'integer' || scope.row.type === 'number'"
                v-model="scope.row.value"
                :placeholder="'请输入' + (scope.row.title || scope.row.name)"
                :precision="scope.row.type === 'integer' ? 0 : 2"
                controls-position="right"
                style="width: 100%"
            />
            <!-- 字符串类型：使用 el-input -->
            <el-input
                v-else
                v-model="scope.row.value"
                :placeholder="'请输入' + (scope.row.title || scope.row.name)"
                clearable
            />
          </template>
        </el-table-column>
        <el-table-column label="类型" width="130">
          <template #default="scope">
            <el-select :model-value="scope.row.type" disabled>
              <el-option label="String" value="string"/>
              <el-option label="Integer" value="integer"/>
              <el-option label="Number" value="number"/>
              <el-option label="File" value="file"/>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column label="说明" min-width="180">
          <template #default="scope">
            <el-input :model-value="scope.row.description || scope.row.title" disabled/>
          </template>
        </el-table-column>
      </el-table>
      <div v-if="validateError" class="error-msg" style="margin-bottom: 20px;">
        <el-icon>
          <Warning/>
        </el-icon>
        {{ validateError }}
      </div>
      <template #footer>
        <div style="text-align: right">
          <el-button @click="cancel">取 消</el-button>
          <el-button type="primary" @click="submitForm">提交计算</el-button>
        </div>
      </template>
    </el-dialog>

  </div>

</template>


<script setup name="modelCalc">
import {useRouter} from 'vue-router';
import {listCalc, getCalc, delCalc, addCalc, updateCalc, executeCalc, cancelCalc} from '@/api/model/calc/calc'
import {listModelFileResource} from "@/api/model/modelFileResource.js";
import {getModelConfigByModelId} from "@/api/model/config.js";

const {proxy} = getCurrentInstance()
const router = useRouter()
const {
  model_calc_status,
  model_calc_priority,
  model_access_type
} = proxy.useDict('model_calc_status', 'model_calc_priority', 'model_access_type')

// ========== 数据 ==========
const calcList = ref([])

const columns = ref([
  {key: 0, label: '编号', visible: true},
  {key: 1, label: '任务名称', visible: true},
  {key: 2, label: '计算编码', visible: true},
  {key: 3, label: '状态', visible: true},
  {key: 4, label: '优先级', visible: true},
  {key: 5, label: '创建人', visible: true},
  {key: 6, label: '创建时间', visible: true},
  {key: 7, label: '耗时', visible: true},
  {key: 8, label: '备注', visible: true}
])

const getColumnVisibility = (key) => {
  const col = columns.value.find((c) => c.key === key)
  return col ? col.visible : true
}

const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const loading = ref(true)
const defaultSort = ref({prop: 'createTime', order: 'descending'})

const open = ref(false)
const openDetail = ref(false)
const title = ref('')
const validateError = ref('')

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: null,
    modelName: null,
    status: null
  },
  form: {
    id: null,
    code: '',
    name: '',
    classifyId: null,
    classifyName: '',
    modelId: null,
    modelName: '',
    modelVersion: '',
    accessType: '',
    description: '',
    remark: '',
    inputParams: [],
    outputResult: null,
    timeoutSeconds: 60,
    retryCount: 0,
    maxRetryCount: 3,
    priority: 2,
    errorMessage: ''
  },
  rules: {
    name: [{required: true, message: '任务名称不能为空', trigger: 'blur'}],
    classifyId: [{required: true, message: '请选择模型分类', trigger: 'change'}],
    modelId: [{required: true, message: '请选择模型', trigger: 'change'}],
    modelVersion: [{required: true, message: '请选择版本', trigger: 'change'}],
    description: [{required: false, message: '描述不能为空', trigger: 'blur'}]
  }
})

const {queryParams, form, rules} = toRefs(data)

// ========== 方法 ==========

const props = defineProps({
  model: {
    type: Object,
    default: null,
    required: true,
  },
});

/** 格式化耗时 */
function formatDuration(duration) {
  if (!duration && duration !== 0) return "-";
  const ms = Number(duration);
  if (ms < 1000) return ms + "ms";
  const s = Math.floor(ms / 1000);
  const remainMs = ms % 1000;
  if (s < 60) return remainMs > 0 ? s + "s " + remainMs + "ms" : s + "s";
  const m = Math.floor(s / 60);
  const remainS = s % 60;
  return remainS > 0 ? m + "min " + remainS + "s" : m + "min";
}

/** 查询列表 */
function getList() {
  loading.value = true
  queryParams.value.modelId = props.model.id;
  listCalc(queryParams.value).then((response) => {
    calcList.value = response.data.rows
    total.value = response.data.total
    loading.value = false
  }).catch(() => {
    loading.value = false
  })
}

/** 重置搜索 */
function resetQuery() {
  proxy.resetForm('queryRef')
  queryParams.value.pageNum = 1
  getList()
}

/** 搜索 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 选择变化 */
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.id)
  single.value = selection.length !== 1
  multiple.value = !selection.length
}

/** 排序 */
function handleSortChange({prop, order}) {
  queryParams.value.orderByColumn = prop
  queryParams.value.isAsc = order === 'ascending'
  getList()
}

/** 取消 */
function cancel() {
  open.value = false
  reset()
}

/** 表单重置 */
function reset() {
  validateError.value = ''
  form.value = {
    id: null,
    code: '',
    name: '',
    classifyId: null,
    classifyName: '',
    modelId: null,
    modelName: '',
    modelVersion: '',
    accessType: '',
    calcType: null,
    description: '',
    remark: '',
    inputParams: [],
    outputResult: null,
    timeoutSeconds: 60,
    retryCount: 0,
    maxRetryCount: 3,
    priority: 2,
    errorMessage: ''
  }
  proxy.resetForm('calcRef')
}

/** 新增 */
function handleAdd() {
  reset()
  open.value = true
  title.value = '新增计算任务'
  handleModelChange();
}

/** 处理模型选择 - 选择模型后自动回填分类 */
function handleModelChange() {
  // 填充模型基本信息
  const model = props.model
  form.value.modelId = model.id
  form.value.modelName = model.name
  form.value.accessType = model.accessType
  form.value.calcType = accessTypeToCalcType(model.accessType)// 接入类型映射：API 字符串 -> 0，PYTHON 字符串 -> 1
  form.value.modelVersion = model.version || ''// 从模型本身获取版本号
  form.value.classifyName = model.classifyName || ''
  form.value.classifyId = model.classifyId || ''

  // 根据 accessType 选择不同的 API 获取 inputSchema
  // accessType: 'PYTHON' 或 'API'（大写）
  const isPythonModel = form.value.accessType === 'PYTHON'

  if (isPythonModel) {
    // Python 模型：使用 listModelFileResource 获取 inputSchema
    listModelFileResource({modelId: model.id}).then((res) => {
      const rows = res.data?.rows || []
      if (rows.length > 0) {
        const fileResource = rows[0]
        parseInputSchema(fileResource.inputSchema)
      } else {
        form.value.inputParams = []
      }
    }).catch(() => {
      form.value.inputParams = []
    })
  } else {
    // API 模型：使用 getModelConfigByModelId 获取 inputSchema
    getModelConfigByModelId(model.id).then((res) => {
      const config = res.data && res.data.rows ? res.data.rows[0] : (res.data || {})
      parseInputSchema(config.inputSchema)
    }).catch(() => {
      form.value.inputParams = []
    })
  }
}

/** 解析 inputSchema 生成参数表格行 */
function parseInputSchema(inputSchema) {
  if (!inputSchema) {
    form.value.inputParams = []
    return
  }

  let schemaObj
  try {
    schemaObj = typeof inputSchema === 'string' ? JSON.parse(inputSchema) : inputSchema
  } catch {
    form.value.inputParams = []
    return
  }

  // 校验 schema 结构
  if (!schemaObj || schemaObj.type !== 'object' || !schemaObj.properties) {
    form.value.inputParams = []
    return
  }

  // 生成参数表格行（参考 onlineTest.vue 的 fieldList computed）
  const props = schemaObj.properties
  const required = schemaObj.required || []

  form.value.inputParams = Object.keys(props).map((key) => {
    const p = props[key] || {}
    const rawType = p.type || 'string'
    // format: 'binary' 对应文件上传类型
    const isFile = p.format === 'binary'
    const displayType = isFile ? 'file' : rawType

    return {
      key: key,
      name: key,
      title: p.title || key,                      // 参数显示名称
      value: '',                                  // 参数值（用户填写）
      type: displayType,                          // 展示类型
      rawType: rawType,                           // 原始类型
      format: p.format || '',                     // 格式
      description: p.description || p.title || '', // 说明
      required: required.includes(key)            // 是否必填
    }
  })
}

/** 修改 */
function handleUpdate(row) {
  reset()
  const id = row.id
  getCalc(id).then((res) => {
    const data = res.data || {}
    form.value = {
      ...form.value,
      id: data.id,
      code: data.code,
      name: data.name,
      classifyId: data.classifyId,
      classifyName: data.classifyName || '',
      modelId: data.modelId,
      modelName: data.modelName || '',
      modelVersion: data.modelVersion || '',
      accessType: data.accessType || '',
      // 优先用后端已经存的 calcType，没有的话再按 accessType 推断一次（兼容历史数据）
      calcType: (data.calcType != null && data.calcType !== '')
          ? data.calcType
          : accessTypeToCalcType(data.accessType),
      description: data.description || '',
      remark: data.remark || '',
      timeoutSeconds: data.timeoutSeconds ?? 60,
      retryCount: data.retryCount ?? 0,
      maxRetryCount: data.maxRetryCount ?? 3,
      priority: data.priority ?? 2,
      errorMessage: data.errorMessage || '',
      outputResult: data.outputResult || null,
      // inputParams 解析：字符串的 JSON 格式统一转 params 数组
      inputParams: parseInputParams(data.inputParams)
    }
    title.value = '修改计算任务'
    open.value = true
  })
}

/** 接入方式(字符串) -> 计算类型(Integer)映射 */
function accessTypeToCalcType(accessType) {
  if (accessType == null) return null
  const s = String(accessType).toUpperCase()
  if (s === 'API') return 0
  if (s === 'PYTHON') return 1
  return null
}

/** 解析 inputParams：兼容字符串 JSON / 对象两种格式 */
function parseInputParams(raw) {
  if (!raw) return []
  if (Array.isArray(raw)) return raw
  try {
    if (typeof raw === 'string') {
      const obj = JSON.parse(raw)
      if (Array.isArray(obj)) return obj
      if (obj && Array.isArray(obj.params)) return obj.params
      return []
    }
    if (raw && typeof raw === 'object' && Array.isArray(raw.params)) {
      return raw.params
    }
  } catch (e) {
    console.warn('parse inputParams failed', raw, e)
  }
  return []
}

/** 详情 - 跳转到详情页 */
function handleDetail(row) {
  router.push({path: '/model/calc/detail', query: {id: row.id}})
}

/** 提交 */
async function submitForm() {
  validateError.value = ''

  // 1. 校验主表单
  try {
    await proxy.$refs['calcRef'].validate()
  } catch (e) {
    validateError.value = '请检查基础信息的必填项'
    return
  }

  // 2. 校验参数表格
  const errors = []
  if (form.value.inputParams && form.value.inputParams.length > 0) {
    form.value.inputParams.forEach(param => {
      if (param.required) {
        const value = param.value
        if (value === null || value === undefined || value === '') {
          errors.push(`参数“${param.title || param.name}”不能为空`)
        }
      }
    })
  }
  if (errors.length > 0) {
    validateError.value = errors.join('；')
    return
  }

  // 3. 提交数据
  const submitData = {...form.value}
  if (Array.isArray(submitData.inputParams)) {
    submitData.inputParams = JSON.stringify({params: submitData.inputParams})
  }
  if (!submitData.code) {
    const now = new Date()
    const ts = now.getFullYear().toString() +
        String(now.getMonth() + 1).padStart(2, '0') +
        String(now.getDate()).padStart(2, '0') +
        String(now.getHours()).padStart(2, '0') +
        String(now.getMinutes()).padStart(2, '0') +
        String(now.getSeconds()).padStart(2, '0')
    submitData.code = 'CALC_' + ts
  }

  try {
    if (form.value.id) {
      await updateCalc(submitData)
      proxy.$modal.msgSuccess('修改成功')
    } else {
      await addCalc(submitData)
      proxy.$modal.msgSuccess('提交成功')
    }
    open.value = false
    getList()
  } catch (e) {
    console.error('提交失败', e)
  }
}

/** 终止 */
function handleStop(row) {
  proxy.$modal.confirm(`确认终止任务"${row.name}"？`).then(() => {
    cancelCalc(row.id).then((res) => {
      const ok = res === true || res?.data === true || res?.code === 200
      if (ok || ok === undefined) {
        proxy.$modal.msgSuccess('已终止')
      } else {
        proxy.$modal.msgError(res?.msg || '终止失败，请稍后重试')
      }
      getList()
    })
  })
}

/** 重新计算 */
function handleRecalc(row) {
  proxy.$modal.confirm(`确认重新运行"${row.name}"？`).then(() => {
    executeCalc(row.id).then((res) => {
      const data = res?.data || res
      const executionNo = data?.executionNo ? `，执行批次号：${data.executionNo}` : ''
      proxy.$modal.msgSuccess('已提交重新运行' + executionNo)
      getList()
    })
  })
}

/** 删除 */
function handleDelete(row) {
  const _ids = row.id || ids.value
  proxy.$modal.confirm('是否确认删除计算任务编号为"' + _ids + '"的数据项？').then(() => {
    return delCalc(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {
  })
}

// ========== 初始化 ==========
getList()
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

:deep(.dialog .h2-title) {
  font-size: 16px;
  font-weight: 500;
  color: #333;
  margin: 8px 0;
  line-height: 1;
  display: flex;
  align-items: center;
}

:deep(.dialog .h2-title)::before {
  display: inline-block;
  content: "";
  width: 6px;
  height: 16px;
  border-radius: 3px;
  background: var(--el-color-primary);
  margin-right: 8px;
}

/* Style for read-only fields in the detail dialog */
:deep(.dialog .el-form[label-width="146px"] .el-form-item__content > div:not([class])) {
  line-height: 32px;
  background-color: #f5f7fa;
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  padding: 0 15px;
  color: #606266;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Style for disabled select in edit/add dialog */
:deep(.dialog .el-select) {
  .el-select__wrapper.is-disabled {
    cursor: default;
    background-color: #fcfcfc;
    --el-select-disabled-color: #333;

    .el-select__suffix {
      display: none;
    }
  }
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

.error-msg {
  margin-top: 10px;
  padding: 8px 12px;
  color: #f56c6c;
  font-size: 13px;
  background-color: #fef0f0;
  border-radius: 4px;
  display: flex;
  align-items: center;
  gap: 6px;
}
</style>
