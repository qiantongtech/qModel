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
  <div class="justify-between mb15">
    <el-row :gutter="15" class="btn-style">
      <el-col :span="1.5">
        <el-button type="primary" plain @click="handleAdd" v-hasPermi="['Calc:calc:add']"
                   @mousedown="(e) => e.preventDefault()">
          <i class="iconfont-mini icon-xinzeng mr5"></i>新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain @click="handleExport" v-hasPermi="['Calc:calc:export']"
                   @mousedown="(e) => e.preventDefault()">
          <i class="iconfont-mini icon-download-line mr5"></i>导出
        </el-button>
      </el-col>
    </el-row>
    <div class="justify-end top-right-btn">
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </div>
  </div>
  <el-table stripe height="374px" v-loading="loading" :data="calcList" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
    <el-table-column type="selection" width="55" align="center" />
            <el-table-column v-if="columns[0].visible" label="ID" align="center" prop="id" />
            <el-table-column v-if="columns[1].visible" label="租户/公司ID" align="center" prop="companyId">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.companyId"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[2].visible" label="计算编码" align="center" prop="code">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.code"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[3].visible" label="任务名称" align="center" prop="name">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.name"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[4].visible" label="模型分类ID" align="center" prop="classifyId">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.classifyId"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[5].visible" label="模型分类名称" align="center" prop="classifyName">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.classifyName"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[6].visible" label="关联模型ID" align="center" prop="modelId">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.modelId"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[7].visible" label="模型名称" align="center" prop="modelName">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.modelName"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[8].visible" label="模型版本号" align="center" prop="modelVersion">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.modelVersion"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[9].visible" label="模型版本ID" align="center" prop="modelVersionId">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.modelVersionId"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[10].visible" label="描述" align="center" prop="description">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.description"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[11].visible" label="输入参数(JSON格式)" align="center" prop="inputParams">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.inputParams"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[12].visible" label="输出结果(JSON格式)" align="center" prop="outputResult">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.outputResult"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[13].visible" label="开始时间" align="center" prop="startTime" width="180">
              <template #default="scope">
                <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[14].visible" label="结束时间" align="center" prop="endTime" width="180">
              <template #default="scope">
                <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[15].visible" label="耗时(毫秒)" align="center" prop="duration">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.duration"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[16].visible" label="计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中" align="center" prop="status">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.status"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[17].visible" label="超时时间(秒)" align="center" prop="timeoutSeconds">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.timeoutSeconds"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[18].visible" label="已重试次数" align="center" prop="retryCount">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.retryCount"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[19].visible" label="最大重试次数" align="center" prop="maxRetryCount">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.maxRetryCount"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[20].visible" label="优先级:1-高,2-中,3-低" align="center" prop="priority">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.priority"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[21].visible" label="错误信息" align="center" prop="errorMessage">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.errorMessage"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[22].visible" label="文件或接口资源ID" align="center" prop="resourceId">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.resourceId"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[23].visible" label="接入方式: 0-API接口, 1-Python本地" align="center" prop="calcType">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.calcType"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[26].visible" label="创建人" align="center" prop="createBy">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.createBy"/>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[28].visible" label="创建时间" align="center" prop="createTime" width="180" sortable="custom" :sort-orders="['descending', 'ascending']">
              <template #default="scope">
                <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[32].visible" label="备注" align="center" prop="remark">
              <template #default="scope">
                    <dict-tag :options="${column.dictType}" :value="scope.row.remark"/>
              </template>
            </el-table-column>
    <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="240">
      <template #default="scope">
        <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                   v-hasPermi="['Calc:calc:edit']">修改</el-button>
        <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)"
                   v-hasPermi="['Calc:calc:remove']">删除</el-button>
        <el-button link type="primary" icon="view" @click="handleDetail(scope.row)"
                   v-hasPermi="['Calc:calc:edit']">详情</el-button>
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

  <!-- 添加或修改模型计算任务对话框 -->
  <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
    <template #header="{ close, titleId, titleClass }">
          <span role="heading" aria-level="2" class="el-dialog__title">
            {{ title }}
            <el-icon size="20" style="color: #909399; font-size: 16px">
              <InfoFilled />
            </el-icon>
          </span>
      <button aria-label="el.dialog.close" class="el-dialog__headerbtn" type="button">
        <i class="el-icon el-dialog__close"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024">
          <path fill="currentColor"
                d="M764.288 214.592 512 466.88 259.712 214.592a31.936 31.936 0 0 0-45.12 45.12L466.752 512 214.528 764.224a31.936 31.936 0 1 0 45.12 45.184L512 557.184l252.288 252.288a31.936 31.936 0 0 0 45.12-45.12L557.12 512.064l252.288-252.352a31.936 31.936 0 1 0-45.12-45.184z">
          </path>
        </svg></i>
      </button>
    </template>
    <el-form ref="calcRef" :model="form" :rules="rules" label-width="80px">
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="租户/公司ID" prop="companyId">
                          <el-input v-model="form.companyId" placeholder="请输入租户/公司ID" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="计算编码" prop="code">
                          <el-input v-model="form.code" placeholder="请输入计算编码" />
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="任务名称" prop="name">
                          <el-input v-model="form.name" placeholder="请输入任务名称" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="模型分类ID" prop="classifyId">
                          <el-input v-model="form.classifyId" placeholder="请输入模型分类ID" />
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="模型分类名称" prop="classifyName">
                          <el-input v-model="form.classifyName" placeholder="请输入模型分类名称" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="关联模型ID" prop="modelId">
                          <el-input v-model="form.modelId" placeholder="请输入关联模型ID" />
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
                        <el-form-item label="模型版本号" prop="modelVersion">
                          <el-input v-model="form.modelVersion" placeholder="请输入模型版本号" />
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="模型版本ID" prop="modelVersionId">
                          <el-input v-model="form.modelVersionId" placeholder="请输入模型版本ID" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="24">
                        <el-form-item label="描述" prop="description">
                          <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="24">
                        <el-form-item label="输入参数(JSON格式)" prop="inputParams">
                          <el-input v-model="form.inputParams" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="24">
                        <el-form-item label="输出结果(JSON格式)" prop="outputResult">
                          <el-input v-model="form.outputResult" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="开始时间" prop="startTime">
                          <el-date-picker clearable
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
                        <el-form-item label="耗时(毫秒)" prop="duration">
                          <el-input v-model="form.duration" placeholder="请输入耗时(毫秒)" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中" prop="status">
                          <el-radio-group v-model="form.status">
                            <el-radio
                                v-for="dict in ${dictType}"
                                :key="dict.value"
                                :label="parseInt(dict.value)"
                            >{{dict.label}}</el-radio>
                          </el-radio-group>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="超时时间(秒)" prop="timeoutSeconds">
                          <el-input v-model="form.timeoutSeconds" placeholder="请输入超时时间(秒)" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="已重试次数" prop="retryCount">
                          <el-input v-model="form.retryCount" placeholder="请输入已重试次数" />
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="最大重试次数" prop="maxRetryCount">
                          <el-input v-model="form.maxRetryCount" placeholder="请输入最大重试次数" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="优先级:1-高,2-中,3-低" prop="priority">
                          <el-input v-model="form.priority" placeholder="请输入优先级:1-高,2-中,3-低" />
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="24">
                        <el-form-item label="错误信息" prop="errorMessage">
                          <el-input v-model="form.errorMessage" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="文件或接口资源ID" prop="resourceId">
                          <el-input v-model="form.resourceId" placeholder="请输入文件或接口资源ID" />
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="接入方式: 0-API接口, 1-Python本地" prop="calcType">
                          <el-select v-model="form.calcType" placeholder="请选择接入方式: 0-API接口, 1-Python本地">
                            <el-option
                                v-for="dict in ${dictType}"
                                :key="dict.value"
                                :label="dict.label"
                                :value="parseInt(dict.value)"
                            ></el-option>
                          </el-select>
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

  <!-- 模型计算任务详情对话框 -->
  <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
    <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
          <el-icon size="20" style="color: #909399; font-size: 16px">
            <InfoFilled />
          </el-icon>
        </span>
      <button aria-label="el.dialog.close" class="el-dialog__headerbtn" type="button">
        <i class="el-icon el-dialog__close"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024">
          <path fill="currentColor"
                d="M764.288 214.592 512 466.88 259.712 214.592a31.936 31.936 0 0 0-45.12 45.12L466.752 512 214.528 764.224a31.936 31.936 0 1 0 45.12 45.184L512 557.184l252.288 252.288a31.936 31.936 0 0 0 45.12-45.12L557.12 512.064l252.288-252.352a31.936 31.936 0 1 0-45.12-45.184z">
          </path>
        </svg></i>
      </button>
    </template>
    <el-form ref="calcRef" :model="form"  label-width="80px">
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="租户/公司ID" prop="companyId">
                          <div>
                            {{ form.companyId }}
                          </div>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="计算编码" prop="code">
                          <div>
                            {{ form.code }}
                          </div>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="任务名称" prop="name">
                          <div>
                            {{ form.name }}
                          </div>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="模型分类ID" prop="classifyId">
                          <div>
                            {{ form.classifyId }}
                          </div>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="模型分类名称" prop="classifyName">
                          <div>
                            {{ form.classifyName }}
                          </div>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="关联模型ID" prop="modelId">
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
                        <el-form-item label="模型版本号" prop="modelVersion">
                          <div>
                            {{ form.modelVersion }}
                          </div>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="模型版本ID" prop="modelVersionId">
                          <div>
                            {{ form.modelVersionId }}
                          </div>
                        </el-form-item>
                      </el-col>
                      <el-col :span="24">
                        <el-form-item label="描述" prop="description">
                          <div>
                            {{ form.description }}
                          </div>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="24">
                        <el-form-item label="输入参数(JSON格式)" prop="inputParams">
                          <div>
                            {{ form.inputParams }}
                          </div>
                        </el-form-item>
                      </el-col>
                      <el-col :span="24">
                        <el-form-item label="输出结果(JSON格式)" prop="outputResult">
                          <div>
                            {{ form.outputResult }}
                          </div>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="开始时间" prop="startTime">
                          <el-date-picker clearable
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
                        <el-form-item label="耗时(毫秒)" prop="duration">
                          <div>
                            {{ form.duration }}
                          </div>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="超时时间(秒)" prop="timeoutSeconds">
                          <div>
                            {{ form.timeoutSeconds }}
                          </div>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="已重试次数" prop="retryCount">
                          <div>
                            {{ form.retryCount }}
                          </div>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="12">
                        <el-form-item label="最大重试次数" prop="maxRetryCount">
                          <div>
                            {{ form.maxRetryCount }}
                          </div>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="优先级:1-高,2-中,3-低" prop="priority">
                          <div>
                            {{ form.priority }}
                          </div>
                        </el-form-item>
                      </el-col>
                    </el-row>
                    <el-row :gutter="20">
                      <el-col :span="24">
                        <el-form-item label="错误信息" prop="errorMessage">
                          <div>
                            {{ form.errorMessage }}
                          </div>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="文件或接口资源ID" prop="resourceId">
                          <div>
                            {{ form.resourceId }}
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
</template>

<script setup name="ComponentOne">
  import { listCalc, getCalc, delCalc, addCalc, updateCalc } from "@/api/model/Calc/calc";

  const { proxy } = getCurrentInstance();


  const calcList = ref([]);

  // 列显隐信息
  const columns = ref([
        { key: 0, label: "ID", visible: true },
        { key: 1, label: "租户/公司ID", visible: true },
        { key: 2, label: "计算编码", visible: true },
        { key: 3, label: "任务名称", visible: true },
        { key: 4, label: "模型分类ID", visible: true },
        { key: 5, label: "模型分类名称", visible: true },
        { key: 6, label: "关联模型ID", visible: true },
        { key: 7, label: "模型名称", visible: true },
        { key: 8, label: "模型版本号", visible: true },
        { key: 9, label: "模型版本ID", visible: true },
        { key: 10, label: "描述", visible: true },
        { key: 11, label: "输入参数(JSON格式)", visible: true },
        { key: 12, label: "输出结果(JSON格式)", visible: true },
        { key: 13, label: "开始时间", visible: true },
        { key: 14, label: "结束时间", visible: true },
        { key: 15, label: "耗时(毫秒)", visible: true },
        { key: 16, label: "计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中", visible: true },
        { key: 17, label: "超时时间(秒)", visible: true },
        { key: 18, label: "已重试次数", visible: true },
        { key: 19, label: "最大重试次数", visible: true },
        { key: 20, label: "优先级:1-高,2-中,3-低", visible: true },
        { key: 21, label: "错误信息", visible: true },
        { key: 22, label: "文件或接口资源ID", visible: true },
        { key: 23, label: "接入方式: 0-API接口, 1-Python本地", visible: true },
        { key: 24, label: "是否有效", visible: true },
        { key: 25, label: "删除标志", visible: true },
        { key: 26, label: "创建人", visible: true },
        { key: 27, label: "创建人id", visible: true },
        { key: 28, label: "创建时间", visible: true },
        { key: 29, label: "更新人", visible: true },
        { key: 30, label: "更新人id", visible: true },
        { key: 31, label: "更新时间", visible: true },
        { key: 32, label: "备注", visible: true }
  ]);

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

  const data = reactive({
          calcDetail: {
    },
    form: {},
    queryParams: {
      pageNum: 1,
      pageSize: 10,
                    companyId: null,
                    code: null,
                    name: null,
                    classifyId: null,
                    classifyName: null,
                    modelId: null,
                    modelName: null,
                    modelVersion: null,
                    modelVersionId: null,
                    description: null,
                    inputParams: null,
                    outputResult: null,
                    startTime: null,
                    endTime: null,
                    duration: null,
                    status: null,
                    timeoutSeconds: null,
                    retryCount: null,
                    maxRetryCount: null,
                    priority: null,
                    errorMessage: null,
                    resourceId: null,
                    calcType: null,
                    createTime: null,
    },
    rules: {
                    modelId: [{ required: true, message: "关联模型ID不能为空", trigger: "blur" }],
                    validFlag: [{ required: true, message: "是否有效不能为空", trigger: "blur" }],
                    delFlag: [{ required: true, message: "删除标志不能为空", trigger: "blur" }],
                    createTime: [{ required: true, message: "创建时间不能为空", trigger: "blur" }],
                    updateTime: [{ required: true, message: "更新时间不能为空", trigger: "blur" }],
    }
  });

  const { queryParams, form, calcDetail, rules } = toRefs(data);

  /** 查询模型计算任务列表 */
  function getList() {
    loading.value = true;
    listCalc(queryParams.value).then(response => {
            calcList.value = response.data.rows;
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
                    companyId: null,
                    code: null,
                    name: null,
                    classifyId: null,
                    classifyName: null,
                    modelId: null,
                    modelName: null,
                    modelVersion: null,
                    modelVersionId: null,
                    description: null,
                    inputParams: null,
                    outputResult: null,
                    startTime: null,
                    endTime: null,
                    duration: null,
                    status: null,
                    timeoutSeconds: null,
                    retryCount: null,
                    maxRetryCount: null,
                    priority: null,
                    errorMessage: null,
                    resourceId: null,
                    calcType: null,
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
    proxy.resetForm("calcRef");
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
    title.value = "添加模型计算任务";
  }

  /** 修改按钮操作 */
  function handleUpdate(row) {
    reset();
    const _id = row.id || ids.value
    getCalc(_id).then(response => {
      form.value = response.data;
      open.value = true;
      title.value = "修改模型计算任务";
    });
  }


  /** 详情按钮操作 */
  function handleDetail(row) {
    reset();
    const _id = row.id || ids.value
    getCalc(_id).then(response => {
      form.value = response.data;
      openDetail.value = true;
      title.value = "模型计算任务详情";
    });
  }

  /** 提交按钮 */
  function submitForm() {
    proxy.$refs["calcRef"].validate(valid => {
      if (valid) {
        if (form.value.id != null) {
          updateCalc(form.value).then(response => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          }).catch(error => {
          });
        } else {
          addCalc(form.value).then(response => {
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
    proxy.$modal.confirm('是否确认删除模型计算任务编号为"' + _ids + '"的数据项？').then(function() {
      return delCalc(_ids);
    }).then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    }).catch(() => {});
  }

  /** 导出按钮操作 */
  function handleExport() {
    proxy.download('model/calc/export', {
      ...queryParams.value
    }, `calc_${new Date().getTime()}.xlsx`)
  }



  getList();

</script>
