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
  <div class="output-result-wrapper">
    <!-- 计算失败 -->
    <div v-if="calcDetail.status === 3" class="output-error">
      <div class="error-box">
        <el-empty description="计算任务运行失败，暂无输出结果，请在执行记录中查看失败原因" :image-size="150" />
      </div>
    </div>

    <!-- 计算成功 -->
    <template v-else-if="calcDetail.status === 2">
      <div class="output-result-card">
        <div ref="bodyRef" class="output-result-body">
          <!-- 左侧：JSON 结构树 -->
          <div
            class="json-section"
            :style="{ width: `${leftWidth}px`, marginLeft: leftWidth == 0 ? '-15px' : '0px' }"
          >
            <div class="section-header">
              <div class="h2-titles">JSON 结构树</div>
              <div class="btn-style">
                <el-button type="warning" plain @click="handleExportJson">
                  <i class="iconfont-mini icon-daochu mr5"></i>导出
                </el-button>
              </div>
            </div>
            <div class="json-block">
              <vue-json-pretty
                :data="outputResult"
                :deep="2"
                :show-line="true"
                :show-icon="true"
                :editable="false"
                :virtual="false"
              />
            </div>
          </div>

          <!-- 拖拽栏 -->
          <div class="resize-bar" @mousedown="startResize">
            <div class="resize-handle-sx">
              <span class="zjsx"></span>
            </div>
          </div>

          <!-- 右侧：可视化配置 -->
          <div class="visual-section">
            <div class="section-header">
              <div class="h2-titles">可视化配置</div>
              <div class="btn-style">
                <el-button type="primary" plain @click="handleAddWidget">
                  <i class="iconfont-mini icon-xinzeng"></i>新增组件
                </el-button>
              </div>
            </div>
            <div class="visual-block">
              <!-- 空状态 -->
              <div v-if="widgetList.length === 0" class="empty-widgets">
                <el-icon class="empty-icon"><CirclePlus /></el-icon>
                <p>请点击右上角添加可视化配置</p>
              </div>

              <!-- 组件列表 -->
              <div v-else class="widget-list">
                <div
                  v-for="widget in widgetList"
                  :key="widget.id"
                  class="widget-card"
                  :class="{ 'widget-error': widget.buildError }"
                >
                  <div class="widget-header">
                    <div class="widget-title">
                      <!-- <el-icon class="widget-icon">
                        <Picture v-if="widget.type === 'base64'" />
                        <TrendCharts v-else />
                      </el-icon> -->
                      <span>{{ widget.title }}</span>
                    </div>
                    <div class="widget-actions">
                      <el-button link type="primary" size="small" @click="handleEditWidget(widget)">
                        <el-icon :size="14"><Edit /></el-icon>
                      </el-button>
                      <el-button link type="danger" size="small" @click="handleDeleteWidget(widget)">
                        <el-icon :size="14"><Delete /></el-icon>
                      </el-button>
                      <el-button link type="primary" size="small" @click="handleExportWidget(widget)">
                        <el-icon :size="14"><Download /></el-icon>
                      </el-button>
                    </div>
                  </div>
                  <div class="widget-content">
                    <Base64Widget
                      v-if="widget.type === 'base64'"
                      :ref="(el) => setWidgetRef(el, widget.id)"
                      :data="widget"
                      :value="getFieldValue(widget.field)"
                    />
                    <LineChartWidget
                      v-else-if="widget.type === 'line'"
                      :ref="(el) => setWidgetRef(el, widget.id)"
                      :data="widget"
                      :xValue="getChartData(widget).xValue"
                      :series="getChartData(widget).series"
                    />
                    <BarChartWidget
                      v-else-if="widget.type === 'bar'"
                      :ref="(el) => setWidgetRef(el, widget.id)"
                      :data="widget"
                      :xValue="getChartData(widget).xValue"
                      :series="getChartData(widget).series"
                    />
                    <PieChartWidget
                      v-else-if="widget.type === 'pie'"
                      :ref="(el) => setWidgetRef(el, widget.id)"
                      :data="widget"
                      :xValue="getChartData(widget).xValue"
                      :series="getChartData(widget).series"
                    />
                  </div>
                  <div v-if="widget.buildError" class="widget-error-tip">
                    {{ widget.buildError }}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </template>

    <!-- 其他状态：待执行/运行中等 -->
    <div v-else class="output-pending">
      <el-empty description="暂无输出结果" :image-size="60" />
    </div>

    <!-- 新增/编辑可视化组件弹窗 -->
    <el-dialog
      :title="dialogTitle"
      v-model="dialogOpen"
      width="900px"
      append-to="body"
      draggable
    >
      <template #header>
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ dialogTitle }}
        </span>
      </template>
      <el-form
        ref="widgetFormRef"
        :model="widgetForm"
        :rules="widgetRules"
        label-width="120px"
        :validate-on-rule-change="false"
        @submit.prevent
      >
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="组件显示标题" prop="title">
              <el-input
                v-model="widgetForm.title"
                placeholder="请输入组件显示标题"
                clearable
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="组件类型" prop="type">
              <el-select
                v-model="widgetForm.type"
                placeholder="请选择组件类型"
                @change="handleTypeChange"
              >
                <el-option
                  v-for="item in widgetTypeOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <!-- 图表类：数据形状 -->
        <template v-if="isChartType">
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="数据形状" prop="shape">
                <el-select
                  v-model="widgetForm.shape"
                  placeholder="请选择返回结果的形状"
                  @change="handleShapeChange"
                >
                  <el-option
                    v-for="item in shapeOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row v-if="widgetForm.shape !== 'parallel'" :gutter="20">
            <el-col :span="24">
              <el-form-item label="数据节点" prop="path">
                <el-select
                  v-model="widgetForm.path"
                  placeholder="请选择数据所在节点"
                  clearable
                  filterable
                >
                  <el-option
                    v-for="item in dataNodeOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </template>

        <!-- Base64 配置 -->
        <template v-if="widgetForm.type === 'base64'">
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="字段绑定" prop="field">
                <el-select
                  v-model="widgetForm.field"
                  placeholder="请选择 Base64 字符串字段"
                  clearable
                  filterable
                >
                  <el-option
                    v-for="item in base64FieldOptions"
                    :key="item.path"
                    :label="`${item.path}（${item.type}）`"
                    :value="item.path"
                  />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </template>

        <!-- 图表类：X / Y 字段绑定 -->
        <template v-if="isChartType">
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item :label="isSeriesMap ? 'X 轴字段（可选）' : 'X 轴字段'" prop="xField">
                <el-select
                  v-model="widgetForm.xField"
                  :placeholder="isSeriesMap ? '留空则使用序号' : '请选择 X 轴字段'"
                  clearable
                  filterable
                >
                  <el-option
                    v-for="item in bindingFieldOptions"
                    :key="item.path"
                    :label="`${item.path}（${item.type}）`"
                    :value="item.path"
                  />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="Y 轴字段" prop="yFields">
                <el-button
                  type="primary"
                  plain
                  style="margin-bottom: 15px"
                  :disabled="widgetForm.yFields.length >= maxYFields"
                  @click="addYField"
                >
                  新增 Y 轴
                </el-button>
                <el-table :data="widgetForm.yFields" class="y-fields-table" style="width: 100%">
                  <el-table-column label="图例名称" min-width="180">
                    <template #default="scope">
                      <el-input v-model="scope.row.tag" placeholder="请输入图例名称" />
                    </template>
                  </el-table-column>
                  <el-table-column :label="widgetForm.shape === 'seriesMap' ? '系列字段' : '字段绑定'" min-width="260">
                    <template #default="scope">
                      <el-select
                        v-model="scope.row.field"
                        :placeholder="widgetForm.shape === 'seriesMap' ? '请选择系列字段' : '请选择 Y 轴字段'"
                        clearable
                        filterable
                      >
                        <el-option
                          v-for="item in bindingFieldOptions"
                          :key="item.path"
                          :label="`${item.path}（${item.type}）`"
                          :value="item.path"
                        />
                      </el-select>
                    </template>
                  </el-table-column>
                  <el-table-column label="操作" min-width="70" align="center">
                    <template #default="scope">
                      <el-button
                          link
                          type="danger"
                          icon="Delete"
                          @click="deleteYField(scope.$index)"
                      >删除</el-button>
                    </template>
                  </el-table-column>
                </el-table>
                <div v-if="isPie" class="form-tip">饼图仅支持 1 条 Y 轴数据，X 轴字段作为分类名称</div>
              </el-form-item>
            </el-col>
          </el-row>
        </template>
      </el-form>

      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancelWidget">取 消</el-button>
          <el-button type="primary" @click="submitWidget">确 定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="OutputResult">
import { ref, computed, watch, nextTick } from 'vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { WarningFilled, Edit, Delete, Download, CirclePlus } from '@element-plus/icons-vue';
import { saveAs } from 'file-saver';
import VueJsonPretty from 'vue-json-pretty';
import 'vue-json-pretty/lib/styles.css';
import Base64Widget from './widgets/Base64Widget.vue';
import LineChartWidget from './widgets/LineChartWidget.vue';
import BarChartWidget from './widgets/BarChartWidget.vue';
import PieChartWidget from './widgets/PieChartWidget.vue';
import {
  resolvePath,
  resolveWidgetData,
  parseWidgetConfig,
  buildWidgetConfig
} from './widgets/chartData';
import { listCalcWidgetByCalcId, addCalcWidget, updateCalcWidget, delCalcWidget } from '@/api/model/calcWidget/calcWidget';

const mockJsonData = {
  input_water_level: 0,
  predict_flow: 0,
  fit_info: {
    a: 7.02,
    H0: 0.0145,
    b: 1.8815,
    r2: 1
  },
  formula: 'Q = 7.02 * (H - 0.0145)^1.8815',
  image_base64: 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMzAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzQwOWVmZiIvPjx0ZXh0IHg9IjE1MCIgeT0iMTEwIiBmb250LXNpemU9IjI0IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBkeT0iLjNlbSIgZmlsbD0id2hpdGUiPuWbvueJh+WKoOi9veaWh+aho+WbvjwvdGV4dD48L3N2Zz4=',
  chart_data: {
    time: ['09:00', '09:05', '09:10', '09:15', '09:20', '09:25'],
    value: [12.4, 18.2, 25.6, 68.5, 42.1, 92.3],
    value1: [15.4, 12.2, 2.6, 8.5, 51.1, 90.3]
  }
};

const props = defineProps({
  calcDetail: {
    type: Object,
    default: () => ({})
  }
});

// ==================== 输出结果数据 ====================
function parseOutputResult(value) {
  if (!value) return null;
  if (typeof value === 'string') {
    try {
      return JSON.parse(value);
    } catch {
      return null;
    }
  }
  return value;
}

const outputResult = computed(() => {
  // 优先使用计算任务的真实输出结果，无真实数据时回退到测试数据
  const realResult = parseOutputResult(props.calcDetail.outputResult);
  return realResult || mockJsonData;
});

const hasOutputResult = computed(() => outputResult.value !== null && outputResult.value !== undefined);

const outputJsonString = computed(() => {
  if (!hasOutputResult.value) return '{}';
  return JSON.stringify(outputResult.value, null, 2);
});

// ==================== 字段路径提取 ====================
function extractFieldPaths(obj, prefix = '', paths = []) {
  if (obj === null || obj === undefined) return paths;

  if (Array.isArray(obj)) {
    // 非根节点的数组本身也作为一个路径
    if (prefix) {
      paths.push({ path: prefix, type: 'array', value: obj });
    }
    if (obj.length > 0 && typeof obj[0] === 'object' && obj[0] !== null) {
      Object.keys(obj[0]).forEach((key) => {
        extractFieldPaths(obj[0][key], prefix ? `${prefix}[*].${key}` : `[*].${key}`, paths);
      });
    }
    return paths;
  }

  if (typeof obj === 'object') {
    // 非根节点的对象本身也作为一个路径
    if (prefix) {
      paths.push({ path: prefix, type: 'object', value: obj });
    }
    Object.keys(obj).forEach((key) => {
      const path = prefix ? `${prefix}.${key}` : key;
      const value = obj[key];
      if (value !== null && typeof value === 'object') {
        extractFieldPaths(value, path, paths);
      } else {
        paths.push({ path, type: typeof value, value });
      }
    });
    return paths;
  }

  paths.push({ path: prefix || 'root', type: typeof obj, value: obj });
  return paths;
}

const allFieldOptions = computed(() => {
  if (!hasOutputResult.value) return [];
  return extractFieldPaths(outputResult.value);
});

const base64FieldOptions = computed(() => {
  return allFieldOptions.value.filter((item) => {
    if (item.type === 'string') return true;
    if (
      item.type === 'array' &&
      Array.isArray(item.value) &&
      item.value.length > 0 &&
      typeof item.value[0] === 'string'
    ) {
      return true;
    }
    return false;
  });
});

// 根据路径获取字段值，'$' 或空路径表示根节点
function getFieldValue(path) {
  if (!path || !hasOutputResult.value) return undefined;
  return resolvePath(outputResult.value, path);
}

// 图表组件统一入口：按配置把返回结果解析成 { xValue, series }
function getChartData(widget) {
  return resolveWidgetData(widget, outputResult.value);
}

// 数据节点选项：按形状只列数组 / 对象节点，'$' 表示返回结果根节点
const dataNodeOptions = computed(() => {
  const shape = widgetForm.value?.shape || 'parallel';
  let options = [];
  if (shape === 'records') {
    options = allFieldOptions.value
      .filter((item) => item.type === 'array')
      .map((item) => ({ value: item.path, label: `${item.path}（数组）` }));
  } else if (shape === 'seriesMap') {
    options = allFieldOptions.value
      .filter((item) => item.type === 'object')
      .map((item) => ({ value: item.path, label: `${item.path}（对象）` }));
  }
  const root = outputResult.value;
  const rootMatch =
    shape === 'records'
      ? Array.isArray(root)
      : shape === 'seriesMap'
        ? root && typeof root === 'object' && !Array.isArray(root)
        : false;
  if (rootMatch) options.unshift({ value: '$', label: '返回结果根节点（$）' });
  return options;
});

// X / Y 字段选项：并行数组用全局路径，其余按数据节点内部字段生成
const bindingFieldOptions = computed(() => {
  const shape = widgetForm.value?.shape || 'parallel';
  if (shape === 'parallel') return allFieldOptions.value;
  const node = getFieldValue(widgetForm.value?.path);
  if (shape === 'records') {
    const first = Array.isArray(node) ? node[0] : null;
    if (!first || typeof first !== 'object' || Array.isArray(first)) return [];
    return Object.keys(first).map((key) => ({
      path: key,
      type: Array.isArray(first[key]) ? 'array' : typeof first[key]
    }));
  }
  if (shape === 'seriesMap') {
    if (!node || typeof node !== 'object' || Array.isArray(node)) return [];
    return Object.keys(node)
      .filter((key) => Array.isArray(node[key]))
      .map((key) => ({ path: key, type: 'array' }));
  }
  return allFieldOptions.value;
});

// ==================== JSON 导出 ====================
function handleExportJson() {
  if (!hasOutputResult.value) {
    ElMessage.warning('暂无输出结果可导出');
    return;
  }
  const blob = new Blob([outputJsonString.value], { type: 'application/json;charset=utf-8' });
  const fileName = `output-result-${props.calcDetail.id || Date.now()}.json`;
  saveAs(blob, fileName);
}

// ==================== 组件配置 ====================
const widgetTypeOptions = [
  { label: 'Base64 图片', value: 'base64' },
  { label: '折线图', value: 'line' },
  { label: '柱形图', value: 'bar' },
  { label: '饼图', value: 'pie' }
];

const CHART_TYPES = ['line', 'bar', 'pie'];
const CHART_SHAPES = [
  { label: '并行数组（X / Y 各自独立数组）', value: 'parallel' },
  { label: '对象数组（一行一条记录）', value: 'records' },
  { label: '键值数组（对象内多个数组）', value: 'seriesMap' }
];
const isChartType = computed(() => CHART_TYPES.includes(widgetForm.value.type));
const isPie = computed(() => widgetForm.value.type === 'pie');
const isSeriesMap = computed(() => widgetForm.value.shape === 'seriesMap');
const maxYFields = computed(() => (isPie.value ? 1 : 5));
const shapeOptions = computed(() =>
  isPie.value
    ? CHART_SHAPES.filter((item) => item.value !== 'seriesMap')
    : CHART_SHAPES
);

const widgetList = ref([]);

// ==================== 左右侧拖拽宽度 ====================
const leftWidth = ref(380);
const isResizing = ref(false);
const bodyRef = ref(null);
let startX = 0;
let containerWidth = 0;
const LEFT_MIN_WIDTH = 200;
const RIGHT_MIN_WIDTH = 400;
const RESIZE_BAR_WIDTH = 15;

const startResize = (event) => {
  isResizing.value = true;
  startX = event.clientX;
  containerWidth = bodyRef.value?.offsetWidth || 0;
  document.addEventListener('mousemove', updateResize);
  document.addEventListener('mouseup', stopResize);
};

const stopResize = () => {
  isResizing.value = false;
  document.removeEventListener('mousemove', updateResize);
  document.removeEventListener('mouseup', stopResize);
};

const updateResize = (event) => {
  if (isResizing.value) {
    const delta = event.clientX - startX;
    let newWidth = leftWidth.value + delta;
    if (newWidth < LEFT_MIN_WIDTH) newWidth = LEFT_MIN_WIDTH;
    if (containerWidth > 0 && newWidth > containerWidth - RESIZE_BAR_WIDTH - RIGHT_MIN_WIDTH) {
      newWidth = containerWidth - RESIZE_BAR_WIDTH - RIGHT_MIN_WIDTH;
    }
    leftWidth.value = newWidth;
    startX = event.clientX;
  }
};

// 根据计算任务ID加载可视化组件列表
function loadWidgetList() {
  const calcId = props.calcDetail.id;
  if (!calcId) return;
  listCalcWidgetByCalcId(calcId).then((response) => {
    const list = response.data || [];
    list.sort((a, b) => {
      return (b.createTime || '').localeCompare(a.createTime || '');
    });
    // config 原串优先，后端平铺字段作为历史数据兜底
    widgetList.value = (list || []).map((item) => ({
      ...item,
      ...parseWidgetConfig(item),
      buildError: ''
    }));
  });
}

const dialogOpen = ref(false);
const dialogTitle = ref('新增可视化组件');
const isEdit = ref(false);
const editWidgetId = ref(null);
const widgetFormRef = ref(null);

const widgetForm = ref({
  type: 'base64',
  title: '',
  shape: 'parallel',
  path: '',
  field: '',
  xField: '',
  yFields: [{ tag: '', field: '' }]
});

function validateYFields(rule, value, callback) {
  if (!Array.isArray(value) || value.length === 0) {
    callback(new Error('请至少配置一条 Y 轴数据'));
    return;
  }
  if (isPie.value && value.length > 1) {
    callback(new Error('饼图仅支持 1 条 Y 轴数据'));
    return;
  }
  for (let i = 0; i < value.length; i++) {
    const item = value[i];
    if (!item.tag || !item.tag.trim()) {
      callback(new Error(`第 ${i + 1} 条 Y 轴的图例名称不能为空`));
      return;
    }
    if (!item.field) {
      callback(new Error(`第 ${i + 1} 条 Y 轴的字段绑定不能为空`));
      return;
    }
  }
  callback();
}

const widgetRules = computed(() => {
  const base = {
    type: [{ required: true, message: '请选择组件类型', trigger: 'submit' }],
    title: [{ required: true, message: '请输入组件显示标题', trigger: 'submit' }]
  };
  if (widgetForm.value.type === 'base64') {
    return {
      ...base,
      field: [{ required: true, message: '请选择字段绑定', trigger: 'submit' }]
    };
  }
  if (isChartType.value) {
    const rules = {
      ...base,
      shape: [{ required: true, message: '请选择数据形状', trigger: 'submit' }],
      yFields: [{ required: true, validator: validateYFields, trigger: 'submit' }]
    };
    if (widgetForm.value.shape !== 'parallel') {
      rules.path = [{ required: true, message: '请选择数据节点', trigger: 'submit' }];
    }
    if (!isSeriesMap.value) {
      rules.xField = [{ required: true, message: '请选择 X 轴字段', trigger: 'submit' }];
    }
    return rules;
  }
  return base;
});

function resetWidgetForm() {
  widgetForm.value = {
    type: 'base64',
    title: '',
    shape: 'parallel',
    path: '',
    field: '',
    xField: '',
    yFields: [{ tag: '', field: '' }]
  };
  nextTick(() => {
    widgetFormRef.value?.clearValidate();
  });
}

function handleAddWidget() {
  isEdit.value = false;
  editWidgetId.value = null;
  dialogTitle.value = '新增可视化组件';
  resetWidgetForm();
  dialogOpen.value = true;
}

function handleEditWidget(widget) {
  isEdit.value = true;
  editWidgetId.value = widget.id;
  dialogTitle.value = '编辑可视化组件';
  const config = parseWidgetConfig(widget);
  let yFields = config.yFields.length > 0
    ? config.yFields.map((item) => ({ tag: item.tag || '', field: item.field || '' }))
    : [{ tag: '', field: '' }];
  if (yFields.length === 1 && !yFields[0].field && widget.yField) {
    yFields = [{ tag: widget.title || '数据', field: widget.yField }];
  }
  if (widget.type === 'pie' && yFields.length > 1) {
    yFields = yFields.slice(0, 1);
  }
  widgetForm.value = {
    type: widget.type,
    title: widget.title,
    shape: config.shape,
    path: config.path,
    field: config.field,
    xField: config.xField,
    yFields
  };
  dialogOpen.value = true;
}

function handleDeleteWidget(widget) {
  ElMessageBox.confirm(`确定删除组件「${widget.title}」吗？`, '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    delCalcWidget(widget.id).then(() => {
      loadWidgetList();
      ElMessage.success('删除成功');
    });
  });
}

function handleTypeChange() {
  widgetForm.value.field = '';
  widgetForm.value.xField = '';
  widgetForm.value.path = '';
  widgetForm.value.shape = 'parallel';
  widgetForm.value.yFields = [{ tag: '', field: '' }];
  nextTick(() => {
    widgetFormRef.value?.clearValidate();
  });
}

function handleShapeChange() {
  widgetForm.value.path = '';
  widgetForm.value.xField = '';
  widgetForm.value.yFields = [{ tag: '', field: '' }];
  nextTick(() => {
    widgetFormRef.value?.clearValidate();
  });
}

function addYField() {
  if (widgetForm.value.yFields.length >= maxYFields.value) {
    ElMessage.warning(isPie.value ? '饼图仅支持 1 条 Y 轴数据' : '最多支持 5 条 Y 轴数据');
    return;
  }
  widgetForm.value.yFields.push({ tag: '', field: '' });
}

function deleteYField(index) {
  widgetForm.value.yFields.splice(index, 1);
  if (widgetForm.value.yFields.length === 0) {
    widgetForm.value.yFields.push({ tag: '', field: '' });
  }
}

function cancelWidget() {
  dialogOpen.value = false;
}

// 校验 Base64 图片是否可以正常解析
function normalizeBase64Value(val) {
  if (!val || typeof val !== 'string') return '';
  const v = val.trim();
  return v.startsWith('data:image') ? v : `data:image/png;base64,${v}`;
}

function validateBase64Image(src) {
  return new Promise((resolve) => {
    if (!src || !src.startsWith('data:image')) {
      resolve(false);
      return;
    }
    const img = new Image();
    img.onload = () => resolve(true);
    img.onerror = () => resolve(false);
    img.src = src;
  });
}

async function validateBase64Images(value) {
  const list = [];
  if (typeof value === 'string') list.push(value);
  else if (Array.isArray(value)) list.push(...value);
  for (const item of list) {
    const ok = await validateBase64Image(normalizeBase64Value(item));
    if (!ok) return false;
  }
  return true;
}

// 构建并校验组件
function submitWidget() {
  widgetFormRef.value?.validate(async (valid) => {
    if (!valid) return;

    const form = widgetForm.value;
    let errorMsg = '';

    if (form.type === 'base64') {
      const value = getFieldValue(form.field);
      const isStringArray =
        Array.isArray(value) && value.length > 0 && value.every((v) => typeof v === 'string');
      if (value === undefined) {
        errorMsg = '绑定的字段不存在';
      } else if (typeof value !== 'string' && !isStringArray) {
        errorMsg = 'Base64 组件需要绑定字符串或字符串数组类型的字段';
      } else {
        const validImage = await validateBase64Images(value);
        if (!validImage) errorMsg = '绑定的字段无法解析为图片，请检查 Base64 数据';
      }
    } else if (isChartType.value) {
      const shape = form.shape;
      if (isPie.value && shape === 'seriesMap') {
        errorMsg = '饼图不支持键值数组';
      } else if (isPie.value && form.yFields.length > 1) {
        errorMsg = '饼图仅支持 1 条 Y 轴数据';
      } else if (shape === 'records') {
        const rows = getFieldValue(form.path);
        if (!Array.isArray(rows)) {
          errorMsg = '数据节点需要是对象数组';
        } else if (rows.length === 0) {
          errorMsg = '数据节点中没有记录';
        } else {
          for (let i = 0; i < form.yFields.length; i++) {
            const field = form.yFields[i].field;
            const exists = rows.some((row) => row && typeof row === 'object' && field in row);
            if (!exists) {
              errorMsg = `第 ${i + 1} 条 Y 轴绑定的列「${field}」不存在`;
              break;
            }
          }
        }
      } else if (shape === 'seriesMap') {
        const node = getFieldValue(form.path);
        if (!node || typeof node !== 'object' || Array.isArray(node)) {
          errorMsg = '数据节点需要是对象';
        } else {
          for (let i = 0; i < form.yFields.length; i++) {
            const field = form.yFields[i].field;
            if (!Array.isArray(node[field])) {
              errorMsg = `第 ${i + 1} 条系列「${field}」需要是数组`;
              break;
            }
          }
          if (!errorMsg && form.xField && !Array.isArray(node[form.xField])) {
            errorMsg = 'X 轴字段需要是数组类型';
          }
        }
      } else {
        const xValue = getFieldValue(form.xField);
        if (xValue !== undefined && !Array.isArray(xValue)) {
          errorMsg = 'X 轴字段需要是数组类型';
        }
        if (!errorMsg) {
          for (let i = 0; i < form.yFields.length; i++) {
            const item = form.yFields[i];
            const yValue = getFieldValue(item.field);
            if (yValue === undefined) {
              errorMsg = `第 ${i + 1} 条 Y 轴字段不存在`;
              break;
            }
            if (!Array.isArray(yValue)) {
              errorMsg = `第 ${i + 1} 条 Y 轴字段需要是数组类型`;
              break;
            }
            if (Array.isArray(xValue) && yValue.length > xValue.length) {
              errorMsg = `第 ${i + 1} 条 Y 轴数组长度不能大于 X 轴数组长度`;
              break;
            }
          }
        }
      }
    }

    if (errorMsg) {
      ElMessage.warning(errorMsg);
      return;
    }

    const config = buildWidgetConfig(form);
    const payload = {
      calcId: props.calcDetail.id,
      modelId: props.calcDetail.modelId,
      type: form.type,
      title: form.title,
      sort: isEdit.value ? undefined : widgetList.value.length + 1,
      // 平铺字段保留，兼容后端历史数据与其它调用方
      ...(form.type === 'base64'
        ? { field: form.field }
        : {
            xField: form.xField || '',
            yFields: form.yFields.map((item) => ({ tag: item.tag, field: item.field }))
          }),
      // 新配置整体透传，后续新增图表类型不必再改后端
      config: JSON.stringify(config)
    };

    const saveAction = isEdit.value
      ? updateCalcWidget({ id: editWidgetId.value, ...payload })
      : addCalcWidget(payload);

    saveAction.then(() => {
      loadWidgetList();
      dialogOpen.value = false;
      ElMessage.success('保存成功');
    });
  });
}

// ==================== 组件导出 ====================
const widgetRefs = new Map();

function setWidgetRef(el, id) {
  if (el) {
    widgetRefs.set(id, el);
  }
}

function handleExportWidget(widget) {
  nextTick(() => {
    const target = widgetRefs.get(widget.id);
    if (target && typeof target.exportImage === 'function') {
      target.exportImage();
    } else {
      ElMessage.warning('该组件暂不支持导出');
    }
  });
}

// 当输出结果变化时，校验现有组件是否仍然合法
watch(
  () => props.calcDetail.outputResult,
  async () => {
    await nextTick();
    for (const widget of widgetList.value) {
      let errorMsg = '';
      if (widget.type === 'base64') {
        const value = getFieldValue(widget.field);
        const isStringArray =
          Array.isArray(value) && value.length > 0 && value.every((v) => typeof v === 'string');
        if (value === undefined) errorMsg = '绑定的字段已不存在';
        else if (typeof value !== 'string' && !isStringArray) {
          errorMsg = '绑定的字段类型已变化，需要是字符串或字符串数组';
        } else {
          const validImage = await validateBase64Images(value);
          if (!validImage) errorMsg = '图片数据无法解析，请检查 Base64 数据';
        }
      } else if (CHART_TYPES.includes(widget.type)) {
        const shape = widget.shape || 'parallel';
        const yFields = Array.isArray(widget.yFields) ? widget.yFields : [];
        if (yFields.length === 0) {
          errorMsg = 'Y 轴配置已丢失';
        } else if (shape === 'records') {
          const rows = getFieldValue(widget.path);
          if (!Array.isArray(rows)) {
            errorMsg = '绑定的数据节点已不存在或类型已变化';
          } else {
            const missing = yFields.find((item) =>
              !rows.some((row) => row && typeof row === 'object' && item.field in row)
            );
            if (missing) errorMsg = `绑定的列「${missing.field}」已不存在`;
          }
        } else if (shape === 'seriesMap') {
          const node = getFieldValue(widget.path);
          if (!node || typeof node !== 'object' || Array.isArray(node)) {
            errorMsg = '绑定的数据节点已不存在或类型已变化';
          } else {
            const missing = yFields.find((item) => !Array.isArray(node[item.field]));
            if (missing) errorMsg = `系列「${missing.field}」已不存在或类型已变化`;
          }
        } else {
          const xValue = getFieldValue(widget.xField);
          for (let i = 0; i < yFields.length; i++) {
            const item = yFields[i];
            const yValue = getFieldValue(item.field);
            if (yValue === undefined) {
              errorMsg = `第 ${i + 1} 条 Y 轴字段已不存在`;
              break;
            }
            if (!Array.isArray(yValue)) {
              errorMsg = `第 ${i + 1} 条 Y 轴字段类型已变化，需要是数组`;
              break;
            }
            if (Array.isArray(xValue) && yValue.length > xValue.length) {
              errorMsg = `第 ${i + 1} 条 Y 轴数组长度不能大于 X 轴数组长度`;
              break;
            }
          }
        }
      }
      widget.buildError = errorMsg;
    }
  },
  { immediate: true, deep: true }
);

// 计算任务ID变更时加载可视化组件列表
watch(
  () => props.calcDetail.id,
  (calcId) => {
    if (calcId && props.calcDetail.status === 2) {
      loadWidgetList();
    }
  },
  { immediate: true }
);
</script>

<style lang="scss" scoped>
.output-result-wrapper {
  width: 100%;
}

.output-result-card {
  min-height: 500px;
  display: flex;
  flex-direction: column;
}

.output-result-body {
  flex: 1;
  display: flex;
}

.json-section {
  width: 380px;
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.visual-section {
  flex: 1;
  display: flex;
  flex-direction: column;
  min-width: 0;
}

.section-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 8px;
}

.h2-titles {
  font-size: 16px;
  color: rgba(0, 0, 0, 0.85);
  display: flex;
  align-items: center;
  font-weight: 500;
  margin: 8px 0;
}

.h2-titles::before {
  display: inline-block;
  content: "";
  width: 6px;
  height: 16px;
  border-radius: 3px;
  background: var(--el-color-primary);
  margin-right: 8px;
}

.json-block {
  flex: 1;
  border: 1px solid #e2e8f0;
  border-radius: 6px;
  background: #fff;
  padding: 16px;
  overflow: auto;
  min-height: 640px;
  max-height: 640px;
}

.visual-block {
  flex: 1;
  display: flex;
  flex-direction: column;
  min-height: 640px;
  max-height: 640px;
  overflow: auto;
}

.empty-widgets {
  flex: 1;
  min-height: 300px;
  border: 2px dashed #e2e8f0;
  border-radius: 8px;
  background: rgba(248, 250, 252, 0.5);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #94a3b8;
  gap: 12px;

  .empty-icon {
    font-size: 32px;
    color: #cbd5e1;
  }

  p {
    margin: 0;
    font-size: 13px;
  }
}

.widget-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.widget-card {
  border: 1px solid #ebeef5;
  border-radius: 6px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
  overflow: hidden;
  background: #fff;

  &.widget-error {
    border-color: #f56c6c;
  }
}

.widget-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 12px;
  background: #f5f7fa;
  border-bottom: 1px solid #ebeef5;
}

.widget-title {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  font-size: 14px;
  font-weight: 600;
  color: rgba(0, 0, 0, 0.65);

  .widget-icon {
    color: #409eff;
    font-size: 16px;
  }
}

.widget-actions {
  display: inline-flex;
  align-items: center;
  gap: 4px;
}

.widget-content {
  padding: 12px;
}

.widget-error-tip {
  padding: 8px 12px;
  background: #fef0f0;
  color: #f56c6c;
  font-size: 12px;
  border-top: 1px solid #fde2e2;
}

.form-tip {
  margin-top: 8px;
  font-size: 12px;
  color: #909399;
  line-height: 1.5;
}

.output-error {
  min-height: calc(100vh - 390px);
  display: flex;
  align-items: center;
  justify-content: center;

  .output-section-title {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 14px;
    font-weight: 500;
  }

  .error-box {
    width: 100%;
    border-radius: 4px;
    padding: 12px 15px;
    max-height: 300px;
    overflow-y: auto;
  }
}

.output-pending {
  padding: 40px 0;
}

:deep(.el-empty) {
  --el-empty-padding: 20px 0 !important;
}

.y-fields-table {
  :deep(.el-input) {
    width: 100%;
  }
  :deep(.el-select) {
    width: 100%;
  }
}

.resize-bar {
  width: 15px;
  cursor: ew-resize;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.resize-handle-sx {
  width: 15px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}

.zjsx {
  display: inline-block;
  width: 5px;
  height: 50px;
  border-left: 1px solid #ccc;
  border-right: 1px solid #ccc;
}

</style>
