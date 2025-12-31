import {isBlank} from "./objutil.js";

function All() {
}


import {useFlowStore} from '../stores/flow'
import {delayUnitOpts, conditionExpression} from '../utils/const.js'

import * as util from './objutil.js'

import {computed} from "vue";


let flowStore = useFlowStore();
const step2FormList = computed(() => {
	let step2 = flowStore.step2;

	return step2;
})
const formIdObj = computed(() => {
	var obj = {}
	for (var item of step2FormList.value) {
		obj[item.id] = item;
	}
	obj['rootUser'] = {
		name: "发起人",
		type: 'SelectUser'
	}
	return obj
})


All.prototype = {
	timer: "",
	debounce(fn, delay = 500) {
		var _this = this;
		return function (arg) {
			//获取函数的作用域和变量
			let that = this;
			let args = arg;
			clearTimeout(_this.timer) // 清除定时器
			_this.timer = setTimeout(function () {
				fn.call(that, args)
			}, delay)
		}
	},
	setCookie(val) { //cookie设置[{key:value}]、获取key、清除['key1','key2']
		for (var i = 0, len = val.length; i < len; i++) {
			for (var key in val[i]) {
				document.cookie = key + '=' + encodeURIComponent(val[i][key]) + "; path=/";
			}
		}
	},
	getCookie(name) {
		var strCookie = document.cookie;
		var arrCookie = strCookie.split("; ");
		for (var i = 0, len = arrCookie.length; i < len; i++) {
			var arr = arrCookie[i].split("=");
			if (name == arr[0]) {
				return decodeURIComponent(arr[1]);
			}
		}
	},
	clearCookie(name) {
		var myDate = new Date();
		myDate.setTime(-1000); //设置时间
		for (var i = 0, len = name.length; i < len; i++) {
			document.cookie = "" + name[i] + "=''; path=/; expires=" + myDate.toGMTString();
		}
	},
	arrToStr(arr) {
		if (arr) {
			return arr.map(item => {
				return item.name
			}).toString()
		}
	},
	toggleClass(arr, elem, key = 'id') {
		return arr.some(item => {
			return item[key] == elem[key]
		});
	},
	toChecked(arr, elem, key = 'id') {
		var isIncludes = this.toggleClass(arr, elem, key);
		!isIncludes ? arr.push(elem) : this.removeEle(arr, elem, key);
	},
	removeEle(arr, elem, key = 'id') {
		var includesIndex;
		arr.map((item, index) => {
			if (item[key] == elem[key]) {
				includesIndex = index
			}
		});
		arr.splice(includesIndex, 1);
	},
	checkStarter(nodeConfig) {

		//动态表单检查
		let dynamicFormConfig = nodeConfig.dynamicFormConfig;
		if (dynamicFormConfig?.enable) {

			let r = util.checkHttpSetting(dynamicFormConfig);
			if (!r.ok) {
				return r;
			}


			//请求结果
			let result = dynamicFormConfig.result;
			for (var it of result) {
				if (util.isBlank(it.value) || util.isBlank(it.field) || util.isBlank(it.contentConfig)) {
					return {
						ok: false,
						msg: '动态表单返回值映射不能为空'
					};
				}
			}
		}
		return {
			ok: true,
			msg: ''
		};
	},
	checkApproval(nodeConfig) {


		if (nodeConfig.assignedType == 1) {


			//指定成员--指定部门主管
			if (nodeConfig.nodeUserList.length == 0) {
				return {
					ok: false,
					msg: '请选择成员'
				};

			}
		} else if (nodeConfig.assignedType == 10) {


			//指定部门主管
			if (nodeConfig.nodeUserList.length == 0) {
				return {
					ok: false,
					msg: '请选择部门'
				};

			}
		} else if (nodeConfig.assignedType == 3) {


			//指定角色
			if (nodeConfig.nodeUserList.length == 0) {
				return {
					ok: false,
					msg: '请选择角色'
				};

			}
		} else if (nodeConfig.assignedType == 8 && nodeConfig.formUserId.length == 0) {
			//表单-用户
			return {
				ok: false,
				msg: '请选择用户表单'
			};
		} else if (nodeConfig.assignedType == 9 ) {
			//表单-部门
			if(nodeConfig.formUserId.length == 0){
				return {
					ok: false,
					msg: '请选择部门表单'
				};
			}
			//判断是否选择角色了
			if(nodeConfig.deptUserType==='role'&&(!nodeConfig.roleList||nodeConfig.roleList.length<1)){
				return {
					ok: false,
					msg: '请选择部门下的角色'
				};
			}

		}  else if (nodeConfig.assignedType == 15 ) {
			//指定部门
			if (nodeConfig.nodeUserList.length == 0) {
				return {
					ok: false,
					msg: '请选择部门'
				};

			}
			//判断是否选择角色了
			if(nodeConfig.deptUserType==='role'&&(!nodeConfig.roleList||nodeConfig.roleList.length<1)){
				return {
					ok: false,
					msg: '请选择部门下的角色'
				};
			}

		} else if (nodeConfig.assignedType == 14) {
			//其他节点指定
			if (nodeConfig.fromOtherNodeList.length == 0) {
				return {
					ok: false,
					msg: '请选择其他审批节点'
				};
			}

		}

		//审批人为空
		if (nodeConfig.nobody?.handler === 'TO_USER' && nodeConfig.nobody?.assignedUser?.length == 0) {
			return {
				ok: false,
				msg: '审批人为空时，请选择指定用户'
			};
		}
		//审批人拒绝
		if (nodeConfig.refuse?.handler === 'TO_NODE' && nodeConfig.refuse.nodeId?.length == 0) {
			return {
				ok: false,
				msg: '审批人被拒绝时，请选择驳回的节点'
			};
		}
		//操作权限
		let operList = nodeConfig.operList;
		let length = operList?.filter(res => res.checked).length;
		if (length == 0) {
			return {
				ok: false,
				msg: '操作权限不能为空'
			};
		}

		//检查超时
		if (nodeConfig.expireSetting?.enable) {
			let value = nodeConfig.expireSetting.value;
			if (isBlank(value)) {
				return {
					ok: false,
					msg: '请设置超时时间'
				};
			} else if (!util.isInteger(value)) {
				return {
					ok: false,
					msg: '超时时间只能是整数'
				};
			} else if (parseInt(value) < 1) {
				return {
					ok: false,
					msg: '超时时间不能小于1'
				};
			}
		}
		//检查监听器
		if (nodeConfig.listener) {
			{
				let httpSetting = nodeConfig.listener.create;
				if (httpSetting?.enable) {


					let r = util.checkHttpSetting(httpSetting);
					if (!r.ok) {
						return r;
					}
				}
			}
			{
				let httpSetting = nodeConfig.listener.assign;
				if (httpSetting?.enable) {
					let r = util.checkHttpSetting(httpSetting);
					if (!r.ok) {
						return r;
					}
				}

			}
			{
				let httpSetting = nodeConfig.listener.complete;
				if (httpSetting?.enable) {
					let r = util.checkHttpSetting(httpSetting);
					if (!r.ok) {
						return r;
					}
				}

			}
			{
				let httpSetting = nodeConfig.listener.change;
				if (httpSetting?.enable) {
					let r = util.checkHttpSetting(httpSetting);
					if (!r.ok) {
						return r;
					}
				}
			}
		}

		return {
			ok: true,
			msg: ''
		};
	},

	starterStr(nodeConfig) {
		return '基础信息指定人员可发起'
	},
	setApproverStr(nodeConfig) {


		if (nodeConfig.assignedType == 14) {

			let fromOtherNodeList = nodeConfig.fromOtherNodeList;
			let s = fromOtherNodeList.map(res => res.nodeName).join(",");

			return s + "节点指定";

		} else if (nodeConfig.assignedType == 1) {


			//指定成员
			let userList = nodeConfig.nodeUserList.filter(res => res.type === 'user');
			let deptList = nodeConfig.nodeUserList.filter(res => res.type === 'dept');
			if (userList.length == 0) {
				return '部门:' + deptList.map(res => res.name).join(",")
			} else if (deptList.length == 0) {
				return '用户:' + userList.map(res => res.name).join(",")

			} else {
				return '用户:' + userList.map(res => res.name).join(",")
					+

					';部门:' + deptList.map(res => res.name).join(",")

			}


		} else if (nodeConfig.assignedType == 10) {


			//指定部门主管
			return '指定部门主管：' + nodeConfig.nodeUserList.map(res => res.name).join(",")


		}else if (nodeConfig.assignedType == 15) {


			//指定部门
			//指定部门主管
			let deptNameList = nodeConfig.nodeUserList.map(res => res.name).join(",");


			let deptUserType = nodeConfig.deptUserType;

			let roleList = nodeConfig.roleList;
			var roleNameJoin="";
			if(roleList){
				roleNameJoin=roleList.map(res=>res.name).join(";");
			}



			//表单-部门
			return '指定部门：【' +deptNameList+"】" + (deptUserType == 'allUser' ? ' 的人员' : (deptUserType == 'role' ? ` 下的角色是【${roleNameJoin}】的人员` : ' 的主管'))




		} else if (nodeConfig.assignedType == 11) {


			//系统自动拒绝
			return '系统自动拒绝'

		} else if (nodeConfig.assignedType == 12) {


			//系统自动通过
			return '系统自动通过'

		} else if (nodeConfig.assignedType == 3) {


			//指定角色
			return '角色:' + nodeConfig.nodeUserList.map(res => res.name).join(",")


		} else if (nodeConfig.assignedType == 2) {
			return nodeConfig.deptLeaderLevel == 1 ? '直接部门主管' : '第' + nodeConfig.deptLeaderLevel + '级部门主管'

		} else if (nodeConfig.assignedType == 4) {
			//发起人自选
			return "发起人自选"

		} else if (nodeConfig.assignedType == 5) {
			return "发起人自己"
		} else if (nodeConfig.assignedType == 13) {
			return "直属领导"
		} else if (nodeConfig.assignedType == 7) {
			return '到第' + nodeConfig.deptLeaderLevel + '级部门主管终止'
		} else if (nodeConfig.assignedType == 8 && nodeConfig.formUserId.length > 0) {
			//表单-人员
			return '表单人员：' + nodeConfig.formUserName
		} else if (nodeConfig.assignedType == 9 && nodeConfig.formUserId.length > 0) {

			let deptUserType = nodeConfig.deptUserType;

			let roleList = nodeConfig.roleList;
			var roleNameJoin="";
			if(roleList){
				roleNameJoin=roleList.map(res=>res.name).join(";");
			}
			//是否包含子级部门
			let containChildrenDept = nodeConfig.containChildrenDept;
			//表单-部门
			return '表单部门('+(containChildrenDept?'当前部门以及下级部门':'仅限当前部门')+')：【' + nodeConfig.formUserName+"】" + (deptUserType == 'allUser' ? ' 的人员' : (deptUserType == 'role' ? ` 下的角色是【${roleNameJoin}】的人员` : ' 的主管'))
		}
		return "";
	},
	dealStr(str, obj) {
		let arr = [];
		let list = str.split(",");
		for (var elem in obj) {
			list.map(item => {
				if (item == elem) {
					arr.push(obj[elem].value)
				}
			})
		}
		return arr.join("或")
	},
	checkCondition(conditionsConfig, index) {
		let conditionNodes = conditionsConfig.conditionNodes;
		let conditionNode = conditionNodes[index];
		let groupRelationMode = conditionNode.groupRelationMode;

		let groupRelation = conditionNode.groupRelation;

		if (!groupRelationMode) {
			if (groupRelation.length == 0) {
				return {
					ok: false,
					msg: '条件组不能为空'
				};
			}
		}


		let conditionList = conditionNode.conditionList;
		if (conditionList.length == 0) {
			return {
				ok: false,
				msg: '条件不能为空'
			};
		}
		if (index != conditionNodes.length - 1) {

			for (var it of conditionList) {
				if (it.conditionList.length == 0) {
					return {
						ok: false,
						msg: '条件不能为空'
					};
				}

				for (var ite of it.conditionList) {
					if (ite.keyType === 'SelectUser' && ite.userKey.indexOf('empty') >= 0) {
						continue
					}
					if (util.isNull(ite.key)
						|| ite.key.length == 0
						|| util.isNull(ite.expression)
						|| ite.expression.length == 0
						|| ((ite.expression.indexOf('empty') < 0) && (util.isNull(ite.value) || ite.value.length == 0))
					) {
						return {
							ok: false,
							msg: '请正确设置分支条件'
						};
					}
				}
			}


		}
		return {
			ok: true
		};

	},

	conditionStr(nodeConfig, index) {

		let conditionNodes = nodeConfig.conditionNodes;
		if (index == conditionNodes.length - 1) {
			return '默认条件'
		}
		let conditionNode = conditionNodes[index];
		let groupRelationMode = conditionNode.groupRelationMode;

		let groupRelation = conditionNode.groupRelation;

		if (!groupRelationMode) {
			if (groupRelation.length == 0) {
				return "请设置条件组关系";
			}
		}

		var {conditionList} = conditionNode;
		var groupMode = conditionNode.mode;
		if (conditionList.length == 0) {
			return (index == conditionNodes.length - 1) ? '其他条件进入此流程' : '请设置条件'
		} else {

			var groupConArr = [];
			for (var groupCondition of conditionList) {

				let mode = groupCondition.mode;

				var conArr = [];

				for (var con of groupCondition.conditionList) {


					const {key, expression, value} = con;
					if (!key) {
						continue
					}


					let valueElement = formIdObj.value[key];


					var name = valueElement?.name;

					var valueShow = value;
					if (key.indexOf('||') >= 0) {
						//明细汇总

						let split = key.split('||');
						valueElement = formIdObj.value[split[0]];
						name = con.name;
						if (util.isNull(valueShow)) {
							if (expression.indexOf('empty') >= 0) {
								valueShow = ''
							} else {
								valueShow = '?'

							}
						}

					} else if (valueElement.type === 'SelectUser') {

						let userKey = con.userKey;
						let userKeyFieldList = con.userKeyFieldList;

						let ele = userKeyFieldList.filter(r => r.key === userKey)[0];

						let type = ele.type;


						if (type === 'SingleSelect' || type === 'MultiSelect') {

							valueShow = value.map(res => res.value).join(",")


						} else if (type === 'SelectUser' || type === 'SelectDept') {
							if(value){
								valueShow = value.map(res => res.name).join(",")

							}else{
								valueShow="";
							}



						} else if (type === 'Role') {
							if(value) {

								valueShow = value.map(res => res.name).join(",")
							}else{
								valueShow="";

							}


						} else if (type && type.length > 0) {
							if (util.isNull(valueShow)) {
								if (expression.indexOf('empty') >= 0) {
									valueShow = ''

								} else {
									valueShow = '?'

								}
							}
						} else {
							valueShow = ''

						}

					} else if (valueElement.type === 'SelectDept') {
						if (util.isNull(value)) {
							if (expression.indexOf('empty') >= 0) {
								valueShow = ''

							} else {
								valueShow = '?'

							}
						} else {
							valueShow = value.map(res => res.name).join(",")

						}
					} else if (valueElement.type === 'SingleSelect' || valueElement.type === 'MultiSelect') {

						if (expression.indexOf('empty') >= 0) {
							valueShow = ''

						} else {
							valueShow = value.map(res => res.value).join(",")

						}


					}else {
						if (util.isNull(valueShow)) {
							if (expression.indexOf('empty') >= 0) {
								valueShow = ''

							} else {
								valueShow = '?'

							}
						}
					}


					if (valueElement.type === 'SelectUser') {


						let userKey = con.userKey;

						let userKeyFieldList = con.userKeyFieldList;
						let ele = userKeyFieldList.filter(r => r.key === userKey)[0];

						var expObj = {}


						let e = conditionExpression.value[ele.type];
						console.log(e)
						if(e){
							for (var it of e) {
								expObj[it.key] = it.name

							}

						}


						conArr.push(name + ' ' + ele.name + ' ' + (expObj[expression] ? expObj[expression] : '') + " " + valueShow)

					} else {

						var expObj = {}


						let e = conditionExpression.value[valueElement.type];
						for (var it of e) {
							expObj[it.key] = it.name

						}
						conArr.push(name + ' ' + expObj[expression] + " " + valueShow)

					}


				}

				if (mode) {
					let s = conArr.join(" 且 ");
					if (conArr.length > 0) {
						groupConArr.push('(' + s + ')')

					}
				} else {
					let s = conArr.join(" 或 ");
					if (conArr.length > 0) {
						groupConArr.push('(' + s + ')')

					}
				}

			}

			if (groupRelationMode == undefined ? true : groupRelationMode) {
				return groupConArr.length > 0 ? groupConArr.join(groupMode ? " 且 " : " 或 ") : (index == conditionNodes.length - 1 ? '默认条件' : '请设置条件')
			}
			if (groupConArr.length == 0) {
				return '请设置条件';
			}
			var str = '';
			for (var itm of groupRelation) {
				str = str + itm.name;
			}

			for (var k = 0; k < groupConArr.length; k++) {
				str = str.replaceAll('条件组' + (k + 1), groupConArr[k]);
			}


			return str;


		}
	},
	checkCopy(nodeConfig) {
		return this.checkApproval(nodeConfig);
	},

	checkSignContract(nodeConfig) {
		let checkApproval1 = this.checkApproval(nodeConfig);
		if (!checkApproval1.ok) {
			return checkApproval1;
		}


		{

			let enable = nodeConfig.notifySetting?.enable;


			if (enable) {
				let result = util.checkHttpSetting(nodeConfig.notifySetting);


				if (!result.ok) {
					return result;
				}

			}


		}
		//检查印章
		{
			let result = util.checkHttpSetting(nodeConfig.signatureFromRemoteSetting);


			if (!result.ok) {
				return result;
			}

		}
		if (nodeConfig.fileFromUpload) {
			if (nodeConfig.fileList.length <= 0) {
				return {
					ok: false,
					msg: '请上传待签署合同'
				};
			}
		} else {


			let result = util.checkHttpSetting(nodeConfig.fileFromRemoteSetting);


			if (!result.ok) {
				return result;
			}


		}

		return {
			ok: true
		}

	},
	signContractStr(nodeConfig) {
		return this.setApproverStr(nodeConfig)
	},
	copyerStr(nodeConfig) {


		return this.setApproverStr(nodeConfig)
	},
	triggerStr(nodeConfig) {

		return nodeConfig.httpSetting.url;

	},
	checkTrigger(nodeConfig) {

		let result = nodeConfig.httpSetting.result;

		let r = util.checkHttpSetting(nodeConfig.httpSetting);


		if (!r.ok) {
			return r;
		}


		if (result && result.length > 0) {
			for (var item of result) {
				if (util.isBlank(item.field) || util.isBlank(item.value)) {
					return {
						ok: false,
						msg: '请完善请求结果'
					}
				}
			}
		}


		return {
			ok: true,
			msg: ''
		}


	},
	checkDelay(nodeConfig) {

		let v = nodeConfig.value;


		return {
			ok: util.isNotBlank(v),
			msg: '请设置延时器数据'
		}


	},
	delayStr(nodeConfig) {


		let value = nodeConfig.value;
		let newVar = value?.length > 0 ? value : '?';

		let mode = nodeConfig.mode;
		let delayUnit = nodeConfig.delayUnit;
		if (mode) {
			let filterElement = delayUnitOpts.filter(res => res.value === delayUnit)[0];
			return "等待" + newVar + filterElement.label
		}

		return '等至' + newVar;

	},
	subProcessStr(nodeConfig) {

		const {starterMode, starterValue, subFlowId, subFlowName} = nodeConfig;


		return '子流程:' + (subFlowName?.length > 0 ? subFlowName : '?');

	},
	subProcessOK(nodeConfig) {

		if (nodeConfig == undefined) {
			return {
				ok: false,
				msg: '节点数据不能为空'
			}
		}
		const {
			starterMode,
			starterValue,
			subFlowId,
			pcFormList,
			cpFormList,
			multiple,
			multipleMode,
			multipleModeValue
		} = nodeConfig;

		//是否选择了子流程
		if (subFlowId.length == 0) {

			return {
				ok: false,
				msg: '请选择子流程'
			}
		}
		//主子表单映射
		for (var item of pcFormList) {
			if (item.field.length == 0 || item.value.length == 0) {
				return {
					ok: false,
					msg: '主子表单字段映射不能为空'
				}
			}
		}
		if (multiple) {
			//多实例
			if (multipleMode == 2) {
				//多实例来源是数字表单
				if (!multipleModeValue || multipleModeValue.length == 0) {
					return {
						ok: false,
						msg: '多实例来源：数字表单不能为空'
					}
				}
			}
			if (multipleMode == 3) {
				//多实例来源是数字表单
				if (!multipleModeValue || multipleModeValue.length == 0) {
					return {
						ok: false,
						msg: '多实例来源：多项表单不能为空'
					}
				}
			}

		} else {
			for (var item of cpFormList) {
				if (item.field.length == 0 || item.value.length == 0) {
					return {
						ok: false,
						msg: '子主表单字段映射不能为空'
					}
				}
			}

		}

		if (starterMode == 2) {
			//子流程发起人要选择表单
			if (starterValue.length == 0) {
				return {
					ok: false,
					msg: '子流程发起人表单不能为空'
				}
			}
		}

		if (starterMode == 3) {
			//多实例
			if (!multiple) {
				return {
					ok: false,
					msg: '非多实例选项'
				}
			}

			if (multipleMode != 3) {
				return {
					ok: false,
					msg: '非多实例选项'
				}
			}
			if (multipleModeValue.length == 0) {
				return {
					ok: false,
					msg: '多项表单不能为空'
				}
			}
		}


		return {
			ok: true
		};
	},
	routeStr(nodeConfig) {
		let b = this.routeOk(nodeConfig);
		if (!b) {
			return '请完善路由信息'
		}
		return nodeConfig.list.length + '条动态路由'
	},
	routeOk(nodeConfig) {

		let list = nodeConfig.list;
		if (list.length == 0) {
			return {
				ok: false,
				msg: '请添加路由'
			};
		}
		let length = list.filter(res => res.error || res.nodeId.length == 0).length;
		if (length > 0) {
			return {
				ok: false,
				msg: '路由条件有误或者未设置节点id'
			};
		}
		return {
			ok: true
		}
	}
}

export default new All();
