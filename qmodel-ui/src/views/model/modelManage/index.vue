<!--
  Copyright © 2026 Qiantong Technology Co., Ltd.
  qModel Model Platform(Open Source Edition)
   *
  License:
  Released under the Apache License, Version 2.0.
  You may use, modify, and distribute this software for commercial purposes
  under the terms of the License.
   *
  Special Notice:
  All derivative versions are strictly prohibited from modifying or removing
  the default system logo and copyright information.
  For brand customization, please apply for brand customization authorization via official channels.
   *
  More information: https://qmodel.qiantong.tech/business.html
   *
  ============================================================================
   *
  版权所有 © 2026 江苏千桐科技有限公司
  qModel 模型平台（开源版）
   *
  许可协议：
  本项目基于 Apache License 2.0 开源协议发布，
  允许在遵守协议的前提下进行商用、修改和分发。
   *
  特别说明：
  所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
  如需定制品牌，请通过官方渠道申请品牌定制授权。
   *
  更多信息请访问：https://qmodel.qiantong.tech/business.html
-->

<template>
  <div class="app-container model-manage-page">
    <el-container>
      <!-- 左侧分类树 -->
      <DeptTree
        ref="deptTreeRef"
        :deptOptions="classifyOptions"
        :leftWidth="leftWidth"
        placeholder="请输入分类名称"
        @nodeClick="handleNodeClick"
      />

      <!-- 右侧模型卡片 -->
      <el-main>
        <div class="pagecont-top" v-show="showSearch">
          <el-form
            :model="queryParams"
            ref="queryFormRef"
            :inline="true"
            v-show="showSearch"
            class="search-form btn-style"
          >
            <el-form-item label="模型名称" prop="name">
              <el-input
                v-model="queryParams.name"
                placeholder="请输入模型名称"
                clearable
                @keyup.enter="handleQuery"
              />
            </el-form-item>
            <el-form-item label="模型编码" prop="code">
              <el-input
                v-model="queryParams.code"
                placeholder="请输入模型编码"
                clearable
                @keyup.enter="handleQuery"
              />
            </el-form-item>
            <el-form-item label="接入方式" prop="accessType">
              <el-select
                v-model="queryParams.accessType"
                placeholder="请选择接入方式"
                clearable
                style="width: 210px"
              >
                <el-option key="API" label="API" value="API" />
                <el-option key="PYTHON" label="Python" value="PYTHON" />
              </el-select>
            </el-form-item>
            <el-form-item label="状态" prop="status">
              <el-select
                v-model="queryParams.status"
                placeholder="请选择状态"
                clearable
                style="width: 210px"
              >
                <el-option key="0" label="停用" value="0" />
                <el-option key="1" label="启用" value="1" />
                <el-option key="2" label="构建部署中" value="2" />
                <el-option key="3" label="构建失败" value="3" />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button
                plain
                type="primary"
                @click="handleQuery"
                @mousedown="(e) => e.preventDefault()"
              >
                <i class="iconfont-mini icon-a-zu22377 mr5"></i>查询
              </el-button>
              <el-button
                @click="resetQuery"
                @mousedown="(e) => e.preventDefault()"
                class="btn"
              >
                <i class="iconfont-mini icon-a-zu22378 mr5"></i>重置
              </el-button>
            </el-form-item>
          </el-form>
        </div>
        <div class="content-panel" :class="{ 'has-search': showSearch }">
          <div class="toolbar-row">
            <div class="btn-style">
            <el-button
              type="primary"
              @click="handleAdd"
              plain
              v-hasPermi="['model:model:add']"
              @mousedown="(e) => e.preventDefault()"
            >
              <i class="iconfont-mini icon-xinzeng"></i>新增模型
            </el-button>
          </div>
          <right-toolbar
            v-model:showSearch="showSearch"
            @queryTable="getList"
          ></right-toolbar>
        </div>
        <div class="pagecont-bottom" v-loading="loading">
          <div class="card-scroll">
            <div class="card-box" v-if="total > 0">
              <el-card
                shadow="never"
                v-for="(item, index) in modelList"
                :key="index"
              >
                <div class="card-item">
                  <div class="item-top">
                    <div class="top-icon">
                      <img :src="getImage(item)" alt="应用图标" @error="handleImageError" />
                    </div>
                    <div class="top-info">
                      <el-tooltip
                        :content="item.name"
                        placement="top"
                        effect="light"
                        :disabled="!nameOverflowMap[index]"
                      >
                        <div
                          class="top-name ellipsis"
                          @mouseenter="(e) => checkNameOverflow(e, index)"
                        >{{ item.name }}</div>
                      </el-tooltip>
                      <div class="top-tags">
                        <dict-tag :options="buildTagOptions(item.tags)" :value="buildTagValues(item.tags)" separator="," />
                        <dict-tag :options="[{ value: formatVersion(item.version), label: formatVersion(item.version), elTagType: 'info' }]" :value="formatVersion(item.version)" />
                      </div>
                    </div>
                    <div class="top-status" :class="getStatusClass(item.status)">
                      <span class="status-dot"></span>
                      <span class="status-name">{{ getStatusText(item.status) }}</span>
                    </div>
                  </div>
                  <div class="item-con">
                    <div class="con-row">
                      <span class="con-label">模型编码</span>
                      <span class="con-value ellipsis">{{ item.code || '-' }}</span>
                    </div>
                    <div class="con-row">
                      <span class="con-label">接入方式</span>
                      <dict-tag :options="model_access_type" :value="item.accessType" class="con-value access-tag" />
                    </div>
                    <div class="con-row">
                      <span class="con-label">创建时间</span>
                      <span class="con-value">{{ parseTime(item.createTime, '{y}-{m}-{d} {h}:{i}') }}</span>
                    </div>
                  </div>
                  <div class="item-btns">
                    <el-button
                      link
                      type="primary"
                      icon="Edit"
                      :disabled="['1', '2', '3'].includes(String(item.status))"
                      @click.stop="handleUpdate(item)"
                    >修改</el-button>
                    <div class="btn-divider"></div>
                    <el-button
                      link
                      type="primary"
                      icon="VideoPlay"
                      :disabled="String(item.status) === '2' || String(item.status) === '3'"
                      @click.stop="handleTest(item)"
                    >调试</el-button>
                    <div class="btn-divider"></div>
                    <el-button
                      link
                      :type="String(item.status) === '1' ? 'info' : 'primary'"
                      :icon="String(item.status) === '1' ? 'CircleClose' : 'CircleCheck'"
                      :disabled="String(item.status) === '2' || String(item.status) === '3'"
                      @click.stop="handleToggleStatus(item)"
                    >{{ String(item.status) === '1' ? '停用' : '启用' }}</el-button>
                    <div class="btn-divider"></div>
                    <el-button
                      link
                      type="danger"
                      icon="Delete"
                      :disabled="['1', '2', '3'].includes(String(item.status))"
                      @click.stop="handleDelete(item)"
                    >删除</el-button>
                  </div>
                </div>
              </el-card>
            </div>

            <el-empty
              description="暂无数据，请添加模型"
              v-if="total == 0 && !loading"
            ></el-empty>
          </div>
          <div class="pagefy" v-if="total > 0">
            <pagination
              :pageSizes="[12, 24, 36, 48]"
              :total="total"
              v-model:page="queryParams.pageNum"
              v-model:limit="queryParams.pageSize"
              @pagination="getList"
            />
          </div>
        </div>
        </div>
      </el-main>
    </el-container>
  </div>
</template>

<script setup>
import {
  getCurrentInstance,
  onMounted,
  reactive,
  ref,
} from "vue";
import {
  listModel,
  delModel,
  updateModelStatus,
} from "@/api/model/model";
import { listClassify } from "@/api/model/classify";
import DeptTree from "@/components/DeptTree";
import { ElMessage, ElMessageBox } from "element-plus";
import DictTag from '@/components/DictTag'
import defaultCover from '@/assets/system/images/model/version/card-title.svg';

const { proxy } = getCurrentInstance();

const { model_access_type } = proxy.useDict('model_access_type');

const queryFormRef = ref(null);
const deptTreeRef = ref(null);

const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);
const modelList = ref([]);
const nameOverflowMap = reactive({});

// 左侧分类树
const classifyOptions = ref([]);
const leftWidth = ref(300);

const queryParams = reactive({
  pageNum: 1,
  pageSize: 12,
  orderByColumn: "create_time",
  isAsc: "desc",
  classifyId: undefined,
  classifyIdList: [],
});

onMounted(() => {
  getTreeselect();
});

const getList = () => {
  loading.value = true;
  listModel(queryParams).then((response) => {
    modelList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

const handleQuery = () => {
  queryParams.pageNum = 1;
  getList();
};

const resetQuery = () => {
  if (queryFormRef.value) {
    queryFormRef.value.resetFields();
  }
  if (deptTreeRef.value) {
    deptTreeRef.value.resetTree();
  }
  queryParams.classifyId = undefined;
  queryParams.classifyIdList = [];
  handleQuery();
};

/** 查询分类下拉树结构 */
const getTreeselect = () => {
  listClassify().then((res) => {
    const treeData = proxy.handleTree(res.data, "id");
    classifyOptions.value = [
      {
        id: 0,
        name: "模型分类",
        children: treeData,
        count: treeData.length,
        totalCount: treeData.reduce((sum, item) => sum + (item.totalCount || 0), 0),
      },
    ];
    handleNodeClick(classifyOptions.value[0]);
  });
};

// 节点单击事件
const handleNodeClick = (data) => {
  const ids = [];
  collectIds(data, ids);
  queryParams.classifyIdList = ids;
  queryParams.classifyId = undefined;
  handleQuery();
};

const collectIds = (node, ids) => {
  ids.push(node.id);
  if (node.children && Array.isArray(node.children)) {
    node.children.forEach((child) => collectIds(child, ids));
  }
};

const getStatusText = (val) => {
  const str = String(val);
  if (str === "3") return "构建失败";
  if (str === "2") return "构建部署中";
  if (str === "1") return "启用";
  if (str === "0") return "停用";
  return "未知";
};

const getStatusClass = (val) => {
  const str = String(val);
  if (str === "1") return "status-active";
  if (str === "0") return "status-inactive";
  if (str === "2") return "status-building";
  if (str === "3") return "status-failed";
  return "";
};

const formatVersion = (val) => {
  if (!val) return "V1.0";
  const versionStr = String(val);
  return versionStr.toUpperCase().startsWith("V") ? versionStr.toUpperCase() : "V" + versionStr;
};

const parseTags = (tags) => {
  if (!tags) return [];
  try {
    const arr = typeof tags === "string" ? JSON.parse(tags) : tags;
    return Array.isArray(arr) ? arr : [];
  } catch {
    return [];
  }
};

const buildTagOptions = (tags) => {
  return parseTags(tags).map(tag => ({
    value: tag.name,
    label: tag.name,
    elTagType: 'primary'
  }))
}

const buildTagValues = (tags) => {
  return parseTags(tags).map(tag => tag.name)
}

const checkNameOverflow = (event, index) => {
  const el = event.target;
  if (el) {
    nameOverflowMap[index] = el.scrollWidth > el.clientWidth;
  }
};

const handleAdd = () => {
  proxy.$router.push({
    path: "/model/modelManage/add"
  });
};

const handleView = (row) => {
  proxy.$router.push({
    path: "/model/modelManageView",
    query: { modelId: row.id }
  });
};

const handleUpdate = (row) => {
  proxy.$router.push({
    path: "/model/modelManage/edit",
    query: { id: row.id }
  });
};

const handleTest = () => {
  ElMessage.warning("调试功能正在开发中");
};

const handleToggleStatus = (row) => {
  const newStatus = String(row.status) === "1" ? "0" : "1";
  const text = newStatus === "1" ? "启用" : "停用";
  ElMessageBox.confirm(
    "是否确认" + text + "名称为【" + row.name + "】的模型？",
    "警告",
    {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    }
  )
    .then(() => updateModelStatus(row.id, newStatus))
    .then(() => {
      getList();
      ElMessage.success(text + "成功");
    })
    .catch(() => {});
};

const handleDelete = (row) => {
  const id = row.id;
  const name = row.name;
  if (row.status == 1) {
    ElMessageBox.confirm("【" + name + "】模型已启用，请先停用！", "警告", {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    }).catch(() => {});
  } else {
    ElMessageBox.confirm(
      "是否确认删除模型名称为【" + name + "】的模型数据吗？",
      "警告",
      {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }
    )
      .then(() => {
        return delModel(id);
      })
      .then(() => {
        getList();
        ElMessage.success("删除成功");
      })
      .catch(() => {});
  }
};

const handleImageError = (event) => {
  event.target.src = defaultCover
}

function getImage(row) {
  const image = row?.icon;
  if (!image) {
    return defaultCover;
  }
  if (/^https?:\/\//.test(image)) {
    return image;
  }
  if (image.startsWith('/profile')) {
    return `${import.meta.env.VITE_APP_BASE_API}${image}`;
  }
  if (image.startsWith('/')) {
    return `${import.meta.env.VITE_APP_BASE_API}/profile${image}`;
  }
  return `${import.meta.env.VITE_APP_BASE_API}/profile/${image}`;
}

</script>
<style lang="scss" scoped>
.model-manage-page {
  display: flex;
  flex-direction: column;
  height: calc(100vh - 124px);

  :deep(.el-container) {
    height: 100%;
  }
}

.el-main {
  overflow: hidden;
  padding: 2px 0;
}

.pagecont-top {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: #fff;
  border-radius: 2px;
  padding: 16px 20px;
}

.search-form {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 12px 24px;

  :deep(.el-form-item) {
    margin-bottom: 0;
    margin-right: 0;
  }
  :deep(.el-form-item__label) {
    font-size: 14px;
    color: #333;
    padding-right: 8px;
  }
}

.pagecont-bottom {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  min-height: 0;
  background-color: transparent;
  border-radius: 0;
  box-shadow: none;
  margin-top: 0;
  padding: 0;
}

.card-scroll {
  flex: 1;
  overflow-y: auto;
  overflow-x: hidden;
  min-height: 0;
  padding-bottom: 12px;
}

.card-box {
  width: 100%;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(min(100%, 280px), 1fr));
  grid-gap: 15px;
  padding: 0;
  align-content: flex-start;
}

.pagefy {
  flex-shrink: 0;
  height: 52px;
  background: transparent;
  border-top: 1px solid #f0f0f0;
  line-height: 52px;
  margin: 0;
  padding: 0 18px 0 0;

  :deep(.pagination-container) {
    margin-top: 0;
  }
}

:deep(.el-card) {
  border: 1px solid rgba(0, 0, 0, 0.098039);
  border-radius: 4px !important;
  height: 242px;
  cursor: pointer;
  transition: box-shadow 0.2s;

  &:hover {
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
  }

  .el-card__body {
    padding: 0 !important;
    height: 100%;
  }
}

.card-item {
  display: flex;
  flex-direction: column;
  height: 100%;
  padding: 20px;

  .item-top {
    display: flex;
    align-items: flex-start;
    margin-bottom: 16px;

    .top-icon {
      width: 56px;
      height: 56px;
      border-radius: 10px;
      overflow: hidden;
      flex-shrink: 0;
      margin-right: 16px;

      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }

    .top-info {
      flex: 1;
      min-width: 0;
      padding-top: 2px;

      .top-name {
        font-size: 16px;
        font-family: "PingFang SC", "PingFang SC";
        font-weight: 500;
        color: rgba(0, 0, 0, 0.85);
        line-height: 24px;
        margin-bottom: 8px;
      }

      .top-tags {
        display: flex;
        align-items: center;
        gap: 8px;

        > div {
          display: inline-flex;
          align-items: center;
          gap: 8px;
        }

        :deep(.el-tag) {
          min-width: 50px;
          justify-content: center;
          margin-left: 0 !important;
        }
      }
    }

    .top-status {
      display: inline-flex;
      align-items: center;
      height: 24px;
      padding: 0 10px 0 8px;
      border-radius: 14px;
      font-size: 14px;
      font-family: "PingFang SC-Regular", "Microsoft YaHei", sans-serif;
      flex-shrink: 0;
      margin-left: 8px;

      .status-dot {
        width: 6px;
        height: 6px;
        border-radius: 50%;
        margin-right: 6px;
      }
      .status-name {
        font-size: 14px;
        margin-bottom: 1px;
      }
    }

    .status-active {
      color: #35bf53;
      background: rgba(53, 191, 83, 0.062745);
      border: 1px solid rgba(53, 191, 83, 0.14902);

      .status-dot {
        background: #35bf53;
      }
    }

    .status-inactive {
      color: rgba(0, 0, 0, 0.45);
      background: rgba(0, 0, 0, 0.02);
      border: 1px solid rgba(0, 0, 0, 0.06);

      .status-dot {
        background: rgba(0, 0, 0, 0.25);
      }
    }

    .status-building {
      color: #2666fb;
      background: rgba(38, 102, 251, 0.062745);
      border: 1px solid rgba(38, 102, 251, 0.14902);

      .status-dot {
        background: #2666fb;
      }
    }

    .status-failed {
      color: #f2657d;
      background: rgba(242, 101, 125, 0.062745);
      border: 1px solid rgba(242, 101, 125, 0.14902);

      .status-dot {
        background: #f2657d;
      }
    }
  }

  .item-con {
    flex: 1;
    padding-bottom: 6px;

    .con-row {
      display: flex;
      align-items: center;
      font-size: 14px;
      line-height: 24px;
      margin-bottom: 10px;

      &:last-child {
        margin-bottom: 0;
      }

      .con-label {
        width: 72px;
        color: rgba(0, 0, 0, 0.65);
        flex-shrink: 0;
        font-family: "PingFang SC", "PingFang SC";
      }

      .con-value {
        flex: 1;
        min-width: 0;
        color: rgba(0, 0, 0, 0.65);
        text-align: right;

        &:deep(.el-tag) {
          margin-left: 0;
        }
      }
    }
  }

  .item-btns {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-top: 12px;
    margin-top: auto;
    position: relative;

    &::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 1px;
      background-color: rgba(0, 0, 0, 0.062745);
    }

    :deep(.el-button) {
      flex: 1;
      justify-content: center;
      font-size: 14px;
    }

    .btn-divider {
      width: 1px;
      height: 20px;
      background: rgba(0, 0, 0, 0.06);
      flex-shrink: 0;
    }
  }
}

:deep(.el-empty) {
  height: 100%;
}

.btn {
  margin-left: 12px !important;
}

:deep(.el-button + .el-button) {
  margin-left: 12px;
}

.mr5 {
  margin-right: 5px;
}

.ellipsis {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.toolbar-row {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 0 12px;
}

.content-panel {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  background: #fff;
  border-radius: 2px;
  padding: 12px 20px 0;

  &.has-search {
    margin-top: 15px;
  }
}
</style>
