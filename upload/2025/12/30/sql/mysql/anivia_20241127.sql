/*
 Navicat Premium Data Transfer

 Source Server         : 浙江服务器
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : ssh.mingzhu.online:3306
 Source Schema         : anivia_dev

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 27/11/2024 17:31:01
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
  `type` tinyint(4) UNSIGNED NOT NULL COMMENT '应用类型;0：Web，1：App，2：小程序',
  `icon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用图标',
  `home_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用首页',
  `sync_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '同步地址',
  `redirect_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '允许授权的url',
  `public_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否公开',
  `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id;创建者的sys_user_id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人id;更新者的sys_user_id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_client
-- ----------------------------
INSERT INTO `auth_client` VALUES (4, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (6, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (7, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (8, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (9, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (10, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (11, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (12, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (13, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (14, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (15, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (16, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (17, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (18, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (19, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (20, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (21, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (22, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (23, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (24, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (25, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (26, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (27, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (28, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (29, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (30, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (31, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (32, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (33, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (34, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (35, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (36, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (37, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO `auth_client` VALUES (38, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', 1, 1, 0, '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);

-- ----------------------------
-- Table structure for auth_client_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_client_user`;
CREATE TABLE `auth_client_user`  (
  `client_id` bigint(20) NOT NULL COMMENT '应用ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `open_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'open_id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用和用户关联表' ROW_FORMAT = DYNAMIC;

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
  `valid_flag` int(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` int(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注;备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '证书管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ca_cert
-- ----------------------------
INSERT INTO `ca_cert` VALUES (9, '冰凤框架Nginx证书', 9, '江苏千桐科技有限公司', '/profile/ca/2024/10/23/6718d6e3a921cf6536292244.cer', '/profile/ca/2024/10/23/6718d6e3a921cf6536292245.pem', '江苏千桐科技有限公司', '192.168.0.1', '30', 1, 0, 'admin', 1, '2024-10-23 18:58:44', NULL, NULL, NULL);

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
  `valid_flag` int(1) NOT NULL DEFAULT 1 COMMENT '是否有效;是否有效 0：无效，1：有效',
  `del_flag` int(1) NOT NULL DEFAULT 0 COMMENT '删除标志;删除标志 1：已删除，0：未删除',
  `create_by` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人;创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id;创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间;创建时间',
  `update_by` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人;更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间;更新时间',
  `remark` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注;备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '主体管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ca_subject
-- ----------------------------
INSERT INTO `ca_subject` VALUES (9, '江苏千桐科技有限公司', '江苏千桐科技有限公司', '技术部', '技术部', '南京', '江苏', '中国', '/profile/ca/2024/10/23/6718d658a921cf6536292242.cer', '/profile/ca/2024/10/23/6718d658a921cf6536292243.pem', 1, 0, 'admin', 1, '2024-10-23 18:56:25', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for example_dept
-- ----------------------------
DROP TABLE IF EXISTS `example_dept`;
CREATE TABLE `example_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父部门id',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门名称',
  `leader` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '部门状态',
  `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '示例部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example_dept
-- ----------------------------
INSERT INTO `example_dept` VALUES (1, 0, '云桐科技', '张三', 'xxxxxxxx', 'xxxxxxx', 0, 1, 0, 'admin', 1, '2024-11-27 00:00:00', 'admin', 1, '2024-11-27 16:43:05', '测试数据');
INSERT INTO `example_dept` VALUES (2, 1, '郑州总部', '李四', '/', '/', 0, 1, 0, 'admin', 1, '2024-11-27 00:00:00', 'admin', 1, '2024-11-27 15:11:10', '总部测试');
INSERT INTO `example_dept` VALUES (3, 1, '老君山', '君山', NULL, NULL, 1, 1, 0, 'admin', 1, '2024-11-27 15:11:40', NULL, NULL, '2024-11-27 15:11:39', NULL);

-- ----------------------------
-- Table structure for example_user
-- ----------------------------
DROP TABLE IF EXISTS `example_user`;
CREATE TABLE `example_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `age` int(11) NOT NULL COMMENT '年龄',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `type_id` bigint(20) NULL DEFAULT NULL COMMENT '用户类型',
  `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '示例用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_user
-- ----------------------------
INSERT INTO `example_user` VALUES (1, '张三', 18, '19951942682', 1, 1, 1, '若依1', 1, '2024-10-23 16:26:37', NULL, NULL, '2024-10-23 16:26:37', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (19, 'example_user', '示例用户表', NULL, NULL, 'ExampleUser', 'crud', 'element-plus', 'tech.qiantong.module.example.del', 'user', 'user', '示例用户', 'anivia', '0', '/', '{\"parentMenuId\":\"2023\"}', 'admin', '2024-10-23 15:44:32', '', '2024-11-27 10:05:37', NULL);
INSERT INTO `gen_table` VALUES (22, 'message', '消息', NULL, NULL, 'Message', 'crud', 'element-plus', 'tech.qiantong.module.system', 'message', 'message3', '消息', 'anivia', '0', '/', '{\"parentMenuId\":\"1\"}', 'admin', '2024-10-31 14:25:33', '', '2024-11-26 15:52:43', NULL);
INSERT INTO `gen_table` VALUES (23, 'message_template', '消息模板', NULL, NULL, 'MessageTemplate', 'crud', 'element-plus', 'tech.qiantong.module.system', 'message', 'messageTemplate', '消息模板', 'anivia', '0', '/', '{\"parentMenuId\":1}', 'admin', '2024-10-31 14:25:34', '', '2024-11-01 09:49:52', NULL);
INSERT INTO `gen_table` VALUES (24, 'rel_user_auth_product', '用户与认证中心关系表', NULL, NULL, 'RelUserAuthProduct', 'crud', 'element-plus', 'tech.qiantong.module.system', 'auth', 'userAuthProduct', '用户与认证中心关系', 'anivia', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-11-07 09:43:21', '', '2024-11-07 09:46:48', NULL);
INSERT INTO `gen_table` VALUES (26, 'pro_plan', '生产计划', NULL, NULL, 'ProPlan', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example', 'orderTask', 'proOrderTask', '生产计划', 'anivia', '0', 'D:\\workspace\\Anivia-Plus\\anivia-ui\\anivia3', '{\"parentMenuId\":\"2023\"}', 'admin', '2024-11-22 11:52:04', '', '2024-11-22 15:08:06', NULL);
INSERT INTO `gen_table` VALUES (27, 'pro_task_receive', '生产领料记录', NULL, NULL, 'ProTaskReceive', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example', 'taskReceive', 'proTaskReceive', '生产领料记录', 'anivia', '0', '/', '{\"parentMenuId\":2023}', 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12', NULL);
INSERT INTO `gen_table` VALUES (29, 'user_type', '用户类型', NULL, NULL, 'UserType', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example', 'user', 'userType', '用户类型', 'anivia', '0', '/', '{\"parentMenuId\":2023}', 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:06', NULL);
INSERT INTO `gen_table` VALUES (31, 'example_dept', '示例部门表', '', '', 'ExampleDept', 'tree', 'element-plus', 'tech.qiantong.qmodel.module.example', 'gen', 'dept', '示例部门', 'anivia', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"\"}', 'admin', '2024-11-27 10:29:01', '', '2024-11-27 11:17:24', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 468 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (284, 19, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:37');
INSERT INTO `gen_table_column` VALUES (285, 19, 'name', '名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', '', 2, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:37');
INSERT INTO `gen_table_column` VALUES (286, 19, 'age', '年龄', 'int(11)', 'Long', 'age', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:37');
INSERT INTO `gen_table_column` VALUES (287, 19, 'phone', '手机号', 'varchar(32)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 4, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:37');
INSERT INTO `gen_table_column` VALUES (288, 19, 'type_id', '用户类型', 'bigint(20)', 'Long', 'typeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'checkbox', 'sys_yes_no', 5, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:37');
INSERT INTO `gen_table_column` VALUES (289, 19, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:37');
INSERT INTO `gen_table_column` VALUES (290, 19, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:37');
INSERT INTO `gen_table_column` VALUES (291, 19, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', '', 8, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:37');
INSERT INTO `gen_table_column` VALUES (292, 19, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:38');
INSERT INTO `gen_table_column` VALUES (293, 19, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:38');
INSERT INTO `gen_table_column` VALUES (294, 19, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2024-10-23 16:21:16', '', '2024-11-27 10:05:38');
INSERT INTO `gen_table_column` VALUES (295, 19, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2024-10-23 16:21:17', '', '2024-11-27 10:05:38');
INSERT INTO `gen_table_column` VALUES (296, 19, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2024-10-23 16:21:17', '', '2024-11-27 10:05:38');
INSERT INTO `gen_table_column` VALUES (297, 19, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', '', 14, '', '2024-10-23 16:21:17', '', '2024-11-27 10:05:38');
INSERT INTO `gen_table_column` VALUES (308, 22, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:43');
INSERT INTO `gen_table_column` VALUES (309, 22, 'sender_id', '发送人', 'bigint(20)', 'Long', 'senderId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:43');
INSERT INTO `gen_table_column` VALUES (310, 22, 'receiver_id', '接收人', 'bigint(20)', 'Long', 'receiverId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:43');
INSERT INTO `gen_table_column` VALUES (311, 22, 'title', '消息标题', 'varchar(128)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (312, 22, 'content', '消息模板内容', 'varchar(3072)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 5, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (313, 22, 'category', '消息类别', 'tinyint(4) unsigned', 'Integer', 'category', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (314, 22, 'level', '消息等级', 'tinyint(4) unsigned', 'Integer', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (315, 22, 'module', '消息模块', 'tinyint(4) unsigned', 'Integer', 'module', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (316, 22, 'entity_type', '实体类型', 'tinyint(4) unsigned', 'Integer', 'entityType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (317, 22, 'entity_id', '实体id', 'bigint(20)', 'Long', 'entityId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (318, 22, 'entity_url', '消息链接', 'varchar(256)', 'String', 'entityUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (319, 22, 'has_read', '是否已读', 'tinyint(1)', 'Integer', 'hasRead', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (320, 22, 'has_retraction', '是否撤回', 'tinyint(1)', 'Integer', 'hasRetraction', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (321, 22, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (322, 22, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (323, 22, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (324, 22, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (325, 22, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO `gen_table_column` VALUES (326, 22, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:45');
INSERT INTO `gen_table_column` VALUES (327, 22, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:45');
INSERT INTO `gen_table_column` VALUES (328, 22, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 21, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:45');
INSERT INTO `gen_table_column` VALUES (329, 22, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 22, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:45');
INSERT INTO `gen_table_column` VALUES (330, 23, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (331, 23, 'title', '消息标题', 'varchar(128)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (332, 23, 'content', '消息模板内容', 'varchar(3072)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (333, 23, 'category', '消息类别', 'tinyint(4) unsigned', 'Integer', 'category', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (334, 23, 'level', '消息等级', 'tinyint(4) unsigned', 'Integer', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (335, 23, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (336, 23, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (337, 23, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (338, 23, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (339, 23, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO `gen_table_column` VALUES (340, 23, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:53');
INSERT INTO `gen_table_column` VALUES (341, 23, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:53');
INSERT INTO `gen_table_column` VALUES (342, 23, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:53');
INSERT INTO `gen_table_column` VALUES (343, 23, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 14, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:53');
INSERT INTO `gen_table_column` VALUES (344, 24, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-11-07 09:43:22', '', '2024-11-07 09:46:48');
INSERT INTO `gen_table_column` VALUES (345, 24, 'auth_id', '统一身份认证id', 'varchar(256)', 'String', 'authId', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-07 09:43:22', '', '2024-11-07 09:46:49');
INSERT INTO `gen_table_column` VALUES (346, 24, 'auth_product_type', '认证平台类型', 'tinyint(4) unsigned', 'Integer', 'authProductType', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-11-07 09:43:22', '', '2024-11-07 09:46:49');
INSERT INTO `gen_table_column` VALUES (358, 26, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-11-22 11:52:04', '', '2024-11-22 15:08:06');
INSERT INTO `gen_table_column` VALUES (359, 26, 'company_id', '所属母公司id', 'bigint(20)', 'Long', 'companyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-22 11:52:04', '', '2024-11-22 15:08:06');
INSERT INTO `gen_table_column` VALUES (360, 26, 'subsidiary_id', '所属子公司id', 'bigint(20)', 'Long', 'subsidiaryId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:06');
INSERT INTO `gen_table_column` VALUES (361, 26, 'sale_id', '销售单id', 'bigint(20)', 'Long', 'saleId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:06');
INSERT INTO `gen_table_column` VALUES (362, 26, 'sale_code', '销售单号', 'varchar(32)', 'String', 'saleCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:06');
INSERT INTO `gen_table_column` VALUES (363, 26, 'code', '计划单号', 'varchar(32)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (364, 26, 'product_id', '产品id', 'bigint(20)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (365, 26, 'product_code', '产品编码', 'varchar(32)', 'String', 'productCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (366, 26, 'split_route_type', '拆单工艺类型', 'tinyint(4) unsigned', 'Integer', 'splitRouteType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (367, 26, 'pro_bom_id', '生产BOMid', 'bigint(20)', 'Long', 'proBomId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (368, 26, 'pro_bom_code', '生产BOM编码', 'varchar(32)', 'String', 'proBomCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (369, 26, 'route_id', '工艺路线id', 'bigint(20)', 'Long', 'routeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (370, 26, 'route_code', '工艺路线编码', 'varchar(32)', 'String', 'routeCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (371, 26, 'status', '状态', 'tinyint(4) unsigned', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (372, 26, 'plan_number', '计划数量', 'int(11)', 'Long', 'planNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (373, 26, 'begin_time', '计划开始时间', 'datetime', 'Date', 'beginTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (374, 26, 'end_time', '计划结束时间', 'datetime', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (375, 26, 'attachment', '附件', 'varchar(3072)', 'String', 'attachment', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 18, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (376, 26, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO `gen_table_column` VALUES (377, 26, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO `gen_table_column` VALUES (378, 26, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO `gen_table_column` VALUES (379, 26, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO `gen_table_column` VALUES (380, 26, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 23, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO `gen_table_column` VALUES (381, 26, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO `gen_table_column` VALUES (382, 26, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-11-22 11:52:07', '', '2024-11-22 15:08:08');
INSERT INTO `gen_table_column` VALUES (383, 26, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 26, 'admin', '2024-11-22 11:52:07', '', '2024-11-22 15:08:08');
INSERT INTO `gen_table_column` VALUES (384, 26, 'remark', '备注', 'text', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 27, 'admin', '2024-11-22 11:52:07', '', '2024-11-22 15:08:08');
INSERT INTO `gen_table_column` VALUES (385, 27, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (386, 27, 'company_id', '所属母公司id', 'bigint(20)', 'Long', 'companyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (387, 27, 'subsidiary_id', '所属子公司id', 'bigint(20)', 'Long', 'subsidiaryId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (388, 27, 'task_id', '任务id', 'bigint(20)', 'Long', 'taskId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (389, 27, 'task_code', '任务编号', 'varchar(32)', 'String', 'taskCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (390, 27, 'order_id', '工单id', 'bigint(20)', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (391, 27, 'order_code', '工单编号', 'varchar(32)', 'String', 'orderCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (392, 27, 'reveive_time', '领料日期', 'datetime', 'Date', 'reveiveTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (393, 27, 'material_id', '物料id', 'bigint(20)', 'Long', 'materialId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (394, 27, 'material_code', '物料编码', 'varchar(32)', 'String', 'materialCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (395, 27, 'staff_id', '领料人id', 'bigint(20)', 'Long', 'staffId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (396, 27, 'count', '领料数量', 'decimal(10,0)', 'Long', 'count', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:12');
INSERT INTO `gen_table_column` VALUES (397, 27, 'unit_id', '单位id', 'bigint(20)', 'Long', 'unitId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (398, 27, 'unit_code', '单位编号', 'varchar(32)', 'String', 'unitCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (399, 27, 'store_id', '仓库id', 'bigint(20)', 'Long', 'storeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (400, 27, 'store_code', '仓库编码', 'varchar(32)', 'String', 'storeCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (401, 27, 'store_location_id', '所属库位id', 'bigint(20)', 'Long', 'storeLocationId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (402, 27, 'store_location_code', '所属库位编码', 'varchar(32)', 'String', 'storeLocationCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (403, 27, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (404, 27, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (405, 27, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (406, 27, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (407, 27, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 23, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (408, 27, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (409, 27, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO `gen_table_column` VALUES (410, 27, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 26, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:14');
INSERT INTO `gen_table_column` VALUES (411, 27, 'remark', '备注', 'text', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 27, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:14');
INSERT INTO `gen_table_column` VALUES (426, 29, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:06');
INSERT INTO `gen_table_column` VALUES (427, 29, 'name', '类型名称', 'varchar(128)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:06');
INSERT INTO `gen_table_column` VALUES (428, 29, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:06');
INSERT INTO `gen_table_column` VALUES (429, 29, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:06');
INSERT INTO `gen_table_column` VALUES (430, 29, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:07');
INSERT INTO `gen_table_column` VALUES (431, 29, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:07');
INSERT INTO `gen_table_column` VALUES (432, 29, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:07');
INSERT INTO `gen_table_column` VALUES (433, 29, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:07');
INSERT INTO `gen_table_column` VALUES (434, 29, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:07');
INSERT INTO `gen_table_column` VALUES (435, 29, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:07');
INSERT INTO `gen_table_column` VALUES (436, 29, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2024-11-27 09:57:52', '', '2024-11-27 10:00:07');
INSERT INTO `gen_table_column` VALUES (452, 31, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '0', '0', '0', '0', 'EQ', 'input', '', 1, 'admin', '2024-11-27 10:29:01', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (453, 31, 'parent_id', '父部门id', 'bigint(20)', 'Long', 'parentId', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-11-27 10:29:01', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (454, 31, 'name', '部门名称', 'varchar(128)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-11-27 10:29:01', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (455, 31, 'leader', '负责人', 'varchar(32)', 'String', 'leader', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-11-27 10:29:01', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (456, 31, 'phone', '联系电话', 'varchar(32)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (457, 31, 'email', '邮箱', 'varchar(128)', 'String', 'email', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (458, 31, 'status', '部门状态', 'tinyint(4) unsigned', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 7, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (459, 31, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (460, 31, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (461, 31, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 10, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (462, 31, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 11, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (463, 31, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 12, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (464, 31, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 13, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (465, 31, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 14, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:25');
INSERT INTO `gen_table_column` VALUES (466, 31, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 15, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:26');
INSERT INTO `gen_table_column` VALUES (467, 31, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 16, 'admin', '2024-11-27 10:29:02', '', '2024-11-27 11:17:26');

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
  `category` tinyint(4) UNSIGNED NOT NULL COMMENT '消息类别',
  `msg_level` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息等级',
  `module` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息模块',
  `entity_type` tinyint(4) UNSIGNED NULL DEFAULT NULL COMMENT '实体类型',
  `entity_id` bigint(20) NULL DEFAULT NULL COMMENT '实体id',
  `entity_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息链接',
  `has_read` tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
  `has_retraction` tinyint(1) NULL DEFAULT 0 COMMENT '是否撤回',
  `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL, '2024-11-01 15:51:36', NULL, NULL, '2024-11-01 15:51:36', NULL);
INSERT INTO `message` VALUES (2, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, 1, 0, 1, 1, NULL, NULL, '2024-11-01 15:51:48', NULL, NULL, '2024-11-01 15:51:48', NULL);
INSERT INTO `message` VALUES (3, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, 1, 0, 1, 1, NULL, NULL, '2024-11-01 15:51:52', NULL, NULL, '2024-11-01 15:51:52', NULL);
INSERT INTO `message` VALUES (4, NULL, 2, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, '2024-11-01 15:52:53', NULL, NULL, '2024-11-01 15:52:53', NULL);
INSERT INTO `message` VALUES (5, NULL, 2, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, '2024-11-01 15:52:54', NULL, NULL, '2024-11-01 15:52:54', NULL);
INSERT INTO `message` VALUES (6, NULL, 2, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, '2024-11-01 15:52:56', NULL, NULL, '2024-11-01 15:52:56', NULL);
INSERT INTO `message` VALUES (7, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL, '2024-11-01 15:53:00', NULL, NULL, '2024-11-01 15:53:00', NULL);
INSERT INTO `message` VALUES (8, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL, '2024-11-01 17:19:43', NULL, NULL, '2024-11-01 17:19:43', NULL);
INSERT INTO `message` VALUES (9, NULL, 1, '测试模版', '***************测试模版', 0, 0, 1, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL, '2024-11-04 09:17:08', NULL, NULL, '2024-11-04 09:17:08', NULL);
INSERT INTO `message` VALUES (10, NULL, 1, '测试模版', '***************测试模版', 0, 0, 1, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL, '2024-11-04 09:17:27', NULL, NULL, '2024-11-04 09:17:27', NULL);
INSERT INTO `message` VALUES (11, NULL, 1, '测试模版', '***************测试模版', 0, 0, 1, NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL, '2024-11-04 09:17:52', NULL, NULL, '2024-11-04 09:17:52', NULL);
INSERT INTO `message` VALUES (12, NULL, 1, '测试模版', '***************测试模版', 0, 0, 1, NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL, '2024-11-04 09:17:59', NULL, NULL, '2024-11-04 09:17:59', NULL);
INSERT INTO `message` VALUES (13, NULL, 1, '测试模版', '111111111111测试模版', 0, 0, 1, NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL, '2024-11-04 09:21:32', NULL, NULL, '2024-11-04 09:21:32', NULL);
INSERT INTO `message` VALUES (14, NULL, 1, '测试模版', '111111111111测试模版', 0, 0, 1, NULL, NULL, NULL, 1, 0, 1, 1, NULL, NULL, '2024-11-04 09:21:36', NULL, NULL, '2024-11-04 09:21:36', NULL);

-- ----------------------------
-- Table structure for message_template
-- ----------------------------
DROP TABLE IF EXISTS `message_template`;
CREATE TABLE `message_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息模板内容',
  `category` tinyint(4) UNSIGNED NOT NULL COMMENT '消息类别',
  `msg_level` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息等级',
  `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message_template
-- ----------------------------
INSERT INTO `message_template` VALUES (1, '测试模版', '${test}测试模版', 0, 0, 1, 0, '', 1, '2024-11-01 10:35:16', NULL, 1, '2024-11-08 11:40:48', NULL);
INSERT INTO `message_template` VALUES (2, '测试', '2', 0, 0, 1, 0, 'admin', 1, '2024-11-20 11:12:52', NULL, NULL, '2024-11-20 11:12:52', NULL);

-- ----------------------------
-- Table structure for pro_plan
-- ----------------------------
DROP TABLE IF EXISTS `pro_plan`;
CREATE TABLE `pro_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` bigint(20) NULL DEFAULT NULL COMMENT '所属母公司id',
  `subsidiary_id` bigint(20) NULL DEFAULT NULL COMMENT '所属子公司id',
  `sale_id` bigint(20) NULL DEFAULT NULL COMMENT '销售单id',
  `sale_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '销售单号',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '计划单号',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `product_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品编码',
  `split_route_type` tinyint(4) UNSIGNED NOT NULL COMMENT '拆单工艺类型',
  `pro_bom_id` bigint(20) NULL DEFAULT NULL COMMENT '生产BOMid',
  `pro_bom_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生产BOM编码',
  `route_id` bigint(20) NULL DEFAULT NULL COMMENT '工艺路线id',
  `route_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工艺路线编码',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `plan_number` int(11) NOT NULL COMMENT '计划数量',
  `begin_time` datetime NOT NULL COMMENT '计划开始时间',
  `end_time` datetime NOT NULL COMMENT '计划结束时间',
  `attachment` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件',
  `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '生产计划' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_plan
-- ----------------------------

-- ----------------------------
-- Table structure for pro_task_receive
-- ----------------------------
DROP TABLE IF EXISTS `pro_task_receive`;
CREATE TABLE `pro_task_receive`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` bigint(20) NULL DEFAULT NULL COMMENT '所属母公司id',
  `subsidiary_id` bigint(20) NULL DEFAULT NULL COMMENT '所属子公司id',
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `task_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务编号',
  `order_id` bigint(20) NOT NULL COMMENT '工单id',
  `order_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工单编号',
  `reveive_time` datetime NOT NULL COMMENT '领料日期',
  `material_id` bigint(20) NOT NULL COMMENT '物料id',
  `material_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物料编码',
  `staff_id` bigint(20) NOT NULL COMMENT '领料人id',
  `count` decimal(10, 0) NOT NULL COMMENT '领料数量',
  `unit_id` bigint(20) NOT NULL COMMENT '单位id',
  `unit_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单位编号',
  `store_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `store_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '仓库编码',
  `store_location_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库位id',
  `store_location_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属库位编码',
  `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '生产领料记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_task_receive
-- ----------------------------
INSERT INTO `pro_task_receive` VALUES (1, NULL, NULL, 1, '1', 1, '1', '2024-11-15 00:00:00', 1, '1', 1, 1, 1, '1', NULL, NULL, NULL, NULL, 1, 1, 'admin', 1, '2024-11-26 00:00:00', 'admin', 1, '2024-11-26 11:42:46', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

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
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

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
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
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
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1723915630000, -1, 5, 'PAUSED', 'CRON', 1723915630000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1723915635000, -1, 5, 'PAUSED', 'CRON', 1723915631000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1723915640000, -1, 5, 'PAUSED', 'CRON', 1723915632000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for rel_user_auth_product
-- ----------------------------
DROP TABLE IF EXISTS `rel_user_auth_product`;
CREATE TABLE `rel_user_auth_product`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统一身份认证id',
  `auth_product_type` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '认证平台类型;0：冰凤框架；1：微信；2：支付宝',
  PRIMARY KEY (`user_id`, `auth_id`, `auth_product_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与认证中心关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rel_user_auth_product
-- ----------------------------
INSERT INTO `rel_user_auth_product` VALUES (1, '1', 0);

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `system_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '初始化密码 123456');
INSERT INTO `system_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `system_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `system_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `system_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '-', 'Y', 'admin', '2024-05-06 06:12:18', 'admin', '2024-11-26 15:51:27', '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept` VALUES (100, 0, '0', '千桐科技', 0, '千桐', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-10-29 16:51:32');
INSERT INTO `system_dept` VALUES (101, 100, '0,100', '南京总公司', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 13:46:24');
INSERT INTO `system_dept` VALUES (102, 100, '0,100', '郑州分公司', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 13:46:44');
INSERT INTO `system_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO `system_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO `system_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO `system_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO `system_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:50:19');
INSERT INTO `system_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO `system_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_data`;
CREATE TABLE `system_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
INSERT INTO `system_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '性别男');
INSERT INTO `system_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '性别女');
INSERT INTO `system_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '性别未知');
INSERT INTO `system_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '显示菜单');
INSERT INTO `system_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '隐藏菜单');
INSERT INTO `system_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '正常状态');
INSERT INTO `system_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '停用状态');
INSERT INTO `system_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '正常状态');
INSERT INTO `system_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '停用状态');
INSERT INTO `system_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '默认分组');
INSERT INTO `system_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统分组');
INSERT INTO `system_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统默认是');
INSERT INTO `system_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统默认否');
INSERT INTO `system_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '通知');
INSERT INTO `system_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '公告');
INSERT INTO `system_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '正常状态');
INSERT INTO `system_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '关闭状态');
INSERT INTO `system_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '其他操作');
INSERT INTO `system_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '新增操作');
INSERT INTO `system_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '修改操作');
INSERT INTO `system_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '删除操作');
INSERT INTO `system_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '授权操作');
INSERT INTO `system_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '导出操作');
INSERT INTO `system_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '导入操作');
INSERT INTO `system_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '强退操作');
INSERT INTO `system_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '生成操作');
INSERT INTO `system_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '清空操作');
INSERT INTO `system_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '正常状态');
INSERT INTO `system_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '停用状态');
INSERT INTO `system_dict_data` VALUES (30, 0, 'Web', '0', 'auth_app_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-31 14:27:22', 'admin', '2024-08-31 14:27:31', NULL);
INSERT INTO `system_dict_data` VALUES (31, 1, 'App', '1', 'auth_app_type', NULL, 'info', 'N', '0', 'admin', '2024-08-31 14:27:47', '', NULL, NULL);
INSERT INTO `system_dict_data` VALUES (32, 2, '小程序', '2', 'auth_app_type', NULL, 'warning', 'N', '0', 'admin', '2024-08-31 14:28:06', '', NULL, NULL);
INSERT INTO `system_dict_data` VALUES (33, 1, '有效', '1', 'sys_valid', NULL, 'success', 'N', '0', 'admin', '2024-08-31 15:33:49', 'admin', '2024-08-31 15:34:08', NULL);
INSERT INTO `system_dict_data` VALUES (34, 0, '无效', '0', 'sys_valid', NULL, 'danger', 'N', '0', 'admin', '2024-08-31 15:34:21', '', NULL, NULL);
INSERT INTO `system_dict_data` VALUES (35, 0, '非公开', '0', 'auth_public', NULL, 'warning', 'N', '0', 'admin', '2024-08-31 15:36:48', '', NULL, NULL);
INSERT INTO `system_dict_data` VALUES (36, 1, '公开', '1', 'auth_public', NULL, 'success', 'N', '0', 'admin', '2024-08-31 15:36:59', '', NULL, NULL);
INSERT INTO `system_dict_data` VALUES (37, 0, '通知', '0', 'message_category', NULL, 'success', 'N', '0', 'admin', '2024-11-07 14:28:29', 'admin', '2024-11-19 16:55:20', NULL);
INSERT INTO `system_dict_data` VALUES (38, 0, '重要', '0', 'message_level', NULL, 'default', 'N', '0', 'admin', '2024-11-07 14:28:42', '', NULL, NULL);
INSERT INTO `system_dict_data` VALUES (39, 2, '审批', '2', 'message_category', NULL, 'warning', 'N', '0', 'admin', '2024-11-19 14:20:42', 'admin', '2024-11-19 16:55:16', NULL);
INSERT INTO `system_dict_data` VALUES (41, 3, '其他', '3', 'message_category', NULL, 'info', 'N', '0', 'admin', '2024-11-19 14:21:12', 'admin', '2024-11-19 14:21:27', NULL);
INSERT INTO `system_dict_data` VALUES (42, 1, '公告', '1', 'message_category', NULL, 'primary', 'N', '0', 'admin', '2024-11-19 16:54:18', 'admin', '2024-11-19 16:55:05', NULL);

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_type`;
CREATE TABLE `system_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
INSERT INTO `system_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-06 06:12:18', 'admin', '2024-11-26 15:51:04', '用户性别列表');
INSERT INTO `system_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '菜单状态列表');
INSERT INTO `system_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统开关列表');
INSERT INTO `system_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '任务状态列表');
INSERT INTO `system_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '任务分组列表');
INSERT INTO `system_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统是否列表');
INSERT INTO `system_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '通知类型列表');
INSERT INTO `system_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '通知状态列表');
INSERT INTO `system_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '操作类型列表');
INSERT INTO `system_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '登录状态列表');
INSERT INTO `system_dict_type` VALUES (11, '应用类型', 'auth_app_type', '0', 'admin', '2024-08-31 14:27:03', '', NULL, '应用类型列表');
INSERT INTO `system_dict_type` VALUES (12, '是否有效', 'sys_valid', '0', 'admin', '2024-08-31 15:33:08', 'admin', '2024-08-31 15:36:13', '系统有效列表');
INSERT INTO `system_dict_type` VALUES (13, '是否公开', 'auth_public', '0', 'admin', '2024-08-31 15:35:49', 'admin', '2024-08-31 15:36:00', '应用是否公开');
INSERT INTO `system_dict_type` VALUES (14, '消息类型', 'message_category', '0', 'admin', '2024-11-07 14:27:58', '', NULL, NULL);
INSERT INTO `system_dict_type` VALUES (15, '消息等级', 'message_level', '0', 'admin', '2024-11-07 14:28:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE IF EXISTS `system_job`;
CREATE TABLE `system_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_job
-- ----------------------------

-- ----------------------------
-- Table structure for system_job_log
-- ----------------------------
DROP TABLE IF EXISTS `system_job_log`;
CREATE TABLE `system_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `system_logininfor`;
CREATE TABLE `system_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_logininfor
-- ----------------------------
INSERT INTO `system_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 17:17:41');
INSERT INTO `system_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 17:17:45');
INSERT INTO `system_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Mac OS X', '0', '退出成功', '2024-11-26 17:24:21');
INSERT INTO `system_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Mac OS X', '0', '登录成功', '2024-11-26 17:26:18');
INSERT INTO `system_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Mac OS X', '0', '登录成功', '2024-11-27 09:05:11');
INSERT INTO `system_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:06:16');
INSERT INTO `system_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-11-27 09:34:42');
INSERT INTO `system_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-11-27 09:42:35');
INSERT INTO `system_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:53:31');
INSERT INTO `system_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-11-27 13:31:05');
INSERT INTO `system_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 13:57:02');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2090 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, NULL, 'M', '0', '0', '', 'system', 'admin', '2024-05-06 06:12:17', '', NULL, '系统管理目录');
INSERT INTO `system_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, NULL, 'M', '0', '0', '', 'monitor', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:49:38', '系统监控目录');
INSERT INTO `system_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, NULL, 'M', '0', '0', '', 'tool', 'admin', '2024-05-06 06:12:17', '', NULL, '系统工具目录');
INSERT INTO `system_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/system/user/index', '', 1, 0, NULL, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-06 06:12:17', 'admin', '2024-10-14 16:18:24', '用户管理菜单');
INSERT INTO `system_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/system/role/index', '', 1, 0, NULL, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-06 06:12:17', '', NULL, '角色管理菜单');
INSERT INTO `system_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/system/menu/index', '', 1, 0, NULL, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-06 06:12:17', '', NULL, '菜单管理菜单');
INSERT INTO `system_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/system/dept/index', '', 1, 0, NULL, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-06 06:12:17', '', NULL, '部门管理菜单');
INSERT INTO `system_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/system/post/index', '', 1, 0, NULL, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-06 06:12:17', '', NULL, '岗位管理菜单');
INSERT INTO `system_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/system/dict/index', '', 1, 0, NULL, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-06 06:12:17', '', NULL, '字典管理菜单');
INSERT INTO `system_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/system/config/index', '', 1, 0, NULL, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-05-06 06:12:17', '', NULL, '参数设置菜单');
INSERT INTO `system_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/system/notice/index', '', 1, 0, NULL, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-06 06:12:17', '', NULL, '通知公告菜单');
INSERT INTO `system_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, NULL, 'M', '0', '0', '', 'log', 'admin', '2024-05-06 06:12:17', '', NULL, '日志管理菜单');
INSERT INTO `system_menu` VALUES (109, '在线用户', 2, 1, 'online', 'system/monitor/online/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-06 06:12:17', '', NULL, '在线用户菜单');
INSERT INTO `system_menu` VALUES (110, '定时任务', 2, 2, 'job', 'system/monitor/job/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-06 06:12:17', '', NULL, '定时任务菜单');
INSERT INTO `system_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'system/monitor/druid/index', '', 1, 0, NULL, 'C', '1', '1', 'monitor:druid:list', 'druid', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 14:06:21', '数据监控菜单');
INSERT INTO `system_menu` VALUES (112, '服务监控', 2, 4, 'server', 'system/monitor/server/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-06 06:12:17', '', NULL, '服务监控菜单');
INSERT INTO `system_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'system/monitor/cache/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-06 06:12:17', '', NULL, '缓存监控菜单');
INSERT INTO `system_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'system/monitor/cache/list', '', 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-06 06:12:17', '', NULL, '缓存列表菜单');
INSERT INTO `system_menu` VALUES (115, '表单构建', 3, 1, 'build', 'system/tool/build/index', '', 1, 0, NULL, 'C', '1', '1', 'tool:build:list', 'build', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 14:05:59', '表单构建菜单');
INSERT INTO `system_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'system/tool/gen/index', '', 1, 0, NULL, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-06 06:12:17', '', NULL, '代码生成菜单');
INSERT INTO `system_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'system/tool/swagger/index', '', 1, 0, NULL, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-06 06:12:17', '', NULL, '系统接口菜单');
INSERT INTO `system_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/monitor/operlog/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-05-06 06:12:17', '', NULL, '操作日志菜单');
INSERT INTO `system_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/monitor/logininfor/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-05-06 06:12:17', '', NULL, '登录日志菜单');
INSERT INTO `system_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_menu` VALUES (2000, '流程管理', 0, 2, 'flyflow', NULL, NULL, 1, 0, NULL, 'M', '0', '0', '', 'example', 'admin', '2024-05-06 06:17:26', 'admin', '2024-10-22 15:12:05', '');
INSERT INTO `system_menu` VALUES (2001, '流程组', 2002, 1, 'group', 'flyflow/flow/group', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:flow:group', 'button', 'admin', '2024-05-06 08:28:25', 'admin', '2024-05-06 12:03:39', '');
INSERT INTO `system_menu` VALUES (2002, '流程', 2000, 1, 'flow', NULL, NULL, 1, 0, NULL, 'M', '0', '0', '', 'component', 'admin', '2024-05-06 08:29:31', 'admin', '2024-05-06 11:59:48', '');
INSERT INTO `system_menu` VALUES (2003, '流程列表', 2002, 2, 'list', 'flyflow/flow/list', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:flow:list', 'date', 'admin', '2024-05-06 08:34:14', 'admin', '2024-05-06 13:25:03', '');
INSERT INTO `system_menu` VALUES (2004, '创建流程', 2002, 1, 'create', 'flyflow/flow/create', NULL, 1, 1, NULL, 'C', '1', '0', 'flyflow:flow:create', 'component', 'admin', '2024-05-06 12:56:35', '', NULL, '');
INSERT INTO `system_menu` VALUES (2005, '任务管理', 2000, 3, 'task', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'date', 'admin', '2024-05-06 13:29:59', '', NULL, '');
INSERT INTO `system_menu` VALUES (2006, '待办任务', 2005, 1, 'todo', 'flyflow/task/pending', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:pending', 'date', 'admin', '2024-05-06 13:30:36', '', NULL, '');
INSERT INTO `system_menu` VALUES (2007, '我的发起', 2005, 2, 'started', 'flyflow/task/started', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:started', 'button', 'admin', '2024-05-06 13:32:07', '', NULL, '');
INSERT INTO `system_menu` VALUES (2008, '我的已办', 2005, 3, 'completed', 'flyflow/task/completed', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:completed', 'download', 'admin', '2024-05-06 13:33:44', '', NULL, '');
INSERT INTO `system_menu` VALUES (2009, '抄送我的', 2005, 4, 'cc', 'flyflow/task/cc', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:cc', 'example', 'admin', '2024-05-06 13:35:08', 'admin', '2024-05-06 13:35:51', '');
INSERT INTO `system_menu` VALUES (2010, '数字证书', 1, 10, 'ca', NULL, NULL, 1, 0, '', 'M', '0', '0', '', 'password', 'admin', NULL, 'admin', '2024-11-06 15:28:06', '');
INSERT INTO `system_menu` VALUES (2011, '证书管理', 2010, 1, 'cert', 'system/ca/cert/index', NULL, 1, 0, '', 'C', '0', '0', 'ca:cert:list', '#', 'admin', '2024-08-18 01:49:14', '', NULL, '证书管理菜单');
INSERT INTO `system_menu` VALUES (2012, '证书管理查询', 2010, 1, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:query', '#', 'admin', '2024-08-18 01:49:14', '', NULL, '');
INSERT INTO `system_menu` VALUES (2013, '证书管理新增', 2010, 2, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:add', '#', 'admin', '2024-08-18 01:49:14', '', NULL, '');
INSERT INTO `system_menu` VALUES (2014, '证书管理修改', 2010, 3, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:edit', '#', 'admin', '2024-08-18 01:49:15', '', NULL, '');
INSERT INTO `system_menu` VALUES (2015, '证书管理删除', 2010, 4, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:remove', '#', 'admin', '2024-08-18 01:49:15', '', NULL, '');
INSERT INTO `system_menu` VALUES (2016, '证书管理导出', 2010, 5, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:export', '#', 'admin', '2024-08-18 01:49:15', '', NULL, '');
INSERT INTO `system_menu` VALUES (2017, '主体管理', 2010, 0, 'subject', 'system/ca/subject/index', NULL, 1, 0, '', 'C', '0', '0', 'ca:subject:list', '#', 'admin', '2024-08-18 01:49:32', 'admin', '2024-08-18 01:49:49', '主体管理菜单');
INSERT INTO `system_menu` VALUES (2018, '主体管理查询', 2017, 1, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:query', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2019, '主体管理新增', 2017, 2, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:add', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2020, '主体管理修改', 2017, 3, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:edit', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2021, '主体管理删除', 2017, 4, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:remove', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2022, '主体管理导出', 2017, 5, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:export', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2023, '实例演示', 0, 4, 'example', NULL, NULL, 1, 0, '', 'M', '0', '0', NULL, 'code', 'admin', '2024-08-20 22:54:16', '', NULL, '');
INSERT INTO `system_menu` VALUES (2024, 'websocket', 2023, 0, 'websocket', 'example/websocket', NULL, 1, 0, '', 'C', '0', '0', '', '', 'admin', '2024-08-20 22:57:35', 'admin', '2024-08-20 22:58:19', '');
INSERT INTO `system_menu` VALUES (2025, '支付演示', 2023, 1, 'pay', 'example/pay', NULL, 1, 0, 'pay', 'C', '0', '0', NULL, '', 'admin', '2024-08-25 16:33:48', '', NULL, '');
INSERT INTO `system_menu` VALUES (2026, '应用管理', 1, 1, 'client', 'system/auth/client/index', NULL, 1, 0, NULL, 'C', '0', '0', 'auth:client:list', 'github', 'admin', '2024-08-31 14:33:05', 'admin', '2024-11-19 14:23:32', '应用管理菜单');
INSERT INTO `system_menu` VALUES (2027, '应用管理查询', 2026, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:query', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO `system_menu` VALUES (2028, '应用管理新增', 2026, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:add', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO `system_menu` VALUES (2029, '应用管理修改', 2026, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:edit', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO `system_menu` VALUES (2030, '应用管理删除', 2026, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:remove', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO `system_menu` VALUES (2031, '应用管理导出', 2026, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:export', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO `system_menu` VALUES (2050, '示例用户', 2023, 1, 'user1', 'example/user/user/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:user:user:list', '#', 'admin', '2024-10-23 15:47:09', 'admin', '2024-10-24 10:03:37', '示例用户菜单');
INSERT INTO `system_menu` VALUES (2051, '示例用户查询', 2050, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:query', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO `system_menu` VALUES (2052, '示例用户新增', 2050, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:add', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO `system_menu` VALUES (2053, '示例用户修改', 2050, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:edit', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO `system_menu` VALUES (2054, '示例用户删除', 2050, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:remove', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO `system_menu` VALUES (2055, '示例用户导出', 2050, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:export', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO `system_menu` VALUES (2062, '消息', 1, 1, 'message', 'system/message/message/index', NULL, 1, 0, NULL, 'C', '0', '1', 'system:message:message:list', '#', 'admin', '2024-11-01 09:51:29', 'admin', '2024-11-01 09:52:41', '消息菜单');
INSERT INTO `system_menu` VALUES (2063, '消息查询', 2062, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:query', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO `system_menu` VALUES (2064, '消息新增', 2062, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:add', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO `system_menu` VALUES (2065, '消息修改', 2062, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:edit', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO `system_menu` VALUES (2066, '消息删除', 2062, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:remove', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO `system_menu` VALUES (2067, '消息导出', 2062, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:export', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO `system_menu` VALUES (2068, '消息模板', 1, 0, 'messageTemplate', 'system/system/messageTemplate/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:message:messageTemplate:list', 'email', 'admin', '2024-11-01 09:52:03', 'admin', '2024-11-19 14:23:11', '消息模板菜单');
INSERT INTO `system_menu` VALUES (2069, '消息模板查询', 2068, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:query', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO `system_menu` VALUES (2070, '消息模板新增', 2068, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:add', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO `system_menu` VALUES (2071, '消息模板修改', 2068, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:edit', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO `system_menu` VALUES (2072, '消息模板删除', 2068, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:remove', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO `system_menu` VALUES (2073, '消息模板导出', 2068, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:export', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO `system_menu` VALUES (2075, '组件测试', 2023, 8, 'comCeshi', 'example/coms', NULL, 1, 0, 'comCeshi', 'C', '0', '0', NULL, '#', 'admin', '2024-11-07 11:34:00', '', NULL, '');
INSERT INTO `system_menu` VALUES (2076, '单选多选', 2023, 4, 'choose', 'system/tool/choose/index', NULL, 1, 0, '', 'C', '0', '0', '', '#', 'admin', '2024-11-26 10:11:59', 'admin', '2024-11-26 11:50:33', '');
INSERT INTO `system_menu` VALUES (2077, '生产领料记录', 2023, 1, 'proTaskReceive', 'example/taskReceive/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:taskReceive:list', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '生产领料记录菜单');
INSERT INTO `system_menu` VALUES (2078, '生产领料记录查询', 2077, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:query', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2079, '生产领料记录新增', 2077, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:add', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2080, '生产领料记录修改', 2077, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:edit', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2081, '生产领料记录删除', 2077, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:remove', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2082, '生产领料记录导出', 2077, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:export', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO `system_menu` VALUES (2083, '代码生成模版', 2023, 5, 'genTemplate', 'example/gen/index', NULL, 1, 0, NULL, 'C', '0', '0', '', '#', 'admin', '2024-11-26 13:41:33', 'admin', '2024-11-26 15:04:16', '');
INSERT INTO `system_menu` VALUES (2084, '用户类型', 2023, 1, 'userType', 'example/user/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:user:list', '#', 'admin', '2024-11-27 10:03:19', '', NULL, '用户类型菜单');
INSERT INTO `system_menu` VALUES (2085, '用户类型查询', 2084, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:query', '#', 'admin', '2024-11-27 10:03:19', '', NULL, '');
INSERT INTO `system_menu` VALUES (2086, '用户类型新增', 2084, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:add', '#', 'admin', '2024-11-27 10:03:19', '', NULL, '');
INSERT INTO `system_menu` VALUES (2087, '用户类型修改', 2084, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:edit', '#', 'admin', '2024-11-27 10:03:19', '', NULL, '');
INSERT INTO `system_menu` VALUES (2088, '用户类型删除', 2084, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:remove', '#', 'admin', '2024-11-27 10:03:19', '', NULL, '');
INSERT INTO `system_menu` VALUES (2089, '用户类型导出', 2084, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:export', '#', 'admin', '2024-11-27 10:03:19', '', NULL, '');

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO `system_notice` VALUES (1, '温馨提醒：2018-07-01 冰风框架新版本发布啦', '2', 0x3C703EE696B0E78988E69CACE58685E5AEB93C2F703E, '0', 'admin', '2024-05-06 06:12:18', 'admin', '2024-11-26 15:51:37', '管理员');
INSERT INTO `system_notice` VALUES (2, '维护通知：2018-07-01 冰风框架系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-05-06 06:12:18', '', NULL, '管理员');

-- ----------------------------
-- Table structure for system_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `system_oper_log`;
CREATE TABLE `system_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_oper_log
-- ----------------------------
INSERT INTO `system_oper_log` VALUES (1, '操作日志', 9, 'monitor.admin.controller.system.tech.qiantong.qmodel.module.SysOperlogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 15:51:44', 81);
INSERT INTO `system_oper_log` VALUES (2, '登录日志', 9, 'monitor.admin.controller.system.tech.qiantong.qmodel.module.SysLogininforController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 15:51:51', 90);
INSERT INTO `system_oper_log` VALUES (3, '定时任务', 1, 'tech.qiantong.qmodel.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"* * * * * ?\",\"invokeTarget\":\"11\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"1\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-11-26 15:52:08\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'No bean named \'11\' available', '2024-11-26 15:52:08', 13);
INSERT INTO `system_oper_log` VALUES (4, '定时任务', 1, 'tech.qiantong.qmodel.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"* * * * * ?\",\"invokeTarget\":\"22\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"1\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-11-26 15:52:11\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'No bean named \'22\' available', '2024-11-26 15:52:10', 1);
INSERT INTO `system_oper_log` VALUES (5, '调度日志', 9, 'tech.qiantong.qmodel.quartz.controller.SysJobLogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/jobLog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 15:52:16', 75);
INSERT INTO `system_oper_log` VALUES (6, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"message3\",\"className\":\"Message\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":308,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-31 14:25:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2024-11-01 09:50:06\",\"usableColumn\":false},{\"capJavaField\":\"SenderId\",\"columnComment\":\"发送人\",\"columnId\":309,\"columnName\":\"sender_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-31 14:25:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"senderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2024-11-01 09:50:06\",\"usableColumn\":false},{\"capJavaField\":\"ReceiverId\",\"columnComment\":\"接收人\",\"columnId\":310,\"columnName\":\"receiver_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-31 14:25:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"receiverId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2024-11-01 09:50:06\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"消息标题\",\"columnId\":311,\"columnName\":\"title\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-31 14:25:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 15:52:45', 1856);
INSERT INTO `system_oper_log` VALUES (7, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_dept\"}', NULL, 0, NULL, '2024-11-27 09:35:49', 186);
INSERT INTO `system_oper_log` VALUES (8, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 09:57:46', 291);
INSERT INTO `system_oper_log` VALUES (9, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"user_type\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 09:57:53', 1065);
INSERT INTO `system_oper_log` VALUES (10, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"UserType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":426,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类型名称\",\"columnId\":427,\"columnName\":\"name\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ValidFlag\",\"columnComment\":\"是否有效\",\"columnId\":428,\"columnName\":\"valid_flag\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"validFlag\",\"javaType\":\"Boolean\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DelFlag\",\"columnComment\":\"删除标志\",\"columnId\":429,\"columnName\":\"del_flag\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 09:58:40', 1314);
INSERT INTO `system_oper_log` VALUES (11, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"UserType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":426,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 09:58:39\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类型名称\",\"columnId\":427,\"columnName\":\"name\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 09:58:39\",\"usableColumn\":false},{\"capJavaField\":\"ValidFlag\",\"columnComment\":\"是否有效\",\"columnId\":428,\"columnName\":\"valid_flag\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"validFlag\",\"javaType\":\"Boolean\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 09:58:39\",\"usableColumn\":false},{\"capJavaField\":\"DelFlag\",\"columnComment\":\"删除标志\",\"columnId\":429,\"columnName\":\"del_flag\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"incr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 09:58:50', 1254);
INSERT INTO `system_oper_log` VALUES (12, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"userType\",\"className\":\"UserType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":426,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 09:58:49\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类型名称\",\"columnId\":427,\"columnName\":\"name\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 09:58:49\",\"usableColumn\":false},{\"capJavaField\":\"ValidFlag\",\"columnComment\":\"是否有效\",\"columnId\":428,\"columnName\":\"valid_flag\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"validFlag\",\"javaType\":\"Boolean\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 09:58:49\",\"usableColumn\":false},{\"capJavaField\":\"DelFlag\",\"columnComment\":\"删除标志\",\"columnId\":429,\"columnName\":\"del_flag\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 09:57:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 10:00:07', 1124);
INSERT INTO `system_oper_log` VALUES (13, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"user_type\"}', NULL, 0, NULL, '2024-11-27 10:00:10', 419);
INSERT INTO `system_oper_log` VALUES (14, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"ExampleUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":284,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"\",\"createTime\":\"2024-10-23 16:21:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2024-11-26 10:48:44\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":285,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"\",\"createTime\":\"2024-10-23 16:21:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2024-11-26 10:48:44\",\"usableColumn\":false},{\"capJavaField\":\"Age\",\"columnComment\":\"年龄\",\"columnId\":286,\"columnName\":\"age\",\"columnType\":\"int(11)\",\"createBy\":\"\",\"createTime\":\"2024-10-23 16:21:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"age\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2024-11-26 10:48:44\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":287,\"columnName\":\"phone\",\"columnType\":\"varchar(32)\",\"createBy\":\"\",\"createTime\":\"2024-10-23 16:21:16\",\"dictType\":\"sys_yes_no\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 10:05:38', 1582);
INSERT INTO `system_oper_log` VALUES (15, '字典数据', 5, 'system.admin.controller.system.tech.qiantong.qmodel.module.SysDictDataController.export()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"dictType\":\"sys_show_hide\"}', NULL, 0, NULL, '2024-11-27 10:12:07', 792);
INSERT INTO `system_oper_log` VALUES (16, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/28', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 10:19:20', 325);
INSERT INTO `system_oper_log` VALUES (17, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"example_dept\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 10:26:27', 1310);
INSERT INTO `system_oper_log` VALUES (18, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/30', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 10:28:57', 244);
INSERT INTO `system_oper_log` VALUES (19, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"example_dept\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 10:29:02', 1133);
INSERT INTO `system_oper_log` VALUES (20, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dept\",\"className\":\"ExampleDept\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":452,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":31,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父部门id\",\"columnId\":453,\"columnName\":\"parent_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":true,\"tableId\":31,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"Name\",\"columnComment\":\"部门名称\",\"columnId\":454,\"columnName\":\"name\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":31,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Leader\",\"columnComment\":\"负责人\",\"columnId\":455,\"columnName\":\"leader\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 10:30:33', 956);
INSERT INTO `system_oper_log` VALUES (21, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dept\",\"className\":\"ExampleDept\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":452,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":31,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 10:30:33\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父部门id\",\"columnId\":453,\"columnName\":\"parent_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":true,\"tableId\":31,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 10:30:33\",\"usableColumn\":true},{\"capJavaField\":\"Name\",\"columnComment\":\"部门名称\",\"columnId\":454,\"columnName\":\"name\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":31,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 10:30:33\",\"usableColumn\":false},{\"capJavaField\":\"Leader\",\"columnComment\":\"负责人\",\"columnId\":455,\"columnName\":\"leader\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 10:32:37', 1027);
INSERT INTO `system_oper_log` VALUES (22, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"example_dept\"}', NULL, 0, NULL, '2024-11-27 10:32:43', 439);
INSERT INTO `system_oper_log` VALUES (23, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"example_dept\"}', NULL, 0, NULL, '2024-11-27 10:51:30', 192);
INSERT INTO `system_oper_log` VALUES (24, '示例部门', 1, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.add()', 'POST', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:55:32.716\",\"creatorId\":1,\"email\":\"xxxxxxx\",\"leader\":\"张三\",\"name\":\"云桐科技\",\"phone\":\"xxxxxxxx\",\"remark\":\"测试数据\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 10:55:33', 404);
INSERT INTO `system_oper_log` VALUES (25, '示例部门', 1, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.add()', 'POST', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:56:24.591\",\"creatorId\":1,\"email\":\"/\",\"leader\":\"李四\",\"name\":\"郑州总部\",\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 10:56:24', 140);
INSERT INTO `system_oper_log` VALUES (26, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 10:58:48.422\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 10:58:48', 301);
INSERT INTO `system_oper_log` VALUES (27, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dept\",\"className\":\"ExampleDept\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":452,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":31,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 10:32:36\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父部门id\",\"columnId\":453,\"columnName\":\"parent_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":true,\"tableId\":31,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 10:32:36\",\"usableColumn\":true},{\"capJavaField\":\"Name\",\"columnComment\":\"部门名称\",\"columnId\":454,\"columnName\":\"name\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":31,\"updateBy\":\"\",\"updateTime\":\"2024-11-27 10:32:36\",\"usableColumn\":false},{\"capJavaField\":\"Leader\",\"columnComment\":\"负责人\",\"columnId\":455,\"columnName\":\"leader\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-27 10:29:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 11:17:26', 1381);
INSERT INTO `system_oper_log` VALUES (28, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 13:38:44.968\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 13:38:45', 444);
INSERT INTO `system_oper_log` VALUES (29, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 13:40:15.998\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 13:40:16', 190);
INSERT INTO `system_oper_log` VALUES (30, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 13:40:56.874\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 13:41:12', 35355);
INSERT INTO `system_oper_log` VALUES (31, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 13:42:31.851\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 13:42:32', 5388);
INSERT INTO `system_oper_log` VALUES (32, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 13:42:45.282\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 13:42:45', 173);
INSERT INTO `system_oper_log` VALUES (33, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 13:43:12.329\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 13:44:31', 79152);
INSERT INTO `system_oper_log` VALUES (34, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 13:44:34.734\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 13:44:39', 4972);
INSERT INTO `system_oper_log` VALUES (35, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 13:45:26.986\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 13:45:32', 5157);
INSERT INTO `system_oper_log` VALUES (36, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"/\",\"id\":2,\"leader\":\"李四\",\"name\":\"郑州总部\",\"parentId\":1,\"phone\":\"/\",\"remark\":\"总部测试\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 15:11:10.494\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 15:11:11', 500);
INSERT INTO `system_oper_log` VALUES (37, '示例部门', 1, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.add()', 'POST', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 15:11:39.507\",\"creatorId\":1,\"leader\":\"君山\",\"name\":\"老君山\",\"parentId\":1,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 15:11:39', 238);
INSERT INTO `system_oper_log` VALUES (38, '示例部门', 2, 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-27 00:00:00\",\"creatorId\":1,\"delFlag\":false,\"email\":\"xxxxxxx\",\"id\":1,\"leader\":\"张三\",\"name\":\"云桐科技\",\"parentId\":0,\"phone\":\"xxxxxxxx\",\"remark\":\"测试数据\",\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-27 16:43:05.107\",\"updatorId\":1,\"validFlag\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2024-11-27 16:43:05', 294);

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_post
-- ----------------------------
INSERT INTO `system_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO `system_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:50:39', '');
INSERT INTO `system_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-06 06:12:17', '', NULL, '');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL, '超级管理员');
INSERT INTO `system_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:49:20', '普通角色');

-- ----------------------------
-- Table structure for system_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_role_dept`;
CREATE TABLE `system_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role_dept
-- ----------------------------
INSERT INTO `system_role_dept` VALUES (2, 100);
INSERT INTO `system_role_dept` VALUES (2, 101);
INSERT INTO `system_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

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

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, 103, 'admin', 'admin', '00', 'bf@163.com', '19951942682', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-11-27 13:57:02', 'admin', '2024-05-06 06:12:17', '', '2024-11-27 13:57:02', '管理员');
INSERT INTO `system_user` VALUES (2, 105, 'bf2', '冰风2', '00', 'bf1@qq.com', '15666666666', '0', NULL, '$2a$10$J7Ymz2DNLfGXnmKHm9RYnOHBTexve38Owo.Tg/D2XbTwAoc0X1f66', '0', '0', '127.0.0.1', '2024-10-30 16:49:04', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:48:49', '测试员');
INSERT INTO `system_user` VALUES (3, 105, 'bf3', '冰风3', '00', 'bf2@qq.com', '15666666667', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-06 06:12:17', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-12 23:30:18', '测试员');
INSERT INTO `system_user` VALUES (4, 105, 'bf4', '冰风4', '00', 'bf3@qq.com', '15666666668', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-06 06:12:17', 'admin', '2024-05-06 06:12:17', '', NULL, '测试员');

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS `system_user_post`;
CREATE TABLE `system_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
INSERT INTO `system_user_post` VALUES (1, 1);
INSERT INTO `system_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (1, 1);
INSERT INTO `system_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型名称',
  `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES (1, '1', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (2, '2', 1, 0, '若依1', 1, '2024-10-23 15:54:13', NULL, NULL, '2024-10-23 15:54:13', NULL);
INSERT INTO `user_type` VALUES (5, '5', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (6, '6', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (7, '7', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (8, '8', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (9, '9', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (10, '10', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (11, '11', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (12, '12', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (13, '13', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (14, '14', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (15, '15', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (16, '16', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (17, '17', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (18, '18', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (19, '19', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (20, '20', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (21, '21', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (22, '22', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (23, '23', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (24, '24', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (25, '25', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (26, '26', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (27, '27', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (28, '28', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (29, '29', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (30, '30', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (31, '31', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (32, '32', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (33, '33', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (34, '34', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (35, '35', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (36, '36', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (37, '375', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 16:15:25', NULL);
INSERT INTO `user_type` VALUES (38, '38', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (39, '39', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (40, '40', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (41, '41', 1, 1, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (42, '42', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (43, '43', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (44, '44', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (45, '45', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (46, '46', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (47, '47', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (48, '48', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (49, '49', 1, 0, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (50, '50333', 1, 1, '若依1', 1, '2024-10-23 00:00:00', 'admin', 1, '2024-11-20 18:20:23', NULL);
INSERT INTO `user_type` VALUES (51, '513', 1, 1, '若依1', 1, '2024-10-23 00:00:00', 'admin', 1, '2024-11-20 16:43:08', NULL);
INSERT INTO `user_type` VALUES (52, '52', 1, 1, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (53, '53', 1, 1, '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO `user_type` VALUES (54, '2', 1, 1, 'admin', 1, '2024-11-20 00:00:00', 'admin', 1, '2024-11-20 18:36:13', '122112');
INSERT INTO `user_type` VALUES (55, '222', 1, 0, 'admin', 1, '2024-11-20 00:00:00', 'admin', 1, '2024-11-20 18:36:09', '212121');
INSERT INTO `user_type` VALUES (56, '2123332222', 1, 0, 'admin', 1, '2024-11-20 00:00:00', 'admin', 1, '2024-11-20 18:35:45', NULL);
INSERT INTO `user_type` VALUES (57, '243423332', 1, 0, 'admin', 1, '2024-11-20 00:00:00', 'admin', 1, '2024-11-20 18:35:40', NULL);

SET FOREIGN_KEY_CHECKS = 1;
