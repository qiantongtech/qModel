<!-- 复杂详情路由模板
    {
        path: '/example/genStudent',
        component: Layout,
        redirect: 'genStudent',
        hidden: true,
        children: [
            {
                path: 'genStudentDetail',
                component: () => import('@/views/example/genStudent/detail/index.vue'),
                name: 'tree',
                meta: { title: '学生详情', activeMenu: '/example/genStudent'  }
            }
        ]
    }
 -->



<template>
  <div class="app-container" ref="app-container">
    <div class="pagecont-top" v-show="showSearch" style="padding-bottom:15px">
      <div class="infotop" >
        <div class="infotop-title mb15">
              {{ genStudentDetail.id }}
        </div>
        <el-row :gutter="20">
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">ID</div>
                <div class="infotop-row-value">{{ genStudentDetail.id }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">姓名</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.name || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">学生照</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.pictureUrl || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">教育经历</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.experience || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">性别</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.sex || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">生日</div>
                <div class="infotop-row-value">{{ parseTime(genStudentDetail.birthday, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">年龄</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.age || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">学号</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.studentNumber || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">班级</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.grade || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">爱好</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.hobby || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建人</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.createBy || '-' }}
                </div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">创建时间</div>
                <div class="infotop-row-value">{{ parseTime(genStudentDetail.createTime, '{y}-{m}-{d}') }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="infotop-row border-top">
                <div class="infotop-row-lable">备注</div>
                <div class="infotop-row-value">
                  {{ genStudentDetail.remark || '-' }}
                </div>
              </div>
            </el-col>
        </el-row>

      </div>
    </div>

    <div  class="pagecont-bottom">
      <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
        <el-tab-pane label="组件一" name="1">
          <component-one ></component-one>
        </el-tab-pane>
        <el-tab-pane label="组件二" name="2">
          <component-two ></component-two>
        </el-tab-pane>
      </el-tabs>
    </div>


  </div>
</template>

<script setup name="GenStudent">
  import {getGenStudent } from "@/api/example/genStudent/genStudent";
  import { useRoute } from 'vue-router';
  import ComponentOne from "@/views/example/genStudent/detail/componentOne.vue";
  import ComponentTwo from "@/views/example/genStudent/detail/componentTwo.vue";

  const { proxy } = getCurrentInstance();

  const activeName = ref('1')

  const handleClick = (tab, event) => {
    console.log(tab, event)
  }

  const showSearch = ref(true);
  const route = useRoute();
  let id = route.query.id || 1;
  // 监听 id 变化
  watch(
          () => route.query.id,
          (newId) => {
            id = newId || 1;  // 如果 id 为空，使用默认值 1
            getGenStudentDetailById();

          },
          { immediate: true }  // `immediate` 为 true 表示页面加载时也会立即执行一次 watch
  );
  const data = reactive({
      genStudentDetail: {
    },
    form: {},
  });

  const {  genStudentDetail, rules } = toRefs(data);

  /** 复杂详情页面上方表单查询 */
  function getGenStudentDetailById() {
        const _id = id ;
    getGenStudent(_id).then(response => {
        genStudentDetail.value = response.data;
    });
  }

  getGenStudentDetailById();

</script>
