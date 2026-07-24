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
  <div class="app-container">
    <div class="father_box">
      <div class="son_oneBox">
        <span>设置参数</span>
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
        {{ interfaceAddress.interfaceAddress }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 模型版本 </template>
        <el-tag size="mini">Version {{ interfaceAddress.version }}</el-tag>
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 请求方式 </template>
        <dict-tag
          :options="model_access_mode"
          :value="interfaceAddress.requestMethod"
        />
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 创建人 </template>
        {{ interfaceAddress.createBy }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 创建时间 </template>
        {{ interfaceAddress.createTime }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label> 接口说明 </template>
        {{ interfaceAddress.remark }}
      </el-descriptions-item>
    </el-descriptions>
    <h3>设置输入参数</h3>
    <el-row :gutter="10" style="margin-top: 20px">
      <el-col :xs="24" :sm="24" :md="24" :lg="13" :xl="12">
        <VueJsonHelper
          :size="size"
          :names="inputNames"
          ref="inputJson"
          :jsonStr.sync="JSON.stringify(inputJsonStr)"
          @jsonListener="inputJsonListener"
          @handleAddIllustrate="inputAddIllustrate"
        />
      </el-col>
      <el-col :xs="24" :sm="24" :md="24" :lg="13" :xl="12">
        <json-viewer
          :value="inputJsonStr"
          copyable
          :expand-depth="5"
          boxed
          style="box-shadow: none; border: 1px solid #eee"
        >
          <template v-slot:copy="{ copied }">
            <span v-if="copied">复制成功</span>
            <span v-else>复制</span>
          </template>
        </json-viewer>
      </el-col>
    </el-row>
    <h3>设置输出参数</h3>
    <el-row :gutter="10" style="margin-top: 20px">
      <el-col :xs="24" :sm="24" :md="24" :lg="13" :xl="12">
        <VueJsonHelper
          :size="size"
          ref="outPutJson"
          :names="outputNames"
          :json-str.sync="JSON.stringify(outPutJsonStr)"
          @jsonListener="outputJsonListener"
          @handleAddIllustrate="outputAddIllustrate"
        />
      </el-col>
      <el-col :xs="24" :sm="24" :md="24" :lg="13" :xl="12">
        <json-viewer
          :value="outPutJsonStr"
          copyable
          :expand-depth="5"
          boxed
          style="box-shadow: none; border: 1px solid #eee"
        >
          <template v-slot:copy="{ copied }">
            <span v-if="copied">复制成功</span>
            <span v-else>复制</span>
          </template>
        </json-viewer>
      </el-col>
    </el-row>

    <div class="button-style">
      <el-button type="primary" @click="saveData">确认</el-button>
      <el-button @click="goBackPage">返回</el-button>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, watch, onMounted, getCurrentInstance } from "vue";
import { useRouter, useRoute } from "vue-router";
import { ElMessage } from "element-plus";
import {
  getInterfaceAddress,
  updateInterfaceAddress,
} from "@/api/modelReconstitution/interfaceAddress";
import { getModel } from "@/api/modelReconstitution/model";
import VueJsonHelper from "@/components/VueJsonHelper/Helper";
import JsonViewer from "json-editor-vue";
import { useDict } from "@/utils/dict.js";

// 获取当前实例以访问路由和其他属性
const { proxy } = getCurrentInstance();
const router = useRouter();
const route = useRoute();

// 模板引用
const inputJson = ref(null);
const outPutJson = ref(null);

// 响应式数据
const modelId = ref(null);
const interfaceAddressId = ref(null);
const interfaceAddress = ref({});
const model = ref({});
const size = ref("small");
const addIllustrate = ref({});
const inputJsonStr = ref({});
const outPutJsonStr = ref({});
const inputMap = new Map();
const outputMap = new Map();
const form = ref({});
const inputNames = ref([]);
const outputNames = ref([]);

// 字典数据
const dict = reactive({
  type: {
    model_access_mode: [],
  },
});
const model_access_mode = useDict("model_access_mode").model_access_mode;

// 监听器
watch(modelId, (newVal) => {
  selectModel();
});

watch(interfaceAddressId, (newVal) => {
  selectInterfaceAddress();
});

// 在组件挂载后初始化数据
onMounted(() => {
  modelId.value = route.query.modelId;
  interfaceAddressId.value = route.query.interfaceAddressId;
});

// 方法定义
const reset = () => {
  form.value = {
    id: null,
    companyId: null,
    modelId: null,
    interfaceAddress: null,
    versionId: null,
    requestMethod: null,
    inputParameter: null,
    outputParameter: null,
    inputParameterIllustrate: null,
    outputParameterIllustrate: null,
    delFlag: null,
    createBy: null,
    creatorId: null,
    createTime: null,
    updateBy: null,
    updatorId: null,
    updateTime: null,
    remark: null,
  };
  if (proxy) {
    proxy.resetForm("form");
  }
};

const selectInterfaceAddress = () => {
  if (!interfaceAddressId.value) return;
  getInterfaceAddress(interfaceAddressId.value).then((response) => {
    interfaceAddress.value = response.data;
    inputJsonStr.value =
      JSON.parse(interfaceAddress.value.inputParameter) == null
        ? {}
        : JSON.parse(interfaceAddress.value.inputParameter);
    outPutJsonStr.value =
      JSON.parse(interfaceAddress.value.outputParameter) == null
        ? {}
        : JSON.parse(interfaceAddress.value.outputParameter);
    let inputParameterIllustrate = JSON.parse(
      interfaceAddress.value.inputParameterIllustrate
    );
    let outputParameterIllustrate = JSON.parse(
      interfaceAddress.value.outputParameterIllustrate
    );

    for (let inputParameterIllustrateKey in inputParameterIllustrate) {
      inputMap.set(
        inputParameterIllustrateKey,
        inputParameterIllustrate[inputParameterIllustrateKey]
      );
      inputNames.value.push({
        [inputParameterIllustrateKey]:
          inputParameterIllustrate[inputParameterIllustrateKey],
      });
    }

    for (let outputParameterIllustrateKey in outputParameterIllustrate) {
      outputMap.set(
        outputParameterIllustrateKey,
        outputParameterIllustrate[outputParameterIllustrateKey]
      );
      outputNames.value.push({
        [outputParameterIllustrateKey]:
          outputParameterIllustrate[outputParameterIllustrateKey],
      });
    }
  });
};

const selectModel = () => {
  if (!modelId.value) return;
  getModel(modelId.value).then((response) => {
    model.value = response.data;
  });
};

/**监听json数据变化 */
const inputJsonListener = (json) => {
  inputJsonStr.value = json;
};

/**监听json数据变化 */
const outputJsonListener = (json) => {
  outPutJsonStr.value = json;
};

const inputAddIllustrate = (item) => {
  inputMap.set(item.key, item.remark);
};

const outputAddIllustrate = (item) => {
  outputMap.set(item.key, item.remark);
};

const goBackPage = () => {
  const modelIdValue = model.value.id;
  const modelName = model.value.name;
  router.push({
    path: "/model/modelManageView",
    query: {
      modelId: modelIdValue,
      modelName,
      pageNum: 1,
    },
  });
};

const saveData = () => {
  form.value.inputParameter = JSON.stringify(inputJsonStr.value);
  form.value.outputParameter = JSON.stringify(outPutJsonStr.value);
  form.value.inputParameterIllustrate = JSON.stringify(
    Object.fromEntries(inputMap)
  );
  form.value.outputParameterIllustrate = JSON.stringify(
    Object.fromEntries(outputMap)
  );
  if (
    form.value.inputParameter === "{}" ||
    form.value.inputParameter === "[]"
  ) {
    form.value.inputParameter = null;
  }
  if (
    form.value.outputParameter === "{}" ||
    form.value.outputParameter === "[]"
  ) {
    form.value.outputParameter = null;
  }
  if (
    form.value.inputParameterIllustrate === "{}" ||
    form.value.inputParameterIllustrate === "[]"
  ) {
    form.value.inputParameterIllustrate = null;
  }
  if (
    form.value.outputParameterIllustrate === "{}" ||
    form.value.outputParameterIllustrate === "[]"
  ) {
    form.value.outputParameterIllustrate = null;
  }
  form.value.id = interfaceAddress.value.id;
  updateInterfaceAddress(form.value).then((response) => {
    ElMessage.success("参数设置成功");
  });
};
</script>

<style scoped lang="scss">
.app-container {
  background: #fff;
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
