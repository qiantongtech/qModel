/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
 *
 * This file is part of qModel Module Platform (Open Source Edition).
 *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

-- qmodel-v1.3.0之后更新的内容

-- 2245: 模型中心 path 从 'model/version' 改为 'model/manage'
UPDATE `system_menu` SET `path` = 'model/manage' WHERE `menu_id` = 2245;

-- 2253: 模型审批 path 从 'audit' 改为 'model/audit'
UPDATE `system_menu` SET `path` = 'model/audit' WHERE `menu_id` = 2253;

-- 2254: 模型文件部署 path 从 'modelFileResource' 改为 'model/fileResource'
UPDATE `system_menu` SET `path` = 'model/fileResource' WHERE `menu_id` = 2254;

-- 2261: 构建日志 path 从 'modelBuildLog' 改为 'model/buildLog'
UPDATE `system_menu` SET `path` = 'model/buildLog' WHERE `menu_id` = 2261;

-- 2268: 调用记录 path 从 'modelInvokeHistory' 改为 'model/invokeHistory'
UPDATE `system_menu` SET `path` = 'model/invokeHistory' WHERE `menu_id` = 2268;

-- 2296: 模型分类 path 从 'Classify' 改为 'model/classify'
UPDATE `system_menu` SET `path` = 'model/classify' WHERE `menu_id` = 2296;

-- 2303: 历史记录 path 从 'Operate' 改为 'model/operate'
UPDATE `system_menu` SET `path` = 'model/operate' WHERE `menu_id` = 2303;

-- 2310: 模型计算 path 从 'modelCompute' 改为 'model/compute'
UPDATE `system_menu` SET `path` = 'model/compute' WHERE `menu_id` = 2310;
