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
			if (!value||value.length==0) {
				return callback(new Error("请上传" + item.name))
			}

		}
		if (!value||value.length==0) {

			return callback()
		}

		if (value.length<item.props.min) {
			return callback(new Error("上传数量不能小于" + item.props.min))
		}
		return callback()


	}
	let ruleArray = [{
		validator: checkConfig, trigger: 'blur'
	}];
	if (item.required) {
		ruleArray.push(
			{required: true, message: '请上传' + item.name, trigger: 'blur'}
		)
	}
	return ruleArray



}
