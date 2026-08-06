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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch">
      <el-form class="btn-style" :model="queryParams" ref="queryRef" :inline="true"
               v-show="showSearch" @submit.prevent>
        <el-form-item label="名称" prop="name">
          <el-input
              class="el-form-input-width"
              v-model="queryParams.name"
              placeholder="请输入名称"
              clearable
              @keyup.enter="handleQuery"
          />
        </el-form-item>

        <el-form-item>
          <el-button plain type="primary" @click="handleQuery" @mousedown="(e) => e.preventDefault()">
            <i class="iconfont-mini icon-a-zu22377 mr5"></i>查询
          </el-button>
          <el-button @click="resetQuery" @mousedown="(e) => e.preventDefault()">
            <i class="iconfont-mini icon-a-zu22378 mr5"></i>重置
          </el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="pagecont-bottom">
      <div class="justify-between mb15">
        <el-row :gutter="15" class="btn-style">
          <el-col :span="1.5">
            <el-button type="primary" plain @click="handleAdd" v-hasPermi="['model:modelKey:key:add']"
                       @mousedown="(e) => e.preventDefault()">
              <i class="iconfont-mini icon-xinzeng mr5"></i>新增
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" plain :disabled="multiple" @click="handleDelete"
                       v-hasPermi="['model:modelKey:key:remove']"
                       @mousedown="(e) => e.preventDefault()">
              <i class="iconfont-mini icon-shanchu-huise mr5"></i>删除
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <div class="tip-content">
              <el-icon><InfoFilled/></el-icon>
              <span>密钥是调用模型的重要凭证，密钥长期有效，请不要将密钥共享至公开环境，妥善保管</span>
            </div>
          </el-col>
        </el-row>
        <div class="justify-end top-right-btn">
          <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </div>
      </div>
      <el-table stripe height="58vh" v-loading="loading" :data="modelKeyList" @selection-change="handleSelectionChange"
                :default-sort="defaultSort" @sort-change="handleSortChange">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column v-if="getColumnVisibility(0)" label="编号" align="center" prop="id" width="80"
                         sortable="custom" :sort-orders="['descending', 'ascending']"/>
        <el-table-column v-if="getColumnVisibility(1)" label="名称" align="left" width="120" prop="name"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            <span>{{ scope.row.name || "-" }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(2)" label="密钥" align="left" prop="apiKey"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            <span>{{ scope.row.apiKey || "-" }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(3)" label="描述" align="left" prop="description"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            <span>{{ scope.row.description || "-" }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(4)" label="最后使用时间" align="center" prop="lastUseTime"
                         width="140"
                         sortable="custom" :sort-orders="['descending', 'ascending']">
          <template #default="scope">
            <span>{{ parseTime(scope.row.lastUseTime, '{y}-{m}-{d}  {h}:{i}') || "-" }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(5)" label="备注" align="left" prop="remark"
                         :show-overflow-tooltip="{ effect: 'light' }">
          <template #default="scope">
            <span>{{ scope.row.remark || "-" }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(6)" label="创建人" align="center" width="120" prop="createBy">
          <template #default="scope">
            <span>{{ scope.row.createBy || "-" }}</span>
          </template>
        </el-table-column>
        <el-table-column v-if="getColumnVisibility(7)" label="创建时间" align="center" prop="createTime" width="140"
                         sortable="custom" :sort-orders="['descending', 'ascending']">
          <template #default="scope">
            <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}  {h}:{i}') || "-" }}</span>
          </template>
        </el-table-column>

        <el-table-column v-if="getColumnVisibility(8)" label="操作" align="center"
                         class-name="small-padding fixed-width" fixed="right" width="180">
          <template #default="scope">
            <el-button link type="primary" icon="CopyDocument" @click="copyKey(scope.row)"
                       v-hasPermi="['model:modelKey:key:copy']">复制密钥
            </el-button>
            <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)"
                       v-hasPermi="['model:modelKey:key:remove']">删除
            </el-button>
          </template>
        </el-table-column>

        <template #empty>
          <div class="emptyBg">
            <img src="@/assets/system/images/no_data/noData.png" alt=""/>
            <p>暂无记录</p>
          </div>
        </template>
      </el-table>

      <pagination
          v-show="total>0"
          :total="total"
          v-model:page="queryParams.pageNum"
          v-model:limit="queryParams.pageSize"
          @pagination="getList"
      />
    </div>

    <!-- 添加或修改模型访问 key对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="modelKeyRef" :model="form" :rules="rules" label-width="80px" @submit.prevent>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入名称"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="描述" prop="remark">
              <el-input v-model="form.description" type="textarea" placeholder="请输入描述" maxlength="200 个字符"
                        show-word-limit/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" maxlength="500 个字符"
                        show-word-limit/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="mini" @click="cancel">取 消</el-button>
          <el-button type="primary" size="mini" @click="submitForm">确 定</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 模型访问 key详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="modelKeyRef" :model="form" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="模型id" prop="modelId">
              <div>
                {{ form.modelId }}
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="key" prop="apiKey">
              <div>
                {{ form.apiKey }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <div>
                {{ form.remark }}
              </div>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="mini" @click="cancel">关 闭</el-button>
        </div>
      </template>
    </el-dialog>

  </div>
</template>

<script setup name="ModelKey">
import {addModelKey, delModelKey, getKey, listModelKey} from "@/api/model/modelKey.js";
import {parseTime} from "@/utils/anivia.js";

const {proxy} = getCurrentInstance();

const modelKeyList = ref([]);

// 列显隐信息
const columns = ref([
  {key: 0, label: "编号", visible: true},
  {key: 1, label: "名称", visible: true},
  {key: 2, label: "密钥", visible: true},
  {key: 3, label: "描述", visible: true},
  {key: 4, label: "最后使用时间", visible: true},
  {key: 5, label: "备注", visible: true},
  {key: 6, label: "创建人", visible: true},
  {key: 7, label: "创建时间", visible: true},
  {key: 8, label: "操作", visible: true}
]);

const getColumnVisibility = (key) => {
  const column = columns.value.find(col => col.key === key);
  // 如果没有找到对应列配置，默认显示
  if (!column) return true;
  // 如果找到对应列配置，根据visible属性来控制显示
  return column.visible;
};

const open = ref(false);
const openDetail = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const defaultSort = ref({prop: "createTime", order: "descending"});
const router = useRouter();

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    modelId: null,
    apiKey: null,
    createTime: null,
    name: null,
    orderByColumn: defaultSort.value.prop,
    isAsc: defaultSort.value.order

  },
  rules: {
    name: [{required: true, message: "名称不能为空", trigger: "blur"}]
  }
});

const {queryParams, form, rules} = toRefs(data);

/** 查询模型访问 key列表 */
function getList() {
  loading.value = true;
  listModelKey(queryParams.value).then(response => {
    modelKeyList.value = response.data.rows;
    total.value = response.data.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  openDetail.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    modelId: null,
    apiKey: null,
    validFlag: null,
    delFlag: null,
    createBy: null,
    creatorId: null,
    createTime: null,
    updateBy: null,
    updatorId: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("modelKeyRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}


/** 排序触发事件 */
function handleSortChange(column, prop, order) {
  queryParams.value.orderByColumn = column.prop;
  queryParams.value.isAsc = column.order;
  getList();
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "新增密钥";
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["modelKeyRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateModelKey(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        }).catch(error => {
        });
      } else {
        addModelKey(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        }).catch(error => {
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除密钥编号为"' + _ids + '"的数据项？').then(function () {
    return delModelKey(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

/** 复制密钥 */
function copyKey(row) {
  getKey(row.id).then(response => {
    let text = response.data
    const ta = document.createElement('textarea');
    ta.value = text;
    // ta.style.display = 'none';
    ta.style.position = 'fixed';
    ta.style.left = '-9999px';
    document.body.appendChild(ta);
    ta.select();
    document.execCommand('copy'); // 旧API
    ta.remove();
    proxy.$modal.msgSuccess("密钥已复制");
    // navigator.clipboard.writeText(response.data).then(() => {
    //   proxy.$modal.msgSuccess("密钥已复制");
    // })
  })
}

getList();
</script>

<style scoped lang="scss">
.tip-content {
  display: flex;
  gap: 2px;
  color: #888;
  font-size: 12px;
  line-height: 1.5;
  padding-top: 4px;
  align-items: center;
}
</style>
