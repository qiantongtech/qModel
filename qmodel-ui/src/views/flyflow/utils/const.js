/*
 * @Date: 2023-03-29 15:25:37
 * @LastEditors: StavinLi 495727881@qq.com
 * @LastEditTime: 2023-03-29 15:52:38
 * @FilePath: /Workflow-Vue3/src/utils/const.js
 */
import {ref} from 'vue'
import * as util from "../utils/objutil.js";
export let bgColors = ['38, 102, 251', '255, 148, 62', '50, 150, 250','','21,188,131','255,69,0','0,116,217','177,13,201',"106, 90, 205","153,102,51","153,153,0","102,51,153","51,51,102"]
export let placeholderList = ["发起人", "审批人", "抄送人",'','','','触发器','延时器',"","子流程","路由","异步触发器","签署合同"];


export let nodeData=[{

	"nodeName": placeholderList[0],
	"type": 0,
	"id": "root",
	//会签完成比例
	completeRate: 100,
	"error": false,
	"formPerms": {},
	"nodeUserList": [],
	"childNode": {},
	multipleMode: 1,
	"dynamicFormConfig": {
		"url": '',
		"header": [],
		"body": [],
		"result": [
			{
				"field": '',
				"contentConfig": '',
				"value": ''
			}
		]
	},
	"operList": [
		{
			"key": "pass",
			"checked": true,
			"edit": false,
			"name": "提交",
			"type":"primary",
			"defaultName": "提交"
		}
	]
},
	{
		//审批人
		"id": util.getRandomId(),

		"error": true,

		listener:{
			create:{

				enable:false,
				url:'http://127.0.0.1:26859/test/notify',
				header:[

				],
				body:[

				]
			},
			assign:{

				enable:false,
				url:'http://127.0.0.1:26859/test/notify',

				header:[

				],
				body:[

				]
			},
			complete:{

				enable:false,
				url:'http://127.0.0.1:26859/test/notify',

				header:[

				],
				body:[

				]
			},
			change:{
				enable:false,
				url:'',
				header:[

				],
				body:[

				]
			}
		},
		//审批方式 来自其他节点
		fromOtherNodeList:[{
			id:'root',
			nodeName:'发起人'
		}],
		//是否包含子级部门
		containChildrenDept:false,
		//人员方式
		"assignedType": 1,
		//单选还是多选
		multiple: false,
		//是否需求签名
		needSignature: false,
		//多人审批的选项
		multipleMode: 1,
		//会签完成比例
		completeRate: 100,
		//第几级部门负责人
		deptLeaderLevel: 1,
		//人员选择
		formUserId: "",
		formUserName: "",
		//部门下的选择
		deptUserType:'allUser',
		//角色列表
		roleList:[],
		//表单权限
		formPerms: {},
		//审批时限
		expireSetting:{
			enable:false,
			value:6,//默认6小时
			valueUnit:'TH',//默认小时
			type:1,//1通知2自动通过3自动拒绝
			once:true//如果是通知 是否一次提醒还是循环
		},
		//动态表单
		dynamicFormConfig:{
			enable:false,
			url:'',
			header:[

			],
			body:[

			],
			result:[
				{
					field: '',
					contentConfig: '',
					value: ''
				}
			]
		},
		//审批人为空
		nobody: {
			handler: "TO_PASS",
			assignedUser: []
		},
		//审批人与发起人一致
		sameAsStarter: {
			handler: "TO_CONTINUE"
		},
		//审批人拒绝
		refuse: {
			handler: "TO_END",
			nodeId: ''
		},
		operList: [
			{
				key: 'pass',
				checked: true,
				edit: false,
				name: '通过',
				type: 'primary',
				defaultName: '通过'
			}, {
				key: 'refuse',
				checked: true,
				edit: false,
				name: '拒绝',
				type: 'danger',
				defaultName: '拒绝'
			}
		],

		nodeUserList: []
	}
	,{
	//抄送人
		"id": util.getRandomId(),
//角色列表
		roleList:[],

//是否包含子级部门
		containChildrenDept:false,
		"error": true,
		nodeUserList: [],
		//表单权限
		formPerms: {},
		//第几级部门负责人
		deptLeaderLevel: 1,
		//人员选择
		formUserId: "",
		formUserName: "",
		//部门下的选择
		deptUserType:'allUser',
		//人员方式
		"assignedType": 1,
	},undefined,undefined,undefined,
undefined
	,{
		"id": util.getRandomId(),

		error: true,


		mode: true,
		delayUnit: 'TS',
		value: ''
	},undefined,undefined,undefined,undefined,undefined
];

export let setTypes = [
  {value: 1, label: '指定成员'},
  {value: 2, label: '发起人的部门主管'},
	{value: 7, label: '发起人的连续多级主管'},

  {value: 3, label: '指定角色'},
  // {value: 4, label: '发起人自选'},
	{value: 5, label: '发起人自己'},
	{value: 8, label: '表单中的人员'},
	{value: 9, label: '表单中的部门'}

]



//表达式
export let conditionExpression = ref(
	{
		"SelectDept": [
            {
                key: "empty",
                name: "为空"
            },
            {
                key: "notempty",
                name: "不为空"
            },
			{
				key: "in",
				name: "同级属于"
			}, {
				key: "notin",
				name: "同级不属于"
			},
			{
				key: "in_child",
				name: "属于同级及子级"
			}, {
				key: "notin_child",
				name: "不属于同级及子级"
			},
			{
                key: "contain",
                name: "包含同级及子级"
            }, {
                key: "notcontain",
                name: "不包含同级及子级"
            }
		],

		"SelectUser": [
            // {
            //     key: "empty",
            //     name: "为空"
            // },
            // {
            //     key: "notempty",
            //     name: "不为空"
            // },
			{
				key: "in",
				name: "属于"
			}, {
				key: "notin",
				name: "不属于"
			}

		],

		"Input": [
			{
				key: "empty",
				name: "为空"
			},
			{
				key: "notempty",
				name: "不为空"
			},
			{
				key: "==",
				name: "等于"
			}, {
				key: "!=",
				name: "不等于"
			}, {
				key: "contain",
				name: "包含"
			}, {
				key: "notcontain",
				name: "不包含"
			}
		],

		"Textarea": [
			{
				key: "empty",
				name: "为空"
			},
			{
				key: "notempty",
				name: "不为空"
			},
			{
				key: "==",
				name: "等于"
			}, {
				key: "!=",
				name: "不等于"
			}, {
				key: "contain",
				name: "包含"
			}, {
				key: "notcontain",
				name: "不包含"
			}
		],
		"Number": [
			{
				key: "empty",
				name: "为空"
			},
			{
				key: "notempty",
				name: "不为空"
			},
			{
				key: "==",
				name: "等于"
			}, {
				key: "!=",
				name: "不等于"
			}, {
				key: ">",
				name: "大于"
			}, {
				key: ">=",
				name: "大于等于"
			}, {
				key: "<",
				name: "小于"
			}, {
				key: "<=",
				name: "小于等于"
			}
		],

		"Date": [
			{
				key: "empty",
				name: "为空"
			},
			{
				key: "notempty",
				name: "不为空"
			},
			{
				key: "==",
				name: "等于"
			}, {
				key: "!=",
				name: "不等于"
			}, {
				key: ">",
				name: "大于"
			}, {
				key: ">=",
				name: "大于等于"
			}, {
				key: "<",
				name: "小于"
			}, {
				key: "<=",
				name: "小于等于"
			}
		],
		"DateTime": [
			{
				key: "empty",
				name: "为空"
			},
			{
				key: "notempty",
				name: "不为空"
			},
			{
				key: "==",
				name: "等于"
			}, {
				key: "!=",
				name: "不等于"
			}, {
				key: ">",
				name: "大于"
			}, {
				key: ">=",
				name: "大于等于"
			}, {
				key: "<",
				name: "小于"
			}, {
				key: "<=",
				name: "小于等于"
			}
		],
		"Time": [
			{
				key: "empty",
				name: "为空"
			},
			{
				key: "notempty",
				name: "不为空"
			},
			{
				key: "==",
				name: "等于"
			}, {
				key: "!=",
				name: "不等于"
			}, {
				key: ">",
				name: "大于"
			}, {
				key: ">=",
				name: "大于等于"
			}, {
				key: "<",
				name: "小于"
			}, {
				key: "<=",
				name: "小于等于"
			}
		],
		"Money": [
			{
				key: "empty",
				name: "为空"
			},
			{
				key: "notempty",
				name: "不为空"
			},
			{
				key: "==",
				name: "等于"
			}, {
				key: "!=",
				name: "不等于"
			}, {
				key: ">",
				name: "大于"
			}, {
				key: ">=",
				name: "大于等于"
			}, {
				key: "<",
				name: "小于"
			}, {
				key: "<=",
				name: "小于等于"
			}
		],
		"SingleSelect": [
            {
                key: "empty",
                name: "为空"
            },
            {
                key: "notempty",
                name: "不为空"
            },
            {
                key: "==",
                name: "等于"
            }, {
                key: "!=",
                name: "不等于"
            },
            {
                key: "in",
                name: "属于"
            }, {
                key: "notin",
                name: "不属于"
            }
		],
		"MultiSelect": [
            {
                key: "empty",
                name: "为空"
            },
            {
                key: "notempty",
                name: "不为空"
            },

            {
                key: "==",
                name: "完全匹配"
            },{
				key: "notcontain",
				name: "不包含"
			}, {
				key: "intersection",
				name: "包含以下任意"
			}
		],
		"Role": [
            {
                key: "empty",
                name: "为空"
            },
            {
                key: "notempty",
                name: "不为空"
            },
			{
				key: "in",
				name: "属于"
			}, {
				key: "notin",
				name: "不属于"
			},
			{
				key: "contain",
				name: "包含"
			}, {
				key: "notcontain",
				name: "不包含"
			}, {
				key: "intersection",
				name: "重合"
			}
		]
	}
)


export let delayUnitOpts = [
  {value: 'M', label: '月'},
  {value: 'D', label: '天'},
  {value: 'TH', label: '小时'},
  {value: 'TM', label: '分钟'},
  {value: 'TS', label: '秒'},
]
