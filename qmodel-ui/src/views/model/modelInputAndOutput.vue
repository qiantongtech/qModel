<template>
  <div class="app-container">
    <h1>设置参数</h1>
    <el-descriptions class="margin-top" :column="3" :size="''" border>
<!--      <template slot="extra">
        <el-button type="primary" size="small">返回</el-button>
      </template>-->
      <el-descriptions-item>
        <template slot="label">
          模型名称
        </template>
        {{model.name}}
      </el-descriptions-item>
      <el-descriptions-item>
        <template slot="label">
          接口地址
        </template>
        {{interfaceAddress.interfaceAddress}}
      </el-descriptions-item>
      <el-descriptions-item>
        <template slot="label">
          模型版本
        </template>
        <el-tag size="mini">Version {{interfaceAddress.version}}</el-tag>
      </el-descriptions-item>
      <el-descriptions-item>
        <template slot="label">
          请求方式
        </template>
        <dict-tag
          :options="dict.type.model_access_mode"
          :value="interfaceAddress.requestMethod"
        />
      </el-descriptions-item>
      <el-descriptions-item>
        <template slot="label">
          创建人
        </template>
        {{interfaceAddress.createBy}}
      </el-descriptions-item>
      <el-descriptions-item>
        <template slot="label">
          创建时间
        </template>
        {{interfaceAddress.createTime}}
      </el-descriptions-item>
      <el-descriptions-item>
        <template slot="label">
          接口说明
        </template>
        {{interfaceAddress.remark}}
      </el-descriptions-item>
    </el-descriptions>

    <el-row :gutter="10" style="margin-top: 20px">
      <h3>设置输入参数</h3>
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
          <json-viewer :value="inputJsonStr" copyable :expand-depth=5 boxed style="box-shadow: none;border: 1px solid #eee">
            <template v-slot:copy="{copied}">
              <span v-if="copied">复制成功</span>
              <span v-else>复制</span>
            </template>
          </json-viewer>
      </el-col>
    </el-row>

    <el-row :gutter="10" style="margin-top: 20px">
      <h3>设置输出参数</h3>
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
          <json-viewer :value="outPutJsonStr" copyable :expand-depth=5 boxed style="box-shadow: none;border: 1px solid #eee">
            <template v-slot:copy="{copied}">
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

<script>
import {getInterfaceAddress, updateInterfaceAddress} from "@/api/modelReconstitution/interfaceAddress";
import {getModel} from "@/api/modelReconstitution/model";
import VueJsonHelper from "@/components/VueJsonHelper/Helper";
import JsonViewer from "json-editor-vue";

export default {
  name: "modelInputAndOutput",
  components: {
    VueJsonHelper,
    JsonViewer,
  },
  dicts: [
    "model_access_mode"
  ],
  data(){
    return {
      modelId:null,
      interfaceAddressId:null,
      interfaceAddress:{},
      model:{},
      size: 'small',
      addIllustrate:{},
      inputJsonStr: {},
      outPutJsonStr: {},
      inputMap: new Map,
      outputMap: new Map,
      form: {},
      inputNames: [],
      outputNames: [],
    }
  },

  computed:{
  },

  watch:{
    modelId(){
      this.selectModel()
    },
    interfaceAddressId(){
      this.selectInterfaceAddress()
    }
  },

  created() {
    this.modelId = this.$route.query.modelId
    this.interfaceAddressId = this.$route.query.interfaceAddressId
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
        remark: null
      };
      this.resetForm("form");
    },
    selectInterfaceAddress(){
      getInterfaceAddress(this.interfaceAddressId).then(response => {
        this.interfaceAddress = response.data;
        this.inputJsonStr = JSON.parse(this.interfaceAddress.inputParameter) == null ? {} : JSON.parse(this.interfaceAddress.inputParameter)
        this.outPutJsonStr = JSON.parse(this.interfaceAddress.outputParameter) == null ? {} : JSON.parse(this.interfaceAddress.outputParameter)
        let inputParameterIllustrate = JSON.parse(this.interfaceAddress.inputParameterIllustrate)
        let outputParameterIllustrate = JSON.parse(this.interfaceAddress.outputParameterIllustrate)

        for (let inputParameterIllustrateKey in inputParameterIllustrate) {
          this.inputMap.set(inputParameterIllustrateKey,inputParameterIllustrate[inputParameterIllustrateKey])
          this.inputNames.push({[inputParameterIllustrateKey]:inputParameterIllustrate[inputParameterIllustrateKey]})
        }

        for (let outputParameterIllustrateKey in outputParameterIllustrate) {
          this.outputMap.set(outputParameterIllustrateKey,outputParameterIllustrate[outputParameterIllustrateKey])
          this.outputNames.push({[outputParameterIllustrateKey]:outputParameterIllustrate[outputParameterIllustrateKey]})
        }
      });
    },
    selectModel(){
      getModel(this.modelId).then((response) => {
        this.model = response.data
      })
    },
    /**监听json数据变化 */
    inputJsonListener(json) {
      this.inputJsonStr = json
    },
    /**监听json数据变化 */
    outputJsonListener(json) {
      this.outPutJsonStr = json
    },
    inputAddIllustrate(item){
      this.inputMap.set(item.key,item.remark)
    },
    outputAddIllustrate(item){
      this.outputMap.set(item.key,item.remark)
    },
    goBackPage(){
      const modelId = this.model.id;
      const modelName = this.model.name;
      this.$router.push({
        path: "/modelReconstitution/waterConserve/modelManageView",
        query: {
          modelId,
          modelName,
          pageNum: 1,
        },
      });
    },
    saveData(){
      this.form.inputParameter = JSON.stringify(this.inputJsonStr);
      this.form.outputParameter = JSON.stringify(this.outPutJsonStr);
      this.form.inputParameterIllustrate = JSON.stringify(Object.fromEntries(this.inputMap));
      this.form.outputParameterIllustrate = JSON.stringify(Object.fromEntries(this.outputMap));
      if (this.form.inputParameter === "{}" || this.form.inputParameter === "[]"){
        this.form.inputParameter = null
      }
      if (this.form.outputParameter === "{}" || this.form.outputParameter === "[]"){
        this.form.outputParameter = null
      }
      if (this.form.inputParameterIllustrate === "{}" || this.form.inputParameterIllustrate === "[]"){
        this.form.inputParameterIllustrate = null
      }
      if (this.form.outputParameterIllustrate === "{}" || this.form.outputParameterIllustrate === "[]"){
        this.form.outputParameterIllustrate = null
      }
      this.form.id = this.interfaceAddress.id
      updateInterfaceAddress(this.form).then(response => {
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
