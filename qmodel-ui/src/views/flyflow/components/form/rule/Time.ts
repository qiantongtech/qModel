/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

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
			let minDate = util.momentFunc(itemProps.min,"HH:mm:ss");
			let valueDate = util.momentFunc(value,"HH:mm:ss");
			if (valueDate.isBefore(minDate)) {
				return callback(new Error("不能小于" + itemProps.min))

			}
		}

		if (itemProps.max) {
			let maxDate = util.momentFunc(itemProps.max,"HH:mm:ss");
			let valueDate = util.momentFunc(value,"HH:mm:ss");
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
