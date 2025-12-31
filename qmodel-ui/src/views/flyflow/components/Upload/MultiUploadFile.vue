<template>
  <el-upload
      v-model:file-list="fileList"
      :before-upload="handleBeforeUpload"
      :http-request="handleUpload"
      :on-remove="handleRemove"
      :on-preview="previewImg"
      :limit="props.limit"
      :disabled="disabled"
  >
    <el-button :disabled="disabled" :type="disabled?'info':'primary'">选择文件</el-button>
    <template #tip v-if="suffixArray?.length>0">
      <div class="el-upload__tip">
        只支持文件格式：{{ suffixArray.join(",") }}
      </div>
    </template>
  </el-upload>


</template>

<script setup lang="ts">
import {
  UploadRawFile,
  UploadRequestOptions,
  UploadUserFile,
  UploadFile,
  UploadProps,
} from "element-plus";
import {uploadFileApi} from "../../api/file";
import {ref,watch} from 'vue'

const emit = defineEmits(["update:modelValue"]);

const props = defineProps({
  disabled: {
    type: Boolean,
    default: false,
  },
  /**
   * 后缀
   */
  suffixArray: {
    type: Array,
    default: () => []
  },
  /**
   * 文件路径集合
   */
  modelValue: {
    type: Array<Object>,
    default: [] as Array<Object>,
  },
  /**
   * 文件上传数量限制
   */
  limit: {
    type: Number,
    default: 10,
  },
  /**
   * 文件上传大小限制
   */
  maxSize: {
    type: Number,
    default: 10,
  },
});


const fileList = ref([] as UploadUserFile[]);
watch(
    () => props.modelValue,
    (newVal: string[]) => {
      const filePaths = fileList.value.map((file) => file.url);
      // 监听modelValue文件集合值未变化时，跳过赋值
      if (
          filePaths.length > 0 &&
          filePaths.length === newVal.length &&
          filePaths.every((x) => newVal.some((y) => y === x)) &&
          newVal.every((y) => filePaths.some((x) => x === y))
      ) {
        return;
      }

      //判断url
      if(fileList.value.length==newVal.length){
        var match = true;
        let urlArray1 = fileList.value.map(w => w.url).sort();
        let urlArray2 = newVal.map(w => w.url).sort();
        for (var k = 0; k < urlArray1.length; k++) {
          if (urlArray1[k] != urlArray2[k]) {
            match = false;
            break
          }
        }
        if (match) {
          return;
        }
      }

      fileList.value = newVal.map((filePath) => {
        return {url: filePath.url, name: filePath.name} as UploadUserFile;
      });
    },
    {immediate: true}
);

/**
 * 自定义图片上传
 *
 * @param params
 */
async function handleUpload(options: UploadRequestOptions): Promise<any> {

  // 上传API调用
  const {data: fileInfo} = await uploadFileApi(options.file);

  // 上传成功需手动替换文件路径为远程URL，否则图片地址为预览地址 blob:http://
  const fileIndex = fileList.value.findIndex(
      (file) => file.uid == (options.file as any).uid
  );
  fileList.value[fileIndex].url = fileInfo;

  // fileList.value.splice(fileIndex, 1, {
  //   name: options.file.name,
  //   url: fileInfo,
  // }  );

  emit(
      "update:modelValue",
      fileList.value.map((file) => {
        return {
          url: file.url, name: file.name
        }
      })
  );
}

/**
 * 删除图片
 */
function handleRemove(removeFile: UploadFile) {
  const filePath = removeFile.url;

  if (filePath) {
    // deleteFileApi(filePath).then(() => {
    // 删除成功回调
    emit(
        "update:modelValue",
        fileList.value.map((file) => {
          return {
            url: file.url, name: file.name

          }
        })
    );
    // });
  }
}

/**
 * 限制用户上传文件的格式和大小
 */
function handleBeforeUpload(file: UploadRawFile) {

  console.log(file, props.suffixArray)

  let name = file.name;
  var suffix = name.substring(name.lastIndexOf(".") + 1);
  if (props.suffixArray.indexOf(suffix) < 0&&props.suffixArray.length>0) {
    ElMessage.warning("表单不支持文件格式：" + suffix);
    return false

  }

  if (file.size > props.maxSize * 1048 * 1048) {
    ElMessage.warning("上传文件不能大于" + props.maxSize + "M");
    return false;
  }
  return true;
}

/**
 * 预览图片
 */
const previewImg: UploadProps["onPreview"] = (uploadFile) => {
  window.open(uploadFile.url)
};
</script>
