<template>
  <div class="build-log">
    <div class="build-status-header">
      <div class="status-info">
        <div class="h2-titles">构建状态 </div>
        <dict-tag :options="build_status" :value="buildStatus" class="con-value access-tag" />
      </div>

    </div>

    <div class="log-content">
      <div class="h2-titles">构建日志</div>
      <div ref="logRef" class="log-body">
        <div v-for="(line, index) in logs" :key="index" :class="['log-line', line.type]">
          <span class="log-time">{{ line.time }}</span>
          <span class="log-content-text">{{ line.content }}</span>
        </div>
        <div v-if="logs.length === 0" class="log-empty">
          > 暂无构建日志<br/>
          > 构建日志将展示在此处
        </div>
      </div>
    </div>

<!--    <div class="build-info">-->
<!--      <div class="h2-titles">构建信息</div>-->
<!--      <el-descriptions :column="2" border :labelStyle="{ width: '120px' }">-->
<!--        <el-descriptions-item label="构建类型">-->
<!--          {{ buildType || '-' }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="构建状态">-->
<!--          {{ buildStatusText }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="开始时间">-->
<!--          {{ parseTime(startTime, '{y}-{m}-{d} {h}:{i}:{s}') || '-' }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="结束时间">-->
<!--          {{ parseTime(endTime, '{y}-{m}-{d} {h}:{i}:{s}') || '-' }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="执行耗时">-->
<!--          {{ duration || '-' }}ms-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="镜像标签">-->
<!--          {{ imageTag || '-' }}-->
<!--        </el-descriptions-item>-->
<!--      </el-descriptions>-->
<!--    </div>-->
  </div>
</template>

<script setup name="BuildLog">
import {ref, computed, onMounted, watch, nextTick, getCurrentInstance} from "vue";
import { listModelBuildLog } from "@/api/model/buildLog/modelBuildLog";
import DictTag from "@/components/DictTag/index.vue";

const props = defineProps({
  modelId: {
    type: [Number, String],
    default: null
  }
});


const { proxy } = getCurrentInstance();
const { build_status } = proxy.useDict('build_status');

const logs = ref([]);
const logRef = ref(null);
const loading = ref(false);

const buildType = ref('');
const buildStatus = ref('');
const startTime = ref('');
const endTime = ref('');
const duration = ref(null);
const imageTag = ref('');

const buildStatusText = computed(() => {
  const statusMap = {
    'success': '构建成功 (Build Successed)',
    'building': '构建中',
    'failed': '构建失败',
    'pending': '等待构建'
  };
  return statusMap[buildStatus.value] || buildStatus.value || '-';
});

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

    return { time, content, type };
  }).filter(line => line.content.trim());
};

const getBuildLogs = () => {
  loading.value = true;
  listModelBuildLog({
    modelId: props.modelId,
    pageNum: 1,
    pageSize: 10
  }).then(response => {
    const data = response.data.rows || [];

    if (data.length > 0) {
      const latestLog = data[0];
      buildType.value = latestLog.buildType || '';
      buildStatus.value = latestLog.status;
      startTime.value = latestLog.startTime || '';
      endTime.value = latestLog.endTime || '';
      duration.value = latestLog.duration || null;
      imageTag.value = latestLog.imageTag || '';

      logs.value = parseLogContent(latestLog.buildLog || '');
    } else {
      logs.value = [];
    }

    loading.value = false;

    nextTick(() => {
      if (logRef.value) {
        logRef.value.scrollTop = logRef.value.scrollHeight;
      }
    });
  }).catch(() => {
    loading.value = false;
  });
};

watch(() => props.modelId, () => {
  getBuildLogs();
});

onMounted(() => {
  getBuildLogs();
});
</script>

<style lang="scss" scoped>
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
