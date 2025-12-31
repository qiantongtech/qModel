/* Layout */
import Layout from '@/layout/index.vue'

// 示例模块动公共路由
export default [
    {
        path: '/model',
        component: Layout,
        hidden: true,
        children: [
            {
                path: 'modelManageView',
                component: () => import('@/views/model/modelManageView'),
                name: 'modelManageView',
                meta: { title: '模型详情', noCache: true }
            },
            {
                path: 'modelComputeInputOrOutput',
                component: () => import('@/views/model/modelComputeInputOrOutput'),
                name: 'modelComputeInputOrOutput',
                meta: { title: '模型计算详情', noCache: true }
            },
            {
                path: 'modelInputAndOutput',
                component: () => import('@/views/model/modelInputAndOutput'),
                name: 'modelInputAndOutput',
                meta: { title: '模型设置参数', noCache: true }
            },
        ]
    },
]
