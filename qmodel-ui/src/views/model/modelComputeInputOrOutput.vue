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

<template>
  <div class="app-container pagecont-top" style="background-color: white">
    <h1>{{isInputOrOut == 1 ? "查看参数" : "设置参数"}}</h1>
    <el-descriptions class="margin-top" :column="3" :size="''" border>
      <!--      <template slot="extra">
              <el-button type="primary" size="small">返回</el-button>
            </template>-->
      <el-descriptions-item>
        <template #label>
          模型名称
        </template>
        {{model.name}}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          接口地址
        </template>
        {{cacl.address}}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          模型版本
        </template>
        <el-tag size="small">Version {{cacl.modelVersion}}</el-tag>
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          请求方式
        </template>
<!--        <dict-tag-->
<!--          :options="dict.type.model_access_mode"-->
<!--          :value="cacl.requestMethod"-->
<!--        />-->
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          创建人
        </template>
        {{cacl.createBy}}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          创建时间
        </template>
        {{cacl.createTime}}
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
        <json-viewer :value="jsonStr" copyable :expand-depth=5 boxed style="box-shadow: none;border: 1px solid #eee">
          <template #copy="{copied}">
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
        <json-viewer :value="jsonStr" copyable :expand-depth=5 boxed style="box-shadow: none;border: 1px solid #eee">
          <template #copy="{copied}">
            <span v-if="copied">复制成功</span>
            <span v-else>复制</span>
          </template>
        </json-viewer>
      </el-col>
    </el-row>

    <div class="button-style">
      <el-button type="primary" @click="saveData"  v-if="isInputOrOut == 0">确认</el-button>
      <el-button @click="goBackPage">返回</el-button>
    </div>
  </div>

</template>

<script>
import {getModel} from "@/api/modelReconstitution/model";
import VueJsonHelper from "@/components/VueJsonHelper/Helper";
import JsonViewer from "json-editor-vue";
import {findModelInputById, findModelOutputById, getCacl, updateCacl} from "@/api/modelReconstitution/cacl";

export default {
  name: "modelComputeInputOrOutput",
  components: {
    VueJsonHelper,
    JsonViewer,
  },
  data(){
    return {
      modelId:null,
      computeId:null,
      isInputOrOut:null,
      cacl:{},
      model:{},
      size: 'small',
      addIllustrate:{},
      deleteFlag: true,
      names:[
        {success:"请求状态"},
        {errorCode: "状态值"},
        {message:"请求是否成功"},
        {data:"数据"},
        {buildingId:"设备id"},
        {buildingName:"设备名称"},
        {buildingType:"设备类型"},
        {buildingTypeName:"设备类型名称"},
        {useable:"是否可用"},
        {realFlow:"实时流量"},
        {pumpSate:"泵组状态"},
        {maxTheoryFlow:"流量上限"},
        {minTheoryFlow:"流量下限"},
      ],
      namesTwo:[],
      jsonStr:{
        "success": true,
        "errorCode": "2000",
        "message": "操作成功",
        "data": [
          {
            "buildingId": "SGJZ00000849",
            "buildingName": "西泵站 5#机组",
            "buildingType": "100008",
            "buildingTypeName": "泵站",
            "useable": true,
            "realFlow": 0,
            "pumpSate": 0,
            "maxTheoryFlow": 8,
            "minTheoryFlow": 0
          }
        ]
      },
      form: {},
    }
  },

  computed:{
  },

  watch:{
    modelId(){
      this.selectModel()
    },
    computeId(){
      this.selectCacl(this.computeId)
      this.selectInterfaceAddress();
    },
  },

  created() {
    this.modelId = this.$route.query.modelId
    this.computeId = this.$route.query.computeId
    this.isInputOrOut = this.$route.query.isInputOrOut
    this.deleteFlag = this.$route.query.deleteFlag == "false" ? false : true
  },
  beforeCreate(){

  },
  beforeMount(){

  },

  mounted() {

  },

  methods:{
    reset() {
      this.form = {
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
      this.resetForm("form");
    },
    selectInterfaceAddress(){
      if (this.isInputOrOut == 0){
        findModelInputById(this.computeId).then((res) => {
          this.jsonStr = JSON.parse(res.data.modelInputJson) == null ? {} : JSON.parse(res.data.modelInputJson)

          let namesCpoy = JSON.parse(res.data.modelInputNames)
          this.names = [];
          for (let key in namesCpoy) {
            this.names.push({[key]:namesCpoy[key]})
          }
        });
      }else {
        findModelOutputById(this.computeId).then((res) => {
          this.jsonStr = JSON.parse(res.data.modelOutputJson) == null ? {} : JSON.parse(res.data.modelOutputJson)

          let namesCpoy = JSON.parse(res.data.modelOutputNames)
          this.names = [];
          for (let key in namesCpoy) {
            this.names.push({[key]:namesCpoy[key]})
          }

          let namesInputCpoy = JSON.parse(res.data.modelInputNames)
          this.namesTwo = [];
          for (let key in namesInputCpoy) {
            this.namesTwo.push(namesInputCpoy[key])
          }
        });
      }
    },
    selectModel(){
      getModel(this.modelId).then((response) => {
        this.model = response.data
      })
    },
    selectCacl(id){
      getCacl(id).then(res => {
        this.cacl = res.data
      })
    },
    /**监听json数据变化 */
    jsonListener(json) {
      this.jsonStr = json
    },
    goBackPage(){
      const modelId = this.model.id;
      const modelName = this.model.name;
      this.$router.push({
        path: "/model/modelManageView",
        query: {
          modelId,
          modelName,
          pageNum: 1,
        },
      });
    },
    saveData(){
      let cacl = {id: this.cacl.id,inputContent:JSON.stringify(this.jsonStr)};
      updateCacl(cacl).then(() => {
        this.$modal.alertSuccess("参数设置成功");
      });
    },
  }
}
</script>

<style scoped lang="scss">
.button-style{
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 20px;
}
</style>
