/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : qmodel

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 22/01/2026 11:49:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_client
-- ----------------------------
DROP TABLE IF EXISTS `auth_client`;
CREATE TABLE `auth_client`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `secret_key` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '应用秘钥',
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '应用名称',
  `type` int NOT NULL COMMENT '应用类型;0：Web，1：App，2：小程序',
  `icon` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '应用图标',
  `home_url` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '应用首页',
  `sync_url` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '同步地址',
  `redirect_url` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '允许授权的url',
  `public_flag` tinyint NOT NULL DEFAULT 1 COMMENT '是否公开',
  `valid_flag` tinyint NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id;创建者的sys_user_id',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `update_by` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id;更新者的sys_user_id',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_10384222948100`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '应用管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_client
-- ----------------------------

-- ----------------------------
-- Table structure for auth_client_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_client_user`;
CREATE TABLE `auth_client_user`  (
  `client_id` bigint NOT NULL COMMENT '应用ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `open_id` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'open_id'
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '应用和用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_client_user
-- ----------------------------

-- ----------------------------
-- Table structure for ca_cert
-- ----------------------------
DROP TABLE IF EXISTS `ca_cert`;
CREATE TABLE `ca_cert`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID;ID',
  `name` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '证书名称',
  `subject_id` int NOT NULL COMMENT '主体id',
  `subject_name` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主体名称',
  `certificate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '证书;证书',
  `private_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '私钥;私钥',
  `issuer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '颁发者',
  `possessor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '所有者',
  `valid_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '有效期',
  `valid_flag` int NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(900) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注;备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_10372590728100`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '证书管理' ROW_FORMAT = Dynamic;

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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID;主体ID',
  `name` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主体名称;主体名称',
  `cn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '通用名称;通用名称',
  `ou` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '组织部门;组织单位名称',
  `o` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '组织名称',
  `l` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '城市名称',
  `st` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '省名称',
  `c` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '国家',
  `certificate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '证书;证书',
  `private_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '私钥;私钥',
  `valid_flag` int NOT NULL DEFAULT 1 COMMENT '是否有效;是否有效 0：无效，1：有效',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '删除标志;删除标志 1：已删除，0：未删除',
  `create_by` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人;创建人',
  `creator_id` int NULL DEFAULT NULL COMMENT '创建人id;创建人id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间;创建时间',
  `update_by` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人;更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间;更新时间',
  `remark` varchar(900) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注;备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_10372596916200`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '主体管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_subject
-- ----------------------------
INSERT INTO `ca_subject` VALUES (9, '江苏千桐科技有限公司', '江苏千桐科技有限公司', '技术部', '技术部', '南京', '江苏', '中国', '/profile/ca/2024/10/23/6718d658a921cf6536292242.cer', '/profile/ca/2024/10/23/6718d658a921cf6536292243.pem', 1, 0, 'admin', 1, '2024-10-23 18:56:25', NULL, NULL, NULL);
INSERT INTO `ca_subject` VALUES (10, '12', '12', '12', '12', '12', '12', '12', '/profile/ca/2024/12/09/6756abdbe2f804e7283bef9b.cer', '/profile/ca/2024/12/09/6756abdbe2f804e7283bef9c.pem', 1, 0, 'admin', 1, '2024-12-09 16:35:39', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for example_dept
-- ----------------------------
DROP TABLE IF EXISTS `example_dept`;
CREATE TABLE `example_dept`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父部门id',
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `leader` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` int NOT NULL DEFAULT 0 COMMENT '部门状态',
  `valid_flag` tinyint NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_10384217610800`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '示例部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example_dept
-- ----------------------------
INSERT INTO `example_dept` VALUES (1, 0, '千桐科技', '张三', 'xxxxxxxx', 'xxxxxxx', 0, 1, 0, 'admin', 1, '2024-11-27 00:00:00', 'admin', 1, '2024-12-09 13:19:22', '测试数据');
INSERT INTO `example_dept` VALUES (2, 1, '郑州总部', '李四', NULL, NULL, 0, 1, 0, 'admin', 1, '2024-11-27 00:00:00', 'admin', 1, '2024-11-29 14:51:43', '总部测试');
INSERT INTO `example_dept` VALUES (3, 1, '老君山', '君山', NULL, NULL, 1, 1, 0, 'admin', 1, '2024-11-27 15:11:40', NULL, NULL, '2024-11-27 15:11:39', NULL);
INSERT INTO `example_dept` VALUES (4, 0, '千桐测试', NULL, NULL, NULL, 0, 1, 1, 'admin', 1, '2024-11-28 09:52:38', NULL, NULL, '2024-11-28 09:52:42', NULL);
INSERT INTO `example_dept` VALUES (5, 1, '子部门1', NULL, NULL, NULL, 1, 1, 1, 'admin', 1, '2024-11-28 00:00:00', 'admin', 1, '2024-11-28 16:40:44', NULL);
INSERT INTO `example_dept` VALUES (6, 4, '子部门2', NULL, NULL, NULL, 1, 1, 1, 'admin', 1, '2024-11-28 09:53:00', NULL, NULL, '2024-11-28 09:53:03', NULL);
INSERT INTO `example_dept` VALUES (7, 6, '孙部门1', NULL, NULL, NULL, 0, 1, 1, 'admin', 1, '2024-11-28 09:53:13', NULL, NULL, '2024-11-28 09:53:17', NULL);
INSERT INTO `example_dept` VALUES (8, 1, '孙部门1', NULL, NULL, NULL, 0, 1, 1, 'admin', 1, '2024-11-28 00:00:00', 'admin', 1, '2024-11-28 16:42:03', NULL);
INSERT INTO `example_dept` VALUES (9, 9, '孙孙部门222', NULL, NULL, NULL, 1, 1, 0, 'admin', 1, '2024-11-28 00:00:00', 'admin', 1, '2024-11-28 16:44:38', NULL);
INSERT INTO `example_dept` VALUES (10, 0, '测试1', NULL, NULL, NULL, 0, 1, 1, 'admin', 1, '2024-11-28 16:49:08', NULL, NULL, '2024-11-28 16:49:12', NULL);
INSERT INTO `example_dept` VALUES (11, 1, '子测试1', NULL, NULL, NULL, 0, 1, 1, 'admin', 1, '2024-11-28 00:00:00', 'admin', 1, '2024-11-28 16:50:21', NULL);
INSERT INTO `example_dept` VALUES (12, 11, '孙测试1', NULL, NULL, NULL, 1, 1, 1, 'admin', 1, '2024-11-28 16:49:31', NULL, NULL, '2024-11-28 16:49:35', NULL);
INSERT INTO `example_dept` VALUES (13, 1, '测试部门123', '23', '1112223', '44444', 1, 1, 0, 'admin', 1, '2024-11-29 00:00:00', 'admin', 1, '2024-12-23 09:17:09', NULL);
INSERT INTO `example_dept` VALUES (14, 13, '测试子部门1', NULL, NULL, NULL, 0, 1, 1, 'admin', 1, '2024-11-29 09:51:34', NULL, NULL, '2024-11-29 09:51:38', NULL);
INSERT INTO `example_dept` VALUES (15, 13, '测试子部门23', NULL, NULL, NULL, 0, 1, 0, 'admin', 1, '2024-11-29 00:00:00', 'admin', 1, '2024-12-09 12:03:17', NULL);
INSERT INTO `example_dept` VALUES (16, 15, '测试孙部门1', NULL, NULL, NULL, 0, 1, 1, 'admin', 1, '2024-11-29 11:27:27', NULL, NULL, '2024-11-29 11:27:31', NULL);
INSERT INTO `example_dept` VALUES (17, 1, NULL, NULL, NULL, NULL, 0, 1, 1, 'admin', 1, '2024-11-29 15:18:40', NULL, NULL, '2024-11-29 15:18:45', NULL);
INSERT INTO `example_dept` VALUES (18, 0, '测试顶级部门2', NULL, NULL, NULL, 0, 1, 0, 'admin', 1, '2024-12-06 15:52:50', NULL, NULL, '2024-12-06 15:52:53', NULL);

-- ----------------------------
-- Table structure for example_student
-- ----------------------------
DROP TABLE IF EXISTS `example_student`;
CREATE TABLE `example_student`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓名',
  `picture_url` varchar(3072) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '学生照',
  `experience` varchar(3072) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教育经历',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '生日',
  `age` int NOT NULL COMMENT '年龄',
  `student_number` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '学号',
  `grade` int NULL DEFAULT NULL COMMENT '班级',
  `hobby` varchar(3072) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `valid_flag` tinyint NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updator_id` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_10384054675500`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 82 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '学生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example_student
-- ----------------------------
INSERT INTO `example_student` VALUES (77, '2', NULL, NULL, NULL, '2025-02-11 00:00:00', 23, NULL, NULL, NULL, 1, 0, 'admin', 1, '2025-02-18 15:20:22', 'admin', 1, '2025-02-18 15:22:48', NULL);
INSERT INTO `example_student` VALUES (78, '25', NULL, NULL, NULL, '2025-02-14 00:00:00', 35, NULL, NULL, NULL, 1, 0, 'admin', 1, '2025-02-18 15:22:58', 'admin', 1, '2025-02-18 15:29:36', NULL);
INSERT INTO `example_student` VALUES (79, '2', NULL, NULL, NULL, '2025-02-06 00:00:00', 3, NULL, NULL, NULL, 1, 0, 'admin', 1, '2025-02-18 15:37:17', 'admin', 1, '2025-02-18 15:37:17', NULL);
INSERT INTO `example_student` VALUES (80, '3', NULL, NULL, NULL, '2025-02-07 00:00:00', 45, NULL, NULL, NULL, 1, 0, 'admin', 1, '2025-02-18 15:37:24', 'admin', 1, '2025-02-18 15:37:33', NULL);
INSERT INTO `example_student` VALUES (81, '4', NULL, NULL, NULL, '2025-02-12 00:00:00', 57, NULL, NULL, NULL, 1, 0, 'admin', 1, '2025-02-18 15:48:28', 'admin', 1, '2025-02-18 15:48:34', NULL);

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业id',
  `CLASSIFY_ID` int NULL DEFAULT NULL COMMENT '分类id',
  `ANCESTORS` varchar(510) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '父级和自己id',
  `NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型名称',
  `DESCRIPTION` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型介绍',
  `TYPE` int NULL DEFAULT NULL COMMENT '所属模型类别 0：水文，1：水动力，2：水质',
  `DIMENSIONS` int NULL DEFAULT NULL COMMENT '所属纬度 0：一维，1：二维，2：三维',
  `VERSION` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型版本号',
  `INTERFACE_ADDRESS` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型调用接口',
  `BUILTIN` int NULL DEFAULT NULL COMMENT '是否内置 0：否，1：是',
  `FORMAT` int NULL DEFAULT NULL COMMENT '模型格式',
  `SIZE` int NULL DEFAULT NULL COMMENT '模型大小 0：exe格式',
  `SOURCE` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据来源',
  `UPLOAD_STATUS` int NULL DEFAULT NULL COMMENT '上传状态',
  `UPLOAD_TIME` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  `UPLOAD_INTERFACE` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传接口',
  `UPLOAD_FILE` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传文件',
  `UPLOAD_LOCATION` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `VALID_FLAG` int NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` int NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` int NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` int NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384061981400`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模型管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model
-- ----------------------------

-- ----------------------------
-- Table structure for model_cacl
-- ----------------------------
DROP TABLE IF EXISTS `model_cacl`;
CREATE TABLE `model_cacl`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业id',
  `CODE` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '计算编码',
  `NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '计算名称',
  `MODEL_ID` int NULL DEFAULT NULL COMMENT '模型id',
  `MODEL_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型名称',
  `MODEL_VERSION` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型版本',
  `START_TIME` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `END_TIME` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `STATUS` int NULL DEFAULT NULL COMMENT '计算状态',
  `INPUT_CONTENT` varchar(6144) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型输入内容',
  `OUTPUT_CONTENT` varchar(6144) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型输出内容',
  `VALID_FLAG` int NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` int NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` int NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `CREATE_TIME` timestamp NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` int NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `UPDATE_TIME` timestamp NOT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384068058800`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模型计算管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_cacl
-- ----------------------------

-- ----------------------------
-- Table structure for model_cacl_reconstitution
-- ----------------------------
DROP TABLE IF EXISTS `model_cacl_reconstitution`;
CREATE TABLE `model_cacl_reconstitution`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业id',
  `CODE` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '计算编码',
  `NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '计算名称',
  `MODEL_ID` int NULL DEFAULT NULL COMMENT '模型id',
  `MODEL_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型名称',
  `MODEL_VERSION` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型版本',
  `START_TIME` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `END_TIME` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `STATUS` int NULL DEFAULT NULL COMMENT '计算状态',
  `INPUT_CONTENT` varchar(6144) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型输入内容',
  `OUTPUT_CONTENT` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '模型输出内容',
  `VALID_FLAG` int NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` int NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` int NULL DEFAULT NULL COMMENT '创建人id',
  `CREATE_TIME` timestamp NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` int NULL DEFAULT NULL COMMENT '更新人id',
  `UPDATE_TIME` timestamp NOT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ADDRESS_ID` int NULL DEFAULT NULL COMMENT '文件或接口地址id',
  `ADDRESS_TYPE` int NULL DEFAULT NULL COMMENT '判断是文件的id还是地址的id，0:文件，1：接口',
  `MP_PROGRAMME_ID` int NULL DEFAULT NULL COMMENT '文件计算的历史方案id',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384073932500`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模型计算重构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_cacl_reconstitution
-- ----------------------------
INSERT INTO `model_cacl_reconstitution` VALUES (3, NULL, NULL, '来水量', 7, '来水预测模型', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 'admin', 1, '2025-12-11 13:49:48', NULL, NULL, '2025-12-11 13:49:48', NULL, NULL, 1, NULL);
INSERT INTO `model_cacl_reconstitution` VALUES (4, NULL, NULL, '入库流量', 7, '来水预测模型', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 'admin', 1, '2025-12-11 13:50:24', NULL, NULL, '2025-12-11 13:50:24', NULL, NULL, 1, NULL);
INSERT INTO `model_cacl_reconstitution` VALUES (5, NULL, NULL, '水位计算', 10, '水土保持模型', '1', NULL, NULL, 0, NULL, NULL, 1, 0, '小桐', 1, '2025-12-31 18:22:00', NULL, NULL, '2025-12-31 18:22:00', NULL, NULL, 0, NULL);
INSERT INTO `model_cacl_reconstitution` VALUES (6, NULL, NULL, 'avq', 12, '流量是计算', '2', '2026-01-21 15:41:14', '2026-01-21 15:41:14', 2, '{\"success\":true,\"errorCode\":\"2000\",\"message\":\"操作成功\",\"data\":[{\"buildingId\":\"SGJZ00000849\",\"buildingName\":\"西泵站 5#机组\",\"buildingType\":\"100008\",\"buildingTypeName\":\"泵站\",\"useable\":true,\"realFlow\":3,\"pumpSate\":3,\"maxTheoryFlow\":8,\"minTheoryFlow\":4}]}', '{\"data\":[0.0,0.0,0.0,1.2427905114591766,3.1020725448322852,6.870074077654037,13.636834180457212,18.874605990705735,23.476188883749202,27.79405342829416,37.33358287235341,52.63983773350419,74.70931780382192,95.46579058109516,110.19415112364784,112.22872668974202,109.69065142162646,113.17366569389996,118.20369823427129,124.59372597530198,129.56332489658763,131.89507127732998,132.0682737750803,129.45668925476187,0.490526010180646,118.80979541832136]}', 1, 0, '小桐', 1, '2026-01-15 10:04:36', '小桐', 1, '2026-01-21 15:41:14', NULL, NULL, 0, NULL);
INSERT INTO `model_cacl_reconstitution` VALUES (7, NULL, NULL, '测试', 7, '来水预测模型', 'v1.0', NULL, NULL, 0, NULL, NULL, 1, 0, '小桐', 1, '2026-01-15 11:10:17', '小桐', 1, '2026-01-15 11:10:17', NULL, 2, 1, NULL);
INSERT INTO `model_cacl_reconstitution` VALUES (8, NULL, NULL, '接口计算', 13, '接口服务类', '1', '2026-01-22 09:12:29', '2026-01-22 09:12:29', 1, '{\"code\":\"1\",\"data\":\"test\"}', '{\"msg\":\"操作成功\",\"img\":\"/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAA8AKADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDtrW1ga1hZoIySikkoOeKsCztv+feL/vgU2z/484P+ua/yqyKiMY8q0IjGPKtCIWdr/wA+0P8A3wKeLK1/59of+/YqUU7pT5Y9h8sexELK0/59Yf8Av2KcLG0/59YP+/YqhJ4k0WG8+yS6paRzg4KNKBz6fX2rWjdXUMrAg8gg9auVFxtzRtfyDlj2IxYWf/PrB/37FOFhZ/8APpB/37FV9V1mw0OyN5qNwIIAwXeVLcnoMAE1dgmSeJJY2yjqGU+oNJ0rRUnHR9bByx7DRp9l/wA+lv8A9+x/hThp1l/z52//AH6X/CptwHU0yG8tpnKxTxOy8EK4JFLkXYOWPYBp1j/z52//AH6X/CnDTbH/AJ8rf/v0v+FWBThS5Y9g5Y9iuNMsP+fK2/79L/hTxplh/wA+Nt/36X/CrArP1PxBpOihf7Rv4LYv90SNyfoOtVClzvljG79A5Y9i0NL0/wD58bb/AL8r/hTxpWn/APPha/8Aflf8Ki07WNN1WPzLC+t7lPWGUNj646VoDmlKmouzVmHLHsVhpWnf8+Fr/wB+V/wpw0nTv+gfa/8Aflf8KtCnilyx7Byx7FUaTpv/AED7T/vyv+FVtT0vT49IvXSxtVdYHKsIVBB2nkcVrCqurf8AIFv/APr3k/8AQTSlGPK9BSjHlehyVn/x5wf9c1/lVkVXs/8Ajzg/65r/ACqyKcfhQ4/Chwqjqc5itJArbSVIB9KvgVR1K3M1uwHpVFHzrb2UcuuyWmpSSRsXYFwed2fU+tdlo/iXVPBN1HBdzPe6NK2FYnLR/T0+n5UniPwubidnX93MPuvj+dc3f3+oQafJp+oWm/PCzdvr7n8q+5p47+1eSOjTSUoOya/vwb/I5nHk/wAzsvHGq6jqNjcTRXtpJo8qI0aFctkdwcdc/Wk8E+KNbl1i3S9v08logi2sq7QycfMh7kY/nXFaTdtaslhfrus7jBUPyFPrXoNt4ahubJbeWLMQGUKnBQ9ip7GuHGVKeCpfVKkFKLvyzSW1kr/4rrXb1KinJ8yM74r6vfSXdrbR3EiWTISyqxAZs9/Wub+w3WhRW+saNfyO8YDvjjA69O49a67xJoMl1py28sjyMg+WV+ufWuR0O9fT7ttK1EbAThGbp9Poe1a4DHTeBUMMk3Tb5o2+OL6/L+uwpR9676nsWhfEGwv/AAw2rTq4NuALuOJdxi9Wx12+/pn0Natn488L3se+LXLJR6TSiI/k+DXhTvceENaF7ZjdZzZWSFuQynqp/of8ma703wu9vHfbrq2gl+75ZyoPp0OK5Z5bgW1UTlyVPhcVe3eLW9103uilOW3VHtF38RvC1vOluNYt5JJGCDysuoJ45YDAHvmvLfG/h+/1XxTPqD3MUlu7KFQsdyqAOAMY9e9YMN54R085WxuL9x0MrYH9P5V2fhXxLp3ibUBp0tqLOXbi3UybhJjsOBg47Vp9VxGXJ4nBQmkk1JzSX3LcXMp+7JmEnhm504i88P6pc292mCFZ9u72yP5GvRPhz8RpdfmfSNXRY9TiU4YDaJQOuR2b2+tLrWi/YbCWWFcuqkqB3NeXfDt2k8cpcyv+8UOxHqTxU0KksywNeeLs3TV1L7Xp5r1BrkkuXqfTqnIqQVUsnLwqT6VcFfLm44VV1b/kCX//AF7Sf+gmrYqrq/8AyBL/AP69pP8A0E1MvhZMvhZyVn/x5Qf9c1/lVkVXsv8Ajyg/65r/ACqyKI/Cgj8KHClKhhg0CniqKMfUNJSdSdozXmvi7R7+CEyWR5X7yYySPavYyuRWFq+lfaUOBWtCr7Koqlk7dGrp+omrqx8+TS3epCK2+ysZlPUDr/hXvnhW2f8Asa1juDulSNVY+pArn4vC7/ad23jNdzpNl9mhVT2r0MfmSxVOFGnTUIxu7K71e+/TyJjDld2yHUdISeEgLzXm3iXwrHdoVddki/ckA5H+Ir2XaCMGsy/0mO5U/LzXn0K9ShUVSk7SXUppNWZ86al/a1naNZXiCeHosvU/n/jV7whbPfW13ZTxF7ZwDg5xmvStU8JNI5KrV7QPDH2ZvmT68V7NTPHPCyoKkottO601XW3R+hmqVpXucfZ+EreCQGGyQHsWG4/rXeaFYTRhVdBtBBAI6V08GlwoB8gq7FbInRRXi1KtSq+apJt+buaJJbGTq1o01kRjtXi3iGKbwnqUep2On27zSyEebIrMVcjsAe4z+tfQkkQdCMVzWoaOXnDqvQ1thMT9XqqclzR6q7Sa7OwpK6NLwtqY1XQrS88p4WljDNG4IKnuOffNb4rH0m3eGMBq2Vrmk022lZFDhVXV/wDkCX//AF7Sf+gmrYqrq/8AyBL/AP69pP8A0E1EvhZMvhZyVl/x5W//AFzX+VWRXMxa1cxRJGqREIoUZB7fjUn9v3X/ADzh/wC+T/jWUa0bIzjVjZHSinCuZ/4SG7/55wf98n/Gl/4SK7/55wf98n/Gq9tEftonUCl2Butcv/wkl5/zyg/75P8AjS/8JLef88oP++T/AI0e2iHtonTrAgOcCp1UCuS/4Se9/wCeVv8A98t/jS/8JRe/88rf/vlv8aPbRD20TrxT8Zrjv+Eqvv8Anlb/APfLf40v/CV33/PK2/75b/Gj20Q9tE68wo3UCnpCq9BXHf8ACW3/APzxtv8Avlv8aX/hL9Q/5423/fLf/FUe2iHtonbAU8Vw/wDwmGof88bX/vlv/iqX/hMtR/542v8A3y3/AMVR7aIe2id0BQYlbqK4b/hM9R/542v/AHw3/wAVS/8ACa6l/wA8LT/vhv8A4qj20Q9tE7xEC9KkFcB/wm2pf88LT/vhv/iqX/hONT/54Wn/AHw3/wAVR7aIe2iegiqur/8AID1D/r2k/wDQTXFf8Jzqf/PC0/74b/4qo7nxnqN1azW7w2oSVGRiqtkAjHHzVMq0bMUqsbM//9k=\",\"code\":200,\"captchaEnabled\":true,\"uuid\":\"aaa3320d3c434fad8839aee78aa14a8b\"}', 1, 0, '小桐', 1, '2026-01-20 13:20:56', '小桐', 1, '2026-01-22 09:12:29', NULL, 3, 1, NULL);

-- ----------------------------
-- Table structure for model_classify
-- ----------------------------
DROP TABLE IF EXISTS `model_classify`;
CREATE TABLE `model_classify`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业id',
  `PARENT_ID` int NULL DEFAULT NULL COMMENT '父级id',
  `ANCESTORS` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '祖籍列表',
  `NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `DESCRIPTION` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `VALID_FLAG` int NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` int NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` int NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `CREATE_TIME` timestamp NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` int NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `UPDATE_TIME` timestamp NOT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384079295300`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模型分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_classify
-- ----------------------------
INSERT INTO `model_classify` VALUES (1, NULL, 0, '0', '产汇', NULL, 1, 1, 'admin', 1, '2025-11-14 18:32:07', NULL, NULL, '2025-12-31 13:58:55', NULL);
INSERT INTO `model_classify` VALUES (2, NULL, 1, '0,1', '产汇流', '产汇流信息', 1, 1, 'admin', 1, '2025-11-14 18:32:20', '小桐', 1, '2026-01-07 14:09:39', '备注');
INSERT INTO `model_classify` VALUES (3, NULL, 2, '0,1,2', '产汇子流', NULL, 1, 1, 'admin', 1, '2025-12-11 10:11:02', '小桐', 1, '2026-01-07 14:09:38', NULL);
INSERT INTO `model_classify` VALUES (4, NULL, 0, '0', '水文预报', NULL, 1, 0, '小桐', 1, '2025-12-31 14:01:40', NULL, NULL, '2025-12-31 14:01:40', NULL);
INSERT INTO `model_classify` VALUES (5, NULL, 0, '0', '水文预报', NULL, 1, 1, '小桐', 1, '2025-12-31 14:01:40', NULL, NULL, '2025-12-31 14:01:40', NULL);
INSERT INTO `model_classify` VALUES (6, NULL, 4, '0,4', '降雨径流模型', NULL, 1, 1, '小桐', 1, '2025-12-31 14:01:55', NULL, NULL, '2025-12-31 14:01:55', NULL);
INSERT INTO `model_classify` VALUES (7, NULL, 4, '0,4', '洪水演进模型', NULL, 1, 1, '小桐', 1, '2025-12-31 14:02:03', NULL, NULL, '2025-12-31 14:02:03', NULL);
INSERT INTO `model_classify` VALUES (8, NULL, 4, '0,4', '产汇流模型', NULL, 1, 0, '小桐', 1, '2025-12-31 14:02:11', NULL, NULL, '2025-12-31 14:02:10', NULL);
INSERT INTO `model_classify` VALUES (9, NULL, 4, '0,4', '实时洪水预报', NULL, 1, 0, '小桐', 1, '2025-12-31 14:02:18', NULL, NULL, '2025-12-31 14:02:17', NULL);
INSERT INTO `model_classify` VALUES (10, NULL, 4, '0,4', '中长期水文预测', NULL, 1, 1, '小桐', 1, '2025-12-31 14:02:27', NULL, NULL, '2025-12-31 14:02:26', NULL);
INSERT INTO `model_classify` VALUES (11, NULL, 0, '0', '水工程安全', NULL, 1, 0, '小桐', 1, '2025-12-31 14:02:38', NULL, NULL, '2025-12-31 14:02:37', NULL);
INSERT INTO `model_classify` VALUES (12, NULL, 11, '0,11', '大坝渗流分析', NULL, 1, 0, '小桐', 1, '2025-12-31 14:02:45', NULL, NULL, '2025-12-31 14:02:44', NULL);
INSERT INTO `model_classify` VALUES (13, NULL, 11, '0,11', '堤防稳定性模型', NULL, 1, 0, '小桐', 1, '2025-12-31 14:02:51', NULL, NULL, '2025-12-31 14:02:50', NULL);
INSERT INTO `model_classify` VALUES (14, NULL, 11, '0,11', '溃坝风险模拟', NULL, 1, 0, '小桐', 1, '2025-12-31 14:02:57', NULL, NULL, '2025-12-31 14:02:56', NULL);
INSERT INTO `model_classify` VALUES (15, NULL, 11, '0,11', '泵站运行仿真', NULL, 1, 0, '小桐', 1, '2025-12-31 14:03:02', NULL, NULL, '2025-12-31 14:03:02', NULL);
INSERT INTO `model_classify` VALUES (16, NULL, 11, '0,11', '渡槽结构安全评估', NULL, 1, 0, '小桐', 1, '2025-12-31 14:03:08', NULL, NULL, '2025-12-31 14:03:07', NULL);
INSERT INTO `model_classify` VALUES (17, NULL, 4, '0,4', '中长期水文预测', NULL, 1, 0, '小桐', 1, '2025-12-31 14:03:53', NULL, NULL, '2025-12-31 14:03:52', NULL);
INSERT INTO `model_classify` VALUES (18, NULL, 0, '0', '水资源调度', NULL, 1, 1, '小桐', 1, '2025-12-31 14:04:12', NULL, NULL, '2025-12-31 14:04:12', NULL);
INSERT INTO `model_classify` VALUES (19, NULL, 0, '0', '水资源调度', NULL, 1, 0, '小桐', 1, '2025-12-31 14:10:52', NULL, NULL, '2025-12-31 14:10:52', NULL);
INSERT INTO `model_classify` VALUES (20, NULL, 19, '0,19', '水库优化调度', NULL, 1, 0, '小桐', 1, '2025-12-31 14:11:00', NULL, NULL, '2025-12-31 14:10:59', NULL);
INSERT INTO `model_classify` VALUES (21, NULL, 19, '0,19', '流域水量分配', NULL, 1, 0, '小桐', 1, '2025-12-31 14:11:07', NULL, NULL, '2025-12-31 14:11:06', NULL);
INSERT INTO `model_classify` VALUES (22, NULL, 0, '0', '智慧水利', NULL, 1, 0, '小桐', 1, '2025-12-31 14:11:25', NULL, NULL, '2025-12-31 14:11:25', NULL);
INSERT INTO `model_classify` VALUES (23, NULL, 22, '0,22', '数字孪生流域', NULL, 1, 0, '小桐', 1, '2025-12-31 14:11:33', NULL, NULL, '2025-12-31 14:11:32', NULL);
INSERT INTO `model_classify` VALUES (24, NULL, 22, '0,22', 'AI水位预测', NULL, 1, 0, '小桐', 1, '2025-12-31 14:11:39', NULL, NULL, '2025-12-31 14:11:38', NULL);
INSERT INTO `model_classify` VALUES (25, NULL, 22, '0,22', '无人机巡河识别模型', NULL, 1, 0, '小桐', 1, '2025-12-31 14:11:44', NULL, NULL, '2025-12-31 14:11:44', NULL);
INSERT INTO `model_classify` VALUES (26, NULL, 22, '0,22', '智能预警决策模型', NULL, 1, 0, '小桐', 1, '2025-12-31 14:11:51', NULL, NULL, '2025-12-31 14:11:51', NULL);
INSERT INTO `model_classify` VALUES (27, NULL, 0, '0', '其他', NULL, 1, 0, '小桐', 1, '2025-12-31 14:11:58', NULL, NULL, '2025-12-31 14:11:58', NULL);
INSERT INTO `model_classify` VALUES (28, NULL, 27, '0,27', '综合水利集成模型', NULL, 1, 0, '小桐', 1, '2025-12-31 14:12:04', NULL, NULL, '2025-12-31 14:12:04', NULL);
INSERT INTO `model_classify` VALUES (29, NULL, 27, '0,27', '跨流域调水仿真', NULL, 1, 0, '小桐', 1, '2025-12-31 14:12:10', NULL, NULL, '2025-12-31 14:12:10', NULL);
INSERT INTO `model_classify` VALUES (30, NULL, 27, '0,27', '水土保持模型', NULL, 1, 0, '小桐', 1, '2025-12-31 14:12:16', NULL, NULL, '2025-12-31 14:12:15', NULL);
INSERT INTO `model_classify` VALUES (31, NULL, 27, '0,27', '冰凌洪水模拟', NULL, 1, 0, '小桐', 1, '2025-12-31 14:12:24', NULL, NULL, '2025-12-31 14:12:23', NULL);

-- ----------------------------
-- Table structure for model_compute
-- ----------------------------
DROP TABLE IF EXISTS `model_compute`;
CREATE TABLE `model_compute`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `START_TIME` timestamp NOT NULL COMMENT '开始时间',
  `CREATE_BY_ID` int NULL DEFAULT NULL COMMENT '操作人id',
  `CREATE_BY` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `NAME` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '方案名称',
  `MONITOR1` decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站1号',
  `MONITOR2` decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站2号',
  `MONITOR3` decimal(9, 6) NULL DEFAULT NULL COMMENT '监测站3号',
  `AVG_RAIN_FALL` decimal(9, 6) NULL DEFAULT NULL COMMENT '面均雨量',
  `RAIN_FALL_LAST` decimal(9, 6) NULL DEFAULT NULL COMMENT '降雨历时',
  `WATER_SCALE` decimal(9, 6) NULL DEFAULT NULL COMMENT '降雨分布比例',
  `Z` decimal(20, 6) NULL DEFAULT NULL COMMENT '初始库水位',
  `Q` decimal(20, 6) NULL DEFAULT NULL COMMENT '初始出库流量',
  `SOIL_CONDITION` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '土壤条件',
  `ZFZSXSKC` decimal(9, 6) NULL DEFAULT NULL COMMENT '蒸发折算系数(kc)',
  `ZFZSXSC` decimal(9, 6) NULL DEFAULT NULL COMMENT '蒸发折算系数(c)',
  `ZLSXL` decimal(9, 6) NULL DEFAULT NULL COMMENT '初始土壤张力水蓄量(w0)',
  `SCZLSXL` decimal(9, 6) NULL DEFAULT NULL COMMENT '初始上层张力水蓄量(wu0)',
  `XCZLSXL` decimal(9, 6) NULL DEFAULT NULL COMMENT '初始下层张力水蓄量(wl0)',
  `SCZLSXLWDO` decimal(9, 6) NULL DEFAULT NULL COMMENT '初始深层张力水蓄量(wd0)',
  `PJZLSXL` decimal(9, 6) NULL DEFAULT NULL COMMENT '流域平均张力水蓄量(wmm)',
  `LYSCZLSXL` decimal(9, 6) NULL DEFAULT NULL COMMENT '流域上层张力水蓄量(wum)',
  `LYXCZLSXL` decimal(9, 6) NULL DEFAULT NULL COMMENT '流域下层张力水蓄量(wlm)',
  `LYSCZLSXLWDO` decimal(9, 6) NULL DEFAULT NULL COMMENT '流域深层张力水蓄量(wdm)',
  `XTXS` decimal(9, 6) NULL DEFAULT NULL COMMENT '消退系数(kb)',
  `JL` decimal(9, 6) NULL DEFAULT NULL COMMENT '基流(qb)',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384085749300`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模拟洪水预报-模型参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_compute
-- ----------------------------

-- ----------------------------
-- Table structure for model_history
-- ----------------------------
DROP TABLE IF EXISTS `model_history`;
CREATE TABLE `model_history`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `COMPANY_ID` bigint NULL DEFAULT NULL COMMENT '企业id',
  `MODEL_ID` bigint NULL DEFAULT NULL COMMENT '所属模型id',
  `MODEL_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属模型名称',
  `CONTEXT` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `START_TIME` timestamp NULL DEFAULT NULL COMMENT '启用时间',
  `MODEL_VERSION` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '启用版本号',
  `VALID_FLAG` tinyint NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除 ',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `CREATE_TIME` timestamp NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `UPDATE_TIME` timestamp NOT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384092959500`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1341 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_history
-- ----------------------------
INSERT INTO `model_history` VALUES (1251, NULL, 1, '产汇流模型', '新增了产汇流模型', NULL, NULL, 1, 0, NULL, NULL, '2025-11-14 18:34:05', 'admin', 1, '2025-11-14 18:34:04', NULL);
INSERT INTO `model_history` VALUES (1252, NULL, 1, '产汇流模型', '修改了产汇流模型基本信息', NULL, NULL, 1, 0, NULL, NULL, '2025-11-14 18:35:44', 'admin', 1, '2025-11-14 18:34:04', NULL);
INSERT INTO `model_history` VALUES (1253, NULL, 2, '123', '新增了123', NULL, '123', 1, 0, NULL, NULL, '2025-11-14 19:38:18', 'admin', 1, '2025-11-14 19:38:17', NULL);
INSERT INTO `model_history` VALUES (1254, NULL, 3, 'test', '新增了test', NULL, '1', 1, 0, NULL, NULL, '2025-11-16 15:38:07', 'admin', 1, '2025-11-16 15:38:07', NULL);
INSERT INTO `model_history` VALUES (1255, NULL, 4, '123123', '新增了123123', NULL, '1', 1, 0, NULL, NULL, '2025-11-16 15:40:03', 'admin', 1, '2025-11-16 15:40:03', NULL);
INSERT INTO `model_history` VALUES (1256, NULL, 4, '123123', '添加了一条【333】模型计算', NULL, '1', 1, 0, NULL, NULL, '2025-11-17 03:17:56', 'admin', 1, '2025-11-17 03:17:56', NULL);
INSERT INTO `model_history` VALUES (1257, NULL, 4, '测试', '修改了测试基本信息', NULL, '1', 1, 0, NULL, NULL, '2025-11-17 04:21:54', 'admin', 1, '2025-11-16 15:40:03', NULL);
INSERT INTO `model_history` VALUES (1258, NULL, 5, '测试', '新增了测试', NULL, '1', 1, 0, NULL, NULL, '2025-11-17 06:20:23', 'admin', 1, '2025-11-17 06:20:23', NULL);
INSERT INTO `model_history` VALUES (1259, NULL, 6, 'ceshi ', '新增了ceshi ', NULL, '1', 1, 0, NULL, NULL, '2025-11-18 10:45:41', 'admin', 1, '2025-11-18 10:45:41', NULL);
INSERT INTO `model_history` VALUES (1260, NULL, 5, '测试', '添加了一条【null】模型计算', NULL, '1', 1, 0, NULL, NULL, '2025-11-18 10:48:00', 'admin', 1, '2025-11-18 10:48:00', NULL);
INSERT INTO `model_history` VALUES (1261, NULL, 5, '测试', '修改了测试基本信息', NULL, '1', 1, 0, NULL, NULL, '2025-12-11 10:11:24', 'admin', 1, '2025-11-17 06:20:23', NULL);
INSERT INTO `model_history` VALUES (1262, NULL, 7, '来水预测模型', '新增了来水预测模型', NULL, 'v1.0', 1, 0, NULL, NULL, '2025-12-11 10:38:29', 'admin', 1, '2025-12-11 10:38:29', NULL);
INSERT INTO `model_history` VALUES (1263, NULL, 7, '来水预测模型', '修改了来水预测模型基本信息', NULL, 'v1.0', 1, 0, NULL, NULL, '2025-12-11 10:42:23', 'admin', 1, '2025-12-11 10:38:28', NULL);
INSERT INTO `model_history` VALUES (1264, NULL, 7, '来水预测模型', '添加了一条【来水量】模型计算', NULL, NULL, 1, 0, NULL, NULL, '2025-12-11 13:49:48', 'admin', 1, '2025-12-11 13:49:48', NULL);
INSERT INTO `model_history` VALUES (1265, NULL, 7, '来水预测模型', '添加了一条【入库流量】模型计算', NULL, NULL, 1, 0, NULL, NULL, '2025-12-11 13:50:24', 'admin', 1, '2025-12-11 13:50:24', NULL);
INSERT INTO `model_history` VALUES (1266, NULL, 7, '来水预测模型', '修改了来水预测模型基本信息', NULL, 'v1.0', 1, 0, NULL, NULL, '2025-12-11 14:38:09', 'admin', 1, '2025-12-11 10:38:28', NULL);
INSERT INTO `model_history` VALUES (1267, NULL, 5, '单机程序', '修改了单机程序基本信息', NULL, '1', 1, 0, NULL, NULL, '2025-12-30 13:30:41', '小桐', 1, '2025-11-17 06:20:23', NULL);
INSERT INTO `model_history` VALUES (1268, NULL, 8, '综合水利集成模型', '新增了综合水利集成模型', NULL, '1.0', 1, 0, NULL, NULL, '2025-12-31 15:40:24', '小桐', 1, '2025-12-31 15:40:24', NULL);
INSERT INTO `model_history` VALUES (1269, NULL, 9, '水土保持模型', '新增了水土保持模型', NULL, '1.0', 1, 0, NULL, NULL, '2025-12-31 15:40:56', '小桐', 1, '2025-12-31 15:40:55', NULL);
INSERT INTO `model_history` VALUES (1270, NULL, 10, '水土保持模型', '新增了水土保持模型', NULL, '1.0', 1, 0, NULL, NULL, '2025-12-31 18:17:47', '小桐', 1, '2025-12-31 18:17:47', NULL);
INSERT INTO `model_history` VALUES (1271, NULL, 10, '水土保持模型', '添加了一条【水位计算】模型计算', NULL, '1', 1, 0, NULL, NULL, '2025-12-31 18:21:59', '小桐', 1, '2025-12-31 18:21:59', NULL);
INSERT INTO `model_history` VALUES (1272, NULL, 11, 'AI水位预测', '新增了AI水位预测', NULL, '1.2', 1, 0, NULL, NULL, '2025-12-31 18:25:19', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1273, NULL, 11, 'AI水位预测', '修改了AI水位预测基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2025-12-31 18:25:35', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1274, NULL, 11, 'AI水位预测1', '修改了AI水位预测1基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2026-01-06 11:20:45', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1275, NULL, 11, 'AI水位预测', '修改了AI水位预测基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2026-01-06 11:21:02', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1276, NULL, 10, '水土保持模型', '【水位计算】进行了模型计算', NULL, '1', 1, 0, NULL, NULL, '2026-01-06 12:07:39', '小桐', 1, '2026-01-06 12:07:39', NULL);
INSERT INTO `model_history` VALUES (1277, NULL, 11, 'AI水位预测1', '修改了AI水位预测1基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2026-01-06 16:12:33', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1278, NULL, 11, 'AI水位预测', '修改了AI水位预测基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2026-01-06 16:12:38', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1279, NULL, 11, 'AI水位预测1', '修改了AI水位预测1基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2026-01-06 16:48:07', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1280, NULL, 11, 'AI水位预测', '修改了AI水位预测基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2026-01-06 16:48:23', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1281, NULL, 11, 'AI水位预测1', '修改了AI水位预测1基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2026-01-06 17:14:00', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1282, NULL, 11, 'AI水位预测', '修改了AI水位预测基本信息', NULL, '1.2', 1, 0, NULL, NULL, '2026-01-06 17:14:12', '小桐', 1, '2025-12-31 18:25:19', NULL);
INSERT INTO `model_history` VALUES (1283, NULL, 7, NULL, '新增了【null:6379/123】接口地址', NULL, NULL, 1, 0, '小桐', 1, '2026-01-14 14:20:25', '小桐', 1, '2026-01-14 14:20:25', NULL);
INSERT INTO `model_history` VALUES (1284, NULL, 7, NULL, '修改了【null:6379/null:6379/123】接口基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-14 14:46:12', '小桐', 1, '2026-01-14 14:46:12', NULL);
INSERT INTO `model_history` VALUES (1285, NULL, 7, '来水预测模型', '新增了来水预测模型一个版本', NULL, '2', 1, 0, '小桐', 1, '2026-01-14 15:26:32', '小桐', 1, '2026-01-14 15:26:32', NULL);
INSERT INTO `model_history` VALUES (1286, NULL, 7, NULL, '新增了【null:6379/123】接口地址', NULL, NULL, 1, 0, '小桐', 1, '2026-01-14 15:27:03', '小桐', 1, '2026-01-14 15:27:03', NULL);
INSERT INTO `model_history` VALUES (1287, NULL, 7, '来水预测模型', '切换了模型的版本号, 切换到了【2.0】', NULL, '2', 1, 0, '小桐', 1, '2026-01-14 15:32:22', '小桐', 1, '2026-01-14 15:32:22', NULL);
INSERT INTO `model_history` VALUES (1288, NULL, 7, '来水预测模型', '切换了模型的版本号, 切换到了【null】', NULL, 'v1.0', 1, 0, '小桐', 1, '2026-01-14 15:32:30', '小桐', 1, '2026-01-14 15:32:30', NULL);
INSERT INTO `model_history` VALUES (1289, NULL, 7, NULL, '修改了【null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml】接口基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-14 16:04:23', '小桐', 1, '2026-01-14 16:04:23', NULL);
INSERT INTO `model_history` VALUES (1290, NULL, 7, NULL, '修改了【null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml】接口基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-14 16:04:43', '小桐', 1, '2026-01-14 16:04:43', NULL);
INSERT INTO `model_history` VALUES (1291, NULL, 7, NULL, '修改了【null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml】接口基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-14 16:04:56', '小桐', 1, '2026-01-14 16:04:56', NULL);
INSERT INTO `model_history` VALUES (1292, NULL, NULL, '流量是计算', '新增了流量是计算', NULL, '1', 1, 0, '小桐', 1, '2026-01-14 16:22:54', '小桐', 1, '2026-01-14 16:22:54', NULL);
INSERT INTO `model_history` VALUES (1293, NULL, 12, '流量是计算', '新增了流量是计算一个版本', NULL, '2', 1, 0, '小桐', 1, '2026-01-14 16:51:33', '小桐', 1, '2026-01-14 16:51:33', NULL);
INSERT INTO `model_history` VALUES (1294, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【2.0】', NULL, '2', 1, 0, '小桐', 1, '2026-01-14 16:51:39', '小桐', 1, '2026-01-14 16:51:39', NULL);
INSERT INTO `model_history` VALUES (1295, NULL, 12, '流量是计算', '添加了一条【avq】模型计算', NULL, '2', 1, 0, '小桐', 1, '2026-01-15 10:04:36', '小桐', 1, '2026-01-15 10:04:36', NULL);
INSERT INTO `model_history` VALUES (1296, NULL, 7, '来水预测模型', '添加了一条【测试】模型计算', NULL, 'v1.0', 1, 0, '小桐', 1, '2026-01-15 11:10:17', '小桐', 1, '2026-01-15 11:10:17', NULL);
INSERT INTO `model_history` VALUES (1297, NULL, NULL, NULL, '修改了【null】基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-19 17:45:13', '小桐', 1, '2026-01-19 17:45:13', NULL);
INSERT INTO `model_history` VALUES (1298, NULL, NULL, NULL, '修改了【null】基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-19 17:45:29', '小桐', 1, '2026-01-19 17:45:29', NULL);
INSERT INTO `model_history` VALUES (1299, NULL, NULL, NULL, '修改了【null】基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-19 17:45:53', '小桐', 1, '2026-01-19 17:45:53', NULL);
INSERT INTO `model_history` VALUES (1300, NULL, NULL, NULL, '修改了【null】基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-19 17:46:25', '小桐', 1, '2026-01-19 17:46:25', NULL);
INSERT INTO `model_history` VALUES (1301, NULL, NULL, '接口服务类', '新增了接口服务类', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 09:17:26', '小桐', 1, '2026-01-20 09:17:26', NULL);
INSERT INTO `model_history` VALUES (1302, NULL, 12, '流量是计算', '新增了流量是计算一个版本', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 09:22:58', '小桐', 1, '2026-01-20 09:22:58', NULL);
INSERT INTO `model_history` VALUES (1303, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【3.0】', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 10:34:01', '小桐', 1, '2026-01-20 10:34:01', NULL);
INSERT INTO `model_history` VALUES (1304, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【2.0】', NULL, '2', 1, 0, '小桐', 1, '2026-01-20 10:52:30', '小桐', 1, '2026-01-20 10:52:30', NULL);
INSERT INTO `model_history` VALUES (1305, NULL, 12, '流量是计算', '删除了流量是计算【3】版本的内容', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 11:03:54', '小桐', 1, '2026-01-20 11:03:54', NULL);
INSERT INTO `model_history` VALUES (1308, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【3】', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 11:27:10', '小桐', 1, '2026-01-20 11:27:10', NULL);
INSERT INTO `model_history` VALUES (1309, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【2】', NULL, '2', 1, 0, '小桐', 1, '2026-01-20 11:28:27', '小桐', 1, '2026-01-20 11:28:27', NULL);
INSERT INTO `model_history` VALUES (1310, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【3】', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 11:28:38', '小桐', 1, '2026-01-20 11:28:38', NULL);
INSERT INTO `model_history` VALUES (1311, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【3】', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 11:28:42', '小桐', 1, '2026-01-20 11:28:42', NULL);
INSERT INTO `model_history` VALUES (1312, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【2】', NULL, '2', 1, 0, '小桐', 1, '2026-01-20 11:28:47', '小桐', 1, '2026-01-20 11:28:47', NULL);
INSERT INTO `model_history` VALUES (1313, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【3】', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 11:30:36', '小桐', 1, '2026-01-20 11:30:36', NULL);
INSERT INTO `model_history` VALUES (1314, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【2】', NULL, '2', 1, 0, '小桐', 1, '2026-01-20 11:38:21', '小桐', 1, '2026-01-20 11:38:21', NULL);
INSERT INTO `model_history` VALUES (1315, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【3】', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 11:41:12', '小桐', 1, '2026-01-20 11:41:12', NULL);
INSERT INTO `model_history` VALUES (1316, NULL, 12, '流量是计算', '切换了模型的版本号, 切换到了【2】', NULL, '2', 1, 0, '小桐', 1, '2026-01-20 11:41:23', '小桐', 1, '2026-01-20 11:41:23', NULL);
INSERT INTO `model_history` VALUES (1317, NULL, 7, '来水预测模型', '新增了来水预测模型一个版本', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 11:56:45', '小桐', 1, '2026-01-20 11:56:45', NULL);
INSERT INTO `model_history` VALUES (1318, NULL, 7, '来水预测模型', '切换了模型的版本号, 切换到了【3】', NULL, '3', 1, 0, '小桐', 1, '2026-01-20 11:57:00', '小桐', 1, '2026-01-20 11:57:00', NULL);
INSERT INTO `model_history` VALUES (1319, NULL, 7, '来水预测模型', '删除了来水预测模型【v1.0】版本的内容', NULL, 'v1.0', 1, 0, '小桐', 1, '2026-01-20 11:57:09', '小桐', 1, '2026-01-20 11:57:09', NULL);
INSERT INTO `model_history` VALUES (1320, NULL, 7, '来水预测模型', '切换了模型的版本号, 切换到了【2】', NULL, '2', 1, 0, '小桐', 1, '2026-01-20 13:18:54', '小桐', 1, '2026-01-20 13:18:54', NULL);
INSERT INTO `model_history` VALUES (1321, NULL, 13, '接口服务类', '新增了接口服务类一个版本', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 13:19:31', '小桐', 1, '2026-01-20 13:19:31', NULL);
INSERT INTO `model_history` VALUES (1322, NULL, 13, '接口服务类', '切换了模型的版本号, 切换到了【1】', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 13:19:36', '小桐', 1, '2026-01-20 13:19:36', NULL);
INSERT INTO `model_history` VALUES (1323, NULL, 13, NULL, '新增了【null:80/http://localhost/dev-api/captchaImage】接口地址', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 13:20:18', '小桐', 1, '2026-01-20 13:20:18', NULL);
INSERT INTO `model_history` VALUES (1324, NULL, 13, '接口服务类', '添加了一条【接口计算】模型计算', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 13:20:55', '小桐', 1, '2026-01-20 13:20:55', NULL);
INSERT INTO `model_history` VALUES (1325, NULL, 13, NULL, '修改了【null:80/http://localhost/dev-api/captchaImage】接口基本信息', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 15:48:04', '小桐', 1, '2026-01-20 15:48:04', NULL);
INSERT INTO `model_history` VALUES (1326, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 16:03:02', '小桐', 1, '2026-01-20 16:03:02', NULL);
INSERT INTO `model_history` VALUES (1327, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 16:03:38', '小桐', 1, '2026-01-20 16:03:38', NULL);
INSERT INTO `model_history` VALUES (1328, NULL, 13, '接口服务类', '修改了接口服务类基本信息', NULL, '1', 1, 0, '小桐', 1, '2026-01-20 16:04:14', '小桐', 1, '2026-01-20 16:04:14', NULL);
INSERT INTO `model_history` VALUES (1329, NULL, NULL, NULL, '修改了【null】基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-20 17:22:42', '小桐', 1, '2026-01-20 17:22:42', NULL);
INSERT INTO `model_history` VALUES (1330, NULL, NULL, NULL, '修改了【null】基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-20 17:23:37', '小桐', 1, '2026-01-20 17:23:37', NULL);
INSERT INTO `model_history` VALUES (1331, NULL, NULL, NULL, '修改了【null】基本信息', NULL, NULL, 1, 0, '小桐', 1, '2026-01-20 17:29:54', '小桐', 1, '2026-01-20 17:29:54', NULL);
INSERT INTO `model_history` VALUES (1332, NULL, 13, NULL, '新增了【null:80/http://localhost:8090/captchaImage】接口地址', NULL, '1', 1, 0, '小桐', 1, '2026-01-21 14:26:05', '小桐', 1, '2026-01-21 14:26:05', NULL);
INSERT INTO `model_history` VALUES (1333, NULL, NULL, 'base64图片获取', '新增了base64图片获取', NULL, '1', 1, 0, '小桐', 1, '2026-01-21 14:41:42', '小桐', 1, '2026-01-21 14:41:42', NULL);
INSERT INTO `model_history` VALUES (1334, NULL, NULL, '测试', '新增了测试', NULL, '1', 1, 0, '小桐', 1, '2026-01-21 14:47:59', '小桐', 1, '2026-01-21 14:47:59', NULL);
INSERT INTO `model_history` VALUES (1335, NULL, NULL, '测试', '新增了测试', NULL, '1', 1, 0, '小桐', 1, '2026-01-21 15:27:04', '小桐', 1, '2026-01-21 15:27:04', NULL);
INSERT INTO `model_history` VALUES (1336, NULL, 13, '接口服务类', '新增了接口服务类一个版本', NULL, '2', 1, 0, '小桐', 1, '2026-01-21 16:30:20', '小桐', 1, '2026-01-21 16:30:20', NULL);
INSERT INTO `model_history` VALUES (1337, NULL, 13, '接口服务类', '修改了接口服务类【2】版本的内容', NULL, '2', 1, 0, '小桐', 1, '2026-01-21 16:47:49', '小桐', 1, '2026-01-21 16:47:49', NULL);
INSERT INTO `model_history` VALUES (1338, NULL, 13, '接口服务类', '修改了接口服务类【2】版本的内容', NULL, '2', 1, 0, '小桐', 1, '2026-01-21 16:50:09', '小桐', 1, '2026-01-21 16:50:09', NULL);
INSERT INTO `model_history` VALUES (1339, NULL, 13, '接口服务类', '切换了模型的版本号, 切换到了【2】', NULL, '2', 1, 0, '小桐', 1, '2026-01-21 16:50:18', '小桐', 1, '2026-01-21 16:50:18', NULL);
INSERT INTO `model_history` VALUES (1340, NULL, 13, '接口服务类', '修改了接口服务类【1】版本的内容', NULL, '1', 1, 0, '小桐', 1, '2026-01-21 16:50:34', '小桐', 1, '2026-01-21 16:50:34', NULL);

-- ----------------------------
-- Table structure for model_input
-- ----------------------------
DROP TABLE IF EXISTS `model_input`;
CREATE TABLE `model_input`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业Id',
  `NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `ENG_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `TYPE` int NULL DEFAULT NULL COMMENT '参数类型 0:单值，1：多列数值，2：文件',
  `MODEL_ID` int NULL DEFAULT NULL COMMENT '所属模型id',
  `MODEL_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属模型名称',
  `MODEL_VERSION` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属模型版本',
  `DESCRIPTION` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数说明(描述)',
  `EXAMPLE` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数示例（文件上传）',
  `PARAM_FILE` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数文件',
  `SINGLE_CONTENT` varchar(6144) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数单值',
  `MULTIPLE_CONTENT` varchar(6144) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数多列值',
  `VALID_FLAG` int NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` int NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` int NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `CREATE_TIME` timestamp NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` int NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `UPDATE_TIME` timestamp NOT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CHANGE_FLAG` decimal(1, 0) NOT NULL DEFAULT 0 COMMENT '是否可变',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384099111100`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模型输入管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_input
-- ----------------------------
INSERT INTO `model_input` VALUES (1, NULL, '123', '333', 0, 4, '测试', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, 'admin', NULL, '2025-11-17 04:22:12', NULL, NULL, '2025-11-17 04:57:36', NULL, 1);
INSERT INTO `model_input` VALUES (2, NULL, 'q', 'q', 0, 8, '综合水利集成模型', '1', '水位', NULL, NULL, '[]', '[]', 1, 0, 'admin', NULL, '2025-11-17 06:20:52', NULL, NULL, '2025-12-31 16:09:05', NULL, 0);
INSERT INTO `model_input` VALUES (3, NULL, '日水量', 'AW_DT', 0, 7, '来水预测模型', NULL, NULL, NULL, NULL, '[]', '[]', 1, 1, 'admin', NULL, '2025-12-11 13:53:11', NULL, NULL, '2025-12-11 13:53:11', NULL, 1);
INSERT INTO `model_input` VALUES (4, NULL, '水位', 'P', 1, 10, '水土保持模型', '1', NULL, NULL, NULL, '[]', '[]', 1, 0, '小桐', NULL, '2025-12-31 18:21:15', NULL, NULL, '2025-12-31 18:21:14', NULL, 1);
INSERT INTO `model_input` VALUES (5, NULL, 'q', '123', NULL, 11, 'AI水位预测', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, '小桐', NULL, '2026-01-06 11:43:33', NULL, NULL, '2026-01-06 11:43:33', NULL, 1);
INSERT INTO `model_input` VALUES (6, NULL, 'q', '123', 1, 11, 'AI水位预测', '1', NULL, NULL, NULL, '[]', '[{\"name\":\"q\",\"value\":\"1\",\"order\":2,\"index\":1}]', 1, 0, '小桐', NULL, '2026-01-06 11:44:06', NULL, NULL, '2026-01-06 11:48:18', NULL, 1);
INSERT INTO `model_input` VALUES (7, NULL, '测试', 'name', 0, 5, '单机程序', '1', NULL, NULL, NULL, '[]', '[]', 1, 1, '小桐', NULL, '2026-01-06 13:58:58', NULL, NULL, '2026-01-06 11:48:17', NULL, 0);
INSERT INTO `model_input` VALUES (8, NULL, 'q', 'level', 0, 5, '单机程序', '1', '说明', NULL, NULL, '[]', '[]', 1, 0, '小桐', 1, '2026-01-09 16:35:37', '小桐', 1, '2026-01-09 16:35:37', NULL, 1);
INSERT INTO `model_input` VALUES (9, NULL, 'q', '/data/jgst/jgst.chaoshen.20250113/data_input.json', 1, 12, '流量是计算', '2', '参数说明', NULL, NULL, '[]', '[{\"name\":\"q\",\"value\":\"0\",\"order\":213,\"index\":1}]', 1, 0, '小桐', 1, '2026-01-14 16:59:34', '小桐', 1, '2026-01-21 15:17:32', NULL, 1);

-- ----------------------------
-- Table structure for model_interface_address
-- ----------------------------
DROP TABLE IF EXISTS `model_interface_address`;
CREATE TABLE `model_interface_address`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `COMPANY_ID` decimal(10, 0) NULL DEFAULT NULL COMMENT '企业id',
  `MODEL_ID` bigint NULL DEFAULT NULL COMMENT '模型id',
  `INTERFACE_ADDRESS` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '接口地址',
  `VERSION_ID` bigint NULL DEFAULT NULL COMMENT '模型版本id',
  `REQUEST_METHOD` bigint NULL DEFAULT NULL COMMENT '请求方式',
  `INPUT_PARAMETER` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '输入参数',
  `OUTPUT_PARAMETER` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '输出参数',
  `DEL_FLAG` bigint NOT NULL DEFAULT 0 COMMENT '删除标志',
  `CREATE_BY` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `REMARK` varchar(4096) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `INPUT_PARAMETER_ILLUSTRATE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '输入参数说明',
  `OUTPUT_PARAMETER_ILLUSTRATE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '输出参数说明',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384104579900`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '接口地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_interface_address
-- ----------------------------
INSERT INTO `model_interface_address` VALUES (1, NULL, 7, 'null:6379/null:6379/123', 7, 1, NULL, NULL, 1, '小桐', 1, '2026-01-14 14:20:25', '小桐', 1, '2026-01-14 14:46:12', '测试', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (2, NULL, 7, 'null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml', 7, 2, NULL, NULL, 0, '小桐', 1, '2026-01-14 15:27:03', '小桐', 1, '2026-01-14 16:04:56', '测试新增', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (3, NULL, 13, 'http://localhost/dev-api/captchaImage', 18, 0, NULL, NULL, 0, '小桐', 1, '2026-01-20 13:20:18', '小桐', 1, '2026-01-20 15:48:05', 'q', NULL, NULL);
INSERT INTO `model_interface_address` VALUES (4, NULL, 13, 'null:80/http://localhost:8090/captchaImage', 18, 0, NULL, NULL, 0, '小桐', 1, '2026-01-21 14:26:05', '小桐', 1, '2026-01-21 14:26:05', 'z', NULL, NULL);

-- ----------------------------
-- Table structure for model_operate
-- ----------------------------
DROP TABLE IF EXISTS `model_operate`;
CREATE TABLE `model_operate`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业id',
  `MODULE_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `TYPE` int NULL DEFAULT NULL COMMENT '操作类型',
  `CONTENT` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `METHOD` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `REQ_CONTENT` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `RESP_CONTENT` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '返回参数',
  `IP` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作地址(Ip)',
  `ADDRESS` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  `STATUS` int NULL DEFAULT NULL COMMENT '操作状态',
  `VALID_FLAG` int NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` int NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` int NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `CREATE_TIME` timestamp NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` int NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `UPDATE_TIME` timestamp NOT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384110430900`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模型历史管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_operate
-- ----------------------------

-- ----------------------------
-- Table structure for model_output
-- ----------------------------
DROP TABLE IF EXISTS `model_output`;
CREATE TABLE `model_output`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业Id',
  `NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `ENG_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `TYPE` int NULL DEFAULT NULL COMMENT '参数类型 0:单值，1：多列数值',
  `MODEL_ID` int NULL DEFAULT NULL COMMENT '所属模型id',
  `MODEL_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属模型名称',
  `MODEL_VERSION` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属模型版本',
  `DESCRIPTION` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数说明(描述)',
  `SINGLE_CONTENT` varchar(6144) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数单值',
  `MULTIPLE_CONTENT` varchar(6144) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参数多列值',
  `VALID_FLAG` int NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` int NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` int NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `CREATE_TIME` timestamp NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` int NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `UPDATE_TIME` timestamp NOT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384115234200`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模型输入管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_output
-- ----------------------------
INSERT INTO `model_output` VALUES (1, NULL, '33', '22', 1, 4, '测试', '1', NULL, '[]', '[{\"name\":\"1\",\"value\":\"2\",\"order\":0,\"index\":1}]', 1, 1, 'admin', 1, '2025-11-17 04:29:29', NULL, NULL, '2025-11-17 04:29:29', NULL);
INSERT INTO `model_output` VALUES (2, NULL, 'z', 'z', 0, 5, '测试', '1', NULL, '\"1\"', '[]', 1, 0, 'admin', 1, '2025-11-17 06:21:20', NULL, NULL, '2025-11-17 06:21:20', NULL);
INSERT INTO `model_output` VALUES (3, NULL, '水利1112', 'weater', 0, 5, '单机程序', '1', NULL, '[]', '[]', 1, 1, '小桐', 1, '2026-01-06 14:47:18', NULL, NULL, '2026-01-06 14:47:24', NULL);
INSERT INTO `model_output` VALUES (4, NULL, '输出模型', 'q', 0, 5, '单机程序', '1', 'qqq', '\"0\"', '[]', 1, 0, '小桐', 1, '2026-01-09 16:26:54', '小桐', 1, '2026-01-13 14:52:56', NULL);
INSERT INTO `model_output` VALUES (5, NULL, 'AVQ', '/data/jgst/jgst.chaoshen.20250113/data_output.json', 0, 12, '流量是计算', '2', '测试', '\"0\"', '[]', 1, 0, '小桐', 1, '2026-01-14 18:05:18', '小桐', 1, '2026-01-21 15:16:52', NULL);

-- ----------------------------
-- Table structure for model_reconstitution
-- ----------------------------
DROP TABLE IF EXISTS `model_reconstitution`;
CREATE TABLE `model_reconstitution`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业id',
  `NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型名称',
  `CLASSIFY_ID` decimal(10, 0) NULL DEFAULT NULL COMMENT '模型分类',
  `BUILTIN` decimal(10, 0) NULL DEFAULT NULL COMMENT '是否预置',
  `ACCESS_MODE` decimal(10, 0) NULL DEFAULT NULL COMMENT '接入方式',
  `REQUEST_METHOD` decimal(10, 0) NULL DEFAULT NULL COMMENT '请求方式',
  `INTERFACEORFILE_ADDRESS` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '接口和文件的地址',
  `VERSION_ID` decimal(10, 0) NULL DEFAULT NULL COMMENT '版本id',
  `WHETHER_PUBLISH` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '是否发布',
  `PUBLISH_TIME` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `DEL_FLAG` bigint NOT NULL DEFAULT 0 COMMENT '删除标志',
  `CREATE_BY` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `REMARK` varchar(4096) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `PORT` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '接口的端口号',
  `FILE_NAME` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `RUNNABLE_FILE_ADDRESS` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '可执行文件相对路径',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384120797100`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模型库重构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_reconstitution
-- ----------------------------
INSERT INTO `model_reconstitution` VALUES (1, NULL, '产汇流模型', 2, NULL, NULL, NULL, NULL, 1, 0, '2025-11-14 18:35:44', 1, 'admin', 1, '2025-11-14 18:34:04', NULL, NULL, '2025-11-14 18:35:44', NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (2, NULL, '123', 2, 1, 1, NULL, NULL, 2, 0, NULL, 1, 'admin', 1, '2025-11-14 19:38:17', NULL, NULL, NULL, NULL, '123', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (3, NULL, 'test', 2, 0, 0, NULL, 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip', 3, 0, NULL, 1, 'admin', 1, '2025-11-16 15:38:07', NULL, NULL, NULL, NULL, NULL, 'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (4, NULL, '测试', 2, 0, 0, NULL, 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip', 4, 0, '2025-11-17 04:21:55', 1, 'admin', 1, '2025-11-16 15:40:03', NULL, NULL, '2025-11-17 04:21:55', NULL, NULL, 'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (5, NULL, '单机程序', 3, 0, 0, NULL, 'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip', 5, 0, '2025-12-30 13:30:41', 1, 'admin', 1, '2025-11-17 06:20:23', NULL, NULL, '2025-12-30 13:30:41', NULL, NULL, 'YL_DP_USER-MODEL etc.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (6, NULL, 'ceshi ', 2, NULL, 1, NULL, NULL, 6, 0, NULL, 1, 'admin', 1, '2025-11-18 10:45:41', NULL, NULL, NULL, NULL, '1001', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (7, NULL, '来水预测模型', 3, 0, 1, NULL, NULL, 12, 0, '2025-12-11 14:38:09', 1, 'admin', 1, '2025-12-11 10:38:28', '小桐', 1, '2026-01-14 15:32:30', '模型介绍', '6379', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (8, NULL, '综合水利集成模型', 28, 1, 0, NULL, NULL, 8, 0, NULL, 1, '小桐', 1, '2025-12-31 15:40:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (9, NULL, '水土保持模型', 30, NULL, 0, NULL, NULL, 9, 0, NULL, 1, '小桐', 1, '2025-12-31 15:40:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (10, NULL, '水土保持模型', 30, 1, 0, NULL, 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip', 10, 0, NULL, 1, '小桐', 1, '2025-12-31 18:17:47', NULL, NULL, NULL, NULL, NULL, 'jgst.chaoshen.20250113.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (11, NULL, 'AI水位预测', 29, 0, 0, NULL, 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip', 11, 0, '2026-01-06 17:14:09', 0, '小桐', 1, '2025-12-31 18:25:19', NULL, NULL, '2026-01-06 17:14:09', NULL, NULL, 'jgst.chaoshen.20250113.zip', NULL);
INSERT INTO `model_reconstitution` VALUES (12, NULL, '流量是计算', 9, 1, 0, NULL, 'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip', 14, 0, NULL, 0, '小桐', 1, '2026-01-14 16:22:53', '小桐', 1, '2026-01-20 10:52:30', NULL, NULL, NULL, '\\jgst.chaoshen.20250113\\data.json');
INSERT INTO `model_reconstitution` VALUES (13, NULL, '接口服务类', 9, 1, 1, NULL, NULL, 22, 1, '2026-01-20 16:04:14', 0, '小桐', 1, '2026-01-20 09:17:25', '小桐', 1, '2026-01-20 16:04:14', NULL, '80', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (14, NULL, 'base64图片获取', 3, 1, 1, NULL, NULL, 19, 0, NULL, 1, '小桐', 1, '2026-01-21 14:41:41', '小桐', 1, '2026-01-21 14:41:41', NULL, '80', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (15, NULL, '测试', 3, 1, 1, NULL, NULL, 20, 0, NULL, 1, '小桐', 1, '2026-01-21 14:47:59', '小桐', 1, '2026-01-21 14:47:59', NULL, '6379', NULL, NULL);
INSERT INTO `model_reconstitution` VALUES (16, NULL, '测试', 17, 0, 1, NULL, 'http:192.1623', 21, 0, NULL, 1, '小桐', 1, '2026-01-21 15:27:04', '小桐', 1, '2026-01-21 15:27:04', NULL, '8888', NULL, NULL);

-- ----------------------------
-- Table structure for model_version
-- ----------------------------
DROP TABLE IF EXISTS `model_version`;
CREATE TABLE `model_version`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `COMPANY_ID` int NULL DEFAULT NULL COMMENT '企业id',
  `MODEL_ID` int NULL DEFAULT NULL COMMENT '所属模型id',
  `MODEL_NAME` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属模型名称',
  `VERSION` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型版本号',
  `FILE_ADDRESS` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `INTERFACE_ADDRESS` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '接口地址',
  `STATUS` int NULL DEFAULT NULL COMMENT '版本状态',
  `DESCRIPTION` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `VALID_FLAG` int NOT NULL DEFAULT 1 COMMENT '是否有效 0：无效，1：有效',
  `DEL_FLAG` int NOT NULL DEFAULT 0 COMMENT '删除标志 1：已删除，0：未删除',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATOR_ID` int NULL DEFAULT NULL COMMENT '创建人id 创建者的sys_user_id',
  `CREATE_TIME` timestamp NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `UPDATOR_ID` int NULL DEFAULT NULL COMMENT '更新人id 更新者的sys_user_id',
  `UPDATE_TIME` timestamp NOT NULL COMMENT '更新时间',
  `REMARK` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `FILE_NAME` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件的名称',
  `RUNNABLE_FILE_ADDRESS` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '可执行文件地址',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_10384126156900`(`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '版本管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_version
-- ----------------------------
INSERT INTO `model_version` VALUES (1, NULL, 1, '产汇流模型', NULL, NULL, NULL, 1, '产汇流模型', 1, 0, 'admin', 1, '2025-11-14 18:34:04', NULL, NULL, '2025-11-14 18:34:04', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (2, NULL, 2, '123', '123', NULL, NULL, 1, '123', 1, 0, 'admin', 1, '2025-11-14 19:38:17', NULL, NULL, '2025-11-14 19:38:17', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (3, NULL, 3, 'test', '1', 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip', 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip', 1, '1', 1, 0, 'admin', 1, '2025-11-16 15:38:07', NULL, NULL, '2025-11-16 15:38:07', NULL, NULL, '\\MODEL_OUTPUT.sql');
INSERT INTO `model_version` VALUES (4, NULL, 4, '123123', '1', 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip', 'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip', 1, '1', 1, 0, 'admin', 1, '2025-11-16 15:40:03', NULL, NULL, '2025-11-16 15:40:03', NULL, NULL, '\\MODEL_OUTPUT.sql');
INSERT INTO `model_version` VALUES (5, NULL, 5, '测试', '1', 'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip', 'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip', 1, '1', 1, 0, 'admin', 1, '2025-11-17 06:20:23', NULL, NULL, '2025-11-17 06:20:23', NULL, NULL, 'MODEL_COMPUTE.sql');
INSERT INTO `model_version` VALUES (6, NULL, 6, 'ceshi ', '1', NULL, NULL, 1, '1', 1, 0, 'admin', 1, '2025-11-18 10:45:41', NULL, NULL, '2025-11-18 10:45:41', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (7, NULL, 7, '来水预测模型', 'v1.0', NULL, NULL, 0, '测试', 1, 1, 'admin', 1, '2025-12-11 10:38:28', '小桐', 1, '2026-01-20 11:57:00', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (8, NULL, 8, '综合水利集成模型', '1.0', NULL, NULL, 1, '综合水利集成模型演算', 1, 0, '小桐', 1, '2025-12-31 15:40:23', NULL, NULL, '2025-12-31 15:40:24', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (9, NULL, 9, '水土保持模型', '1.0', NULL, NULL, 1, '水土保持模型', 1, 0, '小桐', 1, '2025-12-31 15:40:55', NULL, NULL, '2025-12-31 15:40:56', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (10, NULL, 10, '水土保持模型', '1.0', 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip', 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip', 1, '水土保持模型', 1, 0, '小桐', 1, '2025-12-31 18:17:47', NULL, NULL, '2025-12-31 18:17:48', NULL, NULL, '\\jgst.chaoshen.20250113\\chaoshen.20250113.py');
INSERT INTO `model_version` VALUES (11, NULL, 11, 'AI水位预测', '1.2', 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip', 'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip', 1, 'AI水位预测', 1, 0, '小桐', 1, '2025-12-31 18:25:19', NULL, NULL, '2025-12-31 18:25:20', NULL, NULL, '\\jgst.chaoshen.20250113\\chaoshen.20250113.py');
INSERT INTO `model_version` VALUES (12, NULL, 7, '来水预测模型', '2', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-14 15:26:33', '小桐', 1, '2026-01-20 13:18:54', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (13, NULL, NULL, '流量是计算', '1', 'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip', 'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip', 1, '不能为空', 1, 0, '小桐', 1, '2026-01-14 16:22:53', '小桐', 1, '2026-01-14 16:22:53', NULL, NULL, '\\jgst.chaoshen.20250113\\data.json');
INSERT INTO `model_version` VALUES (14, NULL, 12, '流量是计算', '2', NULL, NULL, 1, NULL, 1, 0, '小桐', 1, '2026-01-14 16:51:34', '小桐', 1, '2026-01-20 11:41:22', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (15, NULL, NULL, '接口服务类', '1', NULL, NULL, 1, '接口服务类', 1, 0, '小桐', 1, '2026-01-20 09:17:25', '小桐', 1, '2026-01-20 09:17:25', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (16, NULL, 12, '流量是计算', '3', NULL, NULL, 0, NULL, 1, 1, '小桐', 1, '2026-01-20 09:22:59', '小桐', 1, '2026-01-20 10:52:29', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (17, NULL, 7, '来水预测模型', '3', NULL, NULL, 0, NULL, 1, 0, '小桐', 1, '2026-01-20 11:56:45', '小桐', 1, '2026-01-20 13:18:54', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (18, NULL, 13, '接口服务类', '1', NULL, NULL, 0, 'version1', 1, 0, '小桐', 1, '2026-01-20 13:19:31', '小桐', 1, '2026-01-21 16:50:34', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (19, NULL, NULL, 'base64图片获取', '1', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-21 14:41:41', '小桐', 1, '2026-01-21 14:41:41', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (20, NULL, NULL, '测试', '1', NULL, NULL, 1, '测试', 1, 0, '小桐', 1, '2026-01-21 14:47:59', '小桐', 1, '2026-01-21 14:47:59', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (21, NULL, NULL, '测试', '1', 'http:192.1623', 'http:192.1623', 1, '1', 1, 0, '小桐', 1, '2026-01-21 15:27:04', '小桐', 1, '2026-01-21 15:27:04', NULL, NULL, NULL);
INSERT INTO `model_version` VALUES (22, NULL, 13, '接口服务类', '2', NULL, NULL, 1, 'version22', 1, 0, '小桐', 1, '2026-01-21 16:30:20', '小桐', 1, '2026-01-21 16:50:18', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `config_id_10384131482300`(`config_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

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
  `id` int NOT NULL COMMENT 'id',
  `sys_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '系统名称',
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '系统logo',
  `login_logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录页面logo',
  `carousel_image` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '轮播图',
  `contact_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `copyright` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '版权方',
  `record_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备案号',
  `del_flag` int NULL DEFAULT NULL COMMENT '删除标记',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updator_id` int NULL DEFAULT NULL COMMENT '修改人id',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_content
-- ----------------------------
INSERT INTO `system_content` VALUES (1, NULL, NULL, NULL, NULL, '400-660-8208', 'support@qiantong.tech', 'Copyright© 2026 江苏干桐科技有限公司 版权所有', '苏ICP备2022008519号-3', 0, NULL, NULL, NULL, NULL, '小桐', 1, '2025-12-31 11:56:30', NULL);

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  UNIQUE INDEX `dept_id_10384140623200`(`dept_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 110 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

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
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE,
  UNIQUE INDEX `dict_code_10384145738300`(`dict_code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

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
INSERT INTO `system_dict_data` VALUES (96, 0, '成功', '0', 'calculation_status', NULL, 'success', 'N', '0', '小桐', '2025-12-31 15:24:38', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (97, 0, '失败', '1', 'calculation_status', NULL, 'danger', 'N', '0', '小桐', '2025-12-31 15:24:46', NULL, NULL, NULL);
INSERT INTO `system_dict_data` VALUES (98, 0, 'get', '0', 'model_access_mode', NULL, 'primary', 'N', '0', '小桐', '2026-01-20 15:35:38', '小桐', '2026-01-21 14:23:31', NULL);
INSERT INTO `system_dict_data` VALUES (99, 1, 'post', '1', 'model_access_mode', NULL, 'warning', 'N', '0', '小桐', '2026-01-20 15:35:56', '小桐', '2026-01-21 14:23:42', NULL);
INSERT INTO `system_dict_data` VALUES (100, 2, 'put', '2', 'model_access_mode', NULL, 'warning', 'N', '0', '小桐', '2026-01-20 15:36:08', '小桐', '2026-01-21 14:24:40', NULL);
INSERT INTO `system_dict_data` VALUES (101, 3, 'delete', '3', 'model_access_mode', NULL, 'danger', 'N', '0', '小桐', '2026-01-20 15:36:20', '小桐', '2026-01-21 14:23:52', NULL);

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_type`;
CREATE TABLE `system_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_id_10384150883800`(`dict_id`) USING BTREE,
  UNIQUE INDEX `SYSTEM_DICT_TYPE_DICT_TYPE`(`dict_type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE IF EXISTS `system_job`;
CREATE TABLE `system_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE,
  UNIQUE INDEX `job_id_10384155056300`(`job_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

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
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE,
  UNIQUE INDEX `job_log_id_10384160114100`(`job_log_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 168 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `system_logininfor`;
CREATE TABLE `system_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  UNIQUE INDEX `info_id_10384164991400`(`info_id`) USING BTREE,
  INDEX `IDX_SYS_LOGININFOR_LT`(`login_time`) USING BTREE,
  INDEX `IDX_SYS_LOGININFOR_S`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1432 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_logininfor
-- ----------------------------
INSERT INTO `system_logininfor` VALUES (1283, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-12-30 17:48:39');
INSERT INTO `system_logininfor` VALUES (1284, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-30 18:09:36');
INSERT INTO `system_logininfor` VALUES (1285, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-30 18:12:12');
INSERT INTO `system_logininfor` VALUES (1286, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-30 18:12:16');
INSERT INTO `system_logininfor` VALUES (1287, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-30 18:17:00');
INSERT INTO `system_logininfor` VALUES (1288, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-30 18:17:05');
INSERT INTO `system_logininfor` VALUES (1289, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-30 18:17:11');
INSERT INTO `system_logininfor` VALUES (1290, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-30 18:17:45');
INSERT INTO `system_logininfor` VALUES (1291, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-30 18:18:00');
INSERT INTO `system_logininfor` VALUES (1292, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-30 18:26:18');
INSERT INTO `system_logininfor` VALUES (1293, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-30 18:33:37');
INSERT INTO `system_logininfor` VALUES (1294, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-30 18:33:49');
INSERT INTO `system_logininfor` VALUES (1295, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-31 09:03:53');
INSERT INTO `system_logininfor` VALUES (1296, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-31 09:43:04');
INSERT INTO `system_logininfor` VALUES (1297, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-31 09:48:30');
INSERT INTO `system_logininfor` VALUES (1298, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-31 10:17:49');
INSERT INTO `system_logininfor` VALUES (1299, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '退出成功', '2025-12-31 10:20:32');
INSERT INTO `system_logininfor` VALUES (1300, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '1', '验证码已失效', '2025-12-31 10:22:45');
INSERT INTO `system_logininfor` VALUES (1301, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '1', '验证码错误', '2025-12-31 10:22:49');
INSERT INTO `system_logininfor` VALUES (1302, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-31 10:22:52');
INSERT INTO `system_logininfor` VALUES (1303, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-31 10:26:44');
INSERT INTO `system_logininfor` VALUES (1304, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '退出成功', '2025-12-31 10:37:00');
INSERT INTO `system_logininfor` VALUES (1305, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-31 10:59:13');
INSERT INTO `system_logininfor` VALUES (1306, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-31 14:08:14');
INSERT INTO `system_logininfor` VALUES (1307, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-31 15:55:35');
INSERT INTO `system_logininfor` VALUES (1308, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-31 15:55:54');
INSERT INTO `system_logininfor` VALUES (1309, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-31 16:07:41');
INSERT INTO `system_logininfor` VALUES (1310, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '退出成功', '2025-12-31 16:41:56');
INSERT INTO `system_logininfor` VALUES (1311, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '1', '验证码已失效', '2025-12-31 16:48:07');
INSERT INTO `system_logininfor` VALUES (1312, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-31 16:48:10');
INSERT INTO `system_logininfor` VALUES (1313, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-31 18:01:31');
INSERT INTO `system_logininfor` VALUES (1314, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '1', '验证码已失效', '2025-12-31 18:22:56');
INSERT INTO `system_logininfor` VALUES (1315, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-31 18:22:59');
INSERT INTO `system_logininfor` VALUES (1316, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-06 11:20:25');
INSERT INTO `system_logininfor` VALUES (1317, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-06 11:42:39');
INSERT INTO `system_logininfor` VALUES (1318, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2026-01-06 11:55:47');
INSERT INTO `system_logininfor` VALUES (1319, 'qModel', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2026-01-06 11:56:04');
INSERT INTO `system_logininfor` VALUES (1320, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-06 14:58:00');
INSERT INTO `system_logininfor` VALUES (1321, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-06 14:58:46');
INSERT INTO `system_logininfor` VALUES (1322, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-06 15:11:49');
INSERT INTO `system_logininfor` VALUES (1323, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-06 16:20:55');
INSERT INTO `system_logininfor` VALUES (1324, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-06 16:23:21');
INSERT INTO `system_logininfor` VALUES (1325, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2026-01-06 16:47:46');
INSERT INTO `system_logininfor` VALUES (1326, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-06 16:47:49');
INSERT INTO `system_logininfor` VALUES (1327, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-01-06 17:11:10');
INSERT INTO `system_logininfor` VALUES (1328, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-01-06 17:11:23');
INSERT INTO `system_logininfor` VALUES (1329, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-06 17:12:29');
INSERT INTO `system_logininfor` VALUES (1330, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-06 17:16:01');
INSERT INTO `system_logininfor` VALUES (1331, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-07 08:50:06');
INSERT INTO `system_logininfor` VALUES (1332, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-07 13:28:47');
INSERT INTO `system_logininfor` VALUES (1333, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-07 14:07:42');
INSERT INTO `system_logininfor` VALUES (1334, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-07 15:26:53');
INSERT INTO `system_logininfor` VALUES (1335, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-07 17:19:14');
INSERT INTO `system_logininfor` VALUES (1336, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-07 17:19:20');
INSERT INTO `system_logininfor` VALUES (1337, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-08 09:03:31');
INSERT INTO `system_logininfor` VALUES (1338, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-08 09:50:37');
INSERT INTO `system_logininfor` VALUES (1339, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-08 09:50:41');
INSERT INTO `system_logininfor` VALUES (1340, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 09:08:59');
INSERT INTO `system_logininfor` VALUES (1341, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 09:21:41');
INSERT INTO `system_logininfor` VALUES (1342, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 10:58:21');
INSERT INTO `system_logininfor` VALUES (1343, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 13:53:50');
INSERT INTO `system_logininfor` VALUES (1344, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 16:05:25');
INSERT INTO `system_logininfor` VALUES (1345, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-01-09 16:13:49');
INSERT INTO `system_logininfor` VALUES (1346, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 16:14:07');
INSERT INTO `system_logininfor` VALUES (1347, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 16:35:05');
INSERT INTO `system_logininfor` VALUES (1348, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 17:10:30');
INSERT INTO `system_logininfor` VALUES (1349, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-09 17:19:55');
INSERT INTO `system_logininfor` VALUES (1350, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 09:07:36');
INSERT INTO `system_logininfor` VALUES (1351, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 11:20:02');
INSERT INTO `system_logininfor` VALUES (1352, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-12 14:43:26');
INSERT INTO `system_logininfor` VALUES (1353, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 14:43:32');
INSERT INTO `system_logininfor` VALUES (1354, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 15:28:19');
INSERT INTO `system_logininfor` VALUES (1355, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-12 15:31:41');
INSERT INTO `system_logininfor` VALUES (1356, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 15:31:55');
INSERT INTO `system_logininfor` VALUES (1357, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 15:32:42');
INSERT INTO `system_logininfor` VALUES (1358, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 15:41:34');
INSERT INTO `system_logininfor` VALUES (1359, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 15:48:03');
INSERT INTO `system_logininfor` VALUES (1360, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 15:53:44');
INSERT INTO `system_logininfor` VALUES (1361, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 15:58:27');
INSERT INTO `system_logininfor` VALUES (1362, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 15:59:37');
INSERT INTO `system_logininfor` VALUES (1363, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 16:03:55');
INSERT INTO `system_logininfor` VALUES (1364, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 16:10:35');
INSERT INTO `system_logininfor` VALUES (1365, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 16:32:42');
INSERT INTO `system_logininfor` VALUES (1366, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 16:36:51');
INSERT INTO `system_logininfor` VALUES (1367, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-12 17:04:34');
INSERT INTO `system_logininfor` VALUES (1368, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-12 17:14:36');
INSERT INTO `system_logininfor` VALUES (1369, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 09:13:16');
INSERT INTO `system_logininfor` VALUES (1370, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 09:13:57');
INSERT INTO `system_logininfor` VALUES (1371, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 10:51:03');
INSERT INTO `system_logininfor` VALUES (1372, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 11:09:28');
INSERT INTO `system_logininfor` VALUES (1373, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-13 11:20:44');
INSERT INTO `system_logininfor` VALUES (1374, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 11:37:27');
INSERT INTO `system_logininfor` VALUES (1375, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 11:49:01');
INSERT INTO `system_logininfor` VALUES (1376, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 15:18:54');
INSERT INTO `system_logininfor` VALUES (1377, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 17:18:50');
INSERT INTO `system_logininfor` VALUES (1378, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-13 17:57:03');
INSERT INTO `system_logininfor` VALUES (1379, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 09:09:28');
INSERT INTO `system_logininfor` VALUES (1380, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 09:22:32');
INSERT INTO `system_logininfor` VALUES (1381, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 14:19:55');
INSERT INTO `system_logininfor` VALUES (1382, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 14:46:02');
INSERT INTO `system_logininfor` VALUES (1383, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 15:41:11');
INSERT INTO `system_logininfor` VALUES (1384, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-14 15:49:35');
INSERT INTO `system_logininfor` VALUES (1385, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 15:49:39');
INSERT INTO `system_logininfor` VALUES (1386, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2026-01-14 17:23:10');
INSERT INTO `system_logininfor` VALUES (1387, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 17:23:11');
INSERT INTO `system_logininfor` VALUES (1388, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-14 17:38:13');
INSERT INTO `system_logininfor` VALUES (1389, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-14 17:38:23');
INSERT INTO `system_logininfor` VALUES (1390, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 17:38:28');
INSERT INTO `system_logininfor` VALUES (1391, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-14 18:23:03');
INSERT INTO `system_logininfor` VALUES (1392, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-15 09:19:56');
INSERT INTO `system_logininfor` VALUES (1393, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-15 09:27:45');
INSERT INTO `system_logininfor` VALUES (1394, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-15 14:38:08');
INSERT INTO `system_logininfor` VALUES (1395, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-15 15:32:35');
INSERT INTO `system_logininfor` VALUES (1396, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-15 15:49:04');
INSERT INTO `system_logininfor` VALUES (1397, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-15 15:59:21');
INSERT INTO `system_logininfor` VALUES (1398, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-15 18:09:19');
INSERT INTO `system_logininfor` VALUES (1399, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-15 18:09:24');
INSERT INTO `system_logininfor` VALUES (1400, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-16 08:59:49');
INSERT INTO `system_logininfor` VALUES (1401, 'qThing', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-01-19 16:11:42');
INSERT INTO `system_logininfor` VALUES (1402, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2026-01-19 16:14:05');
INSERT INTO `system_logininfor` VALUES (1403, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-19 16:14:09');
INSERT INTO `system_logininfor` VALUES (1404, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 09:15:00');
INSERT INTO `system_logininfor` VALUES (1405, 'swwater', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2026-01-20 09:35:01');
INSERT INTO `system_logininfor` VALUES (1406, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-20 09:35:12');
INSERT INTO `system_logininfor` VALUES (1407, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2026-01-20 09:35:16');
INSERT INTO `system_logininfor` VALUES (1408, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 09:35:19');
INSERT INTO `system_logininfor` VALUES (1409, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 10:32:32');
INSERT INTO `system_logininfor` VALUES (1410, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 11:08:30');
INSERT INTO `system_logininfor` VALUES (1411, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 11:20:16');
INSERT INTO `system_logininfor` VALUES (1412, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 11:26:39');
INSERT INTO `system_logininfor` VALUES (1413, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 11:49:44');
INSERT INTO `system_logininfor` VALUES (1414, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 11:53:54');
INSERT INTO `system_logininfor` VALUES (1415, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 11:56:02');
INSERT INTO `system_logininfor` VALUES (1416, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 13:58:11');
INSERT INTO `system_logininfor` VALUES (1417, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-20 15:40:14');
INSERT INTO `system_logininfor` VALUES (1418, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-20 15:56:16');
INSERT INTO `system_logininfor` VALUES (1419, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 09:04:07');
INSERT INTO `system_logininfor` VALUES (1420, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2026-01-21 09:11:19');
INSERT INTO `system_logininfor` VALUES (1421, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 09:11:23');
INSERT INTO `system_logininfor` VALUES (1422, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 13:14:48');
INSERT INTO `system_logininfor` VALUES (1423, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 13:32:10');
INSERT INTO `system_logininfor` VALUES (1424, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 13:38:05');
INSERT INTO `system_logininfor` VALUES (1425, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 14:20:12');
INSERT INTO `system_logininfor` VALUES (1426, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 15:40:11');
INSERT INTO `system_logininfor` VALUES (1427, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 16:28:13');
INSERT INTO `system_logininfor` VALUES (1428, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 17:52:46');
INSERT INTO `system_logininfor` VALUES (1429, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-21 18:18:18');
INSERT INTO `system_logininfor` VALUES (1430, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-22 09:09:50');
INSERT INTO `system_logininfor` VALUES (1431, 'qModel', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-22 09:28:49');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `route_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `menu_type` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `menu_id_10384169740300`(`menu_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2253 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, '系统管理', 0, 40, 'system', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-m', 'admin', '2024-05-06 06:12:17', '小桐', '2025-12-31 10:03:45', '系统管理目录');
INSERT INTO `system_menu` VALUES (2, '系统监控', 0, 70, 'monitor', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-watch', 'admin', '2024-05-06 06:12:17', '小桐', '2025-12-31 10:04:15', '系统监控目录');
INSERT INTO `system_menu` VALUES (3, '系统工具', 0, 60, 'tool', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'system-tool', 'admin', '2024-05-06 06:12:17', '小桐', '2025-12-31 10:04:03', '系统工具目录');
INSERT INTO `system_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/system/user/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:13', '用户管理菜单');
INSERT INTO `system_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/system/role/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:36', '角色管理菜单');
INSERT INTO `system_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/system/menu/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-06 06:12:17', NULL, NULL, '菜单管理菜单');
INSERT INTO `system_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/system/dept/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:49', '部门管理菜单');
INSERT INTO `system_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/system/post/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-06 06:12:17', NULL, NULL, '岗位管理菜单');
INSERT INTO `system_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/system/dict/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-06 06:12:17', NULL, NULL, '字典管理菜单');
INSERT INTO `system_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/system/config/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-05-06 06:12:17', 'admin', '2025-02-27 11:18:57', '参数设置菜单');
INSERT INTO `system_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/system/notice/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-06 06:12:17', NULL, NULL, '通知公告菜单');
INSERT INTO `system_menu` VALUES (108, '日志管理', 1, 9, 'log', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'log', 'admin', '2024-05-06 06:12:17', NULL, NULL, '日志管理菜单');
INSERT INTO `system_menu` VALUES (109, '在线用户', 2, 1, 'online', 'system/monitor/online/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-06 06:12:17', NULL, NULL, '在线用户菜单');
INSERT INTO `system_menu` VALUES (110, '定时任务', 2, 2, 'job', 'system/monitor/job/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-06 06:12:17', NULL, NULL, '定时任务菜单');
INSERT INTO `system_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'system/monitor/druid/index', NULL, 1, 0, NULL, 'C', '1', '1', 'monitor:druid:list', 'druid', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 14:06:21', '数据监控菜单');
INSERT INTO `system_menu` VALUES (112, '服务监控', 2, 4, 'server', 'system/monitor/server/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-06 06:12:17', NULL, NULL, '服务监控菜单');
INSERT INTO `system_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'system/monitor/cache/index', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-06 06:12:17', NULL, NULL, '缓存监控菜单');
INSERT INTO `system_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'system/monitor/cache/list', NULL, 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-06 06:12:17', NULL, NULL, '缓存列表菜单');
INSERT INTO `system_menu` VALUES (115, '表单构建', 3, 1, 'build', 'system/tool/build/index', NULL, 1, 0, NULL, 'C', '1', '1', 'tool:build:list', 'build', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 14:05:59', '表单构建菜单');
INSERT INTO `system_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'system/tool/gen/index', NULL, 1, 0, NULL, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-06 06:12:17', NULL, NULL, '代码生成菜单');
INSERT INTO `system_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'system/tool/swagger/index', NULL, 1, 0, NULL, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-06 06:12:17', NULL, NULL, '系统接口菜单');
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
INSERT INTO `system_menu` VALUES (2244, '模型分类', 2250, 0, 'type', 'model/modelClassify/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-14 10:06:39', '小桐', '2026-01-15 18:06:27', NULL);
INSERT INTO `system_menu` VALUES (2245, '模型管理', 2243, 1, 'version', 'model/modelManage/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-14 15:32:43', '小桐', '2026-01-15 10:11:47', NULL);
INSERT INTO `system_menu` VALUES (2246, '模型输入管理', 2243, 2, 'input', 'model/inputList/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-17 04:34:18', '小桐', '2026-01-16 09:13:25', NULL);
INSERT INTO `system_menu` VALUES (2247, '模型输出管理', 2243, 3, 'output', 'model/outputList/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-17 04:34:46', '小桐', '2026-01-16 09:14:28', NULL);
INSERT INTO `system_menu` VALUES (2248, '模拟计算', 2252, 4, 'compute', 'model/computeList/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-17 04:35:16', '小桐', '2026-01-15 18:08:05', NULL);
INSERT INTO `system_menu` VALUES (2249, '历史记录', 2251, 5, 'operate', 'model/operateList/index', NULL, 1, 0, NULL, 'C', '0', '0', NULL, '#', 'admin', '2025-11-17 04:35:45', '小桐', '2026-01-15 18:09:07', NULL);
INSERT INTO `system_menu` VALUES (2250, '类目管理', 0, 10, 'model/modelClassify', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'category-management', 'admin', '2025-12-29 16:06:15', '小桐', '2025-12-31 09:57:57', NULL);
INSERT INTO `system_menu` VALUES (2251, '计算历史', 0, 13, 'model/operateList', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'calculate-history', 'admin', '2025-12-29 16:09:40', '小桐', '2025-12-31 10:02:09', NULL);
INSERT INTO `system_menu` VALUES (2252, '模型计算', 0, 12, 'model/computeList', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'model-calculation', 'admin', '2025-12-29 16:18:52', '小桐', '2026-01-06 12:01:25', NULL);

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE,
  UNIQUE INDEX `notice_id_10384175094700`(`notice_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO `system_notice` VALUES (12, 'qModel 模型服务平台正式上线！', '2', 0x3C703EE98EB4E6889CE6BB91E5AFB0E5A0A5E78FAEE98D8FE69D91E6B9B4E780B9EFBD85E7ABB7E9949BE5AEB74D6F64656C266E6273703BE5A6AFE280B3E780B7E98F88E5B685E5A79FE9AA9EE586B2E5BDB4E6B59CE5BA9DE7B296E98F83E383A6EE849CE5AFAEE5BF8EE7AC82E7BBBEE58CA1E7B492E6B5A3E6BB80E8B49FE98F82E9A281E7ABB4E6B5A0EFBD86E6ABA4E991B3E88AA5C481E98DA8E5ACACEE85B8E9909EE59795E7AC8CE98F88E5B685E5A79FE98D96E6A0A7E992A9E98D99E5B8AEE7B49D714D6F64656C266E6273703BE98F83E384A5E6B9AAE98EB5E692BBEFBFBDE6B0ABE7B2A0E5A6AFE280B3E780B7E5AFAEEFBFBDE98D99E68899EFBFBDE4BDBDEE8684E7BC81E586A6EFBFBDE4BE80E584B4E7BC83E68F92E59F8CE690B4E69782E695A4E990A8E58BABE58F8FE996BEE68D90E79FBEE5A8B4E4BDBAE296BCE9949BE5B1BDE5A7AAE98D94E6B69AEE9D96E990AEE69780E6BA80E98F8BE58BA9EFBFBDE4BDB9E69682E690B4E6BB88E584B4E99782E384A5E5BCB7E6B5BCE4BDB7E7AC9FE780B9E782B5E5B987E988A5E6BB84C481E98DA8E5ACAAE5B586E98F88E5B685E5A79FE988A5E6BF88E6AE91E6A582E6A8BBE699A5E98D97E5BF93E68293E98A86EFBFBD2F702667743B3C2F703E3C703E3C62723E3C2F703E3C703EE9AA9EE586B2E5BDB4E98F80EE889BE5AF94E6BEB6E6B0B3EE87A2E791B7EFBFBDE5A6AFE280B3E780B7E98EBAE383A5E58F86E9949BE59CA57974686F6E2F4A6176612F455845E9949BE5A488EFBFBDE4BDBDE59A9CE98D94E384A5E5AFB2E780B9E791B0E6AB92E98D96E6A0ADE584B4E7BC83E5B182EFBFBDE4B8845049266E6273703BE98F8DE59BA7E599AFE98D96E6A0A7E5BD82E794AFE586BFE7B49DE9AA9EE888B5E5BD81E6B89AE6B699C481E98DA8E5ACADE780BAE98D9AE5A09BEFBFBDE4BDBAE7B4AAE98EBAE68E8BEFBFBDE4BDBAE6B483E98EBAD185E79391E6A582E6A8BCE9AA87E991B3E89789E5A78FE98A86E5829CE6B4B0E98D93E5B685E587A1E98EB4E684ACE5A79BE99786E59798E59E9AE5A798E69D91E59F84E98A86E4BDB9E79AB5E7929EC2B0EFBFBDE4BDB7E6B0A6E996ABE6B0B1E79391E6BEB6E6B0ABE9879CE7909BE5B1BCE7AC9FE98DA6E78398E6AB99E5A6AFE280B3E780B7E9949BE5B1BDE58F8FE99788E388A1E695AEE98EB8E4BDB8E6B597E6B59CD183E5AFB2E9909CEE889AEE95A8E996AEE384A7E8AEB2E98A86EFBFBD2F702667743B3C2F703E3C703E3C62723E3C2F703E3C703EE98F88EE8185E6BDB5E9949BE5AEB74D6F64656C266E6273703BE7818FE59798E5AF94E7BC81EE85A1E587AFE6B5A0EFBD8FE7B49DE98EB5E692BBEFBFBDE78AB2E7B491E98F80E4BFB1EFBFBDE4BDB8E795A8E98D8FE384A3EFBFBDE4BE80E78FAEE98F81E5A0A2E6AE91E5A6AFE280B3E780B7E990A2E786B8EFBFBDE4BDB7E7B68BE7BBAFE6B187EFBFBDE5829BEE82BDE69DA9E5BAA1E7AE8DE6BEB6D183E7B491E98D99E688A3EFBFBDE591ADE68BB0E990A2E384A6E59F9BE5A889E384A5E594BDE6B5A3E8B7A8E695A4E9949BE5B1BDE58FA1E98D9AE5B1BEE5B8B0E7BBB1E388A1E6ABA4E991B3E88AA5C481E98DA8E5ACACE6AE91E98F83E78ABBE6AABAE98D99EE889DE58598E9949BEFBFBD2F702667743B3C2F703E, '0', '小桐', '2025-12-30 11:32:59', '小桐', '2025-12-30 14:01:41', NULL);
INSERT INTO `system_notice` VALUES (13, 'qModel期待与您携手共建知识体系！', '1', 0x3C703EE98F88E786B7E7B79FE98EAEE384A7E6AE91E98D94E78AB2E58F863C2F703E, '0', '小桐', '2025-12-30 14:01:26', '小桐', '2025-12-30 14:01:37', NULL);

-- ----------------------------
-- Table structure for system_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `system_oper_log`;
CREATE TABLE `system_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  UNIQUE INDEX `oper_id_10384179702000`(`oper_id`) USING BTREE,
  INDEX `IDX_SYS_OPER_LOG_BT`(`business_type`) USING BTREE,
  INDEX `IDX_SYS_OPER_LOG_OT`(`oper_time`) USING BTREE,
  INDEX `IDX_SYS_OPER_LOG_S`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2788 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oper_log
-- ----------------------------
INSERT INTO `system_oper_log` VALUES (2586, '模型库的重构表', 1, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":1,\"classifyId\":30,\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:17:47\",\"creatorId\":1,\"description\":\"水土保持模型\",\"fileName\":\"jgst.chaoshen.20250113.zip\",\"id\":10,\"interfaceorfileAddress\":\"http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip\",\"name\":\"水土保持模型\",\"params\":{},\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"version\":\"1.0\",\"versionId\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:17:47', 891);
INSERT INTO `system_oper_log` VALUES (2587, '模型库的重构表', 3, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/modelReconstitution/model/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:18:08', 316);
INSERT INTO `system_oper_log` VALUES (2588, '模型输入管理 ', 1, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/modelReconstitution/input', '127.0.0.1', '内网IP', '{\"changeFlag\":true,\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:21:14\",\"engName\":\"P\",\"id\":4,\"modelId\":10,\"modelName\":\"水土保持模型\",\"modelVersion\":\"1\",\"multipleContent\":\"[]\",\"name\":\"水位\",\"params\":{},\"singleContent\":\"[]\",\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:21:14', 351);
INSERT INTO `system_oper_log` VALUES (2589, '模型计算管理 ', 1, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelCaclReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/modelReconstitution/cacl', '127.0.0.1', '内网IP', '{\"addressType\":0,\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:22:00\",\"creatorId\":1,\"id\":5,\"modelId\":10,\"modelName\":\"水土保持模型\",\"modelVersion\":\"1\",\"name\":\"水位计算\",\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:22:00', 1112);
INSERT INTO `system_oper_log` VALUES (2590, '模型库的重构表', 3, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/modelReconstitution/model/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:24:46', 534);
INSERT INTO `system_oper_log` VALUES (2591, '模型库的重构表', 1, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":24,\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"description\":\"AI水位预测\",\"fileName\":\"jgst.chaoshen.20250113.zip\",\"id\":11,\"interfaceorfileAddress\":\"http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip\",\"name\":\"AI水位预测\",\"params\":{},\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"version\":\"1.2\",\"versionId\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:25:19', 1034);
INSERT INTO `system_oper_log` VALUES (2592, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"AI水位预测\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测\",\"params\":{},\"publishTime\":\"2025-12-31\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2025-12-31 18:25:35\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:25:35', 1184);
INSERT INTO `system_oper_log` VALUES (2593, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"跨流域调水仿真\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测1\",\"params\":{},\"publishTime\":\"2026-01-06\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2026-01-06 11:20:42\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 11:20:45', 536);
INSERT INTO `system_oper_log` VALUES (2594, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"跨流域调水仿真\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测\",\"params\":{},\"publishTime\":\"2026-01-06\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2026-01-06 11:20:59\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 11:21:02', 622);
INSERT INTO `system_oper_log` VALUES (2595, '模型输入管理 ', 1, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/modelReconstitution/input', '127.0.0.1', '内网IP', '{\"changeFlag\":true,\"createBy\":\"小桐\",\"createTime\":\"2026-01-06 11:43:32\",\"engName\":\"123\",\"id\":5,\"modelId\":11,\"modelName\":\"AI水位预测\",\"modelVersion\":\"1\",\"multipleContent\":\"[]\",\"name\":\"q\",\"params\":{},\"singleContent\":\"[]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 11:43:33', 345);
INSERT INTO `system_oper_log` VALUES (2596, '模型输入管理 ', 1, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/modelReconstitution/input', '127.0.0.1', '内网IP', '{\"changeFlag\":true,\"createBy\":\"小桐\",\"createTime\":\"2026-01-06 11:44:06\",\"engName\":\"123\",\"id\":6,\"modelId\":11,\"modelName\":\"AI水位预测\",\"modelVersion\":\"1\",\"multipleContent\":\"[{\\\"name\\\":\\\"q\\\",\\\"value\\\":\\\"1\\\",\\\"order\\\":2,\\\"index\\\":1}]\",\"name\":\"q\",\"params\":{},\"singleContent\":\"[]\",\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 11:44:07', 675);
INSERT INTO `system_oper_log` VALUES (2597, '模型输入管理 ', 3, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/modelReconstitution/input/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 11:44:24', 377);
INSERT INTO `system_oper_log` VALUES (2598, '模型输入管理 ', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/input', '127.0.0.1', '内网IP', '{\"changeFlag\":true,\"createBy\":\"小桐\",\"createTime\":\"2026-01-06 11:44:06\",\"delFlag\":false,\"engName\":\"123\",\"id\":6,\"modelId\":11,\"modelName\":\"AI水位预测\",\"modelVersion\":\"1\",\"multipleContent\":\"[{\\\"name\\\":\\\"q\\\",\\\"value\\\":\\\"1\\\",\\\"order\\\":2,\\\"index\\\":1}]\",\"name\":\"q\",\"params\":{},\"singleContent\":\"[]\",\"type\":1,\"updateTime\":\"2026-01-06 11:45:07\",\"validFlag\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 11:45:08', 212);
INSERT INTO `system_oper_log` VALUES (2599, '模型输入管理 ', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/input', '127.0.0.1', '内网IP', '{\"changeFlag\":true,\"createBy\":\"小桐\",\"createTime\":\"2026-01-06 11:44:06\",\"delFlag\":false,\"engName\":\"123\",\"id\":6,\"modelId\":11,\"modelName\":\"AI水位预测\",\"modelVersion\":\"1\",\"multipleContent\":\"[{\\\"name\\\":\\\"q\\\",\\\"value\\\":\\\"1\\\",\\\"order\\\":2,\\\"index\\\":1}]\",\"name\":\"q\",\"params\":{},\"singleContent\":\"[]\",\"type\":1,\"updateTime\":\"2026-01-06 11:48:17\",\"validFlag\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 11:48:18', 354);
INSERT INTO `system_oper_log` VALUES (2600, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-29 16:18:52\",\"icon\":\"model-calculation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2252,\"menuName\":\"模型计算\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"model/modelCompute\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 11:59:23', 528);
INSERT INTO `system_oper_log` VALUES (2601, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"model/modelCompute\",\"createTime\":\"2025-11-17 04:35:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2248,\"menuName\":\"模拟计算\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2252,\"path\":\"compute\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 12:00:19', 607);
INSERT INTO `system_oper_log` VALUES (2602, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-29 16:18:52\",\"icon\":\"model-calculation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2252,\"menuName\":\"模型计算\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"model/computeList\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 12:01:25', 476);
INSERT INTO `system_oper_log` VALUES (2603, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"model/computeList\",\"createTime\":\"2025-11-17 04:35:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2248,\"menuName\":\"模拟计算\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2252,\"path\":\"compute\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 12:01:37', 751);
INSERT INTO `system_oper_log` VALUES (2604, '模型计算管理 ', 3, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelCaclReconstitutionController.calculate()', 'GET', 1, 'qModel', '研发部门', '/modelReconstitution/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 12:07:39', 586);
INSERT INTO `system_oper_log` VALUES (2605, '模型输入管理 ', 1, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/modelReconstitution/input', '127.0.0.1', '内网IP', '{\"changeFlag\":false,\"createBy\":\"小桐\",\"createTime\":\"2026-01-06 13:58:57\",\"delFlag\":false,\"engName\":\"name\",\"id\":7,\"modelId\":5,\"modelName\":\"单机程序\",\"modelVersion\":\"1\",\"multipleContent\":\"[]\",\"name\":\"测试\",\"params\":{},\"singleContent\":\"[]\",\"type\":0,\"updateTime\":\"2026-01-06 11:48:17\",\"validFlag\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 13:59:00', 200);
INSERT INTO `system_oper_log` VALUES (2606, '模型输入管理 ', 3, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/modelReconstitution/input/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 13:59:32', 179);
INSERT INTO `system_oper_log` VALUES (2607, ' 模型输出管理', 1, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelOutputReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/modelReconstitution/output', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-06 14:47:18\",\"creatorId\":1,\"engName\":\"weater\",\"id\":3,\"modelId\":5,\"modelName\":\"单机程序\",\"modelVersion\":\"1\",\"multipleContent\":\"[]\",\"name\":\"水利11\",\"params\":{},\"singleContent\":\"[]\",\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 14:47:21', 269);
INSERT INTO `system_oper_log` VALUES (2608, ' 模型输出管理', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelOutputReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/output', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-06 14:47:18\",\"creatorId\":1,\"delFlag\":false,\"engName\":\"weater\",\"id\":3,\"modelId\":5,\"modelName\":\"单机程序\",\"modelVersion\":\"1\",\"multipleContent\":\"[]\",\"name\":\"水利1112\",\"params\":{},\"singleContent\":\"[]\",\"type\":0,\"updateTime\":\"2026-01-06 14:47:24\",\"validFlag\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 14:47:27', 160);
INSERT INTO `system_oper_log` VALUES (2609, ' 模型输出管理', 3, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelOutputReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/modelReconstitution/output/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 14:47:33', 450);
INSERT INTO `system_oper_log` VALUES (2610, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/81', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 15:50:48', 1470);
INSERT INTO `system_oper_log` VALUES (2611, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/82', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 15:50:54', 771);
INSERT INTO `system_oper_log` VALUES (2612, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/89', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 15:50:58', 325);
INSERT INTO `system_oper_log` VALUES (2613, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 16:08:32', 4944);
INSERT INTO `system_oper_log` VALUES (2614, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 16:08:36', 5608);
INSERT INTO `system_oper_log` VALUES (2615, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/122', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 16:09:06', 659);
INSERT INTO `system_oper_log` VALUES (2616, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"model\",\"className\":\"model\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":1884,\"columnName\":\"ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-06 16:08:29\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":121,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":1885,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-06 16:08:29\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":121,\"usableColumn\":false},{\"capJavaField\":\"ClassifyId\",\"columnComment\":\"分类id\",\"columnId\":1886,\"columnName\":\"CLASSIFY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-06 16:08:29\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"classifyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":121,\"usableColumn\":false},{\"capJavaField\":\"ANCESTORS\",\"columnComment\":\"父级和自己id\",\"columnId\":1887,\"columnName\":\"ANCESTORS\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-06 16:08:29\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ANCESTORS\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"qu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 16:12:05', 4168);
INSERT INTO `system_oper_log` VALUES (2617, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"跨流域调水仿真\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测1\",\"params\":{},\"publishTime\":\"2026-01-06\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2026-01-06 16:12:30\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 16:12:33', 430);
INSERT INTO `system_oper_log` VALUES (2618, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"跨流域调水仿真\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测\",\"params\":{},\"publishTime\":\"2026-01-06\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2026-01-06 16:12:35\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 16:12:38', 217);
INSERT INTO `system_oper_log` VALUES (2619, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL\"}', NULL, 0, NULL, '2026-01-06 16:14:08', 888);
INSERT INTO `system_oper_log` VALUES (2620, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"跨流域调水仿真\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测1\",\"params\":{},\"publishTime\":\"2026-01-06\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2026-01-06 16:48:04\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 16:48:07', 516);
INSERT INTO `system_oper_log` VALUES (2621, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"跨流域调水仿真\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测\",\"params\":{},\"publishTime\":\"2026-01-06\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2026-01-06 16:48:19\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 16:48:22', 171);
INSERT INTO `system_oper_log` VALUES (2622, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"跨流域调水仿真\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测1\",\"params\":{},\"publishTime\":\"2026-01-06\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2026-01-06 17:13:57\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 17:14:01', 1004);
INSERT INTO `system_oper_log` VALUES (2623, '模型库的重构表', 2, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/modelReconstitution/model', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":0,\"classifyId\":29,\"classifyName\":\"跨流域调水仿真\",\"createBy\":\"小桐\",\"createTime\":\"2025-12-31 18:25:19\",\"creatorId\":1,\"delFlag\":false,\"description\":\"AI水位预测\",\"id\":11,\"name\":\"AI水位预测\",\"params\":{},\"publishTime\":\"2026-01-06\",\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\chaoshen.20250113.py\",\"updateTime\":\"2026-01-06 17:14:08\",\"version\":\"1.2\",\"versionId\":11,\"whetherPublish\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-06 17:14:12', 340);
INSERT INTO `system_oper_log` VALUES (2624, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"model\",\"className\":\"Model\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":1884,\"columnName\":\"ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-06 16:08:29\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":121,\"updateTime\":\"2026-01-06 16:12:01\",\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":1885,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-06 16:08:29\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":121,\"updateTime\":\"2026-01-06 16:12:02\",\"usableColumn\":false},{\"capJavaField\":\"ClassifyId\",\"columnComment\":\"分类id\",\"columnId\":1886,\"columnName\":\"CLASSIFY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-06 16:08:29\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"classifyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":121,\"updateTime\":\"2026-01-06 16:12:02\",\"usableColumn\":false},{\"capJavaField\":\"ANCESTORS\",\"columnComment\":\"父级和自己id\",\"columnId\":1887,\"columnName\":\"ANCESTORS\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-06 16:08:29\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-07 08:53:29', 3254);
INSERT INTO `system_oper_log` VALUES (2625, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL\"}', NULL, 0, NULL, '2026-01-07 08:54:16', 570);
INSERT INTO `system_oper_log` VALUES (2626, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_CLASSIFY\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-07 10:12:57', 2935);
INSERT INTO `system_oper_log` VALUES (2627, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Classify\",\"className\":\"ModelClassify\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":1940,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-07 10:12:55\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":123,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":1941,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-07 10:12:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":123,\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父级id\",\"columnId\":1942,\"columnName\":\"PARENT_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-07 10:12:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":123,\"usableColumn\":true},{\"capJavaField\":\"ANCESTORS\",\"columnComment\":\"祖籍列表\",\"columnId\":1943,\"columnName\":\"ANCESTORS\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-07 10:12:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ANCESTORS\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"q', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-07 10:14:47', 1435);
INSERT INTO `system_oper_log` VALUES (2628, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_CLASSIFY\"}', NULL, 0, NULL, '2026-01-07 10:17:34', 583);
INSERT INTO `system_oper_log` VALUES (2629, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Classify\",\"className\":\"ModelClassify\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":1940,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-07 10:12:55\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":123,\"updateTime\":\"2026-01-07 10:14:46\",\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":1941,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-07 10:12:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":123,\"updateTime\":\"2026-01-07 10:14:46\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父级id\",\"columnId\":1942,\"columnName\":\"PARENT_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-07 10:12:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":123,\"updateTime\":\"2026-01-07 10:14:46\",\"usableColumn\":true},{\"capJavaField\":\"ANCESTORS\",\"columnComment\":\"祖籍列表\",\"columnId\":1943,\"columnName\":\"ANCESTORS\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-07 10:12:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isReq', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-07 10:25:24', 2181);
INSERT INTO `system_oper_log` VALUES (2630, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_CLASSIFY\"}', NULL, 0, NULL, '2026-01-07 10:25:26', 563);
INSERT INTO `system_oper_log` VALUES (2631, '模型分类', 2, 'tech.qiantong.qmodel.module.model.controller.admin.classify.ModelClassifyController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/classify', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,1\",\"createBy\":\"admin\",\"createTime\":\"2025-11-14 18:32:20\",\"creatorId\":1,\"description\":\"产汇流信息\",\"id\":2,\"name\":\"产汇流\",\"params\":{},\"parentId\":1,\"remark\":\"备注\",\"updateTime\":\"2025-12-11 10:08:14\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-07 14:09:38', 1100);
INSERT INTO `system_oper_log` VALUES (2632, '模型库的重构表', 3, 'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/modelReconstitution/model/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 09:04:02', 368);
INSERT INTO `system_oper_log` VALUES (2633, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-20 22:54:16\",\"icon\":\"code_new_iocn\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"实例演示\",\"menuType\":\"M\",\"orderNum\":80,\"params\":{},\"parentId\":0,\"path\":\"example\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 09:51:23', 592);
INSERT INTO `system_oper_log` VALUES (2634, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-20 22:54:16\",\"icon\":\"code_new_iocn\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"实例演示\",\"menuType\":\"M\",\"orderNum\":80,\"params\":{},\"parentId\":0,\"path\":\"example\",\"status\":\"1\",\"updateBy\":\"小桐\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 17:35:00', 479);
INSERT INTO `system_oper_log` VALUES (2635, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_HISTORY\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:07:35', 3797);
INSERT INTO `system_oper_log` VALUES (2636, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_HISTORY\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:07:37', 4842);
INSERT INTO `system_oper_log` VALUES (2637, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_HISTORY\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:07:38', 4523);
INSERT INTO `system_oper_log` VALUES (2638, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/126', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:07:57', 707);
INSERT INTO `system_oper_log` VALUES (2639, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/125', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:08:00', 680);
INSERT INTO `system_oper_log` VALUES (2640, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"History\",\"className\":\"ModelHistory\",\"columns\":[{\"capJavaField\":\"ID\",\"columnId\":1955,\"columnName\":\"ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:07:31\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":124,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnId\":1956,\"columnName\":\"COMPANY_ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:07:32\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":124,\"usableColumn\":false},{\"capJavaField\":\"ModelId\",\"columnId\":1957,\"columnName\":\"MODEL_ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:07:32\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":124,\"usableColumn\":false},{\"capJavaField\":\"ModelName\",\"columnId\":1958,\"columnName\":\"MODEL_NAME\",\"columnType\":\"VARCHAR\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:07:32\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":4,\"superColumn\":false,\"tableId\":124,\"usableColumn\":fals', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:09:07', 3196);
INSERT INTO `system_oper_log` VALUES (2641, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_HISTORY\"}', NULL, 0, NULL, '2026-01-09 13:09:17', 1384);
INSERT INTO `system_oper_log` VALUES (2642, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/124', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:22:14', 314);
INSERT INTO `system_oper_log` VALUES (2643, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_HISTORY\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:22:23', 4843);
INSERT INTO `system_oper_log` VALUES (2644, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_HISTORY\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:22:23', 3231);
INSERT INTO `system_oper_log` VALUES (2645, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/128', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:22:26', 505);
INSERT INTO `system_oper_log` VALUES (2646, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Hhistory\",\"className\":\"ModelHistory\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"主键id\",\"columnId\":2003,\"columnName\":\"ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:22:20\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":127,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":2004,\"columnName\":\"COMPANY_ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:22:20\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":127,\"usableColumn\":false},{\"capJavaField\":\"ModelId\",\"columnComment\":\"所属模型id\",\"columnId\":2005,\"columnName\":\"MODEL_ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:22:20\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":127,\"usableColumn\":false},{\"capJavaField\":\"ModelName\",\"columnComment\":\"所属模型名称\",\"columnId\":2008,\"columnName\":\"MODEL_NAME\",\"columnType\":\"VARCHAR\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:22:21\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:23:24', 2318);
INSERT INTO `system_oper_log` VALUES (2647, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_OUTPUT,MODEL_INPUT\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:54:07', 6547);
INSERT INTO `system_oper_log` VALUES (2648, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Input\",\"className\":\"ModelInput\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":2035,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:02\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":129,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业Id\",\"columnId\":2036,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:02\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":129,\"usableColumn\":false},{\"capJavaField\":\"NAME\",\"columnComment\":\"参数名称\",\"columnId\":2037,\"columnName\":\"NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:02\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"NAME\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":129,\"usableColumn\":false},{\"capJavaField\":\"EngName\",\"columnComment\":\"英文名称\",\"columnId\":2038,\"columnName\":\"ENG_NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:02\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"engName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:56:33', 3504);
INSERT INTO `system_oper_log` VALUES (2649, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Output\",\"className\":\"ModelOutput\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":2058,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:05\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":130,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业Id\",\"columnId\":2059,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:05\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":130,\"usableColumn\":false},{\"capJavaField\":\"NAME\",\"columnComment\":\"参数名称\",\"columnId\":2060,\"columnName\":\"NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:05\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"NAME\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":130,\"usableColumn\":false},{\"capJavaField\":\"EngName\",\"columnComment\":\"英文名称\",\"columnId\":2061,\"columnName\":\"ENG_NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:05\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"engName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:57:26', 2999);
INSERT INTO `system_oper_log` VALUES (2650, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_OUTPUT,MODEL_INPUT\"}', NULL, 0, NULL, '2026-01-09 13:57:37', 1394);
INSERT INTO `system_oper_log` VALUES (2651, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Output\",\"className\":\"ModelOutput\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":2058,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:05\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":130,\"updateTime\":\"2026-01-09 13:57:24\",\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业Id\",\"columnId\":2059,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:05\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":130,\"updateTime\":\"2026-01-09 13:57:24\",\"usableColumn\":false},{\"capJavaField\":\"NAME\",\"columnComment\":\"参数名称\",\"columnId\":2060,\"columnName\":\"NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:05\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"NAME\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":130,\"updateTime\":\"2026-01-09 13:57:24\",\"usableColumn\":false},{\"capJavaField\":\"EngName\",\"columnComment\":\"英文名称\",\"columnId\":2061,\"columnName\":\"ENG_NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 13:54:05\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 13:59:56', 2320);
INSERT INTO `system_oper_log` VALUES (2652, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_OUTPUT,MODEL_INPUT\"}', NULL, 0, NULL, '2026-01-09 14:00:03', 1414);
INSERT INTO `system_oper_log` VALUES (2653, '模型输出管理', 1, 'tech.qiantong.qmodel.module.model.controller.admin.output.ModelOutputController.add()', 'POST', 1, 'qModel', '研发部门', '/model/output', '127.0.0.1', '内网IP', '{\"description\":\"qqq\",\"engName\":\"q\",\"modelId\":5,\"modelName\":\"单机程序\",\"modelVersion\":\"1\",\"multipleContent\":\"[]\",\"name\":\"测试新增\",\"params\":{},\"singleContent\":\"\\\"0\\\"\",\"type\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-09 16:26:54', 1229);
INSERT INTO `system_oper_log` VALUES (2654, '模型输入管理', 1, 'tech.qiantong.qmodel.module.model.controller.admin.input.ModelInputController.add()', 'POST', 1, 'qModel', '研发部门', '/model/input', '127.0.0.1', '内网IP', '{\"changeFlag\":true,\"description\":\"说明\",\"engName\":\"level\",\"modelId\":5,\"modelName\":\"单机程序\",\"modelVersion\":\"1\",\"multipleContent\":\"[]\",\"name\":\"q\",\"params\":{},\"singleContent\":\"[]\",\"type\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-09 16:35:37', 729);
INSERT INTO `system_oper_log` VALUES (2655, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_OPERATE\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 16:43:48', 4450);
INSERT INTO `system_oper_log` VALUES (2656, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Operate\",\"className\":\"ModelOperate\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":2078,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 16:43:45\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":131,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":2079,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 16:43:45\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":131,\"usableColumn\":false},{\"capJavaField\":\"ModuleName\",\"columnComment\":\"操作模块\",\"columnId\":2080,\"columnName\":\"MODULE_NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 16:43:45\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"moduleName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":131,\"usableColumn\":false},{\"capJavaField\":\"TYPE\",\"columnComment\":\"操作类型\",\"columnId\":2081,\"columnName\":\"TYPE\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 16:43:45\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"TYPE\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryTy', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 16:45:11', 4058);
INSERT INTO `system_oper_log` VALUES (2657, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_OPERATE\"}', NULL, 0, NULL, '2026-01-09 16:45:26', 1538);
INSERT INTO `system_oper_log` VALUES (2658, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_INTERFACE_ADDRESS\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 17:20:30', 5665);
INSERT INTO `system_oper_log` VALUES (2659, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_VERSION\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 17:20:58', 3038);
INSERT INTO `system_oper_log` VALUES (2660, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"address\",\"className\":\"ModelInterfaceAddress\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"id\",\"columnId\":2098,\"columnName\":\"ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:26\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":132,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":2099,\"columnName\":\"COMPANY_ID\",\"columnType\":\"NUMBER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:27\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":132,\"usableColumn\":false},{\"capJavaField\":\"ModelId\",\"columnComment\":\"模型id\",\"columnId\":2100,\"columnName\":\"MODEL_ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:27\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":132,\"usableColumn\":false},{\"capJavaField\":\"InterfaceAddress\",\"columnComment\":\"接口地址\",\"columnId\":2101,\"columnName\":\"INTERFACE_ADDRESS\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:27\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"interfaceAddress\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 17:25:27', 4672);
INSERT INTO `system_oper_log` VALUES (2661, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"interfaceAddress\",\"className\":\"ModelInterfaceAddress\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"id\",\"columnId\":2098,\"columnName\":\"ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:26\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":132,\"updateTime\":\"2026-01-09 17:25:22\",\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":2099,\"columnName\":\"COMPANY_ID\",\"columnType\":\"NUMBER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:27\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":132,\"updateTime\":\"2026-01-09 17:25:23\",\"usableColumn\":false},{\"capJavaField\":\"ModelId\",\"columnComment\":\"模型id\",\"columnId\":2100,\"columnName\":\"MODEL_ID\",\"columnType\":\"BIGINT\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:27\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":132,\"updateTime\":\"2026-01-09 17:25:23\",\"usableColumn\":false},{\"capJavaField\":\"InterfaceAddress\",\"columnComment\":\"接口地址\",\"columnId\":2101,\"columnName\":\"INTERFACE_ADDRESS\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:27\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 17:26:07', 4767);
INSERT INTO `system_oper_log` VALUES (2662, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"version\",\"className\":\"ModelVersion\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"ID\",\"columnId\":2116,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:56\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":133,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":2117,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":133,\"usableColumn\":false},{\"capJavaField\":\"ModelId\",\"columnComment\":\"所属模型id\",\"columnId\":2118,\"columnName\":\"MODEL_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":133,\"usableColumn\":false},{\"capJavaField\":\"ModelName\",\"columnComment\":\"所属模型名称\",\"columnId\":2119,\"columnName\":\"MODEL_NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-09 17:20:56\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 17:26:50', 4362);
INSERT INTO `system_oper_log` VALUES (2663, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_INTERFACE_ADDRESS,MODEL_VERSION\"}', NULL, 0, NULL, '2026-01-09 17:28:49', 2475);
INSERT INTO `system_oper_log` VALUES (2664, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_CACL_RECONSTITUTION,MODEL_RECONSTITUTION\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 11:59:22', 7971);
INSERT INTO `system_oper_log` VALUES (2665, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"cacl\",\"className\":\"ModelCacl\",\"columns\":[{\"capJavaField\":\"ID\",\"columnId\":2136,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 11:59:15\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":134,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnId\":2137,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 11:59:15\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":134,\"usableColumn\":false},{\"capJavaField\":\"CODE\",\"columnId\":2138,\"columnName\":\"CODE\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 11:59:15\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"CODE\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":134,\"usableColumn\":false},{\"capJavaField\":\"NAME\",\"columnId\":2139,\"columnName\":\"NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 11:59:16\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"NAME\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":4,\"superColumn\":false,\"tableId\":134,\"usableColumn\":false},{\"capJavaField\":\"Model', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 12:02:19', 3892);
INSERT INTO `system_oper_log` VALUES (2666, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"modelReconstitution\",\"className\":\"ModelReconstitution\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"id\",\"columnId\":2160,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 11:59:19\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":135,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":2161,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 11:59:19\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":135,\"usableColumn\":false},{\"capJavaField\":\"NAME\",\"columnComment\":\"模型名称\",\"columnId\":2162,\"columnName\":\"NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 11:59:19\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"NAME\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":135,\"usableColumn\":false},{\"capJavaField\":\"ClassifyId\",\"columnComment\":\"模型分类\",\"columnId\":2163,\"columnName\":\"CLASSIFY_ID\",\"columnType\":\"NUMBER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 11:59:19\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"classifyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"que', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 12:04:36', 3152);
INSERT INTO `system_oper_log` VALUES (2667, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_CACL_RECONSTITUTION,MODEL_RECONSTITUTION\"}', NULL, 0, NULL, '2026-01-12 12:04:51', 1494);
INSERT INTO `system_oper_log` VALUES (2668, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/tool/gen/134', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 13:34:53', 660);
INSERT INTO `system_oper_log` VALUES (2669, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'qModel', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_CACL_RECONSTITUTION\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 13:35:03', 4055);
INSERT INTO `system_oper_log` VALUES (2670, '代码生成', 2, 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', 1, 'qModel', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"modelCacl\",\"className\":\"ModelCacl\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"主键id\",\"columnId\":2182,\"columnName\":\"ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 13:35:00\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":136,\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"企业id\",\"columnId\":2183,\"columnName\":\"COMPANY_ID\",\"columnType\":\"INTEGER\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 13:35:00\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":136,\"usableColumn\":false},{\"capJavaField\":\"CODE\",\"columnComment\":\"计算编码\",\"columnId\":2184,\"columnName\":\"CODE\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 13:35:00\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"CODE\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":136,\"usableColumn\":false},{\"capJavaField\":\"NAME\",\"columnComment\":\"计算名称\",\"columnId\":2185,\"columnName\":\"NAME\",\"columnType\":\"VARCHAR2\",\"createBy\":\"qModel\",\"createTime\":\"2026-01-12 13:35:00\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"NAME\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"requir', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 13:38:52', 3179);
INSERT INTO `system_oper_log` VALUES (2671, '代码生成', 8, 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', 1, 'qModel', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"MODEL_CACL_RECONSTITUTION\"}', NULL, 0, NULL, '2026-01-12 13:39:11', 918);
INSERT INTO `system_oper_log` VALUES (2672, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-06 06:17:26\",\"icon\":\"example_new_icon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"流程管理\",\"menuType\":\"M\",\"orderNum\":50,\"params\":{},\"parentId\":0,\"path\":\"flyflow\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 17:46:04', 1047);
INSERT INTO `system_oper_log` VALUES (2673, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-06 06:17:26\",\"icon\":\"example_new_icon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"流程管理\",\"menuType\":\"M\",\"orderNum\":50,\"params\":{},\"parentId\":0,\"path\":\"flyflow\",\"status\":\"1\",\"updateBy\":\"小桐\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 17:47:30', 642);
INSERT INTO `system_oper_log` VALUES (2674, '模型输出管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.output.ModelOutputController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/output', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-09 16:26:54\",\"creatorId\":1,\"description\":\"qqq\",\"engName\":\"q\",\"id\":4,\"modelId\":5,\"modelName\":\"单机程序\",\"modelVersion\":\"1\",\"multipleContent\":\"[]\",\"name\":\"输出模型\",\"params\":{},\"singleContent\":\"\\\"0\\\"\",\"type\":0,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-09 16:26:54\",\"updatorId\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-13 14:52:55', 542);
INSERT INTO `system_oper_log` VALUES (2675, '接口地址', 1, 'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.add()', 'POST', 1, 'qModel', '研发部门', '/model/interfaceAddress', '127.0.0.1', '内网IP', '{\"interfaceAddress\":\"null:6379/123\",\"modelId\":7,\"params\":{},\"remark\":\"测试\",\"requestMethod\":2,\"versionId\":7}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 14:20:24', 855);
INSERT INTO `system_oper_log` VALUES (2676, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"3\"}', NULL, 1, NULL, '2026-01-14 14:32:00', 683);
INSERT INTO `system_oper_log` VALUES (2677, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"4\"}', NULL, 1, NULL, '2026-01-14 14:32:04', 512);
INSERT INTO `system_oper_log` VALUES (2678, '接口地址', 2, 'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/interfaceAddress', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-14 14:20:25\",\"creatorId\":1,\"id\":1,\"interfaceAddress\":\"null:6379/null:6379/123\",\"modelId\":7,\"params\":{},\"remark\":\"测试\",\"requestMethod\":1,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-14 14:20:25\",\"updatorId\":1,\"versionId\":7}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 14:46:11', 564);
INSERT INTO `system_oper_log` VALUES (2679, '接口地址', 3, 'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/interfaceAddress/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 14:46:18', 389);
INSERT INTO `system_oper_log` VALUES (2680, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"3\"}', NULL, 1, NULL, '2026-01-14 14:46:29', 500);
INSERT INTO `system_oper_log` VALUES (2681, '模型输入管理', 3, 'tech.qiantong.qmodel.module.model.controller.admin.input.ModelInputController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/input/3', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 16:00:46', 267);
INSERT INTO `system_oper_log` VALUES (2682, '接口地址', 2, 'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/interfaceAddress', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-14 15:27:03\",\"creatorId\":1,\"id\":2,\"interfaceAddress\":\"null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml\",\"modelId\":7,\"params\":{},\"remark\":\"测试新增\",\"requestMethod\":2,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-14 15:27:03\",\"updatorId\":1,\"versionId\":7}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 16:04:23', 454);
INSERT INTO `system_oper_log` VALUES (2683, '接口地址', 2, 'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/interfaceAddress', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-14 15:27:03\",\"creatorId\":1,\"id\":2,\"interfaceAddress\":\"null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml\",\"modelId\":7,\"params\":{},\"remark\":\"测试新增\",\"requestMethod\":2,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-14 16:04:23\",\"updatorId\":1,\"versionId\":7}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 16:04:43', 335);
INSERT INTO `system_oper_log` VALUES (2684, '接口地址', 2, 'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/interfaceAddress', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-14 15:27:03\",\"creatorId\":1,\"id\":2,\"interfaceAddress\":\"null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml\",\"modelId\":7,\"params\":{},\"remark\":\"测试新增\",\"requestMethod\":2,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-14 16:04:43\",\"updatorId\":1,\"versionId\":7}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 16:04:56', 289);
INSERT INTO `system_oper_log` VALUES (2685, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"4\"}', NULL, 1, NULL, '2026-01-14 16:06:25', 991);
INSERT INTO `system_oper_log` VALUES (2686, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"3\"}', NULL, 1, NULL, '2026-01-14 16:06:31', 429);
INSERT INTO `system_oper_log` VALUES (2687, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"3\"}', NULL, 1, NULL, '2026-01-14 16:07:21', 22742);
INSERT INTO `system_oper_log` VALUES (2688, '模型库重构', 1, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":0,\"builtin\":1,\"classifyId\":9,\"createBy\":\"小桐\",\"creatorId\":1,\"description\":\"不能为空\",\"interfaceorfileAddress\":\"http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip\",\"name\":\"流量是计算\",\"params\":{},\"runnableFileAddress\":\"\\\\jgst.chaoshen.20250113\\\\data.json\",\"version\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 16:22:54', 1898);
INSERT INTO `system_oper_log` VALUES (2689, '版本管理', 1, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/version', '127.0.0.1', '内网IP', '{\"modelId\":12,\"modelName\":\"流量是计算\",\"params\":{},\"status\":0,\"version\":\"2\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 16:51:34', 791);
INSERT INTO `system_oper_log` VALUES (2690, '模型输入管理', 1, 'tech.qiantong.qmodel.module.model.controller.admin.input.ModelInputController.add()', 'POST', 1, 'qModel', '研发部门', '/model/input', '127.0.0.1', '内网IP', '{\"changeFlag\":true,\"description\":\"参数说明\",\"engName\":\"data_input.json\",\"modelId\":12,\"modelName\":\"流量是计算\",\"modelVersion\":\"2\",\"multipleContent\":\"[{\\\"name\\\":\\\"q\\\",\\\"value\\\":\\\"0\\\",\\\"order\\\":213,\\\"index\\\":1}]\",\"name\":\"q\",\"params\":{},\"singleContent\":\"[]\",\"type\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-14 16:59:35', 1034);
INSERT INTO `system_oper_log` VALUES (2691, '模型计算重构', 1, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.add()', 'POST', 1, 'qModel', '研发部门', '/model/cacl', '127.0.0.1', '内网IP', '{\"addressType\":0,\"modelId\":12,\"modelName\":\"流量是计算\",\"modelVersion\":\"2\",\"name\":\"avq\",\"params\":{},\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-15 10:04:35', 695);
INSERT INTO `system_oper_log` VALUES (2692, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"6\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-15 10:04:40', 1006);
INSERT INTO `system_oper_log` VALUES (2693, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"model/modelManage/index\",\"createTime\":\"2025-11-14 15:32:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2245,\"menuName\":\"模型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2243,\"path\":\"version\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 10:11:48', 459);
INSERT INTO `system_oper_log` VALUES (2694, '模型计算重构', 1, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.add()', 'POST', 1, 'qModel', '研发部门', '/model/cacl', '127.0.0.1', '内网IP', '{\"addressId\":2,\"addressType\":1,\"modelId\":7,\"modelName\":\"来水预测模型\",\"modelVersion\":\"v1.0\",\"name\":\"测试\",\"params\":{},\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-15 11:10:18', 493);
INSERT INTO `system_oper_log` VALUES (2695, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"7\"}', NULL, 1, 'UnknownHostException: null', '2026-01-15 14:31:59', 4968);
INSERT INTO `system_oper_log` VALUES (2696, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"7\"}', NULL, 1, 'UnknownHostException: null', '2026-01-15 14:31:59', 261);
INSERT INTO `system_oper_log` VALUES (2697, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"model/modelClassify/index\",\"createTime\":\"2025-11-14 10:06:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2244,\"menuName\":\"模型分类\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2250,\"path\":\"type\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 18:06:27', 402);
INSERT INTO `system_oper_log` VALUES (2698, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"model/computeList/index\",\"createTime\":\"2025-11-17 04:35:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2248,\"menuName\":\"模拟计算\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2252,\"path\":\"compute\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 18:08:05', 373);
INSERT INTO `system_oper_log` VALUES (2699, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"model/operateList/index\",\"createTime\":\"2025-11-17 04:35:45\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2249,\"menuName\":\"历史记录\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2251,\"path\":\"operate\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 18:09:07', 323);
INSERT INTO `system_oper_log` VALUES (2700, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"model/inputList/index\",\"createTime\":\"2025-11-17 04:34:18\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2246,\"menuName\":\"模型输入管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2243,\"path\":\"input\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-16 09:13:26', 371);
INSERT INTO `system_oper_log` VALUES (2701, '菜单管理', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"model/outputList/index\",\"createTime\":\"2025-11-17 04:34:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2247,\"menuName\":\"模型输出管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2243,\"path\":\"output\",\"status\":\"0\",\"updateBy\":\"小桐\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-16 09:14:28', 248);
INSERT INTO `system_oper_log` VALUES (2702, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"6\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-19 17:34:03', 1522);
INSERT INTO `system_oper_log` VALUES (2703, '模型计算重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/cacl', '127.0.0.1', '内网IP', '{\"id\":6,\"inputContent\":\"{\\\"success\\\":true,\\\"errorCode\\\":\\\"2000\\\",\\\"message\\\":\\\"操作成功\\\",\\\"data\\\":[{\\\"buildingId\\\":\\\"SGJZ00000849\\\",\\\"buildingName\\\":\\\"西泵站 5#机组\\\",\\\"buildingType\\\":\\\"100008\\\",\\\"buildingTypeName\\\":\\\"泵站\\\",\\\"useable\\\":true,\\\"realFlow\\\":3,\\\"pumpSate\\\":3,\\\"maxTheoryFlow\\\":8,\\\"minTheoryFlow\\\":3}]}\",\"params\":{}}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-19 17:45:19', 8838);
INSERT INTO `system_oper_log` VALUES (2704, '模型计算重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/cacl', '127.0.0.1', '内网IP', '{\"id\":6,\"inputContent\":\"{\\\"success\\\":true,\\\"errorCode\\\":\\\"2000\\\",\\\"message\\\":\\\"操作成功\\\",\\\"data\\\":[{\\\"buildingId\\\":\\\"SGJZ00000849\\\",\\\"buildingName\\\":\\\"西泵站 5#机组\\\",\\\"buildingType\\\":\\\"100008\\\",\\\"buildingTypeName\\\":\\\"泵站\\\",\\\"useable\\\":true,\\\"realFlow\\\":3,\\\"pumpSate\\\":3,\\\"maxTheoryFlow\\\":8,\\\"minTheoryFlow\\\":3}]}\",\"params\":{}}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-19 17:45:29', 543);
INSERT INTO `system_oper_log` VALUES (2705, '模型计算重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/cacl', '127.0.0.1', '内网IP', '{\"id\":6,\"inputContent\":\"{\\\"success\\\":true,\\\"errorCode\\\":\\\"2000\\\",\\\"message\\\":\\\"操作成功\\\",\\\"data\\\":[{\\\"buildingId\\\":\\\"SGJZ00000849\\\",\\\"buildingName\\\":\\\"西泵站 5#机组\\\",\\\"buildingType\\\":\\\"100008\\\",\\\"buildingTypeName\\\":\\\"泵站\\\",\\\"useable\\\":true,\\\"realFlow\\\":3,\\\"pumpSate\\\":3,\\\"maxTheoryFlow\\\":8,\\\"minTheoryFlow\\\":4}]}\",\"params\":{}}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-19 17:45:54', 744);
INSERT INTO `system_oper_log` VALUES (2706, '模型计算重构', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/cacl', '127.0.0.1', '内网IP', '{\"id\":6,\"inputContent\":\"{\\\"success\\\":true,\\\"errorCode\\\":\\\"2000\\\",\\\"message\\\":\\\"操作成功\\\",\\\"data\\\":[{\\\"buildingId\\\":\\\"SGJZ00000849\\\",\\\"buildingName\\\":\\\"西泵站 5#机组\\\",\\\"buildingType\\\":\\\"100008\\\",\\\"buildingTypeName\\\":\\\"泵站\\\",\\\"useable\\\":true,\\\"realFlow\\\":3,\\\"pumpSate\\\":3,\\\"maxTheoryFlow\\\":8,\\\"minTheoryFlow\\\":4}]}\",\"params\":{}}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-19 17:46:34', 9178);
INSERT INTO `system_oper_log` VALUES (2707, '模型库重构', 1, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":9,\"description\":\"接口服务类\",\"name\":\"接口服务类\",\"params\":{},\"port\":\"80\",\"version\":\"1\",\"versionId\":15}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-20 09:17:25', 1634);
INSERT INTO `system_oper_log` VALUES (2708, '版本管理', 1, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/version', '127.0.0.1', '内网IP', '{\"modelId\":12,\"modelName\":\"流量是计算\",\"params\":{},\"status\":0,\"version\":\"3\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-20 09:22:58', 696);
INSERT INTO `system_oper_log` VALUES (2709, '版本管理', 3, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/version/16', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-20 11:03:54', 1710);
INSERT INTO `system_oper_log` VALUES (2710, '版本管理', 1, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/version', '127.0.0.1', '内网IP', '{\"modelId\":7,\"modelName\":\"来水预测模型\",\"params\":{},\"status\":0,\"version\":\"3\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-20 11:56:44', 851);
INSERT INTO `system_oper_log` VALUES (2711, '版本管理', 3, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/version/7', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-20 11:57:09', 1298);
INSERT INTO `system_oper_log` VALUES (2712, '版本管理', 1, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/version', '127.0.0.1', '内网IP', '{\"modelId\":13,\"modelName\":\"接口服务类\",\"params\":{},\"status\":0,\"version\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-20 13:19:31', 1400);
INSERT INTO `system_oper_log` VALUES (2713, '接口地址', 1, 'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.add()', 'POST', 1, 'qModel', '研发部门', '/model/interfaceAddress', '127.0.0.1', '内网IP', '{\"interfaceAddress\":\"null:80/http://localhost/dev-api/captchaImage\",\"modelId\":13,\"params\":{},\"remark\":\"q\",\"requestMethod\":1,\"version\":\"1\",\"versionId\":18}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-20 13:20:18', 1370);
INSERT INTO `system_oper_log` VALUES (2714, '模型计算重构', 1, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.add()', 'POST', 1, 'qModel', '研发部门', '/model/cacl', '127.0.0.1', '内网IP', '{\"addressId\":3,\"addressType\":1,\"modelId\":13,\"modelName\":\"接口服务类\",\"modelVersion\":\"1\",\"name\":\"接口计算\",\"params\":{},\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-20 13:20:55', 815);
INSERT INTO `system_oper_log` VALUES (2715, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, 'UnknownHostException: null', '2026-01-20 13:21:01', 3519);
INSERT INTO `system_oper_log` VALUES (2716, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, 'UnknownHostException: null', '2026-01-20 13:21:02', 781);
INSERT INTO `system_oper_log` VALUES (2717, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, 'UnknownHostException: null', '2026-01-20 13:21:04', 774);
INSERT INTO `system_oper_log` VALUES (2718, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, 'UnknownHostException: null', '2026-01-20 13:24:07', 20585);
INSERT INTO `system_oper_log` VALUES (2719, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, 'UnknownHostException: null', '2026-01-20 13:24:46', 21514);
INSERT INTO `system_oper_log` VALUES (2720, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/type/18', '127.0.0.1', '内网IP', '{}', NULL, 1, '故事状态已分配,不能删除', '2026-01-20 13:33:31', 399);
INSERT INTO `system_oper_log` VALUES (2721, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/53', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:33:40', 866);
INSERT INTO `system_oper_log` VALUES (2722, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/52', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:33:42', 608);
INSERT INTO `system_oper_log` VALUES (2723, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/51', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:33:47', 2475);
INSERT INTO `system_oper_log` VALUES (2724, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/50', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:33:51', 877);
INSERT INTO `system_oper_log` VALUES (2725, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/type/18', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:33:56', 654);
INSERT INTO `system_oper_log` VALUES (2726, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/49', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:34:02', 342);
INSERT INTO `system_oper_log` VALUES (2727, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/48', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:34:05', 509);
INSERT INTO `system_oper_log` VALUES (2728, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/47', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:34:07', 308);
INSERT INTO `system_oper_log` VALUES (2729, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/type/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 13:34:12', 775);
INSERT INTO `system_oper_log` VALUES (2730, '字典类型', 1, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.add()', 'POST', 1, 'qModel', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"dictName\":\"请求方式\",\"dictType\":\"model_access_mode\",\"params\":{},\"remark\":\"模型API接口请求方式\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 15:35:12', 1849);
INSERT INTO `system_oper_log` VALUES (2731, '字典数据', 1, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.add()', 'POST', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"default\":false,\"dictLabel\":\"get\",\"dictSort\":0,\"dictType\":\"model_access_mode\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 15:35:38', 733);
INSERT INTO `system_oper_log` VALUES (2732, '字典数据', 1, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.add()', 'POST', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"cssClass\":\"\",\"default\":false,\"dictLabel\":\"post\",\"dictSort\":1,\"dictType\":\"model_access_mode\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 15:35:57', 783);
INSERT INTO `system_oper_log` VALUES (2733, '字典数据', 1, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.add()', 'POST', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"default\":false,\"dictLabel\":\"put\",\"dictSort\":2,\"dictType\":\"model_access_mode\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 15:36:08', 419);
INSERT INTO `system_oper_log` VALUES (2734, '字典数据', 1, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.add()', 'POST', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"default\":false,\"dictLabel\":\"delete\",\"dictSort\":3,\"dictType\":\"model_access_mode\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-20 15:36:20', 277);
INSERT INTO `system_oper_log` VALUES (2735, '字典数据', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 15:35:38\",\"default\":false,\"dictCode\":98,\"dictLabel\":\"get\",\"dictSort\":0,\"dictType\":\"model_access_mode\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"小桐\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-21 14:23:32', 288);
INSERT INTO `system_oper_log` VALUES (2736, '字典数据', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 15:35:56\",\"default\":false,\"dictCode\":99,\"dictLabel\":\"post\",\"dictSort\":1,\"dictType\":\"model_access_mode\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"小桐\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-21 14:23:38', 327);
INSERT INTO `system_oper_log` VALUES (2737, '字典数据', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 15:35:56\",\"default\":false,\"dictCode\":99,\"dictLabel\":\"post\",\"dictSort\":1,\"dictType\":\"model_access_mode\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"小桐\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-21 14:23:43', 152);
INSERT INTO `system_oper_log` VALUES (2738, '字典数据', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 15:36:20\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"delete\",\"dictSort\":3,\"dictType\":\"model_access_mode\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"小桐\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-21 14:23:52', 112);
INSERT INTO `system_oper_log` VALUES (2739, '字典数据', 2, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()', 'PUT', 1, 'qModel', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 15:36:08\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"put\",\"dictSort\":2,\"dictType\":\"model_access_mode\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"小桐\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-21 14:24:40', 137);
INSERT INTO `system_oper_log` VALUES (2740, '接口地址', 1, 'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.add()', 'POST', 1, 'qModel', '研发部门', '/model/interfaceAddress', '127.0.0.1', '内网IP', '{\"interfaceAddress\":\"null:80/http://localhost:8090/captchaImage\",\"modelId\":13,\"params\":{},\"remark\":\"z\",\"requestMethod\":0,\"version\":\"1\",\"versionId\":18}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 14:26:05', 774);
INSERT INTO `system_oper_log` VALUES (2741, '模型库重构', 1, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":3,\"description\":\"测试\",\"name\":\"base64图片获取\",\"params\":{},\"port\":\"80\",\"version\":\"1\",\"versionId\":19}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 14:41:42', 1495);
INSERT INTO `system_oper_log` VALUES (2742, '模型库重构', 1, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":1,\"classifyId\":3,\"description\":\"测试\",\"name\":\"测试\",\"params\":{},\"port\":\"6379\",\"version\":\"1\",\"versionId\":20}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 14:48:00', 584);
INSERT INTO `system_oper_log` VALUES (2743, '模型输出管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.output.ModelOutputController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/output', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-14 18:05:18\",\"creatorId\":1,\"description\":\"测试\",\"engName\":\"/data/jgst/jgst.chaoshen.20250113/data_output.json\",\"id\":5,\"modelId\":12,\"modelName\":\"流量是计算\",\"modelVersion\":\"2\",\"multipleContent\":\"[]\",\"name\":\"AVQ\",\"params\":{},\"singleContent\":\"\\\"0\\\"\",\"type\":0,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-14 18:05:18\",\"updatorId\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 15:16:51', 377);
INSERT INTO `system_oper_log` VALUES (2744, '模型输入管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.input.ModelInputController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/input', '127.0.0.1', '内网IP', '{\"changeFlag\":true,\"createBy\":\"小桐\",\"createTime\":\"2026-01-14 16:59:34\",\"creatorId\":1,\"description\":\"参数说明\",\"engName\":\"/data/jgst/jgst.chaoshen.20250113/data_input.json\",\"id\":9,\"modelId\":12,\"modelName\":\"流量是计算\",\"modelVersion\":\"2\",\"multipleContent\":\"[{\\\"name\\\":\\\"q\\\",\\\"value\\\":\\\"0\\\",\\\"order\\\":213,\\\"index\\\":1}]\",\"name\":\"q\",\"params\":{},\"singleContent\":\"[]\",\"type\":1,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-14 16:59:34\",\"updatorId\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 15:17:32', 401);
INSERT INTO `system_oper_log` VALUES (2745, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"6\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 15:19:15', 659);
INSERT INTO `system_oper_log` VALUES (2746, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"6\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 15:20:08', 23552);
INSERT INTO `system_oper_log` VALUES (2747, '模型库重构', 3, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/modelReconstitution/15', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 15:26:32', 186);
INSERT INTO `system_oper_log` VALUES (2748, '模型库重构', 1, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/modelReconstitution', '127.0.0.1', '内网IP', '{\"accessMode\":1,\"builtin\":0,\"classifyId\":17,\"description\":\"1\",\"interfaceorfileAddress\":\"http:192.1623\",\"name\":\"测试\",\"params\":{},\"port\":\"8888\",\"version\":\"1\",\"versionId\":21}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 15:27:05', 632);
INSERT INTO `system_oper_log` VALUES (2749, '模型库重构', 3, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/modelReconstitution/16', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 15:27:39', 194);
INSERT INTO `system_oper_log` VALUES (2750, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, '\r\n### Error updating database.  Cause: dm.jdbc.driver.DMException: 记录超长\r\n### The error may exist in tech/qiantong/qmodel/module/model/dal/mapper/cacl/ModelCaclMapper.java (best guess)\r\n### The error may involve tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE MODEL_CACL_RECONSTITUTION  SET name=?, model_id=?, model_name=?, model_version=?, start_time=?, end_time=?, status=?, input_content=?, output_content=?,  address_id=?, address_type=?,  creator_id=?, create_by=?, create_time=?, updator_id=?, update_by=?, update_time=?  WHERE id=?  AND del_flag=0\r\n### Cause: dm.jdbc.driver.DMException: 记录超长\n; 记录超长; nested exception is dm.jdbc.driver.DMException: 记录超长', '2026-01-21 15:32:15', 808);
INSERT INTO `system_oper_log` VALUES (2751, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"6\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 15:41:14', 1254);
INSERT INTO `system_oper_log` VALUES (2752, '版本管理', 1, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()', 'POST', 1, 'qModel', '研发部门', '/model/version', '127.0.0.1', '内网IP', '{\"modelId\":13,\"modelName\":\"接口服务类\",\"params\":{},\"status\":0,\"version\":\"2\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 16:30:20', 1019);
INSERT INTO `system_oper_log` VALUES (2753, '版本管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/version', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-21 16:30:20\",\"creatorId\":1,\"description\":\"version2\",\"id\":22,\"modelId\":13,\"modelName\":\"接口服务类\",\"params\":{},\"status\":0,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-21 16:30:20\",\"updatorId\":1,\"version\":\"2\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 16:47:49', 705);
INSERT INTO `system_oper_log` VALUES (2754, '版本管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/version', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-21 16:30:20\",\"creatorId\":1,\"description\":\"version22\",\"id\":22,\"modelId\":13,\"modelName\":\"接口服务类\",\"params\":{},\"status\":0,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-21 16:47:49\",\"updatorId\":1,\"version\":\"2\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 16:50:10', 23093);
INSERT INTO `system_oper_log` VALUES (2755, '版本管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.edit()', 'PUT', 1, 'qModel', '研发部门', '/model/version', '127.0.0.1', '内网IP', '{\"createBy\":\"小桐\",\"createTime\":\"2026-01-20 13:19:31\",\"creatorId\":1,\"description\":\"version1\",\"id\":18,\"modelId\":13,\"modelName\":\"接口服务类\",\"params\":{},\"status\":0,\"updateBy\":\"小桐\",\"updateTime\":\"2026-01-21 16:50:17\",\"updatorId\":1,\"version\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 16:50:34', 6072);
INSERT INTO `system_oper_log` VALUES (2756, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, '\r\n### Error updating database.  Cause: dm.jdbc.driver.DMException: 记录超长\r\n### The error may exist in tech/qiantong/qmodel/module/model/dal/mapper/cacl/ModelCaclMapper.java (best guess)\r\n### The error may involve tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE MODEL_CACL_RECONSTITUTION  SET name=?, model_id=?, model_name=?, model_version=?, start_time=?, end_time=?, status=?, input_content=?, output_content=?,  address_id=?, address_type=?,  creator_id=?, create_by=?, create_time=?, updator_id=?, update_by=?, update_time=?  WHERE id=?  AND del_flag=0\r\n### Cause: dm.jdbc.driver.DMException: 记录超长\n; 记录超长; nested exception is dm.jdbc.driver.DMException: 记录超长', '2026-01-21 17:02:33', 879);
INSERT INTO `system_oper_log` VALUES (2757, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, '\r\n### Error updating database.  Cause: dm.jdbc.driver.DMException: 记录超长\r\n### The error may exist in tech/qiantong/qmodel/module/model/dal/mapper/cacl/ModelCaclMapper.java (best guess)\r\n### The error may involve tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE MODEL_CACL_RECONSTITUTION  SET name=?, model_id=?, model_name=?, model_version=?, start_time=?, end_time=?, status=?, input_content=?, output_content=?,  address_id=?, address_type=?,  creator_id=?, create_by=?, create_time=?, updator_id=?, update_by=?, update_time=?  WHERE id=?  AND del_flag=0\r\n### Cause: dm.jdbc.driver.DMException: 记录超长\n; 记录超长; nested exception is dm.jdbc.driver.DMException: 记录超长', '2026-01-21 17:07:50', 1571);
INSERT INTO `system_oper_log` VALUES (2758, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', NULL, 1, '\r\n### Error updating database.  Cause: dm.jdbc.driver.DMException: 记录超长\r\n### The error may exist in tech/qiantong/qmodel/module/model/dal/mapper/cacl/ModelCaclMapper.java (best guess)\r\n### The error may involve tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE MODEL_CACL_RECONSTITUTION  SET name=?, model_id=?, model_name=?, model_version=?, start_time=?, end_time=?, status=?, input_content=?, output_content=?,  address_id=?, address_type=?,  creator_id=?, create_by=?, create_time=?, updator_id=?, update_by=?, update_time=?  WHERE id=?  AND del_flag=0\r\n### Cause: dm.jdbc.driver.DMException: 记录超长\n; 记录超长; nested exception is dm.jdbc.driver.DMException: 记录超长', '2026-01-21 17:10:24', 18731);
INSERT INTO `system_oper_log` VALUES (2759, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-21 17:11:43', 3581);
INSERT INTO `system_oper_log` VALUES (2760, '模型计算管理', 2, 'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()', 'GET', 1, 'qModel', '研发部门', '/model/cacl/calculate', '127.0.0.1', '内网IP', '{\"modelCaclId\":\"8\"}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-22 09:12:28', 1280);
INSERT INTO `system_oper_log` VALUES (2761, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/89', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:30:36', 644);
INSERT INTO `system_oper_log` VALUES (2762, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/88', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:30:38', 654);
INSERT INTO `system_oper_log` VALUES (2763, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/type/26', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:30:41', 427);
INSERT INTO `system_oper_log` VALUES (2764, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/72', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:30:49', 232);
INSERT INTO `system_oper_log` VALUES (2765, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/71', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:30:50', 263);
INSERT INTO `system_oper_log` VALUES (2766, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/70', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:30:52', 232);
INSERT INTO `system_oper_log` VALUES (2767, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/type/22', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:30:55', 245);
INSERT INTO `system_oper_log` VALUES (2768, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/87', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:31:04', 255);
INSERT INTO `system_oper_log` VALUES (2769, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/86', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:31:06', 276);
INSERT INTO `system_oper_log` VALUES (2770, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/85', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:31:08', 283);
INSERT INTO `system_oper_log` VALUES (2771, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/84', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:31:09', 278);
INSERT INTO `system_oper_log` VALUES (2772, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/83', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:53:50', 415);
INSERT INTO `system_oper_log` VALUES (2773, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/64', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:53:52', 259);
INSERT INTO `system_oper_log` VALUES (2774, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/63', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:53:55', 886);
INSERT INTO `system_oper_log` VALUES (2775, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/type/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:53:59', 561);
INSERT INTO `system_oper_log` VALUES (2776, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/62', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:54:04', 326);
INSERT INTO `system_oper_log` VALUES (2777, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/61', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:54:06', 267);
INSERT INTO `system_oper_log` VALUES (2778, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/60', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:54:08', 315);
INSERT INTO `system_oper_log` VALUES (2779, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/59', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:54:10', 303);
INSERT INTO `system_oper_log` VALUES (2780, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/data/58', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:54:12', 275);
INSERT INTO `system_oper_log` VALUES (2781, '字典类型', 3, 'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/system/dict/type/20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-22 09:54:17', 283);
INSERT INTO `system_oper_log` VALUES (2782, '模型库重构', 3, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/modelReconstitution/14', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-22 10:56:57', 302);
INSERT INTO `system_oper_log` VALUES (2783, '模型库重构', 3, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/modelReconstitution/7', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-22 10:57:15', 233);
INSERT INTO `system_oper_log` VALUES (2784, '模型库重构', 3, 'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/modelReconstitution/5', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-22 10:57:18', 103);
INSERT INTO `system_oper_log` VALUES (2785, '模型分类', 3, 'tech.qiantong.qmodel.module.model.controller.admin.classify.ModelClassifyController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/classify/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-22 10:57:48', 285);
INSERT INTO `system_oper_log` VALUES (2786, '模型分类', 3, 'tech.qiantong.qmodel.module.model.controller.admin.classify.ModelClassifyController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/classify/2', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-22 10:57:52', 173);
INSERT INTO `system_oper_log` VALUES (2787, '模型分类', 3, 'tech.qiantong.qmodel.module.model.controller.admin.classify.ModelClassifyController.remove()', 'DELETE', 1, 'qModel', '研发部门', '/model/classify/3', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', 0, NULL, '2026-01-22 10:57:55', 193);

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE,
  UNIQUE INDEX `post_id_10384185075700`(`post_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

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
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_id_10384190075700`(`role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

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
CREATE TABLE `system_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of system_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Fixed;

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
CREATE TABLE `system_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `auth_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '认证平台id',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_id_10384203524500`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 763 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, 103, 'qModel', '小桐', '00', 'support@qiantong.tech', '19951942682', '1', NULL, '$2a$10$butlDwq0TSIeP/rT9PGx6u571M.2VE.VsTAPoSSMOyQ0jmTc9TEyy', '0', '0', '127.0.0.1', '2026-01-22 09:28:48', '小桐', '2024-05-06 06:12:17', NULL, '2026-01-22 09:28:48', '管理员', NULL);
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
CREATE TABLE `system_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Fixed;

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
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (1, 1);
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
