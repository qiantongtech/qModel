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

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


CREATE DATABASE IF NOT EXISTS qmodel_demo
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
USE qmodel_demo;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (121, 'MODEL', '模型管理', NULL, NULL, 'Model', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'model', 'model', '模型管理', 'qModel', '0', '/', '{\"parentMenuId\":\"2243\"}', 'qModel', '2026-01-06 16:08:28', NULL, '2026-01-07 08:53:26', NULL);
INSERT INTO `gen_table` VALUES (123, 'MODEL_CLASSIFY', '模型分类', NULL, NULL, 'ModelClassify', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'classify', 'Classify', '模型分类', 'qModel', '0', '/', '{\"parentMenuId\":\"2244\"}', 'qModel', '2026-01-07 10:12:55', NULL, '2026-01-07 10:25:22', NULL);
INSERT INTO `gen_table` VALUES (127, 'MODEL_HISTORY', '模型历史', NULL, NULL, 'ModelHistory', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'history', 'Hhistory', '模型历史', 'qModel', '0', '/', '{\"parentMenuId\":2245}', 'qModel', '2026-01-09 13:22:19', NULL, '2026-01-09 13:23:22', NULL);
INSERT INTO `gen_table` VALUES (129, 'MODEL_INPUT', '模型输入管理', NULL, NULL, 'ModelInput', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'input', 'Input', '模型输入管理', 'qModel', '0', '/', '{\"parentMenuId\":2246}', 'qModel', '2026-01-09 13:54:01', NULL, '2026-01-09 13:56:29', NULL);
INSERT INTO `gen_table` VALUES (130, 'MODEL_OUTPUT', '模型输入管理', NULL, NULL, 'ModelOutput', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'output', 'Output', '模型输出管理', 'qModel', '0', '/', '{\"parentMenuId\":\"2247\"}', 'qModel', '2026-01-09 13:54:04', NULL, '2026-01-09 13:59:54', NULL);
INSERT INTO `gen_table` VALUES (131, 'MODEL_OPERATE', '模型历史管理', NULL, NULL, 'ModelOperate', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'operate', 'Operate', '模型历史管理', 'qModel', '0', '/', '{\"parentMenuId\":2249}', 'qModel', '2026-01-09 16:43:44', NULL, '2026-01-09 16:45:07', NULL);
INSERT INTO `gen_table` VALUES (132, 'MODEL_INTERFACE_ADDRESS', '接口地址', NULL, NULL, 'ModelInterfaceAddress', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'interfaceAddress', 'interfaceAddress', '接口地址', 'qModel', '0', '/', '{\"parentMenuId\":\"2248\"}', 'qModel', '2026-01-09 17:20:25', NULL, '2026-01-09 17:26:02', NULL);
INSERT INTO `gen_table` VALUES (133, 'MODEL_VERSION', '版本管理', NULL, NULL, 'ModelVersion', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'version', 'version', '版本管理', 'qModel', '0', '/', '{\"parentMenuId\":2248}', 'qModel', '2026-01-09 17:20:55', NULL, '2026-01-09 17:26:46', NULL);
INSERT INTO `gen_table` VALUES (135, 'MODEL_RECONSTITUTION', '模型库重构表', NULL, NULL, 'ModelReconstitution', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'modelReconstitution', 'modelReconstitution', '模型库重构', 'qModel', '0', '/', '{\"parentMenuId\":2245}', 'qModel', '2026-01-12 11:59:18', NULL, '2026-01-12 12:04:33', NULL);
INSERT INTO `gen_table` VALUES (136, 'MODEL_CACL_RECONSTITUTION', '模型计算重构表', NULL, NULL, 'ModelCacl', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.model', 'modelCacl', 'modelCacl', '模型计算重构', 'qModel', '0', '/', '{\"parentMenuId\":2248}', 'qModel', '2026-01-12 13:34:59', NULL, '2026-01-12 13:38:49', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (2182, 136, 'ID', '主键id', 'INTEGER', 'Long', 'ID', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:49');
INSERT INTO `gen_table_column` VALUES (2183, 136, 'COMPANY_ID', '企业id', 'INTEGER', 'Long', 'companyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 2, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:49');
INSERT INTO `gen_table_column` VALUES (2184, 136, 'CODE', '计算编码', 'VARCHAR2', 'String', 'CODE', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 3, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:49');
INSERT INTO `gen_table_column` VALUES (2185, 136, 'NAME', '计算名称', 'VARCHAR2', 'String', 'NAME', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', NULL, 4, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:49');
INSERT INTO `gen_table_column` VALUES (2186, 136, 'MODEL_ID', '模型id', 'INTEGER', 'Long', 'modelId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 5, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2187, 136, 'MODEL_NAME', '模型名称', 'VARCHAR2', 'String', 'modelName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', NULL, 6, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2188, 136, 'MODEL_VERSION', '模型版本', 'VARCHAR2', 'String', 'modelVersion', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 7, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2189, 136, 'START_TIME', '开始时间', 'DATETIME', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', NULL, 8, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2190, 136, 'END_TIME', '结束时间', 'DATETIME', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', NULL, 9, 'qModel', '2026-01-12 13:35:00', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2191, 136, 'STATUS', '计算状态', 'INTEGER', 'Long', 'STATUS', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', NULL, 10, 'qModel', '2026-01-12 13:35:01', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2192, 136, 'INPUT_CONTENT', '模型输入内容', 'VARCHAR2', 'String', 'inputContent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', NULL, 11, 'qModel', '2026-01-12 13:35:01', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2193, 136, 'OUTPUT_CONTENT', '模型输出内容', 'VARCHAR2', 'String', 'outputContent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', NULL, 12, 'qModel', '2026-01-12 13:35:01', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2194, 136, 'VALID_FLAG', '是否有效 0：无效，1：有效', 'INTEGER', 'Boolean', 'validFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 13, 'qModel', '2026-01-12 13:35:01', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2195, 136, 'DEL_FLAG', '删除标志 1：已删除，0：未删除', 'INTEGER', 'Boolean', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 14, 'qModel', '2026-01-12 13:35:01', NULL, '2026-01-12 13:38:50');
INSERT INTO `gen_table_column` VALUES (2196, 136, 'CREATE_BY', '创建人', 'VARCHAR2', 'String', 'createBy', '0', '0', '0', '1', NULL, '1', NULL, 'EQ', 'input', NULL, 15, 'qModel', '2026-01-12 13:35:01', NULL, '2026-01-12 13:38:51');
INSERT INTO `gen_table_column` VALUES (2197, 136, 'CREATOR_ID', '创建人id', 'INTEGER', 'Long', 'creatorId', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 16, 'qModel', '2026-01-12 13:35:01', NULL, '2026-01-12 13:38:51');
INSERT INTO `gen_table_column` VALUES (2198, 136, 'CREATE_TIME', '创建时间', 'DATETIME', 'Date', 'createTime', '0', '0', '0', '1', NULL, '1', '1', 'EQ', 'datetime', NULL, 17, 'qModel', '2026-01-12 13:35:01', NULL, '2026-01-12 13:38:51');
INSERT INTO `gen_table_column` VALUES (2199, 136, 'UPDATE_BY', '更新人', 'VARCHAR2', 'String', 'updateBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 18, 'qModel', '2026-01-12 13:35:02', NULL, '2026-01-12 13:38:51');
INSERT INTO `gen_table_column` VALUES (2200, 136, 'UPDATOR_ID', '更新人id', 'INTEGER', 'Long', 'updatorId', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 19, 'qModel', '2026-01-12 13:35:02', NULL, '2026-01-12 13:38:51');
INSERT INTO `gen_table_column` VALUES (2201, 136, 'UPDATE_TIME', '更新时间', 'DATETIME', 'Date', 'updateTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 20, 'qModel', '2026-01-12 13:35:02', NULL, '2026-01-12 13:38:51');
INSERT INTO `gen_table_column` VALUES (2202, 136, 'REMARK', '备注', 'VARCHAR2', 'String', 'REMARK', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', NULL, 21, 'qModel', '2026-01-12 13:35:02', NULL, '2026-01-12 13:38:51');
INSERT INTO `gen_table_column` VALUES (2203, 136, 'ADDRESS_ID', '文件或接口地址id', 'INTEGER', 'Long', 'addressId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 22, 'qModel', '2026-01-12 13:35:02', NULL, '2026-01-12 13:38:51');
INSERT INTO `gen_table_column` VALUES (2204, 136, 'ADDRESS_TYPE', '判断是文件的id还是地址的id，0:文件，1：接口', 'INTEGER', 'Long', 'addressType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', NULL, 23, 'qModel', '2026-01-12 13:35:02', NULL, '2026-01-12 13:38:52');
INSERT INTO `gen_table_column` VALUES (2205, 136, 'MP_PROGRAMME_ID', '文件计算的历史方案id', 'INTEGER', 'Long', 'mpProgrammeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 24, 'qModel', '2026-01-12 13:35:02', NULL, '2026-01-12 13:38:52');


-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数键值',
  `config_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-06 06:12:18', NULL, NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `system_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-06 06:12:18', NULL, NULL, '初始化密码 123456');
INSERT INTO `system_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-06 06:12:18', NULL, NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `system_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-05-06 06:12:18', NULL, NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `system_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-06 06:12:18', NULL, NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `system_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '-', 'Y', 'admin', '2024-05-06 06:12:18', 'admin', '2024-11-26 15:51:27', '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for system_content
-- ----------------------------
DROP TABLE IF EXISTS `system_content`;
CREATE TABLE `system_content` (
  `id` int(11) NOT NULL COMMENT 'id',
  `sys_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系统名称',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系统logo',
  `login_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录页面logo',
  `carousel_image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '轮播图',
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `copyright` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '版权方',
  `record_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备案号',
  `del_flag` int(11) NULL DEFAULT NULL COMMENT '删除标记',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `updator_id` int(11) NULL DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_content
-- ----------------------------
INSERT INTO `system_content` VALUES (1, NULL, NULL, NULL, NULL, '400-660-8208', 'support@qiantong.tech', 'Copyright© 2026 江苏干桐科技有限公司 版权所有', '苏ICP备2022008519号-3', 0, NULL, NULL, NULL, NULL, '小桐', 1, '2025-12-31 11:56:30', NULL);

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门状态（0正常 1停用）',
  `del_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept` VALUES (100, 0, '0', '千桐科技', 0, '千桐', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-10-29 16:51:32');
INSERT INTO `system_dept` VALUES (101, 100, '0,100', '南京总公司', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 13:46:24');
INSERT INTO `system_dept` VALUES (102, 100, '0,100', '郑州分公司', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 13:46:44');
INSERT INTO `system_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', NULL, NULL);
INSERT INTO `system_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', NULL, NULL);
INSERT INTO `system_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', NULL, NULL);
INSERT INTO `system_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', NULL, NULL);
INSERT INTO `system_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:50:19');
INSERT INTO `system_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', NULL, NULL);
INSERT INTO `system_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', NULL, NULL);

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_data`;
CREATE TABLE `system_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT NULL COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否默认（Y是 N否）',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
INSERT INTO `system_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', NULL, NULL, 'Y', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '性别男');
INSERT INTO `system_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', NULL, NULL, 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '性别女');
INSERT INTO `system_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', NULL, NULL, 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '性别未知');
INSERT INTO `system_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', NULL, 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '显示菜单');
INSERT INTO `system_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '隐藏菜单');
INSERT INTO `system_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', NULL, 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '正常状态');
INSERT INTO `system_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '停用状态');
INSERT INTO `system_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', NULL, 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '正常状态');
INSERT INTO `system_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '停用状态');
INSERT INTO `system_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', NULL, NULL, 'Y', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '默认分组');
INSERT INTO `system_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', NULL, NULL, 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '系统分组');
INSERT INTO `system_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', NULL, 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '系统默认是');
INSERT INTO `system_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '系统默认否');
INSERT INTO `system_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', NULL, 'warning', 'Y', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '通知');
INSERT INTO `system_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', NULL, 'success', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '公告');
INSERT INTO `system_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', NULL, 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '正常状态');
INSERT INTO `system_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '关闭状态');
INSERT INTO `system_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '其他操作');
INSERT INTO `system_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '新增操作');
INSERT INTO `system_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '修改操作');
INSERT INTO `system_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '删除操作');
INSERT INTO `system_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', NULL, 'primary', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '授权操作');
INSERT INTO `system_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '导出操作');
INSERT INTO `system_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '导入操作');
INSERT INTO `system_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '强退操作');
INSERT INTO `system_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '生成操作');
INSERT INTO `system_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '清空操作');
INSERT INTO `system_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', NULL, 'primary', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '正常状态');
INSERT INTO `system_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', NULL, 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '停用状态');
INSERT INTO `system_dict_data` VALUES (30, 0, 'Web', '0', 'auth_app_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-31 14:27:22', 'admin', '2024-08-31 14:27:31', NULL);
INSERT INTO `system_dict_data` VALUES (31, 1, 'App', '1', 'auth_app_type', NULL, 'info', 'N', '0', 'admin', '2024-08-31 14:27:47', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (32, 2, '小程序', '2', 'auth_app_type', NULL, 'warning', 'N', '0', 'admin', '2024-08-31 14:28:06', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (33, 1, '有效', '1', 'sys_valid', NULL, 'success', 'N', '0', 'admin', '2024-08-31 15:33:49', 'admin', '2024-08-31 15:34:08', NULL);
INSERT INTO `system_dict_data` VALUES (34, 0, '无效', '0', 'sys_valid', NULL, 'danger', 'N', '0', 'admin', '2024-08-31 15:34:21', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (35, 0, '非公开', '0', 'auth_public', NULL, 'warning', 'N', '0', 'admin', '2024-08-31 15:36:48', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (36, 1, '公开', '1', 'auth_public', NULL, 'success', 'N', '0', 'admin', '2024-08-31 15:36:59', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (37, 0, '通知', '0', 'message_category', NULL, 'success', 'N', '0', 'admin', '2024-11-07 14:28:29', 'admin', '2024-12-19 14:19:58', NULL);
INSERT INTO `system_dict_data` VALUES (38, 0, '重要', '0', 'message_level', NULL, 'default', 'N', '0', 'admin', '2024-11-07 14:28:42', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (39, 2, '审批', '2', 'message_category', NULL, 'warning', 'N', '0', 'admin', '2024-11-19 14:20:42', 'admin', '2024-11-19 16:55:16', NULL);
INSERT INTO `system_dict_data` VALUES (41, 3, '其他', '3', 'message_category', NULL, 'info', 'N', '0', 'admin', '2024-11-19 14:21:12', 'admin', '2024-12-19 14:19:31', NULL);
INSERT INTO `system_dict_data` VALUES (42, 1, '公告', '1', 'message_category', NULL, 'primary', 'N', '0', 'admin', '2024-11-19 16:54:18', 'admin', '2024-11-19 16:55:05', NULL);
INSERT INTO `system_dict_data` VALUES (43, 0, '是', 'true', 'sys_boolean', NULL, 'success', 'N', '0', 'admin', '2024-12-03 15:46:40', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (44, 0, '否', 'false', 'sys_boolean', NULL, 'danger', 'N', '0', 'admin', '2024-12-03 15:46:57', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (45, 1, '一般', '1', 'message_level', NULL, 'info', 'N', '0', 'admin', '2024-12-25 16:21:09', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (46, 2, '警告', '2', 'message_level', NULL, 'warning', 'N', '0', 'admin', '2024-12-25 16:21:30', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (54, 1, '无关紧要(0-60)', '1', 'project_priority', NULL, 'info', 'N', '0', 'admin', '2025-01-03 13:20:35', 'admin', '2025-01-16 11:38:15', NULL);
INSERT INTO `system_dict_data` VALUES (55, 2, '低(60-80)', '2', 'project_priority', NULL, 'info', 'N', '0', 'admin', '2025-01-03 13:20:56', 'bf2', '2025-01-21 10:50:59', NULL);
INSERT INTO `system_dict_data` VALUES (56, 3, '中(80-90)', '3', 'project_priority', NULL, 'primary', 'N', '0', 'admin', '2025-01-03 13:21:11', 'bf2', '2025-01-21 10:51:35', NULL);
INSERT INTO `system_dict_data` VALUES (57, 4, '高(90-100)', '4', 'project_priority', NULL, 'success', 'N', '0', 'admin', '2025-01-03 13:21:25', 'bf2', '2025-01-21 10:51:38', NULL);
INSERT INTO `system_dict_data` VALUES (90, 0, '水量调度', '1', 'model_type', NULL, 'default', 'N', '0', 'admin', '2025-11-14 17:04:57', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (91, 1, '水动力', '2', 'model_type', NULL, 'default', 'N', '0', 'admin', '2025-11-14 17:05:06', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (92, 2, '设备安全', '3', 'model_type', NULL, 'default', 'N', '0', 'admin', '2025-11-14 17:05:13', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (93, 0, '单值', '0', 'model_input_param_type', NULL, 'default', 'N', '0', 'admin', '2025-11-17 04:24:22', 'admin', '2025-11-17 04:27:48', NULL);
INSERT INTO `system_dict_data` VALUES (94, 1, '多列数值', '1', 'model_input_param_type', NULL, 'default', 'N', '0', 'admin', '2025-11-17 04:24:29', 'admin', '2025-11-17 04:27:53', NULL);
INSERT INTO `system_dict_data` VALUES (95, 2, '文件', '2', 'model_input_param_type', NULL, 'default', 'N', '0', 'admin', '2025-11-17 04:24:35', 'admin', '2025-11-17 04:27:59', NULL);
INSERT INTO `system_dict_data` VALUES (96, 0, '成功', '1', 'calculation_status', NULL, 'success', 'N', '0', '小桐', '2025-12-31 15:24:38', '小桐2', '2026-01-26 09:35:30', NULL);
INSERT INTO `system_dict_data` VALUES (97, 0, '失败', '0', 'calculation_status', NULL, 'danger', 'N', '0', '小桐', '2025-12-31 15:24:46', '小桐2', '2026-01-26 09:35:37', NULL);
INSERT INTO `system_dict_data` VALUES (98, 0, 'get', '0', 'model_access_mode', NULL, 'primary', 'N', '0', '小桐', '2026-01-20 15:35:38', '小桐', '2026-01-21 14:23:31', NULL);
INSERT INTO `system_dict_data` VALUES (99, 1, 'post', '1', 'model_access_mode', NULL, 'warning', 'N', '0', '小桐', '2026-01-20 15:35:56', '小桐', '2026-01-21 14:23:42', NULL);
INSERT INTO `system_dict_data` VALUES (100, 2, 'put', '2', 'model_access_mode', NULL, 'warning', 'N', '0', '小桐', '2026-01-20 15:36:08', '小桐', '2026-01-21 14:24:40', NULL);
INSERT INTO `system_dict_data` VALUES (101, 3, 'delete', '3', 'model_access_mode', NULL, 'danger', 'N', '0', '小桐', '2026-01-20 15:36:20', '小桐', '2026-01-21 14:23:52', NULL);
INSERT INTO `system_dict_data` VALUES (102, 0, 'API', 'API', 'model_access_type', NULL, 'warning', 'Y', '0', 'admin', '2026-07-07 14:14:33', 'qModel', '2026-07-16 09:42:13', 'API接口接入');
INSERT INTO `system_dict_data` VALUES (103, 1, 'Python', 'PYTHON', 'model_access_type', NULL, 'info', 'N', '0', 'admin', '2026-07-07 14:14:33', '小桐', '2026-07-09 19:03:47', 'Python本地接入');
INSERT INTO `system_dict_data` VALUES (104, 0, 'application/json', 'application/json', 'content_type', NULL, 'primary', 'Y', '0', 'admin', '2026-07-07 14:14:33', NULL, NULL, 'application/json');
INSERT INTO `system_dict_data` VALUES (105, 1, 'application/x-www-form-urlencoded', 'application/x-www-form-urlencoded', 'content_type', NULL, 'warning', 'N', '0', 'admin', '2026-07-07 14:14:33', NULL, NULL, 'application/x-www-form-urlencoded');
INSERT INTO `system_dict_data` VALUES (106, 2, 'multipart/form-data', 'multipart/form-data', 'content_type', NULL, 'info', 'N', '0', 'admin', '2026-07-07 14:14:33', NULL, NULL, 'multipart/form-data');
INSERT INTO `system_dict_data` VALUES (107, 3, 'text/plain', 'text/plain', 'content_type', NULL, 'info', 'N', '0', 'admin', '2026-07-07 14:14:33', NULL, NULL, 'text/plain');
INSERT INTO `system_dict_data` VALUES (108, 0, '无', 'NONE', 'auth_type', NULL, 'info', 'Y', '0', 'admin', '2026-07-07 14:14:33', NULL, NULL, '无鉴权');
INSERT INTO `system_dict_data` VALUES (109, 1, '固定Token', 'FIXED', 'auth_type', NULL, 'primary', 'N', '0', 'admin', '2026-07-07 14:14:33', NULL, NULL, '固定Token/APIKey');
INSERT INTO `system_dict_data` VALUES (110, 2, '动态Token', 'DYNAMIC', 'auth_type', NULL, 'warning', 'N', '0', 'admin', '2026-07-07 14:14:33', NULL, NULL, '动态Token API');
INSERT INTO `system_dict_data` VALUES (111, 0, 'Header', 'Header', 'auth_inject_position', NULL, 'primary', 'Y', '0', 'admin', '2026-07-07 14:14:33', '小桐', '2026-07-10 11:08:03', '注入请求头');
INSERT INTO `system_dict_data` VALUES (112, 1, 'Query', 'Query', 'auth_inject_position', NULL, 'warning', 'N', '0', 'admin', '2026-07-07 14:14:33', NULL, NULL, '注入URL参数');

INSERT INTO `system_dict_data` VALUES (113, 0, '执行中', '0', 'invoke_history_status', NULL, 'primary', NULL, '0', 'qModel', '2026-07-15 13:52:58', 'qModel', '2026-07-15 13:54:15', NULL);
INSERT INTO `system_dict_data` VALUES (114, 0, '成功', '1', 'invoke_history_status', NULL, 'success', NULL, '0', 'qModel', '2026-07-15 13:53:05', 'qModel', '2026-07-15 13:53:11', NULL);
INSERT INTO `system_dict_data` VALUES (115, 0, '失败', '2', 'invoke_history_status', NULL, 'danger', NULL, '0', 'qModel', '2026-07-15 13:53:26', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (116, 3, '超时', '3', 'invoke_history_status', NULL, 'warning', NULL, '0', 'qModel', '2026-07-15 13:53:37', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (117, 4, '参数校验阻塞', '4', 'invoke_history_status', NULL, 'info', NULL, '0', 'qModel', '2026-07-15 13:53:59', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (118, 0, '在线测试', '1', 'invoke_type', NULL, 'primary', NULL, '0', 'qModel', '2026-07-15 13:56:42', 'qModel', '2026-07-15 13:56:48', NULL);
INSERT INTO `system_dict_data` VALUES (119, 0, '网关服务', '2', 'invoke_type', NULL, 'info', NULL, '0', 'qModel', '2026-07-15 13:57:00', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (120, 0, '待执行', '0', 'build_status', NULL, 'primary', NULL, '0', 'qModel', '2026-07-15 14:32:14', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (121, 1, '执行中', '1', 'build_status', NULL, 'info', NULL, '0', 'qModel', '2026-07-15 14:32:30', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (122, 2, '成功', '2', 'build_status', NULL, 'success', NULL, '0', 'qModel', '2026-07-15 14:32:47', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (123, 3, '失败', '3', 'build_status', NULL, 'danger', NULL, '0', 'qModel', '2026-07-15 14:32:57', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_type`;
CREATE TABLE `system_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典类型',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
INSERT INTO `system_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-06 06:12:18', 'admin', '2024-11-26 15:51:04', '用户性别列表');
INSERT INTO `system_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '菜单状态列表');
INSERT INTO `system_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '系统开关列表');
INSERT INTO `system_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '任务状态列表');
INSERT INTO `system_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '任务分组列表');
INSERT INTO `system_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '系统是否列表');
INSERT INTO `system_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '通知类型列表');
INSERT INTO `system_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '通知状态列表');
INSERT INTO `system_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '操作类型列表');
INSERT INTO `system_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-06 06:12:18', NULL, NULL, '登录状态列表');
INSERT INTO `system_dict_type` VALUES (11, '应用类型', 'auth_app_type', '0', 'admin', '2024-08-31 14:27:03', NULL, NULL, '应用类型列表');
INSERT INTO `system_dict_type` VALUES (12, '是否有效', 'sys_valid', '0', 'admin', '2024-08-31 15:33:08', 'admin', '2024-08-31 15:36:13', '系统有效列表');
INSERT INTO `system_dict_type` VALUES (13, '是否公开', 'auth_public', '0', 'admin', '2024-08-31 15:35:49', 'admin', '2024-08-31 15:36:00', '应用是否公开');
INSERT INTO `system_dict_type` VALUES (14, '消息类型', 'message_category', '0', 'admin', '2024-11-07 14:27:58', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (15, '消息等级', 'message_level', '0', 'admin', '2024-11-07 14:28:09', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (16, '布尔值字典', 'sys_boolean', '0', 'admin', '2024-12-03 15:46:14', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (19, '优先级', 'project_priority', '0', 'admin', '2025-01-03 13:20:13', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (27, '模型类型', 'model_type', '0', 'admin', '2025-11-14 17:04:22', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (28, '模型输入类型', 'model_input_param_type', '0', 'admin', '2025-11-17 04:24:11', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (29, '模型计算状态', 'calculation_status', '0', '小桐', '2025-12-31 15:24:22', NULL, NULL, NULL);
INSERT INTO `system_dict_type` VALUES (30, '请求方式', 'model_access_mode', '0', '小桐', '2026-01-20 15:35:11', NULL, NULL, '模型API接口请求方式');
INSERT INTO `system_dict_type` VALUES (31, '模型接入方式', 'model_access_type', '0', 'admin', '2026-07-07 14:14:22', NULL, NULL, '模型接入方式');
INSERT INTO `system_dict_type` VALUES (32, '请求内容类型', 'content_type', '0', 'admin', '2026-07-07 14:14:22', NULL, NULL, '模型API请求内容类型');
INSERT INTO `system_dict_type` VALUES (33, '鉴权类型', 'auth_type', '0', 'admin', '2026-07-07 14:14:22', NULL, NULL, '模型API鉴权类型');
INSERT INTO `system_dict_type` VALUES (34, '鉴权注入位置', 'auth_inject_position', '0', 'admin', '2026-07-07 14:14:22', NULL, NULL, '鉴权Token注入位置');
INSERT INTO `system_dict_type` VALUES (35, '模型调用历史状态', 'invoke_history_status', '0', 'qModel', '2026-07-15 13:52:32', NULL, NULL, '0=执行中，1=成功，2=失败，3=超时，4=参数校验阻塞');
INSERT INTO `system_dict_type` VALUES (36, '模型调用方式', 'invoke_type', '0', 'qModel', '2026-07-15 13:56:22', NULL, NULL, '调用类型;1=在线测试，2=网关服务');
INSERT INTO `system_dict_type` VALUES (37, '依赖、容器构建状态', 'build_status', '0', 'qModel', '2026-07-15 14:31:50', NULL, NULL, '构建状态;构建状态：0=待执行，1=执行中，2=成功，3=失败');

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE IF EXISTS `system_job`;
CREATE TABLE `system_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否并发执行（0允许 1禁止）',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_job
-- ----------------------------
INSERT INTO `system_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'qModelTask.qModelNoParams', '0/10 * * * * ?', '3', '1', '1', '小桐', '2024-12-03 09:27:24', NULL, '2025-08-29 15:06:47', NULL);
INSERT INTO `system_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'qModelTask.qModelParams(\'qModel\')', '0/15 * * * * ?', '3', '1', '1', '小桐', '2024-12-03 09:27:24', NULL, NULL, NULL);
INSERT INTO `system_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'qModelTask.qModelMultipleParams(\'qModel\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', '小桐', '2024-12-03 09:27:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_job_log
-- ----------------------------
DROP TABLE IF EXISTS `system_job_log`;
CREATE TABLE `system_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `system_logininfor`;
CREATE TABLE `system_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作系统',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1505 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_logininfor
-- ----------------------------
INSERT INTO `system_logininfor` VALUES (1499, 'qModel', '127.0.0.1', '内网IP', 'Chrome 15', 'Windows 10', '0', '登录成功', '2026-07-06 17:32:11');
INSERT INTO `system_logininfor` VALUES (1500, 'qModel', '127.0.0.1', '内网IP', 'Chrome 15', 'Windows 10', '0', '登录成功', '2026-07-07 09:25:49');
INSERT INTO `system_logininfor` VALUES (1501, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-07 09:44:16');
INSERT INTO `system_logininfor` VALUES (1502, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-07 13:46:01');
INSERT INTO `system_logininfor` VALUES (1503, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-07 14:34:47');
INSERT INTO `system_logininfor` VALUES (1504, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-07 17:17:25');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
                                `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                                `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
                                `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单ID',
                                `order_num` int NULL DEFAULT NULL COMMENT '显示顺序',
                                `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由地址',
                                `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
                                `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由参数',
                                `is_frame` int NULL DEFAULT NULL COMMENT '是否为外链（0是 1否）',
                                `is_cache` int NULL DEFAULT NULL COMMENT '是否缓存（0缓存 1不缓存）',
                                `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由名称',
                                `menu_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单类型（M目录 C菜单 F按钮）',
                                `visible` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单状态（0显示 1隐藏）',
                                `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单状态（0正常 1停用）',
                                `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
                                `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单图标',
                                `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                                PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2317 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, '系统管理', 0, 40, 'system', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-m', 'admin', '2024-05-06 06:12:17', '小桐', '2025-12-31 10:03:45', '系统管理目录');
INSERT INTO `system_menu` VALUES (2, '系统监控', 0, 70, 'monitor', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-watch', 'admin', '2024-05-06 06:12:17', '小桐', '2025-12-31 10:04:15', '系统监控目录');
INSERT INTO `system_menu` VALUES (3, '系统工具', 0, 60, 'tool', NULL, NULL, 1, 0, NULL, 'M', '0', '0', '', 'system-tool', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-07-17 11:58:09', '系统工具目录');
INSERT INTO `system_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/system/user/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:13', '用户管理菜单');
INSERT INTO `system_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/system/role/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:36', '角色管理菜单');
INSERT INTO `system_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/system/menu/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 15:44:30', '菜单管理菜单');
INSERT INTO `system_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/system/dept/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:49', '部门管理菜单');
INSERT INTO `system_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/system/post/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-06 06:12:17', NULL, NULL, '岗位管理菜单');
INSERT INTO `system_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/system/dict/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-07-15 13:51:02', '字典管理菜单');
INSERT INTO `system_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/system/config/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-05-06 06:12:17', '超级管理员', '2026-07-21 10:22:19', '参数设置菜单');
INSERT INTO `system_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/system/notice/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-06 06:12:17', NULL, NULL, '通知公告菜单');
INSERT INTO `system_menu` VALUES (108, '日志管理', 1, 9, 'log', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'log', 'admin', '2024-05-06 06:12:17', NULL, NULL, '日志管理菜单');
INSERT INTO `system_menu` VALUES (109, '在线用户', 2, 1, 'online', 'system/monitor/online/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-06 06:12:17', NULL, NULL, '在线用户菜单');
INSERT INTO `system_menu` VALUES (110, '定时任务', 2, 2, 'job', 'system/monitor/job/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-07-07 17:23:25', '定时任务菜单');
INSERT INTO `system_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'system/monitor/druid/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-07-20 15:12:49', '数据监控菜单');
INSERT INTO `system_menu` VALUES (112, '服务监控', 2, 4, 'server', 'system/monitor/server/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-06 06:12:17', NULL, NULL, '服务监控菜单');
INSERT INTO `system_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'system/monitor/cache/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-06 06:12:17', NULL, NULL, '缓存监控菜单');
INSERT INTO `system_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'system/monitor/cache/list', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-06 06:12:17', NULL, NULL, '缓存列表菜单');
INSERT INTO `system_menu` VALUES (115, '表单构建', 3, 1, 'build', 'system/tool/build/index', NULL, 1, 0, NULL, 'C', '1', '1', 'tool:build:list', 'build', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 13:34:05', '表单构建菜单');
INSERT INTO `system_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'system/tool/gen/index', NULL, 1, 0, NULL, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-07-17 11:58:30', '代码生成菜单');
INSERT INTO `system_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'system/tool/swagger/index', NULL, 1, 0, NULL, 'C', '1', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 13:34:54', '系统接口菜单');
INSERT INTO `system_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/monitor/operlog/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-05-06 06:12:17', NULL, NULL, '操作日志菜单');
INSERT INTO `system_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/monitor/logininfor/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-05-06 06:12:17', NULL, NULL, '登录日志菜单');
INSERT INTO `system_menu` VALUES (1000, '用户查询', 100, 1, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1001, '用户新增', 100, 2, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1002, '用户修改', 100, 3, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1003, '用户删除', 100, 4, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1004, '用户导出', 100, 5, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1005, '用户导入', 100, 6, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1006, '重置密码', 100, 7, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1007, '角色查询', 101, 1, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1008, '角色新增', 101, 2, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1009, '角色修改', 101, 3, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1010, '角色删除', 101, 4, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1011, '角色导出', 101, 5, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1012, '菜单查询', 102, 1, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1013, '菜单新增', 102, 2, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1014, '菜单修改', 102, 3, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1015, '菜单删除', 102, 4, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1016, '部门查询', 103, 1, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1017, '部门新增', 103, 2, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1018, '部门修改', 103, 3, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1019, '部门删除', 103, 4, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1020, '岗位查询', 104, 1, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1021, '岗位新增', 104, 2, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1022, '岗位修改', 104, 3, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1023, '岗位删除', 104, 4, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1024, '岗位导出', 104, 5, NULL, NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1025, '字典查询', 105, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1026, '字典新增', 105, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1027, '字典修改', 105, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1028, '字典删除', 105, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1029, '字典导出', 105, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1030, '参数查询', 106, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1031, '参数新增', 106, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1032, '参数修改', 106, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1033, '参数删除', 106, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1034, '参数导出', 106, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1035, '公告查询', 107, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1036, '公告新增', 107, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1037, '公告修改', 107, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1038, '公告删除', 107, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1039, '操作查询', 500, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1040, '操作删除', 500, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1041, '日志导出', 500, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1042, '登录查询', 501, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1043, '登录删除', 501, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1044, '日志导出', 501, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1045, '账户解锁', 501, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1046, '在线查询', 109, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1047, '批量强退', 109, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1048, '单条强退', 109, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1049, '任务查询', 110, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1050, '任务新增', 110, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1051, '任务修改', 110, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1052, '任务删除', 110, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1053, '状态修改', 110, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1054, '任务导出', 110, 6, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1055, '生成查询', 116, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1056, '生成修改', 116, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1057, '生成删除', 116, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1058, '导入代码', 116, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1059, '预览代码', 116, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (1060, '生成代码', 116, 6, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2000, '流程管理', 0, 50, 'flyflow', NULL, NULL, 1, 0, NULL, 'M', '1', '1', NULL, 'example_new_icon', 'admin', '2024-05-06 06:17:26', '小桐', '2026-01-12 17:47:30', NULL);
INSERT INTO `system_menu` VALUES (2001, '流程组', 2002, 1, 'group', 'flyflow/flow/group', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:flow:group', 'button', 'admin', '2024-05-06 08:28:25', 'admin', '2024-05-06 12:03:39', NULL);
INSERT INTO `system_menu` VALUES (2002, '流程', 2000, 1, 'flow', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'component', 'admin', '2024-05-06 08:29:31', 'admin', '2024-05-06 11:59:48', NULL);
INSERT INTO `system_menu` VALUES (2003, '流程列表', 2002, 2, 'list', 'flyflow/flow/list', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:flow:list', 'date_new_icon', 'admin', '2024-05-06 08:34:14', 'admin', '2025-02-27 10:59:43', NULL);
INSERT INTO `system_menu` VALUES (2004, '创建流程', 2002, 1, 'create', 'flyflow/flow/create', NULL, 1, 1, NULL, 'C', '1', '0', 'flyflow:flow:create', 'component', 'admin', '2024-05-06 12:56:35', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2005, '任务管理', 2000, 3, 'task', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'date', 'admin', '2024-05-06 13:29:59', 'admin', '2025-02-27 11:19:29', NULL);
INSERT INTO `system_menu` VALUES (2006, '待办任务', 2005, 1, 'todo', 'flyflow/task/pending', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:pending', 'date_new_icon', 'admin', '2024-05-06 13:30:36', 'admin', '2025-02-27 10:57:08', NULL);
INSERT INTO `system_menu` VALUES (2007, '我的发起', 2005, 2, 'started', 'flyflow/task/started', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:started', 'button', 'admin', '2024-05-06 13:32:07', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2008, '我的已办', 2005, 3, 'completed', 'flyflow/task/completed', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:completed', 'download', 'admin', '2024-05-06 13:33:44', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2009, '抄送我的', 2005, 4, 'cc', 'flyflow/task/cc', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:cc', 'example', 'admin', '2024-05-06 13:35:08', 'admin', '2024-05-06 13:35:51', NULL);
INSERT INTO `system_menu` VALUES (2010, '数字证书', 1, 10, 'ca', NULL, NULL, 1, 0, NULL, 'M', '1', '1', NULL, 'password', 'admin', NULL, '小桐', '2025-12-30 13:12:47', NULL);
INSERT INTO `system_menu` VALUES (2011, '证书管理', 2010, 1, 'cert', 'system/ca/cert/index', NULL, 1, 0, NULL, 'C', '0', '0', 'ca:cert:list', '#', 'admin', '2024-08-18 01:49:14', NULL, NULL, '证书管理菜单');
INSERT INTO `system_menu` VALUES (2012, '证书管理查询', 2010, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:cert:query', '#', 'admin', '2024-08-18 01:49:14', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2013, '证书管理新增', 2010, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:cert:add', '#', 'admin', '2024-08-18 01:49:14', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2014, '证书管理修改', 2010, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:cert:edit', '#', 'admin', '2024-08-18 01:49:15', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2015, '证书管理删除', 2010, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:cert:remove', '#', 'admin', '2024-08-18 01:49:15', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2016, '证书管理导出', 2010, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:cert:export', '#', 'admin', '2024-08-18 01:49:15', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2017, '主体管理', 2010, 0, 'subject', 'system/ca/subject/index', NULL, 1, 0, NULL, 'C', '0', '0', 'ca:subject:list', '#', 'admin', '2024-08-18 01:49:32', 'admin', '2024-08-18 01:49:49', '主体管理菜单');
INSERT INTO `system_menu` VALUES (2018, '主体管理查询', 2017, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:subject:query', '#', 'admin', '2024-08-18 01:49:32', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2019, '主体管理新增', 2017, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:subject:add', '#', 'admin', '2024-08-18 01:49:32', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2020, '主体管理修改', 2017, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:subject:edit', '#', 'admin', '2024-08-18 01:49:32', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2021, '主体管理删除', 2017, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:subject:remove', '#', 'admin', '2024-08-18 01:49:32', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2022, '主体管理导出', 2017, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'ca:subject:export', '#', 'admin', '2024-08-18 01:49:32', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2026, '应用管理', 1, 1, 'client', 'system/auth/client/index', NULL, 1, 0, NULL, 'C', '1', '1', 'auth:client:list', 'github', 'admin', '2024-08-31 14:33:05', '小桐', '2025-12-31 15:38:56', '应用管理菜单');
INSERT INTO `system_menu` VALUES (2027, '应用管理查询', 2026, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:query', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2028, '应用管理新增', 2026, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:add', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2029, '应用管理修改', 2026, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:edit', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2030, '应用管理删除', 2026, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:remove', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2031, '应用管理导出', 2026, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:export', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2068, '消息模板', 1, 0, 'messageTemplate', 'system/system/messageTemplate/index', NULL, 1, 0, NULL, 'C', '1', '1', 'system:message:messageTemplate:list', 'email', 'admin', '2024-11-01 09:52:03', '小桐', '2025-12-31 15:38:50', '消息模板菜单');
INSERT INTO `system_menu` VALUES (2069, '消息模板查询', 2068, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:query', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2070, '消息模板新增', 2068, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:add', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2071, '消息模板修改', 2068, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:edit', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2072, '消息模板删除', 2068, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:remove', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2073, '消息模板导出', 2068, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:export', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2190, '系统配置', 1, 11, 'sysContent', 'system/system/content/index', NULL, 1, 0, NULL, 'C', '1', '1', 'system:system:content:query', 'build', 'admin', '2024-12-31 11:16:14', '小桐', '2025-12-31 15:39:08', NULL);
INSERT INTO `system_menu` VALUES (2245, '模型中心', 0, 2, 'model/version', 'model/modelManage/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:model:list', 'model-administration', 'admin', '2025-11-14 15:32:43', 'qModel', '2026-07-20 14:19:25', NULL);
INSERT INTO `system_menu` VALUES (2253, '模型审批', 0, 5, 'apiGateway', 'model/approval/index', NULL, 1, 0, NULL, 'C', '0', '0', '', 'model-approve', 'qModel', '2026-07-14 15:49:56', 'qModel', '2026-07-20 14:14:23', NULL);
INSERT INTO `system_menu` VALUES (2254, '模型文件部署', 2245, 10, 'modelFileResource', 'model/fileResource/index', NULL, 1, 0, NULL, 'C', '1', '0', 'model:fileResource:fileresource:list', '#', 'admin', '2026-07-17 13:38:23', 'qModel', '2026-07-20 11:50:27', '模型文件部署菜单');
INSERT INTO `system_menu` VALUES (2255, '模型文件部署查询', 2254, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:fileResource:fileresource:query', '#', 'admin', '2026-07-17 13:38:23', '', NULL, '');
INSERT INTO `system_menu` VALUES (2256, '模型文件部署新增', 2254, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:fileResource:fileresource:add', '#', 'admin', '2026-07-17 13:38:23', '', NULL, '');
INSERT INTO `system_menu` VALUES (2257, '模型文件部署修改', 2254, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:fileResource:fileresource:edit', '#', 'admin', '2026-07-17 13:38:23', '', NULL, '');
INSERT INTO `system_menu` VALUES (2258, '模型文件部署删除', 2254, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:fileResource:fileresource:remove', '#', 'admin', '2026-07-17 13:38:23', '', NULL, '');
INSERT INTO `system_menu` VALUES (2259, '模型文件部署导出', 2254, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:fileResource:fileresource:export', '#', 'admin', '2026-07-17 13:38:23', '', NULL, '');
INSERT INTO `system_menu` VALUES (2260, '模型文件部署导入', 2254, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:fileResource:fileresource:import', '#', 'admin', '2026-07-17 13:38:23', '', NULL, '');
INSERT INTO `system_menu` VALUES (2261, '构建日志', 0, 4, 'modelBuildLog', 'model/buildLog/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:buildLog:buildlog:list', 'build-log', 'admin', '2026-07-17 13:39:16', 'qModel', '2026-07-20 14:14:10', '构建日志菜单');
INSERT INTO `system_menu` VALUES (2262, '构建日志查询', 2261, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:buildLog:buildlog:query', '#', 'admin', '2026-07-17 13:39:16', '', NULL, '');
INSERT INTO `system_menu` VALUES (2263, '构建日志新增', 2261, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:buildLog:buildlog:add', '#', 'admin', '2026-07-17 13:39:16', '', NULL, '');
INSERT INTO `system_menu` VALUES (2264, '构建日志修改', 2261, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:buildLog:buildlog:edit', '#', 'admin', '2026-07-17 13:39:16', '', NULL, '');
INSERT INTO `system_menu` VALUES (2265, '构建日志删除', 2261, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:buildLog:buildlog:remove', '#', 'admin', '2026-07-17 13:39:16', '', NULL, '');
INSERT INTO `system_menu` VALUES (2266, '构建日志导出', 2261, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:buildLog:buildlog:export', '#', 'admin', '2026-07-17 13:39:16', '', NULL, '');
INSERT INTO `system_menu` VALUES (2267, '构建日志导入', 2261, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:buildLog:buildlog:import', '#', 'admin', '2026-07-17 13:39:16', '', NULL, '');
INSERT INTO `system_menu` VALUES (2268, '调用记录', 0, 3, 'modelInvokeHistory', 'model/invokeHistory/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:invokeHistory:invokehistory:list', 'call-record', 'admin', '2026-07-17 13:39:50', 'qModel', '2026-07-20 14:13:58', '模型调用历史记录菜单');
INSERT INTO `system_menu` VALUES (2269, '模型调用历史记录查询', 2268, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:invokeHistory:invokehistory:query', '#', 'admin', '2026-07-17 13:39:50', '', NULL, '');
INSERT INTO `system_menu` VALUES (2270, '模型调用历史记录新增', 2268, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:invokeHistory:invokehistory:add', '#', 'admin', '2026-07-17 13:39:50', '', NULL, '');
INSERT INTO `system_menu` VALUES (2271, '模型调用历史记录修改', 2268, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:invokeHistory:invokehistory:edit', '#', 'admin', '2026-07-17 13:39:50', '', NULL, '');
INSERT INTO `system_menu` VALUES (2272, '模型调用历史记录删除', 2268, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:invokeHistory:invokehistory:remove', '#', 'admin', '2026-07-17 13:39:50', '', NULL, '');
INSERT INTO `system_menu` VALUES (2273, '模型调用历史记录导出', 2268, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:invokeHistory:invokehistory:export', '#', 'admin', '2026-07-17 13:39:50', '', NULL, '');
INSERT INTO `system_menu` VALUES (2274, '模型调用历史记录导入', 2268, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:invokeHistory:invokehistory:import', '#', 'admin', '2026-07-17 13:39:50', '', NULL, '');
INSERT INTO `system_menu` VALUES (2276, '模型管理查询', 2245, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:model:query', '#', 'admin', '2026-07-20 10:53:27', 'qModel', '2026-07-20 11:31:48', '');
INSERT INTO `system_menu` VALUES (2277, '模型管理新增', 2245, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:model:add', '#', 'admin', '2026-07-20 10:53:27', 'qModel', '2026-07-20 11:31:52', '');
INSERT INTO `system_menu` VALUES (2278, '模型管理修改', 2245, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:model:edit', '#', 'admin', '2026-07-20 10:53:27', 'qModel', '2026-07-20 11:32:03', '');
INSERT INTO `system_menu` VALUES (2279, '模型管理删除', 2245, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:model:remove', '#', 'admin', '2026-07-20 10:53:27', 'qModel', '2026-07-20 11:32:08', '');
INSERT INTO `system_menu` VALUES (2280, '模型管理导出', 2245, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:model:export', '#', 'admin', '2026-07-20 10:53:27', 'qModel', '2026-07-20 11:32:13', '');
INSERT INTO `system_menu` VALUES (2281, '模型管理导入', 2245, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:model:import', '#', 'admin', '2026-07-20 10:53:27', 'qModel', '2026-07-20 11:32:18', '');
INSERT INTO `system_menu` VALUES (2282, '模型配置详情', 2245, 20, 'config', 'model/model/index', NULL, 1, 0, NULL, 'C', '1', '0', 'model:config:config:list', '#', 'admin', '2026-07-20 10:53:47', 'qModel', '2026-07-20 11:59:11', '模型配置详情菜单');
INSERT INTO `system_menu` VALUES (2283, '模型配置详情查询', 2282, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:config:config:query', '#', 'admin', '2026-07-20 10:53:47', '', NULL, '');
INSERT INTO `system_menu` VALUES (2284, '模型配置详情新增', 2282, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:config:config:add', '#', 'admin', '2026-07-20 10:53:47', '', NULL, '');
INSERT INTO `system_menu` VALUES (2285, '模型配置详情修改', 2282, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:config:config:edit', '#', 'admin', '2026-07-20 10:53:47', '', NULL, '');
INSERT INTO `system_menu` VALUES (2286, '模型配置详情删除', 2282, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:config:config:remove', '#', 'admin', '2026-07-20 10:53:47', '', NULL, '');
INSERT INTO `system_menu` VALUES (2287, '模型配置详情导出', 2282, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:config:config:export', '#', 'admin', '2026-07-20 10:53:47', '', NULL, '');
INSERT INTO `system_menu` VALUES (2288, '模型配置详情导入', 2282, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:config:config:import', '#', 'admin', '2026-07-20 10:53:47', '', NULL, '');
INSERT INTO `system_menu` VALUES (2296, '模型分类', 0, 0, 'Classify', 'model/modelClassify/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:classify:classify:list', 'category-management', 'admin', '2026-07-20 11:21:25', 'qModel', '2026-07-20 13:42:46', '模型分类菜单');
INSERT INTO `system_menu` VALUES (2297, '模型分类查询', 2296, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:classify:classify:query', '#', 'admin', '2026-07-20 11:21:25', '', NULL, '');
INSERT INTO `system_menu` VALUES (2298, '模型分类新增', 2296, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:classify:classify:add', '#', 'admin', '2026-07-20 11:21:25', '', NULL, '');
INSERT INTO `system_menu` VALUES (2299, '模型分类修改', 2296, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:classify:classify:edit', '#', 'admin', '2026-07-20 11:21:25', '', NULL, '');
INSERT INTO `system_menu` VALUES (2300, '模型分类删除', 2296, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:classify:classify:remove', '#', 'admin', '2026-07-20 11:21:25', '', NULL, '');
INSERT INTO `system_menu` VALUES (2301, '模型分类导出', 2296, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:classify:classify:export', '#', 'admin', '2026-07-20 11:21:25', '', NULL, '');
INSERT INTO `system_menu` VALUES (2302, '模型分类导入', 2296, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:classify:classify:import', '#', 'admin', '2026-07-20 11:21:25', '', NULL, '');
INSERT INTO `system_menu` VALUES (2303, '历史记录', 0, 5, 'Operate', 'model/operateList/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:operate:operate:list', 'calculate-history', 'admin', '2026-07-20 14:23:04', 'qModel', '2026-07-20 15:16:31', '模型历史管理菜单');
INSERT INTO `system_menu` VALUES (2304, '模型历史管理查询', 2303, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:operate:operate:query', '#', 'admin', '2026-07-20 14:23:04', '', NULL, '');
INSERT INTO `system_menu` VALUES (2305, '模型历史管理新增', 2303, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:operate:operate:add', '#', 'admin', '2026-07-20 14:23:04', '', NULL, '');
INSERT INTO `system_menu` VALUES (2306, '模型历史管理修改', 2303, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:operate:operate:edit', '#', 'admin', '2026-07-20 14:23:04', '', NULL, '');
INSERT INTO `system_menu` VALUES (2307, '模型历史管理删除', 2303, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:operate:operate:remove', '#', 'admin', '2026-07-20 14:23:04', '', NULL, '');
INSERT INTO `system_menu` VALUES (2308, '模型历史管理导出', 2303, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:operate:operate:export', '#', 'admin', '2026-07-20 14:23:04', '', NULL, '');
INSERT INTO `system_menu` VALUES (2309, '模型历史管理导入', 2303, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:operate:operate:import', '#', 'admin', '2026-07-20 14:23:04', '', NULL, '');
INSERT INTO `system_menu` VALUES (2310, '模型计算', 0, 7, 'modelCompute', 'model/computeList/index', NULL, 1, 0, NULL, 'C', '0', '0', 'model:modelCacl:cacl:list', 'model-calculation', 'admin', '2026-07-20 14:27:32', '超级管理员', '2026-07-21 10:18:46', '模拟洪水预报-模型参数菜单');
INSERT INTO `system_menu` VALUES (2311, '模型计算查询', 2310, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:model:compute:query', '#', 'admin', '2026-07-20 14:27:32', 'qModel', '2026-07-20 14:51:49', '');
INSERT INTO `system_menu` VALUES (2312, '模型计算新增', 2310, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelCacl:cacl:add', '#', 'admin', '2026-07-20 14:27:32', '超级管理员', '2026-07-21 10:18:39', '');
INSERT INTO `system_menu` VALUES (2313, '模型计算修改', 2310, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelCacl:cacl:edit', '#', 'admin', '2026-07-20 14:27:32', '超级管理员', '2026-07-21 10:18:30', '');
INSERT INTO `system_menu` VALUES (2314, '模型计算删除', 2310, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelCacl:cacl:remove', '#', 'admin', '2026-07-20 14:27:32', '超级管理员', '2026-07-21 10:18:23', '');
INSERT INTO `system_menu` VALUES (2315, '模型计算导出', 2310, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelCacl:cacl:export', '#', 'admin', '2026-07-20 14:27:32', '超级管理员', '2026-07-21 10:18:18', '');
INSERT INTO `system_menu` VALUES (2316, '模型计算导入', 2310, 6, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'model:modelCacl:cacl:import', '#', 'admin', '2026-07-20 14:27:32', '超级管理员', '2026-07-21 10:18:13', '');


-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` blob NULL COMMENT '公告内容',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO `system_notice` VALUES (14, 'qModel v1.0.0 正式发布', '2', 0x3C68313EF09F9A8020714D6F64656C20312E302E3020E6ADA3E5BC8FE58F91E5B8833C2F68313E3C703E714D6F64656C20312E302E3020E698AFE68891E4BBACE68EA8E587BAE79A84E9A696E4B8AAE6ADA3E5BC8FE78988E69CACEFBC8CE6A087E5BF97E79D80E7AE97E6B395E6A8A1E59E8BE585A8E7949FE591BDE591A8E69C9FE7AEA1E79086E883BDE58A9BE79A84E585A8E99DA2E890BDE59CB0E38082E69CACE78988E69CACE8819AE784A6E4BA8EE4BC81E4B89AE7BAA7E6A8A1E59E8BE8B584E4BAA7E79A84E7BB9FE4B880E7BAB3E7AEA1E4B88EE9AB98E69588E8B083E794A8EFBC8CE68F90E4BE9BE4BB8EE6A8A1E59E8BE58886E7B1BBE38081E9858DE7BDAEE588B0E59CA8E7BABFE8AEA1E7AE97E4B88EE58E86E58FB2E8BFBDE6BAAFE79A84E4B880E7AB99E5BC8FE883BDE58A9BEFBC8CE887B4E58A9BE4BA8EE68993E980A0E6A087E58786E58C96E38081E58FAFE8A786E58C96E38081E58FAFE5A48DE794A8E79A84E699BAE883BDE6A8A1E59E8BE4B8ADE69EA2E5B9B3E58FB0E380823C2F703E3C68323EE29CA820E6A0B8E5BF83E58A9FE883BDE4BAAEE782B93C2F68323E3C756C3E3C6C693EF09F9782EFB88F20E7B1BBE79BAEE7AEA1E790863C2F6C693E3C6C693EE694AFE68C81E5AFB9E7AE97E6B395E6A8A1E59E8BE8BF9BE8A18CE5A49AE7BAA7E58886E7B1BBE4B88EE6A087E7ADBEE58C96E7AEA1E79086EFBC8CE69E84E5BBBAE6B885E699B0E79A84E6A8A1E59E8BE8B584E4BAA7E79BAEE5BD95E4BD93E7B3BBEFBC8CE4BEBFE4BA8EE5BFABE9809FE6A380E7B4A2E4B88EE7BB84E7BB87E6A8A1E59E8BE8B584E6BA90E380823C2F6C693E3C6C693EF09FA49620E6A8A1E59E8BE7AEA1E790863C2F6C693E3C6C693EE68F90E4BE9BE5AFB9203C636F6465207374796C653D22636F6C6F723A207267626128302C20302C20302C20302E38293B206261636B67726F756E642D636F6C6F723A20726762283234372C203234372C20323439293B223E6578653C2F636F64653E20E58FAFE689A7E8A18CE7A88BE5BA8FE4B88E203C636F6465207374796C653D22636F6C6F723A207267626128302C20302C20302C20302E38293B206261636B67726F756E642D636F6C6F723A20726762283234372C203234372C20323439293B223E41504920E68EA5E58FA33C2F636F64653E20E7B1BBE59E8BE7AE97E6B395E6A8A1E59E8BE79A84E7BB9FE4B880E6B3A8E5868CE4B88EE9858DE7BDAEE883BDE58A9BEFBC8CE694AFE68C81E7B2BEE7BB86E58C96E5AE9AE4B989E6A8A1E59E8BE79A84E8BE93E585A5E58F82E695B0E7BB93E69E84E38081E8BE93E587BAE7BB93E69E9CE6A0BCE5BC8FE58F8AE695B0E68DAEE7B1BBE59E8BEFBC8CE7A1AEE4BF9DE6A8A1E59E8BE8B083E794A8E8A784E88C83E4B88EE8AFADE4B989E4B880E887B4E680A7E380823C2F6C693E3C6C693EF09FA7AE20E6A8A1E59E8BE8AEA1E7AE973C2F6C693E3C6C693EE694AFE68C81E59CA8E5B9B3E58FB0E4B88AE79BB4E68EA5E9858DE7BDAEE6A8A1E59E8BE68980E99C80E79A84E585B7E4BD93E8BE93E585A5E58F82E695B0EFBC8CE4B880E994AEE8A7A6E58F91E59CA8E7BABFE8AEA1E7AE97EFBC8CE5B9B6E5AE9EE697B6E69FA5E79C8BE7BB93E69E84E58C96E8BE93E587BAE7BB93E69E9CEFBC8CE5AE9EE78EB0E2809CE68980E9858DE58DB3E68980E5BE97E2809DE79A84E4BAA4E4BA92E5BC8FE6A8A1E59E8BE9AA8CE8AF81E4BD93E9AA8CE380823C2F6C693E3C6C693EF09F939C20E8AEA1E7AE97E58E86E58FB23C2F6C693E3C6C693EE887AAE58AA8E8AEB0E5BD95E6AF8FE4B880E6ACA1E6A8A1E59E8BE8B083E794A8E79A84E5AE8CE695B4E4B88AE4B88BE69687EFBC8CE58C85E68BACE8BE93E585A5E58F82E695B0E38081E8BE93E587BAE7BB93E69E9CE38081E689A7E8A18CE697B6E997B4E4B88EE8B083E794A8E4BABAE4BFA1E681AFEFBC8CE694AFE68C81E68C89E6A8A1E59E8BE38081E697B6E997B4E68896E794A8E688B7E7BBB4E5BAA6E8BFBDE6BAAFE58E86E58FB2E8AEA1E7AE97E8AEB0E5BD95EFBC8CE4BF9DE99A9CE8BF87E7A88BE58FAFE5AEA1E8AEA1E38081E7BB93E69E9CE58FAFE5A48DE78EB0E380823C2F6C693E3C2F756C3E3C703EF09F8E8920E789B9E588ABE8AFB4E6988EEFBC9A3C2F703E3C703E714D6F64656C20312E302E3020E4BD9CE4B8BAE5B9B3E58FB0E79A84E5A5A0E59FBAE78988E69CACEFBC8CE5BBBAE7AB8BE4BA86E6A8A1E59E8BE8B584E4BAA7E58C96E7AEA1E79086E79A84E6A0B8E5BF83E6A186E69EB6E38082E69CAAE69DA5E68891E4BBACE5B086E68C81E7BBADE5A29EE5BCBAE6A8A1E59E8BE68EA5E585A5E4B88EE8BF90E8A18CE38081E6A8A1E59E8BE7AEA1E79086E38081E6A8A1E59E8BE8AEA1E7AE97E38081E69C8DE58AA1E6B2BBE79086E4B88EE8B083E5BAA6E7AD89E883BDE58A9BE38082E8AF9AE98280E682A8E4BD93E9AA8C20714D6F64656CEFBC8CE5BC80E590AFE7AE97E6B395E6A8A1E59E8BE79A84E6A087E58786E58C96E6B2BBE79086E4B88EE9AB98E69588E5BA94E794A8E696B0E7AF87E7ABA0EFBC813C2F703E, '0', '超级管理员', '2026-05-21 15:04:55', NULL, NULL, NULL);
INSERT INTO `system_notice` VALUES (15, 'qModel v1.1.0 正式发布', '2', 0x3C68313EF09F9A8020714D6F64656C20E6A8A1E59E8BE5B9B3E58FB0E5BC80E6BA90E789882076312E312E3020E69BB4E696B0E697A5E5BF973C2F68313E3C68323EF09FA7AD20E78988E69CACE6A682E8BFB03C2F68323E3C703EE69CACE6ACA1E78988E69CACE4B8BAE6A8A1E59E8BE68EA5E585A5E9878DE69E84E38081E9A1B5E99DA2E694B9E78988E4B88EE7B3BBE7BB9FE6A087E58786E58C96E4BC98E58C96E78988E69CACEFBC8CE6A0B8E5BF83E9878DE69E84415049E68EA5E58FA3E6A8A1E59E8BE585A8E993BEE8B7AFE68EA5E585A5E883BDE58A9BEFBC8CE7BB86E58886E5A49AE7B1BBE989B4E69D83E6A8A1E5BC8FEFBC8CE5908CE6ADA5E585A8E696B0E694B9E78988E6A8A1E59E8BE7AEA1E79086E9A1B5E99DA2EFBC8CE5B9B6E7BB9FE4B880E585A8E7AB99E9A1B5E99DA2E8A786E8A789E4B88EE4BAA4E4BA92E8A784E88C83EFBC8CE68F90E58D87E5A496E983A8E6A8A1E59E8BE68EA5E585A5E4BEBFE68DB7E5BAA6E38081E9A1B5E99DA2E6938DE4BD9CE4BD93E9AA8CE4B88EE5B9B3E58FB0E695B4E4BD93E6A087E58786E58C96E7A88BE5BAA6E380823C2F703E3C68323EF09F9BA020E4B8BBE8A681E69BB4E696B0E58685E5AEB93C2F68323E3C703E31EFB88FE283A320E9878DE69E842041504920E68EA5E58FA3E6A8A1E59E8BE68EA5E585A5E883BDE58A9B3C2F703E3C756C3E3C6C693EE9878DE69E84E5BA95E5B182E6A8A1E59E8BE68EA5E585A5E980BBE8BE91EFBC8CE5AE8CE695B4E8A686E79B96E6A8A1E59E8BE59FBAE69CACE4BFA1E681AFE6B3A8E5868CE38081415049E58F82E695B0E9858DE7BDAEE38081E58AA8E68081546F6B656EE8AEA4E8AF81E38081E8BE93E585A5E8BE93E587BAE887AAE5AE9AE4B989E5AE9AE4B989E38081E59CA8E7BABFE8B083E8AF95E585A8E6B581E7A88BE883BDE58A9BEFBC9B3C2F6C693E3C6C693EE7BB9FE4B880E5A496E983A8E6A8A1E59E8BE68EA5E585A5E6A087E58786EFBC8CE8AEA9E7ACACE4B889E696B9E6A8A1E59E8BE69C8DE58AA1E68EA5E585A5E69BB4E58AA0E6A087E58786E38081E781B5E6B4BBE38081E9AB98E69588E380823C2F6C693E3C2F756C3E3C703E32EFB88FE283A320E6A8A1E59E8BE7AEA1E79086E9A1B5E99DA2E9878DE69E84E8AEBEE8AEA13C2F703E3C756C3E3C6C693EE5AFB9E6A8A1E59E8BE7AEA1E79086E9A1B5E99DA2E8BF9BE8A18CE695B4E4BD93E694B9E78988E9878DE69E84EFBC8CE4BC98E58C96E5B883E5B180E7BB93E69E84E4B88EE6938DE4BD9CE58AA8E7BABFEFBC8CE6A8A1E59E8BE69FA5E79C8BE38081E9858DE7BDAEE38081E8B083E8AF95E6938DE4BD9CE69BB4E79BB4E8A782E380823C2F6C693E3C2F756C3E3C703E33EFB88FE283A320E7BB86E58886E4B889E7B1BB415049E989B4E69D83E9858DE7BDAEE696B9E6A1883C2F703E3C756C3E3C6C693EE697A0E989B4E69D83E6A8A1E5BC8FEFBC9AE697A0E99C80E587ADE8AF81EFBC8CE79BB4E68EA5E8AEBFE997AEE6A8A1E59E8BE68EA5E58FA3EFBC9B3C2F6C693E3C6C693EE59BBAE5AE9AE587ADE8AF81E6A8A1E5BC8FEFBC9AE694AFE68C81E59BBAE5AE9A546F6B656EE38081415049204B6579E99D99E68081E989B4E69D83E9858DE7BDAEEFBC9B3C2F6C693E3C6C693EE58AA8E68081E587ADE8AF81E6A8A1E5BC8FEFBC9AE694AFE68C81E58AA8E68081546F6B656EE68EA5E58FA3E989B4E69D83E9858DE7BDAEEFBC8CE98082E9858DE99C80E5AE9EE697B6E88EB7E58F96E4BBA4E7898CE79A84E6A8A1E59E8BE69C8DE58AA1E380823C2F6C693E3C2F756C3E3C703E34EFB88FE283A320E7B3BBE7BB9FE9A1B5E99DA2E6A087E58786E58C96E8B083E695B43C2F703E3C756C3E3C6C693EE7BB9FE4B880E585A8E7AB99E9A1B5E99DA2E5B883E5B180E38081E7BB84E4BBB6E6A0B7E5BC8FE38081E4BAA4E4BA92E980BBE8BE91EFBC8CE5AE8CE68890E585A8E5B9B3E58FB0E9A1B5E99DA2E6A087E58786E58C96E695B4E694B9EFBC8CE8A786E8A789E4B88EE6938DE4BD9CE4BD93E9AA8CE4BF9DE68C81E4B880E887B4E380823C2F6C693E3C2F756C3E3C68323EF09F938C20E78988E69CACE680BBE7BB933C2F68323E3C703E714D6F64656C20E6A8A1E59E8BE5B9B3E58FB0E5BC80E6BA90E789882076312E312E3020E9878DE782B9E5AE8CE68890415049E6A8A1E59E8BE68EA5E585A5E5BA95E5B182E9878DE69E84E4B88EE9A1B5E99DA2E4BD93E7B3BBE58D87E7BAA7E38082E4B880E696B9E99DA2E690ADE5BBBAE6A087E58786E58C96E5A496E983A8E6A8A1E59E8BE68EA5E585A5E6B581E7A88BEFBC8CE58892E58886E4B889E7B1BBE5B7AEE5BC82E58C96E989B4E69D83E696B9E6A188EFBC8CE585BCE5AEB9E59084E7B1BBE7ACACE4B889E696B9E6A8A1E59E8BE68EA5E58FA3EFBC9BE58FA6E4B880E696B9E99DA2E9878DE69E84E6A8A1E59E8BE7AEA1E79086E9A1B5E99DA2EFBC8CE7BB9FE4B880E585A8E7AB99E9A1B5E99DA2E8AEBEE8AEA1E8A784E88C83EFBC8CE5A4A7E5B985E9998DE4BD8EE5A496E983A8E6A8A1E59E8BE5AFB9E68EA5E68890E69CACEFBC8CE5908CE697B6E68F90E58D87E5B9B3E58FB0E7958CE99DA2E695B4E6B481E5BAA6E4B88EE6938DE4BD9CE6B581E79585E5BAA6E380823C2F703E, '0', '超级管理员', '2026-06-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `system_notice` VALUES (16, 'qModel v1.2.0 正式发布', '2', 0x3C68313EF09F9A8020714D6F64656C20E6A8A1E59E8BE5B9B3E58FB0E5BC80E6BA90E789882076312E322E3020E69BB4E696B0E697A5E5BF973C2F68313E3C68323EF09FA7AD20E78988E69CACE6A682E8BFB03C2F68323E3C703EE69CACE6ACA1E78988E69CACE8819AE784A6E6A8A1E59E8BE68EA5E585A5E9878DE69E84E38081E9A1B5E99DA2E694B9E78988E4B88EE7B3BBE7BB9FE6A087E58786E58C96E4BC98E58C96EFBC8CE6A0B8E5BF83E58D87E7BAA7507974686F6EE8849AE69CACE6A8A1E59E8BE68EA5E585A5E883BDE58A9BEFBC8CE690ADE5BBBAE5AE8CE695B4E69CACE59CB0507974686F6EE8849AE69CACE6A8A1E59E8BE68EA5E585A5E993BEE8B7AFEFBC8CE694AFE68C815A4950E58E8BE7BCA9E58C85E4B88AE4BCA0E38081E4BE9DE8B596E887AAE58AA8E6A380E6B58BE38081E8849AE69CACE689A7E8A18CE8B083E5BAA6E7AD89E58A9FE883BDEFBC8CE696B9E4BEBFE794A8E688B7E5BFABE9809FE5B086E69CACE59CB0507974686F6EE7AE97E6B395E6A8A1E59E8BE68EA5E585A5E5B9B3E58FB0E7BB9FE4B880E7AEA1E79086E4B88EE8B083E794A8E380823C2F703E3C68323EF09F9BA020E4B8BBE8A681E69BB4E696B0E58685E5AEB93C2F68323E3C68333E31EFB88FE283A320E696B0E5A29E20507974686F6E20E8849AE69CACE6A8A1E59E8BE68EA5E585A5E883BDE58A9B3C2F68333E3C756C3E3C6C693EE694AFE68C81E4B88AE4BCA0E58C85E590AB203C636F6465207374796C653D22636F6C6F723A207267626128302C20302C20302C20302E38293B206261636B67726F756E642D636F6C6F723A20726762283234372C203234372C20323439293B223E6D61696E2E70793C2F636F64653E20E5928C203C636F6465207374796C653D22636F6C6F723A207267626128302C20302C20302C20302E38293B206261636B67726F756E642D636F6C6F723A20726762283234372C203234372C20323439293B223E726571756972656D656E74732E7478743C2F636F64653E20E79A84205A495020E58E8BE7BCA9E58C85EFBC9BE7BB9FE4B880E5A496E983A8E6A8A1E59E8BE68EA5E585A5E6A087E58786EFBC8CE7ACACE4B889E696B9E6A8A1E59E8BE69C8DE58AA1E68EA5E585A5E69BB4E6A087E58786E38081E781B5E6B4BBE38081E9AB98E69588E380823C2F6C693E3C6C693EE887AAE58AA8E6A0A1E9AA8CE58E8BE7BCA9E58C85E79BAEE5BD95E7BB93E69E84EFBC8CE6A380E6B58B203C636F6465207374796C653D22636F6C6F723A207267626128302C20302C20302C20302E38293B206261636B67726F756E642D636F6C6F723A20726762283234372C203234372C20323439293B223E6D61696E2E70793C2F636F64653E20E698AFE590A6E5AD98E59CA8203C636F6465207374796C653D22636F6C6F723A207267626128302C20302C20302C20302E38293B206261636B67726F756E642D636F6C6F723A20726762283234372C203234372C20323439293B223E707265646963743C2F636F64653E20E9A284E6B58BE587BDE695B0EFBC9B3C2F6C693E3C6C693EE5BC82E6ADA5E689ABE68F8F203C636F6465207374796C653D22636F6C6F723A207267626128302C20302C20302C20302E38293B206261636B67726F756E642D636F6C6F723A20726762283234372C203234372C20323439293B223E726571756972656D656E74732E7478743C2F636F64653EEFBC8CE6A0A1E9AA8CE68980E99C80E4BE9DE8B596E58C85E5AE89E8A385E78AB6E68081EFBC9B3C2F6C693E3C6C693EE8B7A8E5B9B3E58FB0E887AAE58AA8E98082E9858D2057696E646F7773202F204C696E757820E78EAFE5A28320507974686F6E20E689A7E8A18CE591BDE4BBA4E380823C2F6C693E3C2F756C3E3C68333E32EFB88FE283A320E585A8E696B0E6A8A1E59E8BE8849AE69CACE689A7E8A18CE5BC95E6938E3C2F68333E3C756C3E3C6C693EE690ADE5BBBA204A61766120E8B083E794A820507974686F6E20E8849AE69CACE79A84E8BF9BE7A88BE9809AE4BFA1E69CBAE588B6EFBC9B3C2F6C693E3C6C693EE9809AE8BF87E6A087E58786E8BE93E585A5EFBC88737464696EEFBC89E4BCA0E98092204A534F4E20E6A0BCE5BC8FE8AFB7E6B182E58F82E695B0EFBC9B3C2F6C693E3C6C693EE7BB9FE4B880E8849AE69CACE8BE93E587BAE8A784E88C83EFBC8CE4BF9DE99A9CE8BF94E59B9E204A534F4E20E7BB93E69E9CE58FAFE6ADA3E5B8B8E8A7A3E69E90E380823C2F6C693E3C2F756C3E3C68333E33EFB88FE283A320E699BAE883BDE4BE9DE8B596E78EAFE5A283E6A380E6B58BE69CBAE588B63C2F68333E3C756C3E3C6C693EE887AAE58AA8E8A7A3E69E90203C636F6465207374796C653D22636F6C6F723A207267626128302C20302C20302C20302E38293B206261636B67726F756E642D636F6C6F723A20726762283234372C203234372C20323439293B223E726571756972656D656E74732E7478743C2F636F64653E20E58685E585A8E983A8E4BE9DE8B596E6B885E58D95EFBC9B3C2F6C693E3C6C693EE8B083E794A8E7B3BBE7BB9F2070697020E5B7A5E585B7E5AFB9E6AF94E5B7B2E5AE89E8A3852FE7BCBAE5A4B1E4BE9DE8B596E58C85EFBC9B3C2F6C693E3C6C693EE4BE9DE8B596E6A380E6B58BE5BC82E6ADA5E689A7E8A18CEFBC8CE4B88DE998BBE5A19EE4B8BBE4B89AE58AA1E6B581E7A88BEFBC9B3C2F6C693E3C6C693EE68C81E4B985E58C96E4BE9DE8B596E5AE89E8A385E697A5E5BF97EFBC8CE694AFE68C81E99A8FE697B6E69FA5E8AFA2E6A380E6B58BE7BB93E69E9CE380823C2F6C693E3C2F756C3E3C68323EF09F938C20E78988E69CACE680BBE7BB933C2F68323E3C703E714D6F64656C20E6A8A1E59E8BE5B9B3E58FB0E5BC80E6BA90E789882076312E322E3020E6A0B8E5BF83E5AE8CE6889020507974686F6E20E8849AE69CACE6A8A1E59E8BE585A8E993BEE8B7AFE68EA5E585A5E4BD93E7B3BBE690ADE5BBBAE380823C2F703E3C703EE4B880E696B9E99DA2E68993E9809AE8849AE69CACE4B88AE4BCA0E38081E59088E6B395E680A7E6A0A1E9AA8CE38081E4BBBBE58AA1E689A7E8A18CE5AE8CE695B4E6B581E7A88BEFBC8CE585BCE5AEB9204F4E4E58E380815079546F72636820E7AD89E4B8BBE6B581E69CBAE599A8E5ADA6E4B9A0E6A186E69EB6E6A8A1E59E8BE68EA5E585A5EFBC9B3C2F703E3C703EE58FA6E4B880E696B9E99DA2E68993E980A0E8B7A8E5B9B3E58FB0E8849AE69CACE689A7E8A18CE5BC95E6938EEFBC8CE4BF9DE99A9CE5A49AE6938DE4BD9CE7B3BBE7BB9FE78EAFE5A283E7A8B3E5AE9AE8BF90E8A18CE380823C2F703E3C703EE69CACE6ACA1E69BB4E696B0E5A4A7E5B985E9998DE4BD8EE69CACE59CB0E7AE97E6B395E6A8A1E59E8BE68EA5E585A5E997A8E6A79BEFBC8CE5BC80E58F91E88085E58FAFE5BFABE9809FE5AE8CE6889020507974686F6E20E6A8A1E59E8BE983A8E7BDB2E38081E59CA8E7BABFE6B58BE8AF95E4B88EE68EA5E58FA3E8B083E794A8E380823C2F703E, '0', '超级管理员', '2026-07-21 15:05:58', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `system_oper_log`;
CREATE TABLE `system_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT NULL COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT NULL COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '返回参数',
  `status` int(11) NULL DEFAULT NULL COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT NULL COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2895 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oper_log
-- ----------------------------
INSERT INTO `system_oper_log` VALUES (2886, '模型库重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"classifyName\":\"实时洪水预报\",\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 09:17:25\",\"creatorId\":1,\"description\":\"version22\",\"id\":13,\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"publishTime\":\"2026-07-01 18:24:37\",\"updateBy\":\"qModel\",\"updateTime\":\"2026-07-01 18:24:34\",\"updatorId\":1,\"version\":\"2\",\"versionId\":22,\"whetherPublish\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-07-01 18:24:38', 1223);
INSERT INTO `system_oper_log` VALUES (2887, '模型库重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"classifyName\":\"实时洪水预报\",\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 09:17:25\",\"creatorId\":1,\"description\":\"version22\",\"id\":13,\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"publishTime\":\"2026-07-01 18:25:07\",\"updateBy\":\"qModel\",\"updateTime\":\"2026-07-01 18:24:37\",\"updatorId\":1,\"version\":\"2\",\"versionId\":22,\"whetherPublish\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-07-01 18:25:08', 1739);
INSERT INTO `system_oper_log` VALUES (2888, '模型库重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"classifyName\":\"实时洪水预报\",\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 09:17:25\",\"creatorId\":1,\"description\":\"version22\",\"id\":13,\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"publishTime\":\"2026-07-01 18:25:25\",\"updateBy\":\"qModel\",\"updateTime\":\"2026-07-01 18:25:07\",\"updatorId\":1,\"version\":\"2\",\"versionId\":22,\"whetherPublish\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-07-01 18:25:26', 1166);
INSERT INTO `system_oper_log` VALUES (2889, '模型库重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"classifyName\":\"实时洪水预报\",\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 09:17:25\",\"creatorId\":1,\"description\":\"version22\",\"id\":13,\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"publishTime\":\"2026-07-01 18:25:27\",\"updateBy\":\"qModel\",\"updateTime\":\"2026-07-01 18:25:07\",\"updatorId\":1,\"version\":\"2\",\"versionId\":22,\"whetherPublish\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-07-01 18:25:27', 1200);
INSERT INTO `system_oper_log` VALUES (2890, '模型库重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"classifyName\":\"实时洪水预报\",\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 09:17:25\",\"creatorId\":1,\"description\":\"version22\",\"id\":13,\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"publishTime\":\"2026-07-01 18:25:28\",\"updateBy\":\"qModel\",\"updateTime\":\"2026-07-01 18:25:25\",\"updatorId\":1,\"version\":\"2\",\"versionId\":22,\"whetherPublish\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-07-01 18:25:29', 1191);
INSERT INTO `system_oper_log` VALUES (2891, '模型库重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"classifyName\":\"实时洪水预报\",\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 09:17:25\",\"creatorId\":1,\"description\":\"version22\",\"id\":13,\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"publishTime\":\"2026-07-01 18:25:37\",\"updateBy\":\"qModel\",\"updateTime\":\"2026-07-01 18:25:28\",\"updatorId\":1,\"version\":\"2\",\"versionId\":22,\"whetherPublish\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-07-01 18:25:38', 1787);
INSERT INTO `system_oper_log` VALUES (2892, '模型库重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"classifyName\":\"实时洪水预报\",\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 09:17:25\",\"creatorId\":1,\"description\":\"version22\",\"id\":13,\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"publishTime\":\"2026-07-01 18:26:31\",\"updateBy\":\"qModel\",\"updateTime\":\"2026-07-01 18:25:37\",\"updatorId\":1,\"version\":\"2\",\"versionId\":22,\"whetherPublish\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-07-01 18:26:32', 1171);
INSERT INTO `system_oper_log` VALUES (2893, '模型库重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"classifyName\":\"实时洪水预报\",\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 09:17:25\",\"creatorId\":1,\"description\":\"version22\",\"id\":13,\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"publishTime\":\"2026-07-01 18:26:32\",\"updateBy\":\"qModel\",\"updateTime\":\"2026-07-01 18:25:37\",\"updatorId\":1,\"version\":\"2\",\"versionId\":22,\"whetherPublish\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-07-01 18:26:33', 1270);
INSERT INTO `system_oper_log` VALUES (2894, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/job/index\",\"createTime\":\"2024-05-06 06:12:17\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"status\":\"0\",\"updateBy\":\"qModel\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-07 17:23:26', 1207);

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_post
-- ----------------------------
INSERT INTO `system_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);
INSERT INTO `system_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:50:39', NULL);
INSERT INTO `system_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-06 06:12:17', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(4) NULL DEFAULT NULL COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(4) NULL DEFAULT NULL COMMENT '部门树选择项是否关联显示',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', '吴同', '2024-05-06 06:12:17', NULL, NULL, '超级管理员');
INSERT INTO `system_role` VALUES (2, '普通角色', 'common', 3, '1', 1, 1, '0', '0', '吴同', '2024-05-06 06:12:17', '吴同', '2026-07-17 15:46:03', '普通角色');
INSERT INTO `system_role` VALUES (4, '系统管理员', 'system', 2, '1', 1, 1, '0', '0', '吴同', '2026-07-17 11:21:31', '吴同', '2026-07-17 15:50:01', '系统管理员');

-- ----------------------------
-- Table structure for system_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_role_dept`;
CREATE TABLE `system_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES (2, 2);
INSERT INTO `system_role_menu` VALUES (2, 110);
INSERT INTO `system_role_menu` VALUES (2, 1049);
INSERT INTO `system_role_menu` VALUES (2, 1050);
INSERT INTO `system_role_menu` VALUES (2, 1051);
INSERT INTO `system_role_menu` VALUES (2, 1052);
INSERT INTO `system_role_menu` VALUES (2, 1053);
INSERT INTO `system_role_menu` VALUES (2, 1054);
INSERT INTO `system_role_menu` VALUES (2, 2000);
INSERT INTO `system_role_menu` VALUES (2, 2001);
INSERT INTO `system_role_menu` VALUES (2, 2002);
INSERT INTO `system_role_menu` VALUES (2, 2003);
INSERT INTO `system_role_menu` VALUES (2, 2004);
INSERT INTO `system_role_menu` VALUES (2, 2005);
INSERT INTO `system_role_menu` VALUES (2, 2006);
INSERT INTO `system_role_menu` VALUES (2, 2007);
INSERT INTO `system_role_menu` VALUES (2, 2008);
INSERT INTO `system_role_menu` VALUES (2, 2009);
INSERT INTO `system_role_menu` VALUES (2, 2245);
INSERT INTO `system_role_menu` VALUES (2, 2253);
INSERT INTO `system_role_menu` VALUES (2, 2254);
INSERT INTO `system_role_menu` VALUES (2, 2255);
INSERT INTO `system_role_menu` VALUES (2, 2256);
INSERT INTO `system_role_menu` VALUES (2, 2257);
INSERT INTO `system_role_menu` VALUES (2, 2258);
INSERT INTO `system_role_menu` VALUES (2, 2259);
INSERT INTO `system_role_menu` VALUES (2, 2260);
INSERT INTO `system_role_menu` VALUES (2, 2261);
INSERT INTO `system_role_menu` VALUES (2, 2262);
INSERT INTO `system_role_menu` VALUES (2, 2263);
INSERT INTO `system_role_menu` VALUES (2, 2264);
INSERT INTO `system_role_menu` VALUES (2, 2265);
INSERT INTO `system_role_menu` VALUES (2, 2266);
INSERT INTO `system_role_menu` VALUES (2, 2267);
INSERT INTO `system_role_menu` VALUES (2, 2268);
INSERT INTO `system_role_menu` VALUES (2, 2269);
INSERT INTO `system_role_menu` VALUES (2, 2270);
INSERT INTO `system_role_menu` VALUES (2, 2271);
INSERT INTO `system_role_menu` VALUES (2, 2272);
INSERT INTO `system_role_menu` VALUES (2, 2273);
INSERT INTO `system_role_menu` VALUES (2, 2274);
INSERT INTO `system_role_menu` VALUES (2, 2276);
INSERT INTO `system_role_menu` VALUES (2, 2277);
INSERT INTO `system_role_menu` VALUES (2, 2278);
INSERT INTO `system_role_menu` VALUES (2, 2279);
INSERT INTO `system_role_menu` VALUES (2, 2280);
INSERT INTO `system_role_menu` VALUES (2, 2281);
INSERT INTO `system_role_menu` VALUES (2, 2282);
INSERT INTO `system_role_menu` VALUES (2, 2283);
INSERT INTO `system_role_menu` VALUES (2, 2284);
INSERT INTO `system_role_menu` VALUES (2, 2285);
INSERT INTO `system_role_menu` VALUES (2, 2286);
INSERT INTO `system_role_menu` VALUES (2, 2287);
INSERT INTO `system_role_menu` VALUES (2, 2288);
INSERT INTO `system_role_menu` VALUES (2, 2296);
INSERT INTO `system_role_menu` VALUES (2, 2297);
INSERT INTO `system_role_menu` VALUES (2, 2298);
INSERT INTO `system_role_menu` VALUES (2, 2299);
INSERT INTO `system_role_menu` VALUES (2, 2300);
INSERT INTO `system_role_menu` VALUES (2, 2301);
INSERT INTO `system_role_menu` VALUES (2, 2302);
INSERT INTO `system_role_menu` VALUES (2, 2303);
INSERT INTO `system_role_menu` VALUES (2, 2304);
INSERT INTO `system_role_menu` VALUES (2, 2305);
INSERT INTO `system_role_menu` VALUES (2, 2306);
INSERT INTO `system_role_menu` VALUES (2, 2307);
INSERT INTO `system_role_menu` VALUES (2, 2308);
INSERT INTO `system_role_menu` VALUES (2, 2309);
INSERT INTO `system_role_menu` VALUES (2, 2310);
INSERT INTO `system_role_menu` VALUES (2, 2311);
INSERT INTO `system_role_menu` VALUES (2, 2312);
INSERT INTO `system_role_menu` VALUES (2, 2313);
INSERT INTO `system_role_menu` VALUES (2, 2314);
INSERT INTO `system_role_menu` VALUES (2, 2315);
INSERT INTO `system_role_menu` VALUES (2, 2316);
INSERT INTO `system_role_menu` VALUES (4, 1);
INSERT INTO `system_role_menu` VALUES (4, 2);
INSERT INTO `system_role_menu` VALUES (4, 101);
INSERT INTO `system_role_menu` VALUES (4, 102);
INSERT INTO `system_role_menu` VALUES (4, 103);
INSERT INTO `system_role_menu` VALUES (4, 104);
INSERT INTO `system_role_menu` VALUES (4, 105);
INSERT INTO `system_role_menu` VALUES (4, 106);
INSERT INTO `system_role_menu` VALUES (4, 107);
INSERT INTO `system_role_menu` VALUES (4, 108);
INSERT INTO `system_role_menu` VALUES (4, 110);
INSERT INTO `system_role_menu` VALUES (4, 500);
INSERT INTO `system_role_menu` VALUES (4, 501);
INSERT INTO `system_role_menu` VALUES (4, 1007);
INSERT INTO `system_role_menu` VALUES (4, 1012);
INSERT INTO `system_role_menu` VALUES (4, 1016);
INSERT INTO `system_role_menu` VALUES (4, 1020);
INSERT INTO `system_role_menu` VALUES (4, 1025);
INSERT INTO `system_role_menu` VALUES (4, 1030);
INSERT INTO `system_role_menu` VALUES (4, 1035);
INSERT INTO `system_role_menu` VALUES (4, 1039);
INSERT INTO `system_role_menu` VALUES (4, 1042);
INSERT INTO `system_role_menu` VALUES (4, 1049);
INSERT INTO `system_role_menu` VALUES (4, 1050);
INSERT INTO `system_role_menu` VALUES (4, 1051);
INSERT INTO `system_role_menu` VALUES (4, 1052);
INSERT INTO `system_role_menu` VALUES (4, 1053);
INSERT INTO `system_role_menu` VALUES (4, 1054);
INSERT INTO `system_role_menu` VALUES (4, 2000);
INSERT INTO `system_role_menu` VALUES (4, 2001);
INSERT INTO `system_role_menu` VALUES (4, 2002);
INSERT INTO `system_role_menu` VALUES (4, 2003);
INSERT INTO `system_role_menu` VALUES (4, 2004);
INSERT INTO `system_role_menu` VALUES (4, 2005);
INSERT INTO `system_role_menu` VALUES (4, 2006);
INSERT INTO `system_role_menu` VALUES (4, 2007);
INSERT INTO `system_role_menu` VALUES (4, 2008);
INSERT INTO `system_role_menu` VALUES (4, 2009);
INSERT INTO `system_role_menu` VALUES (4, 2026);
INSERT INTO `system_role_menu` VALUES (4, 2027);
INSERT INTO `system_role_menu` VALUES (4, 2028);
INSERT INTO `system_role_menu` VALUES (4, 2029);
INSERT INTO `system_role_menu` VALUES (4, 2030);
INSERT INTO `system_role_menu` VALUES (4, 2031);
INSERT INTO `system_role_menu` VALUES (4, 2068);
INSERT INTO `system_role_menu` VALUES (4, 2069);
INSERT INTO `system_role_menu` VALUES (4, 2245);
INSERT INTO `system_role_menu` VALUES (4, 2253);
INSERT INTO `system_role_menu` VALUES (4, 2254);
INSERT INTO `system_role_menu` VALUES (4, 2255);
INSERT INTO `system_role_menu` VALUES (4, 2256);
INSERT INTO `system_role_menu` VALUES (4, 2257);
INSERT INTO `system_role_menu` VALUES (4, 2258);
INSERT INTO `system_role_menu` VALUES (4, 2259);
INSERT INTO `system_role_menu` VALUES (4, 2260);
INSERT INTO `system_role_menu` VALUES (4, 2261);
INSERT INTO `system_role_menu` VALUES (4, 2262);
INSERT INTO `system_role_menu` VALUES (4, 2263);
INSERT INTO `system_role_menu` VALUES (4, 2264);
INSERT INTO `system_role_menu` VALUES (4, 2265);
INSERT INTO `system_role_menu` VALUES (4, 2266);
INSERT INTO `system_role_menu` VALUES (4, 2267);
INSERT INTO `system_role_menu` VALUES (4, 2268);
INSERT INTO `system_role_menu` VALUES (4, 2269);
INSERT INTO `system_role_menu` VALUES (4, 2270);
INSERT INTO `system_role_menu` VALUES (4, 2271);
INSERT INTO `system_role_menu` VALUES (4, 2272);
INSERT INTO `system_role_menu` VALUES (4, 2273);
INSERT INTO `system_role_menu` VALUES (4, 2274);
INSERT INTO `system_role_menu` VALUES (4, 2276);
INSERT INTO `system_role_menu` VALUES (4, 2277);
INSERT INTO `system_role_menu` VALUES (4, 2278);
INSERT INTO `system_role_menu` VALUES (4, 2279);
INSERT INTO `system_role_menu` VALUES (4, 2280);
INSERT INTO `system_role_menu` VALUES (4, 2281);
INSERT INTO `system_role_menu` VALUES (4, 2282);
INSERT INTO `system_role_menu` VALUES (4, 2283);
INSERT INTO `system_role_menu` VALUES (4, 2284);
INSERT INTO `system_role_menu` VALUES (4, 2285);
INSERT INTO `system_role_menu` VALUES (4, 2286);
INSERT INTO `system_role_menu` VALUES (4, 2287);
INSERT INTO `system_role_menu` VALUES (4, 2288);
INSERT INTO `system_role_menu` VALUES (4, 2296);
INSERT INTO `system_role_menu` VALUES (4, 2297);
INSERT INTO `system_role_menu` VALUES (4, 2298);
INSERT INTO `system_role_menu` VALUES (4, 2299);
INSERT INTO `system_role_menu` VALUES (4, 2300);
INSERT INTO `system_role_menu` VALUES (4, 2301);
INSERT INTO `system_role_menu` VALUES (4, 2302);
INSERT INTO `system_role_menu` VALUES (4, 2303);
INSERT INTO `system_role_menu` VALUES (4, 2304);
INSERT INTO `system_role_menu` VALUES (4, 2305);
INSERT INTO `system_role_menu` VALUES (4, 2306);
INSERT INTO `system_role_menu` VALUES (4, 2307);
INSERT INTO `system_role_menu` VALUES (4, 2308);
INSERT INTO `system_role_menu` VALUES (4, 2309);
INSERT INTO `system_role_menu` VALUES (4, 2310);
INSERT INTO `system_role_menu` VALUES (4, 2311);
INSERT INTO `system_role_menu` VALUES (4, 2312);
INSERT INTO `system_role_menu` VALUES (4, 2313);
INSERT INTO `system_role_menu` VALUES (4, 2314);
INSERT INTO `system_role_menu` VALUES (4, 2315);
INSERT INTO `system_role_menu` VALUES (4, 2316);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
  `del_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `auth_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '认证平台id',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 763 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, 103, 'admin', '超级管理员', '00', NULL, '13812345678', '0', '/profile/avatar/2026/07/21/profilePhoto.png', '$2a$10$rCwuIzApQ0YwaQPD8ivtSeOGvpXpjo2ZVRx8/iSFV0TiyUZmmjTL2', '0', '0', '127.0.0.1', '2026-07-17 16:43:02', '吴同', '2026-07-17 10:47:27', '吴同', '2026-07-17 16:43:02', '超级管理员', NULL);
INSERT INTO `system_user` VALUES (2, 103, 'qModel', '吴同', '00', 'support@qiantong.tech', '19951942682', '1', '/profile/avatar/2026/07/21/profilePhoto.png', '$2a$10$butlDwq0TSIeP/rT9PGx6u571M.2VE.VsTAPoSSMOyQ0jmTc9TEyy', '0', '0', '127.0.0.1', '2026-07-17 16:02:40', '吴同', '2024-05-06 06:12:17', '吴同', '2026-07-17 16:02:40', '管理员', NULL);

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS `system_user_post`;
CREATE TABLE `system_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
INSERT INTO `system_user_post` VALUES (1, 1);
INSERT INTO `system_user_post` VALUES (2, 2);
INSERT INTO `system_user_post` VALUES (730, 1);
INSERT INTO `system_user_post` VALUES (733, 4);
INSERT INTO `system_user_post` VALUES (738, 4);
INSERT INTO `system_user_post` VALUES (742, 4);
INSERT INTO `system_user_post` VALUES (744, 4);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (1, 1);
INSERT INTO `system_user_role` VALUES (2, 4);

SET FOREIGN_KEY_CHECKS = 1;
