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
        path: '/model/calcExecution',
        component: Layout,
        redirect: 'calcExecution',
        hidden: true,
        children: [
            {
                path: 'calcExecutionDetail',
                component: () => import('@/views/model/calcExecution/detail/index.vue'),
                name: 'tree',
                meta: { title: '模型计算执行记录详情', activeMenu: '/model/calcExecution'  }
            }
        ]
    }
 -->



<template>
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom:15px">
      <div class="infotop" >
        <div class="infotop-title mb15">
              {{ calcExecutionDetail.id }}
        </div>
        <el-row :gutter="20">
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">ID</div>
                <div class="infotop-row-value">{{ calcExecutionDetail.id }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">计算任务ID</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.calcId "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型id</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.modelId "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">执行批次号</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.executionNo "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">执行模式：1-手动触发 2-定时调度 3-重试执行</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.executionMode "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.status "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">开始时间</div>
                <div class="infotop-row-value">{{ parseTime(calcExecutionDetail.startTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">结束时间</div>
                <div class="infotop-row-value">{{ parseTime(calcExecutionDetail.endTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">耗时(毫秒)</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.duration "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">输入参数快照(JSON，记录执行时的实际参数)</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.inputParams "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">输出结果(JSON)</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.outputResult "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">执行日志</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.executionLog "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">错误信息</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.errorMessage "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">当前重试次数</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.retryCount "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">资源使用情况(JSON，如CPU、内存、GPU使用)</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.resourceUsage "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建人</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.createBy "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建时间</div>
                <div class="infotop-row-value">{{ parseTime(calcExecutionDetail.createTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">备注</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcExecutionDetail.remark "/>
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

<script setup name="CalcExecution">
  import {getCalcExecution } from "@/api/model/calcExecution/calcExecution";
  import { useRoute } from 'vue-router';
  import ComponentOne from "@/views/model/calcExecution/detail/componentOne.vue";
  import ComponentTwo from "@/views/model/calcExecution/detail/componentTwo.vue";

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
            getCalcExecutionDetailById();

          },
          { immediate: true }  // `immediate` 为 true 表示页面加载时也会立即执行一次 watch
  );
  const data = reactive({
      calcExecutionDetail: {
    },
    form: {},
  });

  const {  calcExecutionDetail, rules } = toRefs(data);

  /** 复杂详情页面上方表单查询 */
  function getCalcExecutionDetailById() {
        const _id = id ;
    getCalcExecution(_id).then(response => {
        calcExecutionDetail.value = response.data;
    });
  }

  getCalcExecutionDetailById();

</script>
