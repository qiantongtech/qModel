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
      <el-form-item label="原始上传文件名" prop="fileName">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.fileName"
            placeholder="请输入原始上传文件名"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="脚本名称(入口文件)" prop="scriptName">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.scriptName"
            placeholder="请输入脚本名称(入口文件)"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件存储地址" prop="filePath">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.filePath"
            placeholder="请输入文件存储地址"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="依赖文件路径" prop="depsFilePath">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.depsFilePath"
            placeholder="请输入依赖文件路径"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模型版本号" prop="modelVersion">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.modelVersion"
            placeholder="请输入模型版本号"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件大小MB" prop="fileSize">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.fileSize"
            placeholder="请输入文件大小MB"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="运行日志文件路径" prop="logFilePath">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.logFilePath"
            placeholder="请输入运行日志文件路径"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="请求超时秒数" prop="execTimeout">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.execTimeout"
            placeholder="请输入请求超时秒数"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="自动生成dockerFile文件地址" prop="dockerFilePath">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.dockerFilePath"
            placeholder="请输入自动生成dockerFile文件地址"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="构建镜像标签" prop="imageTag">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.imageTag"
            placeholder="请输入构建镜像标签"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="镜像版本" prop="imageVersion">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.imageVersion"
            placeholder="请输入镜像版本"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="镜像构建时间" prop="imageBuildTime">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.imageBuildTime"
            placeholder="请输入镜像构建时间"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="镜像构建日志文件地址" prop="imageBuildLog">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.imageBuildLog"
            placeholder="请输入镜像构建日志文件地址"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="容器暴露端口" prop="containerPorts">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.containerPorts"
            placeholder="请输入容器暴露端口"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="宿主机端口" prop="mappedHostPort">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.mappedHostPort"
            placeholder="请输入宿主机端口"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="容器id" prop="containerId">
        <el-input
            class="el-form-input-width"
            v-model="queryParams.containerId"
            placeholder="请输入容器id"
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
           <el-button type="primary" plain @click="handleAdd" v-hasPermi="['model:fileResource:fileresource:add']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-xinzeng mr5"></i>新增
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="primary" plain :disabled="single" @click="handleUpdate" v-hasPermi="['model:fileResource:fileresource:edit']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-xiugai--copy mr5"></i>修改
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="danger" plain :disabled="multiple" @click="handleDelete" v-hasPermi="['model:fileResource:fileresource:remove']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-shanchu-huise mr5"></i>删除
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="info" plain  @click="handleImport" v-hasPermi="['model:fileResource:fileresource:export']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-upload-cloud-line mr5"></i>导入
           </el-button>
         </el-col>
         <el-col :span="1.5">
           <el-button type="warning" plain :disabled="multiple" @click="handleExport" v-hasPermi="['model:fileResource:fileresource:export']"
                      @mousedown="(e) => e.preventDefault()">
             <i class="iconfont-mini icon-download-line mr5"></i>导出
           </el-button>
         </el-col>
       </el-row>
       <div class="justify-end top-right-btn">
         <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
       </div>
     </div>
     <el-table stripe height="58vh" v-loading="loading" :data="modelFileResourceList" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
       <el-table-column type="selection" width="55" align="center" />
       <el-table-column v-if="getColumnVisibility(0)" label="ID" align="center" prop="id" />
       <el-table-column v-if="getColumnVisibility(2)" label="原始上传文件名" align="center" prop="fileName">
         <template #default="scope">
           {{ scope.row.fileName || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(3)" label="脚本名称(入口文件)" align="center" prop="scriptName">
         <template #default="scope">
           {{ scope.row.scriptName || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(4)" label="文件存储地址" align="center" prop="filePath">
         <template #default="scope">
           {{ scope.row.filePath || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(5)" label="依赖文件路径" align="center" prop="depsFilePath">
         <template #default="scope">
           {{ scope.row.depsFilePath || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(6)" label="模型版本号" align="center" prop="modelVersion">
         <template #default="scope">
           {{ scope.row.modelVersion || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(7)" label="资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)" align="center" prop="resourceType">
         <template #default="scope">
           {{ scope.row.resourceType || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(8)" label="文件大小MB" align="center" prop="fileSize">
         <template #default="scope">
           {{ scope.row.fileSize || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(9)" label="运行日志文件路径" align="center" prop="logFilePath">
         <template #default="scope">
           {{ scope.row.logFilePath || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(10)" label="请求超时秒数" align="center" prop="execTimeout">
         <template #default="scope">
           {{ scope.row.execTimeout || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(11)" label="自动生成dockerFile文件地址" align="center" prop="dockerFilePath">
         <template #default="scope">
           {{ scope.row.dockerFilePath || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(12)" label="构建镜像标签" align="center" prop="imageTag">
         <template #default="scope">
           {{ scope.row.imageTag || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(13)" label="镜像版本" align="center" prop="imageVersion">
         <template #default="scope">
           {{ scope.row.imageVersion || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(14)" label="镜像构建状态" align="center" prop="imageBuildStatus">
         <template #default="scope">
           {{ scope.row.imageBuildStatus || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(15)" label="镜像构建时间" align="center" prop="imageBuildTime">
         <template #default="scope">
           {{ scope.row.imageBuildTime || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(16)" label="镜像构建日志文件地址" align="center" prop="imageBuildLog">
         <template #default="scope">
           {{ scope.row.imageBuildLog || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(17)" label="容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb" align="center" prop="resourceLimit">
         <template #default="scope">
           {{ scope.row.resourceLimit || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(18)" label="容器自定义环境变量，JSON数组格式" align="center" prop="containerEnv">
         <template #default="scope">
           {{ scope.row.containerEnv || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(19)" label="容器额外挂载目录配置，JSON数组格式" align="center" prop="containerMounts">
         <template #default="scope">
           {{ scope.row.containerMounts || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(20)" label="容器暴露端口" align="center" prop="containerPorts">
         <template #default="scope">
           {{ scope.row.containerPorts || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(21)" label="宿主机端口" align="center" prop="mappedHostPort">
         <template #default="scope">
           {{ scope.row.mappedHostPort || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(22)" label="容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)" align="center" prop="containerStatus">
         <template #default="scope">
           {{ scope.row.containerStatus || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(23)" label="容器id" align="center" prop="containerId">
         <template #default="scope">
           {{ scope.row.containerId || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(26)" label="创建人" align="center" prop="createBy">
         <template #default="scope">
           {{ scope.row.createBy || '-' }}
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(28)" label="创建时间" align="center" prop="createTime" width="180" sortable="custom" :sort-orders="['descending', 'ascending']">
         <template #default="scope">
           <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
         </template>
       </el-table-column>
       <el-table-column v-if="getColumnVisibility(32)" label="备注" align="center" prop="remark">
         <template #default="scope">
           {{ scope.row.remark || '-' }}
         </template>
       </el-table-column>
       <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="240">
         <template #default="scope">
           <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                      v-hasPermi="['model:fileResource:fileresource:edit']">修改</el-button>
           <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)"
                      v-hasPermi="['model:fileResource:fileresource:remove']">删除</el-button>
           <el-button link type="primary" icon="view" @click="handleDetail(scope.row)"
                      v-hasPermi="['model:fileResource:fileresource:query']">详情</el-button>
           <el-button link type="primary" icon="view" @click="routeTo('/model/fileResource/modelFileResourceDetail',scope.row)"
                      v-hasPermi="['model:fileResource:fileresource:query']">复杂详情</el-button>
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

    <!-- 添加或修改模型文件部署对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="modelFileResourceRef" :model="form" :rules="rules" label-width="80px" @submit.prevent>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="原始上传文件名" prop="fileName">
                <el-input v-model="form.fileName" placeholder="请输入原始上传文件名" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="脚本名称(入口文件)" prop="scriptName">
                <el-input v-model="form.scriptName" placeholder="请输入脚本名称(入口文件)" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="文件存储地址" prop="filePath">
                <el-input v-model="form.filePath" placeholder="请输入文件存储地址" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="依赖文件路径" prop="depsFilePath">
                <el-input v-model="form.depsFilePath" placeholder="请输入依赖文件路径" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="模型版本号" prop="modelVersion">
                <el-input v-model="form.modelVersion" placeholder="请输入模型版本号" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="文件大小MB" prop="fileSize">
                <el-input v-model="form.fileSize" placeholder="请输入文件大小MB" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="运行日志文件路径" prop="logFilePath">
                <el-input v-model="form.logFilePath" placeholder="请输入运行日志文件路径" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="请求超时秒数" prop="execTimeout">
                <el-input v-model="form.execTimeout" placeholder="请输入请求超时秒数" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="自动生成dockerFile文件地址" prop="dockerFilePath">
                <el-input v-model="form.dockerFilePath" placeholder="请输入自动生成dockerFile文件地址" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="构建镜像标签" prop="imageTag">
                <el-input v-model="form.imageTag" placeholder="请输入构建镜像标签" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="镜像版本" prop="imageVersion">
                <el-input v-model="form.imageVersion" placeholder="请输入镜像版本" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="镜像构建时间" prop="imageBuildTime">
                <el-input v-model="form.imageBuildTime" placeholder="请输入镜像构建时间" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="镜像构建日志文件地址" prop="imageBuildLog">
                <el-input v-model="form.imageBuildLog" placeholder="请输入镜像构建日志文件地址" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb" prop="resourceLimit">
                <el-input v-model="form.resourceLimit" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="容器自定义环境变量，JSON数组格式" prop="containerEnv">
                <el-input v-model="form.containerEnv" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="容器额外挂载目录配置，JSON数组格式" prop="containerMounts">
                <el-input v-model="form.containerMounts" type="textarea" placeholder="请输入内容" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="容器暴露端口" prop="containerPorts">
                <el-input v-model="form.containerPorts" placeholder="请输入容器暴露端口" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="宿主机端口" prop="mappedHostPort">
                <el-input v-model="form.mappedHostPort" placeholder="请输入宿主机端口" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="容器id" prop="containerId">
                <el-input v-model="form.containerId" placeholder="请输入容器id" />
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

    <!-- 模型文件部署详情对话框 -->
    <el-dialog :title="title" v-model="openDetail" width="800px" :append-to="$refs['app-container']" draggable>
      <template #header="{ close, titleId, titleClass }">
        <span role="heading" aria-level="2" class="el-dialog__title">
          {{ title }}
        </span>
      </template>
      <el-form ref="modelFileResourceRef" :model="form"  label-width="80px">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="原始上传文件名" prop="fileName">
                <div>
                  {{ form.fileName }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="脚本名称(入口文件)" prop="scriptName">
                <div>
                  {{ form.scriptName }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="文件存储地址" prop="filePath">
                <div>
                  {{ form.filePath }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="依赖文件路径" prop="depsFilePath">
                <div>
                  {{ form.depsFilePath }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="模型版本号" prop="modelVersion">
                <div>
                  {{ form.modelVersion }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)" prop="resourceType">
                <div>
                  {{ form.resourceType }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="文件大小MB" prop="fileSize">
                <div>
                  {{ form.fileSize }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="运行日志文件路径" prop="logFilePath">
                <div>
                  {{ form.logFilePath }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="请求超时秒数" prop="execTimeout">
                <div>
                  {{ form.execTimeout }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="自动生成dockerFile文件地址" prop="dockerFilePath">
                <div>
                  {{ form.dockerFilePath }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="构建镜像标签" prop="imageTag">
                <div>
                  {{ form.imageTag }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="镜像版本" prop="imageVersion">
                <div>
                  {{ form.imageVersion }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="镜像构建状态" prop="imageBuildStatus">
                <div>
                  {{ form.imageBuildStatus }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="镜像构建时间" prop="imageBuildTime">
                <div>
                  {{ form.imageBuildTime }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="镜像构建日志文件地址" prop="imageBuildLog">
                <div>
                  {{ form.imageBuildLog }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb" prop="resourceLimit">
                <div>
                  {{ form.resourceLimit }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="容器自定义环境变量，JSON数组格式" prop="containerEnv">
                <div>
                  {{ form.containerEnv }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="容器额外挂载目录配置，JSON数组格式" prop="containerMounts">
                <div>
                  {{ form.containerMounts }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="容器暴露端口" prop="containerPorts">
                <div>
                  {{ form.containerPorts }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="宿主机端口" prop="mappedHostPort">
                <div>
                  {{ form.mappedHostPort }}
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)" prop="containerStatus">
                <div>
                  {{ form.containerStatus }}
                </div>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="容器id" prop="containerId">
                <div>
                  {{ form.containerId }}
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
              <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的模型文件部署数据
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

<script setup name="ModelFileResource">
  import { listModelFileResource, getModelFileResource, delModelFileResource, addModelFileResource, updateModelFileResource } from "@/api/model/modelFileResource";
  import {getToken} from "@/utils/auth.js";

  const { proxy } = getCurrentInstance();

  const modelFileResourceList = ref([]);

  // 列显隐信息
  const columns = ref([
            { key: 2, label: "原始上传文件名", visible: true },
            { key: 3, label: "脚本名称(入口文件)", visible: true },
            { key: 4, label: "文件存储地址", visible: true },
            { key: 5, label: "依赖文件路径", visible: true },
            { key: 6, label: "模型版本号", visible: true },
            { key: 7, label: "资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)", visible: true },
            { key: 8, label: "文件大小MB", visible: true },
            { key: 9, label: "运行日志文件路径", visible: true },
            { key: 10, label: "请求超时秒数", visible: true },
            { key: 11, label: "自动生成dockerFile文件地址", visible: true },
            { key: 12, label: "构建镜像标签", visible: true },
            { key: 13, label: "镜像版本", visible: true },
            { key: 14, label: "镜像构建状态（0 = 未构建、1 = 构建中、2 = 构建成功、3 = 构建失败）", visible: true },
            { key: 15, label: "镜像构建时间", visible: true },
            { key: 16, label: "镜像构建日志文件地址", visible: true },
            { key: 17, label: "容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb", visible: true },
            { key: 18, label: "容器自定义环境变量，JSON数组格式", visible: true },
            { key: 19, label: "容器额外挂载目录配置，JSON数组格式", visible: true },
            { key: 20, label: "容器暴露端口", visible: true },
            { key: 21, label: "宿主机端口", visible: true },
            { key: 22, label: "容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)", visible: true },
            { key: 23, label: "容器id", visible: true },
            { key: 26, label: "创建人", visible: true },
            { key: 28, label: "创建时间", visible: true },
            { key: 32, label: "备注", visible: true }
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
    url: import.meta.env.VITE_APP_BASE_API + "/model/modelFileResource/importData"
  });

  const data = reactive({
    form: {},
    queryParams: {
      pageNum: 1,
      pageSize: 10,
        fileName: null,
        scriptName: null,
        filePath: null,
        depsFilePath: null,
        modelVersion: null,
        resourceType: null,
        fileSize: null,
        logFilePath: null,
        execTimeout: null,
        dockerFilePath: null,
        imageTag: null,
        imageVersion: null,
        imageBuildStatus: null,
        imageBuildTime: null,
        imageBuildLog: null,
        resourceLimit: null,
        containerEnv: null,
        containerMounts: null,
        containerPorts: null,
        mappedHostPort: null,
        containerStatus: null,
        containerId: null,
        createTime: null,
    },
    rules: {
        validFlag: [{ required: true, message: "是否有效不能为空", trigger: "blur" }],
        delFlag: [{ required: true, message: "删除标志不能为空", trigger: "blur" }],
        createTime: [{ required: true, message: "创建时间不能为空", trigger: "blur" }],
        updateTime: [{ required: true, message: "更新时间不能为空", trigger: "blur" }],
    }
  });

  const { queryParams, form, rules } = toRefs(data);

  /** 查询模型文件部署列表 */
  function getList() {
    loading.value = true;
    listModelFileResource(queryParams.value).then(response => {
            modelFileResourceList.value = response.data.rows;
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
        fileName: null,
        scriptName: null,
        filePath: null,
        depsFilePath: null,
        modelVersion: null,
        resourceType: null,
        fileSize: null,
        logFilePath: null,
        execTimeout: null,
        dockerFilePath: null,
        imageTag: null,
        imageVersion: null,
        imageBuildStatus: null,
        imageBuildTime: null,
        imageBuildLog: null,
        resourceLimit: null,
        containerEnv: null,
        containerMounts: null,
        containerPorts: null,
        mappedHostPort: null,
        containerStatus: null,
        containerId: null,
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
    proxy.resetForm("modelFileResourceRef");
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
    title.value = "添加模型文件部署";
  }

  /** 修改按钮操作 */
  function handleUpdate(row) {
    reset();
    const _id = row.id || ids.value
    getModelFileResource(_id).then(response => {
      form.value = response.data;
      open.value = true;
      title.value = "修改模型文件部署";
    });
  }


  /** 详情按钮操作 */
  function handleDetail(row) {
    reset();
    const _id = row.id || ids.value
    getModelFileResource(_id).then(response => {
      form.value = response.data;
      openDetail.value = true;
      title.value = "模型文件部署详情";
    });
  }

  /** 提交按钮 */
  function submitForm() {
    proxy.$refs["modelFileResourceRef"].validate(valid => {
      if (valid) {
        if (form.value.id != null) {
          updateModelFileResource(form.value).then(response => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          }).catch(error => {
          });
        } else {
          addModelFileResource(form.value).then(response => {
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
    proxy.$modal.confirm('是否确认删除模型文件部署编号为"' + _ids + '"的数据项？').then(function() {
      return delModelFileResource(_ids);
    }).then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    }).catch(() => {});
  }

  /** 导出按钮操作 */
  function handleExport() {
    proxy.download('model/modelFileResource/export', {
      ...queryParams.value
    }, `modelFileResource_${new Date().getTime()}.xlsx`)
  }

  /** ---------------- 导入相关操作 -----------------**/
  /** 导入按钮操作 */
  function handleImport() {
    upload.title = "模型文件部署导入";
    upload.open = true;
  }

  /** 下载模板操作 */
  function importTemplate() {
    proxy.download("system/user/importTemplate", {
    }, `modelFileResource_template_${new Date().getTime()}.xlsx`)
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
