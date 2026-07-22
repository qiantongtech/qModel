<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<template>
  <component :is="type" v-bind="linkProps()">
    <slot />
  </component>
</template>

<script setup>
import { isExternal } from '@/utils/validate'

const props = defineProps({
  to: {
    type: [String, Object],
    required: true
  }
})

const isExt = computed(() => {
  return isExternal(props.to)
})

const type = computed(() => {
  if (isExt.value) {
    return 'a'
  }
  return 'router-link'
})

function linkProps() {
  if (isExt.value) {
    return {
      href: props.to,
      target: '_blank',
      rel: 'noopener'
    }
  }
  return {
    to: props.to
  }
}
</script>
