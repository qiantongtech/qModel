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

import { reactive } from 'vue'
// 引入全部图标
// import * as Icons from "@element-plus/icons"

// 按需引入图标
import {
	CloseBold,Fold,
	Close,Memo,
	Plus,AlarmClock,CopyDocument,
	Star,ChatLineSquare,Histogram,
	Delete,Calendar,
	UserFilled,StarFilled,ArrowDown,
	Finished,
	Loading,ShoppingBag,
	Connection,Position,Back,
	Edit,
	EditPen,CirclePlusFilled,
	Money,Timer,
	OfficeBuilding,CirclePlus,
	Select,
	More,
	Picture,RemoveFilled,
	User,
	Upload,
	FolderOpened,
	CollectionTag,DocumentAdd,
	FirstAidKit
} from '@element-plus/icons-vue'

const dictIcon = reactive({
	'CloseBold': CloseBold,
	'Close': Close,
	'ChatLineSquare': ChatLineSquare,
	'Calendar': Calendar,
	'Fold': Fold,
	'Memo': Memo,
	'CopyDocument': CopyDocument,
	'Histogram': Histogram,
	'CirclePlusFilled': CirclePlusFilled,
	'ArrowDown': ArrowDown,
	'EditPen': EditPen,
	'RemoveFilled': RemoveFilled,
	'DocumentAdd': DocumentAdd,
	'CirclePlus': CirclePlus,
	'Timer': Timer,
	'Position': Position,
	'ShoppingBag': ShoppingBag,
	'Back': Back,
	'Delete': Delete,
	'StarFilled': StarFilled,
	'AlarmClock': AlarmClock,
	'Picture': Picture,
	'More': More,
	'FirstAidKit': FirstAidKit,
	'User': User,
	'OfficeBuilding': OfficeBuilding,
	'CollectionTag': CollectionTag,
	'Upload': Upload,
	'Plus': Plus,
	'Finished': Finished,
	'Select': Select,
	'Money': Money,
	'Star': Star,
	'UserFilled': UserFilled,
	'Loading': Loading,
	'Connection': Connection,
	'Edit': Edit,
	'FolderOpened': FolderOpened
})

const installIcon = (app) => {
	// 便于模板获取
	app.config.globalProperties.$icon = dictIcon
	// 使用全部图标
	// app.config.globalProperties.$icon = Icons
}

export default installIcon
