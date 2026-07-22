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

<template>
  <div class="app-container">
    <div class="titlebar">
      <div class="f1">
        <img src="../assets/images/lc_icon.png" alt="">
        <div class="text">{{ flowName }}</div>
      </div>
      <div class="titlebar-main">
        <div class="f2">
				<span class="center_t" effect="dark" :activeStep="activeStep==0" @click="activeStep=0">
							<span class="unit" :activeStep="activeStep==0">1</span>
							<span class="text">基础信息</span>
					</span>
        <span class="center_t" effect="dark" :activeStep="activeStep==1" @click="activeStep=1">
							<span class="unit" :activeStep="activeStep==1">2</span>
							<span class="text">表单设计</span>
					</span>
        <span class="center_t" effect="dark" :activeStep="activeStep==2" @click="activeStep=2">
							<span class="unit" :activeStep="activeStep==2">3</span>
							<span class="text">流程设计</span>
					</span>

      </div>
      <div class="f3">
                <el-button :icon="DocumentAdd" type="warning" @click="publish(false)">暂 存</el-button>
        <el-button :icon="Promotion" type="primary" @click="publish(true)">发 布</el-button>
      </div>
      </div>
    </div>

    <step1 class="step-container" v-show="activeStep === 0" :groupId="paramGroupId" ref="step1Ref"/>
    <step2 class="step-container" v-show="activeStep === 1" ref="step2Ref"/>
    <step3 class="step-container" v-show="activeStep === 2" :nodeConfigObj="step3NodeConfig" ref="step3Ref"/>



    <!--			//验证每一步-->
    <el-dialog v-model="validateDialogShow" :show-close="true" title="流程检查"  >

      <el-steps :active="validateFlowStep" finish-status="success" simple style="margin-top: 0px">
        <el-step title="基础信息"/>
        <el-step title="表单设计"/>
        <el-step title="流程设计"/>

      </el-steps>

      <div style="text-align: center">
        <el-result v-if="validateFlowStep==3&&validateErrMsg.length==0"
                   icon="success"
                   title="检查成功"
                   sub-title="流程检查完成，现在提交？"
        >
          <template #extra>
            <el-button :icon="Select"  :loading="submitLoading" type="primary" @click="submitFlow">提交</el-button>
          </template>
        </el-result>


        <el-result title="检查中" sub-title="正在检查流程信息"
                   v-if="validateErrMsg.length==0&&validateDialogShow&&validatingShow&&validateFlowStep<3">
          <template #icon>
						<span v-loading="true"
                  style="display: inline-block;border:0px solid red;width: 100px;height: 100px;">

						</span>
          </template>

        </el-result>

        <el-result v-if="validateErrMsg.length>0"
                   icon="error"
                   title="检查失败"
        >
          <template #sub-title>
            <div v-for="item in validateErrMsg">
              <el-text type="danger">

                <el-icon>
                  <WarnTriangleFilled/>
                </el-icon>
                {{ item }}
              </el-text>
            </div>
          </template>
          <template #extra>
            <el-button type="primary" @click="gotoEdit">去修改</el-button>
          </template>
        </el-result>

      </div>
    </el-dialog>

  </div>
</template>

<script lang="ts" setup>
import {ref,computed, onMounted, provide, onBeforeUnmount} from "vue";
import {DocumentAdd, Promotion,WarnTriangleFilled,Select} from "@element-plus/icons-vue";
import {
  addFlow, getFlowDetail
} from "../api/flow/index";


import * as util from "../utils/objutil";


import Step1 from "../components/flow/step1.vue";
import Step2 from "../components/flow/step2.vue";
import Step3 from "../components/flow/step3.vue";

import {LocationQuery, LocationQueryValue, onBeforeRouteLeave, useRoute, useRouter} from "vue-router";


import {useUserStore} from "../stores/user";


//表示流程图可编辑
provide("readOnlyAtFlow",false);
// 监听路由离开
onBeforeRouteLeave((to, from, next) => {


  store.$reset();
  next()

})


const userStore = useUserStore();

import {useFlowStore} from "../stores/flow";

let store = useFlowStore();
const step1Ref = ref();
const step2Ref = ref();
const step3Ref = ref();


const validateErrMsg = ref([])

const flowName = computed(() => {
  let name1 = store.step1.name;
  if (util.isBlank(name1)) {
    return '未命名表单'
  }
  return name1
})

const activeStep = ref(0);
const validateFlowStep = ref(0);
const validateDialogShow = ref(false);
const validatingShow = ref(false);

const gotoEdit = () => {
  activeStep.value = validateFlowStep.value;
  validateDialogShow.value = false
}
//直接发布还是保存
const directPublish=ref(true);


const publish = (p) => {

  directPublish.value=p;

  validateErrMsg.value = []

  validateFlowStep.value = 0
  validateDialogShow.value = true;
  validatingShow.value = true;


  setTimeout(function () {
    //1
    checkStep1();


  }, 500)


}

import {formGroupConfig} from "../api/form/data";
import {assiginObj, getRandomId} from "../utils/objutil";


const route = useRoute();
onMounted(() => {
  document.querySelector(".app-main")?.classList.add("flyflow-create");
  const query: LocationQuery = route.query;

  const groupId = (query.groupId as LocationQueryValue) ?? "";
  const flowId = (query.flowId as LocationQueryValue) ?? "";
  const id = (query.id as LocationQueryValue) ?? "";
  const cp = (query.cp as LocationQueryValue) ?? "";

	//保存到store
	provide("currentFlowId", flowId);


	if(util.isNotBlank(id)){
		store.step1.uniqueId = id
	}else{
		store.step1.uniqueId = getRandomId()

	}


  if (util.isNotBlank(groupId)) {
    paramGroupId.value = (groupId);
  }
  if (util.isNotBlank(flowId)) {

    getFlowDetail(flowId).then(res => {
      var {data} = res;

      store.step1.admin = JSON.parse(data.admin)
      store.step1.rangeList = (data.rangeList)
      store.step1.name = data.name
      store.step1.logo = data.logo
      if (!cp || !(parseInt(cp) === 1)) {
        //复制
        store.step1.flowId = flowId


      }
      store.step1.remark = data.remark;
      store.step1.groupId = data.groupId;

			let formItemList = JSON.parse(data.formItemsPc);
			//处理默认新增字段
			{
				var arr=[];

				for(var n of formItemList){

					for(var item of formGroupConfig){
						for(var f of item.formList){
							if(f.type===n.type){
								let v = assiginObj(util.deepCopy(f),util.deepCopy(n));
								arr.push(v)
								break
							}
						}
					}
				}

				store.setStep2Form(arr)

			}

      step3NodeConfig.value = JSON.parse(data.process)
    })
  } else {
    //新增
    let userId = userStore.userId;
    let name = userStore.nickname;
    let avatar = userStore.avatar;
	  step3NodeConfig.value=[];
    store.step1.admin = [{
      "id": userId,
      name: name,
      avatar: avatar,
      type: 'user'
    }]

  }


})

onBeforeUnmount(()=>{
  document.querySelector(".app-main")?.classList.remove("flyflow-create");
})
const step3NodeConfig = ref()

var paramGroupId = ref('');


const checkStep1 = () => {
  step1Ref.value.validate(function (valid, arr) {
    if (valid) {
      validateFlowStep.value = 1

      console.log("step-1", new Date().getTime())
      setTimeout(function () {
        checkStep2();
      }, 100)

    } else {
      validatingShow.value = false;
      //错误信息
      validateErrMsg.value = arr;
    }
  });
}
const checkStep2 = () => {
  step2Ref.value.validate(function (valid, arr) {
        if (valid) {
          console.log("step-2", new Date().getTime())

          setTimeout(function () {
            validateFlowStep.value = 2
            checkStep3();
          }, 100)
        } else {
          validatingShow.value = false;
          //错误信息
          validateErrMsg.value = arr;
        }
      }
  );

}


const checkStep3 = () => {
  setTimeout(function () {


    step3Ref.value.validate(function (valid, arr) {
      if (valid) {
        console.log("step-3", new Date().getTime())

        setTimeout(function () {
          validateFlowStep.value = 3

        }, 100)

      } else {
        validatingShow.value = false;
        //错误信息
        validateErrMsg.value = arr;
      }
    })
  })
}


const router = useRouter();

const submitLoading=ref(false)

const submitFlow = () => {
	submitLoading.value=true;
  step3Ref.value.getProcessData().then(res => {
    let step1 = store.step1;
    let step2 = store.step2;


    let flow = util.deepCopy(step1);
    flow.formItems = JSON.stringify(step2);
    flow.formItemsPc = JSON.stringify(store.step2Form);
    flow.process = JSON.stringify(res);
    flow.admin = JSON.stringify(step1.admin);

    flow.publish=directPublish.value

    addFlow(flow).then(res => {
      validateDialogShow.value = false;
      //TODO 修改返回地址
      router.push("/flyflow/flow/group")
    }).finally(()=>{
			submitLoading.value=false;

		})


  })
}

</script>
<style scoped lang="less">
@f2_width: 800px;
.titlebar {
  height: 138px;
  background: #FFFFFF;
  box-shadow: 0px 1px 3px 1px rgba(0,0,0,0.09);
  border-radius: 0;
  display: flex;
  flex-direction: column;
  margin-bottom: 15px;
  .f1 {
    height: 39px;
    border-bottom:1px solid #E8E8E8;
    display: flex;
    align-items: center;
    padding-left: 21px;

    img{
      width: 20px;
      margin-right: 10px;
    }

    .text{
      font-family:  PingFang SC;
      font-weight: 600;
      font-size: 16px;
      color: #000000;
      text-align: left;
      font-style: normal;
      text-transform: none;
    }
  }
  .titlebar-main{
    display: flex;
    justify-content: center;
    flex: 1;
    width: 100%;
    position: relative;

    .unit{
      width: 56px;
      height: 56px;
      font-family: Microsoft YaHei, Microsoft YaHei;
      font-weight: bold;
      font-size: 28px;
      color: #FFFFFF;
      line-height: 56px;
      display: block;
      background-color: #C5DDFB;
    }

    .center_t{
      display: flex;
      align-items: center;

      .text{
        font-size: 16px;
        font-weight: 600;
        color: rgba(0,0,0,0.65);
      }
    }
  }


  .f2 {
    display: flex;
    .center_t::after{
      content: '';
      position: absolute;
      width: 164px;
      height: 1px;
      background-color:  #D4D2D2;
      left: 146px;
    }
    .center_t:last-child{
      margin-right: 0;
    }
    .center_t:last-child::after{
      display: none;
    }
  }

  .f3 {
    position: absolute;
    top: 50px;
    right: 14px;
    transform: translateY(-50%);
  }
}

.center_t {
  cursor: pointer;
  padding: 10px 10px;
  margin-right: 163px;
  position: relative;

  span:first-child {
    margin-right: 6px;
    font-size: 14px;
    font-weight: 400;
    text-align: center;
    line-height: 22px;
    border: 1px solid;
    border-radius: 50%;
    width: 24px;
    height: 24px;
    display: inline-block
  }

  span:first-child[activeStep=true] {
    color: white;
    background-color: var(--el-color-primary);
  }

  span:last-child {
    font-weight: 500;
    font-size: 14px;
    margin-right: 0;
  }


}

.center_t[activeStep=true] {
  border-bottom: 2px solid var(--el-color-primary);
  color: var(--el-color-primary);
}

.center_t[activeStep=true] .text{
  color: #2666FB !important;
}
</style>

<style  lang="less">
  .flyflow-create{
    height: 100vh;

    .app-main-inner{

    }

    .app-container{
      margin: 0;
      padding: 15px;
      height: 100%;
    }
  }

  .step-container{
  background-color: #fff;
  height: calc(100% - 138px - 14px);
  overflow-y: auto;
  overflow-x: hidden;

  .box-card{
    box-shadow: none;
    border: none;

    .el-card__body{
      padding: 15px 20px !important;
      .el-form-item{
        background: #F5F7FB;
        border-radius: 2px;
        padding: 12px 56px 12px 50px;

        .el-upload--picture-card{
          width: 74px !important;
          height: 60px !important;
        }

        .el-form-item__label{
          color: #333;
        }

        .is-circle{
          width: 46px;
          height: 46px;
          border-radius: 50% !important;
          background: #C5DDFB;
          border: none;
          .el-icon{
            font-size: 21px;
            font-weight: bold;
          }
        }
      }

      .el-form-item:last-child{
        margin-bottom: 0px !important;
      }
    }
  }
}
</style>
