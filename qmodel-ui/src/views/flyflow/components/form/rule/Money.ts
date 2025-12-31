import * as util from "../../../utils/objutil.js";


export function getValidateRule(item){

	var itemProps = item.props

	var checkConfig = (rule: any, value: any, callback: any) => {

		if (item.required) {
			if (!(value)) {
				return callback(new Error("请填写" + item.name))
			}
		}
		if (!(value)) {
			return callback()
		}

		if(!util.isNumber(value)){
			return callback(new Error("请输入数字"))
		}

		if(itemProps.radixNum!=undefined){
			if (util.getNumberRadixNum(value)>itemProps.radixNum) {
				return callback(new Error("小数位数不能大于" + itemProps.radixNum))

			}
		}

		if (itemProps.min) {
			if (value < itemProps.min) {
				return callback(new Error("数值不能小于" + itemProps.min))

			}
		}

		if (itemProps.max) {
			if (value > itemProps.max) {
				return callback(new Error("数值不能大于" + itemProps.max))

			}
		}

		return callback()


	}
	let ruleArray = [{
		validator: checkConfig, trigger: 'blur'
	}];
	if (item.required) {
		ruleArray.push(
			{required: true, message: '请填写' + item.name, trigger: 'blur'}
		)
	}
	return ruleArray



}
