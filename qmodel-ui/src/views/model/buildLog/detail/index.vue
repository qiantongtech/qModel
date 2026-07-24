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

<!-- 复杂详情路由模板
    {
        path: '/model/buildLog',
        component: Layout,
        redirect: 'buildLog',
        hidden: true,
        children: [
            {
                path: 'modelBuildLogDetail',
                component: () => import('@/views/model/buildLog/detail/index.vue'),
                name: 'tree',
                meta: { title: '构建日志详情', activeMenu: '/model/modelBuildLog'  }
            }
        ]
    }
 -->



<template>
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom:15px">
      <div class="infotop" >
        <div class="infotop-title mb15">
              {{ modelBuildLogDetail.id }}
        </div>
        <el-row :gutter="20">
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">ID</div>
                <div class="infotop-row-value">{{ modelBuildLogDetail.id }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型文件id</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.resourceId || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型id</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.modelId || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型名称</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.modelName || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">版本id</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.versionId || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">构建类型</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.buildType || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">构建状态</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.status || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">开始时间</div>
                <div class="infotop-row-value">{{ parseTime(modelBuildLogDetail.startTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">结束时间</div>
                <div class="infotop-row-value">{{ parseTime(modelBuildLogDetail.endTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">执行耗时</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.duration || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">已存在的依赖包列表JSON</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.installedPackages || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">缺失失败的依赖包列表JSON</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.missingPackages || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">安装失败的依赖包列表JSON</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.failedPackages || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">dockerFile内容</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.dockerfileContent || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">构建日志</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.buildLog || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">错误日志</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.errorMessage || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">requirements.txt 内容</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.requirements || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建人</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.createBy || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建时间</div>
                <div class="infotop-row-value">{{ parseTime(modelBuildLogDetail.createTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">备注</div>
                <div class="infotop-row-value">
                  {{ modelBuildLogDetail.remark || '-' }}
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

<script setup name="ModelBuildLog">
  import {getModelBuildLog } from "@/api/model/buildLog/modelBuildLog";
  import { useRoute } from 'vue-router';
  import ComponentOne from "@/views/model/buildLog/detail/componentOne.vue";
  import ComponentTwo from "@/views/model/buildLog/detail/componentTwo.vue";

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
            getModelBuildLogDetailById();

          },
          { immediate: true }  // `immediate` 为 true 表示页面加载时也会立即执行一次 watch
  );
  const data = reactive({
      modelBuildLogDetail: {
    },
    form: {},
  });

  const {  modelBuildLogDetail, rules } = toRefs(data);

  /** 复杂详情页面上方表单查询 */
  function getModelBuildLogDetailById() {
        const _id = id ;
    getModelBuildLog(_id).then(response => {
        modelBuildLogDetail.value = response.data;
    });
  }

  getModelBuildLogDetailById();

</script>
