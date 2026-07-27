/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  
 * This file is part of qModel Module Platform (Open Source Edition).
 *  
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

/* Layout */
import Layout from '@/layout/index.vue';

// 系统模块公共路由
export default [
    {
        path: '/redirect',
        component: Layout,
        hidden: true,
        children: [
            {
                path: '/redirect/:path(.*)',
                component: () => import('@/views/system/redirect/index.vue')
            }
        ]
    },
    {
        path: '/sso',
        component: () => import('@/views/system/sso'),
        hidden: true
    },
    {
        path: '/login',
        component: () => import('@/views/system/login.vue'),
        // component: () => import('@/views/system/login-v3.vue'),
        hidden: true
    },
    {
        path: '/sso/login',
        component: () => import('../../../../login/index.vue'),
        hidden: true
    },
    {
        path: '/register',
        component: () => import('@/views/system/register.vue'),
        hidden: true
    },
    {
        path: '/:pathMatch(.*)*',
        component: () => import('@/views/system/error/404.vue'),
        hidden: true
    },
    {
        path: '/401',
        component: () => import('@/views/system/error/401.vue'),
        hidden: true
    },
    {
        path: '',
        component: Layout,
        redirect: '/index',
        children: [
            {
                path: '/index',
                component: () => import('@/views/system/index.vue'),
                name: 'Index',
                meta: { title: '首页', icon: 'dashboard_new_icon', affix: true }
            }
        ]
    },
    {
        path: '/bases',
        component: Layout,
        redirect: 'message',
        children: [
            {
                path: 'message',
                component: () => import('@/views/system/system/message/index.vue'),
                name: 'Message',
                meta: { title: '我的消息', icon: 'message' },
                hidden: true
            }
        ]
    },
    {
        path: '/user',
        component: Layout,
        hidden: true,
        redirect: 'noredirect',
        children: [
            {
                path: 'profile',
                component: () => import('@/views/system/system/user/profile/index.vue'),
                name: 'Profile',
                meta: { title: '个人中心', icon: 'user' }
            }
        ]
    },
    {
        path: '/Tag',
        component: () => import('../../../components/Tag/demo.vue'),
        hidden: true
    },
    {
        path: '/TagPill',
        component: () => import('../../../components/TagPill/demo.vue'),
        hidden: true
    }
];
