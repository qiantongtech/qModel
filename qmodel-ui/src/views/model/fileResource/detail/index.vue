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

<!-- 复杂详情路由模板
    {
        path: '/model/fileResource',
        component: Layout,
        redirect: 'fileResource',
        hidden: true,
        children: [
            {
                path: 'modelFileResourceDetail',
                component: () => import('@/views/model/fileResource/detail/index.vue'),
                name: 'tree',
                meta: { title: '模型文件部署详情', activeMenu: '/model/modelFileResource'  }
            }
        ]
    }
 -->



<template>
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom:15px">
      <div class="infotop" >
        <div class="infotop-title mb15">
              {{ modelFileResourceDetail.id }}
        </div>
        <el-row :gutter="20">
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">ID</div>
                <div class="infotop-row-value">{{ modelFileResourceDetail.id }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">原始上传文件名</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.fileName || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">脚本名称(入口文件)</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.scriptName || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">文件存储地址</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.filePath || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">依赖文件路径</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.depsFilePath || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型版本号</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.modelVersion || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.resourceType || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">文件大小MB</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.fileSize || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">运行日志文件路径</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.logFilePath || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">请求超时秒数</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.execTimeout || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">自动生成dockerFile文件地址</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.dockerFilePath || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">构建镜像标签</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.imageTag || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">镜像版本</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.imageVersion || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">镜像构建状态</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.imageBuildStatus || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">镜像构建时间</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.imageBuildTime || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">镜像构建日志文件地址</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.imageBuildLog || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.resourceLimit || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">容器自定义环境变量，JSON数组格式</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.containerEnv || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">容器额外挂载目录配置，JSON数组格式</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.containerMounts || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">容器暴露端口</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.containerPorts || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">宿主机端口</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.mappedHostPort || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.containerStatus || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">容器id</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.containerId || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建人</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.createBy || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建时间</div>
                <div class="infotop-row-value">{{ parseTime(modelFileResourceDetail.createTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">备注</div>
                <div class="infotop-row-value">
                  {{ modelFileResourceDetail.remark || '-' }}
                </div>
              </div>
            </el-col>
        </el-row>

      </div>
    </div>

    <div  class="pagecont-bottom">
      <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
        <el-tab-pane label="组件一" name="1">
          <component-one ></component-one>
        </el-tab-pane>
        <el-tab-pane label="组件二" name="2">
          <component-two ></component-two>
        </el-tab-pane>
      </el-tabs>
    </div>


  </div>
</template>

<script setup name="ModelFileResource">
  import {getModelFileResource } from "@/api/model/fileResource/modelFileResource";
  import { useRoute } from 'vue-router';
  import ComponentOne from "@/views/model/fileResource/detail/componentOne.vue";
  import ComponentTwo from "@/views/model/fileResource/detail/componentTwo.vue";

  const { proxy } = getCurrentInstance();

  const activeName = ref('1')

  const handleClick = (tab, event) => {
    console.log(tab, event)
  }

  const showSearch = ref(true);
  const route = useRoute();
  let id = route.query.id || 1;
  // 监听 id 变化
  watch(
          () => route.query.id,
          (newId) => {
            id = newId || 1;  // 如果 id 为空，使用默认值 1
            getModelFileResourceDetailById();

          },
          { immediate: true }  // `immediate` 为 true 表示页面加载时也会立即执行一次 watch
  );
  const data = reactive({
      modelFileResourceDetail: {
    },
    form: {},
  });

  const {  modelFileResourceDetail, rules } = toRefs(data);

  /** 复杂详情页面上方表单查询 */
  function getModelFileResourceDetailById() {
        const _id = id ;
    getModelFileResource(_id).then(response => {
        modelFileResourceDetail.value = response.data;
    });
  }

  getModelFileResourceDetailById();

</script>
