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
  <div class="justify-between mb15">
    <el-row :gutter="15" class="btn-style">
      <el-col :span="1.5">
        <el-button type="primary" plain @click="handleAdd" v-hasPermi="['fileResource:modelFileResource:add']"
                   @mousedown="(e) => e.preventDefault()">
          <i class="iconfont-mini icon-xinzeng mr5"></i>新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain :disabled="multiple" @click="handleExport" v-hasPermi="['fileResource:modelFileResource:export']"
                   @mousedown="(e) => e.preventDefault()">
          <i class="iconfont-mini icon-download-line mr5"></i>导出
        </el-button>
      </el-col>
    </el-row>
    <div class="justify-end top-right-btn">
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </div>
  </div>
  <el-table stripe height="374px" v-loading="loading" :data="modelFileResourceList" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
    <el-table-column type="selection" width="55" align="center" />
            <el-table-column v-if="columns[0].visible" label="ID" align="center" prop="id" />
            <el-table-column v-if="columns[2].visible" label="原始上传文件名" align="center" prop="fileName">
              <template #default="scope">
                {{ scope.row.fileName || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[3].visible" label="脚本名称(入口文件)" align="center" prop="scriptName">
              <template #default="scope">
                {{ scope.row.scriptName || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[4].visible" label="文件存储地址" align="center" prop="filePath">
              <template #default="scope">
                {{ scope.row.filePath || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[5].visible" label="依赖文件路径" align="center" prop="depsFilePath">
              <template #default="scope">
                {{ scope.row.depsFilePath || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[6].visible" label="模型版本号" align="center" prop="modelVersion">
              <template #default="scope">
                {{ scope.row.modelVersion || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[7].visible" label="资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)" align="center" prop="resourceType">
              <template #default="scope">
                {{ scope.row.resourceType || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[8].visible" label="文件大小MB" align="center" prop="fileSize">
              <template #default="scope">
                {{ scope.row.fileSize || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[9].visible" label="运行日志文件路径" align="center" prop="logFilePath">
              <template #default="scope">
                {{ scope.row.logFilePath || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[10].visible" label="请求超时秒数" align="center" prop="execTimeout">
              <template #default="scope">
                {{ scope.row.execTimeout || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[11].visible" label="自动生成dockerFile文件地址" align="center" prop="dockerFilePath">
              <template #default="scope">
                {{ scope.row.dockerFilePath || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[12].visible" label="构建镜像标签" align="center" prop="imageTag">
              <template #default="scope">
                {{ scope.row.imageTag || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[13].visible" label="镜像版本" align="center" prop="imageVersion">
              <template #default="scope">
                {{ scope.row.imageVersion || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[14].visible" label="镜像构建状态" align="center" prop="imageBuildStatus">
              <template #default="scope">
                {{ scope.row.imageBuildStatus || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[15].visible" label="镜像构建时间" align="center" prop="imageBuildTime">
              <template #default="scope">
                {{ scope.row.imageBuildTime || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[16].visible" label="镜像构建日志文件地址" align="center" prop="imageBuildLog">
              <template #default="scope">
                {{ scope.row.imageBuildLog || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[17].visible" label="容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb" align="center" prop="resourceLimit">
              <template #default="scope">
                {{ scope.row.resourceLimit || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[18].visible" label="容器自定义环境变量，JSON数组格式" align="center" prop="containerEnv">
              <template #default="scope">
                {{ scope.row.containerEnv || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[19].visible" label="容器额外挂载目录配置，JSON数组格式" align="center" prop="containerMounts">
              <template #default="scope">
                {{ scope.row.containerMounts || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[20].visible" label="容器暴露端口" align="center" prop="containerPorts">
              <template #default="scope">
                {{ scope.row.containerPorts || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[21].visible" label="宿主机端口" align="center" prop="mappedHostPort">
              <template #default="scope">
                {{ scope.row.mappedHostPort || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[22].visible" label="容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)" align="center" prop="containerStatus">
              <template #default="scope">
                {{ scope.row.containerStatus || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[23].visible" label="容器id" align="center" prop="containerId">
              <template #default="scope">
                {{ scope.row.containerId || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[26].visible" label="创建人" align="center" prop="createBy">
              <template #default="scope">
                {{ scope.row.createBy || '-' }}
              </template>
            </el-table-column>
            <el-table-column v-if="columns[28].visible" label="创建时间" align="center" prop="createTime" width="180" sortable="custom" :sort-orders="['descending', 'ascending']">
              <template #default="scope">
                <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>
            <el-table-column v-if="columns[32].visible" label="备注" align="center" prop="remark">
              <template #default="scope">
                {{ scope.row.remark || '-' }}
              </template>
            </el-table-column>
    <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="240">
      <template #default="scope">
        <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                   v-hasPermi="['fileResource:modelFileResource:edit']">修改</el-button>
        <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)"
                   v-hasPermi="['fileResource:modelFileResource:remove']">删除</el-button>
        <el-button link type="primary" icon="view" @click="handleDetail(scope.row)"
                   v-hasPermi="['fileResource:modelFileResource:edit']">详情</el-button>
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

  <!-- 添加或修改模型文件部署对话框 -->
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
    <el-form ref="modelFileResourceRef" :model="form" :rules="rules" label-width="80px">
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
</template>

<script setup name="ComponentOne">
  import { listModelFileResource, getModelFileResource, delModelFileResource, addModelFileResource, updateModelFileResource } from "@/api/model/modelFileResource";

  const { proxy } = getCurrentInstance();


  const modelFileResourceList = ref([]);

  // 列显隐信息
  const columns = ref([
        { key: 0, label: "ID", visible: true },
        { key: 1, label: "模型id", visible: true },
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
          modelFileResourceDetail: {
    },
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

  const { queryParams, form, modelFileResourceDetail, rules } = toRefs(data);

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



  getList();

</script>
