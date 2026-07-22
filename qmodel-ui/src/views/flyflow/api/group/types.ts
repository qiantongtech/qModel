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

import {FlowVO} from "../flow/types";

/**
 * 菜单查询参数类型
 */
export interface Group {
	groupName?: string;
}

/**
 * 菜单视图对象类型
 */
export interface GroupVO {
	/**
	 * 子菜单
	 */
	items?: FlowVO[];

	/**
	 * 菜单ID
	 */
	id?: string;
	/**
	 * 菜单名称
	 */
	name?: string;

}
