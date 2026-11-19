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
  <div class="pie-chart-widget">
    <div v-if="hasValidData" ref="chartRef" class="chart-container"></div>
    <el-empty v-else description="未获取到图表数据，请检查输出结果" :image-size="60" />
  </div>
</template>

<script setup name="PieChartWidget">
import { ref, computed, watch, onMounted, onUnmounted, nextTick } from 'vue';
import { ElMessage } from 'element-plus';
import * as echarts from 'echarts';
import { toNumeric, toCategory } from './chartData';

const props = defineProps({
  data: {
    type: Object,
    default: () => ({})
  },
  xValue: {
    type: Array,
    default: null
  },
  series: {
    type: Array,
    default: () => []
  }
});

const chartRef = ref(null);
let chartInstance = null;

const xData = computed(() => {
  if (Array.isArray(props.xValue) && props.xValue.length > 0) {
    return props.xValue.map(toCategory);
  }
  const first = seriesData.value[0];
  const len = first ? first.data.length : 0;
  return Array.from({ length: len }, (_, index) => String(index + 1));
});

const seriesData = computed(() => {
  if (!Array.isArray(props.series)) return [];
  return props.series.map((item) => ({
    name: item.name || '数据',
    data: (Array.isArray(item.value) ? item.value : []).map(toNumeric)
  }));
});

// 饼图只用第一条 Y 轴系列，X 轴作为分类名；空值不参与占比
const pieData = computed(() => {
  const first = seriesData.value[0];
  if (!first) return [];
  return first.data
    .map((value, index) => ({
      name: xData.value[index] || `第 ${index + 1} 项`,
      value
    }))
    .filter((item) => item.value !== null && item.value !== undefined);
});

const hasValidData = computed(() => pieData.value.length > 0);

const colorPalette = ['#2263FC', '#5D8EFE', '#1DC7B5', '#6CD8D0', '#F7BD26', '#F9D370', '#9358E3', '#B28AE9', '#F53D57', '#EA7283'];

function buildOption() {
  return {
    tooltip: {
      trigger: 'item',
      formatter: (params) => `${params.marker}${params.name}<br/>数量：${params.value}<br/>占比：${params.percent}%`
    },
    legend: {
      type: 'scroll',
      orient: 'vertical',
      right: '3%',
      top: '8%',
      bottom: '8%',
      icon: 'circle',
      itemWidth: 8,
      itemHeight: 8,
      textStyle: { color: 'rgba(0,0,0,0.65)', fontSize: 12 }
    },
    series: [
      {
        name: seriesData.value[0]?.name || '数据',
        type: 'pie',
        center: ['32%', '50%'],
        radius: ['30%', '52%'],
        avoidLabelOverlap: true,
        label: {
          show: true,
          position: 'outside',
          fontSize: 12,
          formatter: (params) => `${params.percent}% (${params.value})`
        },
        labelLine: { length: 10, length2: 10 },
        itemStyle: {
          color: (params) => colorPalette[params.dataIndex % colorPalette.length]
        },
        data: pieData.value
      }
    ]
  };
}

function initChart() {
  if (!chartRef.value) return;
  if (chartInstance) chartInstance.dispose();
  chartInstance = echarts.init(chartRef.value, 'macarons');
  chartInstance.setOption(buildOption(), true);

  const resizeObserver = new ResizeObserver(() => {
    chartInstance && chartInstance.resize();
  });
  resizeObserver.observe(chartRef.value);
  chartInstance.__resizeObserver__ = resizeObserver;
}

function updateChartOption() {
  if (chartInstance) chartInstance.setOption(buildOption(), true);
}

function exportImage() {
  if (!chartInstance) {
    ElMessage.warning('图表未初始化');
    return;
  }
  const url = chartInstance.getDataURL({
    type: 'png',
    pixelRatio: 2,
    backgroundColor: '#fff'
  });
  const link = document.createElement('a');
  link.href = url;
  link.download = `${props.data.title || 'pie-chart'}.png`;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  ElMessage.success('图表导出成功');
}

onMounted(() => {
  nextTick(() => initChart());
});

onUnmounted(() => {
  if (chartInstance) {
    if (chartInstance.__resizeObserver__) {
      chartInstance.__resizeObserver__.disconnect();
    }
    chartInstance.dispose();
    chartInstance = null;
  }
});

watch(
  () => [props.xValue, props.series, props.data.title],
  () => {
    nextTick(() => {
      if (!hasValidData.value) {
        if (chartInstance) {
          chartInstance.dispose();
          chartInstance = null;
        }
        return;
      }
      if (!chartInstance && chartRef.value) {
        initChart();
      } else if (chartInstance) {
        updateChartOption();
      }
    });
  },
  { deep: true }
);

defineExpose({
  exportImage,
  id: props.data?.id
});
</script>

<style lang="scss" scoped>
.pie-chart-widget {
  width: 100%;
  min-height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.chart-container {
  width: 100%;
  height: 280px;
}
</style>
