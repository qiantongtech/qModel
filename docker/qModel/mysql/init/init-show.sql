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

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;


CREATE
DATABASE IF NOT EXISTS qmodel_demo
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
USE
qmodel_demo;

-- ----------------------------
-- Table structure for auth_client
-- ----------------------------
DROP TABLE IF EXISTS `auth_client`;
CREATE TABLE `auth_client`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT '应用ID',
    `secret_key`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '应用秘钥',
    `name`         varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '应用名称',
    `type`         int(11) NOT NULL COMMENT '应用类型;0：Web，1：App，2：小程序',
    `icon`         varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用图标',
    `home_url`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用首页',
    `sync_url`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '同步地址',
    `redirect_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '允许授权的url',
    `public_flag`  tinyint(4) NOT NULL COMMENT '是否公开',
    `valid_flag`   tinyint(4) NOT NULL COMMENT '是否有效;0：无效，1：有效',
    `del_flag`     tinyint(4) NOT NULL COMMENT '删除标志;1：已删除，0：未删除',
    `create_by`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`   bigint(20) NULL DEFAULT NULL COMMENT '创建人id;创建者的sys_user_id',
    `create_time`  datetime                                                       NOT NULL COMMENT '创建时间',
    `update_by`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人id;更新者的sys_user_id',
    `update_time`  datetime                                                       NOT NULL COMMENT '更新时间',
    `remark`       varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_client
-- ----------------------------

-- ----------------------------
-- Table structure for auth_client_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_client_user`;
CREATE TABLE `auth_client_user`
(
    `client_id` bigint(20) NOT NULL COMMENT '应用ID',
    `user_id`   bigint(20) NOT NULL COMMENT '用户ID',
    `open_id`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'open_id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用和用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_client_user
-- ----------------------------

-- ----------------------------
-- Table structure for ca_cert
-- ----------------------------
DROP TABLE IF EXISTS `ca_cert`;
CREATE TABLE `ca_cert`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID;ID',
    `name`         varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '证书名称',
    `subject_id`   int(11) NOT NULL COMMENT '主体id',
    `subject_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '主体名称',
    `certificate`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证书;证书',
    `private_key`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '私钥;私钥',
    `issuer`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '颁发者',
    `possessor`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所有者',
    `valid_time`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '有效期',
    `valid_flag`   int(11) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
    `del_flag`     int(11) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
    `create_by`    varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`   int(11) NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注;备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '证书管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_cert
-- ----------------------------
INSERT INTO `ca_cert`
VALUES (9, '冰凤框架Nginx证书', 9, '江苏千桐科技有限公司', '/profile/ca/2024/10/23/6718d6e3a921cf6536292244.cer',
        '/profile/ca/2024/10/23/6718d6e3a921cf6536292245.pem', '江苏千桐科技有限公司', '192.168.0.1', '30', 1, 0,
        'admin', 1, '2024-10-23 18:58:44', NULL, NULL, NULL);
INSERT INTO `ca_cert`
VALUES (10, '测试', 9, '江苏千桐科技有限公司', '/profile/ca/2024/12/09/6756acfbe2f804e7283bef9d.cer',
        '/profile/ca/2024/12/09/6756acfbe2f804e7283bef9e.pem', '江苏千桐科技有限公司', '1000', '3', 1, 0, 'admin', 1,
        '2024-12-09 16:40:27', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ca_subject
-- ----------------------------
DROP TABLE IF EXISTS `ca_subject`;
CREATE TABLE `ca_subject`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID;主体ID',
    `name`        varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '主体名称;主体名称',
    `cn`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通用名称;通用名称',
    `ou`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织部门;组织单位名称',
    `o`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织名称',
    `l`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市名称',
    `st`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省名称',
    `c`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '国家',
    `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证书;证书',
    `private_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '私钥;私钥',
    `valid_flag`  int(11) NOT NULL DEFAULT 1 COMMENT '是否有效;是否有效 0：无效，1：有效',
    `del_flag`    int(11) NOT NULL DEFAULT 0 COMMENT '删除标志;删除标志 1：已删除，0：未删除',
    `create_by`   varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人;创建人',
    `creator_id`  int(11) NULL DEFAULT NULL COMMENT '创建人id;创建人id',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间;创建时间',
    `update_by`   varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人;更新人',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间;更新时间',
    `remark`      varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注;备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '主体管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_subject
-- ----------------------------
INSERT INTO `ca_subject`
VALUES (9, '江苏千桐科技有限公司', '江苏千桐科技有限公司', '技术部', '技术部', '南京', '江苏', '中国',
        '/profile/ca/2024/10/23/6718d658a921cf6536292242.cer', '/profile/ca/2024/10/23/6718d658a921cf6536292243.pem', 1,
        0, 'admin', 1, '2024-10-23 18:56:25', NULL, NULL, NULL);
INSERT INTO `ca_subject`
VALUES (10, '12', '12', '12', '12', '12', '12', '12', '/profile/ca/2024/12/09/6756abdbe2f804e7283bef9b.cer',
        '/profile/ca/2024/12/09/6756abdbe2f804e7283bef9c.pem', 1, 0, 'admin', 1, '2024-12-09 16:35:39', NULL, NULL,
        NULL);


-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `sender_id`      bigint(20) NULL DEFAULT NULL COMMENT '发送人',
    `receiver_id`    bigint(20) NULL DEFAULT NULL COMMENT '接收人',
    `title`          varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '消息标题',
    `content`        varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息模板内容',
    `category`       int(11) NOT NULL COMMENT '消息类别',
    `msg_level`      int(11) NOT NULL COMMENT '消息等级',
    `module`         int(11) NOT NULL COMMENT '消息模块',
    `entity_type`    int(11) NULL DEFAULT NULL COMMENT '实体类型',
    `entity_id`      bigint(20) NULL DEFAULT NULL COMMENT '实体id',
    `entity_url`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息链接',
    `has_read`       tinyint(4) NULL DEFAULT NULL COMMENT '是否已读',
    `has_retraction` tinyint(4) NULL DEFAULT NULL COMMENT '是否撤回',
    `valid_flag`     tinyint(4) NOT NULL COMMENT '是否有效;0：无效，1：有效',
    `del_flag`       tinyint(4) NOT NULL COMMENT '删除标志;1：已删除，0：未删除',
    `create_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`     bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`    datetime                                                       NOT NULL COMMENT '创建时间',
    `update_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`    datetime                                                       NOT NULL COMMENT '更新时间',
    `updator_id`     bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message`
VALUES (46, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:00:24',
        '小桐', '2025-12-30 14:00:24', 1, NULL);
INSERT INTO `message`
VALUES (47, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:01:37',
        '小桐', '2025-12-30 14:01:37', 1, NULL);
INSERT INTO `message`
VALUES (48, NULL, NULL, '测试', '测试内容', 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, '小桐', 1, '2025-12-30 14:01:41',
        '小桐', '2025-12-30 14:01:41', 1, NULL);

-- ----------------------------
-- Table structure for message_template
-- ----------------------------
DROP TABLE IF EXISTS `message_template`;
CREATE TABLE `message_template`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `title`       varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '消息标题',
    `content`     varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息模板内容',
    `category`    int(11) NOT NULL COMMENT '消息类别',
    `msg_level`   int(11) NOT NULL DEFAULT 0 COMMENT '消息等级',
    `valid_flag`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
    `del_flag`    tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`  bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
    `create_time` datetime                                                       NOT NULL COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`  bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
    `update_time` datetime                                                       NOT NULL COMMENT '更新时间',
    `remark`      varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message_template
-- ----------------------------
INSERT INTO `message_template`
VALUES (1, '测试模版', '${test}测试模版', 0, 0, 1, 1, NULL, 1, '2024-11-01 10:35:16', 'admin', 1, '2025-12-30 10:45:41',
        NULL);
INSERT INTO `message_template`
VALUES (2, '测试', '2', 0, 0, 1, 1, 'admin', 1, '2024-11-20 11:12:52', 'admin', 1, '2025-12-30 10:45:38', NULL);

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `company_id`  bigint NULL DEFAULT NULL COMMENT '企业ID',
    `classify_id` bigint NULL DEFAULT NULL COMMENT '分类id',
    `name`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
    `code`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
    `access_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接入方式;API-API接口, PYTHON-Python本地',
    `version`     varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '版本号',
    `author`      varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
    `status`      tinyint UNSIGNED NULL DEFAULT 1 COMMENT '状态;0-停用, 1-启用，2-构建部署中，3-构建失败',
    `tags`        varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签',
    `icon`        varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
    `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
    `valid_flag`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
    `del_flag`    tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`  bigint NULL DEFAULT NULL COMMENT '创建人id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`  bigint NULL DEFAULT NULL COMMENT '更新人id',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型基础信息表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model`
VALUES (1, NULL, 1, '工业大模型-动态 Token', 'INDUSTRY_MODEL_TEST', 'API', 'V1.0', '吴同', 7, '[{\"name\":\"工业\"}]',
        '/2026/05/11/6a01a8f6e4b0d389f4f52e8f.png', '工业大模型接口', 1, 0, '吴同', NULL, '2026-07-10 14:14:51', '吴同',
        1, '2026-07-16 15:23:15', '测试数据');
INSERT INTO `model`
VALUES (2, NULL, 8, '线性回归算法', 'LINEAR_REGRESSION', 'API', 'V2.0', '吴同', 7,
        '[{\"name\":\"NLP\"},{\"name\":\"分类\"}]', '/2026/05/11/6a01aa17e4b0d389f4f52e95.png',
        '文本分类API，使用固定Bearer Token', 1, 0, '吴同', 2, '2026-07-10 10:00:00', '吴同', 1, '2026-07-10 11:48:06',
        '固定Token示例');
INSERT INTO `model`
VALUES (3, NULL, 9, '支持向量机算法', 'SVM', 'API', 'V1.5', '吴同', 7, '[{\"name\":\"对话\"},{\"name\":\"生成\"}]',
        '/2026/05/11/6a01aa0ae4b0d389f4f52e94.png', '模拟OpenAI Chat Completion接口', 1, 0, '吴同', 3,
        '2026-07-10 09:00:00', '吴同', 1, '2026-07-10 11:58:14', 'APIKey固定鉴权示例');
INSERT INTO `model`
VALUES (4, NULL, 9, '逻辑回归算法', 'LOGISTIC_REGRESSION', 'API', 'V1.0', '吴同', 7,
        '[{\"name\":\"视觉\"},{\"name\":\"图像识别\"}]', '/2026/05/11/6a01a9f9e4b0d389f4f52e93.png',
        '内网图片分类识别服务，无需鉴权', 1, 0, '吴同', 4, '2026-07-10 08:00:00', '吴同', 1, '2026-07-10 13:33:41',
        '无鉴权示例');
INSERT INTO `model`
VALUES (5, NULL, 10, '随机森林算法', 'RANDOM_FOREST', 'API', 'V2.3', '吴同', 7,
        '[{\"name\":\"问答\"},{\"name\":\"RAG\"}]', '/2026/05/11/6a01a9e9e4b0d389f4f52e92.png',
        '基于知识库的企业问答接口', 1, 0, '吴同', 5, '2026-07-10 07:30:00', '吴同', 1, '2026-07-10 11:48:15',
        '动态Token-GET方式示例');
INSERT INTO `model`
VALUES (6, NULL, 11, '降维算法', 'DIMENSIONALITY_REDUCTION', 'PYTHON', 'V1.2', '吴同', 2,
        '[{\"name\":\"运维\"},{\"name\":\"流水线\"}]', '/2026/05/11/6a01a9d8e4b0d389f4f52e91.png',
        '数据流水线状态管理接口', 1, 0, '吴同', 6, '2026-07-10 06:00:00', '吴同', 1, '2026-07-10 11:48:13',
        'PUT请求+Query注入示例');
INSERT INTO `model`
VALUES (7, NULL, 10, '梯度增强算法', 'GRADIENT_BOOSTING', 'PYTHON', 'V3.0', '吴同', 3,
        '[{\"name\":\"生成\"},{\"name\":\"多模态\"}]', '/2026/05/11/6a01a9a0e4b0d389f4f52e90.png',
        '支持文本/图像/音频生成的多模态模型', 1, 0, '吴同', 7, '2026-07-10 05:00:00', '吴同', 1, '2026-07-10 11:48:12',
        '复杂动态Token示例-组合认证');
INSERT INTO `model`
VALUES (8, NULL, 1, '工业大模型-固定 Token', 'INDUSTRY_MODEL_TEST', 'API', 'v1.0', '吴同', 5, '[{\"name\":\"工业\"}]',
        '/2026/05/11/6a01a9a0e4b0d389f4f52e99.png', NULL, 1, 0, '吴同', 1, '2026-07-10 11:55:55', '吴同', 1,
        '2026-07-10 16:20:19', NULL);
INSERT INTO `model`
VALUES (9, NULL, 17, 'qKnow_周报模板测试', 'QKNOW_WEEKLYREPORT', 'API', 'V1.0', '吴同', 7,
        '[{\"name\":\"周报\"},{\"name\":\"测试\"}]', '/2026/05/11/6a01a9a0e4b0d389f4f52f99.png',
        '获取 qKnow 系统中的周报模板测试数据', 1, 0, '吴同', 1, '2026-07-16 14:25:22', 'qModel', 1,
        '2026-07-16 15:58:40', NULL);
INSERT INTO `model`
VALUES (10, NULL, 2, '水位流量插值算法', 'WQIA', 'PYTHON', 'V1.0', '吴同', 5,
        '[{\"name\":\"水位流量\"},{\"name\":\"预测\"}]', '/2026/05/11/6a01a9a0e4b0d389f4f5ff99.png', NULL, 1, 0, '吴同',
        1, '2026-07-16 15:09:06', 'system', 1, '2026-07-17 09:24:46', NULL);
INSERT INTO `model` VALUES (11, NULL, 1, '水量预测模型', 'WATER_VOLUME_MODEL', 'API', 'V1.0', '吴同', 3, '[{\"name\":\"预测\"},{\"name\":\"水量\"}]', '/2026/08/05/6a72b353ee5a274b8e519c08.png', NULL, 1, 0, '超级管理员', 1, '2026-08-05 11:20:28', '超级管理员', 1, '2026-08-05 11:51:50', NULL);

-- ----------------------------
-- Table structure for model_config
-- ----------------------------
DROP TABLE IF EXISTS `model_config`;
CREATE TABLE `model_config`  (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                                 `company_id` bigint NULL DEFAULT NULL COMMENT '企业ID',
                                 `model_id` bigint NULL DEFAULT NULL COMMENT '关联模型ID',
                                 `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型版本',
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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型配置详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_config
-- ----------------------------
INSERT INTO `model_config` VALUES (1, NULL, 1, 'V1.0', 'http://api.example.com/blade-vstec/call/log/call/model', 'POST', 'application/x-www-form-urlencoded', 30, 'DYNAMIC', 'apiKey', 'Header', 'Blade-Auth', 'bearer', NULL, 'POST', 'http://api.example.com/blade-auth/oauth/token', '{\n  \"Content-Type\": \"application/x-www-form-urlencoded\",\n  \"Tenant-Id\": \"595\",\n  \"Authorization\": \"Basic c3dvcmQ6c3dvcmRfc2VjcmV0\"\n}', NULL, '{\n  \"grant_type\": \"password\",\n  \"username\": \"admin\",\n  \"password\": \"21232f297a57a5a743894a0e4a801fc3\",\n  \"scope\": \"all\"\n}', 'access_token', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"modelId\": {\n      \"type\": \"integer\",\n      \"description\": \"模型ID\"\n    },\n    \"files\": {\n      \"type\": \"string\",\n      \"format\": \"binary\",\n      \"description\": \"上传的文件\"\n    }\n  },\n  \"required\": [\n    \"modelId\",\n    \"files\"\n  ]\n}', NULL, 1, 0, '小桐', 1, '2026-07-09 15:06:46', 'qModel', 1, '2026-07-14 10:07:30', '测试数据');
INSERT INTO `model_config` VALUES (2, NULL, 2, 'V2.0', 'https://api.example.com/v1/predict', 'POST', 'application/json', 60, 'FIXED', 'apiKey', 'Header', 'Authorization', 'Bearer', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"text\": {\n      \"type\": \"string\",\n      \"description\": \"待分析文本\"\n    },\n    \"top_k\": {\n      \"type\": \"integer\",\n      \"default\": 5\n    }\n  },\n  \"required\": [\"text\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"result\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\n      }\n    }\n  }\n}', 1, 0, '张三', 2, '2026-07-10 10:00:00', '小桐', 1, '2026-07-10 11:48:06', '固定Token示例');
INSERT INTO `model_config` VALUES (3, NULL, 3, 'V1.5', 'https://api.openai.com/v1/chat/completions', 'POST', 'application/json', 120, 'FIXED', 'apiKey', 'Header', 'X-API-Key', NULL, 'sk-proj-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"messages\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"object\",\n        \"properties\": {\n          \"role\": {\"type\": \"string\"},\n          \"content\": {\"type\": \"string\"}\n        }\n      }\n    },\n    \"temperature\": {\n      \"type\": \"number\",\n      \"default\": 0.7\n    }\n  },\n  \"required\": [\"messages\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"choices\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"object\",\n        \"properties\": {\n          \"message\": {\n            \"type\": \"object\",\n            \"properties\": {\n              \"content\": {\"type\": \"string\"}\n            }\n          }\n        }\n      }\n    }\n  }\n}', 1, 0, '王五', 3, '2026-07-10 09:00:00', '小桐', 1, '2026-07-10 11:49:14', 'APIKey固定鉴权示例');
INSERT INTO `model_config` VALUES (4, NULL, 4, 'V1.0', 'http://api.example.com/image/recognize', 'POST', 'multipart/form-data', 45, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"image\": {\n      \"type\": \"string\",\n      \"format\": \"binary\",\n      \"description\": \"待识别的图片文件\"\n    },\n    \"top_n\": {\n      \"type\": \"integer\",\n      \"default\": 3\n    }\n  },\n  \"required\": [\"image\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"labels\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"object\",\n        \"properties\": {\n          \"name\": {\"type\": \"string\"},\n          \"confidence\": {\"type\": \"number\"}\n        }\n      }\n    }\n  }\n}', 1, 0, '孙七', 4, '2026-07-10 08:00:00', '小桐', 1, '2026-07-10 13:33:41', '无鉴权示例');
INSERT INTO `model_config` VALUES (5, NULL, 5, 'V2.3', 'https://api.enterprise.com/v1/qa', 'POST', 'application/json', 30, 'DYNAMIC', 'bearer', 'Header', 'Authorization', 'Bearer', NULL, 'GET', 'https://auth.enterprise.com/oauth/token', '{\n  \"Accept\": \"application/json\"\n}', NULL, '{\n  \"grant_type\": \"client_credentials\",\n  \"client_id\": \"svc_qa_bot\",\n  \"client_secret\": \"abc123def456ghi789\"\n}', 'access_token', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"question\": {\n      \"type\": \"string\",\n      \"description\": \"用户问题\"\n    },\n    \"context\": {\n      \"type\": \"string\",\n      \"description\": \"上下文信息\"\n    }\n  },\n  \"required\": [\"question\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"answer\": {\n      \"type\": \"string\"\n    },\n    \"confidence\": {\n      \"type\": \"number\"\n    }\n  }\n}', 1, 0, '周九', 5, '2026-07-10 07:30:00', '周九', 5, '2026-07-10 07:30:00', 'QA问答-动态Token-GET方式获取');
INSERT INTO `model_config` VALUES (6, NULL, 6, 'V1.2', 'https://api.pipeline.com/v1/pipeline/update', 'PUT', 'application/json', 90, 'FIXED', 'apiKey', 'Query', 'api_key', NULL, 'pipe_live_9876543210abcdef', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"pipeline_id\": {\n      \"type\": \"string\",\n      \"description\": \"流水线ID\"\n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"enum\": [\"running\", \"paused\", \"stopped\"]\n    }\n  },\n  \"required\": [\"pipeline_id\", \"status\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"success\": {\n      \"type\": \"boolean\"\n    },\n    \"message\": {\n      \"type\": \"string\"\n    }\n  }\n}', 1, 0, '郑十一', 6, '2026-07-10 06:00:00', '郑十一', 6, '2026-07-10 06:00:00', '流水线状态更新-APIKey注入Query');
INSERT INTO `model_config` VALUES (7, NULL, 7, 'V3.0', 'https://api.multimodal.com/v1/generate', 'POST', 'application/json', 180, 'DYNAMIC', 'apiKey', 'Header', 'X-Auth-Token', 'Token', NULL, 'POST', 'https://auth.multimodal.com/v1/get_token', '{\n  \"Content-Type\": \"application/json\",\n  \"X-Client-Version\": \"1.0.0\"\n}', '{\n  \"app_id\": \"multimodal_app_001\",\n  \"app_secret\": \"sec_9876543210fedcba\"\n}', '{\n  \"grant_type\": \"password\",\n  \"username\": \"service_user\",\n  \"password\": \"srv_pass_2026!\"\n}', 'data.token', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"prompt\": {\n      \"type\": \"string\",\n      \"description\": \"生成提示词\"\n    },\n    \"modality\": {\n      \"type\": \"string\",\n      \"enum\": [\"text\", \"image\", \"audio\"],\n      \"description\": \"生成模态\"\n    },\n    \"size\": {\n      \"type\": \"string\",\n      \"default\": \"1024x1024\"\n    }\n  },\n  \"required\": [\"prompt\", \"modality\"]\n}', '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"output\": {\n      \"type\": \"string\",\n      \"description\": \"生成的输出（文本或图片URL）\"\n    },\n    \"model_version\": {\n      \"type\": \"string\"\n    }\n  }\n}', 1, 0, '陈十三', 7, '2026-07-10 05:00:00', '陈十三', 7, '2026-07-10 05:00:00', '多模态生成-复杂动态Token');
INSERT INTO `model_config` VALUES (8, NULL, 8, 'v1.0', 'http://api.example.com/blade-vstec/call/log/call/model', 'POST', 'application/x-www-form-urlencoded', 30, 'FIXED', 'bearer', 'Header', NULL, NULL, 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5hbnRfaWQiOiI1OTUxNTIiLCJ1c2VySW5mbyI6eyJwYXNzd29yZCI6bnVsbCwidXNlcm5hbWUiOiJsY3Rlc3RlciIsImF1dGhvcml0aWVzIj', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"properties\": {\n    \"modelId\": {\n      \"type\": \"integer\",\n      \"description\": \"模型ID\"\n    },\n    \"files\": {\n      \"type\": \"string\",\n      \"format\": \"binary\",\n      \"description\": \"上传的文件\"\n    }\n  },\n  \"required\": [\n    \"modelId\",\n    \"files\"\n  ]\n}', NULL, 1, 0, '小桐', 1, '2026-07-10 11:55:55', '小桐', 1, '2026-07-10 11:57:55', NULL);
INSERT INTO `model_config` VALUES (9, NULL, 9, 'v1.0', 'http://env.qiantong.tech:51899/prod-api/api/app/weeklyReportTestData', 'GET', 'application/json', 30, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"title\": \"搜索请求参数\",\n  \"description\": \"通用搜索入参结构\",\n  \"properties\": {\n    \"query\": {\n      \"type\": \"string\",\n      \"description\": \"搜索关键词、查询语句\",\n      \"minLength\": 0,\n      \"maxLength\": 500\n    }\n  }\n}', NULL, 1, 0, 'qModel', 1, '2026-07-16 14:25:22', 'qModel', 1, '2026-07-16 14:25:33', NULL);
INSERT INTO `model_config` VALUES (10, NULL, 11, 'v1.0', 'http://demo.qmodel.tech/prod-api/model/mock/waterPredict', 'GET', 'application/json', 30, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \"type\": \"object\",\n  \"title\": \"搜索请求参数\",\n  \"description\": \"通用搜索入参结构\",\n  \"properties\": {\n    \"query\": {\n      \"type\": \"string\",\n      \"description\": \"搜索关键词、查询语句\",\n      \"minLength\": 0,\n      \"maxLength\": 500\n    }\n  }\n}', NULL, 1, 0, '超级管理员', 1, '2026-08-05 11:20:28', '超级管理员', 1, '2026-08-05 11:51:50', NULL);

-- ----------------------------
-- Table structure for model_calc_widget
-- ----------------------------
DROP TABLE IF EXISTS `model_calc_widget`;
CREATE TABLE `model_calc_widget`  (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                      `company_id` bigint NULL DEFAULT NULL COMMENT '租户/公司ID',
                                      `calc_id` bigint NOT NULL COMMENT '计算任务ID，关联 model_calc.id',
                                      `model_id` bigint NULL DEFAULT NULL COMMENT '关联模型ID，冗余字段',
                                      `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件类型：base64、line、bar、pie 等',
                                      `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件显示标题',
                                      `sort` int NOT NULL DEFAULT 0 COMMENT '展示排序',
                                      `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件配置JSON',
                                      `valid_flag` tinyint NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
                                      `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
                                      `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
                                      `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id',
                                      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
                                      `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人id',
                                      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                                      PRIMARY KEY (`id`) USING BTREE,
                                      INDEX `idx_calc_id`(`calc_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型计算任务可视化组件配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_calc_widget
-- ----------------------------

INSERT INTO `model_calc_widget` VALUES (1, NULL, 3, 11, 'base64', 'base64 图片解析', 1, '{\"field\":\"image_base64\"}', 1, 0, '超级管理员', 1, '2026-08-05 16:14:44', '超级管理员', 1, '2026-08-05 16:16:55', NULL);
INSERT INTO `model_calc_widget` VALUES (2, NULL, 3, 11, 'line', '折线图可视化', 2, '{\"xField\":\"chart_data.dates\",\"yFields\":[{\"field\":\"chart_data.predict_flow\",\"tag\":\"预测值\"},{\"field\":\"chart_data.actual_flow\",\"tag\":\"实际值\"}]}', 1, 0, '超级管理员', 1, '2026-08-05 16:15:45', '超级管理员', 1, '2026-08-05 16:16:55', NULL);


-- ----------------------------
-- Table structure for model_cacl
-- ----------------------------
DROP TABLE IF EXISTS `model_cacl`;
CREATE TABLE `model_cacl`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `company_id`      int(11) NULL DEFAULT NULL COMMENT '企业id',
    `code`            varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计算编码',
    `name`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计算名称',
    `model_id`        int(11) NULL DEFAULT NULL COMMENT '模型id',
    `model_name`      varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型名称',
    `model_version`   varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型版本',
    `start_time`      datetime NULL DEFAULT NULL COMMENT '开始时间',
    `end_time`        datetime NULL DEFAULT NULL COMMENT '结束时间',
    `status`          int(11) NULL DEFAULT NULL COMMENT '计算状态',
    `input_content`   varchar(6144) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型输入内容',
    `output_content`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '模型输出内容',
    `valid_flag`      int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
    `del_flag`        int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
    `create_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`      int(11) NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`     datetime NOT NULL COMMENT '创建时间',
    `update_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`      int(11) NULL DEFAULT NULL COMMENT '更新人id',
    `update_time`     datetime NOT NULL COMMENT '更新时间',
    `remark`          varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    `address_id`      int(11) NULL DEFAULT NULL COMMENT '文件或接口地址id',
    `address_type`    int(11) NULL DEFAULT NULL COMMENT '判断是文件的id还是地址的id，0:文件，1：接口',
    `mp_programme_id` int(11) NULL DEFAULT NULL COMMENT '文件计算的历史方案id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型计算' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_cacl
-- ----------------------------
INSERT INTO `model_cacl`
VALUES (11, 1001, 'CALC_IND_20260716001', '7月设备震动数据异常检测', 101, '工业大模型-动态Token', 'v1.0',
        '2026-07-16 09:00:00', '2026-07-16 09:05:30', 2, '{\"fileName\": \"sensor_data_july.csv\", \"rows\": 5000}',
        '{\"result\": \"Normal\", \"confidence\": 0.98, \"anomaly_count\": 3, \"details\": \"检测到3处微小震动异常，建议复查\"}',
        1, 0, '吴同', 10001, '2026-07-16 09:00:00', '吴同', 10001, '2026-07-16 09:05:30', '常规巡检计算', 5001, 0,
        NULL);
INSERT INTO `model_cacl`
VALUES (12, 1001, 'CALC_REG_20260716002', 'Q3季度销售趋势实时推演', 103, '线性回归算法', 'v1.0', '2026-07-16 10:15:00',
        '2026-07-16 10:32:10', 1, '{\"api_url\": \"/api/data/sales/realtime\", \"params\": {\"region\": \"East\"}}',
        NULL, 1, 0, '吴同', 10001, '2026-07-16 10:15:00', '吴同', 10001, '2026-07-16 10:15:00', '接口调用计算中', 5002,
        1, NULL);
INSERT INTO `model_cacl`
VALUES (13, 1001, 'CALC_SVM_20260716003', '高价值客户流失风险分级', 104, '支持向量机算法', 'v1.0',
        '2026-07-16 11:00:00', '2026-07-16 11:02:10', 2,
        '{\"dataset_id\": \"DS_CUST_2026\", \"features\": [\"login_freq\", \"spend_amt\"]}',
        '{\"classification\": \"High Risk\", \"probability\": 0.85, \"group_id\": \"A01\"}', 1, 0, '吴同', 10001,
        '2026-07-16 11:00:00', '吴同', 10001, '2026-07-16 11:02:10', '月度客户分层分析', 5003, 0, 201);
INSERT INTO `model_cacl`
VALUES (14, 1001, 'CALC_GB_20260716004', '信用评分模型重训练', 108, '梯度增强算法', 'v1.0', '2026-07-16 13:00:00',
        '2026-07-16 13:01:05', 3, '{\"config\": {\"learning_rate\": 0.1, \"n_estimators\": 100}}',
        '{\"error\": \"OutOfMemoryError\", \"msg\": \"显存不足，无法加载数据集\"}', 1, 0, '吴同', 10001,
        '2026-07-16 13:00:00', '系统', 9999, '2026-07-16 13:01:05', '资源不足导致中断', NULL, NULL, NULL);
INSERT INTO `model_cacl`
VALUES (15, 1001, 'CALC_RF_20260716005', '生产线次品图像识别', 106, '随机森林算法', 'v1.0', '2026-07-16 14:30:00',
        '2026-07-16 14:31:00', 2, '{\"image_batch\": [\"img_001.jpg\", \"img_002.jpg\"], \"threshold\": 0.9}',
        '{\"defect_detected\": true, \"type\": \"scratch\", \"location\": [120, 45]}', 1, 0, '吴同', 10001,
        '2026-07-16 14:30:00', '吴同', 10001, '2026-07-16 14:31:00', '自动化质检流程', 5004, 1, NULL);

-- ----------------------------
-- Table structure for model_cacl_reconstitution
-- ----------------------------
DROP TABLE IF EXISTS `model_cacl_reconstitution`;
CREATE TABLE `model_cacl_reconstitution`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT,
    `company_id`      int(11) NULL DEFAULT NULL,
    `code`            varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `name`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `model_id`        int(11) NULL DEFAULT NULL,
    `model_name`      varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `model_version`   varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `start_time`      datetime NULL DEFAULT NULL,
    `end_time`        datetime NULL DEFAULT NULL,
    `status`          int(11) NULL DEFAULT NULL,
    `input_content`   varchar(6144) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `output_content`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
    `valid_flag`      int(11) NOT NULL,
    `del_flag`        int(11) NOT NULL,
    `create_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `creator_id`      int(11) NULL DEFAULT NULL,
    `create_time`     datetime NOT NULL,
    `update_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `updator_id`      int(11) NULL DEFAULT NULL,
    `update_time`     datetime NOT NULL,
    `remark`          varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `address_id`      int(11) NULL DEFAULT NULL,
    `address_type`    int(11) NULL DEFAULT NULL,
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
CREATE TABLE `model_classify`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `company_id`  int(11) NULL DEFAULT NULL COMMENT '企业id',
    `parent_id`   int(11) NULL DEFAULT NULL COMMENT '父级id',
    `ancestors`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '祖籍列表',
    `name`        varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
    `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类描述',
    `order_num`   int NULL DEFAULT 0 COMMENT '显示顺序',
    `valid_flag`  int(11) NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
    `del_flag`    int(11) NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`  int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`  int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
    `update_time` datetime NOT NULL COMMENT '更新时间',
    `remark`      varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_classify
-- ----------------------------
INSERT INTO `model_classify`
VALUES (1, NULL, 0, '0', '工业大模型', '面向工业领域的预训练大语言模型及衍生应用', 1, 1, 0, '吴同', 1,
        '2026-07-14 09:15:22', NULL, NULL, '2026-07-14 09:15:22', '面向工业领域的预训练大语言模型及衍生应用');
INSERT INTO `model_classify`
VALUES (2, NULL, 0, '0', '机器学习', '经典机器学习算法与模型', 0, 1, 0, '吴同', 1, '2026-07-14 09:32:45', NULL, NULL,
        '2026-07-14 09:32:45', '经典机器学习算法与模型');
INSERT INTO `model_classify`
VALUES (3, NULL, 0, '0', '深度学习', '基于深度神经网络的模型', 1, 1, 0, '吴同', 1, '2026-07-14 09:48:10', NULL, NULL,
        '2026-07-14 09:48:10', '基于深度神经网络的模型');
INSERT INTO `model_classify`
VALUES (4, NULL, 0, '0', '数据智能', '面向数据的分析、预测与挖掘模型', 1, 1, 0, '吴同', 1, '2026-07-14 10:05:33', NULL,
        NULL, '2026-07-14 10:05:33', '面向数据的分析、预测与挖掘模型');
INSERT INTO `model_classify`
VALUES (5, NULL, 1, '0,1', '文本生成', '文本生成、摘要、扩写等大模型能力', 1, 1, 0, '吴同', 1, '2026-07-14 10:22:18',
        NULL, NULL, '2026-07-14 10:22:18', '文本生成、摘要、扩写等大模型能力');
INSERT INTO `model_classify`
VALUES (6, NULL, 1, '0,1', '对话交互', '问答、对话、助手类大模型应用', 2, 1, 0, '吴同', 1, '2026-07-14 10:45:09', NULL,
        NULL, '2026-07-14 10:45:09', '问答、对话、助手类大模型应用');
INSERT INTO `model_classify`
VALUES (7, NULL, 1, '0,1', '代码生成', '代码辅助、生成、审查类大模型', 3, 1, 0, '吴同', 1, '2026-07-14 11:12:55', NULL,
        NULL, '2026-07-14 11:12:55', '代码辅助、生成、审查类大模型');
INSERT INTO `model_classify`
VALUES (8, NULL, 2, '0,2', '回归模型', '连续值预测类机器学习模型', 1, 1, 0, '吴同', 1, '2026-07-14 11:35:40', NULL,
        NULL, '2026-07-14 11:35:40', '连续值预测类机器学习模型');
INSERT INTO `model_classify`
VALUES (9, NULL, 2, '0,2', '分类模型', '离散类别预测类机器学习模型', 2, 1, 0, '吴同', 1, '2026-07-14 13:20:15', NULL,
        NULL, '2026-07-14 13:20:15', '离散类别预测类机器学习模型');
INSERT INTO `model_classify`
VALUES (10, NULL, 2, '0,2', '集成学习', '多基学习器集成的机器学习模型', 3, 1, 0, '吴同', 1, '2026-07-14 13:55:28', NULL,
        NULL, '2026-07-14 13:55:28', '多基学习器集成的机器学习模型');
INSERT INTO `model_classify`
VALUES (11, NULL, 2, '0,2', '降维与特征工程', '特征降维、选择与工程化方法', 4, 1, 0, '吴同', 1, '2026-07-14 14:30:42',
        NULL, NULL, '2026-07-14 14:30:42', '特征降维、选择与工程化方法');
INSERT INTO `model_classify`
VALUES (12, NULL, 3, '0,3', '计算机视觉', '图像识别、检测、分割等视觉模型', 1, 1, 0, '吴同', 1, '2026-07-14 14:58:11',
        NULL, NULL, '2026-07-14 14:58:11', '图像识别、检测、分割等视觉模型');
INSERT INTO `model_classify`
VALUES (13, NULL, 3, '0,3', '自然语言处理', '文本分类、序列标注、语义理解等模型', 2, 1, 0, '吴同', 1,
        '2026-07-14 15:25:36', NULL, NULL, '2026-07-14 15:25:36', '文本分类、序列标注、语义理解等模型');
INSERT INTO `model_classify`
VALUES (14, NULL, 3, '0,3', '语音识别', '语音转文字、声纹识别等模型', 3, 1, 0, '吴同', 1, '2026-07-14 16:10:48', NULL,
        NULL, '2026-07-14 16:10:48', '语音转文字、声纹识别等模型');
INSERT INTO `model_classify`
VALUES (15, NULL, 4, '0,4', '时序预测', '时间序列分析与预测模型', 1, 1, 0, '吴同', 1, '2026-07-14 16:45:22', NULL, NULL,
        '2026-07-14 16:45:22', '时间序列分析与预测模型');
INSERT INTO `model_classify`
VALUES (16, NULL, 4, '0,4', '推荐系统', '协同过滤、内容推荐等模型', 2, 1, 0, '吴同', 1, '2026-07-14 17:20:55', NULL,
        NULL, '2026-07-14 17:20:55', '协同过滤、内容推荐等模型');
INSERT INTO `model_classify`
VALUES (17, NULL, 4, '0,4', '异常检测', '离群点、异常行为识别模型', 3, 1, 0, '吴同', 1, '2026-07-14 17:55:30', NULL,
        NULL, '2026-07-14 17:55:30', '离群点、异常行为识别模型');

-- ----------------------------
-- Table structure for model_compute
-- ----------------------------
DROP TABLE IF EXISTS `model_compute`;
CREATE TABLE `model_compute`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `start_time`     datetime                                                    NOT NULL COMMENT '开始时间',
    `create_by_id`   int(11) NULL DEFAULT NULL COMMENT '操作人id',
    `create_by`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '操作时间',
    `name`           varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '方案名称',
    `monitor1`       decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站1号',
    `monitor2`       decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站2号',
    `monitor3`       decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站3号',
    `avg_rain_fall`  decimal(9, 6) NULL DEFAULT NULL COMMENT '面均雨量',
    `rain_fall_last` decimal(9, 6) NULL DEFAULT NULL COMMENT '降雨历时',
    `water_scale`    decimal(9, 6) NULL DEFAULT NULL COMMENT '降雨分布比例',
    `z`              decimal(20, 6) NULL DEFAULT NULL COMMENT '初始库水位',
    `q`              decimal(20, 6) NULL DEFAULT NULL COMMENT '初始出库流量',
    `soil_condition` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '土壤条件',
    `zfzsxskc`       decimal(9, 6) NULL DEFAULT NULL COMMENT '蒸发折算系数(kc)',
    `zfzsxsc`        decimal(9, 6) NULL DEFAULT NULL COMMENT '蒸发折算系数(c)',
    `zlsxl`          decimal(9, 6) NULL DEFAULT NULL COMMENT '初始土壤张力水蓄量(w0)',
    `sczlsxl`        decimal(9, 6) NULL DEFAULT NULL COMMENT '初始上层张力水蓄量(wu0)',
    `xczlsxl`        decimal(9, 6) NULL DEFAULT NULL COMMENT '初始下层张力水蓄量(wl0)',
    `sczlsxlwdo`     decimal(9, 6) NULL DEFAULT NULL COMMENT '初始深层张力水蓄量(wd0)',
    `pjzlsxl`        decimal(9, 6) NULL DEFAULT NULL COMMENT '流域平均张力水蓄量(wmm)',
    `lysczlsxl`      decimal(9, 6) NULL DEFAULT NULL COMMENT '流域上层张力水蓄量(wum)',
    `lyxczlsxl`      decimal(9, 6) NULL DEFAULT NULL COMMENT '流域下层张力水蓄量(wlm)',
    `lysczlsxlwdo`   decimal(9, 6) NULL DEFAULT NULL COMMENT '流域深层张力水蓄量(wdm)',
    `xtxs`           decimal(9, 6) NULL DEFAULT NULL COMMENT '消退系数(kb)',
    `jl`             decimal(9, 6) NULL DEFAULT NULL COMMENT '基流(qb)',
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
                                        `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型版本号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型文件部署表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_file_resource
-- ----------------------------
INSERT INTO `model_file_resource` VALUES (5, 10, '水位流量插值算法.zip', 'main.py', 'temp/2026/07/17/水位流量插值算法.zip', '/usr/app/jar/upload/temp/extract/5/requirements.txt', 'V1.0', 2, NULL, NULL, NULL, '/usr/app/jar/upload/temp/extract/5/main.py', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 'qModel', 1, '2026-07-16 15:49:49', 'system', 1, '2026-09-01 11:56:21', NULL, '{\n  \"title\": \"runScript接口入参\",\n  \"type\": \"object\",\n  \"required\": [\"H\"],\n  \"properties\": {\n    \"H\": {\n      \"title\": \"参数H\",\n      \"description\": \"自定义数值参数\",\n      \"type\": \"integer\",\n      \"example\": 3\n    }\n  }\n}', NULL);

-- ----------------------------
-- Table structure for model_build_log
-- ----------------------------
DROP TABLE IF EXISTS `model_build_log`;
CREATE TABLE `model_build_log`  (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `resource_id` bigint NOT NULL COMMENT '模型文件id',
    `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型版本',
    `model_id` bigint NULL DEFAULT NULL COMMENT '模型id',
    `model_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型名称',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '构建日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for model_invoke_history
-- ----------------------------
DROP TABLE IF EXISTS `model_invoke_history`;
CREATE TABLE `model_invoke_history`  (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `model_id` bigint NOT NULL COMMENT '模型id',
    `model_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型名称',
    `resource_id` bigint NULL DEFAULT NULL COMMENT '模型配置资源id',
    `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型版本',
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型调用历史记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for model_history
-- ----------------------------
DROP TABLE IF EXISTS `model_history`;
CREATE TABLE `model_history`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `company_id`    bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `model_id`      bigint(20) NULL DEFAULT NULL COMMENT '所属模型id',
    `model_name`    varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型名称',
    `context`       varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
    `start_time`    datetime NULL DEFAULT NULL COMMENT '启用时间',
    `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '启用版本号',
    `valid_flag`    tinyint(4) NOT NULL COMMENT '是否有效 0：无效，1：有效',
    `del_flag`      tinyint(4) NOT NULL COMMENT '删除标志 1：已删除，0：未删除 ',
    `create_by`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`    bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`   datetime NOT NULL COMMENT '创建时间',
    `update_by`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`    bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
    `update_time`   datetime NOT NULL COMMENT '更新时间',
    `remark`        varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1378 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型历史' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_history
-- ----------------------------
INSERT INTO `model_history`
VALUES (1368, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:24:31',
        'qModel', 1, '2026-07-01 18:24:31', NULL);
INSERT INTO `model_history`
VALUES (1369, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:24:34',
        'qModel', 1, '2026-07-01 18:24:34', NULL);
INSERT INTO `model_history`
VALUES (1370, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:24:37',
        'qModel', 1, '2026-07-01 18:24:37', NULL);
INSERT INTO `model_history`
VALUES (1371, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:06',
        'qModel', 1, '2026-07-01 18:25:06', NULL);
INSERT INTO `model_history`
VALUES (1372, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:25',
        'qModel', 1, '2026-07-01 18:25:25', NULL);
INSERT INTO `model_history`
VALUES (1373, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:26',
        'qModel', 1, '2026-07-01 18:25:26', NULL);
INSERT INTO `model_history`
VALUES (1374, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:28',
        'qModel', 1, '2026-07-01 18:25:28', NULL);
INSERT INTO `model_history`
VALUES (1375, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:25:37',
        'qModel', 1, '2026-07-01 18:25:37', NULL);
INSERT INTO `model_history`
VALUES (1376, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:26:31',
        'qModel', 1, '2026-07-01 18:26:31', NULL);
INSERT INTO `model_history`
VALUES (1377, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '2', 1, 0, 'qModel', 1, '2026-07-01 18:26:32',
        'qModel', 1, '2026-07-01 18:26:32', NULL);

-- ----------------------------
-- Table structure for model_input
-- ----------------------------
DROP TABLE IF EXISTS `model_input`;
CREATE TABLE `model_input`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `company_id`       int(11) NULL DEFAULT NULL COMMENT '企业Id',
    `name`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数名称',
    `eng_name`         varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '英文名称',
    `type`             int(11) NULL DEFAULT NULL COMMENT '参数类型 0:单值，1：多列数值，2：文件',
    `model_id`         int(11) NULL DEFAULT NULL COMMENT '所属模型id',
    `model_name`       varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型名称',
    `model_version`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型版本',
    `description`      varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数说明(描述)',
    `example`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数示例（文件上传）',
    `param_file`       varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数文件',
    `single_content`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数单值',
    `multiple_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数多列值',
    `valid_flag`       int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
    `del_flag`         int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
    `create_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`       int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
    `create_time`      datetime NOT NULL COMMENT '创建时间',
    `update_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`       int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
    `update_time`      datetime NOT NULL COMMENT '更新时间',
    `remark`           varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    `change_flag`      tinyint(1) NOT NULL COMMENT '是否可变 0：不可变，1：可变',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型输入管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_input
-- ----------------------------
INSERT INTO `model_input`
VALUES (1, NULL, '123', '333', 0, 4, '测试', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, 'admin', NULL,
        '2025-11-17 04:22:12', NULL, NULL, '2025-11-17 04:57:36', NULL, 1);
INSERT INTO `model_input`
VALUES (2, NULL, 'q', 'q', 0, 8, '综合水利集成模型', '1', '水位', NULL, NULL, '[]', '[]', 1, 0, 'admin', NULL,
        '2025-11-17 06:20:52', NULL, NULL, '2025-12-31 16:09:04', NULL, 0);
INSERT INTO `model_input`
VALUES (3, NULL, '日水量', 'AW_DT', 0, 7, '来水预测模型', NULL, NULL, NULL, NULL, '[]', '[]', 1, 1, 'admin', NULL,
        '2025-12-11 13:53:10', NULL, NULL, '2025-12-11 13:53:11', NULL, 1);
INSERT INTO `model_input`
VALUES (4, NULL, '水位', 'P', 1, 10, '水土保持模型', '1', NULL, NULL, NULL, '[]', '[]', 1, 0, '小桐', NULL,
        '2025-12-31 18:21:14', NULL, NULL, '2025-12-31 18:21:14', NULL, 1);
INSERT INTO `model_input`
VALUES (5, NULL, 'q', '123', NULL, 11, 'AI水位预测', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, '小桐', NULL,
        '2026-01-06 11:43:32', NULL, NULL, '2026-01-06 11:43:32', NULL, 1);
INSERT INTO `model_input`
VALUES (6, NULL, 'q', '123', 1, 11, 'AI水位预测', '1', NULL, NULL, NULL, '[]',
        '[{\"name\":\"q\",\"value\":\"1\",\"order\":2,\"index\":1}]', 1, 0, '小桐', NULL, '2026-01-06 11:44:06', NULL,
        NULL, '2026-01-06 11:48:17', NULL, 1);
INSERT INTO `model_input`
VALUES (7, NULL, '测试', 'name', 0, 5, '单机程序', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, '小桐', NULL,
        '2026-01-06 13:58:57', NULL, NULL, '2026-01-06 11:48:17', NULL, 0);
INSERT INTO `model_input`
VALUES (8, NULL, 'q', 'level', 0, 5, '单机程序', '1', '说明', NULL, NULL, '[]', '[]', 1, 0, '小桐', 1,
        '2026-01-09 16:35:37', '小桐', 1, '2026-01-09 16:35:37', NULL, 1);
INSERT INTO `model_input`
VALUES (9, NULL, 'q', '/data/jgst/jgst.chaoshen.20250113/data_input.json', 1, 12, '流量是计算', '2', '参数说明', NULL,
        NULL, '[]', '[{\"name\":\"q\",\"value\":\"0\",\"order\":213,\"index\":1}]', 1, 0, '小桐', 1,
        '2026-01-14 16:59:34', '小桐', 1, '2026-01-21 15:17:32', NULL, 1);

-- ----------------------------
-- Table structure for model_interface_address
-- ----------------------------
DROP TABLE IF EXISTS `model_interface_address`;
CREATE TABLE `model_interface_address`
(
    `id`                          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `company_id`                  int(11) NULL DEFAULT NULL COMMENT '企业id',
    `model_id`                    bigint(20) NULL DEFAULT NULL COMMENT '模型id',
    `interface_address`           varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口地址',
    `version_id`                  bigint(20) NULL DEFAULT NULL COMMENT '模型版本id',
    `request_method`              bigint(20) NULL DEFAULT NULL COMMENT '请求方式',
    `input_parameter`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输入参数',
    `output_parameter`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输出参数',
    `del_flag`                    bigint(20) NOT NULL COMMENT '删除标志',
    `create_by`                   varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`                  bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`                 datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`                   varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`                  bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
    `update_time`                 datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`                      varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    `input_parameter_illustrate`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输入参数说明',
    `output_parameter_illustrate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '输出参数说明',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '接口地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_interface_address
-- ----------------------------
INSERT INTO `model_interface_address`
VALUES (1, NULL, 7, 'null:6379/null:6379/123', 7, 1, NULL, NULL, 1, '小桐', 1, '2026-01-14 14:20:25', '小桐', 1,
        '2026-01-14 14:46:12', '测试', NULL, NULL);
INSERT INTO `model_interface_address`
VALUES (2, NULL, 7, 'null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml', 7, 2, NULL, NULL, 0, '小桐',
        1, '2026-01-14 15:27:03', '小桐', 1, '2026-01-14 16:04:55', '测试新增', NULL, NULL);
INSERT INTO `model_interface_address`
VALUES (3, NULL, 13, 'http://localhost/dev-api/captchaImage', 18, 0, NULL, NULL, 0, '小桐', 1, '2026-01-20 13:20:18',
        '小桐', 1, '2026-01-20 15:48:04', 'q', NULL, NULL);
INSERT INTO `model_interface_address`
VALUES (4, NULL, 13, 'null:80/http://localhost:8090/captchaImage', 18, 0, NULL, NULL, 0, '小桐', 1,
        '2026-01-21 14:26:04', '小桐', 1, '2026-01-21 14:26:04', 'z', NULL, NULL);
INSERT INTO `model_interface_address`
VALUES (5, NULL, 13, '/https://demo.qmodel.tech/prod-api/captchaImage', 22, 0, NULL, NULL, 1, '小桐2', 1,
        '2026-01-26 16:51:24', '小桐2', 1, '2026-01-26 16:51:24', '测试', NULL, NULL);
INSERT INTO `model_interface_address`
VALUES (6, NULL, 13, 'https://demo.qmodel.tech/prod-api/captchaImage', 22, 0, NULL, NULL, 0, '小桐2', 1,
        '2026-01-26 16:52:00', '小桐2', 1, '2026-01-26 16:52:00', '测试', NULL, NULL);
INSERT INTO `model_interface_address`
VALUES (7, NULL, 13, 'https://demo.qmodel.tech/prod-api/captchaImage', 22, 0, NULL, NULL, 0, '小桐2', 1,
        '2026-01-26 17:08:12', '小桐2', 1, '2026-01-26 17:08:12', '测试', NULL, NULL);

-- ----------------------------
-- Table structure for model_operate
-- ----------------------------
DROP TABLE IF EXISTS `model_operate`;
CREATE TABLE `model_operate`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `company_id`   int(11) NULL DEFAULT NULL COMMENT '企业id',
    `module_name`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作模块',
    `type`         int(11) NULL DEFAULT NULL COMMENT '操作类型',
    `content`      varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
    `method`       varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方式',
    `req_content`  varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求参数',
    `resp_content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '返回参数',
    `ip`           varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作地址(Ip)',
    `address`      varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作地点',
    `status`       int(11) NULL DEFAULT NULL COMMENT '操作状态',
    `valid_flag`   int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
    `del_flag`     int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`   int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
    `create_time`  datetime NOT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`   int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
    `update_time`  datetime NOT NULL COMMENT '更新时间',
    `remark`       varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型历史管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_operate
-- ----------------------------
INSERT INTO `model_operate`
VALUES (1, 1001, '工业大模型', 1, '启动设备故障预测微调任务', 'POST /api/model/industry/train',
        '{\"modelCode\":\"INDUSTRY_MODEL_TEST\", \"datasetId\":\"DS_2026_Q3\", \"epochs\": 50, \"learningRate\": 0.001}',
        '{\"code\":200, \"msg\":\"训练任务已下发\", \"taskId\":\"TRAIN_JOB_9981\"}', '192.168.10.55', '江苏省南京市', 1,
        1, 0, '吴同', 10001, '2026-07-16 09:15:00', '吴同', 10001, '2026-07-16 09:15:00',
        '基于Q3季度传感器数据进行微调');
INSERT INTO `model_operate`
VALUES (2, 1001, '线性回归算法', 0, '获取销售额预测模型评估报告', 'GET /api/model/regression/report?id=LR_001', NULL,
        '{\"code\":200, \"data\": {\"r2_score\": 0.95, \"rmse\": 12.4, \"chartUrl\": \"/static/img/lr_chart.png\"}}',
        '192.168.10.55', '江苏省南京市', 1, 1, 0, '吴同', 10001, '2026-07-16 10:30:00', '吴同', 10001,
        '2026-07-16 10:30:00', '日常模型效果监控');
INSERT INTO `model_operate`
VALUES (3, 1001, '支持向量机算法', 2, '调整SVM核函数参数并重试', 'PUT /api/model/svm/config',
        '{\"modelCode\":\"SVM\", \"kernel\": \"rbf\", \"C\": 1.5, \"gamma\": \"scale\"}',
        '{\"code\":200, \"msg\": \"配置更新成功，等待下次计算生效\"}', '192.168.10.55', '江苏省南京市', 1, 1, 0, '吴同',
        10001, '2026-07-16 11:00:00', '吴同', 10001, '2026-07-16 11:00:00', '优化分类边界准确率');
INSERT INTO `model_operate`
VALUES (4, 1001, '随机森林算法', 1, '执行客户流失风险批量预测', 'POST /api/model/random_forest/predict',
        '{\"modelCode\":\"RANDOM_FOREST\", \"batchSize\": 1000, \"inputSource\": \"db_crm_customers\"}',
        '{\"code\":200, \"msg\": \"预测完成\", \"resultCount\": 1000, \"highRiskCount\": 45}', '192.168.10.55',
        '江苏省南京市', 1, 1, 0, '吴同', 10001, '2026-07-16 14:20:00', '吴同', 10001, '2026-07-16 14:20:00',
        '月度例行风险评估');

-- ----------------------------
-- Table structure for model_output
-- ----------------------------
DROP TABLE IF EXISTS `model_output`;
CREATE TABLE `model_output`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `company_id`       int(11) NULL DEFAULT NULL COMMENT '企业Id',
    `name`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数名称',
    `eng_name`         varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '英文名称',
    `type`             int(11) NULL DEFAULT NULL COMMENT '参数类型 0:单值，1：多列数值',
    `model_id`         int(11) NULL DEFAULT NULL COMMENT '所属模型id',
    `model_name`       varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型名称',
    `model_version`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型版本',
    `description`      varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数说明(描述)',
    `single_content`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数单值',
    `multiple_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数多列值',
    `valid_flag`       int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
    `del_flag`         int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
    `create_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`       int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
    `create_time`      datetime NOT NULL COMMENT '创建时间',
    `update_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`       int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
    `update_time`      datetime NOT NULL COMMENT '更新时间',
    `remark`           varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型输出管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_output
-- ----------------------------
INSERT INTO `model_output`
VALUES (1, NULL, '33', '22', 1, 4, '测试', '1', NULL, '[]',
        '[{\"name\":\"1\",\"value\":\"2\",\"order\":0,\"index\":1}]', 1, 1, 'admin', 1, '2025-11-17 04:29:29', NULL,
        NULL, '2025-11-17 04:29:28', NULL);
INSERT INTO `model_output`
VALUES (2, NULL, 'z', 'z', 0, 5, '测试', '1', NULL, '\"1\"', '[]', 1, 1, 'admin', 1, '2025-11-17 06:21:19', NULL, NULL,
        '2025-11-17 06:21:20', NULL);
INSERT INTO `model_output`
VALUES (3, NULL, '水利1112', 'weater', 0, 5, '单机程序', '1', NULL, '[]', '[]', 1, 1, '小桐', 1, '2026-01-06 14:47:18',
        NULL, NULL, '2026-01-06 14:47:24', NULL);
INSERT INTO `model_output`
VALUES (4, NULL, '输出模型', 'q', 0, 5, '单机程序', '1', 'qqq', '\"0\"', '[]', 1, 1, '小桐', 1, '2026-01-09 16:26:54',
        '小桐', 1, '2026-01-13 14:52:55', NULL);
INSERT INTO `model_output`
VALUES (5, NULL, 'AVQ', '/data/jgst/jgst.chaoshen.20250113/data_output.json', 0, 12, '流量是计算', '2', '测试', '\"0\"',
        '[]', 1, 0, '小桐', 1, '2026-01-14 18:05:18', '小桐', 1, '2026-01-21 15:16:51', NULL);

-- ----------------------------
-- Table structure for model_reconstitution
-- ----------------------------
DROP TABLE IF EXISTS `model_reconstitution`;
CREATE TABLE `model_reconstitution`
(
    `id`                      int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `company_id`              int(11) NULL DEFAULT NULL COMMENT '企业id',
    `name`                    varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型名称',
    `classify_id`             int(11) NULL DEFAULT NULL COMMENT '模型分类',
    `builtin`                 int(11) NULL DEFAULT NULL COMMENT '是否预置',
    `access_mode`             int(11) NULL DEFAULT NULL COMMENT '接入方式',
    `request_method`          int(11) NULL DEFAULT NULL COMMENT '请求方式',
    `interfaceorfile_address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口和文件的地址',
    `version_id`              int(11) NULL DEFAULT NULL COMMENT '版本id',
    `whether_publish`         int(11) NOT NULL COMMENT '是否发布',
    `publish_time`            datetime NULL DEFAULT NULL COMMENT '发布时间',
    `del_flag`                bigint(20) NOT NULL COMMENT '删除标志',
    `create_by`               varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`              bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`             datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`               varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`              bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
    `update_time`             datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`                  varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    `port`                    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口的端口号',
    `file_name`               varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
    `runnable_file_address`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '可执行文件相对路径',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型库重构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_reconstitution
-- ----------------------------
INSERT INTO `model_reconstitution`
VALUES (1, NULL, '产汇流模型', 2, NULL, NULL, NULL, NULL, 1, 0, '2025-11-14 18:35:43', 1, 'admin', 1,
        '2025-11-14 18:34:04', NULL, NULL, '2025-11-14 18:35:43', NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (2, NULL, '123', 2, 1, 1, NULL, NULL, 2, 0, NULL, 1, 'admin', 1, '2025-11-14 19:38:17', NULL, NULL, NULL, NULL,
        '123', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (3, NULL, 'test', 2, 0, 0, NULL,
        'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip', 3, 0, NULL, 1,
        'admin', 1, '2025-11-16 15:38:07', NULL, NULL, NULL, NULL, NULL, 'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution`
VALUES (4, NULL, '测试', 2, 0, 0, NULL,
        'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip', 4, 0,
        '2025-11-17 04:21:54', 1, 'admin', 1, '2025-11-16 15:40:03', NULL, NULL, '2025-11-17 04:21:54', NULL, NULL,
        'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution`
VALUES (5, NULL, '单机程序', 3, 0, 0, NULL,
        'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip', 5, 0,
        '2025-12-30 13:30:41', 1, 'admin', 1, '2025-11-17 06:20:23', NULL, NULL, '2025-12-30 13:30:41', NULL, NULL,
        'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution`
VALUES (6, NULL, 'ceshi ', 2, NULL, 1, NULL, NULL, 6, 0, NULL, 1, 'admin', 1, '2025-11-18 10:45:41', NULL, NULL, NULL,
        NULL, '1001', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (7, NULL, '来水预测模型', 3, 0, 1, NULL, NULL, 12, 0, '2025-12-11 14:38:09', 1, 'admin', 1,
        '2025-12-11 10:38:28', '小桐', 1, '2026-01-14 15:32:29', '模型介绍', '6379', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (8, NULL, '综合水利集成模型', 28, 1, 0, NULL, NULL, 8, 0, NULL, 1, '小桐', 1, '2025-12-31 15:40:23', NULL, NULL,
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (9, NULL, '水土保持模型', 30, NULL, 0, NULL, NULL, 9, 0, NULL, 1, '小桐', 1, '2025-12-31 15:40:55', NULL, NULL,
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (10, NULL, '水土保持模型', 30, 1, 0, NULL,
        'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip', 10, 0, NULL, 1,
        '小桐', 1, '2025-12-31 18:17:47', NULL, NULL, NULL, NULL, NULL, 'jgst.chaoshen.20250113.zip', NULL);
INSERT INTO `model_reconstitution`
VALUES (11, NULL, 'AI水位预测', 29, 0, 0, NULL,
        'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip', 11, 0,
        '2026-01-06 17:14:08', 0, '小桐', 1, '2025-12-31 18:25:19', NULL, NULL, '2026-01-06 17:14:08', NULL, NULL,
        'jgst.chaoshen.20250113.zip', NULL);
INSERT INTO `model_reconstitution`
VALUES (12, NULL, '流量是计算', 9, 1, 0, NULL,
        'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip', 14, 0,
        '2026-04-09 15:49:50', 0, '小桐', 1, '2026-01-14 16:22:53', 'qModel', 1, '2026-04-09 15:49:50', NULL, NULL,
        NULL, '\\jgst.chaoshen.20250113\\data.json');
INSERT INTO `model_reconstitution`
VALUES (13, NULL, '接口服务类', 9, 1, 1, NULL, NULL, 22, 0, '2026-07-01 18:26:32', 0, '小桐', 1, '2026-01-20 09:17:25',
        'qModel', 1, '2026-07-01 18:26:32', NULL, '80', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (14, NULL, 'base64图片获取', 3, 1, 1, NULL, NULL, 19, 0, NULL, 1, '小桐', 1, '2026-01-21 14:41:41', '小桐', 1,
        '2026-01-21 14:41:41', NULL, '80', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (15, NULL, '测试', 3, 1, 1, NULL, NULL, 20, 0, NULL, 1, '小桐', 1, '2026-01-21 14:47:59', '小桐', 1,
        '2026-01-21 14:47:59', NULL, '6379', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (16, NULL, '测试', 17, 0, 1, NULL, 'http:192.1623', 21, 0, NULL, 1, '小桐', 1, '2026-01-21 15:27:03', '小桐', 1,
        '2026-01-21 15:27:03', NULL, '8888', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (17, NULL, '降雨量计算', 8, 1, 0, NULL,
        'http://localhost:8090/profile/upload/2026/03/06/test1111.py_20260306154644A001.zip', 23, 0,
        '2026-04-09 15:35:17', 0, '小桐2', 1, '2026-03-06 15:49:45', 'qModel', 1, '2026-04-09 15:35:17', '111', NULL,
        NULL, 'test1111.py');
INSERT INTO `model_reconstitution`
VALUES (18, NULL, '来水预测', 8, 1, 0, NULL,
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409154627A004.zip',
        24, 0, NULL, 0, 'qModel', 1, '2026-04-09 15:46:39', 'qModel', 1, '2026-04-09 15:46:39', NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (19, NULL, '转发三方信息', 8, 1, 1, NULL, 'http://localhost/model/version', 25, 0, '2026-04-09 15:55:20', 1,
        'qModel', 1, '2026-04-09 15:50:23', 'qModel', 1, '2026-04-09 15:55:20', '权威的', '80', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (20, NULL, '测试', 12, 1, 0, NULL,
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155539A005.zip',
        26, 0, NULL, 0, 'qModel', 1, '2026-04-09 15:55:43', 'qModel', 1, '2026-04-09 15:55:43', NULL, '80', NULL, NULL);
INSERT INTO `model_reconstitution`
VALUES (21, NULL, 'model', 8, 1, 0, NULL,
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155629A006.zip',
        27, 0, NULL, 1, 'qModel', 1, '2026-04-09 15:56:33', 'qModel', 1, '2026-04-09 15:56:33', 'qwdqw ', '80', NULL,
        NULL);
INSERT INTO `model_reconstitution`
VALUES (22, NULL, '测试模型', 8, 0, 0, NULL, NULL, 28, 0, NULL, 1, 'qModel', 1, '2026-07-01 13:35:34', 'qModel', 1,
        '2026-07-01 13:35:34', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for model_version
-- ----------------------------
DROP TABLE IF EXISTS `model_version`;
CREATE TABLE `model_version`
(
    `id`                    int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `company_id`            int(11) NULL DEFAULT NULL COMMENT '企业id',
    `model_id`              int(11) NULL DEFAULT NULL COMMENT '所属模型id',
    `model_name`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模型名称',
    `version`               varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模型版本号',
    `file_address`          varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件地址',
    `interface_address`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口地址',
    `status`                int(11) NULL DEFAULT NULL COMMENT '版本状态',
    `description`           varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
    `valid_flag`            int(11) NOT NULL COMMENT '是否有效 0：无效，1：有效',
    `del_flag`              int(11) NOT NULL COMMENT '删除标志 1：已删除，0：未删除',
    `create_by`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`            int(11) NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
    `create_time`           datetime NOT NULL COMMENT '创建时间',
    `update_by`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`            int(11) NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
    `update_time`           datetime NOT NULL COMMENT '更新时间',
    `remark`                varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    `file_name`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件的名称',
    `runnable_file_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '可执行文件地址',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '版本管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_version
-- ----------------------------
INSERT INTO `model_version`
VALUES (1, NULL, 1, '产汇流模型', NULL, NULL, NULL, 1, '产汇流模型', 1, 0, 'admin', 1, '2025-11-14 18:34:04', NULL,
        NULL, '2025-11-14 18:34:04', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (2, NULL, 2, '123', '123', NULL, NULL, 1, '123', 1, 0, 'admin', 1, '2025-11-14 19:38:17', NULL, NULL,
        '2025-11-14 19:38:17', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (3, NULL, 3, 'test', '1',
        'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip',
        'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip', 1, '1', 1, 0,
        'admin', 1, '2025-11-16 15:38:06', NULL, NULL, '2025-11-16 15:38:07', NULL, NULL, '\\MODEL_OUTPUT.sql');
INSERT INTO `model_version`
VALUES (4, NULL, 4, '123123', '1',
        'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip',
        'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip', 1, '1', 1, 0,
        'admin', 1, '2025-11-16 15:40:03', NULL, NULL, '2025-11-16 15:40:03', NULL, NULL, '\\MODEL_OUTPUT.sql');
INSERT INTO `model_version`
VALUES (5, NULL, 5, '测试', '1',
        'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip',
        'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip', 1, '1', 1, 0,
        'admin', 1, '2025-11-17 06:20:22', NULL, NULL, '2025-11-17 06:20:23', NULL, NULL, 'MODEL_COMPUTE.sql');
INSERT INTO `model_version`
VALUES (6, NULL, 6, 'ceshi ', '1', NULL, NULL, 1, '1', 1, 0, 'admin', 1, '2025-11-18 10:45:41', NULL, NULL,
        '2025-11-18 10:45:41', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (7, NULL, 7, '来水预测模型', 'v1.0', NULL, NULL, 0, '测试', 1, 1, 'admin', 1, '2025-12-11 10:38:28', '小桐', 1,
        '2026-01-20 11:56:59', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (8, NULL, 8, '综合水利集成模型', '1.0', NULL, NULL, 1, '综合水利集成模型演算', 1, 0, '小桐', 1,
        '2025-12-31 15:40:23', NULL, NULL, '2025-12-31 15:40:23', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (9, NULL, 9, '水土保持模型', '1.0', NULL, NULL, 1, '水土保持模型', 1, 0, '小桐', 1, '2025-12-31 15:40:54', NULL,
        NULL, '2025-12-31 15:40:55', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (10, NULL, 10, '水土保持模型', '1.0',
        'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip',
        'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip', 1,
        '水土保持模型', 1, 0, '小桐', 1, '2025-12-31 18:17:47', NULL, NULL, '2025-12-31 18:17:47', NULL, NULL,
        '\\jgst.chaoshen.20250113\\chaoshen.20250113.py');
INSERT INTO `model_version`
VALUES (11, NULL, 11, 'AI水位预测', '1.2',
        'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip',
        'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip', 1,
        'AI水位预测', 1, 0, '小桐', 1, '2025-12-31 18:25:19', NULL, NULL, '2025-12-31 18:25:19', NULL, NULL,
        '\\jgst.chaoshen.20250113\\chaoshen.20250113.py');
INSERT INTO `model_version`
VALUES (12, NULL, 7, '来水预测模型', '2', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-14 15:26:32', '小桐', 1,
        '2026-01-20 13:18:54', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (13, NULL, NULL, '流量是计算', '1',
        'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip',
        'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip', 1, '不能为空',
        1, 0, '小桐', 1, '2026-01-14 16:22:52', '小桐', 1, '2026-01-14 16:22:52', NULL, NULL,
        '\\jgst.chaoshen.20250113\\data.json');
INSERT INTO `model_version`
VALUES (14, NULL, 12, '流量是计算', '2', NULL, NULL, 1, NULL, 1, 0, '小桐', 1, '2026-01-14 16:51:33', '小桐', 1,
        '2026-01-20 11:41:22', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (15, NULL, NULL, '接口服务类', '1', NULL, NULL, 1, '接口服务类', 1, 0, '小桐', 1, '2026-01-20 09:17:24', '小桐',
        1, '2026-01-20 09:17:24', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (16, NULL, 12, '流量是计算', '3', NULL, NULL, 0, NULL, 1, 1, '小桐', 1, '2026-01-20 09:22:58', '小桐', 1,
        '2026-01-20 10:52:29', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (17, NULL, 7, '来水预测模型', '3', NULL, NULL, 0, NULL, 1, 0, '小桐', 1, '2026-01-20 11:56:45', '小桐', 1,
        '2026-01-20 13:18:54', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (18, NULL, 13, '接口服务类', '1', NULL, NULL, 0, 'version1', 1, 0, '小桐', 1, '2026-01-20 13:19:31', 'qModel', 1,
        '2026-07-01 17:47:50', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (19, NULL, NULL, 'base64图片获取', '1', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-21 14:41:41', '小桐', 1,
        '2026-01-21 14:41:41', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (20, NULL, NULL, '测试', '1', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-21 14:47:58', '小桐', 1,
        '2026-01-21 14:47:58', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (21, NULL, NULL, '测试', '1', 'http:192.1623', 'http:192.1623', 1, '1', 1, 0, '小桐', 1, '2026-01-21 15:27:03',
        '小桐', 1, '2026-01-21 15:27:03', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (22, NULL, 13, '接口服务类', '2', NULL, NULL, 1, 'version22', 1, 0, '小桐', 1, '2026-01-21 16:30:20', 'qModel',
        1, '2026-07-01 17:47:51', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (23, NULL, NULL, '测试一下', '1',
        'http://localhost:8090/profile/upload/2026/03/06/test1111.py_20260306154644A001.zip',
        'http://localhost:8090/profile/upload/2026/03/06/test1111.py_20260306154644A001.zip', 1, '1111', 1, 0, '小桐2',
        1, '2026-03-06 15:49:45', '小桐2', 1, '2026-03-06 15:49:45', NULL, NULL, 'test1111.py');
INSERT INTO `model_version`
VALUES (24, NULL, NULL, '来水预测', '1',
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409154627A004.zip',
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409154627A004.zip',
        1, '来水预测', 1, 0, 'qModel', 1, '2026-04-09 15:46:38', 'qModel', 1, '2026-04-09 15:46:38', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (25, NULL, NULL, '转发三方信息', '1', NULL, NULL, 1, '取得完全的', 1, 0, 'qModel', 1, '2026-04-09 15:50:22',
        'qModel', 1, '2026-04-09 15:50:22', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (26, NULL, NULL, '测试', '1',
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155539A005.zip',
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155539A005.zip',
        1, '权威的', 1, 0, 'qModel', 1, '2026-04-09 15:55:43', 'qModel', 1, '2026-04-09 15:55:43', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (27, NULL, NULL, 'model', '1',
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155629A006.zip',
        'http://localhost:8090/profile/upload/2026/04/09/6729ab66-56e6-43fa-820a-745ca7b85037_20260409155629A006.zip',
        1, 'qwdq ', 1, 0, 'qModel', 1, '2026-04-09 15:56:32', 'qModel', 1, '2026-04-09 15:56:32', NULL, NULL, NULL);
INSERT INTO `model_version`
VALUES (28, NULL, NULL, '测试模型', NULL, NULL, NULL, 1, NULL, 1, 0, 'qModel', 1, '2026-07-01 13:35:33', 'qModel', 1,
        '2026-07-01 13:35:33', NULL, NULL, NULL);


DROP TABLE IF EXISTS `model_calc`;
CREATE TABLE `model_calc`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `company_id`       bigint(20) DEFAULT NULL COMMENT '租户/公司ID',
    `code`             varchar(32)       DEFAULT NULL COMMENT '计算编码',
    `name`             varchar(32)       DEFAULT NULL COMMENT '任务名称',
    `classify_id`      bigint(20) DEFAULT NULL COMMENT '模型分类ID',
    `classify_name`    varchar(32)       DEFAULT NULL COMMENT '模型分类名称',
    `model_id`         bigint(20) NOT NULL COMMENT '关联模型ID',
    `model_name`       varchar(32)       DEFAULT NULL COMMENT '模型名称',
    `model_version`    varchar(32)       DEFAULT NULL COMMENT '模型版本号',
    `model_version_id` bigint(20) DEFAULT NULL COMMENT '模型版本ID',
    `description`      text COMMENT '描述',
    `input_params`     longtext COMMENT '输入参数(JSON格式)',
    `output_result`    longtext COMMENT '输出结果(JSON格式)',
    `start_time`       datetime          DEFAULT NULL COMMENT '开始时间',
    `end_time`         datetime          DEFAULT NULL COMMENT '结束时间',
    `duration`         int(11) DEFAULT NULL COMMENT '耗时(毫秒)',
    `status`           tinyint(3) unsigned DEFAULT NULL COMMENT '计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中',
    `timeout_seconds`  int(11) DEFAULT NULL COMMENT '超时时间(秒)',
    `retry_count`      int(11) DEFAULT NULL COMMENT '已重试次数',
    `max_retry_count`  int(11) DEFAULT NULL COMMENT '最大重试次数',
    `priority`         tinyint(3) unsigned DEFAULT NULL COMMENT '优先级:1-高,2-中,3-低',
    `error_message`    text COMMENT '错误信息',
    `resource_id`      bigint(20) DEFAULT NULL COMMENT '文件或接口资源ID',
    `calc_type`        tinyint(3) unsigned DEFAULT NULL COMMENT '接入方式: 0-API接口, 1-Python本地',
    `valid_flag`       tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效;0：无效，1：有效',
    `del_flag`         tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标志;1：已删除，0：未删除',
    `create_by`        varchar(32)       DEFAULT NULL COMMENT '创建人',
    `creator_id`       bigint(20) DEFAULT NULL COMMENT '创建人id',
    `create_time`      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`        varchar(32)       DEFAULT NULL COMMENT '更新人',
    `updator_id`       bigint(20) DEFAULT NULL COMMENT '更新人id',
    `update_time`      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`           varchar(512)      DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='模型计算任务';

INSERT INTO `model_calc` VALUES (1, NULL, 'CALC_20260727182215', '计算流量任务', 2, '机器学习', 13, '水位流量插值算法脚本', 'V1.0', NULL, '根据输入水位信息计算流量数据。', '{\"params\":[{\"key\":\"H\",\"name\":\"H\",\"title\":\"参数H\",\"value\":\"\",\"type\":\"integer\",\"rawType\":\"integer\",\"format\":\"\",\"description\":\"自定义数值参数\",\"required\":true}]}', '{\"input_water_level\":0.0,\"predict_flow\":0.0,\"fit_info\":{\"a\":7.02,\"H0\":0.0145,\"b\":1.8815,\"r2\":1.0},\"formula\":\"Q = 7.02 * (H - 0.0145)^1.8815\"}', '2026-08-04 16:37:51', '2026-08-04 16:37:56', 4887, 2, 60, 0, 3, 1, '', NULL, 1, 1, 0, '吴同', 2, '2026-07-27 18:22:16', NULL, NULL, '2026-08-05 16:25:01', '');
INSERT INTO `model_calc` VALUES (2, NULL, 'CALC_20260731152348', '千桐周报', 17, '异常检测', 9, 'qKnow_周报模板测试', 'V1.0', NULL, 'q', '{\"params\":[{\"key\":\"query\",\"name\":\"query\",\"title\":\"query\",\"value\":\"1\",\"type\":\"string\",\"rawType\":\"string\",\"format\":\"\",\"description\":\"搜索关键词、查询语句\",\"required\":false}]}', '{\"code\":200,\"data\":[{\"name\":\"报告标题\",\"key\":\"report_title\",\"value\":\"产融科技公司工作周报\"},{\"name\":\"报告期次\",\"key\":\"report_period\",\"value\":\"2026年第4期\"},{\"name\":\"报告日期范围\",\"key\":\"report_date_range\",\"value\":\"2026年1月19日-2026年1月25日\"},{\"name\":\"发布日期\",\"key\":\"publish_date\",\"value\":\"2026年1月26日\"},{\"name\":\"本周新增收入\",\"key\":\"weekly_new_revenue\",\"value\":\"45719.93万元\"},{\"name\":\"本周新增利润\",\"key\":\"weekly_new_profit\",\"value\":\"16.26万元\"},{\"name\":\"累计总收入\",\"key\":\"total_revenue\",\"value\":\"1253840.65万元\"},{\"name\":\"累计总利润\",\"key\":\"total_profit\",\"value\":\"247.33万元\"},{\"name\":\"东阳光铝-本周新增收入\",\"key\":\"dongyang_aluminum_new_revenue\",\"value\":\"151.15万元\"},{\"name\":\"东阳光铝-本周新增利润\",\"key\":\"dongyang_aluminum_new_profit\",\"value\":\"3.25万元\"},{\"name\":\"东阳光铝-累计营收\",\"key\":\"dongyang_aluminum_revenue\",\"value\":\"5682.40万元\"},{\"name\":\"东阳光铝-累计利润\",\"key\":\"dongyang_aluminum_profit\",\"value\":\"98.21万元\"},{\"name\":\"东阳光铝-本周发货量\",\"key\":\"dongyang_weekly_shipment\",\"value\":\"1325.78吨\"},{\"name\":\"东阳光铝-累计发货量\",\"key\":\"dongyang_total_shipment\",\"value\":\"32528.94吨\"},{\"name\":\"东阳光铝-12月已结算量\",\"key\":\"dongyang_dec_settled\",\"value\":\"12350.60吨\"},{\"name\":\"东阳光铝-待结算发货量\",\"key\":\"dongyang_pending_settlement\",\"value\":\"12410.35吨\"},{\"name\":\"东阳光铝-上月退回量\",\"key\":\"dongyang_returned_last_month\",\"value\":\"1320.45吨\"},{\"name\":\"东阳光铝-结算模式\",\"key\":\"dongyang_billing_model\",\"value\":\"先货后款、月末结算\"},{\"name\":\"诺德铜-本周新增收入\",\"key\":\"nuode_copper_new_revenue\",\"value\":\"72.70万元\"},{\"name\":\"诺德铜-本周新增利润\",\"key\":\"nuode_copper_new_profit\",\"value\":\"2.13万元\"},{\"name\":\"诺德铜-累计营收\",\"key\":\"nuode_copper_revenue\",\"value\":\"2876.50万元\"},{\"name\":\"诺德铜-累计利润\",\"key\":\"nuode_copper_profit\",\"value\":\"51.20万元\"},{\"name\":\"诺德铜-备注\",\"key\":\"nuode_copper_note\",\"value\":\"本周完成小批量采购，恢复运营\"},{\"name\":\"茶原料-本周新增收入\",\"key\":\"tea_raw_material_new_revenue\",\"value\":\"14.32万元\"},{\"name\":\"茶原料-本周新增利润\",\"key\":\"tea_raw_material_new_profit\",\"value\":\"0.54万元\"},{\"name\":\"茶原料-累计营收\",\"key\":\"tea_raw_material_revenue\",\"value\":\"495.60万元\"},{\"name\":\"茶原料-累计利润\",\"key\":\"tea_raw_material_profit\",\"value\":\"5.82万元\"},{\"name\":\"宜茶茶叶-本周新增收入\",\"key\":\"yicha_tea_new_revenue\",\"value\":\"148.23万元\"},{\"name\":\"宜茶茶叶-本周新增利润\",\"key\":\"yicha_tea_new_profit\",\"value\":\"2.65万元\"},{\"name\":\"宜茶茶叶-累计营收\",\"key\":\"yicha_tea_revenue\",\"value\":\"6720.35万元\"},{\"name\":\"宜茶茶叶-累计利润\",\"key\":\"yicha_tea_profit\",\"value\":\"76.10万元\"},{\"name\":\"宜茶茶叶-总贡献利润\",\"key\":\"yicha_total_contribution\",\"value\":\"81.92万元\"},{\"name\":\"涂多多-本周新增收入\",\"key\":\"tuduoduo_new_revenue\",\"value\":\"37.58万元\"},{\"name\":\"涂多多-本周新增利润\",\"key\":\"tuduoduo_new_profit\",\"value\":\"0.74万元\"},{\"name\":\"涂多多-累计营收\",\"key\":\"tuduoduo_revenue\",\"value\":\"1465.80万元\"},{\"name\":\"涂多多-累计利润\",\"key\":\"tuduoduo_profit\",\"value\":\"9.05万元\"},{\"name\":\"涂多多-备注\",\"key\":\"tuduoduo_note\",\"value\":\"聚焦大客户订单，零散业务暂停\"}],\"msg\":\"操作成功\"}', '2026-08-03 14:36:39', '2026-08-03 14:36:40', 900, 2, 60, 0, 3, 2, '', NULL, 0, 1, 0, '吴同', 2, '2026-07-31 15:23:49', NULL, NULL, '2026-08-05 16:25:01', 'w');
INSERT INTO `model_calc` VALUES (3, NULL, 'CALC_20260805161224', '水量预测任务', 1, '工业大模型', 11, '水量预测模型', 'V1.0', NULL, '基于历史水位及流量数据进行预测', '{\"params\":[{\"key\":\"query\",\"name\":\"query\",\"title\":\"query\",\"value\":\"\",\"type\":\"string\",\"rawType\":\"string\",\"format\":\"\",\"description\":\"搜索关键词、查询语句\",\"required\":false}]}', '{\"input_water_level\":8.5,\"predict_flow\":1250.0,\"fit_info\":[{\"a\":7.02,\"H0\":0.0145,\"b\":1.8815,\"r2\":1.0}],\"formula\":\"Q = 7.02 * (H - 0.0145)^1.8815\",\"image_base64\":[\"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\"],\"chart_data\":{\"dates\":[\"2026-07-01\",\"2026-07-02\",\"2026-07-03\",\"2026-07-04\",\"2026-07-05\",\"2026-07-06\",\"2026-07-07\",\"2026-07-08\",\"2026-07-09\",\"2026-07-10\"],\"predict_flow\":[1150.2,1310.5,1260.3,1350.9,1280.7,1490.6,1310.2,1520.8,1340.5,1550.3],\"actual_flow\":[1380.5,1520.8,1490.2,1580.6,1510.4,1750.3,1540.7,1780.5,1590.2,1820.9]}}', '2026-08-05 16:23:53', '2026-08-05 16:23:54', 32, 2, 60, 0, 3, 2, '', NULL, 0, 1, 0, '吴同', 2, '2026-08-05 16:12:24', NULL, NULL, '2026-08-05 16:25:01', '');


DROP TABLE IF EXISTS `model_calc_execution`;
CREATE TABLE `model_calc_execution` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `calc_id` bigint(20) NOT NULL COMMENT '计算任务ID',
    `model_id` bigint(20) NOT NULL COMMENT '模型id',
    `execution_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行批次号（yyyyMMddHHmmss）',
    `execution_mode` tinyint(4) unsigned DEFAULT NULL COMMENT '执行模式：1-手动触发 2-定时调度 3-重试执行',
    `status` tinyint(4) unsigned DEFAULT NULL COMMENT '执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中',
    `start_time` datetime DEFAULT NULL COMMENT '开始时间',
    `end_time` datetime DEFAULT NULL COMMENT '结束时间',
    `duration` int(11) DEFAULT NULL COMMENT '耗时(毫秒)',
    `input_params` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '输入参数快照(JSON，记录执行时的实际参数)',
    `output_result` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '输出结果(JSON)',
    `execution_log` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '执行日志',
    `error_message` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '错误信息',
    `retry_count` int(11) DEFAULT NULL COMMENT '当前重试次数',
    `resource_usage` varchar(3072) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源使用情况(JSON，如CPU、内存、GPU使用)',
    `valid_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效;0：无效，1：有效',
    `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志;1：已删除，0：未删除',
    `create_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
    `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
    `updator_id` bigint(20) DEFAULT NULL COMMENT '更新人id',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模型计算执行记录表';

INSERT INTO `model_calc_execution` VALUES (1, 1, 13, 'EXEC_20260805143300', 1, 2, '2026-08-05 14:33:01', '2026-08-05 14:33:06', 5246, '{\"params\":[{\"key\":\"H\",\"name\":\"H\",\"title\":\"参数H\",\"value\":\"\",\"type\":\"integer\",\"rawType\":\"integer\",\"format\":\"\",\"description\":\"自定义数值参数\",\"required\":true}]}', '{\"input_water_level\":0.0,\"predict_flow\":0.0,\"fit_info\":{\"a\":7.02,\"H0\":0.0145,\"b\":1.8815,\"r2\":1.0},\"formula\":\"Q = 7.02 * (H - 0.0145)^1.8815\"}', '[EXEC_20260805143300] 开始执行任务，calcId=1, modelId=13, engine=PythonExecutionEngine\n输入参数解析完成，共 0 个字段：{}\nPython 脚本执行成功，结果长度：141\n结果预览：{\"input_water_level\":0.0,\"predict_flow\":0.0,\"fit_info\":{\"a\":7.02,\"H0\":0.0145,\"b\":1.8815,\"r2\":1.0},\"formula\":\"Q = 7.02 * (H - 0.0145)^1.8815\"}', NULL, 0, '{\"峰值CPU使用率\":0.0,\"峰值内存使用KB\":0,\"平均CPU使用率\":0.0,\"平均内存使用KB\":0,\"执行时长毫秒\":4932,\"是否正常完成\":true,\"监控开始时间毫秒\":1785911581391,\"监控结束时间毫秒\":1785911586323,\"进程PID\":13160,\"采样次数\":0}', 1, 0, NULL, NULL, '2026-08-05 14:33:02', NULL, NULL, '2026-08-05 14:33:02', NULL);


-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `blob_data`     blob NULL COMMENT '存放持久化Trigger对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
    `calendar`      blob                                                          NOT NULL COMMENT '存放持久化calendar对象',
    PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`
(
    `sched_name`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
    `time_zone_id`    varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `entry_id`          varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '调度器实例id',
    `trigger_name`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `instance_name`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
    `fired_time`        bigint(20) NOT NULL COMMENT '触发的时间',
    `sched_time`        bigint(20) NOT NULL COMMENT '定时器制定的时间',
    `priority`          int(11) NOT NULL COMMENT '优先级',
    `state`             varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '状态',
    `job_name`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
    `job_group`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务组名',
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否并发',
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
CREATE TABLE `qrtz_job_details`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `job_name`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
    `job_group`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
    `description`       varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
    `job_class_name`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
    `is_durable`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否持久化',
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否并发',
    `is_update_data`    varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否更新数据',
    `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否接受恢复执行',
    `job_data`          blob NULL COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL,
        'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL,
        'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL,
        'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`
(
    `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `lock_name`  varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '悲观锁名称',
    PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks`
VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
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
CREATE TABLE `qrtz_scheduler_state`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `instance_name`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
    `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
    `checkin_interval`  bigint(20) NOT NULL COMMENT '检查间隔时间',
    PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`
(
    `sched_name`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `repeat_count`    bigint(20) NOT NULL COMMENT '重复的次数统计',
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
CREATE TABLE `qrtz_simprop_triggers`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `str_prop_1`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
    `str_prop_2`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
    `str_prop_3`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
    `int_prop_1`    int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
    `int_prop_2`    int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
    `long_prop_1`   bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
    `long_prop_2`   bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
    `dec_prop_1`    decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
    `dec_prop_2`    decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
    `bool_prop_1`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
    `bool_prop_2`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`
(
    `sched_name`     varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
    `trigger_group`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
    `job_name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
    `job_group`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
    `description`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
    `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
    `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
    `priority`       int(11) NULL DEFAULT NULL COMMENT '优先级',
    `trigger_state`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '触发器状态',
    `trigger_type`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '触发器的类型',
    `start_time`     bigint(20) NOT NULL COMMENT '开始时间',
    `end_time`       bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
    `calendar_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
    `misfire_instr`  smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
    `job_data`       blob NULL COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    INDEX            `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1723915630000, -1, 5,
        'PAUSED', 'CRON', 1723915630000, 0, NULL, 2, NULL);
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1723915635000, -1, 5,
        'PAUSED', 'CRON', 1723915631000, 0, NULL, 2, NULL);
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1723915640000, -1, 5,
        'PAUSED', 'CRON', 1723915632000, 0, NULL, 2, NULL);

-- ----------------------------
-- Table structure for rel_user_auth_product
-- ----------------------------
DROP TABLE IF EXISTS `rel_user_auth_product`;
CREATE TABLE `rel_user_auth_product`
(
    `user_id`           bigint(20) NOT NULL COMMENT '用户ID',
    `auth_id`           varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统一身份认证id',
    `auth_product_type` int(11) NOT NULL COMMENT '认证平台类型;0：冰凤框架；1：微信；2：支付宝',
    PRIMARY KEY (`user_id`, `auth_id`, `auth_product_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与认证中心关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rel_user_auth_product
-- ----------------------------

-- ----------------------------
-- Table structure for model_audit
-- ----------------------------
DROP TABLE IF EXISTS `model_audit`;
CREATE TABLE `model_audit`
(
    `id`           bigint   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `model_id`     bigint   NOT NULL COMMENT '模型id',
    `apply_id`     bigint   NOT NULL COMMENT '申请人',
    `apply_time`   datetime NOT NULL COMMENT '申请时间',
    `apply_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请理由',
    `audit_status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '审核状态;0：待审核，1：审核通过，2：审核拒绝',
    `auditor_id`   bigint NULL DEFAULT NULL COMMENT '审核人',
    `audit_time`   datetime NULL DEFAULT NULL COMMENT '审核时间',
    `audit_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核理由',
    `valid_flag`   tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
    `del_flag`     tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
    `create_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`   bigint NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id`   bigint NULL DEFAULT NULL COMMENT '更新人id',
    `update_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`       varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型审核' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_key
-- ----------------------------
DROP TABLE IF EXISTS `model_key`;
CREATE TABLE `model_key`  (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `user_id` bigint NOT NULL COMMENT '用户id',
    `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密钥名称',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
    `api_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'key',
    `last_use_time` datetime NULL DEFAULT NULL COMMENT '最后使用时间',
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型访问 key' ROW_FORMAT = DYNAMIC;
SET
FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for model_version
-- ----------------------------
DROP TABLE IF EXISTS `model_version`;
CREATE TABLE `model_version`  (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `model_id` bigint NOT NULL COMMENT '模型id',
    `model_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本号',
    `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
    `digest` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '版本摘要',
    `base_version` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '基础版本',
    `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
    `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
    `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人id',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `model_version_un`(`model_id` ASC, `model_version` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型版本表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_version
-- ----------------------------
INSERT INTO `model_version` VALUES (1, 1, 'V1.0', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (2, 2, 'V2.0', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (3, 3, 'V1.5', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (4, 4, 'V1.0', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (5, 5, 'V2.3', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (6, 6, 'V1.2', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (7, 7, 'V3.0', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (8, 8, 'v1.0', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (9, 9, 'V1.0', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (10, 10, 'V1.0', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);
INSERT INTO `model_version` VALUES (11, 11, 'V1.0', NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-09-01 11:38:10', NULL, NULL, '2026-09-01 11:38:10', NULL);

SET FOREIGN_KEY_CHECKS = 1;