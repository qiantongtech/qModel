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
  <div class="app-container">
    <el-container>
      <el-main>
        <div class="pagecont-top" v-show="showSearch">
          <el-form
            :model="queryParams"
            ref="queryFormRef"
            :inline="true"
            v-show="showSearch"
            class="btn-style"
          >
            <el-form-item label="模型名称：" prop="name">
              <el-input
                v-model="queryParams.name"
                placeholder="请输入模型名称"
                clearable
                @keyup.enter="handleQuery"
                style="width: 180px"
              />
            </el-form-item>
            <el-form-item label="模型接入方式：" prop="accessMode">
              <el-select
                v-model="queryParams.accessMode"
                placeholder="请选择模型类别"
                clearable
                class="el-form-input-width"
              >
                <el-option key="0" label="python脚本" value="0" />
                <el-option key="1" label="api接口" value="1" />
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
        <div class="pagecont-bottom">
          <div class="justify-between mb15">
            <el-row :gutter="10" class="btn-style">
              <el-col :span="1.5">
                <el-button
                  type="primary"
                  plain
                  @click="handleAdd"
                  v-hasPermi="['model:model:add']"
                >
                  <i class="iconfont-mini icon-xinzeng"></i>新增
                </el-button>
              </el-col>
              <el-col :span="1.5"></el-col>
            </el-row>
            <right-toolbar
              v-model:showSearch="showSearch"
              @queryTable="getList"
            ></right-toolbar>
          </div>
          <div class="card-box" v-loading="loading" v-if="total > 0">
            <el-card
              :body-style="{ padding: '16px 16px 0' }"
              shadow="never"
              v-for="(item, index) in modelList"
              :key="index"
            >
              <div class="card-item" @click="handleView(item)">
                <div class="item-top">
                  <div class="top-title ellipsis">
                    <img
                      src="@/assets/system/images/model/version/card-title.svg"
                      alt=""
                    /><span class="title-name">{{ item.name }}</span>
                  </div>
                  <el-popover
                    placement="bottom"
                    trigger="click"
                    popper-class="custom-popover-width"
                    :popper-style="{ minWidth: '60px', width: '90px' }"
                  >
                    <template #reference>
                      <div class="imgbox" @click.stop>
                        <img
                          src="@/assets/system/images/model/version/more.svg"
                          alt=""
                        />
                      </div>
                    </template>
                    <div class="popover-content">
                      <el-button
                        type="primary"
                        text
                        @click="handleUpdate(item)"
                      >
                        <Edit class="icon-mini" />
                        编辑</el-button
                      >
                      <el-button type="danger" text @click="handleDelete(item)">
                        <Delete class="icon-mini" />
                        删除</el-button
                      >
                    </div>
                  </el-popover>
                </div>
                <div
                  v-if="false"
                  class="item-desc ellipsis-3"
                  :title="item.description"
                >
                  {{ item.description }}
                </div>
                <div class="item-con">
                  <div class="con-l">
                    <div class="con-view">
                      <div class="con-view-title">版本号</div>
                      <tag
                        size="small"
                        type="primary"
                        :name="'Version' + item.version"
                      ></tag>
                    </div>
                    <div class="con-view">
                      <div class="con-view-title">接入方式</div>
                      <span v-if="String(item.accessType) === 'API' || String(item.accessType) === '0'">API接口</span>
                      <span v-else>python脚本</span>
                    </div>

                    <div class="con-view">
                      <div class="con-view-title">发布时间</div>
                      <span v-if="item.publishTime == null">-,-</span>
                      <span v-else>{{ item.publishTime }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </el-card>
          </div>

          <el-empty
            description="暂无数据，请添加模型"
            v-if="total == 0"
          ></el-empty>
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
  delModel,
  listModel,
} from "@/api/model/model";
import { Edit, Delete } from "@element-plus/icons-vue";
import { ElMessage, ElMessageBox } from "element-plus";

const { proxy } = getCurrentInstance();

const queryFormRef = ref(null);

// 遮罩层
const loading = ref(true);
// 选中数组
const ids = ref([]);
// 非单个禁用
const single = ref(true);
// 非多个禁用
const multiple = ref(true);
// 显示搜索条件
const showSearch = ref(true);
// 总条数
const total = ref(0);
// 模型管理 表格数据
const modelList = ref([]);

// 查询参数
const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  orderByColumn: "create_time",
  isAsc: "desc",
});

onMounted(() => {
  getList();
});

/** 查询模型管理 列表 */
const getList = () => {
  loading.value = true;
  listModel(queryParams).then((response) => {
    modelList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
};

/** 搜索按钮操作 */
const handleQuery = () => {
  queryParams.pageNum = 1;
  getList();
};

/** 重置按钮操作 */
const resetQuery = () => {
  if (queryFormRef.value) {
    queryFormRef.value.resetFields();
  }
  queryParams.classifyId = undefined;
  handleQuery();
};

// 多选框选中数据
const handleSelectionChange = (selection) => {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length !== 1;
  multiple.value = !selection.length;
};

/** 新增按钮操作 */
const handleAdd = () => {
  proxy.$router.push({
    path: "/model/modelManage/add"
  });
};

/** 修改按钮操作 */
const handleUpdate = (row) => {
  const id = row.id || ids.value;
  proxy.$router.push({
    path: "/model/modelManage/add",
    query: { id }
  });
};

// 详情
const handleView = (row) => {
  const modelId = row.id;
  const modelName = row.name;
  proxy.$router.push({
    path: "/model/modelManageView",
    query: {
      modelId,
      modelName,
      pageNum: queryParams.pageNum,
    },
  });
};

/** 删除按钮操作 */
const handleDelete = (row) => {
  const id = row.id || ids.value;
  const name = row.name;
  if (row.status == 1) {
    ElMessageBox.confirm("【" + name + "】模型已启用，请先停用！", "警告", {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    }).catch(() => {});
  } else {
    ElMessageBox.confirm(
      "是否确认删除名称为【" + name + "】的模型数据吗？",
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
</script>
<style lang="scss" scoped>
.pagecont-bottom {
  position: relative;
  flex: 1;
  min-height: calc(100vh - 250px);
  padding: 0px;
  background-color: transparent;
  border-radius: 2px;
  box-shadow: 0 5px 8px rgba(128, 145, 165, 0.1);
}
.card-box {
  width: 100%;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 15px;
  padding: 0;
  height: calc(100vh - 355px);
  overflow: auto;
  // height: 100px;
}
.pagefy {
  position: absolute;
  bottom: 0;
  width: 100%;
  background: #fff;
  padding: 11px 15px;
}

::v-deep {
  .selectlist .el-tag.el-tag--info {
    background: #f3f8ff !important;
    border: 0px solid #6ba7ff !important;
    color: #2666fb !important;
  }
}


.el-main {
  padding: 2px 0px;
  // box-shadow: 1px 1px 3px rgba(0, 0, 0, .2);
}

.el-aside {
  padding: 2px 0px;
  margin-bottom: 0px;
  background-color: #f0f2f5;
}


//上传附件样式调整
:deep {
  // .el-upload-list{
  //    display: flex;
  // }
  .el-upload-list__item {
    width: 100%;
    height: 25px;
  }

  .el-tree--highlight-current
    .el-tree-node.is-current
    > .el-tree-node__content {
    background-color: var(--el-color-primary-light-9) !important;
    border-right: 2px solid var(--el-color-primary);
    color: var(--el-color-primary);
  }
}

.card-item {
  .item-top {
    display: flex;
    align-items: center;
    justify-content: space-between;

    .top-title {
      width: 85%;
      font-weight: bold;
      font-size: 16px;
      display: flex;
      align-items: center;
      // line-height: 22px;
      // i {
      //   vertical-align: middle;
      // }
      span {
        margin-left: 11px;
      }
    }
    .imgbox {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      // background: #2666fb;
    }

    .top-status {
      width: 25%;
      display: flex;
      align-items: center;

      .status-icon {
        margin-right: 3px;
        width: 7px;
        height: 7px;
        border-radius: 50%;
        // background-color: rgb(255, 217, 74);
      }

      .status-name {
        // color: rgb(255, 217, 74);
        font-size: 14px;
        font-weight: bold;
      }
    }
  }

  .item-desc {
    min-height: 52px;
    color: #999;
    font-size: 14px;
    font-weight: 400;
    margin: 10px 0;
    line-height: 1.2;
  }

  .item-con {
    display: flex;
    align-items: center;
    border-top: 1px solid #ebeef5;
    // border-bottom: 1px solid #ebeef5;
    // padding: 10px 0;
    margin-top: 14px;

    .con-l {
      width: 100%;
      margin-top: 5px;
      .con-view {
        display: flex;
        align-items: center;
        text-align: left;
        font-weight: 400;
        margin-top: 11px;
        font-size: 14px;

        &:last-child {
          padding-bottom: 0px;
        }

        .con-view-title {
          width: 72px;
          color: rgb(144, 136, 156);
        }

        ::v-deep .el-tag {
          height: 17px;
          line-height: 15px;
          margin-bottom: 3px;
        }
      }
    }
  }
}

.card-btns {
  width: 100%;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 6px 0 10px;
}

.formClass {
  ::v-deep .vue-treeselect--disabled .vue-treeselect__control {
    background-color: #f5f7fa;
  }

  ::v-deep .vue-treeselect--disabled .vue-treeselect__single-value {
    color: #c0c4cc;
  }
}
:deep(.left-tree) {
  padding: 15px;
  overflow: hidden;
}
.head-container {
  ::v-deep
    .el-tree--highlight-current
    .el-tree-node.is-current
    > .el-tree-node__content {
    background-color: #cee5ff;
  }
}
:deep(.el-tree) {
  height: calc(100vh - 210px);
  overflow: auto;
}
:deep(.pagination-container) {
  margin-top: 4px !important;
  background: transparent;
}
:deep(.justify-between) {
  padding: 13px 15px;
  background: #fff;
}
:deep(.el-card) {
  border: 0px;
  border-radius: 2px 2px 2px 2px !important;
}
:deep(.el-col) {
  cursor: pointer;
}

.popover-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  // padding: 10px 0;
  min-width: 60px;
}
.btn {
  margin-left: 12px !important;
}

:deep(.el-button + .el-button) {
  margin-left: 12px;
}
:deep(.tag-rect) {
  border: 0;
}
:deep(.el-card__body) {
  padding: 12px 20px 13px 20px !important;
}
:deep(.el-card) {
  height: 178px;
  cursor: pointer;
}
:deep(.el-empty) {
  height: calc(100vh - 355px);
}
</style>
