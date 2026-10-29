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

INSERT INTO `system_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `route_name`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2339, 'API管理', 0, 9, 'data/api', 'model/modelData/api/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:modelData:dataapi:list', '#', 'admin', '2026-08-19 15:09:29', '超级管理员', '2026-08-21 09:09:14', 'API管理菜单');
INSERT INTO `system_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `route_name`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2340, 'API管理查询', 2339, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelData:dataapi:query', '#', 'admin', '2026-08-19 15:09:29', '', NULL, '');
INSERT INTO `system_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `route_name`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2341, 'API管理新增', 2339, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelData:dataapi:add', '#', 'admin', '2026-08-19 15:09:30', '', NULL, '');
INSERT INTO `system_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `route_name`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2342, 'API管理修改', 2339, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelData:dataapi:edit', '#', 'admin', '2026-08-19 15:09:30', '', NULL, '');
INSERT INTO `system_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `route_name`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2343, 'API管理删除', 2339, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelData:dataapi:remove', '#', 'admin', '2026-08-19 15:09:30', '', NULL, '');
INSERT INTO `system_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `route_name`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2344, 'API管理导出', 2339, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelData:dataapi:export', '#', 'admin', '2026-08-19 15:09:30', '', NULL, '');
INSERT INTO `system_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `route_name`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2345, 'API管理导入', 2339, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelData:dataapi:import', '#', 'admin', '2026-08-19 15:09:30', '', NULL, '');

-- 请求方式字典标签改为大写（仅存量环境升级用；全新环境直接执行 v1.4.3初始化.sql，其中 INSERT 已改为大写）
UPDATE `system_dict_data` SET `dict_label` = 'GET' WHERE `dict_type` = 'model_access_mode' AND `dict_value` = '0';
UPDATE `system_dict_data` SET `dict_label` = 'POST' WHERE `dict_type` = 'model_access_mode' AND `dict_value` = '1';
UPDATE `system_dict_data` SET `dict_label` = 'PUT' WHERE `dict_type` = 'model_access_mode' AND `dict_value` = '2' ;
UPDATE `system_dict_data` SET `dict_label` = 'DELETE' WHERE `dict_type` = 'model_access_mode' AND `dict_value` = '3';

