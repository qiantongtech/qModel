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
-- Table structure for auth_client
-- ----------------------------
DROP TABLE IF EXISTS `auth_client`;
CREATE TABLE `auth_client` (
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
CREATE TABLE `auth_client_user` (
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
CREATE TABLE `ca_cert` (
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
CREATE TABLE `ca_subject` (
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
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
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
INSERT INTO `message` VALUES (46, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:00:24', '小桐', '2025-12-30 14:00:24', 1, NULL);
INSERT INTO `message` VALUES (47, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:01:37', '小桐', '2025-12-30 14:01:37', 1, NULL);
INSERT INTO `message` VALUES (48, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:01:41', '小桐', '2025-12-30 14:01:41', 1, NULL);

-- ----------------------------
-- Table structure for message_template
-- ----------------------------
DROP TABLE IF EXISTS `message_template`;
CREATE TABLE `message_template` (
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
-- Table structure for model_cacl
-- ----------------------------
DROP TABLE IF EXISTS `model_cacl`;
CREATE TABLE `model_cacl` (
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
CREATE TABLE `model_cacl_reconstitution` (
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
CREATE TABLE `model_classify` (
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
CREATE TABLE `model_compute` (
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
-- Table structure for model_history
-- ----------------------------
DROP TABLE IF EXISTS `model_history`;
CREATE TABLE `model_history` (
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
CREATE TABLE `model_input` (
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
CREATE TABLE `model_interface_address` (
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
CREATE TABLE `model_operate` (
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
CREATE TABLE `model_output` (
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
CREATE TABLE `model_reconstitution` (
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


DROP TABLE IF EXISTS `model_calc`;
CREATE TABLE `model_calc` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` BIGINT COMMENT '租户/公司ID',
  `code` VARCHAR(32) COMMENT '计算编码',
  `name` VARCHAR(32) COMMENT '任务名称',
  `classify_id` BIGINT COMMENT '模型分类ID',
  `classify_name` VARCHAR(32) COMMENT '模型分类名称',
  `model_id` BIGINT NOT NULL COMMENT '关联模型ID',
  `model_name` VARCHAR(32) COMMENT '模型名称',
  `model_version` VARCHAR(32) COMMENT '模型版本号',
  `model_version_id` BIGINT COMMENT '模型版本ID',
  `description` TEXT COMMENT '描述',
  `input_params` TEXT COMMENT '输入参数(JSON格式)',
  `output_result` TEXT COMMENT '输出结果(JSON格式)',
  `start_time` DATETIME COMMENT '开始时间',
  `end_time` DATETIME COMMENT '结束时间',
  `duration` INT COMMENT '耗时(毫秒)',
  `status` TINYINT UNSIGNED COMMENT '计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中',
  `timeout_seconds` INT COMMENT '超时时间(秒)',
  `retry_count` INT COMMENT '已重试次数',
  `max_retry_count` INT COMMENT '最大重试次数',
  `priority` TINYINT UNSIGNED COMMENT '优先级:1-高,2-中,3-低',
  `error_message` TEXT COMMENT '错误信息',
  `resource_id` BIGINT COMMENT '文件或接口资源ID',
  `calc_type` TINYINT UNSIGNED COMMENT '接入方式: 0-API接口, 1-Python本地',
  `valid_flag` TINYINT NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` VARCHAR(32) COMMENT '创建人',
  `creator_id` BIGINT COMMENT '创建人id',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` VARCHAR(32) COMMENT '更新人',
  `updator_id` BIGINT COMMENT '更新人id',
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` VARCHAR(512) COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模型计算任务';


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
CREATE TABLE `model_version` (
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
CREATE TABLE `qrtz_blob_triggers` (
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
CREATE TABLE `qrtz_calendars` (
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
CREATE TABLE `qrtz_cron_triggers` (
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
CREATE TABLE `qrtz_fired_triggers` (
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
CREATE TABLE `qrtz_job_details` (
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
CREATE TABLE `qrtz_locks` (
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
CREATE TABLE `qrtz_paused_trigger_grps` (
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
CREATE TABLE `qrtz_scheduler_state` (
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
CREATE TABLE `qrtz_simple_triggers` (
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
CREATE TABLE `qrtz_simprop_triggers` (
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
CREATE TABLE `qrtz_triggers` (
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
CREATE TABLE `rel_user_auth_product` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统一身份认证id',
  `auth_product_type` int(11) NOT NULL COMMENT '认证平台类型;0：冰凤框架；1：微信；2：支付宝',
  PRIMARY KEY (`user_id`, `auth_id`, `auth_product_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与认证中心关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rel_user_auth_product
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
