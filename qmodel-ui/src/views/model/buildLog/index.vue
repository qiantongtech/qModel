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
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch">
     <el-form class="btn-style" :model="queryParams" ref="queryRef" :inline="true" label-width="75px" v-show="showSearch" @submit.prevent>
      <el-form-item label="模型文件id" prop="resourceId">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.resourceId"
            placeholder="请输入模型文件id"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模型id" prop="modelId">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.modelId"
            placeholder="请输入模型id"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模型名称" prop="modelName">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.modelName"
            placeholder="请输入模型名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版本id" prop="versionId">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.versionId"
            placeholder="请输入版本id"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开始时间" prop="startTime">
        <el-date-picker class="el-form-input-width"
            clearable
            v-model="queryParams.startTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结束时间" prop="endTime">
        <el-date-picker class="el-form-input-width"
            clearable
            v-model="queryParams.endTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="执行耗时" prop="duration">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.duration"
            placeholder="请输入执行耗时"
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
        <el-button plain type="primary" @click="handleQuery" @mousedown="(e) => e.preventDefault()">
          <i class="iconfont-mini icon-a-zu22377 mr5"></i>查询
        </el-button>
        <el-button @click="resetQuery" @mousedown="(e) => e.preventDefault()">
          <i class="iconfont-mini icon-a-zu22378 mr5"></i>重置
        </el-button>
      </el-form-item>
     </el-form>
    </div>

    <div  class="pagecont-bottom">
     <div class="justify-between mb15">
       <el-row :gutter="15" class="btn-style">
         <el-col :span="1.5">
           <el-button type="primary" plain @click="handleAdd" v-hasPermi="['model:buildLog:buildlog:add']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-xinzeng mr5"></i>新增
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="primary" plain :disabled="single" @click="handleUpdate" v-hasPermi="['model:buildLog:buildlog:edit']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-xiugai--copy mr5"></i>修改
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="danger" plain :disabled="multiple" @click="handleDelete" v-hasPermi="['model:buildLog:buildlog:remove']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-shanchu-huise mr5"></i>删除
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="info" plain  @click="handleImport" v-hasPermi="['model:buildLog:buildlog:export']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-upload-cloud-line mr5"></i>导入
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="warning" plain @click="handleExport" v-hasPermi="['model:buildLog:buildlog:export']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-download-line mr5"></i>导出
           </el-button>
         </el-col>
       </el-row>
       <div class="justify-end top-right-btn">
         <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
       </div>
     </div>
     <el-table stripe height="58vh" v-loading="loading" :data="modelBuildLogList" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
       <el-table-column type="selection" width="55" align="center" />
       <el-table-column v-if="getColumnVisibility(0)" label="ID" align="center" prop="id" />
       <el-table-column v-if="getColumnVisibility(1)" label="模型文件id" align="center" prop="resourceId">
         <template #default="scope">
           {{ scope.row.resourceId || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(2)" label="模型id" align="center" prop="modelId">
         <template #default="scope">
           {{ scope.row.modelId || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(3)" label="模型名称" align="center" prop="modelName">
         <template #default="scope">
           {{ scope.row.modelName || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(4)" label="版本id" align="center" prop="versionId">
         <template #default="scope">
           {{ scope.row.versionId || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(5)" label="构建类型" align="center" prop="buildType">
         <template #default="scope">
           {{ scope.row.buildType || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(6)" label="构建状态" align="center" prop="status">
         <template #default="scope">
           {{ scope.row.status || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(7)" label="开始时间" align="center" prop="startTime" width="180">
         <template #default="scope">
           <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(8)" label="结束时间" align="center" prop="endTime" width="180">
         <template #default="scope">
           <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(9)" label="执行耗时" align="center" prop="duration">
         <template #default="scope">
           {{ scope.row.duration || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(10)" label="已存在的依赖包列表JSON" align="center" prop="installedPackages">
         <template #default="scope">
           {{ scope.row.installedPackages || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(11)" label="缺失失败的依赖包列表JSON" align="center" prop="missingPackages">
         <template #default="scope">
           {{ scope.row.missingPackages || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(12)" label="安装失败的依赖包列表JSON" align="center" prop="failedPackages">
         <template #default="scope">
           {{ scope.row.failedPackages || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(13)" label="dockerFile内容" align="center" prop="dockerfileContent">
         <template #default="scope">
           {{ scope.row.dockerfileContent || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(14)" label="构建日志" align="center" prop="buildLog">
         <template #default="scope">
           {{ scope.row.buildLog || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(15)" label="错误日志" align="center" prop="errorMessage">
         <template #default="scope">
           {{ scope.row.errorMessage || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(16)" label="requirements.txt 内容" align="center" prop="requirements">
         <template #default="scope">
           {{ scope.row.requirements || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(19)" label="创建人" align="center" prop="createBy">
         <template #default="scope">
           {{ scope.row.createBy || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(21)" label="创建时间" align="center" prop="createTime" width="180" sortable="custom" :sort-orders="['descending', 'ascending']">
         <template #default="scope">
           <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(25)" label="备注" align="center" prop="remark">
         <template #default="scope">
           {{ scope.row.remark || '-' }}
         </template>
       </el-table-column>
       <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="240">
         <template #default="scope">
           <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                      v-hasPermi="['model:buildLog:buildlog:edit']">修改</el-button>
           <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)"
                      v-hasPermi="['model:buildLog:buildlog:remove']">删除</el-button>
           <el-button link type="primary" icon="view" @click="handleDetail(scope.row)"
                      v-hasPermi="['model:buildLog:buildlog:query']">详情</el-button>
           <el-button link type="primary" icon="view" @click="routeTo('/model/buildLog/modelBuildLogDetail',scope.row)"
                      v-hasPermi="['model:buildLog:buildlog:query']">复杂详情</el-button>
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

    <!-- 添加或修改构建日志对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="modelBuildLogRef" :model="form" :rules="rules" label-width="80px" @submit.prevent>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="模型文件id" prop="resourceId">
                <el-input v-model="form.resourceId" placeholder="请输入模型文件id" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="模型id" prop="modelId">
                <el-input v-model="form.modelId" placeholder="请输入模型id" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="模型名称" prop="modelName">
                <el-input v-model="form.modelName" placeholder="请输入模型名称" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="版本id" prop="versionId">
                <el-input v-model="form.versionId" placeholder="请输入版本id" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="开始时间" prop="startTime">
                <el-date-picker clearable
                                style="width: 100%"
                                v-model="form.startTime"
                                type="date"
                                value-format="YYYY-MM-DD HH:mm:ss"
                                placeholder="请选择开始时间">
                </el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="结束时间" prop="endTime">
                <el-date-picker clearable
                                style="width: 100%"
                                v-model="form.endTime"
                                type="date"
                                value-format="YYYY-MM-DD HH:mm:ss"
                                placeholder="请选择结束时间">
                </el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="执行耗时" prop="duration">
                <el-input v-model="form.duration" placeholder="请输入执行耗时" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="已存在的依赖包列表JSON" prop="installedPackages">
                <el-input v-model="form.installedPackages" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="缺失失败的依赖包列表JSON" prop="missingPackages">
                <el-input v-model="form.missingPackages" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="安装失败的依赖包列表JSON" prop="failedPackages">
                <el-input v-model="form.failedPackages" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="dockerFile内容">
                <editor v-model="form.dockerfileContent" :min-height="192"/>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="构建日志" prop="buildLog">
                <el-input v-model="form.buildLog" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="错误日志" prop="errorMessage">
                <el-input v-model="form.errorMessage" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="requirements.txt 内容" prop="requirements">
                <el-input v-model="form.requirements" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
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

    <!-- 构建日志详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="modelBuildLogRef" :model="form"  label-width="80px">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="模型文件id" prop="resourceId">
                <div>
                  {{ form.resourceId }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="模型id" prop="modelId">
                <div>
                  {{ form.modelId }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="模型名称" prop="modelName">
                <div>
                  {{ form.modelName }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="版本id" prop="versionId">
                <div>
                  {{ form.versionId }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="构建类型" prop="buildType">
                <div>
                  {{ form.buildType }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="构建状态" prop="status">
                <div>
                  {{ form.status }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="开始时间" prop="startTime">
                <el-date-picker clearable
                                style="width: 100%"
                                v-model="form.startTime"
                                type="date"
                                value-format="YYYY-MM-DD"
                                placeholder="请选择开始时间">
                </el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="结束时间" prop="endTime">
                <el-date-picker clearable
                                style="width: 100%"
                                v-model="form.endTime"
                                type="date"
                                value-format="YYYY-MM-DD"
                                placeholder="请选择结束时间">
                </el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="执行耗时" prop="duration">
                <div>
                  {{ form.duration }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="已存在的依赖包列表JSON" prop="installedPackages">
                <div>
                  {{ form.installedPackages }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="缺失失败的依赖包列表JSON" prop="missingPackages">
                <div>
                  {{ form.missingPackages }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="安装失败的依赖包列表JSON" prop="failedPackages">
                <div>
                  {{ form.failedPackages }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="dockerFile内容">
                <div v-html="form.dockerfileContent" ></div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="构建日志" prop="buildLog">
                <div>
                  {{ form.buildLog }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="错误日志" prop="errorMessage">
                <div>
                  {{ form.errorMessage }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="requirements.txt 内容" prop="requirements">
                <div>
                  {{ form.requirements }}
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
              <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的构建日志数据
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

<script setup name="ModelBuildLog">
  import { listModelBuildLog, getModelBuildLog, delModelBuildLog, addModelBuildLog, updateModelBuildLog } from "@/api/model/buildLog/modelBuildLog";
  import {getToken} from "@/utils/auth.js";

  const { proxy } = getCurrentInstance();

  const modelBuildLogList = ref([]);

  // 列显隐信息
  const columns = ref([
            { key: 1, label: "模型文件id", visible: true },
            { key: 2, label: "模型id", visible: true },
            { key: 3, label: "模型名称", visible: true },
            { key: 4, label: "版本id", visible: true },
            { key: 5, label: "构建类型", visible: true },
            { key: 6, label: "构建状态", visible: true },
            { key: 7, label: "开始时间", visible: true },
            { key: 8, label: "结束时间", visible: true },
            { key: 9, label: "执行耗时", visible: true },
            { key: 10, label: "已存在的依赖包列表JSON", visible: true },
            { key: 11, label: "缺失失败的依赖包列表JSON", visible: true },
            { key: 12, label: "安装失败的依赖包列表JSON", visible: true },
            { key: 13, label: "dockerFile内容", visible: true },
            { key: 14, label: "构建日志", visible: true },
            { key: 15, label: "错误日志", visible: true },
            { key: 16, label: "requirements.txt 内容", visible: true },
            { key: 19, label: "创建人", visible: true },
            { key: 21, label: "创建时间", visible: true },
            { key: 25, label: "备注", visible: true }
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
    url: import.meta.env.VITE_APP_BASE_API + "/model/modelBuildLog/importData"
  });

  const data = reactive({
    form: {},
    queryParams: {
      pageNum: 1,
      pageSize: 10,
        resourceId: null,
        modelId: null,
        modelName: null,
        versionId: null,
        buildType: null,
        status: null,
        startTime: null,
        endTime: null,
        duration: null,
        installedPackages: null,
        missingPackages: null,
        failedPackages: null,
        dockerfileContent: null,
        buildLog: null,
        errorMessage: null,
        requirements: null,
        createTime: null,
    },
    rules: {
        resourceId: [{ required: true, message: "模型文件id不能为空", trigger: "blur" }],
        validFlag: [{ required: true, message: "是否有效不能为空", trigger: "blur" }],
        delFlag: [{ required: true, message: "删除标志不能为空", trigger: "blur" }],
        createTime: [{ required: true, message: "创建时间不能为空", trigger: "blur" }],
        updateTime: [{ required: true, message: "更新时间不能为空", trigger: "blur" }],
    }
  });

  const { queryParams, form, rules } = toRefs(data);

  /** 查询构建日志列表 */
  function getList() {
    loading.value = true;
    listModelBuildLog(queryParams.value).then(response => {
            modelBuildLogList.value = response.data.rows;
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
        resourceId: null,
        modelId: null,
        modelName: null,
        versionId: null,
        buildType: null,
        status: null,
        startTime: null,
        endTime: null,
        duration: null,
        installedPackages: null,
        missingPackages: null,
        failedPackages: null,
        dockerfileContent: null,
        buildLog: null,
        errorMessage: null,
        requirements: null,
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
    proxy.resetForm("modelBuildLogRef");
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
    title.value = "添加构建日志";
  }

  /** 修改按钮操作 */
  function handleUpdate(row) {
    reset();
    const _id = row.id || ids.value
    getModelBuildLog(_id).then(response => {
      form.value = response.data;
      open.value = true;
      title.value = "修改构建日志";
    });
  }


  /** 详情按钮操作 */
  function handleDetail(row) {
    reset();
    const _id = row.id || ids.value
    getModelBuildLog(_id).then(response => {
      form.value = response.data;
      openDetail.value = true;
      title.value = "构建日志详情";
    });
  }

  /** 提交按钮 */
  function submitForm() {
    proxy.$refs["modelBuildLogRef"].validate(valid => {
      if (valid) {
        if (form.value.id != null) {
          updateModelBuildLog(form.value).then(response => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          }).catch(error => {
          });
        } else {
          addModelBuildLog(form.value).then(response => {
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
    proxy.$modal.confirm('是否确认删除构建日志编号为"' + _ids + '"的数据项？').then(function() {
      return delModelBuildLog(_ids);
    }).then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    }).catch(() => {});
  }

  /** 导出按钮操作 */
  function handleExport() {
    proxy.download('model/modelBuildLog/export', {
      ...queryParams.value
    }, `modelBuildLog_${new Date().getTime()}.xlsx`)
  }

  /** ---------------- 导入相关操作 -----------------**/
  /** 导入按钮操作 */
  function handleImport() {
    upload.title = "构建日志导入";
    upload.open = true;
  }

  /** 下载模板操作 */
  function importTemplate() {
    proxy.download("system/user/importTemplate", {
    }, `modelBuildLog_template_${new Date().getTime()}.xlsx`)
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
