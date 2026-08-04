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
  <div
    class="sidebar-logo-container"
    :class="{ collapse: collapse }"
    :style="{
      backgroundColor:
        sideTheme === 'theme-dark'
          ? variables.menuBackground
          : variables.menuLightBackground,
    }"
  >
    <transition name="sidebarLogoFade">
      <router-link
        v-if="collapse"
        key="collapse"
        class="sidebar-logo-link"
        to="/"
      >
        <img v-if="refSimpLogo" :src="refSimpLogo" class="sidebar-logo" />
        <h1
          v-else
          class="sidebar-title"
          :style="{
            color:
              sideTheme === 'theme-dark'
                ? variables.logoTitleColor
                : variables.logoLightTitleColor,
          }"
        >
          {{ title }}
        </h1>
      </router-link>
      <router-link v-else key="expand" class="sidebar-logo-link" to="/">
        <span
          v-if="useDefaultLogo"
          class="sidebar-logo-split"
          :class="{ 'logo-intro': logoIntroActive }"
        >
          <img :src="logoM" class="sidebar-logo-m" />
          <img :src="logoQmodel" class="sidebar-logo-word" />
        </span>
        <img v-else-if="refLogo" :src="refLogo" class="sidebar-logo" />
      </router-link>
    </transition>
  </div>
</template>

<script setup>
import variables from "@/assets/system/styles/variables.module.scss";
import logoQmodel from "@/assets/system/logo/logo-qmodel.png";
import logoM from "@/assets/system/logo/logo-m.png";
import useSettingsStore from "@/store/system/settings";
import { getContent } from "@/api/system/system/content";

// 使用 ref 来创建响应式的 logo
const refLogo = ref(logoQmodel);
const refSimpLogo = ref(logoM);
const logoIntroActive = ref(false);
let logoIntroTimer;

const useDefaultLogo = computed(
  () => !refLogo.value || refLogo.value === logoQmodel
);

defineProps({
  collapse: {
    type: Boolean,
    required: true,
  },
});
onMounted(() => {
  logoIntroActive.value = true;
  logoIntroTimer = window.setTimeout(() => {
    logoIntroActive.value = false;
  }, 2200);
  fetchContent();
});

onBeforeUnmount(() => {
  window.clearTimeout(logoIntroTimer);
});

// 使用 getContent 来获取数据，而不是重新定义一个 getContent 函数
const fetchContent = async () => {
  try {
    // 调用你从 API 导入的 getContent 方法
    const res = await getContent(1); // 假设请求的是 id 为 1 的数据
    if (res.code == 200) {
      const data = res.data;
      const sysLogo = data.logo;
      refLogo.value = sysLogo || logoQmodel;
      refSimpLogo.value = sysLogo || logoM;
    }

    // this.$message.success('内容加载成功');
  } catch {
    refLogo.value = logoQmodel;
    refSimpLogo.value = logoM;
  }
};

const title = import.meta.env.VITE_APP_TITLE;
const settingsStore = useSettingsStore();
const sideTheme = computed(() => settingsStore.sideTheme);
</script>

<style lang="scss" scoped>
.sidebarLogoFade-enter-active {
  transition: opacity 1.5s;
}

.sidebarLogoFade-enter,
.sidebarLogoFade-leave-to {
  opacity: 0;
}

.sidebar-logo-container {
  position: relative;
  width: 100%;
  height: 60px;
  line-height: 50px;
  background: #2b2f3a;
  text-align: center;
  overflow: hidden;

  & .sidebar-logo-link {
    display: block;
    height: 100%;
    width: 100%;

    & .sidebar-logo {
      height: 48px;
      margin-top: 8px;
      vertical-align: middle;
      transform: scale(0.58);
      margin-left: -32px;
    }

    & .sidebar-logo-split {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      height: 100%;
      gap: 2px;
      transform: translateX(-4px);
      vertical-align: middle;
    }

    & .sidebar-logo-m {
      display: block;
      height: 44px;
      object-fit: contain;
      transform-origin: center;
    }

    & .sidebar-logo-word {
      display: block;
      height: 28px;
      object-fit: contain;
    }

    & .sidebar-logo-split.logo-intro,
    &:hover .sidebar-logo-split {
      .sidebar-logo-m {
        animation: sidebarLogoMRunIn 1.45s cubic-bezier(0.16, 0.88, 0.2, 1)
          0.18s both;
      }

      .sidebar-logo-word {
        animation: sidebarLogoWordSettle 0.55s ease-out 0.72s both;
      }
    }

    & .sidebar-title {
      display: inline-block;
      margin: 0;
      color: #fff;
      font-weight: 600;
      line-height: 50px;
      font-size: 14px;
      font-family: Avenir, Helvetica Neue, Arial, Helvetica, sans-serif;
      vertical-align: middle;
    }
  }

  &.collapse {
    .sidebar-logo {
      height: 40px;
      margin-top: 0;
      margin-right: 0;
      margin-left: -4px;
    }
  }
}

@keyframes sidebarLogoMRunIn {
  0% {
    opacity: 0;
    filter: drop-shadow(0 0 0 rgba(69, 145, 255, 0));
    transform: translateX(-90px) scaleX(0.88) scaleY(1.04) rotate(-8deg);
  }

  38% {
    opacity: 1;
    filter: drop-shadow(12px 0 12px rgba(69, 145, 255, 0.48));
    transform: translateX(18px) scaleX(1.08) scaleY(0.94) rotate(4deg);
  }

  54% {
    transform: translateX(-7px) scaleX(0.98) scaleY(1.02) rotate(-2deg);
  }

  70% {
    transform: translateX(4px) scaleX(1.02) scaleY(0.98) rotate(1deg);
  }

  84% {
    opacity: 1;
    filter: drop-shadow(3px 0 8px rgba(69, 145, 255, 0.28));
    transform: translateX(-1px) scale(1) rotate(0deg);
  }

  100% {
    opacity: 1;
    filter: drop-shadow(0 0 0 rgba(69, 145, 255, 0));
    transform: translateX(0) scale(1) rotate(0deg);
  }
}

@keyframes sidebarLogoWordSettle {
  0% {
    opacity: 0;
    transform: translateX(-10px);
  }

  100% {
    opacity: 1;
    transform: translateX(0);
  }
}

@media (prefers-reduced-motion: reduce) {
  .sidebar-logo-link {
    .sidebar-logo-m,
    .sidebar-logo-word {
      animation: none !important;
      opacity: 1;
      transform: none;
    }
  }
}
</style>
