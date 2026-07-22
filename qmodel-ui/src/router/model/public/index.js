/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

/* Layout */
import Layout from '@/layout/index.vue';

// 示例模块动公共路由
export default [
    {
        path: '/model',
        component: Layout,
        hidden: true,
        children: [
            {
                path: 'modelManageView',
                component: () => import('@/views/model/modelManage/details/index.vue'),
                name: 'modelManageView',
                meta: { title: '模型详情', noCache: true, activeMenu: '/model/version' }
            },
            {
                path: 'modelComputeInputOrOutput',
                component: () =>
                    import(
                        '@/views/model/modelManage/parameterSettings/modelComputeInputOrOutput.vue'
                    ),
                name: 'modelComputeInputOrOutput',
                meta: { title: '模型计算详情', noCache: true }
            },
            {
                path: 'modelInputAndOutput',
                component: () =>
                    import('@/views/model/modelManage/parameterSettings/modelInputAndOutput.vue'),
                name: 'modelInputAndOutput',
                meta: { title: '模型设置参数', noCache: true }
            },
            {
                path: 'modelManage/add',
                component: () => import('@/views/model/modelManage/add/index.vue'),
                name: 'ModelManageAdd',
                meta: { title: '新增模型', noCache: true, activeMenu: '/model/version' }
            },
            {
                path: 'modelManage/edit',
                component: () => import('@/views/model/modelManage/add/index.vue'),
                name: 'ModelManageEdit',
                meta: { title: '修改模型', noCache: true, activeMenu: '/model/version' }
            }
        ]
    }
];
