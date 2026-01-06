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

 Source Server         : 花果山本地数据库
 Source Server Type    : PostgreSQL
 Source Server Version : 120001
 Source Host           : 127.0.0.1:54321
 Source Catalog        : anivia_dev
 Source Schema         : anivia

 Target Server Type    : PostgreSQL
 Target Server Version : 120001
 File Encoding         : 65001

 Date: 26/11/2024 17:15:00
*/


-- ----------------------------
-- Sequence structure for auth_client_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."auth_client_id_seq";
CREATE SEQUENCE "anivia"."auth_client_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ca_cert_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."ca_cert_id_seq";
CREATE SEQUENCE "anivia"."ca_cert_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ca_subject_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."ca_subject_id_seq";
CREATE SEQUENCE "anivia"."ca_subject_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for example_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."example_user_id_seq";
CREATE SEQUENCE "anivia"."example_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gen_table_column_column_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."gen_table_column_column_id_seq";
CREATE SEQUENCE "anivia"."gen_table_column_column_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gen_table_table_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."gen_table_table_id_seq";
CREATE SEQUENCE "anivia"."gen_table_table_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for message_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."message_id_seq";
CREATE SEQUENCE "anivia"."message_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for message_template_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."message_template_id_seq";
CREATE SEQUENCE "anivia"."message_template_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pro_plan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."pro_plan_id_seq";
CREATE SEQUENCE "anivia"."pro_plan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pro_task_receive_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."pro_task_receive_id_seq";
CREATE SEQUENCE "anivia"."pro_task_receive_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_config_config_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_config_config_id_seq";
CREATE SEQUENCE "anivia"."system_config_config_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_dept_dept_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_dept_dept_id_seq";
CREATE SEQUENCE "anivia"."system_dept_dept_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_dict_data_dict_code_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_dict_data_dict_code_seq";
CREATE SEQUENCE "anivia"."system_dict_data_dict_code_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_dict_type_dict_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_dict_type_dict_id_seq";
CREATE SEQUENCE "anivia"."system_dict_type_dict_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_job_job_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_job_job_id_seq";
CREATE SEQUENCE "anivia"."system_job_job_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_job_log_job_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_job_log_job_log_id_seq";
CREATE SEQUENCE "anivia"."system_job_log_job_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_logininfor_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_logininfor_info_id_seq";
CREATE SEQUENCE "anivia"."system_logininfor_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_menu_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_menu_menu_id_seq";
CREATE SEQUENCE "anivia"."system_menu_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_notice_notice_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_notice_notice_id_seq";
CREATE SEQUENCE "anivia"."system_notice_notice_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_oper_log_oper_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_oper_log_oper_id_seq";
CREATE SEQUENCE "anivia"."system_oper_log_oper_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_post_post_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_post_post_id_seq";
CREATE SEQUENCE "anivia"."system_post_post_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_role_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_role_role_id_seq";
CREATE SEQUENCE "anivia"."system_role_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for system_user_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."system_user_user_id_seq";
CREATE SEQUENCE "anivia"."system_user_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "anivia"."user_type_id_seq";
CREATE SEQUENCE "anivia"."user_type_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for auth_client
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."auth_client";
CREATE TABLE "anivia"."auth_client" (
  "id" int4 NOT NULL DEFAULT nextval('"anivia".auth_client_id_seq'::regclass),
  "secret_key" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "type" int2 NOT NULL,
  "icon" varchar(256) COLLATE "pg_catalog"."default",
  "home_url" varchar(256) COLLATE "pg_catalog"."default",
  "sync_url" varchar(256) COLLATE "pg_catalog"."default",
  "redirect_url" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL,
  "public_flag" tinyint NOT NULL DEFAULT 1,
  "valid_flag" tinyint NOT NULL DEFAULT 1,
  "del_flag" tinyint NOT NULL DEFAULT 0,
  "create_by" varchar(128) COLLATE "pg_catalog"."default",
  "creator_id" int8,
  "create_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(128) COLLATE "pg_catalog"."default",
  "updator_id" varchar(20) COLLATE "pg_catalog"."default",
  "update_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "remark" varchar(512) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."auth_client"."id" IS '应用ID';
COMMENT ON COLUMN "anivia"."auth_client"."secret_key" IS '应用秘钥';
COMMENT ON COLUMN "anivia"."auth_client"."name" IS '应用名称';
COMMENT ON COLUMN "anivia"."auth_client"."type" IS '应用类型;0：Web，1：App，2：小程序';
COMMENT ON COLUMN "anivia"."auth_client"."icon" IS '应用图标';
COMMENT ON COLUMN "anivia"."auth_client"."home_url" IS '应用首页';
COMMENT ON COLUMN "anivia"."auth_client"."sync_url" IS '同步地址';
COMMENT ON COLUMN "anivia"."auth_client"."redirect_url" IS '允许授权的url';
COMMENT ON COLUMN "anivia"."auth_client"."public_flag" IS '是否公开';
COMMENT ON COLUMN "anivia"."auth_client"."valid_flag" IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN "anivia"."auth_client"."del_flag" IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN "anivia"."auth_client"."create_by" IS '创建人';
COMMENT ON COLUMN "anivia"."auth_client"."creator_id" IS '创建人id;创建者的sys_user_id';
COMMENT ON COLUMN "anivia"."auth_client"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."auth_client"."update_by" IS '更新人';
COMMENT ON COLUMN "anivia"."auth_client"."updator_id" IS '更新人id;更新者的sys_user_id';
COMMENT ON COLUMN "anivia"."auth_client"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."auth_client"."remark" IS '备注';
COMMENT ON TABLE "anivia"."auth_client" IS '应用管理';

-- ----------------------------
-- Records of auth_client
-- ----------------------------
INSERT INTO "anivia"."auth_client" VALUES (4, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (6, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (7, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (8, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (9, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (10, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (11, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (12, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (13, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (14, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (15, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (16, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (17, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (18, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (19, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (20, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (21, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (22, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (23, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (24, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (25, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (26, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (27, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (28, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (29, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (30, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (31, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (32, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (33, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (34, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (35, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (36, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (37, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);
INSERT INTO "anivia"."auth_client" VALUES (38, 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', 0, NULL, NULL, NULL, '*', '1', '1', '0', '若依1', 1, '2024-08-31 21:08:53', NULL, '1', '2024-08-31 21:08:53', NULL);

-- ----------------------------
-- Table structure for auth_client_user
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."auth_client_user";
CREATE TABLE "anivia"."auth_client_user" (
  "client_id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "open_id" varchar(256) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "anivia"."auth_client_user"."client_id" IS '应用ID';
COMMENT ON COLUMN "anivia"."auth_client_user"."user_id" IS '用户ID';
COMMENT ON COLUMN "anivia"."auth_client_user"."open_id" IS 'open_id';
COMMENT ON TABLE "anivia"."auth_client_user" IS '应用和用户关联表';

-- ----------------------------
-- Records of auth_client_user
-- ----------------------------

-- ----------------------------
-- Table structure for ca_cert
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."ca_cert";
CREATE TABLE "anivia"."ca_cert" (
  "id" int8 NOT NULL DEFAULT nextval('"anivia".ca_cert_id_seq'::regclass),
  "name" varchar(90) COLLATE "pg_catalog"."default" NOT NULL,
  "subject_id" int4 NOT NULL,
  "subject_name" varchar(90) COLLATE "pg_catalog"."default" NOT NULL,
  "certificate" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "private_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "issuer" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "possessor" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "valid_time" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "valid_flag" int4 NOT NULL DEFAULT 1,
  "del_flag" int4 NOT NULL DEFAULT 0,
  "create_by" varchar(90) COLLATE "pg_catalog"."default",
  "creator_id" int4,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(90) COLLATE "pg_catalog"."default",
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(900) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."ca_cert"."id" IS 'ID;ID';
COMMENT ON COLUMN "anivia"."ca_cert"."name" IS '证书名称';
COMMENT ON COLUMN "anivia"."ca_cert"."subject_id" IS '主体id';
COMMENT ON COLUMN "anivia"."ca_cert"."subject_name" IS '主体名称';
COMMENT ON COLUMN "anivia"."ca_cert"."certificate" IS '证书;证书';
COMMENT ON COLUMN "anivia"."ca_cert"."private_key" IS '私钥;私钥';
COMMENT ON COLUMN "anivia"."ca_cert"."issuer" IS '颁发者';
COMMENT ON COLUMN "anivia"."ca_cert"."possessor" IS '所有者';
COMMENT ON COLUMN "anivia"."ca_cert"."valid_time" IS '有效期';
COMMENT ON COLUMN "anivia"."ca_cert"."valid_flag" IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN "anivia"."ca_cert"."del_flag" IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN "anivia"."ca_cert"."create_by" IS '创建人';
COMMENT ON COLUMN "anivia"."ca_cert"."creator_id" IS '创建人id';
COMMENT ON COLUMN "anivia"."ca_cert"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."ca_cert"."update_by" IS '更新人';
COMMENT ON COLUMN "anivia"."ca_cert"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."ca_cert"."remark" IS '备注;备注';
COMMENT ON TABLE "anivia"."ca_cert" IS '证书管理';

-- ----------------------------
-- Records of ca_cert
-- ----------------------------
INSERT INTO "anivia"."ca_cert" VALUES (9, '冰凤框架Nginx证书', 9, '江苏千桐科技有限公司', '/profile/ca/2024/10/23/6718d6e3a921cf6536292244.cer', '/profile/ca/2024/10/23/6718d6e3a921cf6536292245.pem', '江苏千桐科技有限公司', '192.168.0.1', '30', 1, 0, 'admin', 1, '2024-10-23 18:58:44', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ca_subject
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."ca_subject";
CREATE TABLE "anivia"."ca_subject" (
  "id" int8 NOT NULL DEFAULT nextval('"anivia".ca_subject_id_seq'::regclass),
  "name" varchar(90) COLLATE "pg_catalog"."default" NOT NULL,
  "cn" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ou" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "o" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "l" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "st" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "c" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "certificate" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "private_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "valid_flag" int4 NOT NULL DEFAULT 1,
  "del_flag" int4 NOT NULL DEFAULT 0,
  "create_by" varchar(90) COLLATE "pg_catalog"."default",
  "creator_id" int4,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(90) COLLATE "pg_catalog"."default",
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(900) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."ca_subject"."id" IS 'ID;主体ID';
COMMENT ON COLUMN "anivia"."ca_subject"."name" IS '主体名称;主体名称';
COMMENT ON COLUMN "anivia"."ca_subject"."cn" IS '通用名称;通用名称';
COMMENT ON COLUMN "anivia"."ca_subject"."ou" IS '组织部门;组织单位名称';
COMMENT ON COLUMN "anivia"."ca_subject"."o" IS '组织名称';
COMMENT ON COLUMN "anivia"."ca_subject"."l" IS '城市名称';
COMMENT ON COLUMN "anivia"."ca_subject"."st" IS '省名称';
COMMENT ON COLUMN "anivia"."ca_subject"."c" IS '国家';
COMMENT ON COLUMN "anivia"."ca_subject"."certificate" IS '证书;证书';
COMMENT ON COLUMN "anivia"."ca_subject"."private_key" IS '私钥;私钥';
COMMENT ON COLUMN "anivia"."ca_subject"."valid_flag" IS '是否有效;是否有效 0：无效，1：有效';
COMMENT ON COLUMN "anivia"."ca_subject"."del_flag" IS '删除标志;删除标志 1：已删除，0：未删除';
COMMENT ON COLUMN "anivia"."ca_subject"."create_by" IS '创建人;创建人';
COMMENT ON COLUMN "anivia"."ca_subject"."creator_id" IS '创建人id;创建人id';
COMMENT ON COLUMN "anivia"."ca_subject"."create_time" IS '创建时间;创建时间';
COMMENT ON COLUMN "anivia"."ca_subject"."update_by" IS '更新人;更新人';
COMMENT ON COLUMN "anivia"."ca_subject"."update_time" IS '更新时间;更新时间';
COMMENT ON COLUMN "anivia"."ca_subject"."remark" IS '备注;备注';
COMMENT ON TABLE "anivia"."ca_subject" IS '主体管理';

-- ----------------------------
-- Records of ca_subject
-- ----------------------------
INSERT INTO "anivia"."ca_subject" VALUES (9, '江苏千桐科技有限公司', '江苏千桐科技有限公司', '技术部', '技术部', '南京', '江苏', '中国', '/profile/ca/2024/10/23/6718d658a921cf6536292242.cer', '/profile/ca/2024/10/23/6718d658a921cf6536292243.pem', 1, 0, 'admin', 1, '2024-10-23 18:56:25', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for example_user
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."example_user";
CREATE TABLE "anivia"."example_user" (
  "id" int4 NOT NULL DEFAULT nextval('"anivia".example_user_id_seq'::regclass),
  "name" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "age" int4 NOT NULL,
  "phone" varchar(32) COLLATE "pg_catalog"."default",
  "type_id" int8,
  "valid_flag" tinyint NOT NULL DEFAULT 1,
  "del_flag" tinyint NOT NULL DEFAULT 0,
  "create_by" varchar(32) COLLATE "pg_catalog"."default",
  "creator_id" int8,
  "create_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(32) COLLATE "pg_catalog"."default",
  "updator_id" int8,
  "update_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "remark" varchar(512) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."example_user"."id" IS 'ID';
COMMENT ON COLUMN "anivia"."example_user"."name" IS '名称';
COMMENT ON COLUMN "anivia"."example_user"."age" IS '年龄';
COMMENT ON COLUMN "anivia"."example_user"."phone" IS '手机号';
COMMENT ON COLUMN "anivia"."example_user"."type_id" IS '用户类型';
COMMENT ON COLUMN "anivia"."example_user"."valid_flag" IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN "anivia"."example_user"."del_flag" IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN "anivia"."example_user"."create_by" IS '创建人';
COMMENT ON COLUMN "anivia"."example_user"."creator_id" IS '创建人id';
COMMENT ON COLUMN "anivia"."example_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."example_user"."update_by" IS '更新人';
COMMENT ON COLUMN "anivia"."example_user"."updator_id" IS '更新人id';
COMMENT ON COLUMN "anivia"."example_user"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."example_user"."remark" IS '备注';
COMMENT ON TABLE "anivia"."example_user" IS '示例用户表';

-- ----------------------------
-- Records of example_user
-- ----------------------------
INSERT INTO "anivia"."example_user" VALUES (1, '张三', 18, '19951942682', 1, '1', '1', '若依1', 1, '2024-10-23 16:26:37', NULL, NULL, '2024-10-23 16:26:37', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."gen_table";
CREATE TABLE "anivia"."gen_table" (
  "table_id" int8 NOT NULL DEFAULT nextval('"anivia".gen_table_table_id_seq'::regclass),
  "table_name" varchar(200) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "table_comment" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "sub_table_name" varchar(64) COLLATE "pg_catalog"."default",
  "sub_table_fk_name" varchar(64) COLLATE "pg_catalog"."default",
  "class_name" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "tpl_category" varchar(200) COLLATE "pg_catalog"."default" DEFAULT 'crud'::varchar,
  "tpl_web_type" varchar(30) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "package_name" varchar(100) COLLATE "pg_catalog"."default",
  "module_name" varchar(30) COLLATE "pg_catalog"."default",
  "business_name" varchar(30) COLLATE "pg_catalog"."default",
  "function_name" varchar(50) COLLATE "pg_catalog"."default",
  "function_author" varchar(50) COLLATE "pg_catalog"."default",
  "gen_type" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "gen_path" varchar(200) COLLATE "pg_catalog"."default" DEFAULT '/'::varchar,
  "options" varchar(1000) COLLATE "pg_catalog"."default",
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."gen_table"."table_id" IS '编号';
COMMENT ON COLUMN "anivia"."gen_table"."table_name" IS '表名称';
COMMENT ON COLUMN "anivia"."gen_table"."table_comment" IS '表描述';
COMMENT ON COLUMN "anivia"."gen_table"."sub_table_name" IS '关联子表的表名';
COMMENT ON COLUMN "anivia"."gen_table"."sub_table_fk_name" IS '子表关联的外键名';
COMMENT ON COLUMN "anivia"."gen_table"."class_name" IS '实体类名称';
COMMENT ON COLUMN "anivia"."gen_table"."tpl_category" IS '使用的模板（crud单表操作 tree树表操作）';
COMMENT ON COLUMN "anivia"."gen_table"."tpl_web_type" IS '前端模板类型（element-ui模版 element-plus模版）';
COMMENT ON COLUMN "anivia"."gen_table"."package_name" IS '生成包路径';
COMMENT ON COLUMN "anivia"."gen_table"."module_name" IS '生成模块名';
COMMENT ON COLUMN "anivia"."gen_table"."business_name" IS '生成业务名';
COMMENT ON COLUMN "anivia"."gen_table"."function_name" IS '生成功能名';
COMMENT ON COLUMN "anivia"."gen_table"."function_author" IS '生成功能作者';
COMMENT ON COLUMN "anivia"."gen_table"."gen_type" IS '生成代码方式（0zip压缩包 1自定义路径）';
COMMENT ON COLUMN "anivia"."gen_table"."gen_path" IS '生成路径（不填默认项目路径）';
COMMENT ON COLUMN "anivia"."gen_table"."options" IS '其它生成选项';
COMMENT ON COLUMN "anivia"."gen_table"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."gen_table"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."gen_table"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."gen_table"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."gen_table"."remark" IS '备注';
COMMENT ON TABLE "anivia"."gen_table" IS '代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO "anivia"."gen_table" VALUES (19, 'example_user', '示例用户表', NULL, NULL, 'ExampleUser', 'crud', 'element-plus', 'tech.qiantong.module.example.del', 'user', 'user', '示例用户', 'anivia', '0', '/', '{"parentMenuId":"2023"}', 'admin', '2024-10-23 15:44:32', '', '2024-11-26 10:48:44', NULL);
INSERT INTO "anivia"."gen_table" VALUES (22, 'message', '消息', NULL, NULL, 'Message', 'crud', 'element-plus', 'tech.qiantong.module.system', 'message', 'message3', '消息', 'anivia', '0', '/', '{"parentMenuId":"1"}', 'admin', '2024-10-31 14:25:33', '', '2024-11-26 15:52:43', NULL);
INSERT INTO "anivia"."gen_table" VALUES (23, 'message_template', '消息模板', NULL, NULL, 'MessageTemplate', 'crud', 'element-plus', 'tech.qiantong.module.system', 'message', 'messageTemplate', '消息模板', 'anivia', '0', '/', '{"parentMenuId":1}', 'admin', '2024-10-31 14:25:34', '', '2024-11-01 09:49:52', NULL);
INSERT INTO "anivia"."gen_table" VALUES (24, 'rel_user_auth_product', '用户与认证中心关系表', NULL, NULL, 'RelUserAuthProduct', 'crud', 'element-plus', 'tech.qiantong.module.system', 'auth', 'userAuthProduct', '用户与认证中心关系', 'anivia', '0', '/', '{"parentMenuId":""}', 'admin', '2024-11-07 09:43:21', '', '2024-11-07 09:46:48', NULL);
INSERT INTO "anivia"."gen_table" VALUES (25, 'user_type', '用户类型', NULL, NULL, 'UserType', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example.hr', 'user', 'type', '用户类型', 'anivia', '0', '/', '{"parentMenuId":"1"}', 'admin', '2024-11-20 18:22:14', '', '2024-11-26 10:51:32', NULL);
INSERT INTO "anivia"."gen_table" VALUES (26, 'pro_plan', '生产计划', NULL, NULL, 'ProPlan', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example', 'orderTask', 'proOrderTask', '生产计划', 'anivia', '0', 'D:\workspace\Anivia-Plus\anivia-ui\anivia3', '{"parentMenuId":"2023"}', 'admin', '2024-11-22 11:52:04', '', '2024-11-22 15:08:06', NULL);
INSERT INTO "anivia"."gen_table" VALUES (27, 'pro_task_receive', '生产领料记录', NULL, NULL, 'ProTaskReceive', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example', 'taskReceive', 'proTaskReceive', '生产领料记录', 'anivia', '0', '/', '{"parentMenuId":2023}', 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12', NULL);
INSERT INTO "anivia"."gen_table" VALUES (28, 'sys_dept', '部门表', '', '', 'SysDept', 'tree', 'element-plus', 'tech.qiantong.qmodel.module.system', 'system', 'dept', '部门', 'anivia', '0', '/', '{"treeCode":"dept_id","treeName":"dept_name","treeParentCode":"parent_id","parentMenuId":""}', 'admin', '2024-11-26 09:27:17', '', '2024-11-26 10:57:45', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."gen_table_column";
CREATE TABLE "anivia"."gen_table_column" (
  "column_id" int8 NOT NULL DEFAULT nextval('"anivia".gen_table_column_column_id_seq'::regclass),
  "table_id" int8,
  "column_name" varchar(200) COLLATE "pg_catalog"."default",
  "column_comment" varchar(500) COLLATE "pg_catalog"."default",
  "column_type" varchar(100) COLLATE "pg_catalog"."default",
  "java_type" varchar(500) COLLATE "pg_catalog"."default",
  "java_field" varchar(200) COLLATE "pg_catalog"."default",
  "is_pk" char(1) COLLATE "pg_catalog"."default",
  "is_increment" char(1) COLLATE "pg_catalog"."default",
  "is_required" char(1) COLLATE "pg_catalog"."default",
  "is_insert" char(1) COLLATE "pg_catalog"."default",
  "is_edit" char(1) COLLATE "pg_catalog"."default",
  "is_list" char(1) COLLATE "pg_catalog"."default",
  "is_query" char(1) COLLATE "pg_catalog"."default",
  "query_type" varchar(200) COLLATE "pg_catalog"."default" DEFAULT 'EQ'::varchar,
  "html_type" varchar(200) COLLATE "pg_catalog"."default",
  "dict_type" varchar(200) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "sort" int4,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime"
)
;
COMMENT ON COLUMN "anivia"."gen_table_column"."column_id" IS '编号';
COMMENT ON COLUMN "anivia"."gen_table_column"."table_id" IS '归属表编号';
COMMENT ON COLUMN "anivia"."gen_table_column"."column_name" IS '列名称';
COMMENT ON COLUMN "anivia"."gen_table_column"."column_comment" IS '列描述';
COMMENT ON COLUMN "anivia"."gen_table_column"."column_type" IS '列类型';
COMMENT ON COLUMN "anivia"."gen_table_column"."java_type" IS 'JAVA类型';
COMMENT ON COLUMN "anivia"."gen_table_column"."java_field" IS 'JAVA字段名';
COMMENT ON COLUMN "anivia"."gen_table_column"."is_pk" IS '是否主键（1是）';
COMMENT ON COLUMN "anivia"."gen_table_column"."is_increment" IS '是否自增（1是）';
COMMENT ON COLUMN "anivia"."gen_table_column"."is_required" IS '是否必填（1是）';
COMMENT ON COLUMN "anivia"."gen_table_column"."is_insert" IS '是否为插入字段（1是）';
COMMENT ON COLUMN "anivia"."gen_table_column"."is_edit" IS '是否编辑字段（1是）';
COMMENT ON COLUMN "anivia"."gen_table_column"."is_list" IS '是否列表字段（1是）';
COMMENT ON COLUMN "anivia"."gen_table_column"."is_query" IS '是否查询字段（1是）';
COMMENT ON COLUMN "anivia"."gen_table_column"."query_type" IS '查询方式（等于、不等于、大于、小于、范围）';
COMMENT ON COLUMN "anivia"."gen_table_column"."html_type" IS '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';
COMMENT ON COLUMN "anivia"."gen_table_column"."dict_type" IS '字典类型';
COMMENT ON COLUMN "anivia"."gen_table_column"."sort" IS '排序';
COMMENT ON COLUMN "anivia"."gen_table_column"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."gen_table_column"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."gen_table_column"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."gen_table_column"."update_time" IS '更新时间';
COMMENT ON TABLE "anivia"."gen_table_column" IS '代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO "anivia"."gen_table_column" VALUES (284, 19, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:44');
INSERT INTO "anivia"."gen_table_column" VALUES (285, 19, 'name', '名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', '', 2, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:44');
INSERT INTO "anivia"."gen_table_column" VALUES (286, 19, 'age', '年龄', 'int(11)', 'Long', 'age', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:44');
INSERT INTO "anivia"."gen_table_column" VALUES (287, 19, 'phone', '手机号', 'varchar(32)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 4, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:44');
INSERT INTO "anivia"."gen_table_column" VALUES (288, 19, 'type_id', '用户类型', 'bigint(20)', 'Long', 'typeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'checkbox', 'sys_yes_no', 5, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:44');
INSERT INTO "anivia"."gen_table_column" VALUES (289, 19, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (290, 19, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (291, 19, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', '', 8, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (292, 19, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (293, 19, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (294, 19, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2024-10-23 16:21:16', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (295, 19, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2024-10-23 16:21:17', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (296, 19, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2024-10-23 16:21:17', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (297, 19, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', '', 14, '', '2024-10-23 16:21:17', '', '2024-11-26 10:48:45');
INSERT INTO "anivia"."gen_table_column" VALUES (308, 22, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:43');
INSERT INTO "anivia"."gen_table_column" VALUES (309, 22, 'sender_id', '发送人', 'bigint(20)', 'Long', 'senderId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:43');
INSERT INTO "anivia"."gen_table_column" VALUES (310, 22, 'receiver_id', '接收人', 'bigint(20)', 'Long', 'receiverId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:43');
INSERT INTO "anivia"."gen_table_column" VALUES (311, 22, 'title', '消息标题', 'varchar(128)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (312, 22, 'content', '消息模板内容', 'varchar(3072)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 5, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (313, 22, 'category', '消息类别', 'tinyint(4) unsigned', 'Integer', 'category', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (314, 22, 'level', '消息等级', 'tinyint(4) unsigned', 'Integer', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (315, 22, 'module', '消息模块', 'tinyint(4) unsigned', 'Integer', 'module', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (316, 22, 'entity_type', '实体类型', 'tinyint(4) unsigned', 'Integer', 'entityType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (317, 22, 'entity_id', '实体id', 'bigint(20)', 'Long', 'entityId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (318, 22, 'entity_url', '消息链接', 'varchar(256)', 'String', 'entityUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (319, 22, 'has_read', '是否已读', 'tinyint(1)', 'Integer', 'hasRead', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (320, 22, 'has_retraction', '是否撤回', 'tinyint(1)', 'Integer', 'hasRetraction', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (321, 22, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (322, 22, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (323, 22, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (324, 22, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (325, 22, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:44');
INSERT INTO "anivia"."gen_table_column" VALUES (326, 22, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:45');
INSERT INTO "anivia"."gen_table_column" VALUES (327, 22, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:45');
INSERT INTO "anivia"."gen_table_column" VALUES (328, 22, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 21, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:45');
INSERT INTO "anivia"."gen_table_column" VALUES (329, 22, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 22, 'admin', '2024-10-31 14:25:34', '', '2024-11-26 15:52:45');
INSERT INTO "anivia"."gen_table_column" VALUES (330, 23, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (331, 23, 'title', '消息标题', 'varchar(128)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (332, 23, 'content', '消息模板内容', 'varchar(3072)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (333, 23, 'category', '消息类别', 'tinyint(4) unsigned', 'Integer', 'category', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (334, 23, 'level', '消息等级', 'tinyint(4) unsigned', 'Integer', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (335, 23, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (336, 23, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (337, 23, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (338, 23, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (339, 23, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:52');
INSERT INTO "anivia"."gen_table_column" VALUES (340, 23, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:53');
INSERT INTO "anivia"."gen_table_column" VALUES (341, 23, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:53');
INSERT INTO "anivia"."gen_table_column" VALUES (342, 23, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:53');
INSERT INTO "anivia"."gen_table_column" VALUES (343, 23, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 14, 'admin', '2024-10-31 14:25:35', '', '2024-11-01 09:49:53');
INSERT INTO "anivia"."gen_table_column" VALUES (344, 24, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-11-07 09:43:22', '', '2024-11-07 09:46:48');
INSERT INTO "anivia"."gen_table_column" VALUES (345, 24, 'auth_id', '统一身份认证id', 'varchar(256)', 'String', 'authId', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-07 09:43:22', '', '2024-11-07 09:46:49');
INSERT INTO "anivia"."gen_table_column" VALUES (346, 24, 'auth_product_type', '认证平台类型', 'tinyint(4) unsigned', 'Integer', 'authProductType', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-11-07 09:43:22', '', '2024-11-07 09:46:49');
INSERT INTO "anivia"."gen_table_column" VALUES (347, 25, 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-11-20 18:22:14', '', '2024-11-26 10:51:32');
INSERT INTO "anivia"."gen_table_column" VALUES (348, 25, 'name', '类型名称', 'varchar(128)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'select', 'message_level', 2, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (349, 25, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (350, 25, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (351, 25, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (352, 25, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (353, 25, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (354, 25, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (355, 25, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (356, 25, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (357, 25, 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2024-11-20 18:22:15', '', '2024-11-26 10:51:33');
INSERT INTO "anivia"."gen_table_column" VALUES (358, 26, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-11-22 11:52:04', '', '2024-11-22 15:08:06');
INSERT INTO "anivia"."gen_table_column" VALUES (359, 26, 'company_id', '所属母公司id', 'bigint(20)', 'Long', 'companyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-22 11:52:04', '', '2024-11-22 15:08:06');
INSERT INTO "anivia"."gen_table_column" VALUES (360, 26, 'subsidiary_id', '所属子公司id', 'bigint(20)', 'Long', 'subsidiaryId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:06');
INSERT INTO "anivia"."gen_table_column" VALUES (361, 26, 'sale_id', '销售单id', 'bigint(20)', 'Long', 'saleId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:06');
INSERT INTO "anivia"."gen_table_column" VALUES (362, 26, 'sale_code', '销售单号', 'varchar(32)', 'String', 'saleCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:06');
INSERT INTO "anivia"."gen_table_column" VALUES (363, 26, 'code', '计划单号', 'varchar(32)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (364, 26, 'product_id', '产品id', 'bigint(20)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (365, 26, 'product_code', '产品编码', 'varchar(32)', 'String', 'productCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (366, 26, 'split_route_type', '拆单工艺类型', 'tinyint(4) unsigned', 'Integer', 'splitRouteType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (367, 26, 'pro_bom_id', '生产BOMid', 'bigint(20)', 'Long', 'proBomId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (368, 26, 'pro_bom_code', '生产BOM编码', 'varchar(32)', 'String', 'proBomCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-11-22 11:52:05', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (369, 26, 'route_id', '工艺路线id', 'bigint(20)', 'Long', 'routeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (370, 26, 'route_code', '工艺路线编码', 'varchar(32)', 'String', 'routeCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (371, 26, 'status', '状态', 'tinyint(4) unsigned', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (372, 26, 'plan_number', '计划数量', 'int(11)', 'Long', 'planNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (373, 26, 'begin_time', '计划开始时间', 'datetime', 'Date', 'beginTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (374, 26, 'end_time', '计划结束时间', 'datetime', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (375, 26, 'attachment', '附件', 'varchar(3072)', 'String', 'attachment', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 18, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (376, 26, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:07');
INSERT INTO "anivia"."gen_table_column" VALUES (377, 26, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO "anivia"."gen_table_column" VALUES (378, 26, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO "anivia"."gen_table_column" VALUES (379, 26, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO "anivia"."gen_table_column" VALUES (380, 26, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 23, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO "anivia"."gen_table_column" VALUES (381, 26, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-11-22 11:52:06', '', '2024-11-22 15:08:08');
INSERT INTO "anivia"."gen_table_column" VALUES (382, 26, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-11-22 11:52:07', '', '2024-11-22 15:08:08');
INSERT INTO "anivia"."gen_table_column" VALUES (383, 26, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 26, 'admin', '2024-11-22 11:52:07', '', '2024-11-22 15:08:08');
INSERT INTO "anivia"."gen_table_column" VALUES (384, 26, 'remark', '备注', 'text', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 27, 'admin', '2024-11-22 11:52:07', '', '2024-11-22 15:08:08');
INSERT INTO "anivia"."gen_table_column" VALUES (385, 27, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (386, 27, 'company_id', '所属母公司id', 'bigint(20)', 'Long', 'companyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (387, 27, 'subsidiary_id', '所属子公司id', 'bigint(20)', 'Long', 'subsidiaryId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (388, 27, 'task_id', '任务id', 'bigint(20)', 'Long', 'taskId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (389, 27, 'task_code', '任务编号', 'varchar(32)', 'String', 'taskCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (390, 27, 'order_id', '工单id', 'bigint(20)', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (391, 27, 'order_code', '工单编号', 'varchar(32)', 'String', 'orderCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (392, 27, 'reveive_time', '领料日期', 'datetime', 'Date', 'reveiveTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (393, 27, 'material_id', '物料id', 'bigint(20)', 'Long', 'materialId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (394, 27, 'material_code', '物料编码', 'varchar(32)', 'String', 'materialCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (395, 27, 'staff_id', '领料人id', 'bigint(20)', 'Long', 'staffId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-11-22 15:10:15', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (396, 27, 'count', '领料数量', 'decimal(10,0)', 'Long', 'count', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:12');
INSERT INTO "anivia"."gen_table_column" VALUES (397, 27, 'unit_id', '单位id', 'bigint(20)', 'Long', 'unitId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (398, 27, 'unit_code', '单位编号', 'varchar(32)', 'String', 'unitCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (399, 27, 'store_id', '仓库id', 'bigint(20)', 'Long', 'storeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (400, 27, 'store_code', '仓库编码', 'varchar(32)', 'String', 'storeCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (401, 27, 'store_location_id', '所属库位id', 'bigint(20)', 'Long', 'storeLocationId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (402, 27, 'store_location_code', '所属库位编码', 'varchar(32)', 'String', 'storeLocationCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (403, 27, 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (404, 27, 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (405, 27, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (406, 27, 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (407, 27, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 23, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (408, 27, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (409, 27, 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:13');
INSERT INTO "anivia"."gen_table_column" VALUES (410, 27, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 26, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:14');
INSERT INTO "anivia"."gen_table_column" VALUES (411, 27, 'remark', '备注', 'text', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 27, 'admin', '2024-11-22 15:10:16', '', '2024-11-26 11:16:14');
INSERT INTO "anivia"."gen_table_column" VALUES (412, 28, 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '1', '1', '0', '0', '0', '0', '0', 'EQ', 'input', '', 1, 'admin', '2024-11-26 09:27:17', '', '2024-11-26 10:57:45');
INSERT INTO "anivia"."gen_table_column" VALUES (413, 28, 'parent_id', '父部门id', 'bigint(20)', 'Long', 'parentId', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-11-26 09:27:17', '', '2024-11-26 10:57:45');
INSERT INTO "anivia"."gen_table_column" VALUES (414, 28, 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 3, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:45');
INSERT INTO "anivia"."gen_table_column" VALUES (415, 28, 'dept_name', '部门名称', 'varchar(30)', 'String', 'deptName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:45');
INSERT INTO "anivia"."gen_table_column" VALUES (416, 28, 'order_num', '显示顺序', 'int(11)', 'Long', 'orderNum', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 5, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:45');
INSERT INTO "anivia"."gen_table_column" VALUES (417, 28, 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:45');
INSERT INTO "anivia"."gen_table_column" VALUES (418, 28, 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:45');
INSERT INTO "anivia"."gen_table_column" VALUES (419, 28, 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:46');
INSERT INTO "anivia"."gen_table_column" VALUES (420, 28, 'status', '部门状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 9, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:46');
INSERT INTO "anivia"."gen_table_column" VALUES (421, 28, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'Boolean', 'delFlag', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 10, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:46');
INSERT INTO "anivia"."gen_table_column" VALUES (422, 28, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 11, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:46');
INSERT INTO "anivia"."gen_table_column" VALUES (423, 28, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 12, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:46');
INSERT INTO "anivia"."gen_table_column" VALUES (424, 28, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 13, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:46');
INSERT INTO "anivia"."gen_table_column" VALUES (425, 28, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 14, 'admin', '2024-11-26 09:27:18', '', '2024-11-26 10:57:46');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."message";
CREATE TABLE "anivia"."message" (
  "id" int4 NOT NULL DEFAULT nextval('"anivia".message_id_seq'::regclass),
  "sender_id" int8,
  "receiver_id" int8,
  "title" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "content" varchar(3072) COLLATE "pg_catalog"."default" NOT NULL,
  "category" int2 NOT NULL,
  "msg_level" int2 NOT NULL DEFAULT 0,
  "module" int2 NOT NULL DEFAULT 0,
  "entity_type" int2,
  "entity_id" int8,
  "entity_url" varchar(256) COLLATE "pg_catalog"."default",
  "has_read" tinyint DEFAULT 0,
  "has_retraction" tinyint DEFAULT 0,
  "valid_flag" tinyint NOT NULL DEFAULT 1,
  "del_flag" tinyint NOT NULL DEFAULT 0,
  "create_by" varchar(32) COLLATE "pg_catalog"."default",
  "creator_id" int8,
  "create_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(32) COLLATE "pg_catalog"."default",
  "updator_id" int8,
  "update_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "remark" varchar(512) COLLATE "pg_catalog"."default",
  "level" int2 DEFAULT 0
)
;
COMMENT ON COLUMN "anivia"."message"."id" IS 'ID';
COMMENT ON COLUMN "anivia"."message"."sender_id" IS '发送人';
COMMENT ON COLUMN "anivia"."message"."receiver_id" IS '接收人';
COMMENT ON COLUMN "anivia"."message"."title" IS '消息标题';
COMMENT ON COLUMN "anivia"."message"."content" IS '消息模板内容';
COMMENT ON COLUMN "anivia"."message"."category" IS '消息类别';
COMMENT ON COLUMN "anivia"."message"."msg_level" IS '消息等级';
COMMENT ON COLUMN "anivia"."message"."module" IS '消息模块';
COMMENT ON COLUMN "anivia"."message"."entity_type" IS '实体类型';
COMMENT ON COLUMN "anivia"."message"."entity_id" IS '实体id';
COMMENT ON COLUMN "anivia"."message"."entity_url" IS '消息链接';
COMMENT ON COLUMN "anivia"."message"."has_read" IS '是否已读';
COMMENT ON COLUMN "anivia"."message"."has_retraction" IS '是否撤回';
COMMENT ON COLUMN "anivia"."message"."valid_flag" IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN "anivia"."message"."del_flag" IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN "anivia"."message"."create_by" IS '创建人';
COMMENT ON COLUMN "anivia"."message"."creator_id" IS '创建人id';
COMMENT ON COLUMN "anivia"."message"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."message"."update_by" IS '更新人';
COMMENT ON COLUMN "anivia"."message"."updator_id" IS '更新人id';
COMMENT ON COLUMN "anivia"."message"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."message"."remark" IS '备注';
COMMENT ON COLUMN "anivia"."message"."level" IS '消息等级';
COMMENT ON TABLE "anivia"."message" IS '消息';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO "anivia"."message" VALUES (1, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, '0', '0', '1', '1', NULL, NULL, '2024-11-01 15:51:36', NULL, NULL, '2024-11-01 15:51:36', NULL, 0);
INSERT INTO "anivia"."message" VALUES (2, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, '1', '0', '1', '1', NULL, NULL, '2024-11-01 15:51:48', NULL, NULL, '2024-11-01 15:51:48', NULL, 0);
INSERT INTO "anivia"."message" VALUES (3, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, '1', '0', '1', '1', NULL, NULL, '2024-11-01 15:51:52', NULL, NULL, '2024-11-01 15:51:52', NULL, 0);
INSERT INTO "anivia"."message" VALUES (4, NULL, 2, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, '0', '0', '1', '0', NULL, NULL, '2024-11-01 15:52:53', NULL, NULL, '2024-11-01 15:52:53', NULL, 0);
INSERT INTO "anivia"."message" VALUES (5, NULL, 2, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, '0', '0', '1', '0', NULL, NULL, '2024-11-01 15:52:54', NULL, NULL, '2024-11-01 15:52:54', NULL, 0);
INSERT INTO "anivia"."message" VALUES (6, NULL, 2, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, '0', '0', '1', '0', NULL, NULL, '2024-11-01 15:52:56', NULL, NULL, '2024-11-01 15:52:56', NULL, 0);
INSERT INTO "anivia"."message" VALUES (7, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, '1', '0', '1', '0', NULL, NULL, '2024-11-01 15:53:00', NULL, NULL, '2024-11-01 15:53:00', NULL, 0);
INSERT INTO "anivia"."message" VALUES (8, NULL, 1, '测试模版', '测试消息测试模版', 0, 0, 0, NULL, NULL, NULL, '0', '0', '1', '1', NULL, NULL, '2024-11-01 17:19:43', NULL, NULL, '2024-11-01 17:19:43', NULL, 0);
INSERT INTO "anivia"."message" VALUES (9, NULL, 1, '测试模版', '***************测试模版', 0, 0, 1, NULL, NULL, NULL, '0', '0', '1', '1', NULL, NULL, '2024-11-04 09:17:08', NULL, NULL, '2024-11-04 09:17:08', NULL, 0);
INSERT INTO "anivia"."message" VALUES (10, NULL, 1, '测试模版', '***************测试模版', 0, 0, 1, NULL, NULL, NULL, '0', '0', '1', '1', NULL, NULL, '2024-11-04 09:17:27', NULL, NULL, '2024-11-04 09:17:27', NULL, 0);
INSERT INTO "anivia"."message" VALUES (11, NULL, 1, '测试模版', '***************测试模版', 0, 0, 1, NULL, NULL, NULL, '1', '0', '1', '0', NULL, NULL, '2024-11-04 09:17:52', NULL, NULL, '2024-11-04 09:17:52', NULL, 0);
INSERT INTO "anivia"."message" VALUES (12, NULL, 1, '测试模版', '***************测试模版', 0, 0, 1, NULL, NULL, NULL, '1', '0', '1', '0', NULL, NULL, '2024-11-04 09:17:59', NULL, NULL, '2024-11-04 09:17:59', NULL, 0);
INSERT INTO "anivia"."message" VALUES (13, NULL, 1, '测试模版', '111111111111测试模版', 0, 0, 1, NULL, NULL, NULL, '1', '0', '1', '0', NULL, NULL, '2024-11-04 09:21:32', NULL, NULL, '2024-11-04 09:21:32', NULL, 0);
INSERT INTO "anivia"."message" VALUES (14, NULL, 1, '测试模版', '111111111111测试模版', 0, 0, 1, NULL, NULL, NULL, '1', '0', '1', '1', NULL, NULL, '2024-11-04 09:21:36', NULL, NULL, '2024-11-04 09:21:36', NULL, 0);

-- ----------------------------
-- Table structure for message_template
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."message_template";
CREATE TABLE "anivia"."message_template" (
  "id" int4 NOT NULL DEFAULT nextval('"anivia".message_template_id_seq'::regclass),
  "title" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "content" varchar(3072) COLLATE "pg_catalog"."default" NOT NULL,
  "category" int2 NOT NULL,
  "msg_level" int2 NOT NULL DEFAULT 0,
  "valid_flag" tinyint NOT NULL DEFAULT 1,
  "del_flag" tinyint NOT NULL DEFAULT 0,
  "create_by" varchar(32) COLLATE "pg_catalog"."default",
  "creator_id" int8,
  "create_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(32) COLLATE "pg_catalog"."default",
  "updator_id" int8,
  "update_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "remark" varchar(512) COLLATE "pg_catalog"."default",
  "level" int2 DEFAULT 0
)
;
COMMENT ON COLUMN "anivia"."message_template"."id" IS 'ID';
COMMENT ON COLUMN "anivia"."message_template"."title" IS '消息标题';
COMMENT ON COLUMN "anivia"."message_template"."content" IS '消息模板内容';
COMMENT ON COLUMN "anivia"."message_template"."category" IS '消息类别';
COMMENT ON COLUMN "anivia"."message_template"."msg_level" IS '消息等级';
COMMENT ON COLUMN "anivia"."message_template"."valid_flag" IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN "anivia"."message_template"."del_flag" IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN "anivia"."message_template"."create_by" IS '创建人';
COMMENT ON COLUMN "anivia"."message_template"."creator_id" IS '创建人id';
COMMENT ON COLUMN "anivia"."message_template"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."message_template"."update_by" IS '更新人';
COMMENT ON COLUMN "anivia"."message_template"."updator_id" IS '更新人id';
COMMENT ON COLUMN "anivia"."message_template"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."message_template"."remark" IS '备注';
COMMENT ON COLUMN "anivia"."message_template"."level" IS '消息等级';
COMMENT ON TABLE "anivia"."message_template" IS '消息模板';

-- ----------------------------
-- Records of message_template
-- ----------------------------
INSERT INTO "anivia"."message_template" VALUES (2, '测试', '2', 0, 0, '1', '0', 'admin', 1, '2024-11-20 11:12:52', NULL, NULL, '2024-11-20 11:12:52', NULL, 0);
INSERT INTO "anivia"."message_template" VALUES (1, '测试模版', '${test}测试模版', 0, 0, '1', '0', '', 1, '2024-11-01 10:35:16', 'admin', 1, '2024-11-26 16:17:56', NULL, 0);

-- ----------------------------
-- Table structure for pro_plan
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."pro_plan";
CREATE TABLE "anivia"."pro_plan" (
  "id" int8 NOT NULL DEFAULT nextval('"anivia".pro_plan_id_seq'::regclass),
  "company_id" int8,
  "subsidiary_id" int8,
  "sale_id" int8,
  "sale_code" varchar(32) COLLATE "pg_catalog"."default",
  "code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "product_id" int8 NOT NULL,
  "product_code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "split_route_type" int2 NOT NULL,
  "pro_bom_id" int8,
  "pro_bom_code" varchar(32) COLLATE "pg_catalog"."default",
  "route_id" int8,
  "route_code" varchar(32) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL DEFAULT 0,
  "plan_number" int4 NOT NULL,
  "begin_time" "pg_catalog"."datetime" NOT NULL,
  "end_time" "pg_catalog"."datetime" NOT NULL,
  "attachment" varchar(3072) COLLATE "pg_catalog"."default",
  "valid_flag" tinyint NOT NULL DEFAULT 1,
  "del_flag" tinyint NOT NULL DEFAULT 0,
  "create_by" varchar(32) COLLATE "pg_catalog"."default",
  "creator_id" int8,
  "create_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(32) COLLATE "pg_catalog"."default",
  "updator_id" int8,
  "update_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "remark" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."pro_plan"."id" IS 'ID';
COMMENT ON COLUMN "anivia"."pro_plan"."company_id" IS '所属母公司id';
COMMENT ON COLUMN "anivia"."pro_plan"."subsidiary_id" IS '所属子公司id';
COMMENT ON COLUMN "anivia"."pro_plan"."sale_id" IS '销售单id';
COMMENT ON COLUMN "anivia"."pro_plan"."sale_code" IS '销售单号';
COMMENT ON COLUMN "anivia"."pro_plan"."code" IS '计划单号';
COMMENT ON COLUMN "anivia"."pro_plan"."product_id" IS '产品id';
COMMENT ON COLUMN "anivia"."pro_plan"."product_code" IS '产品编码';
COMMENT ON COLUMN "anivia"."pro_plan"."split_route_type" IS '拆单工艺类型';
COMMENT ON COLUMN "anivia"."pro_plan"."pro_bom_id" IS '生产BOMid';
COMMENT ON COLUMN "anivia"."pro_plan"."pro_bom_code" IS '生产BOM编码';
COMMENT ON COLUMN "anivia"."pro_plan"."route_id" IS '工艺路线id';
COMMENT ON COLUMN "anivia"."pro_plan"."route_code" IS '工艺路线编码';
COMMENT ON COLUMN "anivia"."pro_plan"."status" IS '状态';
COMMENT ON COLUMN "anivia"."pro_plan"."plan_number" IS '计划数量';
COMMENT ON COLUMN "anivia"."pro_plan"."begin_time" IS '计划开始时间';
COMMENT ON COLUMN "anivia"."pro_plan"."end_time" IS '计划结束时间';
COMMENT ON COLUMN "anivia"."pro_plan"."attachment" IS '附件';
COMMENT ON COLUMN "anivia"."pro_plan"."valid_flag" IS '是否有效';
COMMENT ON COLUMN "anivia"."pro_plan"."del_flag" IS '删除标志';
COMMENT ON COLUMN "anivia"."pro_plan"."create_by" IS '创建人';
COMMENT ON COLUMN "anivia"."pro_plan"."creator_id" IS '创建人id';
COMMENT ON COLUMN "anivia"."pro_plan"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."pro_plan"."update_by" IS '更新人';
COMMENT ON COLUMN "anivia"."pro_plan"."updator_id" IS '更新人id';
COMMENT ON COLUMN "anivia"."pro_plan"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."pro_plan"."remark" IS '备注';
COMMENT ON TABLE "anivia"."pro_plan" IS '生产计划';

-- ----------------------------
-- Records of pro_plan
-- ----------------------------

-- ----------------------------
-- Table structure for pro_task_receive
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."pro_task_receive";
CREATE TABLE "anivia"."pro_task_receive" (
  "id" int8 NOT NULL DEFAULT nextval('"anivia".pro_task_receive_id_seq'::regclass),
  "company_id" int8,
  "subsidiary_id" int8,
  "task_id" int8 NOT NULL,
  "task_code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" int8 NOT NULL,
  "order_code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "reveive_time" "pg_catalog"."datetime" NOT NULL,
  "material_id" int8 NOT NULL,
  "material_code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "staff_id" int8 NOT NULL,
  "count" numeric(10,0) NOT NULL,
  "unit_id" int8 NOT NULL,
  "unit_code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "store_id" int8,
  "store_code" varchar(32) COLLATE "pg_catalog"."default",
  "store_location_id" int8,
  "store_location_code" varchar(32) COLLATE "pg_catalog"."default",
  "valid_flag" tinyint NOT NULL DEFAULT 1,
  "del_flag" tinyint NOT NULL DEFAULT 0,
  "create_by" varchar(32) COLLATE "pg_catalog"."default",
  "creator_id" int8,
  "create_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(32) COLLATE "pg_catalog"."default",
  "updator_id" int8,
  "update_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "remark" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."pro_task_receive"."id" IS 'ID';
COMMENT ON COLUMN "anivia"."pro_task_receive"."company_id" IS '所属母公司id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."subsidiary_id" IS '所属子公司id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."task_id" IS '任务id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."task_code" IS '任务编号';
COMMENT ON COLUMN "anivia"."pro_task_receive"."order_id" IS '工单id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."order_code" IS '工单编号';
COMMENT ON COLUMN "anivia"."pro_task_receive"."reveive_time" IS '领料日期';
COMMENT ON COLUMN "anivia"."pro_task_receive"."material_id" IS '物料id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."material_code" IS '物料编码';
COMMENT ON COLUMN "anivia"."pro_task_receive"."staff_id" IS '领料人id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."count" IS '领料数量';
COMMENT ON COLUMN "anivia"."pro_task_receive"."unit_id" IS '单位id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."unit_code" IS '单位编号';
COMMENT ON COLUMN "anivia"."pro_task_receive"."store_id" IS '仓库id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."store_code" IS '仓库编码';
COMMENT ON COLUMN "anivia"."pro_task_receive"."store_location_id" IS '所属库位id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."store_location_code" IS '所属库位编码';
COMMENT ON COLUMN "anivia"."pro_task_receive"."valid_flag" IS '是否有效';
COMMENT ON COLUMN "anivia"."pro_task_receive"."del_flag" IS '删除标志';
COMMENT ON COLUMN "anivia"."pro_task_receive"."create_by" IS '创建人';
COMMENT ON COLUMN "anivia"."pro_task_receive"."creator_id" IS '创建人id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."pro_task_receive"."update_by" IS '更新人';
COMMENT ON COLUMN "anivia"."pro_task_receive"."updator_id" IS '更新人id';
COMMENT ON COLUMN "anivia"."pro_task_receive"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."pro_task_receive"."remark" IS '备注';
COMMENT ON TABLE "anivia"."pro_task_receive" IS '生产领料记录';

-- ----------------------------
-- Records of pro_task_receive
-- ----------------------------
INSERT INTO "anivia"."pro_task_receive" VALUES (1, NULL, NULL, 1, '1', 1, '1', '2024-11-15 00:00:00', 1, '1', 1, 1, 1, '1', NULL, NULL, NULL, NULL, '1', '1', 'admin', 1, '2024-11-26 00:00:00', 'admin', 1, '2024-11-26 11:42:46', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_blob_triggers";
CREATE TABLE "anivia"."qrtz_blob_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "blob_data" "pg_catalog"."blob"
)
;
COMMENT ON COLUMN "anivia"."qrtz_blob_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_blob_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "anivia"."qrtz_blob_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "anivia"."qrtz_blob_triggers"."blob_data" IS '存放持久化Trigger对象';
COMMENT ON TABLE "anivia"."qrtz_blob_triggers" IS 'Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_calendars";
CREATE TABLE "anivia"."qrtz_calendars" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "calendar_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "calendar" "pg_catalog"."blob" NOT NULL
)
;
COMMENT ON COLUMN "anivia"."qrtz_calendars"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_calendars"."calendar_name" IS '日历名称';
COMMENT ON COLUMN "anivia"."qrtz_calendars"."calendar" IS '存放持久化calendar对象';
COMMENT ON TABLE "anivia"."qrtz_calendars" IS '日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_cron_triggers";
CREATE TABLE "anivia"."qrtz_cron_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "cron_expression" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "time_zone_id" varchar(80) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."qrtz_cron_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_cron_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "anivia"."qrtz_cron_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "anivia"."qrtz_cron_triggers"."cron_expression" IS 'cron表达式';
COMMENT ON COLUMN "anivia"."qrtz_cron_triggers"."time_zone_id" IS '时区';
COMMENT ON TABLE "anivia"."qrtz_cron_triggers" IS 'Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO "anivia"."qrtz_cron_triggers" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO "anivia"."qrtz_cron_triggers" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO "anivia"."qrtz_cron_triggers" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_fired_triggers";
CREATE TABLE "anivia"."qrtz_fired_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "entry_id" varchar(95) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "instance_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "fired_time" int8 NOT NULL,
  "sched_time" int8 NOT NULL,
  "priority" int4 NOT NULL,
  "state" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "job_name" varchar(200) COLLATE "pg_catalog"."default",
  "job_group" varchar(200) COLLATE "pg_catalog"."default",
  "is_nonconcurrent" varchar(1) COLLATE "pg_catalog"."default",
  "requests_recovery" varchar(1) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."entry_id" IS '调度器实例id';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."instance_name" IS '调度器实例名';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."fired_time" IS '触发的时间';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."sched_time" IS '定时器制定的时间';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."priority" IS '优先级';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."state" IS '状态';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."job_name" IS '任务名称';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."job_group" IS '任务组名';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."is_nonconcurrent" IS '是否并发';
COMMENT ON COLUMN "anivia"."qrtz_fired_triggers"."requests_recovery" IS '是否接受恢复执行';
COMMENT ON TABLE "anivia"."qrtz_fired_triggers" IS '已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_job_details";
CREATE TABLE "anivia"."qrtz_job_details" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "job_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "job_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(250) COLLATE "pg_catalog"."default",
  "job_class_name" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "is_durable" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "is_nonconcurrent" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "is_update_data" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "requests_recovery" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "job_data" "pg_catalog"."blob"
)
;
COMMENT ON COLUMN "anivia"."qrtz_job_details"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."job_name" IS '任务名称';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."job_group" IS '任务组名';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."description" IS '相关介绍';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."job_class_name" IS '执行任务类名称';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."is_durable" IS '是否持久化';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."is_nonconcurrent" IS '是否并发';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."is_update_data" IS '是否更新数据';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."requests_recovery" IS '是否接受恢复执行';
COMMENT ON COLUMN "anivia"."qrtz_job_details"."job_data" IS '存放持久化job对象';
COMMENT ON TABLE "anivia"."qrtz_job_details" IS '任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO "anivia"."qrtz_job_details" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', E'\\254\\355\\000\\005sr\\000\\025org.quartz.JobDataMap\\237\\260\\203\\350\\277\\251\\260\\313\\002\\000\\000xr\\000&org.quartz.utils.StringKeyDirtyFlagMap\\202\\010\\350\\303\\373\\305](\\002\\000\\001Z\\000\\023allowsTransientDataxr\\000\\035org.quartz.utils.DirtyFlagMap\\023\\346.\\255(v\\012\\316\\002\\000\\002Z\\000\\005dirtyL\\000\\003mapt\\000\\017Ljava/util/Map;xp\\001sr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\014w\\010\\000\\000\\000\\020\\000\\000\\000\\001t\\000\\017TASK_PROPERTIESsr\\000''com.ruoyi.project.monitor.domain.SysJob\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\010L\\000\\012concurrentt\\000\\022Ljava/lang/String;L\\000\\016cronExpressionq\\000~\\000\\011L\\000\\014invokeTargetq\\000~\\000\\011L\\000\\010jobGroupq\\000~\\000\\011L\\000\\005jobIdt\\000\\020Ljava/lang/Long;L\\000\\007jobNameq\\000~\\000\\011L\\000\\015misfirePolicyq\\000~\\000\\011L\\000\\006statusq\\000~\\000\\011xr\\000)com.ruoyi.framework.web.domain.BaseEntity\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\011L\\000\\011beginTimeq\\000~\\000\\011L\\000\\010createByq\\000~\\000\\011L\\000\\012createTimeq\\000~\\000\\011L\\000\\007endTimeq\\000~\\000\\011L\\000\\006paramsq\\000~\\000\\003L\\000\\006remarkq\\000~\\000\\011L\\000\\013searchValueq\\000~\\000\\011L\\000\\010updateByq\\000~\\000\\011L\\000\\012updateTimeq\\000~\\000\\011xppt\\000\\005admint\\000\\0232024-08-18 01:23:29ppt\\000\\000pppt\\000\\0011t\\000\\0160/10 * * * * ?t\\000\\021ryTask.ryNoParamst\\000\\007DEFAULTsr\\000\\016java.lang.Long;\\213\\344\\220\\314\\217#\\337\\002\\000\\001J\\000\\005valuexr\\000\\020java.lang.Number\\206\\254\\225\\035\\013\\224\\340\\213\\002\\000\\000xp\\000\\000\\000\\000\\000\\000\\000\\001t\\000\\030\\347\\263\\273\\347\\273\\237\\351\\273\\230\\350\\256\\244\\357\\274\\210\\346\\227\\240\\345\\217\\202\\357\\274\\211t\\000\\0013t\\000\\0011x\\000');
INSERT INTO "anivia"."qrtz_job_details" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', E'\\254\\355\\000\\005sr\\000\\025org.quartz.JobDataMap\\237\\260\\203\\350\\277\\251\\260\\313\\002\\000\\000xr\\000&org.quartz.utils.StringKeyDirtyFlagMap\\202\\010\\350\\303\\373\\305](\\002\\000\\001Z\\000\\023allowsTransientDataxr\\000\\035org.quartz.utils.DirtyFlagMap\\023\\346.\\255(v\\012\\316\\002\\000\\002Z\\000\\005dirtyL\\000\\003mapt\\000\\017Ljava/util/Map;xp\\001sr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\014w\\010\\000\\000\\000\\020\\000\\000\\000\\001t\\000\\017TASK_PROPERTIESsr\\000''com.ruoyi.project.monitor.domain.SysJob\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\010L\\000\\012concurrentt\\000\\022Ljava/lang/String;L\\000\\016cronExpressionq\\000~\\000\\011L\\000\\014invokeTargetq\\000~\\000\\011L\\000\\010jobGroupq\\000~\\000\\011L\\000\\005jobIdt\\000\\020Ljava/lang/Long;L\\000\\007jobNameq\\000~\\000\\011L\\000\\015misfirePolicyq\\000~\\000\\011L\\000\\006statusq\\000~\\000\\011xr\\000)com.ruoyi.framework.web.domain.BaseEntity\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\011L\\000\\011beginTimeq\\000~\\000\\011L\\000\\010createByq\\000~\\000\\011L\\000\\012createTimeq\\000~\\000\\011L\\000\\007endTimeq\\000~\\000\\011L\\000\\006paramsq\\000~\\000\\003L\\000\\006remarkq\\000~\\000\\011L\\000\\013searchValueq\\000~\\000\\011L\\000\\010updateByq\\000~\\000\\011L\\000\\012updateTimeq\\000~\\000\\011xppt\\000\\005admint\\000\\0232024-08-18 01:23:29ppt\\000\\000pppt\\000\\0011t\\000\\0160/15 * * * * ?t\\000\\025ryTask.ryParams(''ry'')t\\000\\007DEFAULTsr\\000\\016java.lang.Long;\\213\\344\\220\\314\\217#\\337\\002\\000\\001J\\000\\005valuexr\\000\\020java.lang.Number\\206\\254\\225\\035\\013\\224\\340\\213\\002\\000\\000xp\\000\\000\\000\\000\\000\\000\\000\\002t\\000\\030\\347\\263\\273\\347\\273\\237\\351\\273\\230\\350\\256\\244\\357\\274\\210\\346\\234\\211\\345\\217\\202\\357\\274\\211t\\000\\0013t\\000\\0011x\\000');
INSERT INTO "anivia"."qrtz_job_details" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', E'\\254\\355\\000\\005sr\\000\\025org.quartz.JobDataMap\\237\\260\\203\\350\\277\\251\\260\\313\\002\\000\\000xr\\000&org.quartz.utils.StringKeyDirtyFlagMap\\202\\010\\350\\303\\373\\305](\\002\\000\\001Z\\000\\023allowsTransientDataxr\\000\\035org.quartz.utils.DirtyFlagMap\\023\\346.\\255(v\\012\\316\\002\\000\\002Z\\000\\005dirtyL\\000\\003mapt\\000\\017Ljava/util/Map;xp\\001sr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\014w\\010\\000\\000\\000\\020\\000\\000\\000\\001t\\000\\017TASK_PROPERTIESsr\\000''com.ruoyi.project.monitor.domain.SysJob\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\010L\\000\\012concurrentt\\000\\022Ljava/lang/String;L\\000\\016cronExpressionq\\000~\\000\\011L\\000\\014invokeTargetq\\000~\\000\\011L\\000\\010jobGroupq\\000~\\000\\011L\\000\\005jobIdt\\000\\020Ljava/lang/Long;L\\000\\007jobNameq\\000~\\000\\011L\\000\\015misfirePolicyq\\000~\\000\\011L\\000\\006statusq\\000~\\000\\011xr\\000)com.ruoyi.framework.web.domain.BaseEntity\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\011L\\000\\011beginTimeq\\000~\\000\\011L\\000\\010createByq\\000~\\000\\011L\\000\\012createTimeq\\000~\\000\\011L\\000\\007endTimeq\\000~\\000\\011L\\000\\006paramsq\\000~\\000\\003L\\000\\006remarkq\\000~\\000\\011L\\000\\013searchValueq\\000~\\000\\011L\\000\\010updateByq\\000~\\000\\011L\\000\\012updateTimeq\\000~\\000\\011xppt\\000\\005admint\\000\\0232024-08-18 01:23:29ppt\\000\\000pppt\\000\\0011t\\000\\0160/20 * * * * ?t\\0008ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)t\\000\\007DEFAULTsr\\000\\016java.lang.Long;\\213\\344\\220\\314\\217#\\337\\002\\000\\001J\\000\\005valuexr\\000\\020java.lang.Number\\206\\254\\225\\035\\013\\224\\340\\213\\002\\000\\000xp\\000\\000\\000\\000\\000\\000\\000\\003t\\000\\030\\347\\263\\273\\347\\273\\237\\351\\273\\230\\350\\256\\244\\357\\274\\210\\345\\244\\232\\345\\217\\202\\357\\274\\211t\\000\\0013t\\000\\0011x\\000');

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_locks";
CREATE TABLE "anivia"."qrtz_locks" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "lock_name" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "anivia"."qrtz_locks"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_locks"."lock_name" IS '悲观锁名称';
COMMENT ON TABLE "anivia"."qrtz_locks" IS '存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO "anivia"."qrtz_locks" VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_paused_trigger_grps";
CREATE TABLE "anivia"."qrtz_paused_trigger_grps" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "anivia"."qrtz_paused_trigger_grps"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_paused_trigger_grps"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON TABLE "anivia"."qrtz_paused_trigger_grps" IS '暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_scheduler_state";
CREATE TABLE "anivia"."qrtz_scheduler_state" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "instance_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "last_checkin_time" int8 NOT NULL,
  "checkin_interval" int8 NOT NULL
)
;
COMMENT ON COLUMN "anivia"."qrtz_scheduler_state"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_scheduler_state"."instance_name" IS '实例名称';
COMMENT ON COLUMN "anivia"."qrtz_scheduler_state"."last_checkin_time" IS '上次检查时间';
COMMENT ON COLUMN "anivia"."qrtz_scheduler_state"."checkin_interval" IS '检查间隔时间';
COMMENT ON TABLE "anivia"."qrtz_scheduler_state" IS '调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_simple_triggers";
CREATE TABLE "anivia"."qrtz_simple_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "repeat_count" int8 NOT NULL,
  "repeat_interval" int8 NOT NULL,
  "times_triggered" int8 NOT NULL
)
;
COMMENT ON COLUMN "anivia"."qrtz_simple_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_simple_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "anivia"."qrtz_simple_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "anivia"."qrtz_simple_triggers"."repeat_count" IS '重复的次数统计';
COMMENT ON COLUMN "anivia"."qrtz_simple_triggers"."repeat_interval" IS '重复的间隔时间';
COMMENT ON COLUMN "anivia"."qrtz_simple_triggers"."times_triggered" IS '已经触发的次数';
COMMENT ON TABLE "anivia"."qrtz_simple_triggers" IS '简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_simprop_triggers";
CREATE TABLE "anivia"."qrtz_simprop_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "str_prop_1" varchar(512) COLLATE "pg_catalog"."default",
  "str_prop_2" varchar(512) COLLATE "pg_catalog"."default",
  "str_prop_3" varchar(512) COLLATE "pg_catalog"."default",
  "int_prop_1" int4,
  "int_prop_2" int4,
  "long_prop_1" int8,
  "long_prop_2" int8,
  "dec_prop_1" numeric(13,4),
  "dec_prop_2" numeric(13,4),
  "bool_prop_1" varchar(1) COLLATE "pg_catalog"."default",
  "bool_prop_2" varchar(1) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."str_prop_1" IS 'String类型的trigger的第一个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."str_prop_2" IS 'String类型的trigger的第二个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."str_prop_3" IS 'String类型的trigger的第三个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."int_prop_1" IS 'int类型的trigger的第一个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."int_prop_2" IS 'int类型的trigger的第二个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."long_prop_1" IS 'long类型的trigger的第一个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."long_prop_2" IS 'long类型的trigger的第二个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."dec_prop_1" IS 'decimal类型的trigger的第一个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."dec_prop_2" IS 'decimal类型的trigger的第二个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."bool_prop_1" IS 'Boolean类型的trigger的第一个参数';
COMMENT ON COLUMN "anivia"."qrtz_simprop_triggers"."bool_prop_2" IS 'Boolean类型的trigger的第二个参数';
COMMENT ON TABLE "anivia"."qrtz_simprop_triggers" IS '同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."qrtz_triggers";
CREATE TABLE "anivia"."qrtz_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "job_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "job_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(250) COLLATE "pg_catalog"."default",
  "next_fire_time" int8,
  "prev_fire_time" int8,
  "priority" int4,
  "trigger_state" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_type" varchar(8) COLLATE "pg_catalog"."default" NOT NULL,
  "start_time" int8 NOT NULL,
  "end_time" int8,
  "calendar_name" varchar(200) COLLATE "pg_catalog"."default",
  "misfire_instr" int2,
  "job_data" "pg_catalog"."blob"
)
;
COMMENT ON COLUMN "anivia"."qrtz_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."trigger_name" IS '触发器的名字';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."trigger_group" IS '触发器所属组的名字';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."job_name" IS 'qrtz_job_details表job_name的外键';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."job_group" IS 'qrtz_job_details表job_group的外键';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."description" IS '相关介绍';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."next_fire_time" IS '上一次触发时间（毫秒）';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."prev_fire_time" IS '下一次触发时间（默认为-1表示不触发）';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."priority" IS '优先级';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."trigger_state" IS '触发器状态';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."trigger_type" IS '触发器的类型';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."start_time" IS '开始时间';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."end_time" IS '结束时间';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."calendar_name" IS '日程表名称';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."misfire_instr" IS '补偿执行的策略';
COMMENT ON COLUMN "anivia"."qrtz_triggers"."job_data" IS '存放持久化job对象';
COMMENT ON TABLE "anivia"."qrtz_triggers" IS '触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO "anivia"."qrtz_triggers" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1723915630000, -1, 5, 'PAUSED', 'CRON', 1723915630000, 0, NULL, 2, '');
INSERT INTO "anivia"."qrtz_triggers" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1723915635000, -1, 5, 'PAUSED', 'CRON', 1723915631000, 0, NULL, 2, '');
INSERT INTO "anivia"."qrtz_triggers" VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1723915640000, -1, 5, 'PAUSED', 'CRON', 1723915632000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for rel_user_auth_product
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."rel_user_auth_product";
CREATE TABLE "anivia"."rel_user_auth_product" (
  "user_id" int8 NOT NULL,
  "auth_id" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "auth_product_type" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "anivia"."rel_user_auth_product"."user_id" IS '用户ID';
COMMENT ON COLUMN "anivia"."rel_user_auth_product"."auth_id" IS '统一身份认证id';
COMMENT ON COLUMN "anivia"."rel_user_auth_product"."auth_product_type" IS '认证平台类型;0：冰凤框架；1：微信；2：支付宝';
COMMENT ON TABLE "anivia"."rel_user_auth_product" IS '用户与认证中心关系表';

-- ----------------------------
-- Records of rel_user_auth_product
-- ----------------------------
INSERT INTO "anivia"."rel_user_auth_product" VALUES (1, '1', 0);

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_config";
CREATE TABLE "anivia"."system_config" (
  "config_id" int4 NOT NULL DEFAULT nextval('"anivia".system_config_config_id_seq'::regclass),
  "config_name" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "config_key" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "config_value" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "config_type" char(1) COLLATE "pg_catalog"."default" DEFAULT 'N'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."system_config"."config_id" IS '参数主键';
COMMENT ON COLUMN "anivia"."system_config"."config_name" IS '参数名称';
COMMENT ON COLUMN "anivia"."system_config"."config_key" IS '参数键名';
COMMENT ON COLUMN "anivia"."system_config"."config_value" IS '参数键值';
COMMENT ON COLUMN "anivia"."system_config"."config_type" IS '系统内置（Y是 N否）';
COMMENT ON COLUMN "anivia"."system_config"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_config"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_config"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_config"."remark" IS '备注';
COMMENT ON TABLE "anivia"."system_config" IS '参数配置表';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO "anivia"."system_config" VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO "anivia"."system_config" VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '初始化密码 123456');
INSERT INTO "anivia"."system_config" VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO "anivia"."system_config" VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO "anivia"."system_config" VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-06 06:12:18', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO "anivia"."system_config" VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '-', 'Y', 'admin', '2024-05-06 06:12:18', 'admin', '2024-11-26 15:51:27', '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_dept";
CREATE TABLE "anivia"."system_dept" (
  "dept_id" int8 NOT NULL DEFAULT nextval('"anivia".system_dept_dept_id_seq'::regclass),
  "parent_id" int8 DEFAULT 0,
  "ancestors" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "dept_name" varchar(30) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "order_num" int4 DEFAULT 0,
  "leader" varchar(20) COLLATE "pg_catalog"."default",
  "phone" varchar(11) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime"
)
;
COMMENT ON COLUMN "anivia"."system_dept"."dept_id" IS '部门id';
COMMENT ON COLUMN "anivia"."system_dept"."parent_id" IS '父部门id';
COMMENT ON COLUMN "anivia"."system_dept"."ancestors" IS '祖级列表';
COMMENT ON COLUMN "anivia"."system_dept"."dept_name" IS '部门名称';
COMMENT ON COLUMN "anivia"."system_dept"."order_num" IS '显示顺序';
COMMENT ON COLUMN "anivia"."system_dept"."leader" IS '负责人';
COMMENT ON COLUMN "anivia"."system_dept"."phone" IS '联系电话';
COMMENT ON COLUMN "anivia"."system_dept"."email" IS '邮箱';
COMMENT ON COLUMN "anivia"."system_dept"."status" IS '部门状态（0正常 1停用）';
COMMENT ON COLUMN "anivia"."system_dept"."del_flag" IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN "anivia"."system_dept"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_dept"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_dept"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_dept"."update_time" IS '更新时间';
COMMENT ON TABLE "anivia"."system_dept" IS '部门表';

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO "anivia"."system_dept" VALUES (100, 0, '0', '千桐科技', 0, '千桐', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-10-29 16:51:32');
INSERT INTO "anivia"."system_dept" VALUES (101, 100, '0,100', '南京总公司', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 13:46:24');
INSERT INTO "anivia"."system_dept" VALUES (102, 100, '0,100', '郑州分公司', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 13:46:44');
INSERT INTO "anivia"."system_dept" VALUES (103, 101, '0,100,101', '研发部门', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO "anivia"."system_dept" VALUES (104, 101, '0,100,101', '市场部门', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO "anivia"."system_dept" VALUES (105, 101, '0,100,101', '测试部门', 3, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO "anivia"."system_dept" VALUES (106, 101, '0,100,101', '财务部门', 4, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO "anivia"."system_dept" VALUES (107, 101, '0,100,101', '运维部门', 5, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:50:19');
INSERT INTO "anivia"."system_dept" VALUES (108, 102, '0,100,102', '市场部门', 1, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);
INSERT INTO "anivia"."system_dept" VALUES (109, 102, '0,100,102', '财务部门', 2, '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL);

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_dict_data";
CREATE TABLE "anivia"."system_dict_data" (
  "dict_code" int8 NOT NULL DEFAULT nextval('"anivia".system_dict_data_dict_code_seq'::regclass),
  "dict_sort" int4 DEFAULT 0,
  "dict_label" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "dict_value" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "dict_type" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "css_class" varchar(100) COLLATE "pg_catalog"."default",
  "list_class" varchar(100) COLLATE "pg_catalog"."default",
  "is_default" char(1) COLLATE "pg_catalog"."default" DEFAULT 'N'::bpchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."system_dict_data"."dict_code" IS '字典编码';
COMMENT ON COLUMN "anivia"."system_dict_data"."dict_sort" IS '字典排序';
COMMENT ON COLUMN "anivia"."system_dict_data"."dict_label" IS '字典标签';
COMMENT ON COLUMN "anivia"."system_dict_data"."dict_value" IS '字典键值';
COMMENT ON COLUMN "anivia"."system_dict_data"."dict_type" IS '字典类型';
COMMENT ON COLUMN "anivia"."system_dict_data"."css_class" IS '样式属性（其他样式扩展）';
COMMENT ON COLUMN "anivia"."system_dict_data"."list_class" IS '表格回显样式';
COMMENT ON COLUMN "anivia"."system_dict_data"."is_default" IS '是否默认（Y是 N否）';
COMMENT ON COLUMN "anivia"."system_dict_data"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "anivia"."system_dict_data"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_dict_data"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_dict_data"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_dict_data"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_dict_data"."remark" IS '备注';
COMMENT ON TABLE "anivia"."system_dict_data" IS '字典数据表';

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
INSERT INTO "anivia"."system_dict_data" VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '性别男');
INSERT INTO "anivia"."system_dict_data" VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '性别女');
INSERT INTO "anivia"."system_dict_data" VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '性别未知');
INSERT INTO "anivia"."system_dict_data" VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '显示菜单');
INSERT INTO "anivia"."system_dict_data" VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '隐藏菜单');
INSERT INTO "anivia"."system_dict_data" VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '正常状态');
INSERT INTO "anivia"."system_dict_data" VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '停用状态');
INSERT INTO "anivia"."system_dict_data" VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '正常状态');
INSERT INTO "anivia"."system_dict_data" VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '停用状态');
INSERT INTO "anivia"."system_dict_data" VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '默认分组');
INSERT INTO "anivia"."system_dict_data" VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统分组');
INSERT INTO "anivia"."system_dict_data" VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统默认是');
INSERT INTO "anivia"."system_dict_data" VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统默认否');
INSERT INTO "anivia"."system_dict_data" VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '通知');
INSERT INTO "anivia"."system_dict_data" VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '公告');
INSERT INTO "anivia"."system_dict_data" VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '正常状态');
INSERT INTO "anivia"."system_dict_data" VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '关闭状态');
INSERT INTO "anivia"."system_dict_data" VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '其他操作');
INSERT INTO "anivia"."system_dict_data" VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '新增操作');
INSERT INTO "anivia"."system_dict_data" VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '修改操作');
INSERT INTO "anivia"."system_dict_data" VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '删除操作');
INSERT INTO "anivia"."system_dict_data" VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '授权操作');
INSERT INTO "anivia"."system_dict_data" VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '导出操作');
INSERT INTO "anivia"."system_dict_data" VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '导入操作');
INSERT INTO "anivia"."system_dict_data" VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '强退操作');
INSERT INTO "anivia"."system_dict_data" VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '生成操作');
INSERT INTO "anivia"."system_dict_data" VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '清空操作');
INSERT INTO "anivia"."system_dict_data" VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '正常状态');
INSERT INTO "anivia"."system_dict_data" VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '停用状态');
INSERT INTO "anivia"."system_dict_data" VALUES (30, 0, 'Web', '0', 'auth_app_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-31 14:27:22', 'admin', '2024-08-31 14:27:31', NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (31, 1, 'App', '1', 'auth_app_type', NULL, 'info', 'N', '0', 'admin', '2024-08-31 14:27:47', '', NULL, NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (32, 2, '小程序', '2', 'auth_app_type', NULL, 'warning', 'N', '0', 'admin', '2024-08-31 14:28:06', '', NULL, NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (33, 1, '有效', '1', 'sys_valid', NULL, 'success', 'N', '0', 'admin', '2024-08-31 15:33:49', 'admin', '2024-08-31 15:34:08', NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (34, 0, '无效', '0', 'sys_valid', NULL, 'danger', 'N', '0', 'admin', '2024-08-31 15:34:21', '', NULL, NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (35, 0, '非公开', '0', 'auth_public', NULL, 'warning', 'N', '0', 'admin', '2024-08-31 15:36:48', '', NULL, NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (36, 1, '公开', '1', 'auth_public', NULL, 'success', 'N', '0', 'admin', '2024-08-31 15:36:59', '', NULL, NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (37, 0, '通知', '0', 'message_category', NULL, 'success', 'N', '0', 'admin', '2024-11-07 14:28:29', 'admin', '2024-11-19 16:55:20', NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (38, 0, '重要', '0', 'message_level', NULL, 'default', 'N', '0', 'admin', '2024-11-07 14:28:42', '', NULL, NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (39, 2, '审批', '2', 'message_category', NULL, 'warning', 'N', '0', 'admin', '2024-11-19 14:20:42', 'admin', '2024-11-19 16:55:16', NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (41, 3, '其他', '3', 'message_category', NULL, 'info', 'N', '0', 'admin', '2024-11-19 14:21:12', 'admin', '2024-11-19 14:21:27', NULL);
INSERT INTO "anivia"."system_dict_data" VALUES (42, 1, '公告', '1', 'message_category', NULL, 'primary', 'N', '0', 'admin', '2024-11-19 16:54:18', 'admin', '2024-11-19 16:55:05', NULL);

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_dict_type";
CREATE TABLE "anivia"."system_dict_type" (
  "dict_id" int8 NOT NULL DEFAULT nextval('"anivia".system_dict_type_dict_id_seq'::regclass),
  "dict_name" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "dict_type" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."system_dict_type"."dict_id" IS '字典主键';
COMMENT ON COLUMN "anivia"."system_dict_type"."dict_name" IS '字典名称';
COMMENT ON COLUMN "anivia"."system_dict_type"."dict_type" IS '字典类型';
COMMENT ON COLUMN "anivia"."system_dict_type"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "anivia"."system_dict_type"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_dict_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_dict_type"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_dict_type"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_dict_type"."remark" IS '备注';
COMMENT ON TABLE "anivia"."system_dict_type" IS '字典类型表';

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
INSERT INTO "anivia"."system_dict_type" VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-06 06:12:18', 'admin', '2024-11-26 15:51:04', '用户性别列表');
INSERT INTO "anivia"."system_dict_type" VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '菜单状态列表');
INSERT INTO "anivia"."system_dict_type" VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统开关列表');
INSERT INTO "anivia"."system_dict_type" VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '任务状态列表');
INSERT INTO "anivia"."system_dict_type" VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '任务分组列表');
INSERT INTO "anivia"."system_dict_type" VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '系统是否列表');
INSERT INTO "anivia"."system_dict_type" VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '通知类型列表');
INSERT INTO "anivia"."system_dict_type" VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '通知状态列表');
INSERT INTO "anivia"."system_dict_type" VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '操作类型列表');
INSERT INTO "anivia"."system_dict_type" VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '登录状态列表');
INSERT INTO "anivia"."system_dict_type" VALUES (11, '应用类型', 'auth_app_type', '0', 'admin', '2024-08-31 14:27:03', '', NULL, '应用类型列表');
INSERT INTO "anivia"."system_dict_type" VALUES (12, '是否有效', 'sys_valid', '0', 'admin', '2024-08-31 15:33:08', 'admin', '2024-08-31 15:36:13', '系统有效列表');
INSERT INTO "anivia"."system_dict_type" VALUES (13, '是否公开', 'auth_public', '0', 'admin', '2024-08-31 15:35:49', 'admin', '2024-08-31 15:36:00', '应用是否公开');
INSERT INTO "anivia"."system_dict_type" VALUES (14, '消息类型', 'message_category', '0', 'admin', '2024-11-07 14:27:58', '', NULL, NULL);
INSERT INTO "anivia"."system_dict_type" VALUES (15, '消息等级', 'message_level', '0', 'admin', '2024-11-07 14:28:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_job";
CREATE TABLE "anivia"."system_job" (
  "job_id" int8 NOT NULL DEFAULT nextval('"anivia".system_job_job_id_seq'::regclass),
  "job_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::varchar,
  "job_group" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'DEFAULT'::varchar,
  "invoke_target" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "cron_expression" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "misfire_policy" varchar(20) COLLATE "pg_catalog"."default" DEFAULT '3'::varchar,
  "concurrent" char(1) COLLATE "pg_catalog"."default" DEFAULT '1'::bpchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar
)
;
COMMENT ON COLUMN "anivia"."system_job"."job_id" IS '任务ID';
COMMENT ON COLUMN "anivia"."system_job"."job_name" IS '任务名称';
COMMENT ON COLUMN "anivia"."system_job"."job_group" IS '任务组名';
COMMENT ON COLUMN "anivia"."system_job"."invoke_target" IS '调用目标字符串';
COMMENT ON COLUMN "anivia"."system_job"."cron_expression" IS 'cron执行表达式';
COMMENT ON COLUMN "anivia"."system_job"."misfire_policy" IS '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';
COMMENT ON COLUMN "anivia"."system_job"."concurrent" IS '是否并发执行（0允许 1禁止）';
COMMENT ON COLUMN "anivia"."system_job"."status" IS '状态（0正常 1暂停）';
COMMENT ON COLUMN "anivia"."system_job"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_job"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_job"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_job"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_job"."remark" IS '备注信息';
COMMENT ON TABLE "anivia"."system_job" IS '定时任务调度表';

-- ----------------------------
-- Records of system_job
-- ----------------------------

-- ----------------------------
-- Table structure for system_job_log
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_job_log";
CREATE TABLE "anivia"."system_job_log" (
  "job_log_id" int8 NOT NULL DEFAULT nextval('"anivia".system_job_log_job_log_id_seq'::regclass),
  "job_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "job_group" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "invoke_target" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "job_message" varchar(500) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "exception_info" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime"
)
;
COMMENT ON COLUMN "anivia"."system_job_log"."job_log_id" IS '任务日志ID';
COMMENT ON COLUMN "anivia"."system_job_log"."job_name" IS '任务名称';
COMMENT ON COLUMN "anivia"."system_job_log"."job_group" IS '任务组名';
COMMENT ON COLUMN "anivia"."system_job_log"."invoke_target" IS '调用目标字符串';
COMMENT ON COLUMN "anivia"."system_job_log"."job_message" IS '日志信息';
COMMENT ON COLUMN "anivia"."system_job_log"."status" IS '执行状态（0正常 1失败）';
COMMENT ON COLUMN "anivia"."system_job_log"."exception_info" IS '异常信息';
COMMENT ON COLUMN "anivia"."system_job_log"."create_time" IS '创建时间';
COMMENT ON TABLE "anivia"."system_job_log" IS '定时任务调度日志表';

-- ----------------------------
-- Records of system_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_logininfor
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_logininfor";
CREATE TABLE "anivia"."system_logininfor" (
  "info_id" int8 NOT NULL DEFAULT nextval('"anivia".system_logininfor_info_id_seq'::regclass),
  "user_name" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "ipaddr" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "login_location" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "browser" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "os" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "msg" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "login_time" "pg_catalog"."datetime"
)
;
COMMENT ON COLUMN "anivia"."system_logininfor"."info_id" IS '访问ID';
COMMENT ON COLUMN "anivia"."system_logininfor"."user_name" IS '用户账号';
COMMENT ON COLUMN "anivia"."system_logininfor"."ipaddr" IS '登录IP地址';
COMMENT ON COLUMN "anivia"."system_logininfor"."login_location" IS '登录地点';
COMMENT ON COLUMN "anivia"."system_logininfor"."browser" IS '浏览器类型';
COMMENT ON COLUMN "anivia"."system_logininfor"."os" IS '操作系统';
COMMENT ON COLUMN "anivia"."system_logininfor"."status" IS '登录状态（0成功 1失败）';
COMMENT ON COLUMN "anivia"."system_logininfor"."msg" IS '提示消息';
COMMENT ON COLUMN "anivia"."system_logininfor"."login_time" IS '访问时间';
COMMENT ON TABLE "anivia"."system_logininfor" IS '系统访问记录';

-- ----------------------------
-- Records of system_logininfor
-- ----------------------------
INSERT INTO "anivia"."system_logininfor" VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 16:17:17');
INSERT INTO "anivia"."system_logininfor" VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2024-11-26 16:17:39');
INSERT INTO "anivia"."system_logininfor" VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 16:17:44');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_menu";
CREATE TABLE "anivia"."system_menu" (
  "menu_id" int8 NOT NULL DEFAULT nextval('"anivia".system_menu_menu_id_seq'::regclass),
  "menu_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int8 DEFAULT 0,
  "order_num" int4 DEFAULT 0,
  "path" varchar(200) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "component" varchar(50) COLLATE "pg_catalog"."default",
  "query" varchar(255) COLLATE "pg_catalog"."default",
  "is_frame" int4 DEFAULT 1,
  "is_cache" int4 DEFAULT 0,
  "route_name" varchar(255) COLLATE "pg_catalog"."default",
  "menu_type" char(1) COLLATE "pg_catalog"."default" DEFAULT NULL::bpchar,
  "visible" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "perms" varchar(100) COLLATE "pg_catalog"."default",
  "icon" varchar(100) COLLATE "pg_catalog"."default" DEFAULT '#'::varchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar
)
;
COMMENT ON COLUMN "anivia"."system_menu"."menu_id" IS '菜单ID';
COMMENT ON COLUMN "anivia"."system_menu"."menu_name" IS '菜单名称';
COMMENT ON COLUMN "anivia"."system_menu"."parent_id" IS '父菜单ID';
COMMENT ON COLUMN "anivia"."system_menu"."order_num" IS '显示顺序';
COMMENT ON COLUMN "anivia"."system_menu"."path" IS '路由地址';
COMMENT ON COLUMN "anivia"."system_menu"."component" IS '组件路径';
COMMENT ON COLUMN "anivia"."system_menu"."query" IS '路由参数';
COMMENT ON COLUMN "anivia"."system_menu"."is_frame" IS '是否为外链（0是 1否）';
COMMENT ON COLUMN "anivia"."system_menu"."is_cache" IS '是否缓存（0缓存 1不缓存）';
COMMENT ON COLUMN "anivia"."system_menu"."route_name" IS '路由名称';
COMMENT ON COLUMN "anivia"."system_menu"."menu_type" IS '菜单类型（M目录 C菜单 F按钮）';
COMMENT ON COLUMN "anivia"."system_menu"."visible" IS '菜单状态（0显示 1隐藏）';
COMMENT ON COLUMN "anivia"."system_menu"."status" IS '菜单状态（0正常 1停用）';
COMMENT ON COLUMN "anivia"."system_menu"."perms" IS '权限标识';
COMMENT ON COLUMN "anivia"."system_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "anivia"."system_menu"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_menu"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_menu"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_menu"."remark" IS '备注';
COMMENT ON TABLE "anivia"."system_menu" IS '菜单权限表';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO "anivia"."system_menu" VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, NULL, 'M', '0', '0', '', 'system', 'admin', '2024-05-06 06:12:17', '', NULL, '系统管理目录');
INSERT INTO "anivia"."system_menu" VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, NULL, 'M', '0', '0', '', 'monitor', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:49:38', '系统监控目录');
INSERT INTO "anivia"."system_menu" VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, NULL, 'M', '0', '0', '', 'tool', 'admin', '2024-05-06 06:12:17', '', NULL, '系统工具目录');
INSERT INTO "anivia"."system_menu" VALUES (100, '用户管理', 1, 1, 'user', 'system/system/user/index', '', 1, 0, NULL, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-06 06:12:17', 'admin', '2024-10-14 16:18:24', '用户管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (101, '角色管理', 1, 2, 'role', 'system/system/role/index', '', 1, 0, NULL, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-06 06:12:17', '', NULL, '角色管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (102, '菜单管理', 1, 3, 'menu', 'system/system/menu/index', '', 1, 0, NULL, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-06 06:12:17', '', NULL, '菜单管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (103, '部门管理', 1, 4, 'dept', 'system/system/dept/index', '', 1, 0, NULL, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-06 06:12:17', '', NULL, '部门管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (104, '岗位管理', 1, 5, 'post', 'system/system/post/index', '', 1, 0, NULL, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-06 06:12:17', '', NULL, '岗位管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (105, '字典管理', 1, 6, 'dict', 'system/system/dict/index', '', 1, 0, NULL, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-06 06:12:17', '', NULL, '字典管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (106, '参数设置', 1, 7, 'config', 'system/system/config/index', '', 1, 0, NULL, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-05-06 06:12:17', '', NULL, '参数设置菜单');
INSERT INTO "anivia"."system_menu" VALUES (107, '通知公告', 1, 8, 'notice', 'system/system/notice/index', '', 1, 0, NULL, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-06 06:12:17', '', NULL, '通知公告菜单');
INSERT INTO "anivia"."system_menu" VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, NULL, 'M', '0', '0', '', 'log', 'admin', '2024-05-06 06:12:17', '', NULL, '日志管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (109, '在线用户', 2, 1, 'online', 'system/monitor/online/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-06 06:12:17', '', NULL, '在线用户菜单');
INSERT INTO "anivia"."system_menu" VALUES (110, '定时任务', 2, 2, 'job', 'system/monitor/job/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-06 06:12:17', '', NULL, '定时任务菜单');
INSERT INTO "anivia"."system_menu" VALUES (111, '数据监控', 2, 3, 'druid', 'system/monitor/druid/index', '', 1, 0, NULL, 'C', '1', '1', 'monitor:druid:list', 'druid', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 14:06:21', '数据监控菜单');
INSERT INTO "anivia"."system_menu" VALUES (112, '服务监控', 2, 4, 'server', 'system/monitor/server/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-06 06:12:17', '', NULL, '服务监控菜单');
INSERT INTO "anivia"."system_menu" VALUES (113, '缓存监控', 2, 5, 'cache', 'system/monitor/cache/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-06 06:12:17', '', NULL, '缓存监控菜单');
INSERT INTO "anivia"."system_menu" VALUES (114, '缓存列表', 2, 6, 'cacheList', 'system/monitor/cache/list', '', 1, 0, NULL, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-06 06:12:17', '', NULL, '缓存列表菜单');
INSERT INTO "anivia"."system_menu" VALUES (115, '表单构建', 3, 1, 'build', 'system/tool/build/index', '', 1, 0, NULL, 'C', '1', '1', 'tool:build:list', 'build', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-19 14:05:59', '表单构建菜单');
INSERT INTO "anivia"."system_menu" VALUES (116, '代码生成', 3, 2, 'gen', 'system/tool/gen/index', '', 1, 0, NULL, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-06 06:12:17', '', NULL, '代码生成菜单');
INSERT INTO "anivia"."system_menu" VALUES (117, '系统接口', 3, 3, 'swagger', 'system/tool/swagger/index', '', 1, 0, NULL, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-06 06:12:17', '', NULL, '系统接口菜单');
INSERT INTO "anivia"."system_menu" VALUES (500, '操作日志', 108, 1, 'operlog', 'system/monitor/operlog/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-05-06 06:12:17', '', NULL, '操作日志菜单');
INSERT INTO "anivia"."system_menu" VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/monitor/logininfor/index', '', 1, 0, NULL, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-05-06 06:12:17', '', NULL, '登录日志菜单');
INSERT INTO "anivia"."system_menu" VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, NULL, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, NULL, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2000, '流程管理', 0, 2, 'flyflow', NULL, NULL, 1, 0, NULL, 'M', '0', '0', '', 'example', 'admin', '2024-05-06 06:17:26', 'admin', '2024-10-22 15:12:05', '');
INSERT INTO "anivia"."system_menu" VALUES (2001, '流程组', 2002, 1, 'group', 'flyflow/flow/group', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:flow:group', 'button', 'admin', '2024-05-06 08:28:25', 'admin', '2024-05-06 12:03:39', '');
INSERT INTO "anivia"."system_menu" VALUES (2002, '流程', 2000, 1, 'flow', NULL, NULL, 1, 0, NULL, 'M', '0', '0', '', 'component', 'admin', '2024-05-06 08:29:31', 'admin', '2024-05-06 11:59:48', '');
INSERT INTO "anivia"."system_menu" VALUES (2003, '流程列表', 2002, 2, 'list', 'flyflow/flow/list', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:flow:list', 'date', 'admin', '2024-05-06 08:34:14', 'admin', '2024-05-06 13:25:03', '');
INSERT INTO "anivia"."system_menu" VALUES (2004, '创建流程', 2002, 1, 'create', 'flyflow/flow/create', NULL, 1, 1, NULL, 'C', '1', '0', 'flyflow:flow:create', 'component', 'admin', '2024-05-06 12:56:35', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2005, '任务管理', 2000, 3, 'task', NULL, NULL, 1, 0, NULL, 'M', '0', '0', NULL, 'date', 'admin', '2024-05-06 13:29:59', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2006, '待办任务', 2005, 1, 'todo', 'flyflow/task/pending', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:pending', 'date', 'admin', '2024-05-06 13:30:36', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2007, '我的发起', 2005, 2, 'started', 'flyflow/task/started', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:started', 'button', 'admin', '2024-05-06 13:32:07', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2008, '我的已办', 2005, 3, 'completed', 'flyflow/task/completed', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:completed', 'download', 'admin', '2024-05-06 13:33:44', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2009, '抄送我的', 2005, 4, 'cc', 'flyflow/task/cc', NULL, 1, 1, NULL, 'C', '0', '0', 'flyflow:task:cc', 'example', 'admin', '2024-05-06 13:35:08', 'admin', '2024-05-06 13:35:51', '');
INSERT INTO "anivia"."system_menu" VALUES (2010, '数字证书', 1, 10, 'ca', NULL, NULL, 1, 0, '', 'M', '0', '0', '', 'password', 'admin', NULL, 'admin', '2024-11-06 15:28:06', '');
INSERT INTO "anivia"."system_menu" VALUES (2011, '证书管理', 2010, 1, 'cert', 'system/ca/cert/index', NULL, 1, 0, '', 'C', '0', '0', 'ca:cert:list', '#', 'admin', '2024-08-18 01:49:14', '', NULL, '证书管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (2012, '证书管理查询', 2010, 1, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:query', '#', 'admin', '2024-08-18 01:49:14', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2013, '证书管理新增', 2010, 2, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:add', '#', 'admin', '2024-08-18 01:49:14', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2014, '证书管理修改', 2010, 3, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:edit', '#', 'admin', '2024-08-18 01:49:15', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2015, '证书管理删除', 2010, 4, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:remove', '#', 'admin', '2024-08-18 01:49:15', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2016, '证书管理导出', 2010, 5, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:cert:export', '#', 'admin', '2024-08-18 01:49:15', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2017, '主体管理', 2010, 0, 'subject', 'system/ca/subject/index', NULL, 1, 0, '', 'C', '0', '0', 'ca:subject:list', '#', 'admin', '2024-08-18 01:49:32', 'admin', '2024-08-18 01:49:49', '主体管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (2018, '主体管理查询', 2017, 1, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:query', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2019, '主体管理新增', 2017, 2, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:add', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2020, '主体管理修改', 2017, 3, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:edit', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2021, '主体管理删除', 2017, 4, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:remove', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2022, '主体管理导出', 2017, 5, '#', '', NULL, 1, 0, '', 'F', '0', '0', 'ca:subject:export', '#', 'admin', '2024-08-18 01:49:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2023, '实例演示', 0, 4, 'example', NULL, NULL, 1, 0, '', 'M', '0', '0', NULL, 'code', 'admin', '2024-08-20 22:54:16', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2024, 'websocket', 2023, 0, 'websocket', 'example/websocket', NULL, 1, 0, '', 'C', '0', '0', '', '', 'admin', '2024-08-20 22:57:35', 'admin', '2024-08-20 22:58:19', '');
INSERT INTO "anivia"."system_menu" VALUES (2025, '支付演示', 2023, 1, 'pay', 'example/pay', NULL, 1, 0, 'pay', 'C', '0', '0', NULL, '', 'admin', '2024-08-25 16:33:48', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2026, '应用管理', 1, 1, 'client', 'system/auth/client/index', NULL, 1, 0, NULL, 'C', '0', '0', 'auth:client:list', 'github', 'admin', '2024-08-31 14:33:05', 'admin', '2024-11-19 14:23:32', '应用管理菜单');
INSERT INTO "anivia"."system_menu" VALUES (2027, '应用管理查询', 2026, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:query', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2028, '应用管理新增', 2026, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:add', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2029, '应用管理修改', 2026, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:edit', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2030, '应用管理删除', 2026, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:remove', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2031, '应用管理导出', 2026, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'auth:client:export', '#', 'admin', '2024-08-31 14:33:05', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2050, '示例用户', 2023, 1, 'user1', 'example/user/user/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:user:user:list', '#', 'admin', '2024-10-23 15:47:09', 'admin', '2024-10-24 10:03:37', '示例用户菜单');
INSERT INTO "anivia"."system_menu" VALUES (2051, '示例用户查询', 2050, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:query', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2052, '示例用户新增', 2050, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:add', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2053, '示例用户修改', 2050, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:edit', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2054, '示例用户删除', 2050, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:remove', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2055, '示例用户导出', 2050, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:user:export', '#', 'admin', '2024-10-23 15:47:09', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2056, '用户类型', 2023, 1, 'type', 'example/user/type/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:user:type:list', '#', 'admin', '2024-10-23 15:52:47', '', NULL, '用户类型菜单');
INSERT INTO "anivia"."system_menu" VALUES (2057, '用户类型查询', 2056, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:type:query', '#', 'admin', '2024-10-23 15:52:47', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2058, '用户类型新增', 2056, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:type:add', '#', 'admin', '2024-10-23 15:52:47', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2059, '用户类型修改', 2056, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:type:edit', '#', 'admin', '2024-10-23 15:52:47', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2060, '用户类型删除', 2056, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:type:remove', '#', 'admin', '2024-10-23 15:52:48', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2061, '用户类型导出', 2056, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:user:type:export', '#', 'admin', '2024-10-23 15:52:48', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2062, '消息', 1, 1, 'message', 'system/message/message/index', NULL, 1, 0, NULL, 'C', '0', '1', 'system:message:message:list', '#', 'admin', '2024-11-01 09:51:29', 'admin', '2024-11-01 09:52:41', '消息菜单');
INSERT INTO "anivia"."system_menu" VALUES (2063, '消息查询', 2062, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:query', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2064, '消息新增', 2062, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:add', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2065, '消息修改', 2062, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:edit', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2066, '消息删除', 2062, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:remove', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2067, '消息导出', 2062, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:message:export', '#', 'admin', '2024-11-01 09:51:29', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2068, '消息模板', 1, 0, 'messageTemplate', 'system/system/messageTemplate/index', NULL, 1, 0, NULL, 'C', '0', '0', 'system:message:messageTemplate:list', 'email', 'admin', '2024-11-01 09:52:03', 'admin', '2024-11-19 14:23:11', '消息模板菜单');
INSERT INTO "anivia"."system_menu" VALUES (2069, '消息模板查询', 2068, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:query', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2070, '消息模板新增', 2068, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:add', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2071, '消息模板修改', 2068, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:edit', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2072, '消息模板删除', 2068, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:remove', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2073, '消息模板导出', 2068, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'system:message:messageTemplate:export', '#', 'admin', '2024-11-01 09:52:03', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2075, '组件测试', 2023, 8, 'comCeshi', 'example/coms', NULL, 1, 0, 'comCeshi', 'C', '0', '0', NULL, '#', 'admin', '2024-11-07 11:34:00', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2076, '单选多选', 2023, 4, 'choose', 'system/tool/choose/index', NULL, 1, 0, '', 'C', '0', '0', '', '#', 'admin', '2024-11-26 10:11:59', 'admin', '2024-11-26 11:50:33', '');
INSERT INTO "anivia"."system_menu" VALUES (2077, '生产领料记录', 2023, 1, 'proTaskReceive', 'example/taskReceive/index', NULL, 1, 0, NULL, 'C', '0', '0', 'example:taskReceive:list', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '生产领料记录菜单');
INSERT INTO "anivia"."system_menu" VALUES (2078, '生产领料记录查询', 2077, 1, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:query', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2079, '生产领料记录新增', 2077, 2, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:add', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2080, '生产领料记录修改', 2077, 3, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:edit', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2081, '生产领料记录删除', 2077, 4, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:remove', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2082, '生产领料记录导出', 2077, 5, '#', '', NULL, 1, 0, NULL, 'F', '0', '0', 'example:taskReceive:export', '#', 'admin', '2024-11-26 11:22:32', '', NULL, '');
INSERT INTO "anivia"."system_menu" VALUES (2083, '代码生成模版', 2023, 5, 'genTemplate', 'example/gen/index', NULL, 1, 0, NULL, 'C', '0', '0', '', '#', 'admin', '2024-11-26 13:41:33', 'admin', '2024-11-26 15:04:16', '');

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_notice";
CREATE TABLE "anivia"."system_notice" (
  "notice_id" int4 NOT NULL DEFAULT nextval('"anivia".system_notice_notice_id_seq'::regclass),
  "notice_title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "notice_type" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "notice_content" "pg_catalog"."blob",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."system_notice"."notice_id" IS '公告ID';
COMMENT ON COLUMN "anivia"."system_notice"."notice_title" IS '公告标题';
COMMENT ON COLUMN "anivia"."system_notice"."notice_type" IS '公告类型（1通知 2公告）';
COMMENT ON COLUMN "anivia"."system_notice"."notice_content" IS '公告内容';
COMMENT ON COLUMN "anivia"."system_notice"."status" IS '公告状态（0正常 1关闭）';
COMMENT ON COLUMN "anivia"."system_notice"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_notice"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_notice"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_notice"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_notice"."remark" IS '备注';
COMMENT ON TABLE "anivia"."system_notice" IS '通知公告表';

-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO "anivia"."system_notice" VALUES (1, '温馨提醒：2018-07-01 冰风框架新版本发布啦', '2', E'<p>\\346\\226\\260\\347\\211\\210\\346\\234\\254\\345\\206\\205\\345\\256\\271</p>', '0', 'admin', '2024-05-06 06:12:18', 'admin', '2024-11-26 15:51:37', '管理员');
INSERT INTO "anivia"."system_notice" VALUES (2, '维护通知：2018-07-01 冰风框架系统凌晨维护', '1', E'\\347\\273\\264\\346\\212\\244\\345\\206\\205\\345\\256\\271', '0', 'admin', '2024-05-06 06:12:18', '', NULL, '管理员');

-- ----------------------------
-- Table structure for system_oper_log
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_oper_log";
CREATE TABLE "anivia"."system_oper_log" (
  "oper_id" int8 NOT NULL DEFAULT nextval('"anivia".system_oper_log_oper_id_seq'::regclass),
  "title" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "business_type" int4 DEFAULT 0,
  "method" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "request_method" varchar(10) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "operator_type" int4 DEFAULT 0,
  "oper_name" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "dept_name" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "oper_url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "oper_ip" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "oper_location" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "oper_param" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "json_result" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "status" int4 DEFAULT 0,
  "error_msg" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "oper_time" "pg_catalog"."datetime",
  "cost_time" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "anivia"."system_oper_log"."oper_id" IS '日志主键';
COMMENT ON COLUMN "anivia"."system_oper_log"."title" IS '模块标题';
COMMENT ON COLUMN "anivia"."system_oper_log"."business_type" IS '业务类型（0其它 1新增 2修改 3删除）';
COMMENT ON COLUMN "anivia"."system_oper_log"."method" IS '方法名称';
COMMENT ON COLUMN "anivia"."system_oper_log"."request_method" IS '请求方式';
COMMENT ON COLUMN "anivia"."system_oper_log"."operator_type" IS '操作类别（0其它 1后台用户 2手机端用户）';
COMMENT ON COLUMN "anivia"."system_oper_log"."oper_name" IS '操作人员';
COMMENT ON COLUMN "anivia"."system_oper_log"."dept_name" IS '部门名称';
COMMENT ON COLUMN "anivia"."system_oper_log"."oper_url" IS '请求URL';
COMMENT ON COLUMN "anivia"."system_oper_log"."oper_ip" IS '主机地址';
COMMENT ON COLUMN "anivia"."system_oper_log"."oper_location" IS '操作地点';
COMMENT ON COLUMN "anivia"."system_oper_log"."oper_param" IS '请求参数';
COMMENT ON COLUMN "anivia"."system_oper_log"."json_result" IS '返回参数';
COMMENT ON COLUMN "anivia"."system_oper_log"."status" IS '操作状态（0正常 1异常）';
COMMENT ON COLUMN "anivia"."system_oper_log"."error_msg" IS '错误消息';
COMMENT ON COLUMN "anivia"."system_oper_log"."oper_time" IS '操作时间';
COMMENT ON COLUMN "anivia"."system_oper_log"."cost_time" IS '消耗时间';
COMMENT ON TABLE "anivia"."system_oper_log" IS '操作日志记录';

-- ----------------------------
-- Records of system_oper_log
-- ----------------------------
INSERT INTO "anivia"."system_oper_log" VALUES (9, '操作日志', 9, 'monitor.admin.controller.system.tech.qiantong.qmodel.module.SysOperlogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{"msg":"操作成功","code":200}', 0, NULL, '2024-11-26 16:43:47', 53);
INSERT INTO "anivia"."system_oper_log" VALUES (10, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{"tables":"system_oper_log"}', '{"msg":"操作成功","code":200}', 0, NULL, '2024-11-26 17:12:36', 111);
INSERT INTO "anivia"."system_oper_log" VALUES (11, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/29', '127.0.0.1', '内网IP', '{}', '{"msg":"操作成功","code":200}', 0, NULL, '2024-11-26 17:13:00', 18);
INSERT INTO "anivia"."system_oper_log" VALUES (12, '代码生成', 6, 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{"tables":"system_role_menu"}', '{"msg":"操作成功","code":200}', 0, NULL, '2024-11-26 17:13:05', 26);
INSERT INTO "anivia"."system_oper_log" VALUES (13, '代码生成', 3, 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/30', '127.0.0.1', '内网IP', '{}', '{"msg":"操作成功","code":200}', 0, NULL, '2024-11-26 17:13:14', 10);

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_post";
CREATE TABLE "anivia"."system_post" (
  "post_id" int8 NOT NULL DEFAULT nextval('"anivia".system_post_post_id_seq'::regclass),
  "post_code" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "post_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "post_sort" int4 NOT NULL,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."system_post"."post_id" IS '岗位ID';
COMMENT ON COLUMN "anivia"."system_post"."post_code" IS '岗位编码';
COMMENT ON COLUMN "anivia"."system_post"."post_name" IS '岗位名称';
COMMENT ON COLUMN "anivia"."system_post"."post_sort" IS '显示顺序';
COMMENT ON COLUMN "anivia"."system_post"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "anivia"."system_post"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_post"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_post"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_post"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_post"."remark" IS '备注';
COMMENT ON TABLE "anivia"."system_post" IS '岗位信息表';

-- ----------------------------
-- Records of system_post
-- ----------------------------
INSERT INTO "anivia"."system_post" VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_post" VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-06 06:12:17', '', NULL, '');
INSERT INTO "anivia"."system_post" VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:50:39', '');
INSERT INTO "anivia"."system_post" VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-06 06:12:17', '', NULL, '');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_role";
CREATE TABLE "anivia"."system_role" (
  "role_id" int8 NOT NULL DEFAULT nextval('"anivia".system_role_role_id_seq'::regclass),
  "role_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "role_key" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "role_sort" int4 NOT NULL,
  "data_scope" char(1) COLLATE "pg_catalog"."default" DEFAULT '1'::bpchar,
  "menu_check_strictly" tinyint DEFAULT 1,
  "dept_check_strictly" tinyint DEFAULT 1,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."system_role"."role_id" IS '角色ID';
COMMENT ON COLUMN "anivia"."system_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "anivia"."system_role"."role_key" IS '角色权限字符串';
COMMENT ON COLUMN "anivia"."system_role"."role_sort" IS '显示顺序';
COMMENT ON COLUMN "anivia"."system_role"."data_scope" IS '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';
COMMENT ON COLUMN "anivia"."system_role"."menu_check_strictly" IS '菜单树选择项是否关联显示';
COMMENT ON COLUMN "anivia"."system_role"."dept_check_strictly" IS '部门树选择项是否关联显示';
COMMENT ON COLUMN "anivia"."system_role"."status" IS '角色状态（0正常 1停用）';
COMMENT ON COLUMN "anivia"."system_role"."del_flag" IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN "anivia"."system_role"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_role"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_role"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_role"."remark" IS '备注';
COMMENT ON TABLE "anivia"."system_role" IS '角色信息表';

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO "anivia"."system_role" VALUES (1, '超级管理员', 'admin', 1, '1', '1', '1', '0', '0', 'admin', '2024-05-06 06:12:17', '', NULL, '超级管理员');
INSERT INTO "anivia"."system_role" VALUES (2, '普通角色', 'common', 2, '2', '0', '0', '0', '0', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:49:20', '普通角色');

-- ----------------------------
-- Table structure for system_role_dept
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_role_dept";
CREATE TABLE "anivia"."system_role_dept" (
  "role_id" int8 NOT NULL,
  "dept_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "anivia"."system_role_dept"."role_id" IS '角色ID';
COMMENT ON COLUMN "anivia"."system_role_dept"."dept_id" IS '部门ID';
COMMENT ON TABLE "anivia"."system_role_dept" IS '角色和部门关联表';

-- ----------------------------
-- Records of system_role_dept
-- ----------------------------
INSERT INTO "anivia"."system_role_dept" VALUES (2, 100);
INSERT INTO "anivia"."system_role_dept" VALUES (2, 101);
INSERT INTO "anivia"."system_role_dept" VALUES (2, 105);

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_role_menu";
CREATE TABLE "anivia"."system_role_menu" (
  "role_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "anivia"."system_role_menu"."role_id" IS '角色ID';
COMMENT ON COLUMN "anivia"."system_role_menu"."menu_id" IS '菜单ID';
COMMENT ON TABLE "anivia"."system_role_menu" IS '角色和菜单关联表';

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 3);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 100);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 101);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 102);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 103);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 104);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 105);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 106);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 107);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 108);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 109);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 110);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 111);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 112);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 113);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 114);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 115);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 116);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 117);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 500);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 501);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1000);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1001);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1002);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1003);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1004);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1005);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1006);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1007);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1008);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1009);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1010);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1011);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1012);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1013);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1014);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1015);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1016);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1017);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1018);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1019);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1020);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1021);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1022);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1023);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1024);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1025);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1026);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1027);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1028);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1029);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1030);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1031);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1032);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1033);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1034);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1035);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1036);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1037);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1038);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1039);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1040);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1041);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1042);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1043);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1044);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1045);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1046);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1047);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1048);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1049);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1050);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1051);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1052);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1053);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1054);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1055);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1056);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1057);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1058);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1059);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 1060);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2000);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2001);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2002);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2003);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2004);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2005);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2006);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2007);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2008);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2009);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2010);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2011);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2012);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2013);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2014);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2015);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2016);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2017);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2022);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2023);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2024);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2025);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2026);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2027);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2028);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2029);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2030);
INSERT INTO "anivia"."system_role_menu" VALUES (2, 2031);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_user";
CREATE TABLE "anivia"."system_user" (
  "user_id" int8 NOT NULL DEFAULT nextval('"anivia".system_user_user_id_seq'::regclass),
  "dept_id" int8,
  "user_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "nick_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "user_type" varchar(2) COLLATE "pg_catalog"."default" DEFAULT '00'::varchar,
  "email" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "phonenumber" varchar(11) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "sex" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "avatar" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "password" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "login_ip" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "login_date" "pg_catalog"."datetime",
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "create_time" "pg_catalog"."datetime",
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::varchar,
  "update_time" "pg_catalog"."datetime",
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."system_user"."user_id" IS '用户ID';
COMMENT ON COLUMN "anivia"."system_user"."dept_id" IS '部门ID';
COMMENT ON COLUMN "anivia"."system_user"."user_name" IS '用户账号';
COMMENT ON COLUMN "anivia"."system_user"."nick_name" IS '用户昵称';
COMMENT ON COLUMN "anivia"."system_user"."user_type" IS '用户类型（00系统用户）';
COMMENT ON COLUMN "anivia"."system_user"."email" IS '用户邮箱';
COMMENT ON COLUMN "anivia"."system_user"."phonenumber" IS '手机号码';
COMMENT ON COLUMN "anivia"."system_user"."sex" IS '用户性别（0男 1女 2未知）';
COMMENT ON COLUMN "anivia"."system_user"."avatar" IS '头像地址';
COMMENT ON COLUMN "anivia"."system_user"."password" IS '密码';
COMMENT ON COLUMN "anivia"."system_user"."status" IS '帐号状态（0正常 1停用）';
COMMENT ON COLUMN "anivia"."system_user"."del_flag" IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN "anivia"."system_user"."login_ip" IS '最后登录IP';
COMMENT ON COLUMN "anivia"."system_user"."login_date" IS '最后登录时间';
COMMENT ON COLUMN "anivia"."system_user"."create_by" IS '创建者';
COMMENT ON COLUMN "anivia"."system_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."system_user"."update_by" IS '更新者';
COMMENT ON COLUMN "anivia"."system_user"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."system_user"."remark" IS '备注';
COMMENT ON TABLE "anivia"."system_user" IS '用户信息表';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO "anivia"."system_user" VALUES (2, 105, 'bf2', '冰风2', '00', 'bf1@qq.com', '15666666666', '0', NULL, '$2a$10$J7Ymz2DNLfGXnmKHm9RYnOHBTexve38Owo.Tg/D2XbTwAoc0X1f66', '0', '0', '127.0.0.1', '2024-10-30 16:49:04', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-26 15:48:49', '测试员');
INSERT INTO "anivia"."system_user" VALUES (3, 105, 'bf3', '冰风3', '00', 'bf2@qq.com', '15666666667', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-06 06:12:17', 'admin', '2024-05-06 06:12:17', 'admin', '2024-11-12 23:30:18', '测试员');
INSERT INTO "anivia"."system_user" VALUES (4, 105, 'bf4', '冰风4', '00', 'bf3@qq.com', '15666666668', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-06 06:12:17', 'admin', '2024-05-06 06:12:17', '', NULL, '测试员');
INSERT INTO "anivia"."system_user" VALUES (1, 103, 'admin', 'admin', '00', 'bf@163.com', '19951942682', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-11-26 16:17:44', 'admin', '2024-05-06 06:12:17', '', '2024-11-26 16:17:44', '管理员');

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_user_post";
CREATE TABLE "anivia"."system_user_post" (
  "user_id" int8 NOT NULL,
  "post_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "anivia"."system_user_post"."user_id" IS '用户ID';
COMMENT ON COLUMN "anivia"."system_user_post"."post_id" IS '岗位ID';
COMMENT ON TABLE "anivia"."system_user_post" IS '用户与岗位关联表';

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
INSERT INTO "anivia"."system_user_post" VALUES (1, 1);
INSERT INTO "anivia"."system_user_post" VALUES (2, 2);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."system_user_role";
CREATE TABLE "anivia"."system_user_role" (
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "anivia"."system_user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "anivia"."system_user_role"."role_id" IS '角色ID';
COMMENT ON TABLE "anivia"."system_user_role" IS '用户和角色关联表';

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO "anivia"."system_user_role" VALUES (1, 1);
INSERT INTO "anivia"."system_user_role" VALUES (2, 2);

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS "anivia"."user_type";
CREATE TABLE "anivia"."user_type" (
  "id" int4 NOT NULL DEFAULT nextval('"anivia".user_type_id_seq'::regclass),
  "name" varchar(128) COLLATE "pg_catalog"."default",
  "valid_flag" tinyint NOT NULL DEFAULT 1,
  "del_flag" tinyint NOT NULL DEFAULT 0,
  "create_by" varchar(32) COLLATE "pg_catalog"."default",
  "creator_id" int8,
  "create_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(32) COLLATE "pg_catalog"."default",
  "updator_id" int8,
  "update_time" "pg_catalog"."datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "remark" varchar(512) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "anivia"."user_type"."id" IS 'ID';
COMMENT ON COLUMN "anivia"."user_type"."name" IS '类型名称';
COMMENT ON COLUMN "anivia"."user_type"."valid_flag" IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN "anivia"."user_type"."del_flag" IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN "anivia"."user_type"."create_by" IS '创建人';
COMMENT ON COLUMN "anivia"."user_type"."creator_id" IS '创建人id';
COMMENT ON COLUMN "anivia"."user_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "anivia"."user_type"."update_by" IS '更新人';
COMMENT ON COLUMN "anivia"."user_type"."updator_id" IS '更新人id';
COMMENT ON COLUMN "anivia"."user_type"."update_time" IS '更新时间';
COMMENT ON COLUMN "anivia"."user_type"."remark" IS '备注';
COMMENT ON TABLE "anivia"."user_type" IS '用户类型';

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO "anivia"."user_type" VALUES (1, '1', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (2, '2', '1', '0', '若依1', 1, '2024-10-23 15:54:13', NULL, NULL, '2024-10-23 15:54:13', NULL);
INSERT INTO "anivia"."user_type" VALUES (5, '5', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (6, '6', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (7, '7', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (8, '8', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (9, '9', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (10, '10', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (11, '11', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (12, '12', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (13, '13', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (14, '14', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (15, '15', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (16, '16', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (17, '17', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (18, '18', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (19, '19', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (20, '20', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (21, '21', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (22, '22', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (23, '23', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (24, '24', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (25, '25', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (26, '26', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (27, '27', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (28, '28', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (29, '29', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (30, '30', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (31, '31', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (32, '32', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (33, '33', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (34, '34', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (35, '35', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (36, '36', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (37, '375', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 16:15:25', NULL);
INSERT INTO "anivia"."user_type" VALUES (38, '38', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (39, '39', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (40, '40', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (41, '41', '1', '1', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (42, '42', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (43, '43', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (44, '44', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (45, '45', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (46, '46', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (47, '47', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (48, '48', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (49, '49', '1', '0', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (50, '50333', '1', '1', '若依1', 1, '2024-10-23 00:00:00', 'admin', 1, '2024-11-20 18:20:23', NULL);
INSERT INTO "anivia"."user_type" VALUES (51, '513', '1', '1', '若依1', 1, '2024-10-23 00:00:00', 'admin', 1, '2024-11-20 16:43:08', NULL);
INSERT INTO "anivia"."user_type" VALUES (52, '52', '1', '1', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (53, '53', '1', '1', '若依1', 1, '2024-10-23 15:53:58', 'admin', 1, '2024-11-20 15:32:38', NULL);
INSERT INTO "anivia"."user_type" VALUES (54, '2', '1', '1', 'admin', 1, '2024-11-20 00:00:00', 'admin', 1, '2024-11-20 18:36:13', '122112');
INSERT INTO "anivia"."user_type" VALUES (55, '222', '1', '0', 'admin', 1, '2024-11-20 00:00:00', 'admin', 1, '2024-11-20 18:36:09', '212121');
INSERT INTO "anivia"."user_type" VALUES (56, '2123332222', '1', '0', 'admin', 1, '2024-11-20 00:00:00', 'admin', 1, '2024-11-20 18:35:45', NULL);
INSERT INTO "anivia"."user_type" VALUES (57, '243423332', '1', '0', 'admin', 1, '2024-11-20 00:00:00', 'admin', 1, '2024-11-20 18:35:40', NULL);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."auth_client_id_seq"
OWNED BY "anivia"."auth_client"."id";
SELECT setval('"anivia"."auth_client_id_seq"', 39, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."ca_cert_id_seq"
OWNED BY "anivia"."ca_cert"."id";
SELECT setval('"anivia"."ca_cert_id_seq"', 10, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."ca_subject_id_seq"
OWNED BY "anivia"."ca_subject"."id";
SELECT setval('"anivia"."ca_subject_id_seq"', 10, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."example_user_id_seq"
OWNED BY "anivia"."example_user"."id";
SELECT setval('"anivia"."example_user_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."gen_table_column_column_id_seq"
OWNED BY "anivia"."gen_table_column"."column_id";
SELECT setval('"anivia"."gen_table_column_column_id_seq"', 444, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."gen_table_table_id_seq"
OWNED BY "anivia"."gen_table"."table_id";
SELECT setval('"anivia"."gen_table_table_id_seq"', 30, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."message_id_seq"
OWNED BY "anivia"."message"."id";
SELECT setval('"anivia"."message_id_seq"', 15, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."message_template_id_seq"
OWNED BY "anivia"."message_template"."id";
SELECT setval('"anivia"."message_template_id_seq"', 3, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."pro_plan_id_seq"
OWNED BY "anivia"."pro_plan"."id";
SELECT setval('"anivia"."pro_plan_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."pro_task_receive_id_seq"
OWNED BY "anivia"."pro_task_receive"."id";
SELECT setval('"anivia"."pro_task_receive_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_config_config_id_seq"
OWNED BY "anivia"."system_config"."config_id";
SELECT setval('"anivia"."system_config_config_id_seq"', 7, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_dept_dept_id_seq"
OWNED BY "anivia"."system_dept"."dept_id";
SELECT setval('"anivia"."system_dept_dept_id_seq"', 110, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_dict_data_dict_code_seq"
OWNED BY "anivia"."system_dict_data"."dict_code";
SELECT setval('"anivia"."system_dict_data_dict_code_seq"', 43, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_dict_type_dict_id_seq"
OWNED BY "anivia"."system_dict_type"."dict_id";
SELECT setval('"anivia"."system_dict_type_dict_id_seq"', 16, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_job_job_id_seq"
OWNED BY "anivia"."system_job"."job_id";
SELECT setval('"anivia"."system_job_job_id_seq"', 4, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_job_log_job_log_id_seq"
OWNED BY "anivia"."system_job_log"."job_log_id";
SELECT setval('"anivia"."system_job_log_job_log_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_logininfor_info_id_seq"
OWNED BY "anivia"."system_logininfor"."info_id";
SELECT setval('"anivia"."system_logininfor_info_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_menu_menu_id_seq"
OWNED BY "anivia"."system_menu"."menu_id";
SELECT setval('"anivia"."system_menu_menu_id_seq"', 2084, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_notice_notice_id_seq"
OWNED BY "anivia"."system_notice"."notice_id";
SELECT setval('"anivia"."system_notice_notice_id_seq"', 3, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_oper_log_oper_id_seq"
OWNED BY "anivia"."system_oper_log"."oper_id";
SELECT setval('"anivia"."system_oper_log_oper_id_seq"', 13, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_post_post_id_seq"
OWNED BY "anivia"."system_post"."post_id";
SELECT setval('"anivia"."system_post_post_id_seq"', 5, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_role_role_id_seq"
OWNED BY "anivia"."system_role"."role_id";
SELECT setval('"anivia"."system_role_role_id_seq"', 3, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."system_user_user_id_seq"
OWNED BY "anivia"."system_user"."user_id";
SELECT setval('"anivia"."system_user_user_id_seq"', 5, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "anivia"."user_type_id_seq"
OWNED BY "anivia"."user_type"."id";
SELECT setval('"anivia"."user_type_id_seq"', 58, false);

-- ----------------------------
-- Primary Key structure for table auth_client
-- ----------------------------
ALTER TABLE "anivia"."auth_client" ADD CONSTRAINT "PRIMARY_3E2DA63D" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ca_cert
-- ----------------------------
ALTER TABLE "anivia"."ca_cert" ADD CONSTRAINT "PRIMARY_84115B60" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ca_subject
-- ----------------------------
ALTER TABLE "anivia"."ca_subject" ADD CONSTRAINT "PRIMARY_F2355846" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table example_user
-- ----------------------------
ALTER TABLE "anivia"."example_user" ADD CONSTRAINT "PRIMARY_42EC697B" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gen_table
-- ----------------------------
ALTER TABLE "anivia"."gen_table" ADD CONSTRAINT "PRIMARY_E2A7B70B" PRIMARY KEY ("table_id");

-- ----------------------------
-- Primary Key structure for table gen_table_column
-- ----------------------------
ALTER TABLE "anivia"."gen_table_column" ADD CONSTRAINT "PRIMARY_BD14958E" PRIMARY KEY ("column_id");

-- ----------------------------
-- Primary Key structure for table message
-- ----------------------------
ALTER TABLE "anivia"."message" ADD CONSTRAINT "PRIMARY_97469602" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table message_template
-- ----------------------------
ALTER TABLE "anivia"."message_template" ADD CONSTRAINT "PRIMARY_5B1FF5AD" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table pro_plan
-- ----------------------------
ALTER TABLE "anivia"."pro_plan" ADD CONSTRAINT "PRIMARY_EA2D6376" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table pro_task_receive
-- ----------------------------
ALTER TABLE "anivia"."pro_task_receive" ADD CONSTRAINT "PRIMARY_7BD16076" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrtz_blob_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_blob_triggers" ADD CONSTRAINT "PRIMARY_7E3C0400" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_calendars
-- ----------------------------
ALTER TABLE "anivia"."qrtz_calendars" ADD CONSTRAINT "PRIMARY_D280BAA3" PRIMARY KEY ("sched_name", "calendar_name");

-- ----------------------------
-- Primary Key structure for table qrtz_cron_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_cron_triggers" ADD CONSTRAINT "PRIMARY_6F7DA771" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_fired_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_fired_triggers" ADD CONSTRAINT "PRIMARY_467C5086" PRIMARY KEY ("sched_name", "entry_id");

-- ----------------------------
-- Primary Key structure for table qrtz_job_details
-- ----------------------------
ALTER TABLE "anivia"."qrtz_job_details" ADD CONSTRAINT "PRIMARY_43C650FB" PRIMARY KEY ("sched_name", "job_name", "job_group");

-- ----------------------------
-- Primary Key structure for table qrtz_locks
-- ----------------------------
ALTER TABLE "anivia"."qrtz_locks" ADD CONSTRAINT "PRIMARY_4122D403" PRIMARY KEY ("sched_name", "lock_name");

-- ----------------------------
-- Primary Key structure for table qrtz_paused_trigger_grps
-- ----------------------------
ALTER TABLE "anivia"."qrtz_paused_trigger_grps" ADD CONSTRAINT "PRIMARY_2E217F3A" PRIMARY KEY ("sched_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_scheduler_state
-- ----------------------------
ALTER TABLE "anivia"."qrtz_scheduler_state" ADD CONSTRAINT "PRIMARY_5A1EB912" PRIMARY KEY ("sched_name", "instance_name");

-- ----------------------------
-- Primary Key structure for table qrtz_simple_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_simple_triggers" ADD CONSTRAINT "PRIMARY_9A335A95" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_simprop_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_simprop_triggers" ADD CONSTRAINT "PRIMARY_F8B4E6ED" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Indexes structure for table qrtz_triggers
-- ----------------------------
CREATE INDEX "sched_name_CFEFF700" ON "anivia"."qrtz_triggers" USING btree (
  "sched_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "job_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "job_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table qrtz_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_triggers" ADD CONSTRAINT "PRIMARY_C52C5CF2" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table rel_user_auth_product
-- ----------------------------
ALTER TABLE "anivia"."rel_user_auth_product" ADD CONSTRAINT "PRIMARY_C37433FE" PRIMARY KEY ("user_id", "auth_id", "auth_product_type");

-- ----------------------------
-- Primary Key structure for table system_config
-- ----------------------------
ALTER TABLE "anivia"."system_config" ADD CONSTRAINT "PRIMARY_E29678C6" PRIMARY KEY ("config_id");

-- ----------------------------
-- Primary Key structure for table system_dept
-- ----------------------------
ALTER TABLE "anivia"."system_dept" ADD CONSTRAINT "PRIMARY_DFD95340" PRIMARY KEY ("dept_id");

-- ----------------------------
-- Primary Key structure for table system_dict_data
-- ----------------------------
ALTER TABLE "anivia"."system_dict_data" ADD CONSTRAINT "PRIMARY_FC432613" PRIMARY KEY ("dict_code");

-- ----------------------------
-- Uniques structure for table system_dict_type
-- ----------------------------
ALTER TABLE "anivia"."system_dict_type" ADD CONSTRAINT "dict_type_E6DDFA34" UNIQUE ("dict_type");

-- ----------------------------
-- Primary Key structure for table system_dict_type
-- ----------------------------
ALTER TABLE "anivia"."system_dict_type" ADD CONSTRAINT "PRIMARY_D7AC1531" PRIMARY KEY ("dict_id");

-- ----------------------------
-- Primary Key structure for table system_job
-- ----------------------------
ALTER TABLE "anivia"."system_job" ADD CONSTRAINT "PRIMARY_85F92CC0" PRIMARY KEY ("job_id", "job_name", "job_group");

-- ----------------------------
-- Primary Key structure for table system_job_log
-- ----------------------------
ALTER TABLE "anivia"."system_job_log" ADD CONSTRAINT "PRIMARY_4E1CAD8A" PRIMARY KEY ("job_log_id");

-- ----------------------------
-- Indexes structure for table system_logininfor
-- ----------------------------
CREATE INDEX "idx_sys_logininfor_lt_BA3E50CB" ON "anivia"."system_logininfor" USING btree (
  "login_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys_logininfor_s_8077C46D" ON "anivia"."system_logininfor" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table system_logininfor
-- ----------------------------
ALTER TABLE "anivia"."system_logininfor" ADD CONSTRAINT "PRIMARY_8CF65C81" PRIMARY KEY ("info_id");

-- ----------------------------
-- Primary Key structure for table system_menu
-- ----------------------------
ALTER TABLE "anivia"."system_menu" ADD CONSTRAINT "PRIMARY_53AAEB0C" PRIMARY KEY ("menu_id");

-- ----------------------------
-- Primary Key structure for table system_notice
-- ----------------------------
ALTER TABLE "anivia"."system_notice" ADD CONSTRAINT "PRIMARY_9671F91A" PRIMARY KEY ("notice_id");

-- ----------------------------
-- Indexes structure for table system_oper_log
-- ----------------------------
CREATE INDEX "idx_sys_oper_log_bt_D31E8687" ON "anivia"."system_oper_log" USING btree (
  "business_type" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys_oper_log_ot_CC3B5159" ON "anivia"."system_oper_log" USING btree (
  "oper_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys_oper_log_s_91776D6D" ON "anivia"."system_oper_log" USING btree (
  "status" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table system_oper_log
-- ----------------------------
ALTER TABLE "anivia"."system_oper_log" ADD CONSTRAINT "PRIMARY_1FDE0BC9" PRIMARY KEY ("oper_id");

-- ----------------------------
-- Primary Key structure for table system_post
-- ----------------------------
ALTER TABLE "anivia"."system_post" ADD CONSTRAINT "PRIMARY_54C6D38A" PRIMARY KEY ("post_id");

-- ----------------------------
-- Primary Key structure for table system_role
-- ----------------------------
ALTER TABLE "anivia"."system_role" ADD CONSTRAINT "PRIMARY_DD594DDE" PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table system_role_dept
-- ----------------------------
ALTER TABLE "anivia"."system_role_dept" ADD CONSTRAINT "PRIMARY_6954581C" PRIMARY KEY ("role_id", "dept_id");

-- ----------------------------
-- Primary Key structure for table system_role_menu
-- ----------------------------
ALTER TABLE "anivia"."system_role_menu" ADD CONSTRAINT "PRIMARY_2763E8" PRIMARY KEY ("role_id", "menu_id");

-- ----------------------------
-- Primary Key structure for table system_user
-- ----------------------------
ALTER TABLE "anivia"."system_user" ADD CONSTRAINT "PRIMARY_CC891234" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table system_user_post
-- ----------------------------
ALTER TABLE "anivia"."system_user_post" ADD CONSTRAINT "PRIMARY_D7919D06" PRIMARY KEY ("user_id", "post_id");

-- ----------------------------
-- Primary Key structure for table system_user_role
-- ----------------------------
ALTER TABLE "anivia"."system_user_role" ADD CONSTRAINT "PRIMARY_F17E835A" PRIMARY KEY ("user_id", "role_id");

-- ----------------------------
-- Primary Key structure for table user_type
-- ----------------------------
ALTER TABLE "anivia"."user_type" ADD CONSTRAINT "PRIMARY_D6136B29" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table qrtz_blob_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_blob_triggers" ADD CONSTRAINT "qrtz_blob_triggers_ibfk_1_602016CE" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "anivia"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table qrtz_cron_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_cron_triggers" ADD CONSTRAINT "qrtz_cron_triggers_ibfk_1_DCC7CA6E" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "anivia"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table qrtz_simple_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_simple_triggers" ADD CONSTRAINT "qrtz_simple_triggers_ibfk_1_BA07CD2E" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "anivia"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table qrtz_simprop_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_simprop_triggers" ADD CONSTRAINT "qrtz_simprop_triggers_ibfk_1_FCECB7C0" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "anivia"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table qrtz_triggers
-- ----------------------------
ALTER TABLE "anivia"."qrtz_triggers" ADD CONSTRAINT "qrtz_triggers_ibfk_1_2DEC48B4" FOREIGN KEY ("sched_name", "job_name", "job_group") REFERENCES "anivia"."qrtz_job_details" ("sched_name", "job_name", "job_group") ON DELETE RESTRICT ON UPDATE RESTRICT;
