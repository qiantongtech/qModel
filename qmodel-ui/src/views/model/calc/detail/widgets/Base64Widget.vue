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
  <div class="base64-widget">
    <template v-if="imageList.length > 0">
      <div v-for="(src, index) in imageList" :key="index" class="image-preview">
        <img :src="src" alt="Base64 图片" />
      </div>
    </template>
    <el-empty v-else :description="emptyDesc" :image-size="60" />
  </div>
</template>

<script setup name="Base64Widget">
import { computed } from 'vue';
import { ElMessage } from 'element-plus';

const props = defineProps({
  data: {
    type: Object,
    default: () => ({})
  },
  value: {
    type: [String, Array],
    default: ''
  }
});

function normalizeSrc(val) {
  if (!val || typeof val !== 'string') return '';
  const v = val.trim();
  if (v.startsWith('data:image')) {
    return v;
  }
  return `data:image/png;base64,${v}`;
}

const imageList = computed(() => {
  if (!props.value) return [];
  if (typeof props.value === 'string') {
    const src = normalizeSrc(props.value);
    return src ? [src] : [];
  }
  if (Array.isArray(props.value)) {
    return props.value
      .map((item) => normalizeSrc(item))
      .filter((src) => src);
  }
  return [];
});

const emptyDesc = computed(() => {
  if (!props.value || (Array.isArray(props.value) && props.value.length === 0)) {
    return '未获取到图片数据，请检查输出结果';
  }
  return '图片数据格式错误，无法解析';
});

function exportImage() {
  if (imageList.value.length === 0) {
    ElMessage.warning('暂无图片可导出');
    return;
  }
  const title = props.data.title || 'base64-image';
  imageList.value.forEach((src, index) => {
    const link = document.createElement('a');
    link.href = src;
    link.download = imageList.value.length > 1 ? `${title}-${index + 1}.png` : `${title}.png`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  });
  ElMessage.success('图片导出成功');
}

defineExpose({
  exportImage,
  id: props.data?.id
});
</script>

<style lang="scss" scoped>
.base64-widget {
  width: 100%;
  min-height: 160px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  gap: 12px;
}

.image-preview {
  width: 100%;
  max-width: 480px;
  border: 1px solid #ebeef5;
  border-radius: 4px;
  overflow: hidden;
  background: #f5f7fa;

  img {
    display: block;
    width: 100%;
    height: auto;
    object-fit: contain;
  }
}
</style>
