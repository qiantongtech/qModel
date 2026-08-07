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

/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : qmodel_dev

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 08/07/2026 10:57:34
*/


INSERT INTO `system_dict_data` VALUES (133, 1, '待审批', '0', 'model_audit_status', NULL, 'primary', NULL, '0', '吴同', '2026-07-23 14:20:34', '吴同', '2026-07-23 14:21:07', NULL);
INSERT INTO `system_dict_data` VALUES (134, 2, '审批通过', '1', 'model_audit_status', NULL, 'success', NULL, '0', '吴同', '2026-07-23 14:21:02', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (135, 3, '审批拒绝', '2', 'model_audit_status', NULL, 'danger', NULL, '0', '吴同', '2026-07-23 14:21:28', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (136, 1, '构建中', '0', 'model_status', NULL, 'primary', NULL, '0', '吴同', '2026-07-23 14:30:35', '吴同', '2026-07-24 17:40:09', NULL);
INSERT INTO `system_dict_data` VALUES (137, 2, '构建成功', '1', 'model_status', NULL, 'default', NULL, '1', '吴同', '2026-07-23 14:30:51', '吴同', '2026-07-24 17:39:25', NULL);
INSERT INTO `system_dict_data` VALUES (138, 3, '构建失败', '2', 'model_status', NULL, 'danger', NULL, '0', '吴同', '2026-07-23 14:31:05', '吴同', '2026-07-23 14:35:14', NULL);
INSERT INTO `system_dict_data` VALUES (139, 4, '已接入', '3', 'model_status', NULL, 'primary', NULL, '0', '吴同', '2026-07-23 14:31:17', '吴同', '2026-07-23 14:37:06', NULL);
INSERT INTO `system_dict_data` VALUES (140, 5, '审批中', '4', 'model_status', NULL, 'warning', NULL, '0', '吴同', '2026-07-23 14:31:27', '吴同', '2026-07-24 17:39:46', NULL);
INSERT INTO `system_dict_data` VALUES (141, 6, '已发布', '5', 'model_status', NULL, 'success', NULL, '0', '吴同', '2026-07-23 14:31:39', '吴同', '2026-07-23 14:36:02', NULL);
INSERT INTO `system_dict_data` VALUES (142, 7, '审批拒绝', '6', 'model_status', NULL, 'danger', NULL, '0', '吴同', '2026-07-23 14:31:52', '吴同', '2026-07-24 17:39:55', NULL);
INSERT INTO `system_dict_data` VALUES (143, 8, '已下线', '7', 'model_status', NULL, 'info', NULL, '0', '吴同', '2026-07-23 14:32:12', '吴同', '2026-07-23 14:38:45', NULL);

INSERT INTO `system_dict_data` VALUES (124, 0, '待执行', '0', 'model_calc_status', NULL, 'primary', NULL, '0', '超级管理员', '2026-07-23 15:18:55', '超级管理员', '2026-07-23 15:19:08', NULL);
INSERT INTO `system_dict_data` VALUES (125, 1, '运行中', '1', 'model_calc_status', NULL, 'info', NULL, '0', '超级管理员', '2026-07-23 15:19:20', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (126, 2, '运行成功', '2', 'model_calc_status', NULL, 'success', NULL, '0', '超级管理员', '2026-07-23 15:19:30', '超级管理员', '2026-07-23 15:19:57', NULL);
INSERT INTO `system_dict_data` VALUES (127, 3, '运行失败', '3', 'model_calc_status', NULL, 'danger', NULL, '0', '超级管理员', '2026-07-23 15:20:10', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (128, 4, '已终止', '4', 'model_calc_status', NULL, 'warning', NULL, '0', '超级管理员', '2026-07-23 15:20:24', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (129, 5, '排队中', '5', 'model_calc_status', NULL, 'default', NULL, '0', '超级管理员', '2026-07-23 15:20:38', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (130, 0, '高', '1', 'model_calc_priority', NULL, 'primary', NULL, '0', '超级管理员', '2026-07-23 15:21:41', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (131, 2, '中', '2', 'model_calc_priority', NULL, 'info', NULL, '0', '超级管理员', '2026-07-23 15:21:53', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (132, 3, '低', '3', 'model_calc_priority', NULL, 'danger', NULL, '0', '超级管理员', '2026-07-23 15:22:06', NULL, NULL, NULL);

INSERT INTO `system_dict_data` VALUES (133, 1, '待审批', '0', 'model_audit_status', NULL, 'primary', NULL, '0', '吴同', '2026-07-23 14:20:34', '吴同', '2026-07-23 14:21:07', NULL);
INSERT INTO `system_dict_data` VALUES (134, 2, '审批通过', '1', 'model_audit_status', NULL, 'success', NULL, '0', '吴同', '2026-07-23 14:21:02', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (135, 3, '审批拒绝', '2', 'model_audit_status', NULL, 'danger', NULL, '0', '吴同', '2026-07-23 14:21:28', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (136, 1, '构建中', '0', 'model_status', NULL, 'primary', NULL, '0', '吴同', '2026-07-23 14:30:35', '吴同', '2026-07-24 17:40:09', NULL);
INSERT INTO `system_dict_data` VALUES (137, 2, '构建成功', '1', 'model_status', NULL, 'default', NULL, '1', '吴同', '2026-07-23 14:30:51', '吴同', '2026-07-24 17:39:25', NULL);
INSERT INTO `system_dict_data` VALUES (138, 3, '构建失败', '2', 'model_status', NULL, 'danger', NULL, '0', '吴同', '2026-07-23 14:31:05', '吴同', '2026-07-23 14:35:14', NULL);
INSERT INTO `system_dict_data` VALUES (139, 4, '已接入', '3', 'model_status', NULL, 'primary', NULL, '0', '吴同', '2026-07-23 14:31:17', '吴同', '2026-07-23 14:37:06', NULL);
INSERT INTO `system_dict_data` VALUES (140, 5, '审批中', '4', 'model_status', NULL, 'warning', NULL, '0', '吴同', '2026-07-23 14:31:27', '吴同', '2026-07-24 17:39:46', NULL);
INSERT INTO `system_dict_data` VALUES (141, 6, '已发布', '5', 'model_status', NULL, 'success', NULL, '0', '吴同', '2026-07-23 14:31:39', '吴同', '2026-07-23 14:36:02', NULL);
INSERT INTO `system_dict_data` VALUES (142, 7, '审批拒绝', '6', 'model_status', NULL, 'danger', NULL, '0', '吴同', '2026-07-23 14:31:52', '吴同', '2026-07-24 17:39:55', NULL);
INSERT INTO `system_dict_data` VALUES (143, 8, '已下线', '7', 'model_status', NULL, 'info', NULL, '0', '吴同', '2026-07-23 14:32:12', '吴同', '2026-07-23 14:38:45', NULL);



INSERT INTO `system_dict_type` VALUES (40, '模型审批状态', 'model_audit_status', '0', '吴同', '2026-07-23 14:13:44', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (41, '模型状态', 'model_status', '0', '吴同', '2026-07-23 14:29:10', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (38, '模型计算状态', 'model_calc_status', '0', '超级管理员', '2026-07-23 15:18:37', NULL, NULL, '计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中');
INSERT INTO `system_dict_type` VALUES (39, '模型计算优先级', 'model_calc_priority', '0', '超级管理员', '2026-07-23 15:21:17', NULL, NULL, '优先级:1-高,2-中,3-低');
INSERT INTO `system_dict_type` VALUES (40, '模型审批状态', 'model_audit_status', '0', '吴同', '2026-07-23 14:13:44', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (41, '模型状态', 'model_status', '0', '吴同', '2026-07-23 14:29:10', NULL, NULL, NULL);



UPDATE `system_menu` SET
                         `menu_name` = '模型审批',
                         `parent_id` = 0,
                         `order_num` = 5,
                         `path` = 'audit',
                         `component` = 'model/modelAudit/index',
                         `query` = NULL,
                         `is_frame` = 1,
                         `is_cache` = 0,
                         `menu_type` = NULL,
                         `visible` = 'C',
                         `status` = '0',
                         `perms` = '0',
                         `permission` = 'model:modelAudit:audit:list',
                         `icon` = 'model-approve',
                         `create_by` = '吴同',
                         `create_time` = '2026-07-14 15:49:56',
                         `update_by` = 'qModel',
                         `update_time` = '2026-07-20 14:14:23',
                         `remark` = NULL
WHERE menu_id = 2253;

INSERT INTO `system_menu` VALUES (2317, '模型审批修改', 2253, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelAudit:audit:edit', '#', '	\r\n吴同', '2026-07-23 13:51:31', '', NULL, '');
INSERT INTO `system_menu` VALUES (2318, '模型审批查询', 2253, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelAudit:audit:query', '#', '吴同', '2026-07-23 13:51:31', '', NULL, '');

INSERT INTO `system_menu` VALUES (2319, '模型计算', 0, 4, 'model/calc', 'model/calc/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:calc:calc:list', 'model-calculation', 'admin', '2026-07-27 14:31:18', '', NULL, '模型计算任务菜单');
INSERT INTO `system_menu` VALUES (2320, '模型计算任务查询', 2319, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calc:calc:query', '#', 'admin', '2026-07-27 14:31:18', '', NULL, '');
INSERT INTO `system_menu` VALUES (2321, '模型计算任务新增', 2319, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calc:calc:add', '#', 'admin', '2026-07-27 14:31:18', '', NULL, '');
INSERT INTO `system_menu` VALUES (2322, '模型计算任务修改', 2319, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calc:calc:edit', '#', 'admin', '2026-07-27 14:31:18', '', NULL, '');
INSERT INTO `system_menu` VALUES (2323, '模型计算任务删除', 2319, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calc:calc:remove', '#', 'admin', '2026-07-27 14:31:18', '', NULL, '');
INSERT INTO `system_menu` VALUES (2324, '模型计算任务导出', 2319, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calc:calc:export', '#', 'admin', '2026-07-27 14:31:18', '', NULL, '');
INSERT INTO `system_menu` VALUES (2325, '模型计算任务导入', 2319, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calc:calc:import', '#', 'admin', '2026-07-27 14:31:18', '', NULL, '');

INSERT INTO `system_menu` VALUES (2326, '模型计算执行记录', 2319, 1, 'calcExecution', 'model/calcExecution/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:calcExecution:calcexecution:list', '#', 'admin', '2026-08-05 14:38:43', '', NULL, '模型计算执行记录菜单');
INSERT INTO `system_menu` VALUES (2327, '模型计算执行记录查询', 2326, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calcExecution:calcexecution:query', '#', 'admin', '2026-08-05 14:38:43', '', NULL, '');
INSERT INTO `system_menu` VALUES (2328, '模型计算执行记录新增', 2326, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calcExecution:calcexecution:add', '#', 'admin', '2026-08-05 14:38:43', '', NULL, '');
INSERT INTO `system_menu` VALUES (2329, '模型计算执行记录修改', 2326, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calcExecution:calcexecution:edit', '#', 'admin', '2026-08-05 14:38:43', '', NULL, '');
INSERT INTO `system_menu` VALUES (2330, '模型计算执行记录删除', 2326, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calcExecution:calcexecution:remove', '#', 'admin', '2026-08-05 14:38:43', '', NULL, '');
INSERT INTO `system_menu` VALUES (2331, '模型计算执行记录导出', 2326, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calcExecution:calcexecution:export', '#', 'admin', '2026-08-05 14:38:43', '', NULL, '');
INSERT INTO `system_menu` VALUES (2332, '模型计算执行记录导入', 2326, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:calcExecution:calcexecution:import', '#', 'admin', '2026-08-05 14:38:43', '', NULL, '');
INSERT INTO `system_menu` VALUES (2333, '密钥管理', 0, 8, 'modelKey', 'model/modelKey/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:modelKey:key:list', 'password', 'admin', '2026-07-31 17:09:48', '超级管理员', '2026-07-31 17:14:15', '模型访问 key菜单');
INSERT INTO `system_menu` VALUES (2334, '密钥管理复制', 2333, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelKey:key:copy', '#', 'admin', '2026-07-31 17:09:48', '', NULL, '');
INSERT INTO `system_menu` VALUES (2335, '密钥管理新增', 2333, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelKey:key:add', '#', 'admin', '2026-07-31 17:09:49', '', NULL, '');
INSERT INTO `system_menu` VALUES (2336, '密钥管理删除', 2333, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelKey:key:remove', '#', 'admin', '2026-07-31 17:09:49', '', NULL, '');

DELETE from system_menu WHERE menu_id in (2319,2303,2245,2296,2268,2261,2253,2337,2333,1,2,3);
INSERT INTO `system_menu` VALUES (2319, '计算任务', 2337, 1, 'model/calc', 'model/calc/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:calc:calc:list', 'model-calculation', '吴同', '2026-07-27 14:31:18', '吴同', NULL, '模型计算任务菜单');
INSERT INTO `system_menu` VALUES (2303, '计算历史', 2337, 2, 'model/operate', 'model/operateList/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:operate:operate:list', 'calculate-history', '吴同', '2026-07-20 14:23:04', '吴同', '2026-07-20 15:16:31', '模型历史管理菜单');
INSERT INTO `system_menu` VALUES (2245, '模型中心', 0, 10, 'model/manage', 'model/modelManage/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:model:list', 'model-administration', '吴同', '2025-11-14 15:32:43', '吴同', '2026-07-20 14:19:25', NULL);
INSERT INTO `system_menu` VALUES (2296, '模型分类', 0, 20, 'model/classify', 'model/modelClassify/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:classify:classify:list', 'category-management', '吴同', '2026-07-20 11:21:25', '吴同', '2026-07-20 13:42:46', '模型分类菜单');
INSERT INTO `system_menu` VALUES (2268, '调用记录', 0, 30, 'model/invokeHistory', 'model/invokeHistory/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:invokeHistory:invokehistory:list', 'call-record', '吴同', '2026-07-17 13:39:50', '吴同', '2026-07-20 14:13:58', '模型调用历史记录菜单');
INSERT INTO `system_menu` VALUES (2261, '构建日志', 0, 40, 'model/buildLog', 'model/buildLog/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:buildLog:buildlog:list', 'build-log', '吴同', '2026-07-17 13:39:16', '吴同', '2026-07-20 14:14:10', '构建日志菜单');
INSERT INTO `system_menu` VALUES (2253, '模型审批', 0, 50, 'model/audit', 'model/modelAudit/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:modelAudit:audit:list', 'model-approve', '吴同', '2026-07-14 15:49:56', '吴同', '2026-07-20 14:14:23', NULL);
INSERT INTO `system_menu` VALUES (2337, '模型计算', 0, 60, 'calc', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'model-calculation', '吴同', '2024-05-06 06:12:17', '吴同', '2025-12-31 10:03:45', '系统管理目录');
INSERT INTO `system_menu` VALUES (2333, '密钥管理', 0, 70, 'model/key', 'model/modelKey/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:modelKey:key:list', 'password', '吴同', '2026-07-31 17:09:48', '吴同', '2026-07-31 17:14:15', '模型访问 key菜单');
INSERT INTO `system_menu` VALUES (1, '系统管理', 0, 400, 'system', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-m', '吴同', '2024-05-06 06:12:17', '吴同', '2025-12-31 10:03:45', '系统管理目录');
INSERT INTO `system_menu` VALUES (3, '系统工具', 0, 600, 'tool', NULL, NULL, 1, 0, NULL, 'M', '0', '0', '', 'system-tool', '吴同', '2024-05-06 06:12:17', '吴同', '2026-07-17 11:58:09', '系统工具目录');
INSERT INTO `system_menu` VALUES (2, '系统监控', 0, 700, 'monitor', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-watch', '吴同', '2024-05-06 06:12:17', '吴同', '2025-12-31 10:04:15', '系统监控目录');



INSERT INTO `system_role_menu` VALUES (2, 2317);
INSERT INTO `system_role_menu` VALUES (2, 2318);
INSERT INTO `system_role_menu` VALUES (2, 2333);
INSERT INTO `system_role_menu` VALUES (2, 2334);
INSERT INTO `system_role_menu` VALUES (2, 2335);
INSERT INTO `system_role_menu` VALUES (2, 2336);
INSERT INTO `system_role_menu` VALUES (2, 2337);

INSERT INTO `system_role_menu` VALUES (4, 2317);
INSERT INTO `system_role_menu` VALUES (4, 2318);
INSERT INTO `system_role_menu`  VALUES (4, 2319);
INSERT INTO `system_role_menu`  VALUES (4, 2320);
INSERT INTO `system_role_menu`  VALUES (4, 2321);
INSERT INTO `system_role_menu`  VALUES (4, 2322);
INSERT INTO `system_role_menu`  VALUES (4, 2323);
INSERT INTO `system_role_menu`  VALUES (4, 2324);
INSERT INTO `system_role_menu`  VALUES (4, 2325);
INSERT INTO `system_role_menu`  VALUES (4, 2326);
INSERT INTO `system_role_menu`  VALUES (4, 2327);
INSERT INTO `system_role_menu`  VALUES (4, 2328);
INSERT INTO `system_role_menu`  VALUES (4, 2329);
INSERT INTO `system_role_menu`  VALUES (4, 2330);
INSERT INTO `system_role_menu`  VALUES (4, 2331);
INSERT INTO `system_role_menu`  VALUES (4, 2332);
INSERT INTO `system_role_menu` VALUES (4, 2333);
INSERT INTO `system_role_menu` VALUES (4, 2334);
INSERT INTO `system_role_menu` VALUES (4, 2335);
INSERT INTO `system_role_menu` VALUES (4, 2336);
INSERT INTO `system_role_menu` VALUES (4, 2337);


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
