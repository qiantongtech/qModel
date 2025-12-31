import * as util from "../../../utils/objutil.js";


export function getValidateRule(item){

	var itemProps = item.props



	var checkConfig = (rule: any, value: any, callback: any) => {
		if (item.required) {
			if (!value||value.length==0) {
				return callback(new Error("请选择" + item.name))
			}
		}
		if (!value||value.length==0) {

			return callback()
		}
		return callback()


	}
	let ruleArray = [{
		validator: checkConfig, trigger: 'change'
	}];
	if (item.required) {
		ruleArray.push(
			{required: true, message: '请选择' + item.name, trigger: 'change'}
		)
	}
	return ruleArray




}
