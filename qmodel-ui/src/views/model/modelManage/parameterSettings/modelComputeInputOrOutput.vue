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
  <div class="app-container pagecont-top" style="background-color: white">
    <div class="father_box">
      <div class="son_oneBox">
        <span>{{ isInputOrOut == 1 ? "查看参数" : "设置参数" }}</span>
      </div>
    </div>
    <el-descriptions class="margin-top" :column="3" :size="''" border>
      <!--      <template slot="extra">
              <el-button type="primary" size="small">返回</el-button>
            </template>-->
      <el-descriptions-item>
        <template #label> 模型名称 </template>
        {{ model.name }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 接口地址 </template>
        {{ cacl.address }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 模型版本 </template>
        <el-tag size="small">Version {{ cacl.modelVersion }}</el-tag>
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 请求方式 </template>
        <dict-tag :options="model_access_mode" :value="cacl.requestMethod" />
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 创建人 </template>
        {{ cacl.createBy }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 创建时间 </template>
        {{ cacl.createTime }}
      </el-descriptions-item>
    </el-descriptions>

    <el-row :gutter="10" style="margin-top: 20px" v-if="isInputOrOut == 0">
      <el-col :xs="24" :sm="24" :md="24" :lg="12" :xl="12">
        <VueJsonHelper
          :size="size"
          ref="inputJson"
          :names="names"
          :deleteFlag="deleteFlag"
          :json-str="JSON.stringify(jsonStr)"
          @jsonListener="jsonListener"
        />
      </el-col>
      <el-col :xs="24" :sm="24" :md="24" :lg="12" :xl="12">
        <json-viewer
          :value="jsonStr"
          copyable
          :expand-depth="5"
          boxed
          style="box-shadow: none; border: 1px solid #eee"
        >
          <template #copy="{ copied }">
            <span v-if="copied">复制成功</span>
            <span v-else>复制</span>
          </template>
        </json-viewer>
      </el-col>
    </el-row>

    <el-row :gutter="10" style="margin-top: 20px" v-if="isInputOrOut == 1">
      <el-col :xs="24" :sm="24" :md="24" :lg="12" :xl="12">
        <VueJsonHelper
          :size="size"
          ref="inputJson"
          :names="names"
          :names-two="namesTwo"
          :deleteFlag="deleteFlag"
          :json-str="JSON.stringify(jsonStr)"
          @jsonListener="jsonListener"
        />
      </el-col>
      <el-col :xs="24" :sm="24" :md="24" :lg="12" :xl="12">
        <json-viewer
          :value="jsonStr"
          copyable
          :expand-depth="5"
          boxed
          style="box-shadow: none; border: 1px solid #eee"
        >
          <template #copy="{ copied }">
            <span v-if="copied">复制成功</span>
            <span v-else>复制</span>
          </template>
        </json-viewer>
      </el-col>
    </el-row>

    <div class="button-style">
      <el-button type="primary" @click="saveData" v-if="isInputOrOut == 0"
        >确认</el-button
      >
      <el-button @click="goBackPage">返回</el-button>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, watch, onMounted, getCurrentInstance } from "vue";
import { useRoute, useRouter } from "vue-router";
import { ElMessage, ElMessageBox } from "element-plus";
import { getModel } from "@/api/modelReconstitution/model";
import VueJsonHelper from "@/components/VueJsonHelper/Helper";
import JsonViewer from "json-editor-vue";
import {
  findModelInputById,
  findModelOutputById,
  getCacl,
  updateCacl,
} from "@/api/modelReconstitution/cacl";
import { useDict } from "@/utils/dict.js";

const model_access_mode = useDict("model_access_mode").model_access_mode;
// 获取当前实例以访问路由和其他属性
const { proxy } = getCurrentInstance();
const route = useRoute();
const router = useRouter();

// 响应式数据
const modelId = ref(null);
const computeId = ref(null);
const isInputOrOut = ref(null);
const cacl = ref({});
const model = ref({});
const size = ref("small");
const addIllustrate = ref({});
const deleteFlag = ref(true);
const names = ref([
  { success: "请求状态" },
  { errorCode: "状态值" },
  { message: "请求是否成功" },
  { data: "数据" },
  { buildingId: "设备id" },
  { buildingName: "设备名称" },
  { buildingType: "设备类型" },
  { buildingTypeName: "设备类型名称" },
  { useable: "是否可用" },
  { realFlow: "实时流量" },
  { pumpSate: "泵组状态" },
  { maxTheoryFlow: "流量上限" },
  { minTheoryFlow: "流量下限" },
]);
const namesTwo = ref([]);
const jsonStr = ref({
  // success: true,
  // errorCode: "2000",
  // message: "操作成功",
  // data: [
  //   {
  //     buildingId: "SGJZ00000849",
  //     buildingName: "西泵站 5#机组",
  //     buildingType: "100008",
  //     buildingTypeName: "泵站",
  //     useable: true,
  //     realFlow: 0,
  //     pumpSate: 0,
  //     maxTheoryFlow: 8,
  //     minTheoryFlow: 0,
  //   },
  // ],
});
const form = ref({});

// 监听器
watch(
  () => modelId.value,
  () => {
    selectModel();
  }
);

watch(
  () => computeId.value,
  () => {
    selectCacl(computeId.value);
    selectInterfaceAddress();
  }
);

// 组件挂载后执行
onMounted(() => {
  console.log(route.query.modelId, "idsss");

  modelId.value = route.query.modelId;
  computeId.value = route.query.computeId;
  isInputOrOut.value = route.query.isInputOrOut;
  deleteFlag.value = route.query.deleteFlag == "false" ? false : true;
});

// 方法定义
const reset = () => {
  form.value = {
    id: null,
    code: null,
    name: null,
    modelId: null,
    modelName: null,
    modelVersion: null,
    startTime: null,
    endTime: null,
    status: 0,
    inputIds: null,
    outputIds: null,
    validFlag: null,
    delFlag: null,
    createBy: null,
    creatorId: null,
    createTime: null,
    updateBy: null,
    updatorId: null,
    updateTime: null,
    remark: null,
    addressId: null,
    addressType: null,
    address: null,
    requestMethod: null,
  };
};

const selectInterfaceAddress = () => {
  if (isInputOrOut.value == 0) {
    findModelInputById(computeId.value).then((res) => {
      jsonStr.value =
        JSON.parse(res.data.modelInputJson) == null
          ? {}
          : JSON.parse(res.data.modelInputJson);

      let namesCpoy = JSON.parse(res.data.modelInputNames);
      names.value = [];
      for (let key in namesCpoy) {
        names.value.push({ [key]: namesCpoy[key] });
      }
    });
  } else {
    findModelOutputById(computeId.value).then((res) => {
      jsonStr.value =
        JSON.parse(res.data.modelOutputJson) == null
          ? {}
          : JSON.parse(res.data.modelOutputJson);

      let namesCpoy = JSON.parse(res.data.modelOutputNames);
      names.value = [];
      for (let key in namesCpoy) {
        names.value.push({ [key]: namesCpoy[key] });
      }

      let namesInputCpoy = JSON.parse(res.data.modelInputNames);
      namesTwo.value = [];
      for (let key in namesInputCpoy) {
        namesTwo.value.push(namesInputCpoy[key]);
      }
    });
  }
};

const selectModel = () => {
  console.log(modelId.value, "123123123");

  getModel(modelId.value).then((response) => {
    model.value = response.data;
    console.log(response.data, "response.data");
  });
};

const selectCacl = (id) => {
  getCacl(id).then((res) => {
    cacl.value = res.data;
  });
};

/**监听json数据变化 */
const jsonListener = (json) => {
  jsonStr.value = json;
};

const goBackPage = () => {
  // const modelIdVal = model.value.id;
  // const modelName = model.value.name;
  // router.push({
  //   path: "/model/modelManageView",
  //   query: {
  //     modelId: modelIdVal,
  //     modelName,
  //     pageNum: 1,
  //   },
  // });
  router.go(-1);
};

const saveData = () => {
  let caclData = {
    id: cacl.value.id,
    inputContent: JSON.stringify(jsonStr.value),
  };
  updateCacl(caclData).then(() => {
    ElMessage.success("参数设置成功");
  });
};
</script>

<style scoped lang="scss">
.app-container {
  padding: 15px;
  .father_box {
    padding-bottom: 10px;
    line-height: 46px;
    .son_oneBox {
      font-size: 20px;
      font-weight: bolder;
    }
  }

  .button-style {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
  }
}
</style>
