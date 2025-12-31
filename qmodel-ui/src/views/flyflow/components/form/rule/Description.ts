import * as util from "../../../utils/objutil.js";


export function getValidateRule(item){

	var checkConfig = (rule: any, value: any, callback: any) => {
		return callback()


	}
	let ruleArray = [{
		validator: checkConfig, trigger: 'blur'
	}];

	return ruleArray

}
