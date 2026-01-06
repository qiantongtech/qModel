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

import axios, {InternalAxiosRequestConfig, AxiosResponse} from 'axios';
import {useUserStoreHook} from '../stores/user';
import {ElLoading,ElMessage} from 'element-plus'


import {encodeSearchParams, getUrlParamsToJSON} from "../utils/objutil";

// 创建 axios 实例
const service = axios.create({
	baseURL: '/flyflow-api',
	timeout: 60000,
	headers: {'Content-Type': 'application/json;charset=utf-8', 'FlyflowVersion': 'V9.9.9'},
	transformResponse: [data => {
		const res = JSON.parse(data)

		return res
	}]
});

var unloadingUrlList=[
	'message/unreadNum',
	'form/dynamicFormList',
	"org/tree",
	"base/queryTaskOperData",
	"base/queryHeaderShow",
	"base/formatStartNodeShow",
	"form/getFormList",
	"task/queryContractImg",
	"file/pdfToImgList"
]

var loadingFlag = undefined;

// 请求拦截器
service.interceptors.request.use(
	(config: InternalAxiosRequestConfig) => {
		//debugger
		let url = config.url;

		var matchUrl=false;

		//判断是否需要显示loading页面
		for(var murl of unloadingUrlList){
			if(url.indexOf(murl)>=0){
				matchUrl=true;
				break
			}
		}
		if (!loadingFlag&&!matchUrl) {
			loadingFlag = ElLoading.service({
				lock: true,
				text: '加载中',
				background: 'rgba(0, 0, 0, 0.7)',
			})

		}


		const userStore = useUserStoreHook();
		if (userStore.token) {
			config.headers.Authorization = userStore.token;
		}
		if (userStore.tenantId) {
			config.headers['Flyflow-Tenant-Id'] = userStore.tenantId;
		}else{
			config.headers['Flyflow-Tenant-Id'] = 1;
		}
		return config;
	},
	(error: any) => {
		if(loadingFlag){
			loadingFlag.close();
			loadingFlag=undefined;
		}
		return Promise.reject(error);
	}
);

// 响应拦截器
service.interceptors.response.use(
	(response: AxiosResponse) => {

		let url = response.config.url;

		var matchUrl=false;

		//判断是否需要显示loading页面
		for(var murl of unloadingUrlList){
			if(url.indexOf(murl)>=0){
				matchUrl=true;
				break
			}
		}

		if(loadingFlag&&!matchUrl){
			loadingFlag.close();
			loadingFlag=undefined;

		}

		let data = response.data;


		const {code, msg, ok} = data;
		if (ok === true) {
			return data;
		}
		// 响应数据为二进制流处理(Excel导出)
		if (data instanceof ArrayBuffer) {
			return response;
		}

		// token 过期,重新登录
		if (code === 402) {
			const userStore = useUserStoreHook();
			userStore.resetToken()

			ElMessageBox.alert('当前页面已失效，请重新登录', '提示', {
				confirmButtonText: '确定',
				type: 'warning'
			}).then(() => {



				if(window.location.href.indexOf("login")<0){
					let href = window.location.href;
					let urlParamsToJSON = getUrlParamsToJSON(href);

					let idx1 = href.lastIndexOf("/#/")+2;
					let idx2 = href.lastIndexOf("?");
					if(idx2>=0){
						urlParamsToJSON.redirect=href.substring(idx1,idx2)

					}else{
						urlParamsToJSON.redirect=href.substring(idx1,href.length)

					}

					let s = encodeSearchParams(urlParamsToJSON);
					window.location.href="/#/login?"+s
				}


			});
		} else {
			ElMessage.error(msg || '系统出错');
		}


		return Promise.reject(new Error(msg || 'Error'));
	},
	(error: any) => {

		if(loadingFlag){
			loadingFlag.close();
			loadingFlag=undefined;

		}


		return Promise.reject(error.message);
	}
);

// 导出 axios 实例
export default service;
