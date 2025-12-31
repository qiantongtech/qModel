import * as util from "../../../utils/objutil.js";


export function getValidateRule(item){

	var itemProps = item.props


	var checkConfig = (rule: any, value: any, callback: any) => {
		if (item.required) {
			if (util.isBlank(value)) {
				return callback(new Error("请填写" + item.name))
			}
		}
		if (util.isBlank(value)) {
			return callback()
		}

		if (itemProps.min) {
			let minDate = util.momentFunc(itemProps.min,"YYYY-MM-DD");
			let valueDate = util.momentFunc(value,"YYYY-MM-DD");
			if (valueDate.isBefore(minDate)) {
				return callback(new Error("不能小于" + itemProps.min))

			}
		}

		if (itemProps.max) {
			let maxDate = util.momentFunc(itemProps.max,"YYYY-MM-DD");
			let valueDate = util.momentFunc(value,"YYYY-MM-DD");
			if (maxDate.isBefore(valueDate)) {

				return callback(new Error("不能大于" + itemProps.max))

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
export function  test(){
	return "Date Test"
}
