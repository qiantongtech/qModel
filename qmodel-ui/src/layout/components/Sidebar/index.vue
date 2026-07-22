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
  <div
      :class="{ 'has-logo': showLogo }"
      :style="{ backgroundColor: sideTheme === 'theme-dark' ? variables.menuBackground : variables.menuLightBackground }"
  >
    <logo v-if="showLogo" :collapse="isCollapse"/>
    <el-scrollbar :class="sideTheme" wrap-class="scrollbar-wrapper">
      <el-menu
          :default-active="activeMenu"
          :collapse="isCollapse"
          :background-color="sideTheme === 'theme-dark' ? variables.menuBackground : variables.menuLightBackground"
          :text-color="sideTheme === 'theme-dark' ? variables.menuColor : variables.menuLightColor"
          :unique-opened="true"
          :active-text-color="/*系统配置 theme*/ '#fff'"
          :collapse-transition="false"
          mode="vertical"
      >
        <sidebar-item
            :style="{ '--bgColor': theme}"
            v-for="(route, index) in sidebarRouters"
            :key="route.path + index"
            :item="route"
            :base-path="route.path"
        />
      </el-menu>
    </el-scrollbar>
  </div>
</template>

<script setup>
import Logo from './Logo'
import SidebarItem from './SidebarItem'
import variables from '@/assets/system/styles/variables.module.scss'
import useAppStore from '@/store/system/app'
import useSettingsStore from '@/store/system/settings'
import usePermissionStore from '@/store/system/permission'

const route = useRoute();
const appStore = useAppStore()
const settingsStore = useSettingsStore()
const permissionStore = usePermissionStore()

const sidebarRouters = computed(() => permissionStore.sidebarRouters);
const showLogo = computed(() => settingsStore.sidebarLogo);
const sideTheme = computed(() => settingsStore.sideTheme);
const theme = computed(() => settingsStore.theme);
const isCollapse = computed(() => !appStore.sidebar.opened);

const activeMenu = computed(() => {
  const {meta, path} = route;
  // if set path, the sidebar will highlight the path you set
  if (meta.activeMenu) {
    return meta.activeMenu;
  }
  return path;
})

</script>

<style lang="scss" scoped>
/* 子菜单颜色 */
.theme-dark {
  ::v-deep .nest-menu li {
    background-color: #0C2135 !important;
  }
}

/* 选中子菜单颜色 */
.theme-dark {
  ::v-deep div .nest-menu li.is-active {
    background-color: var(--bgColor) !important;
  }
}

:deep {
  .el-menu-item .svg-icon,
  .el-sub-menu__title .svg-icon {
    color: inherit;
  }

  .el-menu-item.is-active .svg-icon,
  .el-menu-item:hover .svg-icon,
  .el-sub-menu.is-active > .el-sub-menu__title .svg-icon,
  .el-sub-menu__title:hover .svg-icon {
    color: currentColor;
  }

  .el-menu-item{
    .svg-icon {
      width: 19px;
      height: 19px;
    }
  }

  .el-sub-menu{
    .svg-icon {
      width: 19px;
      height: 19px;
    }
    .nest-menu{
      .svg-icon {
        width: 0;
        height: 0;
      }
    }
  }
}
</style>
