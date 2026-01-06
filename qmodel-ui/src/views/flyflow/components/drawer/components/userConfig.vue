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

<script setup lang="ts">

import {setTypes} from "../../../utils/const";
import {computed} from "vue";



let props = defineProps({

  approverConfig: {
    type: Object,
    dafault: () => {
    }
  },
  excludeAssignType: {
    type: Array,
    dafault: () =>[]
  }

});
import {useFlowStore} from '../../../stores/flow'

let flowStore = useFlowStore();
const step2FormList = computed(() => {
  let step2 = flowStore.step2;

  return step2;
})

const step2FormUserList = computed(() => {


  return step2FormList.value.filter(res => res.type === 'SelectUser' || res.type === 'SelectMultiUser');
})


//审批人类型变化
const assignedTypeChangeEvent = (e) => {
  props.approverConfig.nodeUserList = [];
  props.approverConfig.formUserId = ''
  props.approverConfig.formUserName = ''
}

var formUserIdComputed = computed({
  get() {
    return props.approverConfig.formUserId;
  },
  set(val) {
    props.approverConfig.formUserName = step2FormUserList.value.filter(res => res.id === val)[0].name
    props.approverConfig.formUserId = val

  }
})
const step2FormDeptList = computed(() => {


  return step2FormList.value.filter(res => res.type === 'SelectDept' || res.type === 'SelectMultiDept');
})


var formDeptIdComputed = computed({
  get() {
    return props.approverConfig.formUserId;
  },
  set(val) {
    props.approverConfig.formUserId = val
    props.approverConfig.formUserName = step2FormDeptList.value.filter(res => res.id === val)[0].name

  }
})

import selectShow from "../../orgselect/selectAndShow.vue";


</script>

<template>
<div>
  <el-radio-group v-model="approverConfig.assignedType" @change="assignedTypeChangeEvent" class="ml-4">
    <el-row>
      <template v-for="({value, label}) in setTypes" :key="value">
        <el-col style="margin-top: 5px;" :span="8" v-if="!excludeAssignType||(excludeAssignType?.length>0&&(excludeAssignType.indexOf(value)<0))"  >

          <el-radio :label="value">{{ label }}
          </el-radio>
        </el-col>
      </template>

    </el-row>
  </el-radio-group>



  <template v-if="approverConfig.assignedType===1">
    <h4>选择成员</h4>

    <select-show :disable-select-children-dept="false" v-model:orgList="approverConfig.nodeUserList" type="org" :multiple="true"></select-show>

  </template>
  <template v-if="approverConfig.assignedType===8">
    <h4>人员控件</h4>
    <el-select v-model="formUserIdComputed" clearable class="m-2" placeholder="请选择审批表单"
               size="large">
      <el-option
          v-for="item in step2FormUserList"
          :key="item.id"
          :label="item.name"
          :value="item.id"
      />
    </el-select>
  </template>
  <template v-if="approverConfig.assignedType===9">
    <h4>部门控件</h4>
    <el-select  v-model="formDeptIdComputed" clearable style="width: 30%;"    placeholder="请选择部门表单"
              >
      <el-option
          v-for="item in step2FormDeptList"
          :key="item.id"
          :label="item.name"
          :value="item.id"
      />
    </el-select>


  </template>
	<template v-if="approverConfig.assignedType===15">
		<h4>选择部门</h4>
		<select-show :disable-select-children-dept="false" v-model:orgList="approverConfig.nodeUserList" type="dept" :multiple="true"></select-show>



	</template>
<!--	//表单中的部门 指定部门  指定成员（包含部门）-->
	<template v-if="approverConfig.assignedType===9">
		<h4>是否包含下级部门</h4>
		<el-switch
				v-model="approverConfig.containChildrenDept"
				size="large"
				active-text="当前部门以及下级部门"
				inactive-text="仅限当前部门"
		/>
	</template>

	<template v-if="approverConfig.assignedType===15||approverConfig.assignedType===9">
		<h4>选择部门属性</h4>
		<el-radio-group v-model="approverConfig.deptUserType" class="ml-4">
			<el-radio label="allUser" size="large">部门人员</el-radio>
			<el-radio label="leader" size="large">部门主管</el-radio>
			<el-radio label="role" size="large">部门下的角色</el-radio>
		</el-radio-group>


	</template>
	<template v-if="(approverConfig.assignedType===15&&approverConfig.deptUserType==='role')||(approverConfig.assignedType===9&&approverConfig.deptUserType==='role')">
		<h4>选择角色</h4>
		<select-show v-model:orgList="approverConfig.roleList" type="role" :multiple="true"></select-show>
	</template>

	<template v-if="approverConfig.assignedType===3">
		<h4>选择角色</h4>

		<select-show v-model:orgList="approverConfig.nodeUserList" type="role" :multiple="true"></select-show>

	</template>

  <template v-if="approverConfig.assignedType===7">

    <h4>审批终点</h4>
    <span style="font-size: 14px;margin-right: 5px;">到第</span>
    <el-input-number v-model="approverConfig.deptLeaderLevel" :step="1" :min="1" :max="20" step-strictly
                     size="small"/>
    <span style="font-size: 14px;margin-left: 5px;">级部门主管终止</span>
  </template>
  <template v-if="approverConfig.assignedType===2">

    <h4>指定审批层级</h4>
    <span style="font-size: 14px;margin-right: 5px;">第</span>
    <el-input-number v-model="approverConfig.deptLeaderLevel" :step="1" :min="1" :max="20" step-strictly
                     size="small"/>
    <span style="font-size: 14px;margin-left: 5px;">级部门主管</span>
  </template>
</div>
</template>

<style scoped lang="less">

</style>
