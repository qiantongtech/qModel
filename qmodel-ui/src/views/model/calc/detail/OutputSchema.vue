<!--
  Copyright (c) 2026 Jiangsu Qiantong Technology Co., Ltd.
   *
  Software Name: qModel Algorithm Model Platform (Commercial Edition)
-->

<template>
  <div class="output-schema-wrapper">
    <!-- 计算失败 -->
    <div v-if="calcDetail.status === 3" class="output-error">
      <div class="error-box">
        <el-empty description="计算任务运行失败，暂无输出结果，请在执行记录中查看失败原因" :image-size="150" />
      </div>
    </div>

    <!-- 计算成功 -->
    <template v-else-if="calcDetail.status === 2">
      <div class="output-schema-card">
        <div ref="bodyRef" class="output-schema-body">
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

          <!-- 右侧：结果定义 -->
          <div class="definition-section">
            <div class="section-header">
              <div class="h2-titles">结果定义</div>
            </div>
            <div class="definition-block">
              <el-table :data="outputFields" stripe style="width: 100%" height="640">
                <el-table-column prop="field" label="字段" min-width="150" :show-overflow-tooltip="{ effect: 'light' }" />
                <el-table-column prop="name" label="名称" min-width="120">
                  <template #default="scope">
                    <span>{{ scope.row.name || '-' }}</span>
                  </template>
                </el-table-column>
                <el-table-column prop="example" label="示例" min-width="120">
                  <template #default="scope">
                    <span>{{ scope.row.example || '-' }}</span>
                  </template>
                </el-table-column>
                <el-table-column prop="description" label="说明" min-width="150">
                  <template #default="scope">
                    <span>{{ scope.row.description || '-' }}</span>
                  </template>
                </el-table-column>
                <template #empty>
                  <el-empty :image-size="60" description="暂无结果定义" />
                </template>
              </el-table>
            </div>
          </div>
        </div>
      </div>
    </template>

    <!-- 其他状态 -->
    <div v-else class="output-pending">
      <el-empty description="暂无输出结果" :image-size="60" />
    </div>
  </div>
</template>

<script setup name="OutputSchema">
import { ref, computed, watch, nextTick } from 'vue';
import { ElMessage } from 'element-plus';
import { saveAs } from 'file-saver';
import VueJsonPretty from 'vue-json-pretty';
import 'vue-json-pretty/lib/styles.css';

const props = defineProps({
  calcDetail: {
    type: Object,
    default: () => ({})
  }
});

// ==================== 数据处理 ====================
function parseJson(value) {
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
  return parseJson(props.calcDetail.outputResult) || {};
});

const outputFields = ref([]);

const hasOutputResult = computed(() => {
  const res = outputResult.value;
  return res && Object.keys(res).length > 0;
});

const outputJsonString = computed(() => {
  if (!hasOutputResult.value) return '{}';
  return JSON.stringify(outputResult.value, null, 2);
});

// 初始化回填
watch(() => props.calcDetail.outputSchema, (val) => {
  if (val) {
    try {
      const parsed = JSON.parse(val);
      if (Array.isArray(parsed)) {
        outputFields.value = parsed;
      }
    } catch (e) {
      outputFields.value = [];
    }
  } else {
    outputFields.value = [];
  }
}, { immediate: true });

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
</script>

<style lang="scss" scoped>
.output-schema-wrapper {
  width: 100%;
}

.output-schema-card {
  min-height: 500px;
  display: flex;
  flex-direction: column;
}

.output-schema-body {
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

.definition-section {
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

.definition-block {
  flex: 1;
  border: 1px solid #e2e8f0;
  border-radius: 6px;
  background: #fff;
  overflow: hidden;
  min-height: 640px;
  max-height: 640px;
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

.output-error {
  min-height: calc(100vh - 390px);
  display: flex;
  align-items: center;
  justify-content: center;
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

:deep(.el-table) {
  --el-table-border-color: #e2e8f0;
}

.mr5 {
  margin-right: 5px;
}
</style>
