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
      <el-form-item label="计算任务ID" prop="calcId">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.calcId"
            placeholder="请输入计算任务ID"
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
      <el-form-item label="执行批次号" prop="executionNo">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.executionNo"
            placeholder="请输入执行批次号"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="执行模式：1-手动触发 2-定时调度 3-重试执行" prop="executionMode">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.executionMode"
            placeholder="请输入执行模式：1-手动触发 2-定时调度 3-重试执行"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中" prop="status">
        <el-select class="el-form-input-width" v-model="queryParams.status" placeholder="请选择执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中" clearable>
          <el-option
              v-for="dict in ${dictType}"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
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
      <el-form-item label="耗时(毫秒)" prop="duration">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.duration"
            placeholder="请输入耗时(毫秒)"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="当前重试次数" prop="retryCount">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.retryCount"
            placeholder="请输入当前重试次数"
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
           <el-button type="primary" plain @click="handleAdd" v-hasPermi="['model:calcExecution:calcexecution:add']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-xinzeng mr5"></i>新增
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="primary" plain :disabled="single" @click="handleUpdate" v-hasPermi="['model:calcExecution:calcexecution:edit']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-xiugai--copy mr5"></i>修改
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="danger" plain :disabled="multiple" @click="handleDelete" v-hasPermi="['model:calcExecution:calcexecution:remove']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-shanchu-huise mr5"></i>删除
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="info" plain  @click="handleImport" v-hasPermi="['model:calcExecution:calcexecution:export']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-upload-cloud-line mr5"></i>导入
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="warning" plain @click="handleExport" v-hasPermi="['model:calcExecution:calcexecution:export']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-download-line mr5"></i>导出
           </el-button>
         </el-col>
       </el-row>
       <div class="justify-end top-right-btn">
         <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
       </div>
     </div>
     <el-table stripe height="58vh" v-loading="loading" :data="calcExecutionList" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
       <el-table-column type="selection" width="55" align="center" />
       <el-table-column v-if="getColumnVisibility(0)" label="ID" align="center" prop="id" />
       <el-table-column v-if="getColumnVisibility(1)" label="计算任务ID" align="center" prop="calcId">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.calcId"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(2)" label="模型id" align="center" prop="modelId">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.modelId"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(3)" label="执行批次号" align="center" prop="executionNo">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.executionNo"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(4)" label="执行模式：1-手动触发 2-定时调度 3-重试执行" align="center" prop="executionMode">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.executionMode"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(5)" label="执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中" align="center" prop="status">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.status"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(6)" label="开始时间" align="center" prop="startTime" width="180">
         <template #default="scope">
           <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(7)" label="结束时间" align="center" prop="endTime" width="180">
         <template #default="scope">
           <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(8)" label="耗时(毫秒)" align="center" prop="duration">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.duration"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(9)" label="输入参数快照(JSON，记录执行时的实际参数)" align="center" prop="inputParams">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.inputParams"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(10)" label="输出结果(JSON)" align="center" prop="outputResult">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.outputResult"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(11)" label="执行日志" align="center" prop="executionLog">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.executionLog"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(12)" label="错误信息" align="center" prop="errorMessage">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.errorMessage"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(13)" label="当前重试次数" align="center" prop="retryCount">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.retryCount"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(14)" label="资源使用情况(JSON，如CPU、内存、GPU使用)" align="center" prop="resourceUsage">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.resourceUsage"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(17)" label="创建人" align="center" prop="createBy">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.createBy"/>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(19)" label="创建时间" align="center" prop="createTime" width="180" sortable="custom" :sort-orders="['descending', 'ascending']">
         <template #default="scope">
           <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(23)" label="备注" align="center" prop="remark">
         <template #default="scope">
               <dict-tag :options="${column.dictType}" :value="scope.row.remark"/>
         </template>
       </el-table-column>
       <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="240">
         <template #default="scope">
           <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                      v-hasPermi="['model:calcExecution:calcexecution:edit']">修改</el-button>
           <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)"
                      v-hasPermi="['model:calcExecution:calcexecution:remove']">删除</el-button>
           <el-button link type="primary" icon="view" @click="handleDetail(scope.row)"
                      v-hasPermi="['model:calcExecution:calcexecution:query']">详情</el-button>
           <el-button link type="primary" icon="view" @click="routeTo('/model/calcExecution/calcExecutionDetail',scope.row)"
                      v-hasPermi="['model:calcExecution:calcexecution:query']">复杂详情</el-button>
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

    <!-- 添加或修改模型计算执行记录对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="calcExecutionRef" :model="form" :rules="rules" label-width="80px" @submit.prevent>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="计算任务ID" prop="calcId">
                <el-input v-model="form.calcId" placeholder="请输入计算任务ID" />
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
              <el-form-item label="执行批次号" prop="executionNo">
                <el-input v-model="form.executionNo" placeholder="请输入执行批次号" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="执行模式：1-手动触发 2-定时调度 3-重试执行" prop="executionMode">
                <el-input v-model="form.executionMode" placeholder="请输入执行模式：1-手动触发 2-定时调度 3-重试执行" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中" prop="status">
                <el-radio-group v-model="form.status">
                  <el-radio
                      v-for="dict in ${dictType}"
                      :key="dict.value"
                      :label="parseInt(dict.value)"
                  >{{dict.label}}</el-radio>
                </el-radio-group>
              </el-form-item>
            </el-col>
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
          </el-row>
          <el-row :gutter="20">
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
            <el-col :span="12">
              <el-form-item label="耗时(毫秒)" prop="duration">
                <el-input v-model="form.duration" placeholder="请输入耗时(毫秒)" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="输入参数快照(JSON，记录执行时的实际参数)" prop="inputParams">
                <el-input v-model="form.inputParams" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="输出结果(JSON)" prop="outputResult">
                <el-input v-model="form.outputResult" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="执行日志" prop="executionLog">
                <el-input v-model="form.executionLog" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="错误信息" prop="errorMessage">
                <el-input v-model="form.errorMessage" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="当前重试次数" prop="retryCount">
                <el-input v-model="form.retryCount" placeholder="请输入当前重试次数" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="资源使用情况(JSON，如CPU、内存、GPU使用)" prop="resourceUsage">
                <el-input v-model="form.resourceUsage" type="textarea" placeholder="请输入内容" />
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

    <!-- 模型计算执行记录详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="calcExecutionRef" :model="form"  label-width="80px">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="计算任务ID" prop="calcId">
                <div>
                  {{ form.calcId }}
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
              <el-form-item label="执行批次号" prop="executionNo">
                <div>
                  {{ form.executionNo }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="执行模式：1-手动触发 2-定时调度 3-重试执行" prop="executionMode">
                <div>
                  {{ form.executionMode }}
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
          </el-row>
          <el-row :gutter="20">
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
            <el-col :span="12">
              <el-form-item label="耗时(毫秒)" prop="duration">
                <div>
                  {{ form.duration }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="输入参数快照(JSON，记录执行时的实际参数)" prop="inputParams">
                <div>
                  {{ form.inputParams }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="输出结果(JSON)" prop="outputResult">
                <div>
                  {{ form.outputResult }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="执行日志" prop="executionLog">
                <div>
                  {{ form.executionLog }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="错误信息" prop="errorMessage">
                <div>
                  {{ form.errorMessage }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="当前重试次数" prop="retryCount">
                <div>
                  {{ form.retryCount }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="资源使用情况(JSON，如CPU、内存、GPU使用)" prop="resourceUsage">
                <div>
                  {{ form.resourceUsage }}
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
              <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的模型计算执行记录数据
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

<script setup name="CalcExecution">
  import { listCalcExecution, getCalcExecution, delCalcExecution, addCalcExecution, updateCalcExecution } from "@/api/model/calcExecution/calcExecution";
  import {getToken} from "@/utils/auth.js";

  const { proxy } = getCurrentInstance();

  const calcExecutionList = ref([]);

  // 列显隐信息
  const columns = ref([
            { key: 1, label: "计算任务ID", visible: true },
            { key: 2, label: "模型id", visible: true },
            { key: 3, label: "执行批次号（yyyyMMddHHmmss）", visible: true },
            { key: 4, label: "执行模式：1-手动触发 2-定时调度 3-重试执行", visible: true },
            { key: 5, label: "执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中", visible: true },
            { key: 6, label: "开始时间", visible: true },
            { key: 7, label: "结束时间", visible: true },
            { key: 8, label: "耗时(毫秒)", visible: true },
            { key: 9, label: "输入参数快照(JSON，记录执行时的实际参数)", visible: true },
            { key: 10, label: "输出结果(JSON)", visible: true },
            { key: 11, label: "执行日志", visible: true },
            { key: 12, label: "错误信息", visible: true },
            { key: 13, label: "当前重试次数", visible: true },
            { key: 14, label: "资源使用情况(JSON，如CPU、内存、GPU使用)", visible: true },
            { key: 17, label: "创建人", visible: true },
            { key: 19, label: "创建时间", visible: true },
            { key: 23, label: "备注", visible: true }
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
    url: import.meta.env.VITE_APP_BASE_API + "/model/calcExecution/importData"
  });

  const data = reactive({
    form: {},
    queryParams: {
      pageNum: 1,
      pageSize: 10,
        calcId: null,
        modelId: null,
        executionNo: null,
        executionMode: null,
        status: null,
        startTime: null,
        endTime: null,
        duration: null,
        inputParams: null,
        outputResult: null,
        executionLog: null,
        errorMessage: null,
        retryCount: null,
        resourceUsage: null,
        createTime: null,
    },
    rules: {
        calcId: [{ required: true, message: "计算任务ID不能为空", trigger: "blur" }],
        modelId: [{ required: true, message: "模型id不能为空", trigger: "blur" }],
        validFlag: [{ required: true, message: "是否有效不能为空", trigger: "blur" }],
        delFlag: [{ required: true, message: "删除标志不能为空", trigger: "blur" }],
        createTime: [{ required: true, message: "创建时间不能为空", trigger: "blur" }],
        updateTime: [{ required: true, message: "更新时间不能为空", trigger: "blur" }],
    }
  });

  const { queryParams, form, rules } = toRefs(data);

  /** 查询模型计算执行记录列表 */
  function getList() {
    loading.value = true;
    listCalcExecution(queryParams.value).then(response => {
            calcExecutionList.value = response.data.rows;
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
        calcId: null,
        modelId: null,
        executionNo: null,
        executionMode: null,
        status: null,
        startTime: null,
        endTime: null,
        duration: null,
        inputParams: null,
        outputResult: null,
        executionLog: null,
        errorMessage: null,
        retryCount: null,
        resourceUsage: null,
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
    proxy.resetForm("calcExecutionRef");
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
    title.value = "添加模型计算执行记录";
  }

  /** 修改按钮操作 */
  function handleUpdate(row) {
    reset();
    const _id = row.id || ids.value
    getCalcExecution(_id).then(response => {
      form.value = response.data;
      open.value = true;
      title.value = "修改模型计算执行记录";
    });
  }


  /** 详情按钮操作 */
  function handleDetail(row) {
    reset();
    const _id = row.id || ids.value
    getCalcExecution(_id).then(response => {
      form.value = response.data;
      openDetail.value = true;
      title.value = "模型计算执行记录详情";
    });
  }

  /** 提交按钮 */
  function submitForm() {
    proxy.$refs["calcExecutionRef"].validate(valid => {
      if (valid) {
        if (form.value.id != null) {
          updateCalcExecution(form.value).then(response => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          }).catch(error => {
          });
        } else {
          addCalcExecution(form.value).then(response => {
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
    proxy.$modal.confirm('是否确认删除模型计算执行记录编号为"' + _ids + '"的数据项？').then(function() {
      return delCalcExecution(_ids);
    }).then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    }).catch(() => {});
  }

  /** 导出按钮操作 */
  function handleExport() {
    proxy.download('model/calcExecution/export', {
      ...queryParams.value
    }, `calcExecution_${new Date().getTime()}.xlsx`)
  }

  /** ---------------- 导入相关操作 -----------------**/
  /** 导入按钮操作 */
  function handleImport() {
    upload.title = "模型计算执行记录导入";
    upload.open = true;
  }

  /** 下载模板操作 */
  function importTemplate() {
    proxy.download("system/user/importTemplate", {
    }, `calcExecution_template_${new Date().getTime()}.xlsx`)
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
