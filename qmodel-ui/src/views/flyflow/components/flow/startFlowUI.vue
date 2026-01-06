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
    import FlowNodeFormat from './FlowNodeFormatData.vue';
    import { ref } from 'vue';
    import { DocumentAdd, Promotion, Close, Select } from '@element-plus/icons-vue';

    import FormUI from '../task/handler/formUIPc.vue';
    import { getFormDetail } from '../../api/form';
    import * as util from '../../utils/objutil';

    const dialogTableVisible = ref<Boolean>(false);
    const formUIRef = ref();
    const loading = ref(false);
    const submitProcess = () => {
        loading.value = true;

        let validate = flowNodeFormatRef.value.validate('pass');
        loading.value = validate;

        if (!validate) {
            return;
        }

        let param = flowNodeFormatRef.value.formatSelectNodeUser();

        formUIRef.value.validate(function (valid, fv) {
            if (valid) {
                var data = {
                    flowId: flowId.value,
                    uniqueId: uniqueId.value,
                    paramMap: { ...param, ...fv }
                };
                emit('complete', data);
                loading.value = false;
            } else {
                loading.value = false;
            }
        });
    };
    const emit = defineEmits(['complete']);

    const complete = () => {
        dialogTableVisible.value = false;
    };
    const flowId = ref('');
    const uniqueId = ref('');
    const taskId = ref('');
    const processInstanceId = ref('');
    //发起人的部门
    const startUserDeptList = ref([]);
    const handle = (fId, tId, pId, uniId) => {
        uniqueId.value = uniId;
        flowId.value = fId;
        taskId.value = tId;
        processInstanceId.value = pId;

        getFormDetail(
            {
                flowId: fId,
                processInstanceId: pId,
                taskId: tId,
                from: 'start'
            },
            true
        ).then((res) => {
            let data = res.data;
            formUIRef.value.loadData(
                data.formList,
                flowId.value,
                undefined,
                undefined,
                undefined,
                undefined,
                data.dynamic
            );
            startUserDeptList.value = data.startUserDeptList;
            startUserMainDeptId.value = data.startUserDeptList[0].id;
        });

        dialogTableVisible.value = true;
    };

    defineExpose({ handle, complete });

    const formValueChange = (v) => {
        v['startUserMainDeptId'] = startUserMainDeptId.value;
        flowNodeFormatRef.value.queryData(
            v,
            flowId.value,
            processInstanceId.value,
            taskId.value,
            'start'
        );
    };

    //发起的主部门id
    const startUserMainDeptId = ref();
    //发起人主部门id变化了
    function startUserMainDeptChangeEvent(e) {
        let formValue = formUIRef.value.getFormValue();

        formValue['startUserMainDeptId'] = e;
        flowNodeFormatRef.value.queryData(
            formValue,
            flowId.value,
            processInstanceId.value,
            taskId.value,
            'start'
        );
    }

    const flowNodeFormatRef = ref();
</script>

<template>
    <div>
        <el-dialog v-model="dialogTableVisible" title="发起流程" width="1100px" destroy-on-close>
            <div class="body-wrap">
                <div class="body-form">
                    <el-scrollbar style="padding-right: 0px; height: 55vh">
                        <div style="height: 50vh">
                            <template v-if="startUserDeptList.length > 1">
                                <h4>请选择您当前所在部门</h4>
                                <el-select
                                    @change="startUserMainDeptChangeEvent"
                                    v-model="startUserMainDeptId"
                                    placeholder="请选择您当前所在部门"
                                    style="width: 100%"
                                >
                                    <el-option
                                        v-for="item in startUserDeptList"
                                        :key="item.id"
                                        :label="item.name"
                                        :value="item.id"
                                    />
                                </el-select>

                                <el-divider></el-divider>
                            </template>

                            <form-u-i @formValueChange="formValueChange" ref="formUIRef"></form-u-i>
                        </div>
                    </el-scrollbar>

                    <div style="text-align: center; margin-top: 10px">
                        <el-button :icon="Close" type="danger" @click="dialogTableVisible = false"
                            >取消</el-button
                        >
                        <el-button
                            :icon="Select"
                            :loading="loading"
                            type="primary"
                            @click="submitProcess"
                        >
                            提交
                        </el-button>
                    </div>
                </div>
                <div class="body-timeline">
                    <el-scrollbar height="60vh">
                        <flow-node-format ref="flowNodeFormatRef"></flow-node-format>
                    </el-scrollbar>
                </div>
            </div>
        </el-dialog>
    </div>
</template>

<style scoped lang="less">
::v-deep(.el-dialog){
		.el-dialog__header{
			padding: 0 !important;
		}

		.el-dialog__title{
			line-height: 42px !important;
			padding-left: 20px;
		}

		.el-form-item__label{
			font-family: PingFang SC, PingFang SC;
			font-size: 14px;
			color: #333;
		}

		.el-dialog__body{
			background-color: rgba(240, 242, 245, 1);
			height: 580px;
			padding: 14px 0 0 !important;
		}
	}

.body-wrap{
		display: flex;
		height: 100%;
		.body-form{
			width: 688px;
			margin-right: 15px;
			padding: 20px 40px 0 45px;
			background-color: #fff;
		}

		.body-timeline{
		    width: 395px;
			background-color: #fff;
			padding: 30px 25px;
		}
	}
</style>
