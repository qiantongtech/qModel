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
