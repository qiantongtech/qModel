import moment from 'moment'
import useClipboard from 'vue-clipboard3';
import getFormRuleWidget from "../utils/getFormRuleWidget";

const {toClipboard} = useClipboard();




export function getPageSize(){
	var screenWidth = window.screen.width;
	var screenHeight = window.screen.height;
	var pageWidth = window.innerWidth;

	var pageHeight = window.innerHeight;
	return {
			screenHeight:screenHeight,
		screenWidth:screenWidth,
		pageWidth:pageWidth,
		pageHeight:pageHeight
	}
}

//获取表单验证规则
export function getFormRuleConfig(item){
	let module = getFormRuleWidget[item.type];
	const method = module.getValidateRule(item);
	return method
};

// 定义url解析函数
export function parseUrlParams(paramsString) {
	const params = {};
	paramsString.split('&').forEach(param => {
		const [key, value] = param.split('=');
		params[key] = decodeURIComponent(value);
	});
	return params;
}


//获取表单值
export function getFormValue(v) {
	var obj = {}

	for (var item of v) {
		obj[item.id] = item.props.value


	}
	return obj;
}

function produceLayoutValue(item, obj) {


	let subList = item.props.value;


	var d = []
	for (var array of subList) {


		var v = {}

		for (var subItem of array) {
			let value = subItem.props.value;
			v[subItem.id] = value;
		}
		d.push(v)

	}

	{
		//处理汇总表单数据
		let oriForm = item.props.oriForm;
		let list = oriForm.filter(res => res.props.sum === true);
		for (var sumItem of list) {
			var sumValue = undefined;
			for (var vArr of subList) {
				let ele = vArr.filter(k => k.id === sumItem.id)[0];
				let value = ele.props.value;
				if (value != undefined) {
					if (sumValue == undefined) {
						sumValue = 0
					}
					sumValue += value;
				}
			}
			obj[item.id + '||' + sumItem.id + '||sum'] = sumValue;
		}
	}

	obj[item.id] = d;
}

import {useFlowStore} from "../stores/flow";

export function getCurrentConfig(id) {

	let flowStore = useFlowStore();
	let step2 = flowStore.step2;
	var idObjList = step2.filter(res => res.id === id);
	if (idObjList.length > 0) {
		return idObjList[0];
	}



	return undefined;
}

//数字转人民币大写
export function convertCurrency(money) {

	if (money == null || money === undefined) {
		return ''
	}

	//汉字的数字
	var cnNums = new Array('零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖');
	//基本单位
	var cnIntRadice = new Array('', '拾', '佰', '仟');
	//对应整数部分扩展单位
	var cnIntUnits = new Array('', '万', '亿', '兆');
	//对应小数部分单位
	var cnDecUnits = new Array('角', '分', '毫', '厘');
	//整数金额时后面跟的字符
	var cnInteger = '整';
	//整型完以后的单位
	var cnIntLast = '元';
	//最大处理的数字
	var maxNum = 999999999999999.9999;
	//金额整数部分
	var integerNum;
	//金额小数部分
	var decimalNum;
	//输出的中文金额字符串
	var chineseStr = '';
	//分离金额后用的数组，预定义
	var parts;
	// 传入的参数为空情况
	if (money == '') {
		return '';
	}
	money = parseFloat(money)
	if (money >= maxNum) {
		return ''
	}
	// 传入的参数为0情况
	if (money == 0) {
		chineseStr = cnNums[0] + cnIntLast + cnInteger;
		return chineseStr
	}
	// 转为字符串
	money = money.toString();
	// indexOf 检测某字符在字符串中首次出现的位置 返回索引值（从0 开始） -1 代表无
	if (money.indexOf('.') == -1) {
		integerNum = money;
		decimalNum = ''
	} else {
		parts = money.split('.');
		integerNum = parts[0];
		decimalNum = parts[1].substr(0, 4);
	}
	//转换整数部分
	if (parseInt(integerNum, 10) > 0) {
		let zeroCount = 0;
		let IntLen = integerNum.length
		for (let i = 0; i < IntLen; i++) {
			let n = integerNum.substr(i, 1);
			let p = IntLen - i - 1;
			let q = p / 4;
			let m = p % 4;
			if (n == '0') {
				zeroCount++;
			} else {
				if (zeroCount > 0) {
					chineseStr += cnNums[0]
				}
				zeroCount = 0;
				chineseStr += cnNums[parseInt(n)] + cnIntRadice[m];
			}
			if (m == 0 && zeroCount < 4) {
				chineseStr += cnIntUnits[q];
			}
		}
		// 最后+ 元
		chineseStr += cnIntLast;
	}
	// 转换小数部分
	if (decimalNum != '') {
		let decLen = decimalNum.length;
		for (let i = 0; i < decLen; i++) {
			let n = decimalNum.substr(i, 1);
			if (n != '0') {
				chineseStr += cnNums[Number(n)] + cnDecUnits[i]
			}
		}
	}
	if (chineseStr == '') {
		chineseStr += cnNums[0] + cnIntLast + cnInteger;
	} else if (decimalNum == '') {
		chineseStr += cnInteger;
	}

	return chineseStr
}

/**
 * 复制到粘贴板
 * @param value
 * @returns {Promise<void>}
 */
export async function copyToBoard(value) {
	try {

		await toClipboard(JSON.stringify(value));
		ElMessage.success('复制成功')
	} catch (e) {
		console.log(e);
	}
}

export function isNull(s) {
	if (s === undefined || s === null) {
		return true;
	}
	return false;
}

export function isBlank(s) {
	if (s === undefined || s === null || ((typeof s) === 'string' && s.trim().length == 0)) {
		return true;
	}
	return false;
}


export function isNotBlank(s) {
	return !isBlank(s);
}

export function isNode(obj) {
	return isNotBlank(obj) && isNotBlank(obj.id);

}

export function checkHttpSetting(setting, title) {


	let url = setting?.url;
	let header = setting?.header;
	let body = setting?.body;

	if (true) {
		if (!isUrl(url)) {
			let msg = '请输入正确的请求地址';
			if (isNotBlank(title)) {
				msg = "请输入【" + title + "】的请求地址"
			}
			return {
				ok: false,
				msg: msg
			}
		}


		if (header && header.length > 0) {
			for (var item of header) {
				if (isBlank(item.field) || isBlank(item.value)) {
					let msg = '请完善请求头';
					if (isNotBlank(title)) {
						msg = "请完善【" + title + "】的请求头"
					}
					return {
						ok: false,
						msg: msg
					}
				}
			}
		}


		if (body && body.length > 0) {
			for (var item of body) {
				if (isBlank(item.field) || isBlank(item.value)) {
					let msg = '请完善请求体';
					if (isNotBlank(title)) {
						msg = "请完善【" + title + "】的请求体"
					}
					return {
						ok: false,
						msg: msg
					}
				}
			}
		}
	}

	return {ok: true}
}

//对象合并
export function assiginObj(target = {}, sources = {}) {
	let obj = target;
	if (typeof target != 'object' || typeof sources != 'object') {
		return sources; // 如果其中一个不是对象 就返回sources
	}
	for (let key in sources) {
		// 如果target也存在 那就再次合并
		if (target.hasOwnProperty(key)) {
			obj[key] = assiginObj(target[key], sources[key]);
		} else {
			// 不存在就直接添加
			obj[key] = sources[key];
		}
	}
	return obj;
}

export function isUrl(obj) {
	if (isBlank(obj)) {
		return false;
	}

	var regUrl = /^((ht|f)tps?):\/\/[\w\-]+(\.[\w\-]+)+([\w\-\.,@?^=%&:\/~\+#]*[\w\-\@?^=%&\/~\+#])?$/;

	return regUrl.test(obj);

}

//判断是否是整数
export function isInteger(obj) {
	if (isBlank(obj)) {
		return false;
	}

	var regUrl = /^\d+$/;

	return regUrl.test(obj);
}

export function getRandomId() {
	return `flyflow_${new Date().getTime().toString().substring(5)}${Math.round(
		Math.random() * 9000 + 1000
	)}`;

}

export function distinct(arr) {
	return Array.from(new Set(arr))

}

export function getNumberRadixNum(s) {
	let strings = s.toString().split(".");
	if (strings.length <= 1) {
		return 0;
	}
	return strings[1].toString().length;

}

export function deepCopy(s) {
	if (isNull(s)) {
		return undefined;
	}
	return JSON.parse(JSON.stringify(s));

}

export function sameJson(o1, o2) {
	o1 = deepCopy(o1)
	o2 = deepCopy(o2)
	if (typeof o1 != typeof o2) {
		return false;
	}
	if (o1 instanceof Array) {
		let l1 = o1.length;
		let l2 = o2.length;
		if (l1 != l2) {
			return false;
		}
		for (var k = 0; k < l1; k++) {
			let b = sameJsonObj(o1[k], o2[k]);
			if (!b) {
				return false;
			}
		}
		return true;
	}
	return sameJsonObj(o1, o2)
}

export function sameJsonObj(o1, o2) {
	if (typeof o1 != typeof o2) {
		return false;
	}

	var object1 = deepCopy(o1)
	var object2 = deepCopy(o2)

	const keys1 = Object.keys(object1).sort();

	const keys2 = Object.keys(object2).sort();

	if (keys1.length !== keys2.length) {

		return false;
	}

	for (let index = 0; index < keys1.length; index++) {
		let val1 = object1[keys1[index]];

		let val2 = object2[keys2[index]];

		let type1 = typeof val1;
		let type2 = typeof val2;


		if (type1 != type2) {
			return false;
		}
		if (type1 instanceof Object) {
			let b = sameJsonObj(val1, val2);
			if (!b) {
				return false;
			}
		} else if (val1 instanceof Array) {
			let l1 = val1.length;
			let l2 = val2.length;
			if (l1 != l2) {
				return false;
			}
			for (var k = 0; k < l1; k++) {
				let b = sameJsonObj(val1[k], val2[k]);
				if (!b) {
					return false;
				}
			}

		} else if (val1 !== val2) {

			return false;
		}

	}
	return true;
}

export function momentFunc(a, b) {
	return moment(a, b)

}

export function momentFormat(a, b) {
	return moment(a).format(b)

}

//最大公约数
function getGcd(a, b) {
	let max = Math.max(a, b);
	let min = Math.min(a, b);
	if (max % min === 0) {
		return min;
	} else {
		return getGcd(max % min, min);
	}
}

//最小公倍数
function getLcm(a, b) {
	return a * b / getGcd(a, b);
}

//多个数字的最小公倍数
export function getLcmArray(arr) {
	let lcm = arr[0];

	for (var k = 1; k < arr.length; k++) {
		lcm = getLcm(lcm, arr[k]);
	}
	return lcm;
}


// 获取URL的查询参数
// 将参数转化成JSON对象：如果URL没有携带参数，则JSON对象为{}
export function getUrlParamsToJSON(url) {
	var params = {};
	//去除所有空格
	url = url.replace(/\s/ig, '');
	//正则表达式匹配
	url.replace(/([^?&=]+)=([^&]+)/g, (_, key, value) => {
		params[key] = value;
	});
	return params;
}

/**
 * 拼接对象为请求字符串
 * @param {Object} obj - 待拼接的对象
 * @returns {string} - 拼接成的请求字符串
 * Auth:WANGJIAN
 */
export function encodeSearchParams(obj) {
	const params = []

	Object.keys(obj).forEach((key) => {
		let value = obj[key]
		// 如果值为undefined我们将其置空
		if (typeof value === 'undefined') {
			value = ''
		}
		// 对于需要编码的文本（比如说中文）我们要进行编码
		params.push([key, encodeURIComponent(value)].join('='))
	})

	return params.join('&')
}
//判断是否是数字
export function  isNumber(nubmer){
	var re = /^(\-|\+)?\d+(\.\d+)?$/;//判断字符串是否为数字//判断正整数/[1−9]+[0−9]∗]∗/
	if (!re.test(nubmer)) {
		return false
	}
	return true
}
