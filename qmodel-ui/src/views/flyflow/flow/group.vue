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
    <div class="pagecont-top">
		  <div style="display: flex;justify-content: space-between">
				<div>
					<el-form :inline="true"   class="demo-form-inline">

						<el-form-item label="流程名称">
							<el-input clearable v-model="searchWord"  placeholder="请输入搜索流程" />
						</el-form-item>
						<el-form-item>
<!--							<el-button :icon="Search" type="primary" @click="searchFlow">搜索</el-button>-->
              <el-button plain type="primary" @click="searchFlow" @mousedown="(e) => e.preventDefault()">
                <i class="iconfont-mini icon-a-zu22377 mr5"></i>搜索
              </el-button>
						</el-form-item>
					</el-form>
				</div>
			<div style="text-align: right;margin-bottom: 20px">
				<el-button plain class="button" :icon="CirclePlus" @click="addOneGroupShow" type="primary">新建分组</el-button>
				<el-button plain class="button" @click.stop="toCreateFlow(undefined)" type="primary" :icon="Plus">创建流程</el-button>
			</div>
    </div>
    </div>

    <el-card class="box-card" v-if="addGroupCardShow">
      <div class="item additem" style="height: 40px">
        <div style="height: 40px;line-height: 40px;width: 400px;">
          <el-input ref="addGroupRef" :key="addGroupKey" maxlength="10" minlength="2" v-model="addGroupName"
                    @blur.stop="addGroupInputBlur"
                    placeholder="分组名称" clearable/>

        </div>
        <div class="last">
          <el-tooltip
              class="box-item"
              effect="dark"
              content="删除"
              placement="top"

          >
            <el-button text :icon="Delete" circle @click.stop="deleteAddGroup"/>
          </el-tooltip>
        </div>
      </div>
    </el-card>
		<div v-if="successGroupList.length<=0">
			<el-empty :image-size="250"  description="还没有分组哦~" />
		</div>

<!--		分组显示-->
		<template v-if="showType==1">
			<el-card class="box-card" v-for="(item,index) in successGroupList">
				<template #header>
					<div class="card-header">
					<span v-if="!item.editable" class="title1" @click="toEditGroupName(item)">

									<el-button text :icon="Edit" circle/>	{{ item.name }}({{item.items.length}})


					</span>
						<el-input v-else :ref="'editGroupRef'+item.id" class="title1_input" autofocus maxlength="10" minlength="2"
											v-model="item.name"
											@blur.stop="editGroupInputBlur(item)"
											placeholder="分组名称" clearable/>
						<span>

			  <el-button v-if="item.showFlowList&&item.items.length>0" text :icon="ArrowUp" @click.stop="item.showFlowList=false" circle />
			  <el-button v-if="!item.showFlowList&&item.items.length>0"  text :icon="ArrowDown" @click.stop="item.showFlowList=true" circle />


            		  <el-tooltip

											class="box-item"
											effect="dark"
											content="上移"
											placement="top"
									>
			  <el-button v-if="index>0" @click.stop="topSortF(item)" text :icon="Top" circle/>
                  </el-tooltip>
                    		  <el-tooltip

															class="box-item"
															effect="dark"
															content="下移"
															placement="top"
													>
			  <el-button v-if="index<successGroupList.length-1" @click.stop="bottomSortF(item)" text :icon="Bottom"
									 circle/>
                          </el-tooltip>
			  <el-tooltip

						class="box-item"
						effect="dark"
						content="创建流程"
						placement="top"
				>
			  <el-button @click.stop="toCreateFlow(item.id)" text :icon="Plus" circle/>
				</el-tooltip>
			  <el-tooltip

						class="box-item"
						effect="dark"
						content="删除"
						placement="top"
				>
			  <el-button v-if="item.items.length==0" text :icon="Delete" @click.stop="deleteGroup(item.id)" circle :disabled="item.items?.length>0"/>
				</el-tooltip>
						</span>

					</div>
				</template>
				<div v-for="(flow,index1) in item.items" :key="index1" class="item" v-if="item.showFlowList" >

					<group-flow-data @handleQuery="handleQuery" :flow="flow"></group-flow-data>


				</div>
			</el-card>

		</template>

<!--		//搜索模式显示-->
		<template v-if="showType==2">

			<el-card>

			<template v-for="t in searchDataList">
				<group-flow-data @handleQuery="handleQuery" :flow="t"></group-flow-data>

			</template>
			</el-card>

					</template>
  </div>
</template>

<script lang="ts" setup>
import {
	Plus,
	Delete,
	Top, Bottom, CircleCloseFilled,
	Edit,
	DocumentCopy,
	Hide,
	View,
	PieChart,
	Menu,
	Histogram,
	SwitchButton, ArrowDown, ArrowUp, Search, CirclePlus
} from '@element-plus/icons-vue'

import {
	addGroup,
	delGroup, editGroup, bottomSort, topSort,
	queryGroupMainFlowList,searchFlowList
} from "../api/group";


import {ref, getCurrentInstance,nextTick , onMounted} from 'vue'
import {GroupVO} from "../api/group/types";

import * as util from '../utils/objutil'

const {proxy} = getCurrentInstance();

//编辑费分组
const toEditGroupName = (item) => {
  item.editable = true
  item.oldName = util.deepCopy(item.name)

  nextTick(() => {
    let $ref = proxy.$refs['editGroupRef' + item.id];
    $ref[0].focus();

  })

}

function topSortF(item){
  topSort({id:item.id}).then(res=>{
    handleQuery();
  })
}
function bottomSortF(item){
  bottomSort({id:item.id}).then(res=>{
    handleQuery();
  })
}

function editGroupInputBlur(item) {
  item.editable = false

  if (util.isBlank(item.name)) {

    ElMessage.warning("分组名称不能为空")
    item.name = item.oldName

  } else {
    editGroup({groupName: item.name, id: item.id}).then(() => {
      ElMessage.success("修改成功");

    });
  }

}

//是否是搜索模式 1普通分组模式 2搜索模式
const showType=ref(1);

const searchDataList=ref([])

//搜索的关键词
const searchWord=ref('')
//点击搜索流程
function searchFlow(){
	if(util.isBlank(searchWord.value)){
		showType.value=1;
		return
	}
	showType.value=2;
	searchFlowList(searchWord.value).then(res=>{
		searchDataList.value=res.data;
	})
}


//新增分组名称
const addGroupName = ref<String>("");
const addGroupCardShow = ref<Boolean>(false);
const addGroupKey = ref<Number>(0);
const addGroupRef = ref();
const successGroupList = ref<GroupVO[]>([]);

function addGroupInputBlur() {
  if (util.isBlank(addGroupName.value)) {
    addGroupCardShow.value = false

  } else {
    addGroup({groupName: addGroupName.value}).then(() => {
      ElMessage.success("新增成功");
      addGroupCardShow.value = false
      handleQuery();
    });
  }

}


import {useRouter} from 'vue-router'
import GroupFlowData from "../components/groupFlowData.vue";

const router = useRouter()

function toCreateFlow(id) {
  //TODO 创建流程地址
  let to = "/flyflow/flow/create";
  if (!!id) {
    to = to + "?groupId=" + id
  }
  router.push(to)

}


onMounted(() => {
  handleQuery();


})

function handleQuery() {
	queryGroupMainFlowList().then(res => {

    const {data} = res;
		for(var it of data){
			it.showFlowList=true;
		}
    successGroupList.value = data
  })
}

function deleteAddGroup() {
  addGroupCardShow.value = false;
  addGroupName.value = "";
  addGroupKey.value = new Date().getTime()
}

function addOneGroupShow() {
  addGroupName.value = "";
  addGroupKey.value = new Date().getTime()
  addGroupCardShow.value = true;
  nextTick(() => {
    addGroupRef.value.focus()

  })
}

function deleteGroup(id) {

	ElMessageBox.confirm(
		'确定要删除流程组吗?',
		'提示',
		{
			confirmButtonText: '确定',
			cancelButtonText: '取消',
			type: 'warning',
		}
	)
		.then(() => {
		delGroup(id).then(() => {
			ElMessage.success("删除成功");

			handleQuery();
		})
		})


}
</script>
<style scoped lang="less">
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.text {
  font-size: 14px;
}


.additem {
  .last {
    width: calc(100% - 200px);
    height: 40px;
    line-height: 40px;
    text-align: right;
  }
}

.box-card {
  width: 100%;
  margin-left: 0%;
  margin-top: 10px;
}

.title1 {
  border: 1px solid #ffffff;
  border-radius: 5px;
  padding: 5px 10px;
  width: 300px;
  cursor: pointer;

  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  text-align: left;
}

.title1:hover {
  border: 1px solid #dddddd;

}

.title1_input {
  border-radius: 5px;
  padding: 5px 10px;
  width: 300px;
  height: 43.33px;
}

</style>
