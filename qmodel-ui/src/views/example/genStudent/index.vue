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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch">
     <el-form class="btn-style" :model="queryParams" ref="queryRef" :inline="true" label-width="75px" v-show="showSearch" @submit.prevent>
      <el-form-item label="姓名" prop="name">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.name"
            placeholder="请输入姓名"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="生日" >
        <el-date-picker
            class="el-form-input-width"
            v-model="daterangeBirthday"
            value-format="YYYY-MM-DD"
            type="daterange"
            range-separator="-"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.age"
            placeholder="请输入年龄"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学号" prop="studentNumber">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.studentNumber"
            placeholder="请输入学号"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班级" prop="grade">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.grade"
            placeholder="请输入班级"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-date-picker class="el-form-input-width"
            clearable
            v-model="queryParams.createTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="handleQuery" @mousedown="(e) => e.preventDefault()">
          <i class="iconfont-mini icon-a-chaxunxianxing mr5"></i>查询
        </el-button>
        <el-button @click="resetQuery" @mousedown="(e) => e.preventDefault()">
          <i class="iconfont-mini icon-a-shuaxinxianxing mr5"></i>重置
        </el-button>
      </el-form-item>
     </el-form>
    </div>

    <div  class="pagecont-bottom">
     <div class="justify-between mb15">
       <el-row :gutter="15" class="btn-style">
         <el-col :span="1.5">
           <el-button type="primary" plain @click="handleAdd" v-hasPermi="['example:genStudent:genstudent:add']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-xinzeng mr5"></i>新增
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="primary" plain :disabled="single" @click="handleUpdate" v-hasPermi="['example:genStudent:genstudent:edit']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-a-xiugaixianxing mr5"></i>修改
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="danger" plain :disabled="multiple" @click="handleDelete" v-hasPermi="['example:genStudent:genstudent:remove']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-a-shanchuxianxing mr5"></i>删除
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="info" plain  @click="handleImport" v-hasPermi="['example:genStudent:genstudent:export']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-daoru mr5"></i>导入
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="warning" plain :disabled="multiple" @click="handleExport" v-hasPermi="['example:genStudent:genstudent:export']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-daochu mr5"></i>导出
           </el-button>
         </el-col>
       </el-row>
       <div class="justify-end top-right-btn">
         <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
       </div>
     </div>
     <el-table stripe height="60vh" v-loading="loading" :data="genStudentList" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
       <el-table-column type="selection" width="55" align="center" />
       <el-table-column v-if="getColumnVisibility(0)" label="ID" align="center" prop="id" />
       <el-table-column v-if="getColumnVisibility(1)" label="姓名" align="center" prop="name">
         <template #default="scope">
           {{ scope.row.name || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(2)" label="学生照" align="center" prop="pictureUrl">
         <template #default="scope">
           {{ scope.row.pictureUrl || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(3)" label="教育经历" align="center" prop="experience">
         <template #default="scope">
           {{ scope.row.experience || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(4)" label="性别" align="center" prop="sex">
         <template #default="scope">
           {{ scope.row.sex || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(5)" label="生日" align="center" prop="birthday" width="180">
         <template #default="scope">
           <span>{{ parseTime(scope.row.birthday, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(6)" label="年龄" align="center" prop="age">
         <template #default="scope">
           {{ scope.row.age || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(7)" label="学号" align="center" prop="studentNumber">
         <template #default="scope">
           {{ scope.row.studentNumber || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(8)" label="班级" align="center" prop="grade">
         <template #default="scope">
           {{ scope.row.grade || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(9)" label="爱好" align="center" prop="hobby">
         <template #default="scope">
           {{ scope.row.hobby || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(12)" label="创建人" align="center" prop="createBy">
         <template #default="scope">
           {{ scope.row.createBy || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(14)" label="创建时间" align="center" prop="createTime" width="180" sortable="custom" :sort-orders="['descending', 'ascending']">
         <template #default="scope">
           <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(18)" label="备注" align="center" prop="remark">
         <template #default="scope">
           {{ scope.row.remark || '-' }}
         </template>
       </el-table-column>
       <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="240">
         <template #default="scope">
           <el-button link type="primary" @click="handleUpdate(scope.row)"
                      v-hasPermi="['example:genStudent:genstudent:edit']">
             <i class="iconfont-mini icon-a-xiugaixianxing mr5"></i>
             修改</el-button>
           <el-button link type="danger" @click="handleDelete(scope.row)"
                      v-hasPermi="['example:genStudent:genstudent:remove']">
             <i class="iconfont-mini icon-a-shanchuxianxing mr5"></i>
             删除</el-button>
           <el-button link type="primary" @click="handleDetail(scope.row)"
                      v-hasPermi="['example:genStudent:genstudent:edit']">
             <i class="iconfont-mini icon-a-yincangxianxing mr5"></i>
             详情</el-button>
           <el-button link type="primary" @click="routeTo('/example/genStudent/genStudentDetail',scope.row)"
                      v-hasPermi="['example:genStudent:genstudent:edit']">
             <i class="iconfont-mini icon-a-yincangxianxing mr5"></i>
             复杂详情</el-button>
         </template>
       </el-table-column>

       <template #empty>
         <div class="emptyBg">
           <img src="@/assets/system/images/no_data/noData.png" alt="" />
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

    <!-- 添加或修改学生对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="genStudentRef" :model="form" :rules="rules" label-width="80px" @submit.prevent>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="姓名" prop="name">
                <el-input v-model="form.name" placeholder="请输入姓名" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="学生照" prop="pictureUrl">
                <el-input v-model="form.pictureUrl" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="教育经历" prop="experience">
                <el-input v-model="form.experience" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="生日" prop="birthday">
                <el-date-picker clearable
                                style="width: 100%"
                                v-model="form.birthday"
                                type="date"
                                value-format="YYYY-MM-DD"
                                placeholder="请选择生日">
                </el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="年龄" prop="age">
                <el-input v-model="form.age" placeholder="请输入年龄" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="学号" prop="studentNumber">
                <el-input v-model="form.studentNumber" placeholder="请输入学号" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="班级" prop="grade">
                <el-input v-model="form.grade" placeholder="请输入班级" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="爱好" prop="hobby">
                <el-input v-model="form.hobby" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="备注" prop="remark">
                <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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

    <!-- 学生详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="genStudentRef" :model="form"  label-width="80px">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="姓名" prop="name">
                <div>
                  {{ form.name }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="学生照" prop="pictureUrl">
                <div>
                  {{ form.pictureUrl }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="教育经历" prop="experience">
                <div>
                  {{ form.experience }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="性别" prop="sex">
                <div>
                  {{ form.sex }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="生日" prop="birthday">
                <el-date-picker clearable
                                style="width: 100%"
                                v-model="form.birthday"
                                type="date"
                                value-format="YYYY-MM-DD"
                                placeholder="请选择生日">
                </el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="年龄" prop="age">
                <div>
                  {{ form.age }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="学号" prop="studentNumber">
                <div>
                  {{ form.studentNumber }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="班级" prop="grade">
                <div>
                  {{ form.grade }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="爱好" prop="hobby">
                <div>
                  {{ form.hobby }}
                </div>
              </el-form-item>
            </el-col>
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

    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" v-model="upload.open" width="800px"  :append-to="$refs['app-container']" draggable destroy-on-close>
      <el-upload
          ref="uploadRef"
          :limit="1"
          accept=".xlsx, .xls"
          :headers="upload.headers"
          :action="upload.url + '?updateSupport=' + upload.updateSupport"
          :disabled="upload.isUploading"
          :on-progress="handleFileUploadProgress"
          :on-success="handleFileSuccess"
          :auto-upload="false"
          drag
      >
        <el-icon class="el-icon--upload"><upload-filled /></el-icon>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <template #tip>
          <div class="el-upload__tip text-center">
            <div class="el-upload__tip">
              <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的学生数据
            </div>
            <span>仅允许导入xls、xlsx格式文件。</span>
            <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;" @click="importTemplate">下载模板</el-link>
          </div>
        </template>
      </el-upload>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="upload.open = false">取 消</el-button>
          <el-button type="primary" @click="submitFileForm">确 定</el-button>
        </div>
      </template>
    </el-dialog>

  </div>
</template>

<script setup name="GenStudent">
  import { listGenStudent, getGenStudent, delGenStudent, addGenStudent, updateGenStudent } from "@/api/example/genStudent/genStudent";
  import {getToken} from "@/utils/auth.js";

  const { proxy } = getCurrentInstance();

  const genStudentList = ref([]);

  // 列显隐信息
  const columns = ref([
            { key: 1, label: "姓名", visible: true },
            { key: 2, label: "学生照", visible: true },
            { key: 3, label: "教育经历", visible: true },
            { key: 4, label: "性别", visible: true },
            { key: 5, label: "生日", visible: true },
            { key: 6, label: "年龄", visible: true },
            { key: 7, label: "学号", visible: true },
            { key: 8, label: "班级", visible: true },
            { key: 9, label: "爱好", visible: true },
            { key: 12, label: "创建人", visible: true },
            { key: 14, label: "创建时间", visible: true },
            { key: 18, label: "备注", visible: true }
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
          const daterangeBirthday = ref([]);
  const defaultSort = ref({ prop: "createTime", order: "desc" });
  const router = useRouter();

  /*** 用户导入参数 */
  const upload = reactive({
    // 是否显示弹出层（用户导入）
    open: false,
    // 弹出层标题（用户导入）
    title: "",
    // 是否禁用上传
    isUploading: false,
    // 是否更新已经存在的用户数据
    updateSupport: 0,
    // 设置上传的请求头部
    headers: { Authorization: "Bearer " + getToken() },
    // 上传的地址
    url: import.meta.env.VITE_APP_BASE_API + "/example/genStudent/importData"
  });

  const data = reactive({
    form: {},
    queryParams: {
      pageNum: 1,
      pageSize: 10,
        name: null,
        pictureUrl: null,
        experience: null,
        sex: null,
        birthday: null,
        age: null,
        studentNumber: null,
        grade: null,
        hobby: null,
        createTime: null,
    },
    rules: {
        name: [{ required: true, message: "姓名不能为空", trigger: "blur" }],
        age: [{ required: true, message: "年龄不能为空", trigger: "blur" }],
        validFlag: [{ required: true, message: "是否有效不能为空", trigger: "blur" }],
        delFlag: [{ required: true, message: "删除标志不能为空", trigger: "blur" }],
        createTime: [{ required: true, message: "创建时间不能为空", trigger: "blur" }],
        updateTime: [{ required: true, message: "更新时间不能为空", trigger: "blur" }],
    }
  });

  const { queryParams, form, rules } = toRefs(data);

  /** 查询学生列表 */
  function getList() {
    loading.value = true;
            queryParams.value.params = {};
            if (null != daterangeBirthday && '' != daterangeBirthday) {
              queryParams.value.params["beginBirthday"] = daterangeBirthday.value[0];
              queryParams.value.params["endBirthday"] = daterangeBirthday.value[1];
            }
    listGenStudent(queryParams.value).then(response => {
            genStudentList.value = response.data.rows;
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
        name: null,
        pictureUrl: null,
        experience: null,
        sex: null,
        birthday: null,
        age: null,
        studentNumber: null,
        grade: null,
        hobby: null,
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
    proxy.resetForm("genStudentRef");
  }

  /** 搜索按钮操作 */
  function handleQuery() {
    queryParams.value.pageNum = 1;
    getList();
  }

  /** 重置按钮操作 */
  function resetQuery() {
            daterangeBirthday.value = [];
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
    title.value = "添加学生";
  }

  /** 修改按钮操作 */
  function handleUpdate(row) {
    reset();
    const _id = row.id || ids.value
    getGenStudent(_id).then(response => {
      form.value = response.data;
      open.value = true;
      title.value = "修改学生";
    });
  }


  /** 详情按钮操作 */
  function handleDetail(row) {
    reset();
    const _id = row.id || ids.value
    getGenStudent(_id).then(response => {
      form.value = response.data;
      openDetail.value = true;
      title.value = "学生详情";
    });
  }

  /** 提交按钮 */
  function submitForm() {
    proxy.$refs["genStudentRef"].validate(valid => {
      if (valid) {
        if (form.value.id != null) {
          updateGenStudent(form.value).then(response => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          }).catch(error => {
          });
        } else {
          addGenStudent(form.value).then(response => {
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
    proxy.$modal.confirm('是否确认删除学生编号为"' + _ids + '"的数据项？').then(function() {
      return delGenStudent(_ids);
    }).then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    }).catch(() => {});
  }

  /** 导出按钮操作 */
  function handleExport() {
    proxy.download('example/genStudent/export', {
      ...queryParams.value
    }, `genStudent_${new Date().getTime()}.xlsx`)
  }

  /** ---------------- 导入相关操作 -----------------**/
  /** 导入按钮操作 */
  function handleImport() {
    upload.title = "学生导入";
    upload.open = true;
  }

  /** 下载模板操作 */
  function importTemplate() {
    proxy.download("system/user/importTemplate", {
    }, `genStudent_template_${new Date().getTime()}.xlsx`)
  }

  /** 提交上传文件 */
  function submitFileForm() {
    proxy.$refs["uploadRef"].submit();
  };

  /**文件上传中处理 */
  const handleFileUploadProgress = (event, file, fileList) => {
    upload.isUploading = true;
  };

  /** 文件上传成功处理 */
  const handleFileSuccess = (response, file, fileList) => {
    upload.open = false;
    upload.isUploading = false;
    proxy.$refs["uploadRef"].handleRemove(file);
    proxy.$alert("<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
    getList();
  };
  /** ---------------------------------**/

  function routeTo(link, row) {
    if (link !== "" && link.indexOf("http") !== -1) {
      window.location.href = link;
      return
    }
    if (link !== "") {
      if(link === router.currentRoute.value.path) {
        window.location.reload();
      } else {
        router.push({
          path: link,
          query: {
            id:row.id
          }
        });
      }
    }
  }

  getList();
</script>
