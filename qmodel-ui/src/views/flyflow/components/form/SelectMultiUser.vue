<template>
  <div>

      <el-button
			  v-if="mode==='D'"
			  :disabled="true"
								 circle
		:icon="$icon['Plus']"

	  ></el-button>

		<select-show v-else
				 :disabled="form.perm === 'R'" v-model:orgList="form.props.value" type="user" :multiple="form.props.multi" :disable-user="disableUserIdList"></select-show>

  </div>
</template>
<script lang="ts" setup>
import selectShow from "../orgselect/selectAndShow.vue";
import {computed, defineExpose} from "vue";
import {useUserStore} from "../../stores/user";



const userStore = useUserStore();

const currentUserId = computed(() => {
	return userStore.userId;
})


//禁止选择的用户id
const disableUserIdList=computed(()=>{
	let self = props.form.props.self;
	//不能选择自己
	if(!self){
		return [currentUserId.value];
	}else{
		return [];
	}
})

let props = defineProps({

	mode:{
		type:String,
		default:'D'
	},


	form: {
		type: Object, default: () => {

		}
	}

});

onMounted(()=>{
})



</script>
<style scoped lang="less"></style>
