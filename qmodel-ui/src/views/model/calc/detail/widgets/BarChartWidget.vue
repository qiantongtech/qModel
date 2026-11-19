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
  <div class="bar-chart-widget">
    <div v-if="hasValidData" ref="chartRef" class="chart-container"></div>
    <el-empty v-else description="未获取到图表数据，请检查输出结果" :image-size="60" />
  </div>
</template>

<script setup name="BarChartWidget">
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

const hasValidData = computed(() => {
  return seriesData.value.length > 0 && seriesData.value.some((item) => item.data.length > 0);
});

const colorPalette = ['#1E60FB', '#1DC7B5', '#F7BD26', '#9358E3', '#F53D57'];

function buildOption() {
  return {
    tooltip: {
      trigger: 'axis',
      axisPointer: { type: 'shadow' }
    },
    legend: {
      show: true,
      itemGap: 24,
      data: seriesData.value.map((item) => item.name),
      icon: 'circle',
      itemWidth: 8,
      itemHeight: 8,
      right: '5%',
      top: '1%',
      textStyle: { color: 'rgba(0,0,0,0.65)', fontSize: 14, lineHeight: 30 }
    },
    grid: {
      top: '18%',
      bottom: '12%',
      right: '5%',
      left: '3%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      data: xData.value,
      axisLine: { lineStyle: { color: '#909399' } },
      axisLabel: { color: 'rgba(0,0,0,0.65)', fontSize: 11 }
    },
    yAxis: {
      type: 'value',
      axisLine: { show: false },
      axisTick: { show: false },
      splitLine: { lineStyle: { color: '#ebeef5' } },
      axisLabel: { color: 'rgba(0,0,0,0.65)' }
    },
    series: seriesData.value.map((item, index) => ({
      name: item.name,
      type: 'bar',
      data: item.data,
      barMaxWidth: 36,
      itemStyle: { color: colorPalette[index % colorPalette.length] }
    }))
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
  link.download = `${props.data.title || 'bar-chart'}.png`;
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
.bar-chart-widget {
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
