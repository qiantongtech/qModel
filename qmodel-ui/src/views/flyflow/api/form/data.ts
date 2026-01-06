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

import {FormGroupVO, FormVO} from "./types";

const formGroupConfig: FormGroupVO[] = [

	{
		name: "文本",
		formList: [
			{
				name: "单行文本",
				type: "Input",
				typeName: "单行文本",
				icon: "EditPen",
				placeholder: "请填写",
				required: false,
				printable: true,
				props: {
					value: "",
					regex: "",
					regexDesc: "",
					minLength:undefined,
					maxLength:undefined
				}
			},
			{
				name: "多行文本",
				icon: "More",
				type: "Textarea",
				typeName: "多行文本",
				placeholder: "请填写",
				required: false,
				printable: true,
				props: {

					value: ""

				}
			},
			{
				name: "说明",
				icon: "ChatLineSquare",
				type: "Description",
				typeName: "说明",
				placeholder: "请填写",
				required: false,
				printable: true,
				props: {

					value: ""

				}
			}
		],
		icon:"wenben"
	},
	{name: "数值",
		formList: [
			{
				name: "数字",
				type: "Number",
				icon: "Edit",

				typeName: "数字",
				placeholder: "请填写",
				required: false,
				printable: true,
				props: {
					radixNum: 0,
					sum:false


				}

			},
			{
				name: "金额",
				type: "Money",
				icon: "Money",

				typeName: "金额",
				placeholder: "请填写",
				required: false,
				printable: true,
				props: {
					radixNum: 0,
					sum:false //统计总数
				}
			}
		],
		icon:"shuzhi"
	},	{name: "日期-时间",
		formList: [
			{
				name: "日期",
				type: "Date",
				icon: "Calendar",

				typeName: "日期",
				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					defaultRoot:false,

					radixNum: 0,
					value:''

				}
			}	,	{
				name: "日期时间",
				type: "DateTime",
				icon: "AlarmClock",

				typeName: "日期时间",
				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					defaultRoot:false,

					radixNum: 0,
					value:''

				}
			}	,	{
				name: "时间",
				type: "Time",
				icon: "Timer",

				typeName: "时间",
				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					defaultRoot:false,

					radixNum: 0,
					value:''

				}
			}
		],
		icon:"riqi"
	},
	{
	name:"选项",
		formList:[

			{
				name: "单选",
				icon: "Select",
				type: "SingleSelect",
				typeName: "单选",
				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					privateVal:false,//是否是私有的变量值，如果是私有的 则存储到task的本地变量里
					value:[],
					remoteConfig:{
						enable:false,
						url:'http://127.0.0.1:26859/test/getTestSelectOptions',

						header:[

						],
						body:[

						]
					},
					dataFrom:1,//1手动添加2外部
					options: [
						{
							key: "",
							value: "",
						},
					],
				}
			},
			{
				name: "多选",
				type: "MultiSelect",
				typeName: "多选",
				icon: "Finished",
				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					remoteConfig:{
						enable:false,
						url:'http://127.0.0.1:26859/test/getTestSelectOptions',

						header:[

						],
						body:[

						]
					},
					dataFrom:1,//1手动添加2外部
					value: [],
					options: [
						{
							key: "",
							value: "",
						},
					],
				}
			}

		],
		icon:"xuanxiang"
	},
	{
		name:'组织架构',
		formList:[

			{
				name: "单用户",
				type: "SelectUser",
				typeName: "单用户",
				placeholder: "请选择",
				icon: "User",

				required: false,
				printable: true,
				props: {
					defaultRoot:false,
					multi: false,
					self: true,
					value: []
				},
			},
			{
				name: "多用户",
				type: "SelectMultiUser",
				typeName: "多用户",
				placeholder: "请选择",
				icon: "User",

				required: false,
				printable: true,
				props: {
					defaultRoot:false,
					multi: true,
					self: true,
					value: []
				}
			},
			{
				name: "单部门",
				icon: "OfficeBuilding",
				type: "SelectDept",
				typeName: "单部门",
				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					defaultRoot:false,
					multi: false,
					self: true,
					value: []
				}
			},
			{
				name: "多部门",
				icon: "OfficeBuilding",
				type: "SelectMultiDept",
				typeName: "多部门",
				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					defaultRoot:false,
					multi: true,
					self: true,
					value: []
				}
			}
		],
		icon:"zuzhijiegou"
	},
	{
	name:"其他",
		formList:[


			{
				name: "图片",
				type: "UploadImage",
				typeName: "图片",
				icon: "Picture",

				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					value: [], min: 1, max: 10, maxSize: 10
				}
			},


			{
				name: "文件",
				type: "UploadFile",
				typeName: "文件",
				icon: "Upload",
				placeholder: "请选择",
				required: false,
				printable: true,
				props: {
					value: [], min: 1, max: 10, maxSize: 10, suffixArray: []
				}
			}
		],
		icon:"qita"
	}
]

export { formGroupConfig};
