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
        path: '/model/Calc',
        component: Layout,
        redirect: 'Calc',
        hidden: true,
        children: [
            {
                path: 'calcDetail',
                component: () => import('@/views/model/Calc/detail/index.vue'),
                name: 'tree',
                meta: { title: '模型计算任务详情', activeMenu: '/model/calc'  }
            }
        ]
    }
 -->



<template>
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom:15px">
      <div class="infotop" >
        <div class="infotop-title mb15">
              {{ calcDetail.id }}
        </div>
        <el-row :gutter="20">
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">ID</div>
                <div class="infotop-row-value">{{ calcDetail.id }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">租户/公司ID</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.companyId "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">计算编码</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.code "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">任务名称</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.name "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型分类ID</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.classifyId "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型分类名称</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.classifyName "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">关联模型ID</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.modelId "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型名称</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.modelName "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型版本号</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.modelVersion "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">模型版本ID</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.modelVersionId "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">描述</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.description "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">输入参数(JSON格式)</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.inputParams "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">输出结果(JSON格式)</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.outputResult "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">开始时间</div>
                <div class="infotop-row-value">{{ parseTime(calcDetail.startTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">结束时间</div>
                <div class="infotop-row-value">{{ parseTime(calcDetail.endTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">耗时(毫秒)</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.duration "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.status "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">超时时间(秒)</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.timeoutSeconds "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">已重试次数</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.retryCount "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">最大重试次数</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.maxRetryCount "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">优先级:1-高,2-中,3-低</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.priority "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">错误信息</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.errorMessage "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">文件或接口资源ID</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.resourceId "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">接入方式: 0-API接口, 1-Python本地</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.calcType "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建人</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.createBy "/>
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建时间</div>
                <div class="infotop-row-value">{{ parseTime(calcDetail.createTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">备注</div>
                <div class="infotop-row-value">
                    <dict-tag :options="${column.dictType}" :value="calcDetail.remark "/>
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

<script setup name="Calc">
  import {getCalc } from "@/api/model/Calc/calc";
  import { useRoute } from 'vue-router';
  import ComponentOne from "@/views/model/Calc/detail/componentOne.vue";
  import ComponentTwo from "@/views/model/Calc/detail/componentTwo.vue";

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
            getCalcDetailById();

          },
          { immediate: true }  // `immediate` 为 true 表示页面加载时也会立即执行一次 watch
  );
  const data = reactive({
      calcDetail: {
    },
    form: {},
  });

  const {  calcDetail, rules } = toRefs(data);

  /** 复杂详情页面上方表单查询 */
  function getCalcDetailById() {
        const _id = id ;
    getCalc(_id).then(response => {
        calcDetail.value = response.data;
    });
  }

  getCalcDetailById();

</script>
