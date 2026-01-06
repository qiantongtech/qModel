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

<!-- 此组件是会返回文件名称和文件地址，因此要使用此组件，数据表中必须有文件地址和文件名称的字段 -->
<template>
  <div class="upload-file">
    <el-upload
        multiple
        :action="uploadFileUrl"
        :before-upload="handleBeforeUpload"
        :file-list="fileList"
        :limit="limit"
        :on-error="handleUploadError"
        :on-exceed="handleExceed"
        :on-success="handleUploadSuccess"
        :show-file-list="false"
        :headers="headers"
        class="upload-file-uploader"
        ref="upload"
        :drag="fileStyle2"
        v-if="displayNone &&  limit > fileList.length"
    >
      <div v-if="!fileStyle2">
        <!-- 上传按钮 -->
        <el-button size="default" type="primary" :disabled="disabled">选取文件</el-button>
      </div>
      <div v-else>
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip">
          格式为 <b style="color: #f56c6c">{{ fileType.join("/") }}</b>且不超过<b style="color: #f56c6c">{{
            fileSize
          }}MB</b>
        </div>
      </div>
      <template #tip v-if="!fileStyle2">
        <!-- 上传提示 -->
        <div class="el-upload__tip" v-if="showTip">
          请上传
          <template v-if="fileSize">
            大小不超过 <b style="color: #f56c6c">{{ fileSize }}MB</b>
          </template>
          <template v-if="fileType">
            格式为 <b style="color: #f56c6c">{{ fileType.join("/") }}</b>
          </template>
          的文件
        </div>
      </template>
    </el-upload>

    <!-- 文件列表 -->
    <transition-group
        class="upload-file-list el-upload-list el-upload-list--text"
        name="el-fade-in-linear"
        tag="ul"
        :style="displayNone ? {marginTop:'0'} : {marginTop:'-7px'}"
    >
      <li
          :key="file.url"
          class="el-upload-list__item ele-upload-list__item-content"
          v-for="(file, index) in fileList"
      >
        <!-- ${baseUrl} -->
        <el-link :href="`${file.url}`" :underline="false" target="_blank">
          <!-- <span class="el-icon-document"> {{ getFileName(file.name) }} </span> -->
          <span class="el-icon-document" v-if="editName_file">
            {{ editName_file }}
          </span>
          <span class="el-icon-document" v-else> {{ file.name }} </span>
        </el-link>
        <div class="ele-upload-list__item-content-action">
          <el-link :disabled="disabled" :underline="false" @click="handleDelete(index)" type="danger">
            删除
          </el-link>
        </div>
      </li>
    </transition-group>
  </div>
</template>

<script>
import {getToken} from "@/utils/auth";

export default {
  name: "FileNameUpload",
  props: {
    // 校验水资源文件名称格式，true：校验，false：不校验
    wrFileName: {
      type: Boolean,
      default: false,
    },
    // 校验水取水许可证名称格式，true：校验，false：不校验
    dflNameCheck: {
      type: Boolean,
      default: false,
    },
    // 是否隐藏上传的框框
    displayNone: {
      type: Boolean,
      default: true,
    },
    // 值
    value: [String, Object, Array],
    // 数量限制
    limit: {
      type: Number,
      default: 5,
    },
    // 大小限制(MB)
    fileSize: {
      type: Number,
      default: 20,
    },
    // 文件类型, 例如['png', 'jpg', 'jpeg']
    fileType: {
      type: Array,
      default: () => ["doc", "xls", "ppt", "txt", "pdf", "geojson", "json", "shp"],
    },
    // 是否显示提示
    isShowTip: {
      type: Boolean,
      default: true,
    },
    editName: {
      type: String,
    },
    fileStyle2: {
      type: Boolean,
      default: false,
    },
    disabled: {
      type: Boolean,
      default: false,
    },
    uploadSuccess: {
      type: Function,
      default: () => {
      },
    },
    deleteSuccess: {
      type: Function,
      default: () => {
      },
    },
  },
  data() {
    return {
      number: 0,
      uploadList: [],
      fileOldName: "",
      baseUrl: import.meta.env.VUE_APP_BASE_API,
      uploadFileUrl: ref(import.meta.env.VITE_APP_BASE_API + "/common/upload"), // 上传的图片服务器地址
      headers: {
        Authorization: "Bearer " + getToken(),
      },
      fileList: [],
      editName_file: this.editName
    };
  },
  watch: {
    value: {
      handler(val) {
        console.log("数据" + val);
        if (val) {
          let temp = 1;
          // 首先将值转为数组
          const list = Array.isArray(val) ? val : this.value.split(",");
          // 然后将数组转为对象数组
          this.fileList = list.map((item) => {
            if (typeof item === "string") {
              item = {name: item, url: item};
            }
            item.uid = item.uid || new Date().getTime() + temp++;
            return item;
          });
        } else {
          this.fileList = [];
          return [];
        }
      },
      deep: true,
      immediate: true,
    },
    editName: {
      handler(newval) {
        this.editName_file = newval
      },
      deep: true,
      immediate: true,
    }
  },
  computed: {
    // 是否显示提示
    showTip() {
      return this.isShowTip && (this.fileType || this.fileSize);
    },
  },
  methods: {
    // 上传方法，覆盖默认上传
    handleUpload(file) {
      // console.log(file)

      let myDate = new Date();
      let year = "/" + myDate.getFullYear();
      let month = "/" + myDate.getMonth() + 1;
      let day = "/" + myDate.getDate() + "/";
      let fileName =
          year +
          month +
          day +
          this.uuid() +
          file.file.name.substring(file.file.name.lastIndexOf("."));
      let oldName = file.file.name;
      // getSts().then((res) => {
      //   //从后端获取oss配置
      //   let client = new OSS({
      //     region: res.region,
      //     accessKeyId: res.accessKeyId,
      //     accessKeySecret: res.accessKeySecret,
      //     stsToken: res.securityToken,
      //     expiration: res.expiration,
      //     host: res.host,
      //     accessUrl: res.accessUrl,
      //     bucket: res.bucket,
      //   });
      //   let accessUrl = res.accessUrl;
      //   // base64位pdf转blob
      //   const blob = new Blob([file.file]);
      //   // blob转arrayBuffer
      //   const reader = new FileReader();
      //   reader.readAsArrayBuffer(blob);
      //   reader.onload = () => {
      //     //上传至oss
      //     client.put(fileName, file.file).then((res) => {
      //       res.name = oldName;
      //       res.fileName = oldName;
      //       res.fileUrl = res.url.replace(
      //           "http://qttech.oss-cn-hangzhou.aliyuncs.com",
      //           accessUrl
      //       );
      //       res.url = res.fileUrl;
      //       console.log(res);
      //       this.handleUploadSuccess(res);
      //     });
      //   };
      // });
    },

    uuid() {
      let s = [];
      let hexDigits = "0123456789abcdef";
      for (let i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
      }
      s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
      s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
      s[8] = s[13] = s[18] = s[23] = "-";

      let uuid = s.join("");
      return uuid;
    },

    // 上传前校检格式和大小
    handleBeforeUpload(file) {
      //获取文件名称
      this.fileOldName = file.name;
      this.$emit("show", file.name);

      // 校检文件类型
      if (this.fileType) {
        let fileExtension = "";
        if (file.name.lastIndexOf(".") > -1) {
          fileExtension = file.name.slice(file.name.lastIndexOf(".") + 1);
        }
        const isTypeOk = this.fileType.some((type) => {
          if (file.type.indexOf(type) > -1) return true;
          if (fileExtension && fileExtension.indexOf(type) > -1) return true;
          return false;
        });
        if (!isTypeOk) {
          this.$modal.msgError(
              `文件格式不正确, 请上传${this.fileType.join("/")}格式文件!`
          );
          return false;
        }
      }
      // 校检文件大小
      if (this.fileSize) {
        const isLt = file.size / 1024 / 1024 < this.fileSize;
        if (!isLt) {
          this.$modal.msgError(`上传文件大小不能超过 ${this.fileSize} MB!`);
          return false;
        }
      }

      // 校检文件名称类型
      if (this.wrFileName) {
        if (this.fileOldName) {
          // 正则表达式检查文件名是否以“水资源论证报告”或“成井报告”结尾
          const isValid = /水资源论证报告.pdf$|成井报告.pdf$/.test(this.fileOldName);
          console.log(this.fileOldName, "p[p[p[p[p[p[")
          if (!isValid) {
            // 文件名不符合格式，执行相关处理
            this.$modal.msgError("文件名格式不正确，请使用 '×××水资源论证报告' 或 '×××成井报告' 的格式");
            return false;

          } else {
            // 文件名符合格式，执行其他操作
            console.log("文件名格式正确");
          }
        }
      }

      // 校检取水证称类型
      if (this.dflNameCheck) {
        if (this.fileOldName) {
          // 正则表达式检查文件名是否以“水资源论证报告”或“成井报告”结尾
          const isValid = /取水许可证.pdf$/.test(this.fileOldName);
          console.log(this.fileOldName, "p[p[p[p[p[p[")
          if (!isValid) {
            // 文件名不符合格式，执行相关处理
            this.$modal.msgError("文件名格式不正确，请使用 '×××取水许可证' 的格式");
            return false;

          } else {
            // 文件名符合格式，执行其他操作
            console.log("文件名格式正确");
          }
        }
      }

      this.$modal.loading("正在上传文件，请稍候...");
      this.number++;
      return true;
    },
    // 文件个数超出
    handleExceed() {
      this.$modal.msgError(`上传文件数量不能超过 ${this.limit} 个!`);
    },
    // 上传失败
    handleUploadError() {
      this.$modal.msgError("上传图片失败，请重试");
      this.$modal.closeLoading();
    },
    // 上传成功回调
    handleUploadSuccess(res) {

      this.uploadList.push({name: res.originalFilename, url: res.url});
      if (this.editName_file) {
        this.editName_file = res.originalFilename;
      }
      if (this.uploadList.length === this.number) {
        this.fileList = this.fileList.concat(this.uploadList);
        this.uploadList = [];
        this.number = 0;
        this.$emit("update:modelValue", this.fileList);
        this.$modal.closeLoading();
        this.uploadSuccess(this.fileList);
        console.log(345)
      }
    },
    // 删除文件
    handleDelete(index) {
      this.fileList.splice(index, 1);
      this.$emit("input", this.fileList);
      this.$emit("show", null);
      this.deleteSuccess(this.fileList)
    },
    // 获取文件名称
    getFileName(name) {
      if (name.lastIndexOf("/") > -1) {
        return name.slice(name.lastIndexOf("/") + 1);
      } else {
        return "";
      }
    },
    // 对象转成指定字符串分隔
    listToString(list, separator) {
      let strs = "";
      separator = separator || ",";
      for (let i in list) {
        strs += list[i].url + separator;
      }
      return strs != "" ? strs.substr(0, strs.length - 1) : "";
    },
  },
};
</script>

<style scoped lang="scss">
.upload-file-uploader {
  margin-bottom: 5px;
}

.upload-file-list .el-upload-list__item {
  border: 1px solid #e4e7ed;
  line-height: 2;
  margin-bottom: 10px;
  position: relative;
}

.upload-file-list .ele-upload-list__item-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: inherit;
}

.ele-upload-list__item-content-action .el-link {
  margin-right: 10px;
}
</style>
