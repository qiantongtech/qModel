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


DROP TABLE IF EXISTS `model_audit`;
CREATE TABLE `model_audit`  (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                `model_id` bigint NOT NULL COMMENT '模型id',
                                `apply_id` bigint NOT NULL COMMENT '申请人',
                                `apply_time` datetime NOT NULL COMMENT '申请时间',
                                `apply_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请理由',
                                `audit_status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '审核状态;0：待审核，1：审核通过，2：审核拒绝',
                                `auditor_id` bigint NULL DEFAULT NULL COMMENT '审核人',
                                `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
                                `audit_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核理由',
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型审核' ROW_FORMAT = Dynamic;


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
                              `input_params` longtext COMMENT '输入参数(JSON格式)',
                              `output_result` longtext COMMENT '输出结果(JSON格式)',
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


DROP TABLE IF EXISTS `model_audit`;
CREATE TABLE `model_audit`  (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                `model_id` bigint NOT NULL COMMENT '模型id',
                                `apply_id` bigint NOT NULL COMMENT '申请人',
                                `apply_time` datetime NOT NULL COMMENT '申请时间',
                                `apply_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请理由',
                                `audit_status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '审核状态;0：待审核，1：审核通过，2：审核拒绝',
                                `auditor_id` bigint NULL DEFAULT NULL COMMENT '审核人',
                                `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
                                `audit_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核理由',
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型审核' ROW_FORMAT = Dynamic;


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
