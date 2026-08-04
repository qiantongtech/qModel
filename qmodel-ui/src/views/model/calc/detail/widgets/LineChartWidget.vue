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
  <div class="line-chart-widget">
    <div v-if="hasValidData" ref="chartRef" class="chart-container"></div>
    <el-empty v-else description="未获取到图表数据，请检查输出结果" :image-size="60" />
  </div>
</template>

<script setup name="LineChartWidget">
import { ref, computed, watch, onMounted, onUnmounted, nextTick } from 'vue';
import { ElMessage } from 'element-plus';
import * as echarts from 'echarts';

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
    return props.xValue.map((item) => (item === null || item === undefined ? '-' : String(item)));
  }
  const first = seriesData.value[0];
  const len = first ? first.data.length : 0;
  return Array.from({ length: len }, (_, index) => String(index));
});

const seriesData = computed(() => {
  if (!Array.isArray(props.series)) return [];
  return props.series.map((s) => ({
    name: s.name || '数据',
    data: (Array.isArray(s.value) ? s.value : []).map((item) =>
      typeof item === 'number' ? item : parseFloat(item) || 0
    )
  }));
});

const hasValidData = computed(() => {
  return seriesData.value.length > 0 && seriesData.value.some((s) => s.data.length > 0);
});

function initChart() {
  if (!chartRef.value) return;
  if (chartInstance) {
    chartInstance.dispose();
  }
  chartInstance = echarts.init(chartRef.value, 'macarons');
  updateChartOption();

  const resizeObserver = new ResizeObserver(() => {
    chartInstance && chartInstance.resize();
  });
  resizeObserver.observe(chartRef.value);
  chartInstance.__resizeObserver__ = resizeObserver;
}

const colorPalette = [
  { main: '#1E60FB', light: '#5D8EFE' },
  { main: '#1DC7B5', light: '#6CD8D0' },
  { main: '#F7BD26', light: '#F9D370' },
  { main: '#9358E3', light: '#B28AE9' },
  { main: '#F53D57', light: '#EA7283' }
];

function hexToRgba(hex, alpha) {
  const r = parseInt(hex.slice(1, 3), 16);
  const g = parseInt(hex.slice(3, 5), 16);
  const b = parseInt(hex.slice(5, 7), 16);
  return `rgba(${r}, ${g}, ${b}, ${alpha})`;
}

function updateChartOption() {
  if (!chartInstance) return;

  const option = {
    tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'line'
      }
    },
    legend: {
      show: true,
      itemGap: 24,
      data: seriesData.value.map((s) => s.name),
      icon: 'circle',
      itemWidth: 6,
      itemHeight: 6,
      right: '5%',
      top: '1%',
      textStyle: {
        color: 'rgba(0,0,0,0.65)',
        fontSize: 14,
        lineHeight: 30
      }
    },
    grid: {
      top: '18%',
      bottom: '10%',
      right: '5%',
      left: '3%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: xData.value,
      axisLine: {
        lineStyle: {
          color: '#909399'
        }
      },
      axisLabel: {
        color: 'rgba(0,0,0,0.65)'
      }
    },
    yAxis: {
      type: 'value',
      axisLine: {
        show: false
      },
      axisTick: {
        show: false
      },
      splitLine: {
        lineStyle: {
          color: '#ebeef5'
        }
      },
      axisLabel: {
        color: 'rgba(0,0,0,0.65)'
      }
    },
    series: seriesData.value.map((s, index) => {
      const palette = colorPalette[index % colorPalette.length];
      return {
        name: s.name,
        type: 'line',
        data: s.data,
        smooth: true,
        symbolSize: 8,
        itemStyle: {
          color: palette.main,
          borderColor: palette.main,
          borderWidth: 1
        },
        lineStyle: {
          width: 2,
          color: palette.main
        },
        areaStyle: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0, color: hexToRgba(palette.light, 0.5) },
            { offset: 1, color: hexToRgba(palette.main, 0.05) }
          ], false)
        }
      };
    })
  };

  chartInstance.setOption(option, true);
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
  link.download = `${props.data.title || 'line-chart'}.png`;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  ElMessage.success('图表导出成功');
}

onMounted(() => {
  nextTick(() => {
    initChart();
  });
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
.line-chart-widget {
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
