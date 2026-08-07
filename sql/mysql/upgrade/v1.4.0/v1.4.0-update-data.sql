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

INSERT INTO `system_notice` VALUES (18, 'qModel v1.4.0 正式发布', '2', 0x3C68313E3C7374726F6E673EF09F9A8020714D6F64656C20E5BC80E6BA90E789882076312E342E3020E69BB4E696B0E697A5E5BF973C2F7374726F6E673E3C2F68313E3C68323E3C7374726F6E673EF09FA7AD20E78988E69CACE6A682E8BFB03C2F7374726F6E673E3C2F68323E3C703EE69CACE6ACA1E78988E69CACE6A0B8E5BF83E696B0E5A29EE4B880E994AEE58F91E5B883415049E69C8DE58AA1E38081E585A8E993BEE8B7AFE8AEA1E7AE97E4BBBBE58AA1E38081E7A1ACE4BBB6E8B584E6BA90E79B91E68EA7E38081E7BB93E69E9CE58FAFE8A786E58C96E59B9BE5A4A7E6A0B8E5BF83E883BDE58A9BEFBC8CE68993E9809AE6A8A1E59E8BE5A496E983A8E8B083E794A8E5A381E59E92EFBC8CE5AE8CE59684E7AE97E6B395E4BBBBE58AA1E585A8E6B581E7A88BE58FAFE8BFBDE6BAAFE38081E58FAFE8A782E6B58BE883BDE58A9BE38082E5908CE697B6E5AE8CE68890E585A8E7AB995549E4BAA4E4BA92E6A087E58786E58C96E38081E59084E58A9FE883BDE6A8A1E59D97E4BC98E58C96E38081E7B3BBE7BB9F627567E4BFAEE5A48DE4B88EE8A784E88C83E7BB9FE4B880EFBC8CE5AFB9E9BD907144617461E38081714B6E6F77E4BAA7E59381E4BD93E7B3BBEFBC8CE5A4A7E5B985E68F90E58D87E5B9B3E58FB0E695B4E4BD93E680A7E4B88EE4BDBFE794A8E4BD93E9AA8CE380823C2F703E3C68323E3C7374726F6E673EF09F9BA020E4B8BBE8A681E69BB4E696B0E58685E5AEB93C2F7374726F6E673E3C2F68323E3C68333E3C7374726F6E673E31EFB88FE283A320E696B0E5A29EE6A8A1E59E8BE4B880E994AEE5AFB9E5A496415049E58F91E5B883E883BDE58A9B3C2F7374726F6E673E3C2F68333E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE2978F203C2F7370616E3EE694AFE68C81E5B7B2E58F91E5B883E6A8A1E59E8BE5AFB9E5A496E5BC80E694BEE8BF9CE7A88B415049E8B083E794A8EFBC8CE9858DE5A597E5B195E7A4BAE5AE8CE695B4E68EA5E58FA3E59CB0E59D80E38081E989B4E69D83E696B9E5BC8FE38081E8B083E794A8E58F82E695B0E4BFA1E681AFE380823C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE2978F203C2F7370616E3EE696B0E5A29EE5AF86E992A5E7AEA1E79086E58A9FE883BDEFBC8CE7BB9FE4B880E7AEA1E68EA7415049E8B083E794A8E69D83E99990EFBC8CE5AE9EE78EB0E6A8A1E59E8BE4B88EE7ACACE4B889E696B9E5B9B3E58FB0E4BA92E88194E4BA92E9809AEFBC8CE8A7A3E586B3E6A8A1E59E8BE4BB85E694AFE68C81E5B9B3E58FB0E58685E8B083E8AF95E79A84E7979BE782B9E380823C2F703E3C68333E3C7374726F6E673E32EFB88FE283A320E4B88AE7BABFE585A8E993BEE8B7AFE6A8A1E59E8BE8AEA1E7AE97E4BBBBE58AA1E4BD93E7B3BB3C2F7374726F6E673E3C2F68333E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE2978F203C2F7370616E3EE694AFE68C81E58FAFE8A786E58C96E5889BE5BBBAE6A8A1E59E8BE8AEA1E7AE97E4BBBBE58AA1EFBC8CE58FAFE887AAE4B8BBE585B3E88194E6A8A1E59E8BE38081E887AAE5AE9AE4B989E689A7E8A18CE7AD96E795A5E38081E7BB91E5AE9AE5AFB9E5BA94E695B0E68DAEE6BA90E58F82E695B0EFBC8CE98082E9858DE5A49AE7B1BBE4B89AE58AA1E59CBAE699AFE380823C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE2978F203C2F7370616E3EE690ADE5BBBAE5AE8CE695B4E4BBBBE58AA1E7AEA1E79086E4BD93E7B3BBEFBC8CE99B86E4B8ADE5B195E7A4BAE4BBBBE58AA1E8BF90E8A18CE78AB6E68081E38081E88097E697B6E7AD89E4BFA1E681AFEFBC8CE694AFE68C81E6A380E7B4A2E7AEA1E79086EFBC8CE585A8E7A88BE79599E5AD98E689A7E8A18CE8AEB0E5BD95EFBC8CE5AE9EE78EB0E4BBBBE58AA1E58FAFE8BFBDE6BAAFE380823C2F703E3C68333E3C7374726F6E673E33EFB88FE283A320E696B0E5A29EE8B584E6BA90E79B91E68EA7E4B88EE7BB93E69E9CE58FAFE8A786E58C96E883BDE58A9B3C2F7374726F6E673E3C2F68333E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE2978F203C2F7370616E3EE58685E7BDAEE8B7A8E5B9B3E58FB0E7A1ACE4BBB6E8B584E6BA90E79B91E68EA7E68EA2E99288EFBC8CE694AFE68C81E79B91E6B58B435055E38081E5B3B0E580BCE58685E5AD98E38081E689A7E8A18CE697B6E995BFE7AD89E6A0B8E5BF83E68C87E6A087EFBC8CE7B2BEE58786E8AF84E4BCB0E6A8A1E59E8BE8BF90E8A18CE680A7E883BDE380823C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE2978F203C2F7370616E3EE58D87E7BAA7E6A8A1E59E8BE8AEA1E7AE97E7BB93E69E9CE5B195E7A4BAE5BDA2E5BC8FEFBC8CE98787E794A8E58E9FE5A78BE695B0E68DAE2BE58FAFE8A786E58C96E58F8CE6A08FE59188E78EB0EFBC8CE694AFE68C81E59BBEE78987E38081E68A98E7BABFE59BBEE7AD89E58FAFE8A786E58C96E7BB84E4BBB6E887AAE5AE9AE4B989E9858DE7BDAEE38081E7BC96E8BE91E4B88EE7AEA1E79086EFBC8CE4BC98E58C96E695B0E68DAEE69FA5E79C8BE4BD93E9AA8CE380823C2F703E3C68333E3C7374726F6E673E34EFB88FE283A320E585A8E7AB99E6A087E58786E58C96E4BC98E58C96E4B88EE58A9FE883BDE8BFADE4BBA33C2F7374726F6E673E3C2F68333E3C703EE585A8E99DA2E5AFB9E9BD907144617461E38081714B6E6F77E4BAA7E59381E4BD93E7B3BBE8A784E88C83EFBC8CE5AE8CE68890E585A8E7AB995549E4BAA4E4BA92E6A087E58786E58C96E4BC98E58C96E38082E7BB9FE4B880E585A8E5B180E68C89E992AEE59BBEE6A087E38081E5BCB9E7AA97E6A0B7E5BC8FE38081E69687E5AD97E591BDE5908DE38081E9A1B5E99DA2E8BEB9E8B79DE7AD89E7BB86E88A82EFBC8CE8BFADE4BBA3E4BC98E58C96E9A696E9A1B5E38081E6A8A1E59E8BE79BB8E585B3E6A8A1E59D97E38081E585A8E983A8E7B3BBE7BB9FE7AEA1E79086E6A8A1E59D97EFBC8CE8A1A5E9BD90E9A1B5E99DA2E8AFA6E68385E38081E68E92E5BA8FE38081E69BB4E5A49AE6938DE4BD9CE7AD89E9809AE794A8E58A9FE883BDEFBC8CE5B9B3E58FB0E695B4E4BD93E7BB9FE4B880E680A7E5A4A7E5B985E68F90E58D87E380823C2F703E3C68333E3C7374726F6E673E35EFB88FE283A320E7B3BBE7BB9FE997AEE9A298E99B86E4B8ADE4BFAEE5A48DE4B88EE5BA95E5B182E4BC98E58C963C2F7374726F6E673E3C2F68333E3C703EE99B86E4B8ADE4BFAEE5A48DE5B9B3E58FB0E59084E7B1BBE5898DE7ABAFE6A0B7E5BC8FE38081E4BAA4E4BA92E68AA5E99499E997AEE9A298EFBC8CE4BC98E58C96E585ACE5918AE38081E682ACE6B5AEE7AA97E38081E4B8AAE4BABAE4B8ADE5BF83E7AD89E7BB86E88A82E4BD93E9AA8CE38082E6B885E79086E7B3BBE7BB9FE8848FE695B0E68DAEEFBC8CE8A784E695B4E8B7AFE794B1E38081E68EA5E58FA3E38081E99D99E68081E8B584E6BA90E7AD89E5BA95E5B182E9858DE7BDAEEFBC8CE4BFAEE5A48DE4B88AE4BCA0E695B0E68DAEE7BC96E7A081E38081E9A1B5E99DA2E6BB9AE58AA8E38081E5BCB9E7AA97E99499E4B9B1E7AD89E997AEE9A298EFBC8CE585A8E696B9E4BD8DE68F90E58D87E7B3BBE7BB9FE8BF90E8A18CE7A8B3E5AE9AE680A7E380823C2F703E3C68323E3C7374726F6E673EF09F938C20E78988E69CACE680BBE7BB933C2F7374726F6E673E3C2F68323E3C703E714D6F64656C20E5BC80E6BA90E789882076312E342E3020E8A1A5E9BD90E4BA86E6A8A1E59E8BE5AFB9E5A496E69C8DE58AA1E38081E585A8E993BEE8B7AFE8AEA1E7AE97E38081E680A7E883BDE79B91E68EA7E38081E695B0E68DAEE58FAFE8A786E58C96E6A0B8E5BF83E883BDE58A9BEFBC8CE69E84E5BBBAE8B5B7E58FAFE8B083E5BAA6E38081E58FAFE689A7E8A18CE38081E58FAFE8BFBDE6BAAFE38081E58FAFE8A782E6B58BE79A84E7AE97E6B395E8BF90E8A18CE997ADE78EAFEFBC8CE8AEA9E7AE97E6B395E6A8A1E59E8BE79C9FE6ADA3E890BDE59CB0E58FAFE794A8E38082E5908CE697B6E5AE8CE68890E585A8E7AB99E6A087E58786E58C96E7BB9FE4B880E4B88EE997AEE9A298E695B4E694B9EFBC8CE5AE9EE78EB0E4BAA7E59381E4BD93E9AA8CE38081E58A9FE883BDE5AE8CE695B4E680A7E38081E7B3BBE7BB9FE7A8B3E5AE9AE680A7E585A8E696B9E4BD8DE58D87E7BAA7E380823C2F703E, '0', '超级管理员', '2026-08-07 18:32:35', NULL, NULL, NULL);
