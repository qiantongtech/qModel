/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
 */

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
