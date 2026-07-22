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

-- ----------------------------
-- Table structure for auth_client
-- ----------------------------
DROP TABLE IF EXISTS `auth_client`;
CREATE TABLE `auth_client`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `secret_key` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用秘钥',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名称',
  `type` int(11) NOT NULL COMMENT '应用类型;0：Web，1：App，2：小程序',
  `icon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用图标',
  `home_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用首页',
  `sync_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '同步地址',
  `redirect_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '允许授权的url',
  `public_flag` tinyint(4) NOT NULL COMMENT '是否公开',
  `valid_flag` tinyint(4) NOT NULL COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(4) NOT NULL COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id;创建者的sys_user_id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人id;更新者的sys_user_id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_client
-- ----------------------------

-- ----------------------------
-- Table structure for auth_client_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_client_user`;
CREATE TABLE `auth_client_user`  (
  `client_id` bigint(20) NOT NULL COMMENT '应用ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `open_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'open_id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用和用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_client_user
-- ----------------------------

-- ----------------------------
-- Table structure for ca_cert
-- ----------------------------
DROP TABLE IF EXISTS `ca_cert`;
CREATE TABLE `ca_cert`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID;ID',
  `name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证书名称',
  `subject_id` int(11) NOT NULL COMMENT '主体id',
  `subject_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主体名称',
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证书;证书',
  `private_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '私钥;私钥',
  `issuer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '颁发者',
  `possessor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所有者',
  `valid_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '有效期',
  `valid_flag` int(11) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注;备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '证书管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_cert
-- ----------------------------
INSERT INTO `ca_cert` VALUES (9, '冰凤框架Nginx证书', 9, '江苏千桐科技有限公司', '/profile/ca/2024/10/23/6718d6e3a921cf6536292244.cer', '/profile/ca/2024/10/23/6718d6e3a921cf6536292245.pem', '江苏千桐科技有限公司', '192.168.0.1', '30', 1, 0, 'admin', 1, '2024-10-23 18:58:44', NULL, NULL, NULL);
INSERT INTO `ca_cert` VALUES (10, '测试', 9, '江苏千桐科技有限公司', '/profile/ca/2024/12/09/6756acfbe2f804e7283bef9d.cer', '/profile/ca/2024/12/09/6756acfbe2f804e7283bef9e.pem', '江苏千桐科技有限公司', '1000', '3', 1, 0, 'admin', 1, '2024-12-09 16:40:27', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ca_subject
-- ----------------------------
DROP TABLE IF EXISTS `ca_subject`;
CREATE TABLE `ca_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID;主体ID',
  `name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主体名称;主体名称',
  `cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通用名称;通用名称',
  `ou` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织部门;组织单位名称',
  `o` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织名称',
  `l` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市名称',
  `st` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省名称',
  `c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '国家',
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证书;证书',
  `private_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '私钥;私钥',
  `valid_flag` int(11) NOT NULL DEFAULT 1 COMMENT '是否有效;是否有效 0：无效，1：有效',
  `del_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除标志;删除标志 1：已删除，0：未删除',
  `create_by` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人;创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id;创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间;创建时间',
  `update_by` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人;更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间;更新时间',
  `remark` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注;备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '主体管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_subject
-- ----------------------------
INSERT INTO `ca_subject` VALUES (9, '江苏千桐科技有限公司', '江苏千桐科技有限公司', '技术部', '技术部', '南京', '江苏', '中国', '/profile/ca/2024/10/23/6718d658a921cf6536292242.cer', '/profile/ca/2024/10/23/6718d658a921cf6536292243.pem', 1, 0, 'admin', 1, '2024-10-23 18:56:25', NULL, NULL, NULL);
INSERT INTO `ca_subject` VALUES (10, '12', '12', '12', '12', '12', '12', '12', '/profile/ca/2024/12/09/6756abdbe2f804e7283bef9b.cer', '/profile/ca/2024/12/09/6756abdbe2f804e7283bef9c.pem', 1, 0, 'admin', 1, '2024-12-09 16:35:39', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
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
CREATE TABLE `gen_table_column`  (
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
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sender_id` bigint(20) NULL DEFAULT NULL COMMENT '发送人',
  `receiver_id` bigint(20) NULL DEFAULT NULL COMMENT '接收人',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息模板内容',
  `category` int(11) NOT NULL COMMENT '消息类别',
  `msg_level` int(11) NOT NULL COMMENT '消息等级',
  `module` int(11) NOT NULL COMMENT '消息模块',
  `entity_type` int(11) NULL DEFAULT NULL COMMENT '实体类型',
  `entity_id` bigint(20) NULL DEFAULT NULL COMMENT '实体id',
  `entity_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息链接',
  `has_read` tinyint(4) NULL DEFAULT NULL COMMENT '是否已读',
  `has_retraction` tinyint(4) NULL DEFAULT NULL COMMENT '是否撤回',
  `valid_flag` tinyint(4) NOT NULL COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(4) NOT NULL COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (40, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 1, 0, 1, 0, 'admin', 1, '2024-12-23 15:33:11', 'admin', '2024-12-23 15:33:11', 1, NULL);
INSERT INTO `message` VALUES (41, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 1, 0, 1, 0, 'admin', 1, '2024-12-23 15:34:47', 'admin', '2024-12-23 15:34:47', 1, NULL);
INSERT INTO `message` VALUES (42, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 1, 0, 1, 0, 'admin', 1, '2024-12-23 15:39:17', 'admin', '2024-12-23 15:39:17', 1, NULL);
INSERT INTO `message` VALUES (43, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 'admin', 1, '2025-12-30 10:51:44', 'admin', '2025-12-30 10:51:44', 1, NULL);
INSERT INTO `message` VALUES (44, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 10:59:28', '小桐', '2025-12-30 10:59:28', 1, NULL);
INSERT INTO `message` VALUES (45, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 13:59:46', '小桐', '2025-12-30 13:59:46', 1, NULL);
INSERT INTO `message` VALUES (46, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:00:24', '小桐', '2025-12-30 14:00:24', 1, NULL);
INSERT INTO `message` VALUES (47, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:01:37', '小桐', '2025-12-30 14:01:37', 1, NULL);
INSERT INTO `message` VALUES (48, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:01:41', '小桐', '2025-12-30 14:01:41', 1, NULL);

-- ----------------------------
-- Table structure for message_template
-- ----------------------------
DROP TABLE IF EXISTS `message_template`;
CREATE TABLE `message_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息模板内容',
  `category` int(11) NOT NULL COMMENT '消息类别',
  `msg_level` int(11) NOT NULL DEFAULT 0 COMMENT '消息等级',
  `valid_flag` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message_template
-- ----------------------------
INSERT INTO `message_template` VALUES (1, '测试模版', '${test}测试模版', 0, 0, 1, 1, NULL, 1, '2024-11-01 10:35:16', 'admin', 1, '2025-12-30 10:45:41', NULL);
INSERT INTO `message_template` VALUES (2, '测试', '2', 0, 0, 1, 1, 'admin', 1, '2024-11-20 11:12:52', 'admin', 1, '2025-12-30 10:45:38', NULL);

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`  (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `company_id` bigint NULL DEFAULT NULL COMMENT '企业ID',
    `classify_id` bigint NULL DEFAULT NULL COMMENT '分类id',
    `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
    `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
    `access_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接入方式;API-API接口, PYTHON-Python本地',
    `version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '版本号',
    `author` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
    `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '状态;0-停用, 1-启用，2-构建部署中，3-构建失败',
    `tags` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签',
    `icon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
    `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
    `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
    `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
    `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人id',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型基础信息表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES (1, NULL, 1, '工业大模型-动态 Token', 'INDUSTRY_MODEL_TEST', 'API', 'V1.0', '吴同', 0, '[{\"name\":\"工业\"}]', '/2026/05/11/6a01a8f6e4b0d389f4f52e8f.png', '工业大模型接口', 1, 0, '吴同', NULL, '2026-07-10 14:14:51', '吴同', 1, '2026-07-16 15:23:15', '测试数据');
INSERT INTO `model` VALUES (2, NULL, 8, '线性回归算法', 'LINEAR_REGRESSION', 'API', 'V2.0', '吴同', 0, '[{\"name\":\"NLP\"},{\"name\":\"分类\"}]', '/2026/05/11/6a01aa17e4b0d389f4f52e95.png', '文本分类API，使用固定Bearer Token', 1, 0, '吴同', 2, '2026-07-10 10:00:00', '吴同', 1, '2026-07-10 11:48:06', '固定Token示例');
INSERT INTO `model` VALUES (3, NULL, 9, '支持向量机算法', 'SVM', 'API', 'V1.5', '吴同', 0, '[{\"name\":\"对话\"},{\"name\":\"生成\"}]', '/2026/05/11/6a01aa0ae4b0d389f4f52e94.png', '模拟OpenAI Chat Completion接口', 1, 0, '吴同', 3, '2026-07-10 09:00:00', '吴同', 1, '2026-07-10 11:58:14', 'APIKey固定鉴权示例');
INSERT INTO `model` VALUES (4, NULL, 9, '逻辑回归算法', 'LOGISTIC_REGRESSION', 'API', 'V1.0', '吴同', 0, '[{\"name\":\"视觉\"},{\"name\":\"图像识别\"}]', '/2026/05/11/6a01a9f9e4b0d389f4f52e93.png', '内网图片分类识别服务，无需鉴权', 1, 0, '吴同', 4, '2026-07-10 08:00:00', '吴同', 1, '2026-07-10 13:33:41', '无鉴权示例');
INSERT INTO `model` VALUES (5, NULL, 10, '随机森林算法', 'RANDOM_FOREST', 'API', 'V2.3', '吴同', 0, '[{\"name\":\"问答\"},{\"name\":\"RAG\"}]', '/2026/05/11/6a01a9e9e4b0d389f4f52e92.png', '基于知识库的企业问答接口', 1, 0, '吴同', 5, '2026-07-10 07:30:00', '吴同', 1, '2026-07-10 11:48:15', '动态Token-GET方式示例');
INSERT INTO `model` VALUES (6, NULL, 11, '降维算法', 'DIMENSIONALITY_REDUCTION', 'PYTHON', 'V1.2', '吴同', 2, '[{\"name\":\"运维\"},{\"name\":\"流水线\"}]', '/2026/05/11/6a01a9d8e4b0d389f4f52e91.png', '数据流水线状态管理接口', 1, 0, '吴同', 6, '2026-07-10 06:00:00', '吴同', 1, '2026-07-10 11:48:13', 'PUT请求+Query注入示例');
INSERT INTO `model` VALUES (7, NULL, 10, '梯度增强算法', 'GRADIENT_BOOSTING', 'PYTHON', 'V3.0', '吴同', 3, '[{\"name\":\"生成\"},{\"name\":\"多模态\"}]', '/2026/05/11/6a01a9a0e4b0d389f4f52e90.png', '支持文本/图像/音频生成的多模态模型', 1, 0, '吴同', 7, '2026-07-10 05:00:00', '吴同', 1, '2026-07-10 11:48:12', '复杂动态Token示例-组合认证');
INSERT INTO `model` VALUES (8, NULL, 1, '工业大模型-固定 Token', 'INDUSTRY_MODEL_TEST', 'API', 'v1.0', '吴同', 1, '[{\"name\":\"工业\"}]', '/2026/05/11/6a01a9a0e4b0d389f4f52e99.png', NULL, 1, 0, '吴同', 1, '2026-07-10 11:55:55', '吴同', 1, '2026-07-10 16:20:19', NULL);
INSERT INTO `model` VALUES (9, NULL, 17, 'qKnow_周报模板测试', 'QKNOW_WEEKLYREPORT', 'API', 'V1.0', '吴同', 0, '[{\"name\":\"周报\"},{\"name\":\"测试\"}]', '/2026/05/11/6a01a9a0e4b0d389f4f52f99.png', '获取 qKnow 系统中的周报模板测试数据', 1, 0, '吴同', 1, '2026-07-16 14:25:22', 'qModel', 1, '2026-07-16 15:58:40', NULL);
INSERT INTO `model` VALUES (10, NULL, 2, '水位流量插值算法', 'WQIA', 'PYTHON', 'V1.0', '吴同', 1, '[{\"name\":\"水位流量\"},{\"name\":\"预测\"}]', '/2026/05/11/6a01a9a0e4b0d389f4f5ff99.png', NULL, 1, 0, '吴同', 1, '2026-07-16 15:09:06', 'system', 1, '2026-07-17 09:24:46', NULL);

-- ----------------------------
-- Table structure for model_config
-- ----------------------------
DROP TABLE IF EXISTS `model_config`;
CREATE TABLE `model_config`  (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                                 `company_id` bigint NULL DEFAULT NULL COMMENT '企业ID',
                                 `model_id` bigint NULL DEFAULT NULL COMMENT '关联模型ID',
                                 `api_url` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '业务接口地址',
                                 `request_method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方式;0-GET, 1-POST, 2-PUT, 3-DELETE, 4-PATCH',
                                 `content_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求内容类型例',
                                 `timeout_seconds` int NULL DEFAULT NULL COMMENT '超时时间单位秒',
                                 `auth_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鉴权类型;NONE-无, FIXED-固定Token, DYNAMIC-动态Token',
                                 `auth_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鉴权方式（bearer / apiKey）',
                                 `auth_inject_position` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注入位置',
                                 `auth_key_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鉴权键名例',
                                 `auth_token_prefix` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Token前缀',
                                 `auth_token_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '固定Token值或APIKey;0-GET 1-POST',
                                 `auth_dynamic_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '获取Token方式;GET/POST',
                                 `auth_dynamic_url` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '获取Token的URL地址',
                                 `auth_dynamic_headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '获取Token时的请求头',
                                 `auth_dynamic_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '获取Token的请求体',
                                 `auth_dynamic_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '获取Token时的Query参数',
                                 `auth_extract_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Token提取路径',
                                 `input_schema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '入参JSONSchema定义',
                                 `output_schema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '出参JSONSchema定义',
                                 `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
                                 `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
                                 `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
                                 `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人ID',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
                                 `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人ID',
                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型配置详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_config
-- ----------------------------
INSERT INTO `model_config` VALUES (1, NULL, 1, 'http://api.example.com/blade-vstec/call/log/call/model', 'POST', 'application/x-www-form-urlencoded', 30, 'DYNAMIC', 'apiKey', 'Header', 'Blade-Auth', 'bearer', NULL, 'POST', 'http://api.example.com/blade-auth/oauth/token', '{\n  \"Content-Type\": \"application/x-www-form-urlencoded\",\n  \"Tenant-Id\": \"595\",\n  \"Authorization\": \"Basic c3dvcmQ6c3dvcmRfc2VjcmV0\"\n}', NULL, '{\n  \"grant_type\": \"password\",\n  \"username\": \"admin\",\n  \"password\": \"21232f297a57a5a743894a0e4a801fc3\",\n  \"scope\": \"all\"\n}', 'access_token', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"modelId\": {\n      \"type\": \"integer\",\n      \"description\": \"模型ID\"\n    },\n    \"files\": {\n      \"type\": \"string\",\n      \"format\": \"binary\",\n      \"description\": \"上传的文件\"\n    }\n  },\n  \"required\": [\n    \"modelId\",\n    \"files\"\n  ]\n}', NULL, 1, 0, '小桐', 1, '2026-07-09 15:06:46', 'qModel', 1, '2026-07-14 10:07:30', '测试数据');
INSERT INTO `model_config` VALUES (2, NULL, 2, 'https://api.example.com/v1/predict', 'POST', 'application/json', 60, 'FIXED', 'apiKey', 'Header', 'Authorization', 'Bearer', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"text\": {\n      \"type\": \"string\",\n      \"description\": \"待分析文本\"\n    },\n    \"top_k\": {\n      \"type\": \"integer\",\n      \"default\": 5\n    }\n  },\n  \"required\": [\"text\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"result\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\n      }\n    }\n  }\n}', 1, 0, '张三', 2, '2026-07-10 10:00:00', '小桐', 1, '2026-07-10 11:48:06', '固定Token示例');
INSERT INTO `model_config` VALUES (3, NULL, 3, 'https://api.openai.com/v1/chat/completions', 'POST', 'application/json', 120, 'FIXED', 'apiKey', 'Header', 'X-API-Key', NULL, 'sk-proj-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"messages\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"object\",\n        \"properties\": {\n          \"role\": {\"type\": \"string\"},\n          \"content\": {\"type\": \"string\"}\n        }\n      }\n    },\n    \"temperature\": {\n      \"type\": \"number\",\n      \"default\": 0.7\n    }\n  },\n  \"required\": [\"messages\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"choices\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"object\",\n        \"properties\": {\n          \"message\": {\n            \"type\": \"object\",\n            \"properties\": {\n              \"content\": {\"type\": \"string\"}\n            }\n          }\n        }\n      }\n    }\n  }\n}', 1, 0, '王五', 3, '2026-07-10 09:00:00', '小桐', 1, '2026-07-10 11:49:14', 'APIKey固定鉴权示例');
INSERT INTO `model_config` VALUES (4, NULL, 4, 'http://api.example.com/image/recognize', 'POST', 'multipart/form-data', 45, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"image\": {\n      \"type\": \"string\",\n      \"format\": \"binary\",\n      \"description\": \"待识别的图片文件\"\n    },\n    \"top_n\": {\n      \"type\": \"integer\",\n      \"default\": 3\n    }\n  },\n  \"required\": [\"image\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"labels\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"object\",\n        \"properties\": {\n          \"name\": {\"type\": \"string\"},\n          \"confidence\": {\"type\": \"number\"}\n        }\n      }\n    }\n  }\n}', 1, 0, '孙七', 4, '2026-07-10 08:00:00', '小桐', 1, '2026-07-10 13:33:41', '无鉴权示例');
INSERT INTO `model_config` VALUES (5, NULL, 5, 'https://api.enterprise.com/v1/qa', 'POST', 'application/json', 30, 'DYNAMIC', 'bearer', 'Header', 'Authorization', 'Bearer', NULL, 'GET', 'https://auth.enterprise.com/oauth/token', '{\n  \"Accept\": \"application/json\"\n}', NULL, '{\n  \"grant_type\": \"client_credentials\",\n  \"client_id\": \"svc_qa_bot\",\n  \"client_secret\": \"abc123def456ghi789\"\n}', 'access_token', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"question\": {\n      \"type\": \"string\",\n      \"description\": \"用户问题\"\n    },\n    \"context\": {\n      \"type\": \"string\",\n      \"description\": \"上下文信息\"\n    }\n  },\n  \"required\": [\"question\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"answer\": {\n      \"type\": \"string\"\n    },\n    \"confidence\": {\n      \"type\": \"number\"\n    }\n  }\n}', 1, 0, '周九', 5, '2026-07-10 07:30:00', '周九', 5, '2026-07-10 07:30:00', 'QA问答-动态Token-GET方式获取');
INSERT INTO `model_config` VALUES (6, NULL, 6, 'https://api.pipeline.com/v1/pipeline/update', 'PUT', 'application/json', 90, 'FIXED', 'apiKey', 'Query', 'api_key', NULL, 'pipe_live_9876543210abcdef', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"pipeline_id\": {\n      \"type\": \"string\",\n      \"description\": \"流水线ID\"\n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"enum\": [\"running\", \"paused\", \"stopped\"]\n    }\n  },\n  \"required\": [\"pipeline_id\", \"status\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"success\": {\n      \"type\": \"boolean\"\n    },\n    \"message\": {\n      \"type\": \"string\"\n    }\n  }\n}', 1, 0, '郑十一', 6, '2026-07-10 06:00:00', '郑十一', 6, '2026-07-10 06:00:00', '流水线状态更新-APIKey注入Query');
INSERT INTO `model_config` VALUES (7, NULL, 7, 'https://api.multimodal.com/v1/generate', 'POST', 'application/json', 180, 'DYNAMIC', 'apiKey', 'Header', 'X-Auth-Token', 'Token', NULL, 'POST', 'https://auth.multimodal.com/v1/get_token', '{\n  \"Content-Type\": \"application/json\",\n  \"X-Client-Version\": \"1.0.0\"\n}', '{\n  \"app_id\": \"multimodal_app_001\",\n  \"app_secret\": \"sec_9876543210fedcba\"\n}', '{\n  \"grant_type\": \"password\",\n  \"username\": \"service_user\",\n  \"password\": \"srv_pass_2026!\"\n}', 'data.token', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"prompt\": {\n      \"type\": \"string\",\n      \"description\": \"生成提示词\"\n    },\n    \"modality\": {\n      \"type\": \"string\",\n      \"enum\": [\"text\", \"image\", \"audio\"],\n      \"description\": \"生成模态\"\n    },\n    \"size\": {\n      \"type\": \"string\",\n      \"default\": \"1024x1024\"\n    }\n  },\n  \"required\": [\"prompt\", \"modality\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"output\": {\n      \"type\": \"string\",\n      \"description\": \"生成的输出（文本或图片URL）\"\n    },\n    \"model_version\": {\n      \"type\": \"string\"\n    }\n  }\n}', 1, 0, '陈十三', 7, '2026-07-10 05:00:00', '陈十三', 7, '2026-07-10 05:00:00', '多模态生成-复杂动态Token');
INSERT INTO `model_config` VALUES (8, NULL, 8, 'http://api.example.com/blade-vstec/call/log/call/model', 'POST', 'application/x-www-form-urlencoded', 30, 'FIXED', 'bearer', 'Header', NULL, NULL, 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5hbnRfaWQiOiI1OTUxNTIiLCJ1c2VySW5mbyI6eyJwYXNzd29yZCI6bnVsbCwidXNlcm5hbWUiOiJsY3Rlc3RlciIsImF1dGhvcml0aWVzIj', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"modelId\": {\n      \"type\": \"integer\",\n      \"description\": \"模型ID\"\n    },\n    \"files\": {\n      \"type\": \"string\",\n      \"format\": \"binary\",\n      \"description\": \"上传的文件\"\n    }\n  },\n  \"required\": [\n    \"modelId\",\n    \"files\"\n  ]\n}', NULL, 1, 0, '小桐', 1, '2026-07-10 11:55:55', '小桐', 1, '2026-07-10 11:57:55', NULL);
INSERT INTO `model_config` VALUES (9, NULL, 9, 'http://env.qiantong.tech:51899/prod-api/api/app/weeklyReportTestData', 'GET', 'application/json', 30, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"title\": \"搜索请求参数\",\n  \"description\": \"通用搜索入参结构\",\n  \"properties\": {\n    \"query\": {\n      \"type\": \"string\",\n      \"description\": \"搜索关键词、查询语句\",\n      \"minLength\": 0,\n      \"maxLength\": 500\n    }\n  }\n}', NULL, 1, 0, 'qModel', 1, '2026-07-16 14:25:22', 'qModel', 1, '2026-07-16 14:25:33', NULL);


-- ----------------------------
-- Table structure for model_file_resource
-- ----------------------------
DROP TABLE IF EXISTS `model_file_resource`;
CREATE TABLE `model_file_resource`  (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                        `model_id` bigint NULL DEFAULT NULL COMMENT '模型id',
                                        `file_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '原始上传文件名',
                                        `script_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '脚本名称(入口文件)',
                                        `file_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件存储地址',
                                        `deps_file_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '依赖文件路径',
                                        `model_version` int NULL DEFAULT NULL COMMENT '模型版本号',
                                        `resource_type` tinyint NULL DEFAULT NULL COMMENT '资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)',
                                        `file_size` decimal(10, 2) NULL DEFAULT NULL COMMENT '文件大小MB',
                                        `log_file_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运行日志文件路径',
                                        `exec_timeout` int NULL DEFAULT NULL COMMENT '请求超时秒数',
                                        `docker_file_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自动生成dockerFile文件地址',
                                        `image_tag` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '构建镜像标签',
                                        `image_version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '镜像版本',
                                        `image_build_status` tinyint NULL DEFAULT 0 COMMENT '镜像构建状态（0 = 未构建、1 = 构建中、2 = 构建成功、3 = 构建失败）',
                                        `image_build_time` int NULL DEFAULT NULL COMMENT '镜像构建时间',
                                        `image_build_log` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '镜像构建日志文件地址',
                                        `resource_limit` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb',
                                        `container_env` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '容器自定义环境变量，JSON数组格式',
                                        `container_mounts` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '容器额外挂载目录配置，JSON数组格式',
                                        `container_ports` int NULL DEFAULT NULL COMMENT '容器暴露端口',
                                        `mapped_host_port` int NULL DEFAULT NULL COMMENT '宿主机端口',
                                        `container_status` tinyint NULL DEFAULT 0 COMMENT '容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)',
                                        `container_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '容器id',
                                        `valid_flag` tinyint NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
                                        `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
                                        `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
                                        `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
                                        `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人id',
                                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                                        `input_schema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '入参JSONSchema定义',
                                        `output_schema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '出参JSONSchema定义',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型文件部署表' ROW_FORMAT = DYNAMIC;
-- ----------------------------
-- Records of model_file_resource
-- ----------------------------

INSERT INTO `model_file_resource` VALUES (5, 10, '水位流量插值算法.zip', 'main.py', 'temp/2026/07/17/水位流量插值算法.zip', '/usr/app/jar/upload/temp/extract/5/requirements.txt', 1, 2, NULL, NULL, NULL, '/usr/app/jar/upload/temp/extract/5/main.py', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 'qModel', 1, '2026-07-16 15:49:49', 'system', 1, '2026-07-17 17:49:47', NULL, '{\n  \"title\": \"runScript接口入参\",\n  \"type\": \"object\",\n  \"required\": [\"H\"],\n  \"properties\": {\n    \"H\": {\n      \"title\": \"参数H\",\n      \"description\": \"自定义数值参数\",\n      \"type\": \"integer\",\n      \"example\": 3\n    }\n  }\n}', NULL);

-- ----------------------------
-- Table structure for model_build_log
-- ----------------------------

DROP TABLE IF EXISTS `model_build_log`;
CREATE TABLE `model_build_log`  (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                    `resource_id` bigint NOT NULL COMMENT '模型文件id',
                                    `model_id` bigint NULL DEFAULT NULL COMMENT '模型id',
                                    `model_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型名称',
                                    `version_id` bigint NULL DEFAULT NULL COMMENT '版本id',
                                    `build_type` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '构建类型;构建类型：1=依赖安装，2=Docker镜像构建',
                                    `status` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '构建状态;构建状态：0=待执行，1=执行中，2=成功，3=失败',
                                    `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
                                    `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
                                    `duration` int NULL DEFAULT NULL COMMENT '执行耗时',
                                    `installed_packages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '已存在的依赖包列表JSON',
                                    `missing_packages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '缺失失败的依赖包列表JSON',
                                    `failed_packages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '安装失败的依赖包列表JSON',
                                    `dockerfile_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'dockerFile内容',
                                    `build_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '构建日志',
                                    `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '错误日志',
                                    `requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'requirements.txt 内容',
                                    `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
                                    `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
                                    `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
                                    `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
                                    `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人id',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '构建日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_invoke_history
-- ----------------------------

DROP TABLE IF EXISTS `model_invoke_history`;
CREATE TABLE `model_invoke_history`  (
                                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                         `model_id` bigint NOT NULL COMMENT '模型id',
                                         `model_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型名称',
                                         `resource_id` bigint NULL DEFAULT NULL COMMENT '模型配置资源id',
                                         `version_id` bigint NULL DEFAULT NULL COMMENT '模型版本id',
                                         `request_method` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '请求方式;HTTP请求方式：0=GET，1=POST，2=PUT，3=DELETE',
                                         `invoke_type` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '调用类型;1=在线测试，2=网关服务',
                                         `input_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输入参数（JSON格式）',
                                         `output_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输出结果（JSON格式）',
                                         `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
                                         `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
                                         `duration` int NULL DEFAULT NULL COMMENT '执行耗时（毫秒）',
                                         `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '错误信息',
                                         `status` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '调用状态;0=执行中，1=成功，2=失败，3=超时，4=参数校验阻塞',
                                         `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户端操作IP',
                                         `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
                                         `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
                                         `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
                                         `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
                                         `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人id',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型调用历史记录' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for model_cacl
-- ----------------------------
DROP TABLE IF EXISTS `model_cacl`;
CREATE TABLE `model_cacl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计算编码',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计算名称',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '模型id',
  `model_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型名称',
  `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型版本',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '计算状态',
  `input_content` varchar(6144) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型输入内容',
  `output_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '模型输出内容',
  `valid_flag` int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
  `del_flag` int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` int(11) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `address_id` int(11) NULL DEFAULT NULL COMMENT '文件或接口地址id',
  `address_type` int(11) NULL DEFAULT NULL COMMENT '判断是文件的id还是地址的id，0:文件，1：接口',
  `mp_programme_id` int(11) NULL DEFAULT NULL COMMENT '文件计算的历史方案id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型计算' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_cacl
-- ----------------------------
INSERT INTO `model_cacl` VALUES (11, 1001, 'CALC_IND_20260716001', '7月设备震动数据异常检测', 101, '工业大模型-动态Token', 'v1.0', '2026-07-16 09:00:00', '2026-07-16 09:05:30', 2, '{\"fileName\": \"sensor_data_july.csv\", \"rows\": 5000}', '{\"result\": \"Normal\", \"confidence\": 0.98, \"anomaly_count\": 3, \"details\": \"检测到3处微小震动异常，建议复查\"}', 1, 0, '吴同', 10001, '2026-07-16 09:00:00', '吴同', 10001, '2026-07-16 09:05:30', '常规巡检计算', 5001, 0, NULL);
INSERT INTO `model_cacl` VALUES (12, 1001, 'CALC_REG_20260716002', 'Q3季度销售趋势实时推演', 103, '线性回归算法', 'v1.0', '2026-07-16 10:15:00', '2026-07-16 10:32:10', 1, '{\"api_url\": \"/api/data/sales/realtime\", \"params\": {\"region\": \"East\"}}', NULL, 1, 0, '吴同', 10001, '2026-07-16 10:15:00', '吴同', 10001, '2026-07-16 10:15:00', '接口调用计算中', 5002, 1, NULL);
INSERT INTO `model_cacl` VALUES (13, 1001, 'CALC_SVM_20260716003', '高价值客户流失风险分级', 104, '支持向量机算法', 'v1.0', '2026-07-16 11:00:00', '2026-07-16 11:02:10', 2, '{\"dataset_id\": \"DS_CUST_2026\", \"features\": [\"login_freq\", \"spend_amt\"]}', '{\"classification\": \"High Risk\", \"probability\": 0.85, \"group_id\": \"A01\"}', 1, 0, '吴同', 10001, '2026-07-16 11:00:00', '吴同', 10001, '2026-07-16 11:02:10', '月度客户分层分析', 5003, 0, 201);
INSERT INTO `model_cacl` VALUES (14, 1001, 'CALC_GB_20260716004', '信用评分模型重训练', 108, '梯度增强算法', 'v1.0', '2026-07-16 13:00:00', '2026-07-16 13:01:05', 3, '{\"config\": {\"learning_rate\": 0.1, \"n_estimators\": 100}}', '{\"error\": \"OutOfMemoryError\", \"msg\": \"显存不足，无法加载数据集\"}', 1, 0, '吴同', 10001, '2026-07-16 13:00:00', '系统', 9999, '2026-07-16 13:01:05', '资源不足导致中断', NULL, NULL, NULL);
INSERT INTO `model_cacl` VALUES (15, 1001, 'CALC_RF_20260716005', '生产线次品图像识别', 106, '随机森林算法', 'v1.0', '2026-07-16 14:30:00', '2026-07-16 14:31:00', 2, '{\"image_batch\": [\"img_001.jpg\", \"img_002.jpg\"], \"threshold\": 0.9}', '{\"defect_detected\": true, \"type\": \"scratch\", \"location\": [120, 45]}', 1, 0, '吴同', 10001, '2026-07-16 14:30:00', '吴同', 10001, '2026-07-16 14:31:00', '自动化质检流程', 5004, 1, NULL);

-- ----------------------------
-- Table structure for model_cacl_reconstitution
-- ----------------------------
DROP TABLE IF EXISTS `model_cacl_reconstitution`;
CREATE TABLE `model_cacl_reconstitution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NULL DEFAULT NULL,
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model_id` int(11) NULL DEFAULT NULL,
  `model_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `input_content` varchar(6144) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `output_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `valid_flag` int(11) NOT NULL,
  `del_flag` int(11) NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `creator_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updator_id` int(11) NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_id` int(11) NULL DEFAULT NULL,
  `address_type` int(11) NULL DEFAULT NULL,
  `mp_programme_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型计算重构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_cacl_reconstitution
-- ----------------------------

-- ----------------------------
-- Table structure for model_classify
-- ----------------------------
DROP TABLE IF EXISTS `model_classify`;
CREATE TABLE `model_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `ancestors` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '祖籍列表',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类描述',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `valid_flag` int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
  `del_flag` int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_classify
-- ----------------------------
INSERT INTO `model_classify` VALUES (1, NULL, 0, '0', '工业大模型', '面向工业领域的预训练大语言模型及衍生应用', 1, 1, 0, '吴同', 1, '2026-07-14 09:15:22', NULL, NULL, '2026-07-14 09:15:22', '面向工业领域的预训练大语言模型及衍生应用');
INSERT INTO `model_classify` VALUES (2, NULL, 0, '0', '机器学习', '经典机器学习算法与模型', 0, 1, 0, '吴同', 1, '2026-07-14 09:32:45', NULL, NULL, '2026-07-14 09:32:45', '经典机器学习算法与模型');
INSERT INTO `model_classify` VALUES (3, NULL, 0, '0', '深度学习', '基于深度神经网络的模型', 1, 1, 0, '吴同', 1, '2026-07-14 09:48:10', NULL, NULL, '2026-07-14 09:48:10', '基于深度神经网络的模型');
INSERT INTO `model_classify` VALUES (4, NULL, 0, '0', '数据智能', '面向数据的分析、预测与挖掘模型', 1, 1, 0, '吴同', 1, '2026-07-14 10:05:33', NULL, NULL, '2026-07-14 10:05:33', '面向数据的分析、预测与挖掘模型');
INSERT INTO `model_classify` VALUES (5, NULL, 1, '0,1', '文本生成', '文本生成、摘要、扩写等大模型能力', 1, 1, 0, '吴同', 1, '2026-07-14 10:22:18', NULL, NULL, '2026-07-14 10:22:18', '文本生成、摘要、扩写等大模型能力');
INSERT INTO `model_classify` VALUES (6, NULL, 1, '0,1', '对话交互', '问答、对话、助手类大模型应用', 2, 1, 0, '吴同', 1, '2026-07-14 10:45:09', NULL, NULL, '2026-07-14 10:45:09', '问答、对话、助手类大模型应用');
INSERT INTO `model_classify` VALUES (7, NULL, 1, '0,1', '代码生成', '代码辅助、生成、审查类大模型', 3, 1, 0, '吴同', 1, '2026-07-14 11:12:55', NULL, NULL, '2026-07-14 11:12:55', '代码辅助、生成、审查类大模型');
INSERT INTO `model_classify` VALUES (8, NULL, 2, '0,2', '回归模型', '连续值预测类机器学习模型', 1, 1, 0, '吴同', 1, '2026-07-14 11:35:40', NULL, NULL, '2026-07-14 11:35:40', '连续值预测类机器学习模型');
INSERT INTO `model_classify` VALUES (9, NULL, 2, '0,2', '分类模型', '离散类别预测类机器学习模型', 2, 1, 0, '吴同', 1, '2026-07-14 13:20:15', NULL, NULL, '2026-07-14 13:20:15', '离散类别预测类机器学习模型');
INSERT INTO `model_classify` VALUES (10, NULL, 2, '0,2', '集成学习', '多基学习器集成的机器学习模型', 3, 1, 0, '吴同', 1, '2026-07-14 13:55:28', NULL, NULL, '2026-07-14 13:55:28', '多基学习器集成的机器学习模型');
INSERT INTO `model_classify` VALUES (11, NULL, 2, '0,2', '降维与特征工程', '特征降维、选择与工程化方法', 4, 1, 0, '吴同', 1, '2026-07-14 14:30:42', NULL, NULL, '2026-07-14 14:30:42', '特征降维、选择与工程化方法');
INSERT INTO `model_classify` VALUES (12, NULL, 3, '0,3', '计算机视觉', '图像识别、检测、分割等视觉模型', 1, 1, 0, '吴同', 1, '2026-07-14 14:58:11', NULL, NULL, '2026-07-14 14:58:11', '图像识别、检测、分割等视觉模型');
INSERT INTO `model_classify` VALUES (13, NULL, 3, '0,3', '自然语言处理', '文本分类、序列标注、语义理解等模型', 2, 1, 0, '吴同', 1, '2026-07-14 15:25:36', NULL, NULL, '2026-07-14 15:25:36', '文本分类、序列标注、语义理解等模型');
INSERT INTO `model_classify` VALUES (14, NULL, 3, '0,3', '语音识别', '语音转文字、声纹识别等模型', 3, 1, 0, '吴同', 1, '2026-07-14 16:10:48', NULL, NULL, '2026-07-14 16:10:48', '语音转文字、声纹识别等模型');
INSERT INTO `model_classify` VALUES (15, NULL, 4, '0,4', '时序预测', '时间序列分析与预测模型', 1, 1, 0, '吴同', 1, '2026-07-14 16:45:22', NULL, NULL, '2026-07-14 16:45:22', '时间序列分析与预测模型');
INSERT INTO `model_classify` VALUES (16, NULL, 4, '0,4', '推荐系统', '协同过滤、内容推荐等模型', 2, 1, 0, '吴同', 1, '2026-07-14 17:20:55', NULL, NULL, '2026-07-14 17:20:55', '协同过滤、内容推荐等模型');
INSERT INTO `model_classify` VALUES (17, NULL, 4, '0,4', '异常检测', '离群点、异常行为识别模型', 3, 1, 0, '吴同', 1, '2026-07-14 17:55:30', NULL, NULL, '2026-07-14 17:55:30', '离群点、异常行为识别模型');

-- ----------------------------
-- Table structure for model_compute
-- ----------------------------
DROP TABLE IF EXISTS `model_compute`;
CREATE TABLE `model_compute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `create_by_id` int(11) NULL DEFAULT NULL COMMENT '操作人id',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '方案名称',
  `monitor1` decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站1号',
  `monitor2` decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站2号',
  `monitor3` decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站3号',
  `avg_rain_fall` decimal(9, 6) NULL DEFAULT NULL COMMENT '面均雨量',
  `rain_fall_last` decimal(9, 6) NULL DEFAULT NULL COMMENT '降雨历时',
  `water_scale` decimal(9, 6) NULL DEFAULT NULL COMMENT '降雨分布比例',
  `z` decimal(20, 6) NULL DEFAULT NULL COMMENT '初始库水位',
  `q` decimal(20, 6) NULL DEFAULT NULL COMMENT '初始出库流量',
  `soil_condition` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '土壤条件',
  `zfzsxskc` decimal(9, 6) NULL DEFAULT NULL COMMENT '蒸发折算系数(kc)',
  `zfzsxsc` decimal(9, 6) NULL DEFAULT NULL COMMENT '蒸发折算系数(c)',
  `zlsxl` decimal(9, 6) NULL DEFAULT NULL COMMENT '初始土壤张力水蓄量(w0)',
  `sczlsxl` decimal(9, 6) NULL DEFAULT NULL COMMENT '初始上层张力水蓄量(wu0)',
  `xczlsxl` decimal(9, 6) NULL DEFAULT NULL COMMENT '初始下层张力水蓄量(wl0)',
  `sczlsxlwdo` decimal(9, 6) NULL DEFAULT NULL COMMENT '初始深层张力水蓄量(wd0)',
  `pjzlsxl` decimal(9, 6) NULL DEFAULT NULL COMMENT '流域平均张力水蓄量(wmm)',
  `lysczlsxl` decimal(9, 6) NULL DEFAULT NULL COMMENT '流域上层张力水蓄量(wum)',
  `lyxczlsxl` decimal(9, 6) NULL DEFAULT NULL COMMENT '流域下层张力水蓄量(wlm)',
  `lysczlsxlwdo` decimal(9, 6) NULL DEFAULT NULL COMMENT '流域深层张力水蓄量(wdm)',
  `xtxs` decimal(9, 6) NULL DEFAULT NULL COMMENT '消退系数(kb)',
  `jl` decimal(9, 6) NULL DEFAULT NULL COMMENT '基流(qb)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模拟洪水预报-模型参数表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_compute
-- ----------------------------

-- ----------------------------
-- Table structure for model_file_resource
-- ----------------------------
DROP TABLE IF EXISTS `model_file_resource`;
CREATE TABLE `model_file_resource` (
       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
       `model_id` bigint DEFAULT NULL COMMENT '模型id',
       `file_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原始上传文件名',
       `script_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脚本名称(入口文件)',
       `file_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件存储地址',
       `deps_file_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '依赖文件路径',
       `model_version` int DEFAULT NULL COMMENT '模型版本号',
       `resource_type` tinyint DEFAULT NULL COMMENT '资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)',
       `file_size` decimal(10,2) DEFAULT NULL COMMENT '文件大小MB',
       `log_file_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运行日志文件路径',
       `exec_timeout` int DEFAULT NULL COMMENT '请求超时秒数',
       `docker_file_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自动生成dockerFile文件地址',
       `image_tag` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '构建镜像标签',
       `image_version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像版本',
       `image_build_status` tinyint DEFAULT '0' COMMENT '镜像构建状态（0 = 未构建、1 = 构建中、2 = 构建成功、3 = 构建失败）',
       `image_build_time` int DEFAULT NULL COMMENT '镜像构建时间',
       `image_build_log` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像构建日志文件地址',
       `resource_limit` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb',
       `container_env` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '容器自定义环境变量，JSON数组格式',
       `container_mounts` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '容器额外挂载目录配置，JSON数组格式',
       `container_ports` int DEFAULT NULL COMMENT '容器暴露端口',
       `mapped_host_port` int DEFAULT NULL COMMENT '宿主机端口',
       `container_status` tinyint DEFAULT '0' COMMENT '容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)',
       `container_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '容器id',
       `valid_flag` tinyint NOT NULL DEFAULT '1' COMMENT '是否有效;0：无效，1：有效',
       `del_flag` tinyint NOT NULL DEFAULT '0' COMMENT '删除标志;1：已删除，0：未删除',
       `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
       `creator_id` bigint DEFAULT NULL COMMENT '创建人id',
       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
       `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
       `updator_id` bigint DEFAULT NULL COMMENT '更新人id',
       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
       `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
       `input_schema` text COLLATE utf8mb4_unicode_ci COMMENT '入参JSONSchema定义',
       `output_schema` text COLLATE utf8mb4_unicode_ci COMMENT '出参JSONSchema定义',
       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='模型文件部署表';
-- ----------------------------
-- Records of model_file_resource
-- ----------------------------
INSERT INTO `model_file_resource` VALUES (5, 10, '水位流量插值算法2.zip', 'main.py', 'temp/2026/07/16/水位流量插值算法2.zip', 'D:\\xmdm\\qModel\\upload\\temp\\extract\\5\\requirements.txt', 1, 2, NULL, NULL, NULL, 'D:\\xmdm\\qModel\\upload\\temp\\extract\\5\\main.py', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 'qModel', 1, '2026-07-16 15:49:49', 'system', 1, '2026-07-16 15:49:50', NULL, '{\n  \"title\": \"runScript接口入参\",\n  \"type\": \"object\",\n  \"required\": [\"H\"],\n  \"properties\": {\n    \"H\": {\n      \"title\": \"参数H\",\n      \"description\": \"自定义数值参数\",\n      \"type\": \"integer\",\n      \"example\": 3\n    }\n  }\n}', NULL);

-- ----------------------------
-- Table structure for model_history
-- ----------------------------
DROP TABLE IF EXISTS `model_history`;
CREATE TABLE `model_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `company_id` bigint(20) NULL DEFAULT NULL COMMENT '企业id',
  `model_id` bigint(20) NULL DEFAULT NULL COMMENT '所属模型id',
  `model_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型名称',
  `context` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `start_time` datetime NULL DEFAULT NULL COMMENT '启用时间',
  `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '启用版本号',
  `valid_flag` tinyint(4) NOT NULL COMMENT '是否有效 0：无效，1：有效',
  `del_flag` tinyint(4) NOT NULL COMMENT '删除标志 1：已删除，0：未删除 ',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1378 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型历史' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_history
-- ----------------------------
INSERT INTO `model_history` VALUES (1368, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:24:31', 'qModel', 1, '2026-07-01 18:24:31', NULL);
INSERT INTO `model_history` VALUES (1369, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:24:34', 'qModel', 1, '2026-07-01 18:24:34', NULL);
INSERT INTO `model_history` VALUES (1370, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:24:37', 'qModel', 1, '2026-07-01 18:24:37', NULL);
INSERT INTO `model_history` VALUES (1371, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:06', 'qModel', 1, '2026-07-01 18:25:06', NULL);
INSERT INTO `model_history` VALUES (1372, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:25', 'qModel', 1, '2026-07-01 18:25:25', NULL);
INSERT INTO `model_history` VALUES (1373, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:26', 'qModel', 1, '2026-07-01 18:25:26', NULL);
INSERT INTO `model_history` VALUES (1374, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:28', 'qModel', 1, '2026-07-01 18:25:28', NULL);
INSERT INTO `model_history` VALUES (1375, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:37', 'qModel', 1, '2026-07-01 18:25:37', NULL);
INSERT INTO `model_history` VALUES (1376, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:26:31', 'qModel', 1, '2026-07-01 18:26:31', NULL);
INSERT INTO `model_history` VALUES (1377, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:26:32', 'qModel', 1, '2026-07-01 18:26:32', NULL);

-- ----------------------------
-- Table structure for model_input
-- ----------------------------
DROP TABLE IF EXISTS `model_input`;
CREATE TABLE `model_input`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '企业Id',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数名称',
  `eng_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '英文名称',
  `type` int(11) NULL DEFAULT NULL COMMENT '参数类型 0:单值，1：多列数值，2：文件',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '所属模型id',
  `model_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型名称',
  `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型版本',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数说明(描述)',
  `example` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数示例（文件上传）',
  `param_file` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数文件',
  `single_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数单值',
  `multiple_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数多列值',
  `valid_flag` int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
  `del_flag` int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `change_flag` tinyint(1) NOT NULL COMMENT '是否可变 0：不可变，1：可变',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型输入管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_input
-- ----------------------------
INSERT INTO `model_input` VALUES (1, NULL, '123', '333', 0, 4, '测试', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, 'admin', NULL, '2025-11-17 04:22:12', NULL, NULL, '2025-11-17 04:57:36', NULL, 1);
INSERT INTO `model_input` VALUES (2, NULL, 'q', 'q', 0, 8, '综合水利集成模型', '1', '水位', NULL, NULL, '[]', '[]', 1, 0, 'admin', NULL, '2025-11-17 06:20:52', NULL, NULL, '2025-12-31 16:09:04', NULL, 0);
INSERT INTO `model_input` VALUES (3, NULL, '日水量', 'AW_DT', 0, 7, '来水预测模型', NULL, NULL, NULL, NULL, '[]', '[]', 1, 1, 'admin', NULL, '2025-12-11 13:53:10', NULL, NULL, '2025-12-11 13:53:11', NULL, 1);
INSERT INTO `model_input` VALUES (4, NULL, '水位', 'P', 1, 10, '水土保持模型', '1', NULL, NULL, NULL, '[]', '[]', 1, 0, '小桐', NULL, '2025-12-31 18:21:14', NULL, NULL, '2025-12-31 18:21:14', NULL, 1);
INSERT INTO `model_input` VALUES (5, NULL, 'q', '123', NULL, 11, 'AI水位预测', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, '小桐', NULL, '2026-01-06 11:43:32', NULL, NULL, '2026-01-06 11:43:32', NULL, 1);
INSERT INTO `model_input` VALUES (6, NULL, 'q', '123', 1, 11, 'AI水位预测', '1', NULL, NULL, NULL, '[]', '[{\"name\":\"q\",\"value\":\"1\",\"order\":2,\"index\":1}]', 1, 0, '小桐', NULL, '2026-01-06 11:44:06', NULL, NULL, '2026-01-06 11:48:17', NULL, 1);
INSERT INTO `model_input` VALUES (7, NULL, '测试', 'name', 0, 5, '单机程序', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, '小桐', NULL, '2026-01-06 13:58:57', NULL, NULL, '2026-01-06 11:48:17', NULL, 0);
INSERT INTO `model_input` VALUES (8, NULL, 'q', 'level', 0, 5, '单机程序', '1', '说明', NULL, NULL, '[]', '[]', 1, 0, '小桐', 1, '2026-01-09 16:35:37', '小桐', 1, '2026-01-09 16:35:37', NULL, 1);
INSERT INTO `model_input` VALUES (9, NULL, 'q', '/data/jgst/jgst.chaoshen.20250113/data_input.json', 1, 12, '流量是计算', '2', '参数说明', NULL, NULL, '[]', '[{\"name\":\"q\",\"value\":\"0\",\"order\":213,\"index\":1}]', 1, 0, '小桐', 1, '2026-01-14 16:59:34', '小桐', 1, '2026-01-21 15:17:32', NULL, 1);

-- ----------------------------
-- Table structure for model_interface_address
-- ----------------------------
DROP TABLE IF EXISTS `model_interface_address`;
CREATE TABLE `model_interface_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `model_id` bigint(20) NULL DEFAULT NULL COMMENT '模型id',
  `interface_address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口地址',
  `version_id` bigint(20) NULL DEFAULT NULL COMMENT '模型版本id',
  `request_method` bigint(20) NULL DEFAULT NULL COMMENT '请求方式',
  `input_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输入参数',
  `output_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输出参数',
  `del_flag` bigint(20) NOT NULL COMMENT '删除标志',
  `create_by` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `input_parameter_illustrate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输入参数说明',
  `output_parameter_illustrate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输出参数说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '接口地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_interface_address
-- ----------------------------
INSERT INTO `model_interface_address` VALUES (1, NULL, 7, 'null:6379/null:6379/123', 7, 1, NULL, NULL, 1, '小桐', 1, '2026-01-14 14:20:25', '小桐', 1, '2026-01-14 14:46:12', '测试', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (2, NULL, 7, 'null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml', 7, 2, NULL, NULL, 0, '小桐', 1, '2026-01-14 15:27:03', '小桐', 1, '2026-01-14 16:04:55', '测试新增', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (3, NULL, 13, 'http://localhost/dev-api/captchaImage', 18, 0, NULL, NULL, 0, '小桐', 1, '2026-01-20 13:20:18', '小桐', 1, '2026-01-20 15:48:04', 'q', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (4, NULL, 13, 'null:80/http://localhost:8090/captchaImage', 18, 0, NULL, NULL, 0, '小桐', 1, '2026-01-21 14:26:04', '小桐', 1, '2026-01-21 14:26:04', 'z', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (5, NULL, 13, '/https://demo.qmodel.tech/prod-api/captchaImage', 22, 0, NULL, NULL, 1, '小桐2', 1, '2026-01-26 16:51:24', '小桐2', 1, '2026-01-26 16:51:24', '测试', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (6, NULL, 13, 'https://demo.qmodel.tech/prod-api/captchaImage', 22, 0, NULL, NULL, 0, '小桐2', 1, '2026-01-26 16:52:00', '小桐2', 1, '2026-01-26 16:52:00', '测试', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (7, NULL, 13, 'https://demo.qmodel.tech/prod-api/captchaImage', 22, 0, NULL, NULL, 0, '小桐2', 1, '2026-01-26 17:08:12', '小桐2', 1, '2026-01-26 17:08:12', '测试', NULL, NULL);

-- ----------------------------
-- Table structure for model_operate
-- ----------------------------
DROP TABLE IF EXISTS `model_operate`;
CREATE TABLE `model_operate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `module_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作模块',
  `type` int(11) NULL DEFAULT NULL COMMENT '操作类型',
  `content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `method` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方式',
  `req_content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求参数',
  `resp_content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '返回参数',
  `ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作地址(Ip)',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作地点',
  `status` int(11) NULL DEFAULT NULL COMMENT '操作状态',
  `valid_flag` int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
  `del_flag` int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型历史管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_operate
-- ----------------------------
INSERT INTO `model_operate` VALUES (1, 1001, '工业大模型', 1, '启动设备故障预测微调任务', 'POST /api/model/industry/train', '{\"modelCode\":\"INDUSTRY_MODEL_TEST\", \"datasetId\":\"DS_2026_Q3\", \"epochs\": 50, \"learningRate\": 0.001}', '{\"code\":200, \"msg\":\"训练任务已下发\", \"taskId\":\"TRAIN_JOB_9981\"}', '192.168.10.55', '江苏省南京市', 1, 1, 0, '吴同', 10001, '2026-07-16 09:15:00', '吴同', 10001, '2026-07-16 09:15:00', '基于Q3季度传感器数据进行微调');
INSERT INTO `model_operate` VALUES (2, 1001, '线性回归算法', 0, '获取销售额预测模型评估报告', 'GET /api/model/regression/report?id=LR_001', NULL, '{\"code\":200, \"data\": {\"r2_score\": 0.95, \"rmse\": 12.4, \"chartUrl\": \"/static/img/lr_chart.png\"}}', '192.168.10.55', '江苏省南京市', 1, 1, 0, '吴同', 10001, '2026-07-16 10:30:00', '吴同', 10001, '2026-07-16 10:30:00', '日常模型效果监控');
INSERT INTO `model_operate` VALUES (3, 1001, '支持向量机算法', 2, '调整SVM核函数参数并重试', 'PUT /api/model/svm/config', '{\"modelCode\":\"SVM\", \"kernel\": \"rbf\", \"C\": 1.5, \"gamma\": \"scale\"}', '{\"code\":200, \"msg\": \"配置更新成功，等待下次计算生效\"}', '192.168.10.55', '江苏省南京市', 1, 1, 0, '吴同', 10001, '2026-07-16 11:00:00', '吴同', 10001, '2026-07-16 11:00:00', '优化分类边界准确率');
INSERT INTO `model_operate` VALUES (4, 1001, '随机森林算法', 1, '执行客户流失风险批量预测', 'POST /api/model/random_forest/predict', '{\"modelCode\":\"RANDOM_FOREST\", \"batchSize\": 1000, \"inputSource\": \"db_crm_customers\"}', '{\"code\":200, \"msg\": \"预测完成\", \"resultCount\": 1000, \"highRiskCount\": 45}', '192.168.10.55', '江苏省南京市', 1, 1, 0, '吴同', 10001, '2026-07-16 14:20:00', '吴同', 10001, '2026-07-16 14:20:00', '月度例行风险评估');

-- ----------------------------
-- Table structure for model_output
-- ----------------------------
DROP TABLE IF EXISTS `model_output`;
CREATE TABLE `model_output`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '企业Id',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数名称',
  `eng_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '英文名称',
  `type` int(11) NULL DEFAULT NULL COMMENT '参数类型 0:单值，1：多列数值',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '所属模型id',
  `model_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型名称',
  `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型版本',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数说明(描述)',
  `single_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数单值',
  `multiple_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数多列值',
  `valid_flag` int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
  `del_flag` int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型输出管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_output
-- ----------------------------
INSERT INTO `model_output` VALUES (1, NULL, '33', '22', 1, 4, '测试', '1', NULL, '[]', '[{\"name\":\"1\",\"value\":\"2\",\"order\":0,\"index\":1}]', 1, 1, 'admin', 1, '2025-11-17 04:29:29', NULL, NULL, '2025-11-17 04:29:28', NULL);
INSERT INTO `model_output` VALUES (2, NULL, 'z', 'z', 0, 5, '测试', '1', NULL, '\"1\"', '[]', 1, 1, 'admin', 1, '2025-11-17 06:21:19', NULL, NULL, '2025-11-17 06:21:20', NULL);
INSERT INTO `model_output` VALUES (3, NULL, '水利1112', 'weater', 0, 5, '单机程序', '1', NULL, '[]', '[]', 1, 1, '小桐', 1, '2026-01-06 14:47:18', NULL, NULL, '2026-01-06 14:47:24', NULL);
INSERT INTO `model_output` VALUES (4, NULL, '输出模型', 'q', 0, 5, '单机程序', '1', 'qqq', '\"0\"', '[]', 1, 1, '小桐', 1, '2026-01-09 16:26:54', '小桐', 1, '2026-01-13 14:52:55', NULL);
INSERT INTO `model_output` VALUES (5, NULL, 'AVQ', '/data/jgst/jgst.chaoshen.20250113/data_output.json', 0, 12, '流量是计算', '2', '测试', '\"0\"', '[]', 1, 0, '小桐', 1, '2026-01-14 18:05:18', '小桐', 1, '2026-01-21 15:16:51', NULL);

-- ----------------------------
-- Table structure for model_reconstitution
-- ----------------------------
DROP TABLE IF EXISTS `model_reconstitution`;
CREATE TABLE `model_reconstitution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型名称',
  `classify_id` int(11) NULL DEFAULT NULL COMMENT '模型分类',
  `builtin` int(11) NULL DEFAULT NULL COMMENT '是否预置',
  `access_mode` int(11) NULL DEFAULT NULL COMMENT '接入方式',
  `request_method` int(11) NULL DEFAULT NULL COMMENT '请求方式',
  `interfaceorfile_address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口和文件的地址',
  `version_id` int(11) NULL DEFAULT NULL COMMENT '版本id',
  `whether_publish` int(11) NOT NULL COMMENT '是否发布',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `del_flag` bigint(20) NOT NULL COMMENT '删除标志',
  `create_by` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `port` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口的端口号',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `runnable_file_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '可执行文件相对路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型库重构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_reconstitution
-- ----------------------------
INSERT INTO `model_reconstitution` VALUES (1, NULL, '产汇流模型', 2, NULL, NULL, NULL, NULL, 1, 0, '2025-11-14 18:35:43', 1, 'admin', 1, '2025-11-14 18:34:04', NULL, NULL, '2025-11-14 18:35:43', NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (2, NULL, '123', 2, 1, 1, NULL, NULL, 2, 0, NULL, 1, 'admin', 1, '2025-11-14 19:38:17', NULL, NULL, NULL, NULL, '123', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (3, NULL, 'test', 2, 0, 0, NULL, 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip', 3, 0, NULL, 1, 'admin', 1, '2025-11-16 15:38:07', NULL, NULL, NULL, NULL, NULL, 'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (4, NULL, '测试', 2, 0, 0, NULL, 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip', 4, 0, '2025-11-17 04:21:54', 1, 'admin', 1, '2025-11-16 15:40:03', NULL, NULL, '2025-11-17 04:21:54', NULL, NULL, 'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (5, NULL, '单机程序', 3, 0, 0, NULL, 'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip', 5, 0, '2025-12-30 13:30:41', 1, 'admin', 1, '2025-11-17 06:20:23', NULL, NULL, '2025-12-30 13:30:41', NULL, NULL, 'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (6, NULL, 'ceshi ', 2, NULL, 1, NULL, NULL, 6, 0, NULL, 1, 'admin', 1, '2025-11-18 10:45:41', NULL, NULL, NULL, NULL, '1001', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (7, NULL, '来水预测模型', 3, 0, 1, NULL, NULL, 12, 0, '2025-12-11 14:38:09', 1, 'admin', 1, '2025-12-11 10:38:28', '小桐', 1, '2026-01-14 15:32:29', '模型介绍', '6379', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (8, NULL, '综合水利集成模型', 28, 1, 0, NULL, NULL, 8, 0, NULL, 1, '小桐', 1, '2025-12-31 15:40:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (9, NULL, '水土保持模型', 30, NULL, 0, NULL, NULL, 9, 0, NULL, 1, '小桐', 1, '2025-12-31 15:40:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (10, NULL, '水土保持模型', 30, 1, 0, NULL, 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip', 10, 0, NULL, 1, '小桐', 1, '2025-12-31 18:17:47', NULL, NULL, NULL, NULL, NULL, 'jgst.chaoshen.20250113.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (11, NULL, 'AI水位预测', 29, 0, 0, NULL, 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip', 11, 0, '2026-01-06 17:14:08', 0, '小桐', 1, '2025-12-31 18:25:19', NULL, NULL, '2026-01-06 17:14:08', NULL, NULL, 'jgst.chaoshen.20250113.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (12, NULL, '流量是计算', 9, 1, 0, NULL, 'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip', 14, 0, '2026-04-09 15:49:50', 0, '小桐', 1, '2026-01-14 16:22:53', 'qModel', 1, '2026-04-09 15:49:50', NULL, NULL, NULL, '\\jgst.chaoshen.20250113\\data.json');
INSERT INTO `model_reconstitution` VALUES (13, NULL, '接口服务类', 9, 1, 1, NULL, NULL, 22, 0, '2026-07-01 18:26:32', 0, '小桐', 1, '2026-01-20 09:17:25', 'qModel', 1, '2026-07-01 18:26:32', NULL, '80', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (14, NULL, 'base64图片获取', 3, 1, 1, NULL, NULL, 19, 0, NULL, 1, '小桐', 1, '2026-01-21 14:41:41', '小桐', 1, '2026-01-21 14:41:41', NULL, '80', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (15, NULL, '测试', 3, 1, 1, NULL, NULL, 20, 0, NULL, 1, '小桐', 1, '2026-01-21 14:47:59', '小桐', 1, '2026-01-21 14:47:59', NULL, '6379', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (16, NULL, '测试', 17, 0, 1, NULL, 'http:192.1623', 21, 0, NULL, 1, '小桐', 1, '2026-01-21 15:27:03', '小桐', 1, '2026-01-21 15:27:03', NULL, '8888', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (17, NULL, '降雨量计算', 8, 1, 0, NULL, 'http://localhost:8090/profile/upload/2026/03/06/test1111.py_20260306154644A001.zip', 23, 0, '2026-04-09 15:35:17', 0, '小桐2', 1, '2026-03-06 15:49:45', 'qModel', 1, '2026-04-09 15:35:17', '111', NULL, NULL, 'test1111.py');
INSERT INTO `model_reconstitution` VALUES (18, NULL, '来水预测', 8, 1, 0, NULL, 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409154627A004.zip', 24, 0, NULL, 0, 'qModel', 1, '2026-04-09 15:46:39', 'qModel', 1, '2026-04-09 15:46:39', NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (19, NULL, '转发三方信息', 8, 1, 1, NULL, 'http://localhost/model/version', 25, 0, '2026-04-09 15:55:20', 1, 'qModel', 1, '2026-04-09 15:50:23', 'qModel', 1, '2026-04-09 15:55:20', '权威的', '80', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (20, NULL, '测试', 12, 1, 0, NULL, 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155539A005.zip', 26, 0, NULL, 0, 'qModel', 1, '2026-04-09 15:55:43', 'qModel', 1, '2026-04-09 15:55:43', NULL, '80', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (21, NULL, 'model', 8, 1, 0, NULL, 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155629A006.zip', 27, 0, NULL, 1, 'qModel', 1, '2026-04-09 15:56:33', 'qModel', 1, '2026-04-09 15:56:33', 'qwdqw ', '80', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (22, NULL, '测试模型', 8, 0, 0, NULL, NULL, 28, 0, NULL, 1, 'qModel', 1, '2026-07-01 13:35:34', 'qModel', 1, '2026-07-01 13:35:34', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for model_version
-- ----------------------------
DROP TABLE IF EXISTS `model_version`;
CREATE TABLE `model_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '所属模型id',
  `model_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型名称',
  `version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型版本号',
  `file_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件地址',
  `interface_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口地址',
  `status` int(11) NULL DEFAULT NULL COMMENT '版本状态',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `valid_flag` int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
  `del_flag` int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件的名称',
  `runnable_file_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '可执行文件地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '版本管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_version
-- ----------------------------
INSERT INTO `model_version` VALUES (1, NULL, 1, '产汇流模型', NULL, NULL, NULL, 1, '产汇流模型', 1, 0, 'admin', 1, '2025-11-14 18:34:04', NULL, NULL, '2025-11-14 18:34:04', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (2, NULL, 2, '123', '123', NULL, NULL, 1, '123', 1, 0, 'admin', 1, '2025-11-14 19:38:17', NULL, NULL, '2025-11-14 19:38:17', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (3, NULL, 3, 'test', '1', 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip', 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip', 1, '1', 1, 0, 'admin', 1, '2025-11-16 15:38:06', NULL, NULL, '2025-11-16 15:38:07', NULL, NULL, '\\MODEL_OUTPUT.sql');
INSERT INTO `model_version` VALUES (4, NULL, 4, '123123', '1', 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip', 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip', 1, '1', 1, 0, 'admin', 1, '2025-11-16 15:40:03', NULL, NULL, '2025-11-16 15:40:03', NULL, NULL, '\\MODEL_OUTPUT.sql');
INSERT INTO `model_version` VALUES (5, NULL, 5, '测试', '1', 'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip', 'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip', 1, '1', 1, 0, 'admin', 1, '2025-11-17 06:20:22', NULL, NULL, '2025-11-17 06:20:23', NULL, NULL, 'MODEL_COMPUTE.sql');
INSERT INTO `model_version` VALUES (6, NULL, 6, 'ceshi ', '1', NULL, NULL, 1, '1', 1, 0, 'admin', 1, '2025-11-18 10:45:41', NULL, NULL, '2025-11-18 10:45:41', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (7, NULL, 7, '来水预测模型', 'v1.0', NULL, NULL, 0, '测试', 1, 1, 'admin', 1, '2025-12-11 10:38:28', '小桐', 1, '2026-01-20 11:56:59', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (8, NULL, 8, '综合水利集成模型', '1.0', NULL, NULL, 1, '综合水利集成模型演算', 1, 0, '小桐', 1, '2025-12-31 15:40:23', NULL, NULL, '2025-12-31 15:40:23', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (9, NULL, 9, '水土保持模型', '1.0', NULL, NULL, 1, '水土保持模型', 1, 0, '小桐', 1, '2025-12-31 15:40:54', NULL, NULL, '2025-12-31 15:40:55', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (10, NULL, 10, '水土保持模型', '1.0', 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip', 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip', 1, '水土保持模型', 1, 0, '小桐', 1, '2025-12-31 18:17:47', NULL, NULL, '2025-12-31 18:17:47', NULL, NULL, '\\jgst.chaoshen.20250113\\chaoshen.20250113.py');
INSERT INTO `model_version` VALUES (11, NULL, 11, 'AI水位预测', '1.2', 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip', 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip', 1, 'AI水位预测', 1, 0, '小桐', 1, '2025-12-31 18:25:19', NULL, NULL, '2025-12-31 18:25:19', NULL, NULL, '\\jgst.chaoshen.20250113\\chaoshen.20250113.py');
INSERT INTO `model_version` VALUES (12, NULL, 7, '来水预测模型', '2', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-14 15:26:32', '小桐', 1, '2026-01-20 13:18:54', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (13, NULL, NULL, '流量是计算', '1', 'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip', 'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip', 1, '不能为空', 1, 0, '小桐', 1, '2026-01-14 16:22:52', '小桐', 1, '2026-01-14 16:22:52', NULL, NULL, '\\jgst.chaoshen.20250113\\data.json');
INSERT INTO `model_version` VALUES (14, NULL, 12, '流量是计算', '2', NULL, NULL, 1, NULL, 1, 0, '小桐', 1, '2026-01-14 16:51:33', '小桐', 1, '2026-01-20 11:41:22', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (15, NULL, NULL, '接口服务类', '1', NULL, NULL, 1, '接口服务类', 1, 0, '小桐', 1, '2026-01-20 09:17:24', '小桐', 1, '2026-01-20 09:17:24', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (16, NULL, 12, '流量是计算', '3', NULL, NULL, 0, NULL, 1, 1, '小桐', 1, '2026-01-20 09:22:58', '小桐', 1, '2026-01-20 10:52:29', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (17, NULL, 7, '来水预测模型', '3', NULL, NULL, 0, NULL, 1, 0, '小桐', 1, '2026-01-20 11:56:45', '小桐', 1, '2026-01-20 13:18:54', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (18, NULL, 13, '接口服务类', '1', NULL, NULL, 0, 'version1', 1, 0, '小桐', 1, '2026-01-20 13:19:31', 'qModel', 1, '2026-07-01 17:47:50', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (19, NULL, NULL, 'base64图片获取', '1', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-21 14:41:41', '小桐', 1, '2026-01-21 14:41:41', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (20, NULL, NULL, '测试', '1', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-21 14:47:58', '小桐', 1, '2026-01-21 14:47:58', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (21, NULL, NULL, '测试', '1', 'http:192.1623', 'http:192.1623', 1, '1', 1, 0, '小桐', 1, '2026-01-21 15:27:03', '小桐', 1, '2026-01-21 15:27:03', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (22, NULL, 13, '接口服务类', '2', NULL, NULL, 1, 'version22', 1, 0, '小桐', 1, '2026-01-21 16:30:20', 'qModel', 1, '2026-07-01 17:47:51', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (23, NULL, NULL, '测试一下', '1', 'http://localhost:8090/profile/upload/2026/03/06/test1111.py_20260306154644A001.zip', 'http://localhost:8090/profile/upload/2026/03/06/test1111.py_20260306154644A001.zip', 1, '1111', 1, 0, '小桐2', 1, '2026-03-06 15:49:45', '小桐2', 1, '2026-03-06 15:49:45', NULL, NULL, 'test1111.py');
INSERT INTO `model_version` VALUES (24, NULL, NULL, '来水预测', '1', 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409154627A004.zip', 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409154627A004.zip', 1, '来水预测', 1, 0, 'qModel', 1, '2026-04-09 15:46:38', 'qModel', 1, '2026-04-09 15:46:38', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (25, NULL, NULL, '转发三方信息', '1', NULL, NULL, 1, '取得完全的', 1, 0, 'qModel', 1, '2026-04-09 15:50:22', 'qModel', 1, '2026-04-09 15:50:22', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (26, NULL, NULL, '测试', '1', 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155539A005.zip', 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155539A005.zip', 1, '权威的', 1, 0, 'qModel', 1, '2026-04-09 15:55:43', 'qModel', 1, '2026-04-09 15:55:43', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (27, NULL, NULL, 'model', '1', 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155629A006.zip', 'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155629A006.zip', 1, 'qwdq ', 1, 0, 'qModel', 1, '2026-04-09 15:56:32', 'qModel', 1, '2026-04-09 15:56:32', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (28, NULL, NULL, '测试模型', NULL, NULL, NULL, 1, NULL, 1, 0, 'qModel', 1, '2026-07-01 13:35:33', 'qModel', 1, '2026-07-01 13:35:33', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1723915630000, -1, 5, 'PAUSED', 'CRON', 1723915630000, 0, NULL, 2, NULL);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1723915635000, -1, 5, 'PAUSED', 'CRON', 1723915631000, 0, NULL, 2, NULL);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1723915640000, -1, 5, 'PAUSED', 'CRON', 1723915632000, 0, NULL, 2, NULL);

-- ----------------------------
-- Table structure for rel_user_auth_product
-- ----------------------------
DROP TABLE IF EXISTS `rel_user_auth_product`;
CREATE TABLE `rel_user_auth_product`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统一身份认证id',
  `auth_product_type` int(11) NOT NULL COMMENT '认证平台类型;0：冰凤框架；1：微信；2：支付宝',
  PRIMARY KEY (`user_id`, `auth_id`, `auth_product_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与认证中心关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rel_user_auth_product
-- ----------------------------

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
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
CREATE TABLE `system_content`  (
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
CREATE TABLE `system_dept`  (
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
CREATE TABLE `system_dict_data`  (
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
CREATE TABLE `system_dict_type`  (
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
CREATE TABLE `system_job`  (
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
CREATE TABLE `system_job_log`  (
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
CREATE TABLE `system_logininfor`  (
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
INSERT INTO `system_logininfor` VALUES (1455, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-26 17:40:11');
INSERT INTO `system_logininfor` VALUES (1456, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 09:01:40');
INSERT INTO `system_logininfor` VALUES (1457, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 09:15:35');
INSERT INTO `system_logininfor` VALUES (1458, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 09:28:18');
INSERT INTO `system_logininfor` VALUES (1459, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 11:12:00');
INSERT INTO `system_logininfor` VALUES (1460, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 11:37:04');
INSERT INTO `system_logininfor` VALUES (1461, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 11:48:27');
INSERT INTO `system_logininfor` VALUES (1462, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-27 15:26:51');
INSERT INTO `system_logininfor` VALUES (1463, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 15:26:57');
INSERT INTO `system_logininfor` VALUES (1464, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 15:32:07');
INSERT INTO `system_logininfor` VALUES (1465, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 16:04:09');
INSERT INTO `system_logininfor` VALUES (1466, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-27 18:09:34');
INSERT INTO `system_logininfor` VALUES (1467, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-03-03 14:20:35');
INSERT INTO `system_logininfor` VALUES (1468, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2026-03-06 15:45:59');
INSERT INTO `system_logininfor` VALUES (1469, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2026-03-06 16:28:34');
INSERT INTO `system_logininfor` VALUES (1470, 'aiwater', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-03-16 09:36:54');
INSERT INTO `system_logininfor` VALUES (1471, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-03-16 09:36:59');
INSERT INTO `system_logininfor` VALUES (1472, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-03-16 09:37:41');
INSERT INTO `system_logininfor` VALUES (1473, 'qModel', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2026-03-18 09:05:15');
INSERT INTO `system_logininfor` VALUES (1474, 'qModel', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2026-03-20 17:35:00');
INSERT INTO `system_logininfor` VALUES (1475, 'qModel', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2026-03-20 17:35:20');
INSERT INTO `system_logininfor` VALUES (1476, 'qModel', '192.168.10.100', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2026-03-23 16:49:58');
INSERT INTO `system_logininfor` VALUES (1477, 'admin', '192.168.10.100', '内网IP', 'Chrome 13', 'Mac OS X', '1', '用户不存在/密码错误', '2026-03-31 09:08:03');
INSERT INTO `system_logininfor` VALUES (1478, 'qmodel', '192.168.10.100', '内网IP', 'Chrome 13', 'Mac OS X', '1', '用户不存在/密码错误', '2026-03-31 09:08:25');
INSERT INTO `system_logininfor` VALUES (1479, 'qmodel', '192.168.10.100', '内网IP', 'Chrome 13', 'Mac OS X', '1', '用户不存在/密码错误', '2026-03-31 09:08:35');
INSERT INTO `system_logininfor` VALUES (1480, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', NULL, '2026-04-09 15:16:45');
INSERT INTO `system_logininfor` VALUES (1481, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', NULL, '2026-04-09 15:17:08');
INSERT INTO `system_logininfor` VALUES (1482, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2026-04-09 15:32:55');
INSERT INTO `system_logininfor` VALUES (1483, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', NULL, '2026-04-09 15:32:59');
INSERT INTO `system_logininfor` VALUES (1484, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-04-09 15:33:54');
INSERT INTO `system_logininfor` VALUES (1485, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-04-15 15:54:15');
INSERT INTO `system_logininfor` VALUES (1486, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-04-16 14:02:25');
INSERT INTO `system_logininfor` VALUES (1487, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-04-16 14:14:51');
INSERT INTO `system_logininfor` VALUES (1488, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-04-17 10:41:18');
INSERT INTO `system_logininfor` VALUES (1489, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-04-21 10:48:03');
INSERT INTO `system_logininfor` VALUES (1490, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-01 12:02:09');
INSERT INTO `system_logininfor` VALUES (1491, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-01 13:35:05');
INSERT INTO `system_logininfor` VALUES (1492, 'qThing', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-07-02 12:10:12');
INSERT INTO `system_logininfor` VALUES (1493, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-02 12:10:27');
INSERT INTO `system_logininfor` VALUES (1494, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-07-06 09:19:16');
INSERT INTO `system_logininfor` VALUES (1495, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-07-06 09:19:23');
INSERT INTO `system_logininfor` VALUES (1496, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-06 09:19:33');
INSERT INTO `system_logininfor` VALUES (1497, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-07-06 17:14:11');
INSERT INTO `system_logininfor` VALUES (1498, 'aiwater', '127.0.0.1', '内网IP', 'Chrome 15', 'Windows 10', '1', '用户不存在/密码错误', '2026-07-06 17:32:07');
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
CREATE TABLE `system_notice`  (
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
CREATE TABLE `system_oper_log`  (
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
CREATE TABLE `system_post`  (
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
CREATE TABLE `system_role`  (
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
CREATE TABLE `system_role_dept`  (
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
CREATE TABLE `system_role_menu`  (
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
CREATE TABLE `system_user`  (
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
CREATE TABLE `system_user_post`  (
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
CREATE TABLE `system_user_role`  (
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
