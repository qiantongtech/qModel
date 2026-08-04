<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.

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
      <div class="output-section-title mb10">
        <el-icon style="color: #f56c6c"><WarningFilled /></el-icon>
        计算失败
      </div>
      <div class="error-box">
        <pre>{{ calcDetail.errorMessage || '暂无错误信息' }}</pre>
      </div>
    </div>

    <!-- 计算成功 -->
    <template v-else-if="calcDetail.status === 2">
      <div class="output-result-card">
        <div class="output-result-body">
          <!-- 左侧：JSON 结构树 -->
          <div class="json-section">
            <div class="section-header">
              <div class="h2-titles">JSON 结构树</div>
              <div class="btn-style">
                <el-button type="warning" plain @click="handleExportJson">
                  <i class="iconfont-mini icon-daochu mr5"></i>导出
                </el-button>
              </div>
            </div>
            <div class="json-block">
              <JsonTree :data="outputResult" />
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
                <p>请点击右上角添加您的可视化组件</p>
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
                      <el-icon class="widget-icon">
                        <Picture v-if="widget.type === 'base64'" />
                        <TrendCharts v-else />
                      </el-icon>
                      <span>{{ widget.title }}</span>
                    </div>
                    <div class="widget-actions">
                      <el-button link type="primary" size="small" @click="handleEditWidget(widget)">
                        <el-icon><Edit /></el-icon>
                      </el-button>
                      <el-button link type="danger" size="small" @click="handleDeleteWidget(widget)">
                        <el-icon><Delete /></el-icon>
                      </el-button>
                      <el-button link type="primary" size="small" @click="handleExportWidget(widget)">
                        <el-icon><Download /></el-icon>
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
                      :xValue="getFieldValue(widget.xField)"
                      :series="getLineSeries(widget)"
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

        <!-- 折线图配置 -->
        <template v-if="widgetForm.type === 'line'">
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="X 轴字段" prop="xField">
                <el-select
                  v-model="widgetForm.xField"
                  placeholder="请选择 X 轴字段"
                  clearable
                  filterable
                >
                  <el-option
                    v-for="item in allFieldOptions"
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
                <template #label>Y 轴字段</template>
                <el-button type="primary" plain style="margin-bottom: 15px" :disabled="widgetForm.yFields.length >= 5" @click="addYField">
                  新增 Y 轴
                </el-button>
                <el-table :data="widgetForm.yFields" class="y-fields-table" style="width: 100%">
                  <el-table-column label="图例名称" min-width="180">
                    <template #default="scope">
                      <el-input v-model="scope.row.tag" placeholder="请输入图例名称" />
                    </template>
                  </el-table-column>
                  <el-table-column label="字段绑定" min-width="260">
                    <template #default="scope">
                      <el-select
                        v-model="scope.row.field"
                        placeholder="请选择 Y 轴字段"
                        clearable
                        filterable
                      >
                        <el-option
                          v-for="item in allFieldOptions"
                          :key="item.path"
                          :label="`${item.path}（${item.type}）`"
                          :value="item.path"
                        />
                      </el-select>
                    </template>
                  </el-table-column>
                  <el-table-column label="操作" min-width="70" align="center">
                    <template #default="scope">
                      <el-button size="mini" type="danger" plain @click="deleteYField(scope.$index)">
                        删除
                      </el-button>
                    </template>
                  </el-table-column>
                </el-table>
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
import { WarningFilled, Picture, TrendCharts, Edit, Delete, Download, CirclePlus } from '@element-plus/icons-vue';
import { saveAs } from 'file-saver';
import JsonTree from './widgets/JsonTree.vue';
import Base64Widget from './widgets/Base64Widget.vue';
import LineChartWidget from './widgets/LineChartWidget.vue';
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

// 根据路径获取字段值
function getFieldValue(path) {
  if (!path || !hasOutputResult.value) return undefined;
  const keys = path.split('.');
  let value = outputResult.value;
  for (const key of keys) {
    if (value === null || value === undefined) return undefined;
    const arrayMatch = key.match(/^(.+)\[(\*|\d+)\]$/);
    if (arrayMatch) {
      const arrKey = arrayMatch[1];
      const index = arrayMatch[2] === '*' ? 0 : parseInt(arrayMatch[2], 10);
      value = value[arrKey];
      if (Array.isArray(value)) {
        value = value[index];
      }
    } else {
      value = value[key];
    }
  }
  return value;
}

// 组装折线图系列数据
function getLineSeries(widget) {
  if (!Array.isArray(widget.yFields)) return [];
  return widget.yFields.map((item) => ({
    name: item.tag || '',
    value: getFieldValue(item.field)
  }));
}

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
  { label: '折线图', value: 'line' }
];

const widgetList = ref([]);

// 根据计算任务ID加载可视化组件列表
function loadWidgetList() {
  const calcId = props.calcDetail.id;
  if (!calcId) return;
  listCalcWidgetByCalcId(calcId).then((response) => {
    widgetList.value = (response.data || []).map((item) => ({
      ...item,
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
  field: '',
  xField: '',
  yFields: [{ tag: '', field: '' }]
});

function validateYFields(rule, value, callback) {
  if (!Array.isArray(value) || value.length === 0) {
    callback(new Error('请至少配置一条 Y 轴数据'));
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
  if (widgetForm.value.type === 'line') {
    return {
      ...base,
      xField: [{ required: true, message: '请选择 X 轴字段', trigger: 'submit' }],
      yFields: [{ required: true, validator: validateYFields, trigger: 'submit' }]
    };
  }
  return base;
});

function resetWidgetForm() {
  widgetForm.value = {
    type: 'base64',
    title: '',
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
  let yFields = [{ tag: '', field: '' }];
  if (Array.isArray(widget.yFields) && widget.yFields.length > 0) {
    yFields = widget.yFields.map((item) => ({ tag: item.tag || '', field: item.field || '' }));
  } else if (widget.yField) {
    yFields = [{ tag: widget.title || '数据', field: widget.yField }];
  }
  widgetForm.value = {
    type: widget.type,
    title: widget.title,
    field: widget.field || '',
    xField: widget.xField || '',
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
  widgetForm.value.yFields = [{ tag: '', field: '' }];
  nextTick(() => {
    widgetFormRef.value?.clearValidate();
  });
}

function addYField() {
  if (widgetForm.value.yFields.length >= 5) {
    ElMessage.warning('最多支持 5 条 Y 轴数据');
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
    } else if (form.type === 'line') {
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
          if (Array.isArray(xValue) && yValue.length !== xValue.length) {
            errorMsg = `第 ${i + 1} 条 Y 轴与 X 轴数组长度不一致`;
            break;
          }
        }
      }
    }

    if (errorMsg) {
      ElMessage.warning(errorMsg);
      return;
    }

    const payload = {
      calcId: props.calcDetail.id,
      modelId: props.calcDetail.modelId,
      type: form.type,
      title: form.title,
      sort: isEdit.value ? undefined : widgetList.value.length + 1
    };
    if (form.type === 'base64') {
      payload.field = form.field;
    } else if (form.type === 'line') {
      payload.xField = form.xField;
      payload.yFields = form.yFields.map((item) => ({ tag: item.tag, field: item.field }));
    }

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
  () => {
    nextTick(() => {
      widgetList.value.forEach((widget) => {
        let errorMsg = '';
        if (widget.type === 'base64') {
          const value = getFieldValue(widget.field);
          const isStringArray =
            Array.isArray(value) && value.length > 0 && value.every((v) => typeof v === 'string');
          if (value === undefined) errorMsg = '绑定的字段已不存在';
          else if (typeof value !== 'string' && !isStringArray) {
            errorMsg = '绑定的字段类型已变化，需要是字符串或字符串数组';
          }
        } else if (widget.type === 'line') {
          const xValue = getFieldValue(widget.xField);
          if (!Array.isArray(widget.yFields) || widget.yFields.length === 0) {
            errorMsg = 'Y 轴配置已丢失';
          } else {
            for (let i = 0; i < widget.yFields.length; i++) {
              const item = widget.yFields[i];
              const yValue = getFieldValue(item.field);
              if (yValue === undefined) {
                errorMsg = `第 ${i + 1} 条 Y 轴字段已不存在`;
                break;
              }
              if (!Array.isArray(yValue)) {
                errorMsg = `第 ${i + 1} 条 Y 轴字段类型已变化，需要是数组`;
                break;
              }
              if (Array.isArray(xValue) && yValue.length !== xValue.length) {
                errorMsg = `第 ${i + 1} 条 Y 轴与 X 轴数组长度不一致`;
                break;
              }
            }
          }
        }
        widget.buildError = errorMsg;
      });
    });
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
  gap: 24px;
}

.json-section {
  width: 380px;
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
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
  color: #303133;

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

.output-error {
  .output-section-title {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 14px;
    font-weight: 500;
  }

  .error-box {
    background-color: #fef0f0;
    border: 1px solid #fde2e2;
    border-radius: 4px;
    padding: 12px 15px;

    pre {
      margin: 0;
      white-space: pre-wrap;
      word-break: break-all;
      color: #f56c6c;
      font-size: 13px;
      line-height: 1.6;
    }
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
</style>
