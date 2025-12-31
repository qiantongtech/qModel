<template>
	<div>
		<el-input
				v-model="searchVal"
				class="w-50 m-2"
				style="width: 100%;"
				v-if="type!='role'&&type!='dept'"
				placeholder="搜索成员"
				@input="getDebounceData($event)"
				:prefix-icon="Search"
		/>
<!--			顶部树形列表提示表头-->
		<el-scrollbar  v-if="!searchVal&&type!='role'">
			<div class="scrollbar-flex-content ellipsis tree_nav">
				<p   @click="queryData(0)" 	  class="scrollbar-demo-item">
					根节点
				</p>
				<p v-for="(item,index) in departments.titleDepartments"   @click="queryData(item.id)" 	:key="index+'a'" class="scrollbar-demo-item">
					{{ item.name }}
				</p>
			</div>
		</el-scrollbar>


<!--			下方的列表显示-->
		<ul class="select-box">
			<template v-for="(elem, i) in dataList" :key="i">
				<template v-if="elem.type === 'role'">
					<li v-for="item in elem.data" :key="item.id">

						<el-checkbox v-model="item.selected" @change="changeEvent(item)"
												 :disabled="(item.status==0)"
						>
							<div style="display: flex;flex-direction: row">
								<div class="f11">
									<el-icon style="font-size: 20px">
										<Share/>
									</el-icon>
								</div>
								<div class="f12">{{ item.name }}</div>
							</div>
						</el-checkbox>


					</li>
				</template>
				<template v-if="elem.type === 'dept'&&(type==='org'||type==='dept'||type==='user')">
					<li v-for="item in elem.data" :key="item.id">

						<div style="display: flex;flex-direction: row;border: 0px solid blue;">
							<div class="d11">
								<el-checkbox v-model="item.selected" @change="changeEvent(item)"
														 :disabled="(!(type==='org'||type==='dept'))||(item.status==0)"
								>
									<div style="display: flex;flex-direction: row;border: 0px solid red">
										<div class="f11">

                        <el-image style="width: 20px;height: 20px;"  :src="DeptImg" />

                    </div>
										<div class="f12" style="border: 0px solid red;" >{{ item.name }}</div>
									</div>
								</el-checkbox>
							</div>
							<div class="d22" @click="queryData(item.id)">

								下级

<!--									<el-image style="width: 20px;height: 20px;margin-top: 6px"  :src="DeptImg" />-->
<!--                <el-icon style="font-size: 20px;color: #1e83e9">-->
<!--                  <Guide/>-->
<!--                </el-icon>-->
							</div>
						</div>

					</li>
				</template>
				<template v-if="elem.type === 'user'&&(type==='org'||type==='user')">
					<li v-for="item in elem.data" :key="item.id" class="check_box">
						<el-checkbox v-model="item.selected"
												 :disabled="item.status==0||(disableUser.indexOf(item.id)>=0)"
												 @change="changeEvent(item)">
							<div style="display: flex;flex-direction: row">
								<div class="f11">
									<el-avatar shape="square" :size="20" :src="item.avatar">{{ item.name.substring(0, 1) }}</el-avatar>
								</div>
								<div class="f12">{{ item.name }}</div>
							</div>
						</el-checkbox>


					</li>
				</template>
			</template>
		</ul>
	</div>
</template>
<script setup>

import DeptImg from '../../assets/images/dept.png'
import DeptIconImg from '../../assets/images/depticon.png'

var props = defineProps({

	selectedList: {
		type: Array,
		default: () => []
	},
	type: {
		type: String,
		default: 'org'
	},
	multiple: {
		type: Boolean,
		default: true
	},
	disableUser:{//禁止选择的用户
		type: Array,
		default: () => []
	}
})

import {Delete, Edit, Search, Share, Guide, Grid} from "@element-plus/icons-vue";
import {computed, reactive, watch, onMounted, defineExpose} from 'vue'

import {departments, getDebounceData, getDepartmentList, searchVal} from '../../utils/common'
import * as util from "../../utils/objutil";




const queryData = (pid) => {
	getDepartmentList(pid, props.type).then(res => {

		let selectedList = props.selectedList;

		for (var it of dataList.value) {


			for (var item of it.data) {
				var b = selectedList.filter(res => res.id === item.id && res.type === item.type).length > 0
				item.selected = b;
			}
		}

	})
}

let deptList = computed(() => {

	return departments.value.childDepartments;

})


let userList = computed(() => {

	return departments.value.employees;

})
let roleList = computed(() => {

	return departments.value.roleList;

})

var dataList = computed(() => {
	let newVar = [
		{
			type: "dept", data: deptList.value
		},
		{
			type: "user", data: userList.value
		},
		{
			type: "role", data: roleList.value
		}
	];
	return newVar
})



let emits = defineEmits(['update:selectedList'])


onMounted(() => {

	queryData(0);

})


const changeEvent = (e) => {

	let selectedList = util.deepCopy(props.selectedList);

	if (e.selected) {
		if (!props.multiple) {
			userList.value.forEach(res => res.selected = false)
			selectedList = []
		}
		e.selected = true;
		selectedList.push(e)
	} else {
		for (var it of dataList.value) {

			let filter = it.data.filter(res => res.id === e.id && res.type === e.type);
			if (filter.length > 0) {
				filter[0].selected = false;
			}

		}
		selectedList = selectedList.filter(res => !(res.id === e.id && res.type === e.type))
	}
	emits('update:selectedList', selectedList)

}


const refreshData = () => {


	let selectedList = props.selectedList;


	for (var it of dataList.value) {
		for (var item of it.data) {
			var b = selectedList.filter(res => res.id === item.id && res.type === item.type).length > 0
			item.selected = b;
		}
	}


}
defineExpose({queryData, changeEvent, refreshData});

watch(() => props.selectedList, (val) => {

	refreshData();
})

</script>
<style lang="less" scoped>
@import "../../css/dialog.css";

.select-box {
	height: 420px;
	overflow-y: auto;

	li {
	//	padding: 5px 0;

	}
}


.radio_box a,
.check_box a {
	font-size: 12px;
	position: relative;
	padding-left: 20px;
	margin-right: 30px;
	cursor: pointer;
	color: #333;
	white-space: pre;
}

.check_box.not a:hover {
	color: #333;
}

.check_box.not a::before,
.check_box.not a:hover::before {
	border: none;
}

.check_box.not.active {
	background: #f3f3f3;
}

.radio_box a:hover::before,
.check_box a:hover::before {
	border: 1px solid #46a6fe;
}

.radio_box a::before,
.check_box a::before {
	position: absolute;
	width: 14px;
	height: 14px;
	border: 1px solid #dcdfe6;
	border-radius: 2px;
	left: 0;
	top: 1px;
	content: "";
}

.radio_box a::before {
	border-radius: 50%;
}

.check-dot.active::after,
.radio_box a.active::after,
.check_box a.active::after {
	position: absolute;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	top: 3px;
	left: 3px;
	content: "";
}

.radio_box a.active::after {
	background: #46a6fe;
}

.check_box a.active::after {
	background: url(../../assets/images/check_box.png) no-repeat center;
}

.f11 {
	width: 30px;

}

.f12 {
	width:150px;

  border: 0px solid red;
		line-height: 22px;
	text-overflow: ellipsis;
	overflow: hidden;
	word-break: break-all;
	white-space: nowrap;
}

.d11 {
	width: calc(100% - 30px);
  border: 0px solid red;
  //line-height: 41px;
}

.d22 {
	width: 30px;

  text-align: center;
	cursor: pointer;

	color:var(--el-color-primary);
	line-height: 32px;

}


.ellipsis-node {
  //white-space: nowrap;
  //overflow: hidden;
  //text-overflow: ellipsis;
	border: 1px solid blue;

}
ul,li {
  padding: 0;
  margin: 0;
  list-style: none
}


.scrollbar-flex-content {
	display: flex;
}
.scrollbar-demo-item {
	flex-shrink: 0;
	display: flex;
	align-items: center;
	justify-content: center;

	text-align: center;

	color: var(--el-color-primary);


	text-overflow: ellipsis;
	overflow: hidden;
	word-break: break-all;
	white-space: nowrap;
}

</style>
