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


		if (itemProps.minLength) {
			if (value.length < itemProps.minLength) {
				return callback(new Error("长度不能小于" + itemProps.minLength))

			}
		}

		if (itemProps.maxLength) {
			if (value.length > itemProps.maxLength) {
				return callback(new Error("长度不能大于" + itemProps.maxLength))

			}
		}
		if (util.isNotBlank(itemProps.regex)) {
			let regExp = new RegExp(itemProps.regex);
			if (!regExp.test(value)) {
				return callback(new Error(itemProps.regexDesc))

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
