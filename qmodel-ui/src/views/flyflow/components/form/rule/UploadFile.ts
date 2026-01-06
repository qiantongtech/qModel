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
			if (!value||value.length == 0) {
				return callback(new Error("请上传" + item.name))
			}

		}
		if (!value||value.length == 0) {

			return callback()
		}

		if (item.props.min && value.length < item.props.min) {
			return callback(new Error("上传数量不能小于" + item.props.min))
		}
		if (item.props.suffixArray && item.props.suffixArray.length > 0) {
			for (var it of value) {
				let name = it.name;
				var suffix = name.substring(name.lastIndexOf(".") + 1);
				if (item.props.suffixArray.indexOf(suffix) < 0) {
					return callback(new Error("文件只支持" + item.props.suffixArray + "格式"))

				}
			}
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
