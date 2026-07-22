<!--
  Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
   *
  This file is part of qModel Module Platform (Open Source Edition).
   *
  qModel is licensed under Apache License 2.0 with additional qModel terms.
  You may use qModel for commercial purposes, but you may not remove, hide,
  modify, or replace the qModel logo, copyright notices, license notices,
  or attribution information without a separate commercial license.
   *
  White-label use, OEM distribution, rebranding, or presenting qModel as
  another product requires separate commercial authorization from
  Jiangsu Qiantong Technology Co., Ltd.
   *
  Business License: `https://qmodel.tech/`
  See the LICENSE file in the project root for full license information.
-->

<!-- 复杂详情路由模板
    {
        path: '/model/invokeHistory',
        component: Layout,
        redirect: 'invokeHistory',
        hidden: true,
        children: [
            {
                path: 'modelInvokeHistoryDetail',
                component: () => import('@/views/model/invokeHistory/detail/index.vue'),
                name: 'tree',
                meta: { title: '模型调用历史记录详情', activeMenu: '/model/modelInvokeHistory'  }
            }
        ]
    }
 -->



<template>
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom:15px">
      <div class="infotop" >
        <div class="infotop-title mb15">
              {{ modelInvokeHistoryDetail.id }}
        </div>
        <el-row :gutter="20">
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">ID</div>
                <div class="infotop-row-value">{{ modelInvokeHistoryDetail.id }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型id</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.modelId || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型名称</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.modelName || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型配置资源id</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.resourceId || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型版本id</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.versionId || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">请求方式</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.requestMethod || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">调用类型</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.invokeType || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">输入参数</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.inputParams || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">输出结果</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.outputResult || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">开始时间</div>
                <div class="infotop-row-value">{{ parseTime(modelInvokeHistoryDetail.startTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">结束时间</div>
                <div class="infotop-row-value">{{ parseTime(modelInvokeHistoryDetail.endTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">执行耗时</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.duration || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">错误信息</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.errorMessage || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">调用状态</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.status || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">客户端操作IP</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.clientIp || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建人</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.createBy || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建时间</div>
                <div class="infotop-row-value">{{ parseTime(modelInvokeHistoryDetail.createTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">备注</div>
                <div class="infotop-row-value">
                  {{ modelInvokeHistoryDetail.remark || '-' }}
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

<script setup name="ModelInvokeHistory">
  import {getModelInvokeHistory } from "@/api/model/invokeHistory/modelInvokeHistory";
  import { useRoute } from 'vue-router';
  import ComponentOne from "@/views/model/invokeHistory/detail/componentOne.vue";
  import ComponentTwo from "@/views/model/invokeHistory/detail/componentTwo.vue";

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
            getModelInvokeHistoryDetailById();

          },
          { immediate: true }  // `immediate` 为 true 表示页面加载时也会立即执行一次 watch
  );
  const data = reactive({
      modelInvokeHistoryDetail: {
    },
    form: {},
  });

  const {  modelInvokeHistoryDetail, rules } = toRefs(data);

  /** 复杂详情页面上方表单查询 */
  function getModelInvokeHistoryDetailById() {
        const _id = id ;
    getModelInvokeHistory(_id).then(response => {
        modelInvokeHistoryDetail.value = response.data;
    });
  }

  getModelInvokeHistoryDetailById();

</script>
