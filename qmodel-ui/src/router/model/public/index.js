/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
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
