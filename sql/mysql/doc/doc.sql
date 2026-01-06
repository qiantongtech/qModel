/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
 */

/*
 Navicat Premium Data Transfer

 Source Server         : 冰风框架
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 110.42.38.62:3306
 Source Schema         : anivia_dev

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 20/12/2024 14:23:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for doc_base
-- ----------------------------
DROP TABLE IF EXISTS `doc_base`;
CREATE TABLE `doc_base`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `intro` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `type` int(11) NULL DEFAULT NULL COMMENT '知识分类',
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '知识主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_base
-- ----------------------------
INSERT INTO `doc_base` VALUES (1, '知识库测试', '知识库简介1', NULL, 1, 0, 'admin', 1, '2024-12-17 15:51:10', NULL, NULL, '2024-12-17 15:51:13', NULL);
INSERT INTO `doc_base` VALUES (2, '专题名称专题名称', '专题简介专题简介专题简介', NULL, 1, 0, 'admin', 1, '2024-12-19 09:36:31', 'admin', 1, '2024-12-19 14:52:44', '');


-- ----------------------------
-- Table structure for rel_doc_file
-- ----------------------------
DROP TABLE IF EXISTS `rel_doc_file`;
CREATE TABLE `rel_doc_file`  (
                                 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                 `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父id',
                                 `knowledge_id` bigint(20) NULL DEFAULT NULL COMMENT '知识id',
                                 `file_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
                                 `file_url` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件地址',
                                 `file_intro` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件描述',
                                 `file_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
                                 `file_size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小',
                                 `folder_flag` tinyint(1) NULL DEFAULT NULL COMMENT '是否是文件夹',
                                 `valid_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
                                 `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
                                 `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
                                 `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
                                 `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
                                 `updator_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '知识文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rel_doc_file
-- ----------------------------
INSERT INTO `rel_doc_file` VALUES (1, NULL, 2, '千桐工作法', 'https://s.mingzhu.online/2024/12/19/6763cf83d2f8651f624e3c88.docx', 'scrum敏捷开发工作法内容', 'gis', 25118, NULL, 1, 0, 'admin', 1, '2024-12-18 14:24:29', 'admin', 1, '2024-12-20 09:14:49', NULL);
INSERT INTO `rel_doc_file` VALUES (3, NULL, 2, '弹窗代码', 'https://s.qiantongkeji.com/2024/12/20/6764d5b9d2f86b6b59c574bc.png', '水利地图弹窗', 'png', 735888, NULL, 1, 0, 'admin', 1, '2024-12-19 10:46:48', 'admin', 1, '2024-12-20 10:26:03', NULL);
INSERT INTO `rel_doc_file` VALUES (4, NULL, 2, '图片示例', 'https://s.mingzhu.online/2024/12/20/6764c522d2f8c31b4ed2bb6d.png', NULL, 'mp4', 735888, NULL, 1, 0, '金鹏', 1, '2024-12-19 10:47:53', '金鹏', 1, '2024-12-20 09:15:15', NULL);
INSERT INTO `rel_doc_file` VALUES (5, NULL, 2, 'sql图片示例件', 'https://s.mingzhu.online/2024/12/19/6763d743d2f8651f624e3c8d.png', 'anivia_ai_dev.sql文件', 'text', 131849, NULL, 1, 0, 'wangming', 1, '2024-12-19 10:49:40', 'wangming', 1, '2024-12-19 16:20:20', NULL);
INSERT INTO `rel_doc_file` VALUES (6, NULL, 1, 'ces', 'https://s.mingzhu.online/2024/12/19/6763c22855f09e631fcf4f1a.txt', NULL, 'txt', 376, NULL, 1, 1, 'admin', 1, '2024-12-19 14:50:22', NULL, NULL, '2024-12-19 14:50:22', NULL);
INSERT INTO `rel_doc_file` VALUES (7, NULL, 1, '测试', 'https://s.mingzhu.online/2024/12/19/6763c24855f09e631fcf4f1b.xmind', NULL, 'xmind', 347554, NULL, 1, 1, 'admin', 1, '2024-12-19 14:50:49', NULL, NULL, '2024-12-19 14:50:50', NULL);
INSERT INTO `rel_doc_file` VALUES (8, NULL, 1, '测试', 'https://s.mingzhu.online/2024/12/19/6763c26c55f09e631fcf4f1c.wav', '这是音频文件', 'wav', 177572, NULL, 1, 1, 'admin', 1, '2024-12-19 14:51:25', 'admin', 1, '2024-12-20 09:14:10', NULL);
INSERT INTO `rel_doc_file` VALUES (9, NULL, 1, '测试txt', 'https://s.qiantongkeji.com/2024/12/20/6764dfafd2f86b6b59c574bd.txt', NULL, 'txt', 140313, NULL, 1, 0, 'admin', 1, '2024-12-20 11:08:33', NULL, NULL, '2024-12-20 11:08:36', NULL);

SET FOREIGN_KEY_CHECKS = 1;
