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
<!--   <i-frame v-model:src="url"></i-frame>-->
</template>

<script setup>
import iFrame from '@/components/iFrame/index.vue'
const { proxy } = getCurrentInstance();

const url = ref(import.meta.env.VITE_APP_BASE_API + "/doc.html")

// 打开外链 URL 在新的标签页中
window.open(url.value, "_blank");

proxy.$tab.closePage();
</script>
