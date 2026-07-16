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
CREATE TABLE `system_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT NULL COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT NULL COMMENT '是否缓存（0缓存 1不缓存）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2253 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, '系统管理', 0, 40, 'system', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-m', 'admin', '2024-05-06 06:12:17', '小桐', '2025-12-31 10:03:45', '系统管理目录');
INSERT INTO `system_menu` VALUES (2, '系统监控', 0, 70, 'monitor', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-watch', 'admin', '2024-05-06 06:12:17', '小桐', '2025-12-31 10:04:15', '系统监控目录');
INSERT INTO `system_menu` VALUES (3, '系统工具', 0, 60, 'tool', NULL, NULL, 1, 0, NULL, 'M', '1', '1', NULL, 'system-tool', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 13:35:06', '系统工具目录');
INSERT INTO `system_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/system/user/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:13', '用户管理菜单');
INSERT INTO `system_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/system/role/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:36', '角色管理菜单');
INSERT INTO `system_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/system/menu/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 15:44:30', '菜单管理菜单');
INSERT INTO `system_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/system/dept/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:49', '部门管理菜单');
INSERT INTO `system_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/system/post/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-06 06:12:17', NULL, NULL, '岗位管理菜单');
INSERT INTO `system_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/system/dict/index', NULL, 1, 0, NULL, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 15:25:40', '字典管理菜单');
INSERT INTO `system_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/system/config/index', NULL, 1, 0, NULL, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 15:25:46', '参数设置菜单');
INSERT INTO `system_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/system/notice/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-06 06:12:17', NULL, NULL, '通知公告菜单');
INSERT INTO `system_menu` VALUES (108, '日志管理', 1, 9, 'log', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'log', 'admin', '2024-05-06 06:12:17', NULL, NULL, '日志管理菜单');
INSERT INTO `system_menu` VALUES (109, '在线用户', 2, 1, 'online', 'system/monitor/online/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-06 06:12:17', NULL, NULL, '在线用户菜单');
INSERT INTO `system_menu` VALUES (110, '定时任务', 2, 2, 'job', 'system/monitor/job/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-07-07 17:23:25', '定时任务菜单');
INSERT INTO `system_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'system/monitor/druid/index', NULL, 1, 0, NULL, 'C', '1', '1', 'monitor:druid:list', 'druid', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 14:06:21', '数据监控菜单');
INSERT INTO `system_menu` VALUES (112, '服务监控', 2, 4, 'server', 'system/monitor/server/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-06 06:12:17', NULL, NULL, '服务监控菜单');
INSERT INTO `system_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'system/monitor/cache/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-06 06:12:17', NULL, NULL, '缓存监控菜单');
INSERT INTO `system_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'system/monitor/cache/list', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-06 06:12:17', NULL, NULL, '缓存列表菜单');
INSERT INTO `system_menu` VALUES (115, '表单构建', 3, 1, 'build', 'system/tool/build/index', NULL, 1, 0, NULL, 'C', '1', '1', 'tool:build:list', 'build', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 13:34:05', '表单构建菜单');
INSERT INTO `system_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'system/tool/gen/index', NULL, 1, 0, NULL, 'C', '1', '0', 'tool:gen:list', 'code', 'admin', '2024-05-06 06:12:17', 'qModel', '2026-03-16 13:34:26', '代码生成菜单');
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
INSERT INTO `system_menu` VALUES (2023, '实例演示', 0, 80, 'example', NULL, NULL, 1, 0, NULL, 'M', '1', '1', NULL, 'code_new_iocn', 'admin', '2024-08-20 22:54:16', '小桐', '2026-01-08 17:35:00', NULL);
INSERT INTO `system_menu` VALUES (2024, 'websocket', 2023, 0, 'websocket', 'example/websocket', NULL, 1, 0, NULL, 'C', '0', '0', NULL, NULL, 'admin', '2024-08-20 22:57:35', 'admin', '2024-08-20 22:58:19', NULL);
INSERT INTO `system_menu` VALUES (2025, '支付演示', 2023, 1, 'pay', 'example/pay', NULL, 1, 0, 'pay', 'C', '0', '0', NULL, NULL, 'admin', '2024-08-25 16:33:48', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2026, '应用管理', 1, 1, 'client', 'system/auth/client/index', NULL, 1, 0, NULL, 'C', '1', '1', 'auth:client:list', 'github', 'admin', '2024-08-31 14:33:05', '小桐', '2025-12-31 15:38:56', '应用管理菜单');
INSERT INTO `system_menu` VALUES (2027, '应用管理查询', 2026, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:query', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2028, '应用管理新增', 2026, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:add', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2029, '应用管理修改', 2026, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:edit', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2030, '应用管理删除', 2026, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:remove', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2031, '应用管理导出', 2026, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:export', '#', 'admin', '2024-08-31 14:33:05', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2062, '消息', 1, 1, 'message', 'system/message/message/index', NULL, 1, 0, NULL, 'C', '0', '1', 'system:message:message:list', '#', 'admin', '2024-11-01 09:51:29', 'admin', '2024-11-01 09:52:41', '消息菜单');
INSERT INTO `system_menu` VALUES (2063, '消息查询', 2062, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:query', '#', 'admin', '2024-11-01 09:51:29', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2064, '消息新增', 2062, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:add', '#', 'admin', '2024-11-01 09:51:29', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2065, '消息修改', 2062, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:edit', '#', 'admin', '2024-11-01 09:51:29', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2066, '消息删除', 2062, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:remove', '#', 'admin', '2024-11-01 09:51:29', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2067, '消息导出', 2062, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:export', '#', 'admin', '2024-11-01 09:51:29', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2068, '消息模板', 1, 0, 'messageTemplate', 'system/system/messageTemplate/index', NULL, 1, 0, NULL, 'C', '1', '1', 'system:message:messageTemplate:list', 'email', 'admin', '2024-11-01 09:52:03', '小桐', '2025-12-31 15:38:50', '消息模板菜单');
INSERT INTO `system_menu` VALUES (2069, '消息模板查询', 2068, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:query', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2070, '消息模板新增', 2068, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:add', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2071, '消息模板修改', 2068, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:edit', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2072, '消息模板删除', 2068, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:remove', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2073, '消息模板导出', 2068, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:export', '#', 'admin', '2024-11-01 09:52:03', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2075, '组件测试', 2023, 8, 'comCeshi', 'example/coms', NULL, 1, 0, 'comCeshi', 'C', '0', '0', NULL, '#', 'admin', '2024-11-07 11:34:00', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2076, '单选多选', 2023, 4, 'choose', 'system/tool/choose/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2024-11-26 10:11:59', 'admin', '2024-11-26 11:50:33', NULL);
INSERT INTO `system_menu` VALUES (2084, '用户类型', 2023, 1, 'userType', 'example/user/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:user:list', '#', 'admin', '2024-11-27 10:03:19', NULL, NULL, '用户类型菜单');
INSERT INTO `system_menu` VALUES (2085, '用户类型查询', 2084, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:query', '#', 'admin', '2024-11-27 10:03:19', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2086, '用户类型新增', 2084, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:add', '#', 'admin', '2024-11-27 10:03:19', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2087, '用户类型修改', 2084, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:edit', '#', 'admin', '2024-11-27 10:03:19', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2088, '用户类型删除', 2084, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:remove', '#', 'admin', '2024-11-27 10:03:19', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2089, '用户类型导出', 2084, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:export', '#', 'admin', '2024-11-27 10:03:19', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2092, '复杂详情', 2023, 10, 'complexdetails', 'example/genStudent/detail/studentDetail', NULL, 1, 1, 'complexdetails', 'C', '1', '0', NULL, '#', 'admin', '2024-12-03 10:03:56', 'admin', '2024-12-09 12:51:36', NULL);
INSERT INTO `system_menu` VALUES (2123, '示例部门', 2023, 1, 'dept2', 'example/gen/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:gen:dept:list', '#', 'admin', '2024-12-09 11:57:23', 'admin', '2024-12-09 13:01:54', '示例部门菜单');
INSERT INTO `system_menu` VALUES (2124, '示例部门查询', 2123, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:gen:dept:query', '#', 'admin', '2024-12-09 11:57:23', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2125, '示例部门新增', 2123, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:gen:dept:add', '#', 'admin', '2024-12-09 11:57:24', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2126, '示例部门修改', 2123, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:gen:dept:edit', '#', 'admin', '2024-12-09 11:57:24', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2127, '示例部门删除', 2123, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:gen:dept:remove', '#', 'admin', '2024-12-09 11:57:24', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2128, '示例部门导出', 2123, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:gen:dept:export', '#', 'admin', '2024-12-09 11:57:24', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2135, '学生', 2023, 1, 'student', 'example/genStudent/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:genStudent:student:list', '#', 'admin', '2024-12-09 12:40:17', NULL, NULL, '学生菜单');
INSERT INTO `system_menu` VALUES (2136, '学生查询', 2135, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:genStudent:student:query', '#', 'admin', '2024-12-09 12:40:17', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2137, '学生新增', 2135, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:genStudent:student:add', '#', 'admin', '2024-12-09 12:40:18', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2138, '学生修改', 2135, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:genStudent:student:edit', '#', 'admin', '2024-12-09 12:40:18', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2139, '学生删除', 2135, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:genStudent:student:remove', '#', 'admin', '2024-12-09 12:40:18', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2140, '学生导出', 2135, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:genStudent:student:export', '#', 'admin', '2024-12-09 12:40:18', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2141, '学生导入', 2135, 6, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'example:genStudent:student:import', '#', 'admin', '2024-12-12 15:47:12', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2190, '系统配置', 1, 11, 'sysContent', 'system/system/content/index', NULL, 1, 0, NULL, 'C', '1', '1', 'system:system:content:query', 'build', 'admin', '2024-12-31 11:16:14', '小桐', '2025-12-31 15:39:08', NULL);
INSERT INTO `system_menu` VALUES (2191, '灌溉', 2023, 5, 'test', 'plant/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-08-08 13:03:04', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2192, '组态管理生成', 0, 20, 'graph', NULL, NULL, 1, 0, NULL, 'M', '1', '1', NULL, 'system_new_icon', 'admin', '2025-09-16 14:58:15', 'admin', '2025-12-29 16:04:10', NULL);
INSERT INTO `system_menu` VALUES (2193, '图元管理', 0, 30, 'element', NULL, NULL, 1, 0, NULL, 'M', '1', '1', NULL, 'system', 'admin', '2025-09-16 15:00:10', 'admin', '2025-12-29 16:04:16', NULL);
INSERT INTO `system_menu` VALUES (2194, 'topo_element', 2193, 1, 'element', 'topo/element/index', NULL, 1, 0, NULL, 'C', '0', '0', 'topo:element:element:list', '#', 'admin', '2025-09-16 15:12:39', NULL, NULL, 'topo_element菜单');
INSERT INTO `system_menu` VALUES (2195, 'topo_element查询', 2194, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:element:element:query', '#', 'admin', '2025-09-16 15:12:39', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2196, 'topo_element新增', 2194, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:element:element:add', '#', 'admin', '2025-09-16 15:12:39', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2197, 'topo_element修改', 2194, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:element:element:edit', '#', 'admin', '2025-09-16 15:12:39', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2198, 'topo_element删除', 2194, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:element:element:remove', '#', 'admin', '2025-09-16 15:12:39', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2199, 'topo_element导出', 2194, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:element:element:export', '#', 'admin', '2025-09-16 15:12:39', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2200, 'topo_element导入', 2194, 6, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:element:element:import', '#', 'admin', '2025-09-16 15:12:39', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2208, 'topo_graph', 2192, 1, 'graph', 'topo/graph/index', NULL, 1, 0, NULL, 'C', '0', '0', 'topo:graph:graph:list', '#', 'admin', '2025-09-16 15:24:45', NULL, NULL, 'topo_graph菜单');
INSERT INTO `system_menu` VALUES (2209, 'topo_graph查询', 2208, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:graph:graph:query', '#', 'admin', '2025-09-16 15:24:45', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2210, 'topo_graph新增', 2208, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:graph:graph:add', '#', 'admin', '2025-09-16 15:24:45', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2211, 'topo_graph修改', 2208, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:graph:graph:edit', '#', 'admin', '2025-09-16 15:24:45', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2212, 'topo_graph删除', 2208, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:graph:graph:remove', '#', 'admin', '2025-09-16 15:24:45', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2213, 'topo_graph导出', 2208, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:graph:graph:export', '#', 'admin', '2025-09-16 15:24:45', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2214, 'topo_graph导入', 2208, 6, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:graph:graph:import', '#', 'admin', '2025-09-16 15:24:45', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2215, 'topo_element_type', 2193, 1, 'type', 'topo/elementType/index', NULL, 1, 0, NULL, 'C', '0', '0', 'topo:elementType:type:list', '#', 'admin', '2025-09-17 10:22:06', NULL, NULL, 'topo_element_type菜单');
INSERT INTO `system_menu` VALUES (2216, 'topo_element_type查询', 2215, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:elementType:type:query', '#', 'admin', '2025-09-17 10:22:06', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2217, 'topo_element_type新增', 2215, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:elementType:type:add', '#', 'admin', '2025-09-17 10:22:06', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2218, 'topo_element_type修改', 2215, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:elementType:type:edit', '#', 'admin', '2025-09-17 10:22:06', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2219, 'topo_element_type删除', 2215, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:elementType:type:remove', '#', 'admin', '2025-09-17 10:22:06', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2220, 'topo_element_type导出', 2215, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:elementType:type:export', '#', 'admin', '2025-09-17 10:22:06', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2221, 'topo_element_type导入', 2215, 6, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'topo:elementType:type:import', '#', 'admin', '2025-09-17 10:22:06', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2236, '泵站信息', 1, 1, 'pust', 'system/testPust/index', NULL, 1, 0, NULL, 'C', '1', '1', 'system:testPust:pust:list', '#', 'admin', '2025-11-11 14:43:41', '小桐', '2025-12-30 13:12:30', '泵站信息菜单');
INSERT INTO `system_menu` VALUES (2237, '泵站信息查询', 2236, 1, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:testPust:pust:query', '#', 'admin', '2025-11-11 14:43:42', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2238, '泵站信息新增', 2236, 2, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:testPust:pust:add', '#', 'admin', '2025-11-11 14:43:42', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2239, '泵站信息修改', 2236, 3, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:testPust:pust:edit', '#', 'admin', '2025-11-11 14:43:42', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2240, '泵站信息删除', 2236, 4, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:testPust:pust:remove', '#', 'admin', '2025-11-11 14:43:42', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2241, '泵站信息导出', 2236, 5, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:testPust:pust:export', '#', 'admin', '2025-11-11 14:43:42', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2242, '泵站信息导入', 2236, 6, '#', NULL, NULL, 1, 0, NULL, 'F', '0', '0', 'system:testPust:pust:import', '#', 'admin', '2025-11-11 14:43:42', NULL, NULL, NULL);
INSERT INTO `system_menu` VALUES (2243, '模型管理', 0, 11, 'model', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'model-administration', 'admin', '2025-11-14 10:01:45', '小桐', '2025-12-31 09:58:12', NULL);
INSERT INTO `system_menu` VALUES (2244, '模型分类', 2243, 0, 'type', 'model/modelClassify/index', NULL, 1, 0, NULL, 'C', '0', '0', '', '#', 'admin', '2025-11-14 10:06:39', 'qModel', '2026-07-14 15:45:28', NULL);
INSERT INTO `system_menu` VALUES (2245, '模型管理', 2243, 1, 'version', 'model/modelManage/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-14 15:32:43', '小桐', '2026-01-15 10:11:47', NULL);
INSERT INTO `system_menu` VALUES (2246, '模型输入管理', 2243, 2, 'input', 'model/inputList/index', NULL, 1, 0, NULL, 'C', '1', '1', '', '#', 'admin', '2025-11-17 04:34:18', 'qModel', '2026-07-14 15:48:07', NULL);
INSERT INTO `system_menu` VALUES (2247, '模型输出管理', 2243, 3, 'output', 'model/outputList/index', NULL, 1, 0, NULL, 'C', '1', '1', '', '#', 'admin', '2025-11-17 04:34:46', 'qModel', '2026-07-14 15:48:10', NULL);
INSERT INTO `system_menu` VALUES (2248, '模拟计算', 2252, 4, 'compute', 'model/computeList/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-17 04:35:16', '小桐', '2026-01-15 18:08:05', NULL);
INSERT INTO `system_menu` VALUES (2249, '历史记录', 2251, 5, 'operate', 'model/operateList/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-17 04:35:45', '小桐', '2026-01-15 18:09:07', NULL);
INSERT INTO `system_menu` VALUES (2250, '类目管理', 0, 10, 'model/modelClassify', NULL, NULL, 1, 0, NULL, 'M', '1', '1', '', 'category-management', 'admin', '2025-12-29 16:06:15', 'qModel', '2026-07-14 15:48:03', NULL);
INSERT INTO `system_menu` VALUES (2251, '计算历史', 0, 13, 'model/operateList', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'calculate-history', 'admin', '2025-12-29 16:09:40', '小桐', '2025-12-31 10:02:09', NULL);
INSERT INTO `system_menu` VALUES (2252, '模型计算', 0, 12, 'model/computeList', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'model-calculation', 'admin', '2025-12-29 16:18:52', '小桐', '2026-01-06 12:01:25', NULL);
INSERT INTO `system_menu` VALUES (2253, '模型审批', 2243, 4, 'approval', 'model/approval/index', NULL, 1, 0, NULL, 'C', '0', '0', '', NULL, 'qModel', '2026-07-14 15:49:56', 'qModel', '2026-07-16 10:14:01', NULL);

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
INSERT INTO `system_notice` VALUES (12, 'qModel 模型服务平台正式上线！', '2', 0x3C703EE98EB4E6889CE6BB91E5AFB0E5A0A5E78FAEE98D8FE69D91E6B9B4E780B9EFBD85E7ABB7E9949BE5AEB74D6F64656C266E6273703BE5A6AFE280B3E780B7E98F88E5B685E5A79FE9AA9EE586B2E5BDB4E6B59CE5BA9DE7B296E98F83E383A6EE849CE5AFAEE5BF8EE7AC82E7BBBEE58CA1E7B492E6B5A3E6BB80E8B49FE98F82E9A281E7ABB4E6B5A0EFBD86E6ABA4E991B3E88AA5C481E98DA8E5ACACEE85B8E9909EE59795E7AC8CE98F88E5B685E5A79FE98D96E6A0A7E992A9E98D99E5B8AEE7B49D714D6F64656C266E6273703BE98F83E384A5E6B9AAE98EB5E692BBEFBFBDE6B0ABE7B2A0E5A6AFE280B3E780B7E5AFAEEFBFBDE98D99E68899EFBFBDE4BDBDEE8684E7BC81E586A6EFBFBDE4BE80E584B4E7BC83E68F92E59F8CE690B4E69782E695A4E990A8E58BABE58F8FE996BEE68D90E79FBEE5A8B4E4BDBAE296BCE9949BE5B1BDE5A7AAE98D94E6B69AEE9D96E990AEE69780E6BA80E98F8BE58BA9EFBFBDE4BDB9E69682E690B4E6BB88E584B4E99782E384A5E5BCB7E6B5BCE4BDB7E7AC9FE780B9E782B5E5B987E988A5E6BB84C481E98DA8E5ACAAE5B586E98F88E5B685E5A79FE988A5E6BF88E6AE91E6A582E6A8BBE699A5E98D97E5BF93E68293E98A86EFBFBD2F702667743B3C2F703E3C703E3C62723E3C2F703E3C703EE9AA9EE586B2E5BDB4E98F80EE889BE5AF94E6BEB6E6B0B3EE87A2E791B7EFBFBDE5A6AFE280B3E780B7E98EBAE383A5E58F86E9949BE59CA57974686F6E2F4A6176612F455845E9949BE5A488EFBFBDE4BDBDE59A9CE98D94E384A5E5AFB2E780B9E791B0E6AB92E98D96E6A0ADE584B4E7BC83E5B182EFBFBDE4B8845049266E6273703BE98F8DE59BA7E599AFE98D96E6A0A7E5BD82E794AFE586BFE7B49DE9AA9EE888B5E5BD81E6B89AE6B699C481E98DA8E5ACADE780BAE98D9AE5A09BEFBFBDE4BDBAE7B4AAE98EBAE68E8BEFBFBDE4BDBAE6B483E98EBAD185E79391E6A582E6A8BCE9AA87E991B3E89789E5A78FE98A86E5829CE6B4B0E98D93E5B685E587A1E98EB4E684ACE5A79BE99786E59798E59E9AE5A798E69D91E59F84E98A86E4BDB9E79AB5E7929EC2B0EFBFBDE4BDB7E6B0A6E996ABE6B0B1E79391E6BEB6E6B0ABE9879CE7909BE5B1BCE7AC9FE98DA6E78398E6AB99E5A6AFE280B3E780B7E9949BE5B1BDE58F8FE99788E388A1E695AEE98EB8E4BDB8E6B597E6B59CD183E5AFB2E9909CEE889AEE95A8E996AEE384A7E8AEB2E98A86EFBFBD2F702667743B3C2F703E3C703E3C62723E3C2F703E3C703EE98F88EE8185E6BDB5E9949BE5AEB74D6F64656C266E6273703BE7818FE59798E5AF94E7BC81EE85A1E587AFE6B5A0EFBD8FE7B49DE98EB5E692BBEFBFBDE78AB2E7B491E98F80E4BFB1EFBFBDE4BDB8E795A8E98D8FE384A3EFBFBDE4BE80E78FAEE98F81E5A0A2E6AE91E5A6AFE280B3E780B7E990A2E786B8EFBFBDE4BDB7E7B68BE7BBAFE6B187EFBFBDE5829BEE82BDE69DA9E5BAA1E7AE8DE6BEB6D183E7B491E98D99E688A3EFBFBDE591ADE68BB0E990A2E384A6E59F9BE5A889E384A5E594BDE6B5A3E8B7A8E695A4E9949BE5B1BDE58FA1E98D9AE5B1BEE5B8B0E7BBB1E388A1E6ABA4E991B3E88AA5C481E98DA8E5ACACE6AE91E98F83E78ABBE6AABAE98D99EE889DE58598E9949BEFBFBD2F702667743B3C2F703E, '0', '小桐', '2025-12-30 11:32:59', '小桐', '2025-12-30 14:01:41', NULL);
INSERT INTO `system_notice` VALUES (13, 'qModel期待与您携手共建知识体系！', '1', 0x3C703EE98F88E786B7E7B79FE98EAEE384A7E6AE91E98D94E78AB2E58F863C2F703E, '0', '小桐', '2025-12-30 14:01:26', '小桐', '2025-12-30 14:01:37', NULL);

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
INSERT INTO `system_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-05-06 06:12:17', NULL, NULL, '超级管理员');
INSERT INTO `system_role` VALUES (2, '普通角色', 'common', 2, '1', 1, 1, '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2025-11-11 14:45:59', '普通角色');
INSERT INTO `system_role` VALUES (3, '默认角色', 'default', 3, '1', 1, 1, '0', '0', 'admin', '2024-12-20 14:54:59', 'admin', '2025-02-14 15:31:42', NULL);
INSERT INTO `system_role` VALUES (4, '组态图和图元管理测试', 'topo', 0, '1', 1, 1, '0', '0', 'admin', '2025-09-18 13:02:58', 'admin', '2025-09-18 13:57:37', NULL);

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
INSERT INTO `system_role_menu` VALUES (2, 1);
INSERT INTO `system_role_menu` VALUES (2, 2);
INSERT INTO `system_role_menu` VALUES (2, 3);
INSERT INTO `system_role_menu` VALUES (2, 100);
INSERT INTO `system_role_menu` VALUES (2, 101);
INSERT INTO `system_role_menu` VALUES (2, 102);
INSERT INTO `system_role_menu` VALUES (2, 103);
INSERT INTO `system_role_menu` VALUES (2, 104);
INSERT INTO `system_role_menu` VALUES (2, 105);
INSERT INTO `system_role_menu` VALUES (2, 106);
INSERT INTO `system_role_menu` VALUES (2, 107);
INSERT INTO `system_role_menu` VALUES (2, 108);
INSERT INTO `system_role_menu` VALUES (2, 109);
INSERT INTO `system_role_menu` VALUES (2, 110);
INSERT INTO `system_role_menu` VALUES (2, 111);
INSERT INTO `system_role_menu` VALUES (2, 112);
INSERT INTO `system_role_menu` VALUES (2, 113);
INSERT INTO `system_role_menu` VALUES (2, 114);
INSERT INTO `system_role_menu` VALUES (2, 115);
INSERT INTO `system_role_menu` VALUES (2, 116);
INSERT INTO `system_role_menu` VALUES (2, 117);
INSERT INTO `system_role_menu` VALUES (2, 500);
INSERT INTO `system_role_menu` VALUES (2, 501);
INSERT INTO `system_role_menu` VALUES (2, 1000);
INSERT INTO `system_role_menu` VALUES (2, 1001);
INSERT INTO `system_role_menu` VALUES (2, 1002);
INSERT INTO `system_role_menu` VALUES (2, 1003);
INSERT INTO `system_role_menu` VALUES (2, 1004);
INSERT INTO `system_role_menu` VALUES (2, 1005);
INSERT INTO `system_role_menu` VALUES (2, 1006);
INSERT INTO `system_role_menu` VALUES (2, 1007);
INSERT INTO `system_role_menu` VALUES (2, 1008);
INSERT INTO `system_role_menu` VALUES (2, 1009);
INSERT INTO `system_role_menu` VALUES (2, 1010);
INSERT INTO `system_role_menu` VALUES (2, 1011);
INSERT INTO `system_role_menu` VALUES (2, 1012);
INSERT INTO `system_role_menu` VALUES (2, 1013);
INSERT INTO `system_role_menu` VALUES (2, 1014);
INSERT INTO `system_role_menu` VALUES (2, 1015);
INSERT INTO `system_role_menu` VALUES (2, 1016);
INSERT INTO `system_role_menu` VALUES (2, 1017);
INSERT INTO `system_role_menu` VALUES (2, 1018);
INSERT INTO `system_role_menu` VALUES (2, 1019);
INSERT INTO `system_role_menu` VALUES (2, 1020);
INSERT INTO `system_role_menu` VALUES (2, 1021);
INSERT INTO `system_role_menu` VALUES (2, 1022);
INSERT INTO `system_role_menu` VALUES (2, 1023);
INSERT INTO `system_role_menu` VALUES (2, 1024);
INSERT INTO `system_role_menu` VALUES (2, 1025);
INSERT INTO `system_role_menu` VALUES (2, 1026);
INSERT INTO `system_role_menu` VALUES (2, 1027);
INSERT INTO `system_role_menu` VALUES (2, 1028);
INSERT INTO `system_role_menu` VALUES (2, 1029);
INSERT INTO `system_role_menu` VALUES (2, 1030);
INSERT INTO `system_role_menu` VALUES (2, 1031);
INSERT INTO `system_role_menu` VALUES (2, 1032);
INSERT INTO `system_role_menu` VALUES (2, 1033);
INSERT INTO `system_role_menu` VALUES (2, 1034);
INSERT INTO `system_role_menu` VALUES (2, 1035);
INSERT INTO `system_role_menu` VALUES (2, 1036);
INSERT INTO `system_role_menu` VALUES (2, 1037);
INSERT INTO `system_role_menu` VALUES (2, 1038);
INSERT INTO `system_role_menu` VALUES (2, 1039);
INSERT INTO `system_role_menu` VALUES (2, 1040);
INSERT INTO `system_role_menu` VALUES (2, 1041);
INSERT INTO `system_role_menu` VALUES (2, 1042);
INSERT INTO `system_role_menu` VALUES (2, 1043);
INSERT INTO `system_role_menu` VALUES (2, 1044);
INSERT INTO `system_role_menu` VALUES (2, 1045);
INSERT INTO `system_role_menu` VALUES (2, 1046);
INSERT INTO `system_role_menu` VALUES (2, 1047);
INSERT INTO `system_role_menu` VALUES (2, 1048);
INSERT INTO `system_role_menu` VALUES (2, 1049);
INSERT INTO `system_role_menu` VALUES (2, 1050);
INSERT INTO `system_role_menu` VALUES (2, 1051);
INSERT INTO `system_role_menu` VALUES (2, 1052);
INSERT INTO `system_role_menu` VALUES (2, 1053);
INSERT INTO `system_role_menu` VALUES (2, 1054);
INSERT INTO `system_role_menu` VALUES (2, 1055);
INSERT INTO `system_role_menu` VALUES (2, 1056);
INSERT INTO `system_role_menu` VALUES (2, 1057);
INSERT INTO `system_role_menu` VALUES (2, 1058);
INSERT INTO `system_role_menu` VALUES (2, 1059);
INSERT INTO `system_role_menu` VALUES (2, 1060);
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
INSERT INTO `system_role_menu` VALUES (2, 2010);
INSERT INTO `system_role_menu` VALUES (2, 2011);
INSERT INTO `system_role_menu` VALUES (2, 2012);
INSERT INTO `system_role_menu` VALUES (2, 2013);
INSERT INTO `system_role_menu` VALUES (2, 2014);
INSERT INTO `system_role_menu` VALUES (2, 2015);
INSERT INTO `system_role_menu` VALUES (2, 2016);
INSERT INTO `system_role_menu` VALUES (2, 2017);
INSERT INTO `system_role_menu` VALUES (2, 2018);
INSERT INTO `system_role_menu` VALUES (2, 2019);
INSERT INTO `system_role_menu` VALUES (2, 2020);
INSERT INTO `system_role_menu` VALUES (2, 2021);
INSERT INTO `system_role_menu` VALUES (2, 2022);
INSERT INTO `system_role_menu` VALUES (2, 2023);
INSERT INTO `system_role_menu` VALUES (2, 2024);
INSERT INTO `system_role_menu` VALUES (2, 2025);
INSERT INTO `system_role_menu` VALUES (2, 2026);
INSERT INTO `system_role_menu` VALUES (2, 2027);
INSERT INTO `system_role_menu` VALUES (2, 2028);
INSERT INTO `system_role_menu` VALUES (2, 2029);
INSERT INTO `system_role_menu` VALUES (2, 2030);
INSERT INTO `system_role_menu` VALUES (2, 2031);
INSERT INTO `system_role_menu` VALUES (2, 2062);
INSERT INTO `system_role_menu` VALUES (2, 2063);
INSERT INTO `system_role_menu` VALUES (2, 2064);
INSERT INTO `system_role_menu` VALUES (2, 2065);
INSERT INTO `system_role_menu` VALUES (2, 2066);
INSERT INTO `system_role_menu` VALUES (2, 2067);
INSERT INTO `system_role_menu` VALUES (2, 2068);
INSERT INTO `system_role_menu` VALUES (2, 2069);
INSERT INTO `system_role_menu` VALUES (2, 2070);
INSERT INTO `system_role_menu` VALUES (2, 2071);
INSERT INTO `system_role_menu` VALUES (2, 2072);
INSERT INTO `system_role_menu` VALUES (2, 2073);
INSERT INTO `system_role_menu` VALUES (2, 2075);
INSERT INTO `system_role_menu` VALUES (2, 2076);
INSERT INTO `system_role_menu` VALUES (2, 2084);
INSERT INTO `system_role_menu` VALUES (2, 2085);
INSERT INTO `system_role_menu` VALUES (2, 2086);
INSERT INTO `system_role_menu` VALUES (2, 2087);
INSERT INTO `system_role_menu` VALUES (2, 2088);
INSERT INTO `system_role_menu` VALUES (2, 2089);
INSERT INTO `system_role_menu` VALUES (2, 2092);
INSERT INTO `system_role_menu` VALUES (2, 2123);
INSERT INTO `system_role_menu` VALUES (2, 2124);
INSERT INTO `system_role_menu` VALUES (2, 2125);
INSERT INTO `system_role_menu` VALUES (2, 2126);
INSERT INTO `system_role_menu` VALUES (2, 2127);
INSERT INTO `system_role_menu` VALUES (2, 2128);
INSERT INTO `system_role_menu` VALUES (2, 2135);
INSERT INTO `system_role_menu` VALUES (2, 2136);
INSERT INTO `system_role_menu` VALUES (2, 2137);
INSERT INTO `system_role_menu` VALUES (2, 2138);
INSERT INTO `system_role_menu` VALUES (2, 2139);
INSERT INTO `system_role_menu` VALUES (2, 2140);
INSERT INTO `system_role_menu` VALUES (2, 2141);
INSERT INTO `system_role_menu` VALUES (2, 2190);
INSERT INTO `system_role_menu` VALUES (2, 2236);
INSERT INTO `system_role_menu` VALUES (2, 2237);
INSERT INTO `system_role_menu` VALUES (2, 2238);
INSERT INTO `system_role_menu` VALUES (2, 2239);
INSERT INTO `system_role_menu` VALUES (2, 2240);
INSERT INTO `system_role_menu` VALUES (2, 2241);
INSERT INTO `system_role_menu` VALUES (2, 2242);
INSERT INTO `system_role_menu` VALUES (3, 1);
INSERT INTO `system_role_menu` VALUES (3, 2);
INSERT INTO `system_role_menu` VALUES (3, 3);
INSERT INTO `system_role_menu` VALUES (3, 100);
INSERT INTO `system_role_menu` VALUES (3, 101);
INSERT INTO `system_role_menu` VALUES (3, 102);
INSERT INTO `system_role_menu` VALUES (3, 103);
INSERT INTO `system_role_menu` VALUES (3, 104);
INSERT INTO `system_role_menu` VALUES (3, 105);
INSERT INTO `system_role_menu` VALUES (3, 106);
INSERT INTO `system_role_menu` VALUES (3, 107);
INSERT INTO `system_role_menu` VALUES (3, 108);
INSERT INTO `system_role_menu` VALUES (3, 109);
INSERT INTO `system_role_menu` VALUES (3, 110);
INSERT INTO `system_role_menu` VALUES (3, 111);
INSERT INTO `system_role_menu` VALUES (3, 112);
INSERT INTO `system_role_menu` VALUES (3, 113);
INSERT INTO `system_role_menu` VALUES (3, 114);
INSERT INTO `system_role_menu` VALUES (3, 115);
INSERT INTO `system_role_menu` VALUES (3, 116);
INSERT INTO `system_role_menu` VALUES (3, 117);
INSERT INTO `system_role_menu` VALUES (3, 500);
INSERT INTO `system_role_menu` VALUES (3, 501);
INSERT INTO `system_role_menu` VALUES (3, 1000);
INSERT INTO `system_role_menu` VALUES (3, 1001);
INSERT INTO `system_role_menu` VALUES (3, 1002);
INSERT INTO `system_role_menu` VALUES (3, 1003);
INSERT INTO `system_role_menu` VALUES (3, 1004);
INSERT INTO `system_role_menu` VALUES (3, 1005);
INSERT INTO `system_role_menu` VALUES (3, 1006);
INSERT INTO `system_role_menu` VALUES (3, 1007);
INSERT INTO `system_role_menu` VALUES (3, 1008);
INSERT INTO `system_role_menu` VALUES (3, 1009);
INSERT INTO `system_role_menu` VALUES (3, 1010);
INSERT INTO `system_role_menu` VALUES (3, 1011);
INSERT INTO `system_role_menu` VALUES (3, 1012);
INSERT INTO `system_role_menu` VALUES (3, 1013);
INSERT INTO `system_role_menu` VALUES (3, 1014);
INSERT INTO `system_role_menu` VALUES (3, 1015);
INSERT INTO `system_role_menu` VALUES (3, 1016);
INSERT INTO `system_role_menu` VALUES (3, 1017);
INSERT INTO `system_role_menu` VALUES (3, 1018);
INSERT INTO `system_role_menu` VALUES (3, 1019);
INSERT INTO `system_role_menu` VALUES (3, 1020);
INSERT INTO `system_role_menu` VALUES (3, 1021);
INSERT INTO `system_role_menu` VALUES (3, 1022);
INSERT INTO `system_role_menu` VALUES (3, 1023);
INSERT INTO `system_role_menu` VALUES (3, 1024);
INSERT INTO `system_role_menu` VALUES (3, 1025);
INSERT INTO `system_role_menu` VALUES (3, 1026);
INSERT INTO `system_role_menu` VALUES (3, 1027);
INSERT INTO `system_role_menu` VALUES (3, 1028);
INSERT INTO `system_role_menu` VALUES (3, 1029);
INSERT INTO `system_role_menu` VALUES (3, 1030);
INSERT INTO `system_role_menu` VALUES (3, 1031);
INSERT INTO `system_role_menu` VALUES (3, 1032);
INSERT INTO `system_role_menu` VALUES (3, 1033);
INSERT INTO `system_role_menu` VALUES (3, 1034);
INSERT INTO `system_role_menu` VALUES (3, 1035);
INSERT INTO `system_role_menu` VALUES (3, 1036);
INSERT INTO `system_role_menu` VALUES (3, 1037);
INSERT INTO `system_role_menu` VALUES (3, 1038);
INSERT INTO `system_role_menu` VALUES (3, 1039);
INSERT INTO `system_role_menu` VALUES (3, 1040);
INSERT INTO `system_role_menu` VALUES (3, 1041);
INSERT INTO `system_role_menu` VALUES (3, 1042);
INSERT INTO `system_role_menu` VALUES (3, 1043);
INSERT INTO `system_role_menu` VALUES (3, 1044);
INSERT INTO `system_role_menu` VALUES (3, 1045);
INSERT INTO `system_role_menu` VALUES (3, 1046);
INSERT INTO `system_role_menu` VALUES (3, 1047);
INSERT INTO `system_role_menu` VALUES (3, 1048);
INSERT INTO `system_role_menu` VALUES (3, 1049);
INSERT INTO `system_role_menu` VALUES (3, 1050);
INSERT INTO `system_role_menu` VALUES (3, 1051);
INSERT INTO `system_role_menu` VALUES (3, 1052);
INSERT INTO `system_role_menu` VALUES (3, 1053);
INSERT INTO `system_role_menu` VALUES (3, 1054);
INSERT INTO `system_role_menu` VALUES (3, 1055);
INSERT INTO `system_role_menu` VALUES (3, 1056);
INSERT INTO `system_role_menu` VALUES (3, 1057);
INSERT INTO `system_role_menu` VALUES (3, 1058);
INSERT INTO `system_role_menu` VALUES (3, 1059);
INSERT INTO `system_role_menu` VALUES (3, 1060);
INSERT INTO `system_role_menu` VALUES (3, 2000);
INSERT INTO `system_role_menu` VALUES (3, 2001);
INSERT INTO `system_role_menu` VALUES (3, 2002);
INSERT INTO `system_role_menu` VALUES (3, 2003);
INSERT INTO `system_role_menu` VALUES (3, 2004);
INSERT INTO `system_role_menu` VALUES (3, 2005);
INSERT INTO `system_role_menu` VALUES (3, 2006);
INSERT INTO `system_role_menu` VALUES (3, 2007);
INSERT INTO `system_role_menu` VALUES (3, 2008);
INSERT INTO `system_role_menu` VALUES (3, 2009);
INSERT INTO `system_role_menu` VALUES (3, 2010);
INSERT INTO `system_role_menu` VALUES (3, 2011);
INSERT INTO `system_role_menu` VALUES (3, 2012);
INSERT INTO `system_role_menu` VALUES (3, 2013);
INSERT INTO `system_role_menu` VALUES (3, 2014);
INSERT INTO `system_role_menu` VALUES (3, 2015);
INSERT INTO `system_role_menu` VALUES (3, 2016);
INSERT INTO `system_role_menu` VALUES (3, 2017);
INSERT INTO `system_role_menu` VALUES (3, 2018);
INSERT INTO `system_role_menu` VALUES (3, 2019);
INSERT INTO `system_role_menu` VALUES (3, 2020);
INSERT INTO `system_role_menu` VALUES (3, 2021);
INSERT INTO `system_role_menu` VALUES (3, 2022);
INSERT INTO `system_role_menu` VALUES (3, 2023);
INSERT INTO `system_role_menu` VALUES (3, 2024);
INSERT INTO `system_role_menu` VALUES (3, 2025);
INSERT INTO `system_role_menu` VALUES (3, 2026);
INSERT INTO `system_role_menu` VALUES (3, 2027);
INSERT INTO `system_role_menu` VALUES (3, 2028);
INSERT INTO `system_role_menu` VALUES (3, 2029);
INSERT INTO `system_role_menu` VALUES (3, 2030);
INSERT INTO `system_role_menu` VALUES (3, 2031);
INSERT INTO `system_role_menu` VALUES (3, 2062);
INSERT INTO `system_role_menu` VALUES (3, 2063);
INSERT INTO `system_role_menu` VALUES (3, 2064);
INSERT INTO `system_role_menu` VALUES (3, 2065);
INSERT INTO `system_role_menu` VALUES (3, 2066);
INSERT INTO `system_role_menu` VALUES (3, 2067);
INSERT INTO `system_role_menu` VALUES (3, 2068);
INSERT INTO `system_role_menu` VALUES (3, 2069);
INSERT INTO `system_role_menu` VALUES (3, 2070);
INSERT INTO `system_role_menu` VALUES (3, 2071);
INSERT INTO `system_role_menu` VALUES (3, 2072);
INSERT INTO `system_role_menu` VALUES (3, 2073);
INSERT INTO `system_role_menu` VALUES (3, 2075);
INSERT INTO `system_role_menu` VALUES (3, 2076);
INSERT INTO `system_role_menu` VALUES (3, 2084);
INSERT INTO `system_role_menu` VALUES (3, 2085);
INSERT INTO `system_role_menu` VALUES (3, 2086);
INSERT INTO `system_role_menu` VALUES (3, 2087);
INSERT INTO `system_role_menu` VALUES (3, 2088);
INSERT INTO `system_role_menu` VALUES (3, 2089);
INSERT INTO `system_role_menu` VALUES (3, 2092);
INSERT INTO `system_role_menu` VALUES (3, 2123);
INSERT INTO `system_role_menu` VALUES (3, 2124);
INSERT INTO `system_role_menu` VALUES (3, 2125);
INSERT INTO `system_role_menu` VALUES (3, 2126);
INSERT INTO `system_role_menu` VALUES (3, 2127);
INSERT INTO `system_role_menu` VALUES (3, 2128);
INSERT INTO `system_role_menu` VALUES (3, 2135);
INSERT INTO `system_role_menu` VALUES (3, 2136);
INSERT INTO `system_role_menu` VALUES (3, 2137);
INSERT INTO `system_role_menu` VALUES (3, 2138);
INSERT INTO `system_role_menu` VALUES (3, 2139);
INSERT INTO `system_role_menu` VALUES (3, 2140);
INSERT INTO `system_role_menu` VALUES (3, 2141);
INSERT INTO `system_role_menu` VALUES (4, 2192);
INSERT INTO `system_role_menu` VALUES (4, 2193);
INSERT INTO `system_role_menu` VALUES (4, 2194);
INSERT INTO `system_role_menu` VALUES (4, 2195);
INSERT INTO `system_role_menu` VALUES (4, 2196);
INSERT INTO `system_role_menu` VALUES (4, 2197);
INSERT INTO `system_role_menu` VALUES (4, 2198);
INSERT INTO `system_role_menu` VALUES (4, 2199);
INSERT INTO `system_role_menu` VALUES (4, 2200);
INSERT INTO `system_role_menu` VALUES (4, 2208);
INSERT INTO `system_role_menu` VALUES (4, 2209);
INSERT INTO `system_role_menu` VALUES (4, 2210);
INSERT INTO `system_role_menu` VALUES (4, 2211);
INSERT INTO `system_role_menu` VALUES (4, 2212);
INSERT INTO `system_role_menu` VALUES (4, 2213);
INSERT INTO `system_role_menu` VALUES (4, 2214);
INSERT INTO `system_role_menu` VALUES (4, 2215);
INSERT INTO `system_role_menu` VALUES (4, 2216);
INSERT INTO `system_role_menu` VALUES (4, 2217);
INSERT INTO `system_role_menu` VALUES (4, 2218);
INSERT INTO `system_role_menu` VALUES (4, 2219);
INSERT INTO `system_role_menu` VALUES (4, 2220);
INSERT INTO `system_role_menu` VALUES (4, 2221);

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
INSERT INTO `system_user` VALUES (1, 103, 'qModel', 'qModel', '00', 'support@qiantong.tech', '19951942682', '1', NULL, '$2a$10$butlDwq0TSIeP/rT9PGx6u571M.2VE.VsTAPoSSMOyQ0jmTc9TEyy', '0', '0', '127.0.0.1', '2026-07-07 17:17:27', '小桐', '2024-05-06 06:12:17', NULL, '2026-07-07 17:17:25', '管理员', NULL);
INSERT INTO `system_user` VALUES (746, 105, 'bf2', '冰凤2', '00', 'bf1@qq.com', '15666666666', '0', NULL, '$2a$10$nK.l4FTmawh45nZnOmn4Le8lk9Otw/AbrDBfr31Qji1015a/bW72e', '0', '0', '127.0.0.1', '2025-09-25 13:52:09', '小桐', '2024-05-06 06:12:17', 'admin', '2025-09-25 13:52:09', '测试员', NULL);
INSERT INTO `system_user` VALUES (749, 104, '陈锦尧', '17351555046', '00', NULL, '17351555046', '0', NULL, '$2a$10$dDcEvUlsZW16jXJa79dBuONL.YZloAAT607ZoyFyrBkd/hZJ.kfCy', '0', '0', NULL, NULL, '小桐', '2025-01-17 15:53:58', 'admin', '2025-02-06 15:38:26', NULL, NULL);
INSERT INTO `system_user` VALUES (750, 103, 'jinpeng', '金鹏', '00', NULL, '15951995970', '0', NULL, '$2a$10$Y2q8oI7LzS1ACaQG5KtUEuHZ0JFO71R.oE7mFO8hUyb/tAdkYScfa', '0', '0', '127.0.0.1', '2025-04-28 17:40:33', '小桐', '2025-02-04 16:56:39', 'admin', '2025-04-28 17:40:34', NULL, NULL);
INSERT INTO `system_user` VALUES (751, 103, 'muyuanxiang', '穆远祥', '00', NULL, '18599297916', '0', NULL, '$2a$10$Agn.bofA2qGoPNzYjJVne.KfYpIWDAzNH4Kf1GazgDzpD55mOAjX6', '0', '0', NULL, NULL, '小桐', '2025-02-10 13:58:41', NULL, NULL, NULL, NULL);
INSERT INTO `system_user` VALUES (752, 852, 'liuchanglei', '刘长磊', '00', NULL, '18240679712', '0', NULL, '$2a$10$bcMDapX9AZlG5c5.zFUSyeYC2IBlziPwnbUVnzSHabF.PPGRpz0sO', '0', '0', '127.0.0.1', '2025-02-13 10:19:52', '小桐', '2025-02-11 13:38:43', NULL, '2025-02-13 10:19:51', NULL, NULL);
INSERT INTO `system_user` VALUES (755, 852, '张冬冬', '张冬冬', '00', NULL, '13213118204', '0', NULL, '$2a$10$fne9FkTU2AhLeNouSBxHBuF.zI4FkazYagSS.kRpH8NEaoEYoXaQ2', '0', '0', '127.0.0.1', '2025-03-07 17:00:47', '小桐', '2025-02-12 09:47:54', 'admin', '2025-03-07 17:00:47', NULL, NULL);
INSERT INTO `system_user` VALUES (756, 102, 'zyg', '张雨果', '00', NULL, '17760752680', '0', NULL, '$2a$10$yyS.DVfJ81ArgD3P5IRvcur3ui19nEns8z9/Me5mHzNEZa.O8d1Jy', '0', '0', '127.0.0.1', '2025-09-18 13:56:24', '小桐', '2025-09-18 13:02:01', 'admin', '2025-09-18 13:56:27', '123', NULL);
INSERT INTO `system_user` VALUES (757, 100, 'chuhongen', '楚洪恩', '00', NULL, '15539056859', '0', NULL, '$2a$10$Rg2utB7rOyEY22vSIGosQ.0H25boy5IncmVm3Pcvq3VrSWTI1ywdG', '0', '0', '127.0.0.1', '2025-10-29 10:47:39', '小桐', '2025-09-23 14:19:21', NULL, '2025-10-29 10:47:37', NULL, NULL);
INSERT INTO `system_user` VALUES (758, 100, 'wangyu', '王禹', '00', NULL, '13951171340', '0', NULL, '$2a$10$IFZCQy65rgVMMBqdpL7WYeGPzmavEX5Npygv359/pbCIgPSVoN6tS', '0', '0', '127.0.0.1', '2025-09-28 09:32:32', '小桐', '2025-09-23 14:20:13', NULL, '2025-09-28 09:32:31', NULL, NULL);
INSERT INTO `system_user` VALUES (760, 100, 'chengguishun', '程桂顺', '00', NULL, '18256679835', '0', NULL, '$2a$10$GthBi0nmv8GGnxeyCI7yCe.D86JzuX/K2TfCJFpxPF6yZkBew9yUy', '0', '0', '127.0.0.1', '2025-11-12 09:34:47', '小桐', '2025-09-30 15:30:57', NULL, '2025-11-12 09:34:46', NULL, NULL);
INSERT INTO `system_user` VALUES (762, 100, 'panlong', '潘龙', '00', NULL, '15026084418', '0', NULL, '$2a$10$IQNgBO6dH06oeX0vy9BoQOMSXr/dB3PCTRMbN5lNdAHHlnwcfH.TG', '0', '0', '127.0.0.1', '2025-11-10 14:28:17', '小桐', '2025-10-29 10:55:04', NULL, '2025-11-10 14:28:18', NULL, NULL);

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
INSERT INTO `system_user_role` VALUES (1, 4);
INSERT INTO `system_user_role` VALUES (2, 2);
INSERT INTO `system_user_role` VALUES (729, 2);
INSERT INTO `system_user_role` VALUES (730, 2);
INSERT INTO `system_user_role` VALUES (731, 2);
INSERT INTO `system_user_role` VALUES (733, 2);
INSERT INTO `system_user_role` VALUES (734, 2);
INSERT INTO `system_user_role` VALUES (737, 2);
INSERT INTO `system_user_role` VALUES (738, 4);
INSERT INTO `system_user_role` VALUES (739, 2);
INSERT INTO `system_user_role` VALUES (739, 4);
INSERT INTO `system_user_role` VALUES (740, 2);
INSERT INTO `system_user_role` VALUES (740, 4);
INSERT INTO `system_user_role` VALUES (742, 2);
INSERT INTO `system_user_role` VALUES (744, 2);

SET FOREIGN_KEY_CHECKS = 1;
