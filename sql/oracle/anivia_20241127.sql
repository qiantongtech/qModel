/*
 Navicat Premium Data Transfer

 Source Server         : 本地Oracle
 Source Server Type    : Oracle
 Source Server Version : 120100
 Source Host           : 127.0.0.1:1521
 Source Schema         : ANIVIA

 Target Server Type    : Oracle
 Target Server Version : 120100
 File Encoding         : 65001

 Date: 27/11/2024 14:20:38
*/


-- ----------------------------
-- Table structure for auth_client
-- ----------------------------
DROP TABLE ANIVIA.auth_client;
CREATE TABLE ANIVIA.auth_client (
  id NUMBER(11,0) VISIBLE NOT NULL,
  secret_key NVARCHAR2(256) VISIBLE NOT NULL,
  name NVARCHAR2(128) VISIBLE NOT NULL,
  type NUMBER(4,0) VISIBLE NOT NULL,
  icon NVARCHAR2(256) VISIBLE,
  home_url NVARCHAR2(256) VISIBLE,
  sync_url NVARCHAR2(256) VISIBLE,
  redirect_url NCLOB VISIBLE NOT NULL,
  public_flag NUMBER(4,0) VISIBLE NOT NULL,
  valid_flag NUMBER(4,0) VISIBLE NOT NULL,
  del_flag NUMBER(4,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(128) VISIBLE,
  creator_id NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE NOT NULL,
  update_by NVARCHAR2(128) VISIBLE,
  updator_id NVARCHAR2(20) VISIBLE,
  update_time DATE VISIBLE NOT NULL,
  remark NVARCHAR2(512) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.auth_client.id IS '应用ID';
COMMENT ON COLUMN ANIVIA.auth_client.secret_key IS '应用秘钥';
COMMENT ON COLUMN ANIVIA.auth_client.name IS '应用名称';
COMMENT ON COLUMN ANIVIA.auth_client.type IS '应用类型;0：Web，1：App，2：小程序';
COMMENT ON COLUMN ANIVIA.auth_client.icon IS '应用图标';
COMMENT ON COLUMN ANIVIA.auth_client.home_url IS '应用首页';
COMMENT ON COLUMN ANIVIA.auth_client.sync_url IS '同步地址';
COMMENT ON COLUMN ANIVIA.auth_client.redirect_url IS '允许授权的url';
COMMENT ON COLUMN ANIVIA.auth_client.public_flag IS '是否公开';
COMMENT ON COLUMN ANIVIA.auth_client.valid_flag IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN ANIVIA.auth_client.del_flag IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN ANIVIA.auth_client.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.auth_client.creator_id IS '创建人id;创建者的sys_user_id';
COMMENT ON COLUMN ANIVIA.auth_client.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.auth_client.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.auth_client.updator_id IS '更新人id;更新者的sys_user_id';
COMMENT ON COLUMN ANIVIA.auth_client.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.auth_client.remark IS '备注';
COMMENT ON TABLE ANIVIA.auth_client IS '应用管理';

-- ----------------------------
-- Records of auth_client
-- ----------------------------
INSERT INTO ANIVIA.auth_client VALUES ('4', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('6', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('7', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('8', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('9', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('10', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('11', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('12', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('13', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('14', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('15', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('16', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('17', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('18', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('19', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('20', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('21', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('22', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('23', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('24', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('25', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('26', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('27', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('28', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('29', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('30', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('31', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('32', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('33', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('34', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('35', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('36', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('37', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.auth_client VALUES ('38', 'c93868ee-07ea-4f5c-9aa6-1f9b89708f80', '冰风管理系统', '0', NULL, NULL, NULL, '*', '1', '1', '0', '若依1', '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-08-31 21:08:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for auth_client_user
-- ----------------------------
DROP TABLE ANIVIA.auth_client_user;
CREATE TABLE ANIVIA.auth_client_user (
  client_id NUMBER(20,0) VISIBLE NOT NULL,
  user_id NUMBER(20,0) VISIBLE NOT NULL,
  open_id NVARCHAR2(256) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.auth_client_user.client_id IS '应用ID';
COMMENT ON COLUMN ANIVIA.auth_client_user.user_id IS '用户ID';
COMMENT ON COLUMN ANIVIA.auth_client_user.open_id IS 'open_id';
COMMENT ON TABLE ANIVIA.auth_client_user IS '应用和用户关联表';

-- ----------------------------
-- Records of auth_client_user
-- ----------------------------

-- ----------------------------
-- Table structure for ca_cert
-- ----------------------------
DROP TABLE ANIVIA.ca_cert;
CREATE TABLE ANIVIA.ca_cert (
  id NUMBER(20,0) VISIBLE NOT NULL,
  name NVARCHAR2(90) VISIBLE NOT NULL,
  subject_id NUMBER(11,0) VISIBLE NOT NULL,
  subject_name NVARCHAR2(90) VISIBLE NOT NULL,
  certificate NVARCHAR2(255) VISIBLE NOT NULL,
  private_key NVARCHAR2(255) VISIBLE NOT NULL,
  issuer NVARCHAR2(255) VISIBLE NOT NULL,
  possessor NVARCHAR2(255) VISIBLE NOT NULL,
  valid_time NVARCHAR2(255) VISIBLE NOT NULL,
  valid_flag NUMBER(11,0) VISIBLE NOT NULL,
  del_flag NUMBER(11,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(90) VISIBLE,
  creator_id NUMBER(11,0) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(90) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(900) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.ca_cert.id IS 'ID;ID';
COMMENT ON COLUMN ANIVIA.ca_cert.name IS '证书名称';
COMMENT ON COLUMN ANIVIA.ca_cert.subject_id IS '主体id';
COMMENT ON COLUMN ANIVIA.ca_cert.subject_name IS '主体名称';
COMMENT ON COLUMN ANIVIA.ca_cert.certificate IS '证书;证书';
COMMENT ON COLUMN ANIVIA.ca_cert.private_key IS '私钥;私钥';
COMMENT ON COLUMN ANIVIA.ca_cert.issuer IS '颁发者';
COMMENT ON COLUMN ANIVIA.ca_cert.possessor IS '所有者';
COMMENT ON COLUMN ANIVIA.ca_cert.valid_time IS '有效期';
COMMENT ON COLUMN ANIVIA.ca_cert.valid_flag IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN ANIVIA.ca_cert.del_flag IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN ANIVIA.ca_cert.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.ca_cert.creator_id IS '创建人id';
COMMENT ON COLUMN ANIVIA.ca_cert.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.ca_cert.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.ca_cert.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.ca_cert.remark IS '备注;备注';
COMMENT ON TABLE ANIVIA.ca_cert IS '证书管理';

-- ----------------------------
-- Records of ca_cert
-- ----------------------------
INSERT INTO ANIVIA.ca_cert VALUES ('9', '冰凤框架Nginx证书', '9', '江苏千桐科技有限公司', '/profile/ca/2024/10/23/6718d6e3a921cf6536292244.cer', '/profile/ca/2024/10/23/6718d6e3a921cf6536292245.pem', '江苏千桐科技有限公司', '192.168.0.1', '30', '1', '0', 'admin', '1', TO_DATE('2024-10-23 18:58:44', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ca_subject
-- ----------------------------
DROP TABLE ANIVIA.ca_subject;
CREATE TABLE ANIVIA.ca_subject (
  id NUMBER(20,0) VISIBLE NOT NULL,
  name NVARCHAR2(90) VISIBLE NOT NULL,
  cn NVARCHAR2(255) VISIBLE NOT NULL,
  ou NVARCHAR2(255) VISIBLE NOT NULL,
  o NVARCHAR2(255) VISIBLE NOT NULL,
  l NVARCHAR2(255) VISIBLE NOT NULL,
  st NVARCHAR2(255) VISIBLE NOT NULL,
  c NVARCHAR2(255) VISIBLE NOT NULL,
  certificate NVARCHAR2(255) VISIBLE NOT NULL,
  private_key NVARCHAR2(255) VISIBLE NOT NULL,
  valid_flag NUMBER(11,0) VISIBLE NOT NULL,
  del_flag NUMBER(11,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(90) VISIBLE,
  creator_id NUMBER(11,0) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(90) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(900) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.ca_subject.id IS 'ID;主体ID';
COMMENT ON COLUMN ANIVIA.ca_subject.name IS '主体名称;主体名称';
COMMENT ON COLUMN ANIVIA.ca_subject.cn IS '通用名称;通用名称';
COMMENT ON COLUMN ANIVIA.ca_subject.ou IS '组织部门;组织单位名称';
COMMENT ON COLUMN ANIVIA.ca_subject.o IS '组织名称';
COMMENT ON COLUMN ANIVIA.ca_subject.l IS '城市名称';
COMMENT ON COLUMN ANIVIA.ca_subject.st IS '省名称';
COMMENT ON COLUMN ANIVIA.ca_subject.c IS '国家';
COMMENT ON COLUMN ANIVIA.ca_subject.certificate IS '证书;证书';
COMMENT ON COLUMN ANIVIA.ca_subject.private_key IS '私钥;私钥';
COMMENT ON COLUMN ANIVIA.ca_subject.valid_flag IS '是否有效;是否有效 0：无效，1：有效';
COMMENT ON COLUMN ANIVIA.ca_subject.del_flag IS '删除标志;删除标志 1：已删除，0：未删除';
COMMENT ON COLUMN ANIVIA.ca_subject.create_by IS '创建人;创建人';
COMMENT ON COLUMN ANIVIA.ca_subject.creator_id IS '创建人id;创建人id';
COMMENT ON COLUMN ANIVIA.ca_subject.create_time IS '创建时间;创建时间';
COMMENT ON COLUMN ANIVIA.ca_subject.update_by IS '更新人;更新人';
COMMENT ON COLUMN ANIVIA.ca_subject.update_time IS '更新时间;更新时间';
COMMENT ON COLUMN ANIVIA.ca_subject.remark IS '备注;备注';
COMMENT ON TABLE ANIVIA.ca_subject IS '主体管理';

-- ----------------------------
-- Records of ca_subject
-- ----------------------------
INSERT INTO ANIVIA.ca_subject VALUES ('9', '江苏千桐科技有限公司', '江苏千桐科技有限公司', '技术部', '技术部', '南京', '江苏', '中国', '/profile/ca/2024/10/23/6718d658a921cf6536292242.cer', '/profile/ca/2024/10/23/6718d658a921cf6536292243.pem', '1', '0', 'admin', '1', TO_DATE('2024-10-23 18:56:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);

-- ----------------------------
-- Table structure for example_dept
-- ----------------------------
DROP TABLE ANIVIA.example_dept;
CREATE TABLE ANIVIA.example_dept (
  id NUMBER(11,0) VISIBLE NOT NULL,
  parent_id NUMBER(20,0) VISIBLE NOT NULL,
  name NVARCHAR2(128) VISIBLE,
  leader NVARCHAR2(32) VISIBLE,
  phone NVARCHAR2(32) VISIBLE,
  email NVARCHAR2(128) VISIBLE,
  status NUMBER(4,0) VISIBLE NOT NULL,
  valid_flag NUMBER(4,0) VISIBLE NOT NULL,
  del_flag NUMBER(4,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(32) VISIBLE,
  creator_id NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE NOT NULL,
  update_by NVARCHAR2(32) VISIBLE,
  updator_id NUMBER(20,0) VISIBLE,
  update_time DATE VISIBLE NOT NULL,
  remark NVARCHAR2(512) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.example_dept.id IS 'ID';
COMMENT ON COLUMN ANIVIA.example_dept.parent_id IS '父部门id';
COMMENT ON COLUMN ANIVIA.example_dept.name IS '部门名称';
COMMENT ON COLUMN ANIVIA.example_dept.leader IS '负责人';
COMMENT ON COLUMN ANIVIA.example_dept.phone IS '联系电话';
COMMENT ON COLUMN ANIVIA.example_dept.email IS '邮箱';
COMMENT ON COLUMN ANIVIA.example_dept.status IS '部门状态';
COMMENT ON COLUMN ANIVIA.example_dept.valid_flag IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN ANIVIA.example_dept.del_flag IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN ANIVIA.example_dept.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.example_dept.creator_id IS '创建人id';
COMMENT ON COLUMN ANIVIA.example_dept.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.example_dept.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.example_dept.updator_id IS '更新人id';
COMMENT ON COLUMN ANIVIA.example_dept.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.example_dept.remark IS '备注';
COMMENT ON TABLE ANIVIA.example_dept IS '示例部门表';

-- ----------------------------
-- Records of example_dept
-- ----------------------------
INSERT INTO ANIVIA.example_dept VALUES ('1', '0', '云桐科技', '张三', 'xxxxxxxx', 'xxxxxxx', '0', '1', '0', 'admin', '1', TO_DATE('2024-11-27 10:55:33', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-27 10:55:33', 'SYYYY-MM-DD HH24:MI:SS'), '测试数据');
INSERT INTO ANIVIA.example_dept VALUES ('2', '1', '郑州总部', '李四', '/', '/', '0', '1', '0', 'admin', '1', TO_DATE('2024-11-27 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-27 13:45:27', 'SYYYY-MM-DD HH24:MI:SS'), '总部测试');

-- ----------------------------
-- Table structure for example_user
-- ----------------------------
DROP TABLE ANIVIA.example_user;
CREATE TABLE ANIVIA.example_user (
  id NUMBER(11,0) VISIBLE NOT NULL,
  name NVARCHAR2(32) VISIBLE NOT NULL,
  age NUMBER(11,0) VISIBLE NOT NULL,
  phone NVARCHAR2(32) VISIBLE,
  type_id NUMBER(20,0) VISIBLE,
  valid_flag NUMBER(4,0) VISIBLE NOT NULL,
  del_flag NUMBER(4,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(32) VISIBLE,
  creator_id NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE NOT NULL,
  update_by NVARCHAR2(32) VISIBLE,
  updator_id NUMBER(20,0) VISIBLE,
  update_time DATE VISIBLE NOT NULL,
  remark NVARCHAR2(512) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.example_user.id IS 'ID';
COMMENT ON COLUMN ANIVIA.example_user.name IS '名称';
COMMENT ON COLUMN ANIVIA.example_user.age IS '年龄';
COMMENT ON COLUMN ANIVIA.example_user.phone IS '手机号';
COMMENT ON COLUMN ANIVIA.example_user.type_id IS '用户类型';
COMMENT ON COLUMN ANIVIA.example_user.valid_flag IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN ANIVIA.example_user.del_flag IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN ANIVIA.example_user.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.example_user.creator_id IS '创建人id';
COMMENT ON COLUMN ANIVIA.example_user.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.example_user.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.example_user.updator_id IS '更新人id';
COMMENT ON COLUMN ANIVIA.example_user.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.example_user.remark IS '备注';
COMMENT ON TABLE ANIVIA.example_user IS '示例用户表';

-- ----------------------------
-- Records of example_user
-- ----------------------------
INSERT INTO ANIVIA.example_user VALUES ('1', '张三', '18', '19951942682', '1', '1', '1', '若依1', '1', TO_DATE('2024-10-23 16:26:37', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-10-23 16:26:37', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE ANIVIA.gen_table;
CREATE TABLE ANIVIA.gen_table (
  table_id NUMBER(20,0) VISIBLE NOT NULL,
  table_name NVARCHAR2(200) VISIBLE,
  table_comment NVARCHAR2(500) VISIBLE,
  sub_table_name NVARCHAR2(64) VISIBLE,
  sub_table_fk_name NVARCHAR2(64) VISIBLE,
  class_name NVARCHAR2(100) VISIBLE,
  tpl_category NVARCHAR2(200) VISIBLE,
  tpl_web_type NVARCHAR2(30) VISIBLE,
  package_name NVARCHAR2(100) VISIBLE,
  module_name NVARCHAR2(30) VISIBLE,
  business_name NVARCHAR2(30) VISIBLE,
  function_name NVARCHAR2(50) VISIBLE,
  function_author NVARCHAR2(50) VISIBLE,
  gen_type NCHAR(1) VISIBLE,
  gen_path NVARCHAR2(200) VISIBLE,
  options NVARCHAR2(1000) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.gen_table.table_id IS '编号';
COMMENT ON COLUMN ANIVIA.gen_table.table_name IS '表名称';
COMMENT ON COLUMN ANIVIA.gen_table.table_comment IS '表描述';
COMMENT ON COLUMN ANIVIA.gen_table.sub_table_name IS '关联子表的表名';
COMMENT ON COLUMN ANIVIA.gen_table.sub_table_fk_name IS '子表关联的外键名';
COMMENT ON COLUMN ANIVIA.gen_table.class_name IS '实体类名称';
COMMENT ON COLUMN ANIVIA.gen_table.tpl_category IS '使用的模板（crud单表操作 tree树表操作）';
COMMENT ON COLUMN ANIVIA.gen_table.tpl_web_type IS '前端模板类型（element-ui模版 element-plus模版）';
COMMENT ON COLUMN ANIVIA.gen_table.package_name IS '生成包路径';
COMMENT ON COLUMN ANIVIA.gen_table.module_name IS '生成模块名';
COMMENT ON COLUMN ANIVIA.gen_table.business_name IS '生成业务名';
COMMENT ON COLUMN ANIVIA.gen_table.function_name IS '生成功能名';
COMMENT ON COLUMN ANIVIA.gen_table.function_author IS '生成功能作者';
COMMENT ON COLUMN ANIVIA.gen_table.gen_type IS '生成代码方式（0zip压缩包 1自定义路径）';
COMMENT ON COLUMN ANIVIA.gen_table.gen_path IS '生成路径（不填默认项目路径）';
COMMENT ON COLUMN ANIVIA.gen_table.options IS '其它生成选项';
COMMENT ON COLUMN ANIVIA.gen_table.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.gen_table.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.gen_table.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.gen_table.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.gen_table.remark IS '备注';
COMMENT ON TABLE ANIVIA.gen_table IS '代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO ANIVIA.gen_table VALUES ('19', 'example_user', '示例用户表', NULL, NULL, 'ExampleUser', 'crud', 'element-plus', 'tech.qiantong.module.example.del', 'user', 'user', '示例用户', 'anivia', '0', '/', '{parentMenuId:2023}', 'admin', TO_DATE('2024-10-23 15:44:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.gen_table VALUES ('22', 'message', '消息', NULL, NULL, 'Message', 'crud', 'element-plus', 'tech.qiantong.module.system', 'message', 'message3', '消息', 'anivia', '0', '/', '{parentMenuId:1}', 'admin', TO_DATE('2024-10-31 14:25:33', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.gen_table VALUES ('23', 'message_template', '消息模板', NULL, NULL, 'MessageTemplate', 'crud', 'element-plus', 'tech.qiantong.module.system', 'message', 'messageTemplate', '消息模板', 'anivia', '0', '/', '{parentMenuId:1}', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.gen_table VALUES ('24', 'rel_user_auth_product', '用户与认证中心关系表', NULL, NULL, 'RelUserAuthProduct', 'crud', 'element-plus', 'tech.qiantong.module.system', 'auth', 'userAuthProduct', '用户与认证中心关系', 'anivia', '0', '/', '{parentMenuId:}', 'admin', TO_DATE('2024-11-07 09:43:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-07 09:46:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.gen_table VALUES ('26', 'pro_plan', '生产计划', NULL, NULL, 'ProPlan', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example', 'orderTask', 'proOrderTask', '生产计划', 'anivia', '0', 'D:\workspace\Anivia-Plus\anivia-ui\anivia3', '{parentMenuId:2023}', 'admin', TO_DATE('2024-11-22 11:52:04', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.gen_table VALUES ('27', 'pro_task_receive', '生产领料记录', NULL, NULL, 'ProTaskReceive', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example', 'taskReceive', 'proTaskReceive', '生产领料记录', 'anivia', '0', '/', '{parentMenuId:2023}', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.gen_table VALUES ('29', 'user_type', '用户类型', NULL, NULL, 'UserType', 'crud', 'element-plus', 'tech.qiantong.qmodel.module.example', 'user', 'userType', '用户类型', 'anivia', '0', '/', '{parentMenuId:2023}', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.gen_table VALUES ('31', 'example_dept', '示例部门表', NULL, NULL, 'ExampleDept', 'tree', 'element-plus', 'tech.qiantong.qmodel.module.example', 'gen', 'dept', '示例部门', 'anivia', '0', '/', '{treeCode:id,treeName:name,treeParentCode:parent_id,parentMenuId:}', 'admin', TO_DATE('2024-11-27 10:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:24', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE ANIVIA.gen_table_column;
CREATE TABLE ANIVIA.gen_table_column (
  column_id NUMBER(20,0) VISIBLE NOT NULL,
  table_id NUMBER(20,0) VISIBLE,
  column_name NVARCHAR2(200) VISIBLE,
  column_comment NVARCHAR2(500) VISIBLE,
  column_type NVARCHAR2(100) VISIBLE,
  java_type NVARCHAR2(500) VISIBLE,
  java_field NVARCHAR2(200) VISIBLE,
  is_pk NCHAR(1) VISIBLE,
  is_increment NCHAR(1) VISIBLE,
  is_required NCHAR(1) VISIBLE,
  is_insert NCHAR(1) VISIBLE,
  is_edit NCHAR(1) VISIBLE,
  is_list NCHAR(1) VISIBLE,
  is_query NCHAR(1) VISIBLE,
  query_type NVARCHAR2(200) VISIBLE,
  html_type NVARCHAR2(200) VISIBLE,
  dict_type NVARCHAR2(200) VISIBLE,
  sort NUMBER(11,0) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.gen_table_column.column_id IS '编号';
COMMENT ON COLUMN ANIVIA.gen_table_column.table_id IS '归属表编号';
COMMENT ON COLUMN ANIVIA.gen_table_column.column_name IS '列名称';
COMMENT ON COLUMN ANIVIA.gen_table_column.column_comment IS '列描述';
COMMENT ON COLUMN ANIVIA.gen_table_column.column_type IS '列类型';
COMMENT ON COLUMN ANIVIA.gen_table_column.java_type IS 'JAVA类型';
COMMENT ON COLUMN ANIVIA.gen_table_column.java_field IS 'JAVA字段名';
COMMENT ON COLUMN ANIVIA.gen_table_column.is_pk IS '是否主键（1是）';
COMMENT ON COLUMN ANIVIA.gen_table_column.is_increment IS '是否自增（1是）';
COMMENT ON COLUMN ANIVIA.gen_table_column.is_required IS '是否必填（1是）';
COMMENT ON COLUMN ANIVIA.gen_table_column.is_insert IS '是否为插入字段（1是）';
COMMENT ON COLUMN ANIVIA.gen_table_column.is_edit IS '是否编辑字段（1是）';
COMMENT ON COLUMN ANIVIA.gen_table_column.is_list IS '是否列表字段（1是）';
COMMENT ON COLUMN ANIVIA.gen_table_column.is_query IS '是否查询字段（1是）';
COMMENT ON COLUMN ANIVIA.gen_table_column.query_type IS '查询方式（等于、不等于、大于、小于、范围）';
COMMENT ON COLUMN ANIVIA.gen_table_column.html_type IS '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';
COMMENT ON COLUMN ANIVIA.gen_table_column.dict_type IS '字典类型';
COMMENT ON COLUMN ANIVIA.gen_table_column.sort IS '排序';
COMMENT ON COLUMN ANIVIA.gen_table_column.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.gen_table_column.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.gen_table_column.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.gen_table_column.update_time IS '更新时间';
COMMENT ON TABLE ANIVIA.gen_table_column IS '代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO ANIVIA.gen_table_column VALUES ('284', '19', 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '1', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('285', '19', 'name', '名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', NULL, '2', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('286', '19', 'age', '年龄', 'int(11)', 'Long', 'age', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', NULL, '3', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('287', '19', 'phone', '手机号', 'varchar(32)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', '4', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('288', '19', 'type_id', '用户类型', 'bigint(20)', 'Long', 'typeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'checkbox', 'sys_yes_no', '5', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('289', '19', 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '6', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('290', '19', 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'imageUpload', NULL, '7', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('291', '19', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', NULL, '8', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('292', '19', 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '9', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:38', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('293', '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '10', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:38', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('294', '19', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '11', NULL, TO_DATE('2024-10-23 16:21:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:38', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('295', '19', 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '12', NULL, TO_DATE('2024-10-23 16:21:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:38', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('296', '19', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '13', NULL, TO_DATE('2024-10-23 16:21:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:38', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('297', '19', 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', NULL, '14', NULL, TO_DATE('2024-10-23 16:21:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:05:38', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('308', '22', 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '1', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:43', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('309', '22', 'sender_id', '发送人', 'bigint(20)', 'Long', 'senderId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '2', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:43', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('310', '22', 'receiver_id', '接收人', 'bigint(20)', 'Long', 'receiverId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '3', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:43', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('311', '22', 'title', '消息标题', 'varchar(128)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '4', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('312', '22', 'content', '消息模板内容', 'varchar(3072)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', NULL, '5', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('313', '22', 'category', '消息类别', 'tinyint(4) unsigned', 'Integer', 'category', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '6', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('314', '22', 'level', '消息等级', 'tinyint(4) unsigned', 'Integer', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '7', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('315', '22', 'module', '消息模块', 'tinyint(4) unsigned', 'Integer', 'module', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '8', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('316', '22', 'entity_type', '实体类型', 'tinyint(4) unsigned', 'Integer', 'entityType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', NULL, '9', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('317', '22', 'entity_id', '实体id', 'bigint(20)', 'Long', 'entityId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '10', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('318', '22', 'entity_url', '消息链接', 'varchar(256)', 'String', 'entityUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '11', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('319', '22', 'has_read', '是否已读', 'tinyint(1)', 'Integer', 'hasRead', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '12', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('320', '22', 'has_retraction', '是否撤回', 'tinyint(1)', 'Integer', 'hasRetraction', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '13', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('321', '22', 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '14', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('322', '22', 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '15', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('323', '22', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '16', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('324', '22', 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '17', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('325', '22', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '18', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('326', '22', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '19', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('327', '22', 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '20', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('328', '22', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '21', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('329', '22', 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', NULL, '22', 'admin', TO_DATE('2024-10-31 14:25:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 15:52:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('330', '23', 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '1', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('331', '23', 'title', '消息标题', 'varchar(128)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '2', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('332', '23', 'content', '消息模板内容', 'varchar(3072)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', NULL, '3', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('333', '23', 'category', '消息类别', 'tinyint(4) unsigned', 'Integer', 'category', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '4', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('334', '23', 'level', '消息等级', 'tinyint(4) unsigned', 'Integer', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '5', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('335', '23', 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '6', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('336', '23', 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '7', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('337', '23', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '8', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('338', '23', 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '9', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('339', '23', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '10', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('340', '23', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '11', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('341', '23', 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '12', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('342', '23', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '13', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('343', '23', 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', NULL, '14', 'admin', TO_DATE('2024-10-31 14:25:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-01 09:49:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('344', '24', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '1', 'admin', TO_DATE('2024-11-07 09:43:22', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-07 09:46:48', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('345', '24', 'auth_id', '统一身份认证id', 'varchar(256)', 'String', 'authId', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '2', 'admin', TO_DATE('2024-11-07 09:43:22', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-07 09:46:49', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('346', '24', 'auth_product_type', '认证平台类型', 'tinyint(4) unsigned', 'Integer', 'authProductType', '1', '0', '0', '1', '1', '1', '1', 'EQ', 'select', NULL, '3', 'admin', TO_DATE('2024-11-07 09:43:22', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-07 09:46:49', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('358', '26', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '1', 'admin', TO_DATE('2024-11-22 11:52:04', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('359', '26', 'company_id', '所属母公司id', 'bigint(20)', 'Long', 'companyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '2', 'admin', TO_DATE('2024-11-22 11:52:04', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('360', '26', 'subsidiary_id', '所属子公司id', 'bigint(20)', 'Long', 'subsidiaryId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '3', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('361', '26', 'sale_id', '销售单id', 'bigint(20)', 'Long', 'saleId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '4', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('362', '26', 'sale_code', '销售单号', 'varchar(32)', 'String', 'saleCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '5', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('363', '26', 'code', '计划单号', 'varchar(32)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '6', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('364', '26', 'product_id', '产品id', 'bigint(20)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '7', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('365', '26', 'product_code', '产品编码', 'varchar(32)', 'String', 'productCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '8', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('366', '26', 'split_route_type', '拆单工艺类型', 'tinyint(4) unsigned', 'Integer', 'splitRouteType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', NULL, '9', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('367', '26', 'pro_bom_id', '生产BOMid', 'bigint(20)', 'Long', 'proBomId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '10', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('368', '26', 'pro_bom_code', '生产BOM编码', 'varchar(32)', 'String', 'proBomCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '11', 'admin', TO_DATE('2024-11-22 11:52:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('369', '26', 'route_id', '工艺路线id', 'bigint(20)', 'Long', 'routeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '12', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('370', '26', 'route_code', '工艺路线编码', 'varchar(32)', 'String', 'routeCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '13', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('371', '26', 'status', '状态', 'tinyint(4) unsigned', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, '14', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('372', '26', 'plan_number', '计划数量', 'int(11)', 'Long', 'planNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '15', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('373', '26', 'begin_time', '计划开始时间', 'datetime', 'Date', 'beginTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '16', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('374', '26', 'end_time', '计划结束时间', 'datetime', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '17', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('375', '26', 'attachment', '附件', 'varchar(3072)', 'String', 'attachment', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', NULL, '18', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('376', '26', 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '19', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('377', '26', 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '20', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('378', '26', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '21', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('379', '26', 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '22', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('380', '26', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '23', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('381', '26', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '24', 'admin', TO_DATE('2024-11-22 11:52:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('382', '26', 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '25', 'admin', TO_DATE('2024-11-22 11:52:07', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('383', '26', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '26', 'admin', TO_DATE('2024-11-22 11:52:07', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('384', '26', 'remark', '备注', 'text', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', NULL, '27', 'admin', TO_DATE('2024-11-22 11:52:07', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-22 15:08:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('385', '27', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '1', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('386', '27', 'company_id', '所属母公司id', 'bigint(20)', 'Long', 'companyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '2', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('387', '27', 'subsidiary_id', '所属子公司id', 'bigint(20)', 'Long', 'subsidiaryId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '3', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('388', '27', 'task_id', '任务id', 'bigint(20)', 'Long', 'taskId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '4', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('389', '27', 'task_code', '任务编号', 'varchar(32)', 'String', 'taskCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '5', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('390', '27', 'order_id', '工单id', 'bigint(20)', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '6', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('391', '27', 'order_code', '工单编号', 'varchar(32)', 'String', 'orderCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '7', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('392', '27', 'reveive_time', '领料日期', 'datetime', 'Date', 'reveiveTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '8', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('393', '27', 'material_id', '物料id', 'bigint(20)', 'Long', 'materialId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '9', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('394', '27', 'material_code', '物料编码', 'varchar(32)', 'String', 'materialCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '10', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('395', '27', 'staff_id', '领料人id', 'bigint(20)', 'Long', 'staffId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '11', 'admin', TO_DATE('2024-11-22 15:10:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('396', '27', 'count', '领料数量', 'decimal(10,0)', 'Long', 'count', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '12', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('397', '27', 'unit_id', '单位id', 'bigint(20)', 'Long', 'unitId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '13', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('398', '27', 'unit_code', '单位编号', 'varchar(32)', 'String', 'unitCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '14', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('399', '27', 'store_id', '仓库id', 'bigint(20)', 'Long', 'storeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '15', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('400', '27', 'store_code', '仓库编码', 'varchar(32)', 'String', 'storeCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '16', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('401', '27', 'store_location_id', '所属库位id', 'bigint(20)', 'Long', 'storeLocationId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '17', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('402', '27', 'store_location_code', '所属库位编码', 'varchar(32)', 'String', 'storeLocationCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '18', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('403', '27', 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '19', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('404', '27', 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, '20', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('405', '27', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '21', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('406', '27', 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '22', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('407', '27', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '23', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('408', '27', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '24', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('409', '27', 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '25', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('410', '27', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '26', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:14', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('411', '27', 'remark', '备注', 'text', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', NULL, '27', 'admin', TO_DATE('2024-11-22 15:10:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-26 11:16:14', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('426', '29', 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '1', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('427', '29', 'name', '类型名称', 'varchar(128)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', NULL, '2', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('428', '29', 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '3', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('429', '29', 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '4', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('430', '29', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '5', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('431', '29', 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '6', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('432', '29', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '7', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('433', '29', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '8', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('434', '29', 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, '9', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('435', '29', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', NULL, '10', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('436', '29', 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', NULL, '11', 'admin', TO_DATE('2024-11-27 09:57:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 10:00:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('452', '31', 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, '1', 'admin', TO_DATE('2024-11-27 10:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('453', '31', 'parent_id', '父部门id', 'bigint(20)', 'Long', 'parentId', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', NULL, '2', 'admin', TO_DATE('2024-11-27 10:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('454', '31', 'name', '部门名称', 'varchar(128)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, '3', 'admin', TO_DATE('2024-11-27 10:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('455', '31', 'leader', '负责人', 'varchar(32)', 'String', 'leader', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', NULL, '4', 'admin', TO_DATE('2024-11-27 10:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('456', '31', 'phone', '联系电话', 'varchar(32)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', NULL, '5', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('457', '31', 'email', '邮箱', 'varchar(128)', 'String', 'email', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', NULL, '6', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('458', '31', 'status', '部门状态', 'tinyint(4) unsigned', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', '7', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('459', '31', 'valid_flag', '是否有效', 'tinyint(1)', 'Boolean', 'validFlag', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, '8', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('460', '31', 'del_flag', '删除标志', 'tinyint(1)', 'Boolean', 'delFlag', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, '9', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('461', '31', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, '10', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('462', '31', 'creator_id', '创建人id', 'bigint(20)', 'Long', 'creatorId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, '11', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('463', '31', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', NULL, '12', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('464', '31', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, '13', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('465', '31', 'updator_id', '更新人id', 'bigint(20)', 'Long', 'updatorId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, '14', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('466', '31', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', NULL, '15', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:26', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.gen_table_column VALUES ('467', '31', 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', NULL, '16', 'admin', TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 11:17:26', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE ANIVIA.message;
CREATE TABLE ANIVIA.message (
  id NUMBER(11,0) VISIBLE NOT NULL,
  sender_id NUMBER(20,0) VISIBLE,
  receiver_id NUMBER(20,0) VISIBLE,
  title NVARCHAR2(128) VISIBLE NOT NULL,
  content NCLOB VISIBLE NOT NULL,
  category NUMBER(4,0) VISIBLE NOT NULL,
  msg_level NUMBER(4,0) VISIBLE NOT NULL,
  module NUMBER(4,0) VISIBLE NOT NULL,
  entity_type NUMBER(4,0) VISIBLE,
  entity_id NUMBER(20,0) VISIBLE,
  entity_url NVARCHAR2(256) VISIBLE,
  has_read NUMBER(4,0) VISIBLE,
  has_retraction NUMBER(4,0) VISIBLE,
  valid_flag NUMBER(4,0) VISIBLE NOT NULL,
  del_flag NUMBER(4,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(32) VISIBLE,
  creator_id NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE NOT NULL,
  update_by NVARCHAR2(32) VISIBLE,
  updator_id NUMBER(20,0) VISIBLE,
  update_time DATE VISIBLE NOT NULL,
  remark NVARCHAR2(512) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.message.id IS 'ID';
COMMENT ON COLUMN ANIVIA.message.sender_id IS '发送人';
COMMENT ON COLUMN ANIVIA.message.receiver_id IS '接收人';
COMMENT ON COLUMN ANIVIA.message.title IS '消息标题';
COMMENT ON COLUMN ANIVIA.message.content IS '消息模板内容';
COMMENT ON COLUMN ANIVIA.message.category IS '消息类别';
COMMENT ON COLUMN ANIVIA.message.msg_level IS '消息等级';
COMMENT ON COLUMN ANIVIA.message.module IS '消息模块';
COMMENT ON COLUMN ANIVIA.message.entity_type IS '实体类型';
COMMENT ON COLUMN ANIVIA.message.entity_id IS '实体id';
COMMENT ON COLUMN ANIVIA.message.entity_url IS '消息链接';
COMMENT ON COLUMN ANIVIA.message.has_read IS '是否已读';
COMMENT ON COLUMN ANIVIA.message.has_retraction IS '是否撤回';
COMMENT ON COLUMN ANIVIA.message.valid_flag IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN ANIVIA.message.del_flag IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN ANIVIA.message.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.message.creator_id IS '创建人id';
COMMENT ON COLUMN ANIVIA.message.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.message.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.message.updator_id IS '更新人id';
COMMENT ON COLUMN ANIVIA.message.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.message.remark IS '备注';
COMMENT ON TABLE ANIVIA.message IS '消息';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO ANIVIA.message VALUES ('1', NULL, '1', '测试模版', '测试消息测试模版', '0', '0', '0', NULL, NULL, NULL, '0', '0', '1', '1', NULL, NULL, TO_DATE('2024-11-01 15:51:36', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-01 15:51:36', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('2', NULL, '1', '测试模版', '测试消息测试模版', '0', '0', '0', NULL, NULL, NULL, '1', '0', '1', '1', NULL, NULL, TO_DATE('2024-11-01 15:51:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-01 15:51:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('3', NULL, '1', '测试模版', '测试消息测试模版', '0', '0', '0', NULL, NULL, NULL, '1', '0', '1', '1', NULL, NULL, TO_DATE('2024-11-01 15:51:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-01 15:51:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('4', NULL, '2', '测试模版', '测试消息测试模版', '0', '0', '0', NULL, NULL, NULL, '0', '0', '1', '0', NULL, NULL, TO_DATE('2024-11-01 15:52:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-01 15:52:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('5', NULL, '2', '测试模版', '测试消息测试模版', '0', '0', '0', NULL, NULL, NULL, '0', '0', '1', '0', NULL, NULL, TO_DATE('2024-11-01 15:52:54', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-01 15:52:54', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('6', NULL, '2', '测试模版', '测试消息测试模版', '0', '0', '0', NULL, NULL, NULL, '0', '0', '1', '0', NULL, NULL, TO_DATE('2024-11-01 15:52:56', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-01 15:52:56', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('7', NULL, '1', '测试模版', '测试消息测试模版', '0', '0', '0', NULL, NULL, NULL, '1', '0', '1', '0', NULL, NULL, TO_DATE('2024-11-01 15:53:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-01 15:53:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('8', NULL, '1', '测试模版', '测试消息测试模版', '0', '0', '0', NULL, NULL, NULL, '0', '0', '1', '1', NULL, NULL, TO_DATE('2024-11-01 17:19:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-01 17:19:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('9', NULL, '1', '测试模版', '***************测试模版', '0', '0', '1', NULL, NULL, NULL, '0', '0', '1', '1', NULL, NULL, TO_DATE('2024-11-04 09:17:08', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-04 09:17:08', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('10', NULL, '1', '测试模版', '***************测试模版', '0', '0', '1', NULL, NULL, NULL, '0', '0', '1', '1', NULL, NULL, TO_DATE('2024-11-04 09:17:27', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-04 09:17:27', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('11', NULL, '1', '测试模版', '***************测试模版', '0', '0', '1', NULL, NULL, NULL, '1', '0', '1', '0', NULL, NULL, TO_DATE('2024-11-04 09:17:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-04 09:17:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('12', NULL, '1', '测试模版', '***************测试模版', '0', '0', '1', NULL, NULL, NULL, '1', '0', '1', '0', NULL, NULL, TO_DATE('2024-11-04 09:17:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-04 09:17:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('13', NULL, '1', '测试模版', '111111111111测试模版', '0', '0', '1', NULL, NULL, NULL, '1', '0', '1', '0', NULL, NULL, TO_DATE('2024-11-04 09:21:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-04 09:21:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message VALUES ('14', NULL, '1', '测试模版', '111111111111测试模版', '0', '0', '1', NULL, NULL, NULL, '1', '0', '1', '1', NULL, NULL, TO_DATE('2024-11-04 09:21:36', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-04 09:21:36', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for message_template
-- ----------------------------
DROP TABLE ANIVIA.message_template;
CREATE TABLE ANIVIA.message_template (
  id NUMBER(11,0) VISIBLE NOT NULL,
  title NVARCHAR2(128) VISIBLE NOT NULL,
  content NCLOB VISIBLE NOT NULL,
  category NUMBER(4,0) VISIBLE NOT NULL,
  msg_level NUMBER(4,0) VISIBLE NOT NULL,
  valid_flag NUMBER(4,0) VISIBLE NOT NULL,
  del_flag NUMBER(4,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(32) VISIBLE,
  creator_id NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE NOT NULL,
  update_by NVARCHAR2(32) VISIBLE,
  updator_id NUMBER(20,0) VISIBLE,
  update_time DATE VISIBLE NOT NULL,
  remark NVARCHAR2(512) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.message_template.id IS 'ID';
COMMENT ON COLUMN ANIVIA.message_template.title IS '消息标题';
COMMENT ON COLUMN ANIVIA.message_template.content IS '消息模板内容';
COMMENT ON COLUMN ANIVIA.message_template.category IS '消息类别';
COMMENT ON COLUMN ANIVIA.message_template.msg_level IS '消息等级';
COMMENT ON COLUMN ANIVIA.message_template.valid_flag IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN ANIVIA.message_template.del_flag IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN ANIVIA.message_template.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.message_template.creator_id IS '创建人id';
COMMENT ON COLUMN ANIVIA.message_template.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.message_template.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.message_template.updator_id IS '更新人id';
COMMENT ON COLUMN ANIVIA.message_template.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.message_template.remark IS '备注';
COMMENT ON TABLE ANIVIA.message_template IS '消息模板';

-- ----------------------------
-- Records of message_template
-- ----------------------------
INSERT INTO ANIVIA.message_template VALUES ('1', '测试模版', '${test}测试模版', '0', '0', '1', '0', NULL, '1', TO_DATE('2024-11-01 10:35:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', TO_DATE('2024-11-08 11:40:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.message_template VALUES ('2', '测试', '2', '0', '0', '1', '0', 'admin', '1', TO_DATE('2024-11-20 11:12:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-11-20 11:12:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for pro_plan
-- ----------------------------
DROP TABLE ANIVIA.pro_plan;
CREATE TABLE ANIVIA.pro_plan (
  id NUMBER(20,0) VISIBLE NOT NULL,
  company_id NUMBER(20,0) VISIBLE,
  subsidiary_id NUMBER(20,0) VISIBLE,
  sale_id NUMBER(20,0) VISIBLE,
  sale_code NVARCHAR2(32) VISIBLE,
  code NVARCHAR2(32) VISIBLE NOT NULL,
  product_id NUMBER(20,0) VISIBLE NOT NULL,
  product_code NVARCHAR2(32) VISIBLE NOT NULL,
  split_route_type NUMBER(4,0) VISIBLE NOT NULL,
  pro_bom_id NUMBER(20,0) VISIBLE,
  pro_bom_code NVARCHAR2(32) VISIBLE,
  route_id NUMBER(20,0) VISIBLE,
  route_code NVARCHAR2(32) VISIBLE,
  status NUMBER(4,0) VISIBLE NOT NULL,
  plan_number NUMBER(11,0) VISIBLE NOT NULL,
  begin_time DATE VISIBLE NOT NULL,
  end_time DATE VISIBLE NOT NULL,
  attachment NCLOB VISIBLE,
  valid_flag NUMBER(4,0) VISIBLE NOT NULL,
  del_flag NUMBER(4,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(32) VISIBLE,
  creator_id NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE NOT NULL,
  update_by NVARCHAR2(32) VISIBLE,
  updator_id NUMBER(20,0) VISIBLE,
  update_time DATE VISIBLE NOT NULL,
  remark NCLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.pro_plan.id IS 'ID';
COMMENT ON COLUMN ANIVIA.pro_plan.company_id IS '所属母公司id';
COMMENT ON COLUMN ANIVIA.pro_plan.subsidiary_id IS '所属子公司id';
COMMENT ON COLUMN ANIVIA.pro_plan.sale_id IS '销售单id';
COMMENT ON COLUMN ANIVIA.pro_plan.sale_code IS '销售单号';
COMMENT ON COLUMN ANIVIA.pro_plan.code IS '计划单号';
COMMENT ON COLUMN ANIVIA.pro_plan.product_id IS '产品id';
COMMENT ON COLUMN ANIVIA.pro_plan.product_code IS '产品编码';
COMMENT ON COLUMN ANIVIA.pro_plan.split_route_type IS '拆单工艺类型';
COMMENT ON COLUMN ANIVIA.pro_plan.pro_bom_id IS '生产BOMid';
COMMENT ON COLUMN ANIVIA.pro_plan.pro_bom_code IS '生产BOM编码';
COMMENT ON COLUMN ANIVIA.pro_plan.route_id IS '工艺路线id';
COMMENT ON COLUMN ANIVIA.pro_plan.route_code IS '工艺路线编码';
COMMENT ON COLUMN ANIVIA.pro_plan.status IS '状态';
COMMENT ON COLUMN ANIVIA.pro_plan.plan_number IS '计划数量';
COMMENT ON COLUMN ANIVIA.pro_plan.begin_time IS '计划开始时间';
COMMENT ON COLUMN ANIVIA.pro_plan.end_time IS '计划结束时间';
COMMENT ON COLUMN ANIVIA.pro_plan.attachment IS '附件';
COMMENT ON COLUMN ANIVIA.pro_plan.valid_flag IS '是否有效';
COMMENT ON COLUMN ANIVIA.pro_plan.del_flag IS '删除标志';
COMMENT ON COLUMN ANIVIA.pro_plan.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.pro_plan.creator_id IS '创建人id';
COMMENT ON COLUMN ANIVIA.pro_plan.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.pro_plan.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.pro_plan.updator_id IS '更新人id';
COMMENT ON COLUMN ANIVIA.pro_plan.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.pro_plan.remark IS '备注';
COMMENT ON TABLE ANIVIA.pro_plan IS '生产计划';

-- ----------------------------
-- Records of pro_plan
-- ----------------------------

-- ----------------------------
-- Table structure for pro_task_receive
-- ----------------------------
DROP TABLE ANIVIA.pro_task_receive;
CREATE TABLE ANIVIA.pro_task_receive (
  id NUMBER(20,0) VISIBLE NOT NULL,
  company_id NUMBER(20,0) VISIBLE,
  subsidiary_id NUMBER(20,0) VISIBLE,
  task_id NUMBER(20,0) VISIBLE NOT NULL,
  task_code NVARCHAR2(32) VISIBLE NOT NULL,
  order_id NUMBER(20,0) VISIBLE NOT NULL,
  order_code NVARCHAR2(32) VISIBLE NOT NULL,
  reveive_time DATE VISIBLE NOT NULL,
  material_id NUMBER(20,0) VISIBLE NOT NULL,
  material_code NVARCHAR2(32) VISIBLE NOT NULL,
  staff_id NUMBER(20,0) VISIBLE NOT NULL,
  count NUMBER VISIBLE NOT NULL,
  unit_id NUMBER(20,0) VISIBLE NOT NULL,
  unit_code NVARCHAR2(32) VISIBLE NOT NULL,
  store_id NUMBER(20,0) VISIBLE,
  store_code NVARCHAR2(32) VISIBLE,
  store_location_id NUMBER(20,0) VISIBLE,
  store_location_code NVARCHAR2(32) VISIBLE,
  valid_flag NUMBER(4,0) VISIBLE NOT NULL,
  del_flag NUMBER(4,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(32) VISIBLE,
  creator_id NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE NOT NULL,
  update_by NVARCHAR2(32) VISIBLE,
  updator_id NUMBER(20,0) VISIBLE,
  update_time DATE VISIBLE NOT NULL,
  remark NCLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.pro_task_receive.id IS 'ID';
COMMENT ON COLUMN ANIVIA.pro_task_receive.company_id IS '所属母公司id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.subsidiary_id IS '所属子公司id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.task_id IS '任务id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.task_code IS '任务编号';
COMMENT ON COLUMN ANIVIA.pro_task_receive.order_id IS '工单id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.order_code IS '工单编号';
COMMENT ON COLUMN ANIVIA.pro_task_receive.reveive_time IS '领料日期';
COMMENT ON COLUMN ANIVIA.pro_task_receive.material_id IS '物料id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.material_code IS '物料编码';
COMMENT ON COLUMN ANIVIA.pro_task_receive.staff_id IS '领料人id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.count IS '领料数量';
COMMENT ON COLUMN ANIVIA.pro_task_receive.unit_id IS '单位id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.unit_code IS '单位编号';
COMMENT ON COLUMN ANIVIA.pro_task_receive.store_id IS '仓库id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.store_code IS '仓库编码';
COMMENT ON COLUMN ANIVIA.pro_task_receive.store_location_id IS '所属库位id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.store_location_code IS '所属库位编码';
COMMENT ON COLUMN ANIVIA.pro_task_receive.valid_flag IS '是否有效';
COMMENT ON COLUMN ANIVIA.pro_task_receive.del_flag IS '删除标志';
COMMENT ON COLUMN ANIVIA.pro_task_receive.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.pro_task_receive.creator_id IS '创建人id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.pro_task_receive.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.pro_task_receive.updator_id IS '更新人id';
COMMENT ON COLUMN ANIVIA.pro_task_receive.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.pro_task_receive.remark IS '备注';
COMMENT ON TABLE ANIVIA.pro_task_receive IS '生产领料记录';

-- ----------------------------
-- Records of pro_task_receive
-- ----------------------------
INSERT INTO ANIVIA.pro_task_receive VALUES ('1', NULL, NULL, '1', '1', '1', '1', TO_DATE('2024-11-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, NULL, '1', '1', 'admin', '1', TO_DATE('2024-11-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-26 11:42:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE ANIVIA.qrtz_blob_triggers;
CREATE TABLE ANIVIA.qrtz_blob_triggers (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  trigger_name NVARCHAR2(200) VISIBLE NOT NULL,
  trigger_group NVARCHAR2(200) VISIBLE NOT NULL,
  blob_data BLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_blob_triggers.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_blob_triggers.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN ANIVIA.qrtz_blob_triggers.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN ANIVIA.qrtz_blob_triggers.blob_data IS '存放持久化Trigger对象';
COMMENT ON TABLE ANIVIA.qrtz_blob_triggers IS 'Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE ANIVIA.qrtz_calendars;
CREATE TABLE ANIVIA.qrtz_calendars (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  calendar_name NVARCHAR2(200) VISIBLE NOT NULL,
  calendar BLOB VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_calendars.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_calendars.calendar_name IS '日历名称';
COMMENT ON COLUMN ANIVIA.qrtz_calendars.calendar IS '存放持久化calendar对象';
COMMENT ON TABLE ANIVIA.qrtz_calendars IS '日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE ANIVIA.qrtz_cron_triggers;
CREATE TABLE ANIVIA.qrtz_cron_triggers (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  trigger_name NVARCHAR2(200) VISIBLE NOT NULL,
  trigger_group NVARCHAR2(200) VISIBLE NOT NULL,
  cron_expression NVARCHAR2(200) VISIBLE NOT NULL,
  time_zone_id NVARCHAR2(80) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_cron_triggers.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_cron_triggers.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN ANIVIA.qrtz_cron_triggers.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN ANIVIA.qrtz_cron_triggers.cron_expression IS 'cron表达式';
COMMENT ON COLUMN ANIVIA.qrtz_cron_triggers.time_zone_id IS '时区';
COMMENT ON TABLE ANIVIA.qrtz_cron_triggers IS 'Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO ANIVIA.qrtz_cron_triggers VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO ANIVIA.qrtz_cron_triggers VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO ANIVIA.qrtz_cron_triggers VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE ANIVIA.qrtz_fired_triggers;
CREATE TABLE ANIVIA.qrtz_fired_triggers (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  entry_id NVARCHAR2(95) VISIBLE NOT NULL,
  trigger_name NVARCHAR2(200) VISIBLE NOT NULL,
  trigger_group NVARCHAR2(200) VISIBLE NOT NULL,
  instance_name NVARCHAR2(200) VISIBLE NOT NULL,
  fired_time NUMBER(20,0) VISIBLE NOT NULL,
  sched_time NUMBER(20,0) VISIBLE NOT NULL,
  priority NUMBER(11,0) VISIBLE NOT NULL,
  state NVARCHAR2(16) VISIBLE NOT NULL,
  job_name NVARCHAR2(200) VISIBLE,
  job_group NVARCHAR2(200) VISIBLE,
  is_nonconcurrent NVARCHAR2(1) VISIBLE,
  requests_recovery NVARCHAR2(1) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.entry_id IS '调度器实例id';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.instance_name IS '调度器实例名';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.fired_time IS '触发的时间';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.sched_time IS '定时器制定的时间';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.priority IS '优先级';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.state IS '状态';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.job_name IS '任务名称';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.job_group IS '任务组名';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.is_nonconcurrent IS '是否并发';
COMMENT ON COLUMN ANIVIA.qrtz_fired_triggers.requests_recovery IS '是否接受恢复执行';
COMMENT ON TABLE ANIVIA.qrtz_fired_triggers IS '已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE ANIVIA.qrtz_job_details;
CREATE TABLE ANIVIA.qrtz_job_details (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  job_name NVARCHAR2(200) VISIBLE NOT NULL,
  job_group NVARCHAR2(200) VISIBLE NOT NULL,
  description NVARCHAR2(250) VISIBLE,
  job_class_name NVARCHAR2(250) VISIBLE NOT NULL,
  is_durable NVARCHAR2(1) VISIBLE NOT NULL,
  is_nonconcurrent NVARCHAR2(1) VISIBLE NOT NULL,
  is_update_data NVARCHAR2(1) VISIBLE NOT NULL,
  requests_recovery NVARCHAR2(1) VISIBLE NOT NULL,
  job_data BLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_job_details.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.job_name IS '任务名称';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.job_group IS '任务组名';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.description IS '相关介绍';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.job_class_name IS '执行任务类名称';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.is_durable IS '是否持久化';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.is_nonconcurrent IS '是否并发';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.is_update_data IS '是否更新数据';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.requests_recovery IS '是否接受恢复执行';
COMMENT ON COLUMN ANIVIA.qrtz_job_details.job_data IS '存放持久化job对象';
COMMENT ON TABLE ANIVIA.qrtz_job_details IS '任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO ANIVIA.qrtz_job_details VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', HEXTORAW('ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800'));
INSERT INTO ANIVIA.qrtz_job_details VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', HEXTORAW('ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800'));
INSERT INTO ANIVIA.qrtz_job_details VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', HEXTORAW('ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800'));

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE ANIVIA.qrtz_locks;
CREATE TABLE ANIVIA.qrtz_locks (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  lock_name NVARCHAR2(40) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_locks.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_locks.lock_name IS '悲观锁名称';
COMMENT ON TABLE ANIVIA.qrtz_locks IS '存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO ANIVIA.qrtz_locks VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE ANIVIA.qrtz_paused_trigger_grps;
CREATE TABLE ANIVIA.qrtz_paused_trigger_grps (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  trigger_group NVARCHAR2(200) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_paused_trigger_grps.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_paused_trigger_grps.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON TABLE ANIVIA.qrtz_paused_trigger_grps IS '暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE ANIVIA.qrtz_scheduler_state;
CREATE TABLE ANIVIA.qrtz_scheduler_state (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  instance_name NVARCHAR2(200) VISIBLE NOT NULL,
  last_checkin_time NUMBER(20,0) VISIBLE NOT NULL,
  checkin_interval NUMBER(20,0) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_scheduler_state.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_scheduler_state.instance_name IS '实例名称';
COMMENT ON COLUMN ANIVIA.qrtz_scheduler_state.last_checkin_time IS '上次检查时间';
COMMENT ON COLUMN ANIVIA.qrtz_scheduler_state.checkin_interval IS '检查间隔时间';
COMMENT ON TABLE ANIVIA.qrtz_scheduler_state IS '调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE ANIVIA.qrtz_simple_triggers;
CREATE TABLE ANIVIA.qrtz_simple_triggers (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  trigger_name NVARCHAR2(200) VISIBLE NOT NULL,
  trigger_group NVARCHAR2(200) VISIBLE NOT NULL,
  repeat_count NUMBER(20,0) VISIBLE NOT NULL,
  repeat_interval NUMBER(20,0) VISIBLE NOT NULL,
  times_triggered NUMBER(20,0) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_simple_triggers.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_simple_triggers.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN ANIVIA.qrtz_simple_triggers.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN ANIVIA.qrtz_simple_triggers.repeat_count IS '重复的次数统计';
COMMENT ON COLUMN ANIVIA.qrtz_simple_triggers.repeat_interval IS '重复的间隔时间';
COMMENT ON COLUMN ANIVIA.qrtz_simple_triggers.times_triggered IS '已经触发的次数';
COMMENT ON TABLE ANIVIA.qrtz_simple_triggers IS '简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE ANIVIA.qrtz_simprop_triggers;
CREATE TABLE ANIVIA.qrtz_simprop_triggers (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  trigger_name NVARCHAR2(200) VISIBLE NOT NULL,
  trigger_group NVARCHAR2(200) VISIBLE NOT NULL,
  str_prop_1 NVARCHAR2(512) VISIBLE,
  str_prop_2 NVARCHAR2(512) VISIBLE,
  str_prop_3 NVARCHAR2(512) VISIBLE,
  int_prop_1 NUMBER(11,0) VISIBLE,
  int_prop_2 NUMBER(11,0) VISIBLE,
  long_prop_1 NUMBER(20,0) VISIBLE,
  long_prop_2 NUMBER(20,0) VISIBLE,
  dec_prop_1 NUMBER VISIBLE,
  dec_prop_2 NUMBER VISIBLE,
  bool_prop_1 NVARCHAR2(1) VISIBLE,
  bool_prop_2 NVARCHAR2(1) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.str_prop_1 IS 'String类型的trigger的第一个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.str_prop_2 IS 'String类型的trigger的第二个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.str_prop_3 IS 'String类型的trigger的第三个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.int_prop_1 IS 'int类型的trigger的第一个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.int_prop_2 IS 'int类型的trigger的第二个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.long_prop_1 IS 'long类型的trigger的第一个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.long_prop_2 IS 'long类型的trigger的第二个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.dec_prop_1 IS 'decimal类型的trigger的第一个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.dec_prop_2 IS 'decimal类型的trigger的第二个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.bool_prop_1 IS 'Boolean类型的trigger的第一个参数';
COMMENT ON COLUMN ANIVIA.qrtz_simprop_triggers.bool_prop_2 IS 'Boolean类型的trigger的第二个参数';
COMMENT ON TABLE ANIVIA.qrtz_simprop_triggers IS '同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE ANIVIA.qrtz_triggers;
CREATE TABLE ANIVIA.qrtz_triggers (
  sched_name NVARCHAR2(120) VISIBLE NOT NULL,
  trigger_name NVARCHAR2(200) VISIBLE NOT NULL,
  trigger_group NVARCHAR2(200) VISIBLE NOT NULL,
  job_name NVARCHAR2(200) VISIBLE NOT NULL,
  job_group NVARCHAR2(200) VISIBLE NOT NULL,
  description NVARCHAR2(250) VISIBLE,
  next_fire_time NUMBER(20,0) VISIBLE,
  prev_fire_time NUMBER(20,0) VISIBLE,
  priority NUMBER(11,0) VISIBLE,
  trigger_state NVARCHAR2(16) VISIBLE NOT NULL,
  trigger_type NVARCHAR2(8) VISIBLE NOT NULL,
  start_time NUMBER(20,0) VISIBLE NOT NULL,
  end_time NUMBER(20,0) VISIBLE,
  calendar_name NVARCHAR2(200) VISIBLE,
  misfire_instr NUMBER(6,0) VISIBLE,
  job_data BLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.qrtz_triggers.sched_name IS '调度名称';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.trigger_name IS '触发器的名字';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.trigger_group IS '触发器所属组的名字';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.job_name IS 'qrtz_job_details表job_name的外键';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.job_group IS 'qrtz_job_details表job_group的外键';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.description IS '相关介绍';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.next_fire_time IS '上一次触发时间（毫秒）';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.prev_fire_time IS '下一次触发时间（默认为-1表示不触发）';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.priority IS '优先级';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.trigger_state IS '触发器状态';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.trigger_type IS '触发器的类型';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.start_time IS '开始时间';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.end_time IS '结束时间';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.calendar_name IS '日程表名称';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.misfire_instr IS '补偿执行的策略';
COMMENT ON COLUMN ANIVIA.qrtz_triggers.job_data IS '存放持久化job对象';
COMMENT ON TABLE ANIVIA.qrtz_triggers IS '触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO ANIVIA.qrtz_triggers VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, '1723915630000', '-1', '5', 'PAUSED', 'CRON', '1723915630000', '0', NULL, '2', EMPTY_BLOB());
INSERT INTO ANIVIA.qrtz_triggers VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, '1723915635000', '-1', '5', 'PAUSED', 'CRON', '1723915631000', '0', NULL, '2', EMPTY_BLOB());
INSERT INTO ANIVIA.qrtz_triggers VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, '1723915640000', '-1', '5', 'PAUSED', 'CRON', '1723915632000', '0', NULL, '2', EMPTY_BLOB());

-- ----------------------------
-- Table structure for rel_user_auth_product
-- ----------------------------
DROP TABLE ANIVIA.rel_user_auth_product;
CREATE TABLE ANIVIA.rel_user_auth_product (
  user_id NUMBER(20,0) VISIBLE NOT NULL,
  auth_id NVARCHAR2(256) VISIBLE NOT NULL,
  auth_product_type NUMBER(4,0) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.rel_user_auth_product.user_id IS '用户ID';
COMMENT ON COLUMN ANIVIA.rel_user_auth_product.auth_id IS '统一身份认证id';
COMMENT ON COLUMN ANIVIA.rel_user_auth_product.auth_product_type IS '认证平台类型;0：冰凤框架；1：微信；2：支付宝';
COMMENT ON TABLE ANIVIA.rel_user_auth_product IS '用户与认证中心关系表';

-- ----------------------------
-- Records of rel_user_auth_product
-- ----------------------------
INSERT INTO ANIVIA.rel_user_auth_product VALUES ('1', '1', '0');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE ANIVIA.system_config;
CREATE TABLE ANIVIA.system_config (
  config_id NUMBER(11,0) VISIBLE NOT NULL,
  config_name NVARCHAR2(100) VISIBLE,
  config_key NVARCHAR2(100) VISIBLE,
  config_value NVARCHAR2(500) VISIBLE,
  config_type NCHAR(1) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_config.config_id IS '参数主键';
COMMENT ON COLUMN ANIVIA.system_config.config_name IS '参数名称';
COMMENT ON COLUMN ANIVIA.system_config.config_key IS '参数键名';
COMMENT ON COLUMN ANIVIA.system_config.config_value IS '参数键值';
COMMENT ON COLUMN ANIVIA.system_config.config_type IS '系统内置（Y是 N否）';
COMMENT ON COLUMN ANIVIA.system_config.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_config.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_config.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_config.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_config.remark IS '备注';
COMMENT ON TABLE ANIVIA.system_config IS '参数配置表';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO ANIVIA.system_config VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO ANIVIA.system_config VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '初始化密码 123456');
INSERT INTO ANIVIA.system_config VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO ANIVIA.system_config VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO ANIVIA.system_config VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO ANIVIA.system_config VALUES ('6', '用户登录-黑名单列表', 'sys.login.blackIPList', '-', 'Y', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:51:27', 'SYYYY-MM-DD HH24:MI:SS'), '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE ANIVIA.system_dept;
CREATE TABLE ANIVIA.system_dept (
  dept_id NUMBER(20,0) VISIBLE NOT NULL,
  parent_id NUMBER(20,0) VISIBLE,
  ancestors NVARCHAR2(50) VISIBLE,
  dept_name NVARCHAR2(30) VISIBLE,
  order_num NUMBER(11,0) VISIBLE,
  leader NVARCHAR2(20) VISIBLE,
  phone NVARCHAR2(11) VISIBLE,
  email NVARCHAR2(50) VISIBLE,
  status NCHAR(1) VISIBLE,
  del_flag NCHAR(1) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_dept.dept_id IS '部门id';
COMMENT ON COLUMN ANIVIA.system_dept.parent_id IS '父部门id';
COMMENT ON COLUMN ANIVIA.system_dept.ancestors IS '祖级列表';
COMMENT ON COLUMN ANIVIA.system_dept.dept_name IS '部门名称';
COMMENT ON COLUMN ANIVIA.system_dept.order_num IS '显示顺序';
COMMENT ON COLUMN ANIVIA.system_dept.leader IS '负责人';
COMMENT ON COLUMN ANIVIA.system_dept.phone IS '联系电话';
COMMENT ON COLUMN ANIVIA.system_dept.email IS '邮箱';
COMMENT ON COLUMN ANIVIA.system_dept.status IS '部门状态（0正常 1停用）';
COMMENT ON COLUMN ANIVIA.system_dept.del_flag IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN ANIVIA.system_dept.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_dept.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_dept.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_dept.update_time IS '更新时间';
COMMENT ON TABLE ANIVIA.system_dept IS '部门表';

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO ANIVIA.system_dept VALUES ('100', '0', '0', '千桐科技', '0', '千桐', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-10-29 16:51:32', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_dept VALUES ('101', '100', '0,100', '南京总公司', '1', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 13:46:24', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_dept VALUES ('102', '100', '0,100', '郑州分公司', '2', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 13:46:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_dept VALUES ('103', '101', '0,100,101', '研发部门', '1', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO ANIVIA.system_dept VALUES ('104', '101', '0,100,101', '市场部门', '2', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO ANIVIA.system_dept VALUES ('105', '101', '0,100,101', '测试部门', '3', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO ANIVIA.system_dept VALUES ('106', '101', '0,100,101', '财务部门', '4', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO ANIVIA.system_dept VALUES ('107', '101', '0,100,101', '运维部门', '5', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:50:19', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_dept VALUES ('108', '102', '0,100,102', '市场部门', '1', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO ANIVIA.system_dept VALUES ('109', '102', '0,100,102', '财务部门', '2', '冰凤', '15888888888', 'bf@qq.com', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE ANIVIA.system_dict_data;
CREATE TABLE ANIVIA.system_dict_data (
  dict_code NUMBER(20,0) VISIBLE NOT NULL,
  dict_sort NUMBER(11,0) VISIBLE,
  dict_label NVARCHAR2(100) VISIBLE,
  dict_value NVARCHAR2(100) VISIBLE,
  dict_type NVARCHAR2(100) VISIBLE,
  css_class NVARCHAR2(100) VISIBLE,
  list_class NVARCHAR2(100) VISIBLE,
  is_default NCHAR(1) VISIBLE,
  status NCHAR(1) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_dict_data.dict_code IS '字典编码';
COMMENT ON COLUMN ANIVIA.system_dict_data.dict_sort IS '字典排序';
COMMENT ON COLUMN ANIVIA.system_dict_data.dict_label IS '字典标签';
COMMENT ON COLUMN ANIVIA.system_dict_data.dict_value IS '字典键值';
COMMENT ON COLUMN ANIVIA.system_dict_data.dict_type IS '字典类型';
COMMENT ON COLUMN ANIVIA.system_dict_data.css_class IS '样式属性（其他样式扩展）';
COMMENT ON COLUMN ANIVIA.system_dict_data.list_class IS '表格回显样式';
COMMENT ON COLUMN ANIVIA.system_dict_data.is_default IS '是否默认（Y是 N否）';
COMMENT ON COLUMN ANIVIA.system_dict_data.status IS '状态（0正常 1停用）';
COMMENT ON COLUMN ANIVIA.system_dict_data.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_dict_data.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_dict_data.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_dict_data.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_dict_data.remark IS '备注';
COMMENT ON TABLE ANIVIA.system_dict_data IS '字典数据表';

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
INSERT INTO ANIVIA.system_dict_data VALUES ('1', '1', '男', '0', 'sys_user_sex', NULL, NULL, 'Y', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '性别男');
INSERT INTO ANIVIA.system_dict_data VALUES ('2', '2', '女', '1', 'sys_user_sex', NULL, NULL, 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '性别女');
INSERT INTO ANIVIA.system_dict_data VALUES ('3', '3', '未知', '2', 'sys_user_sex', NULL, NULL, 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '性别未知');
INSERT INTO ANIVIA.system_dict_data VALUES ('4', '1', '显示', '0', 'sys_show_hide', NULL, 'primary', 'Y', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '显示菜单');
INSERT INTO ANIVIA.system_dict_data VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '隐藏菜单');
INSERT INTO ANIVIA.system_dict_data VALUES ('6', '1', '正常', '0', 'sys_normal_disable', NULL, 'primary', 'Y', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '正常状态');
INSERT INTO ANIVIA.system_dict_data VALUES ('7', '2', '停用', '1', 'sys_normal_disable', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '停用状态');
INSERT INTO ANIVIA.system_dict_data VALUES ('8', '1', '正常', '0', 'sys_job_status', NULL, 'primary', 'Y', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '正常状态');
INSERT INTO ANIVIA.system_dict_data VALUES ('9', '2', '暂停', '1', 'sys_job_status', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '停用状态');
INSERT INTO ANIVIA.system_dict_data VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', NULL, NULL, 'Y', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '默认分组');
INSERT INTO ANIVIA.system_dict_data VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', NULL, NULL, 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '系统分组');
INSERT INTO ANIVIA.system_dict_data VALUES ('12', '1', '是', 'Y', 'sys_yes_no', NULL, 'primary', 'Y', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '系统默认是');
INSERT INTO ANIVIA.system_dict_data VALUES ('13', '2', '否', 'N', 'sys_yes_no', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '系统默认否');
INSERT INTO ANIVIA.system_dict_data VALUES ('14', '1', '通知', '1', 'sys_notice_type', NULL, 'warning', 'Y', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '通知');
INSERT INTO ANIVIA.system_dict_data VALUES ('15', '2', '公告', '2', 'sys_notice_type', NULL, 'success', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '公告');
INSERT INTO ANIVIA.system_dict_data VALUES ('16', '1', '正常', '0', 'sys_notice_status', NULL, 'primary', 'Y', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '正常状态');
INSERT INTO ANIVIA.system_dict_data VALUES ('17', '2', '关闭', '1', 'sys_notice_status', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '关闭状态');
INSERT INTO ANIVIA.system_dict_data VALUES ('18', '99', '其他', '0', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '其他操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('19', '1', '新增', '1', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '新增操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('20', '2', '修改', '2', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '修改操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('21', '3', '删除', '3', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '删除操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('22', '4', '授权', '4', 'sys_oper_type', NULL, 'primary', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '授权操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('23', '5', '导出', '5', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '导出操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('24', '6', '导入', '6', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '导入操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('25', '7', '强退', '7', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '强退操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '生成操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '清空操作');
INSERT INTO ANIVIA.system_dict_data VALUES ('28', '1', '成功', '0', 'sys_common_status', NULL, 'primary', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '正常状态');
INSERT INTO ANIVIA.system_dict_data VALUES ('29', '2', '失败', '1', 'sys_common_status', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '停用状态');
INSERT INTO ANIVIA.system_dict_data VALUES ('30', '0', 'Web', '0', 'auth_app_type', NULL, 'primary', 'N', '0', 'admin', TO_DATE('2024-08-31 14:27:22', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-08-31 14:27:31', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('31', '1', 'App', '1', 'auth_app_type', NULL, 'info', 'N', '0', 'admin', TO_DATE('2024-08-31 14:27:47', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('32', '2', '小程序', '2', 'auth_app_type', NULL, 'warning', 'N', '0', 'admin', TO_DATE('2024-08-31 14:28:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('33', '1', '有效', '1', 'sys_valid', NULL, 'success', 'N', '0', 'admin', TO_DATE('2024-08-31 15:33:49', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-08-31 15:34:08', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('34', '0', '无效', '0', 'sys_valid', NULL, 'danger', 'N', '0', 'admin', TO_DATE('2024-08-31 15:34:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('35', '0', '非公开', '0', 'auth_public', NULL, 'warning', 'N', '0', 'admin', TO_DATE('2024-08-31 15:36:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('36', '1', '公开', '1', 'auth_public', NULL, 'success', 'N', '0', 'admin', TO_DATE('2024-08-31 15:36:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('37', '0', '通知', '0', 'message_category', NULL, 'success', 'N', '0', 'admin', TO_DATE('2024-11-07 14:28:29', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 16:55:20', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('38', '0', '重要', '0', 'message_level', NULL, 'default', 'N', '0', 'admin', TO_DATE('2024-11-07 14:28:42', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('39', '2', '审批', '2', 'message_category', NULL, 'warning', 'N', '0', 'admin', TO_DATE('2024-11-19 14:20:42', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 16:55:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('41', '3', '其他', '3', 'message_category', NULL, 'info', 'N', '0', 'admin', TO_DATE('2024-11-19 14:21:12', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 14:21:27', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_dict_data VALUES ('42', '1', '公告', '1', 'message_category', NULL, 'primary', 'N', '0', 'admin', TO_DATE('2024-11-19 16:54:18', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 16:55:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE ANIVIA.system_dict_type;
CREATE TABLE ANIVIA.system_dict_type (
  dict_id NUMBER(20,0) VISIBLE NOT NULL,
  dict_name NVARCHAR2(100) VISIBLE,
  dict_type NVARCHAR2(100) VISIBLE,
  status NCHAR(1) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_dict_type.dict_id IS '字典主键';
COMMENT ON COLUMN ANIVIA.system_dict_type.dict_name IS '字典名称';
COMMENT ON COLUMN ANIVIA.system_dict_type.dict_type IS '字典类型';
COMMENT ON COLUMN ANIVIA.system_dict_type.status IS '状态（0正常 1停用）';
COMMENT ON COLUMN ANIVIA.system_dict_type.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_dict_type.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_dict_type.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_dict_type.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_dict_type.remark IS '备注';
COMMENT ON TABLE ANIVIA.system_dict_type IS '字典类型表';

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
INSERT INTO ANIVIA.system_dict_type VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:51:04', 'SYYYY-MM-DD HH24:MI:SS'), '用户性别列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '菜单状态列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '系统开关列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '任务状态列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '任务分组列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '系统是否列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '通知类型列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '通知状态列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '操作类型列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '登录状态列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('11', '应用类型', 'auth_app_type', '0', 'admin', TO_DATE('2024-08-31 14:27:03', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '应用类型列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('12', '是否有效', 'sys_valid', '0', 'admin', TO_DATE('2024-08-31 15:33:08', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-08-31 15:36:13', 'SYYYY-MM-DD HH24:MI:SS'), '系统有效列表');
INSERT INTO ANIVIA.system_dict_type VALUES ('13', '是否公开', 'auth_public', '0', 'admin', TO_DATE('2024-08-31 15:35:49', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-08-31 15:36:00', 'SYYYY-MM-DD HH24:MI:SS'), '应用是否公开');
INSERT INTO ANIVIA.system_dict_type VALUES ('14', '消息类型', 'message_category', '0', 'admin', TO_DATE('2024-11-07 14:27:58', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_dict_type VALUES ('15', '消息等级', 'message_level', '0', 'admin', TO_DATE('2024-11-07 14:28:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE ANIVIA.system_job;
CREATE TABLE ANIVIA.system_job (
  job_id NUMBER(20,0) VISIBLE NOT NULL,
  job_name NVARCHAR2(64) VISIBLE NOT NULL,
  job_group NVARCHAR2(64) VISIBLE NOT NULL,
  invoke_target NVARCHAR2(500) VISIBLE NOT NULL,
  cron_expression NVARCHAR2(255) VISIBLE,
  misfire_policy NVARCHAR2(20) VISIBLE,
  concurrent NCHAR(1) VISIBLE,
  status NCHAR(1) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_job.job_id IS '任务ID';
COMMENT ON COLUMN ANIVIA.system_job.job_name IS '任务名称';
COMMENT ON COLUMN ANIVIA.system_job.job_group IS '任务组名';
COMMENT ON COLUMN ANIVIA.system_job.invoke_target IS '调用目标字符串';
COMMENT ON COLUMN ANIVIA.system_job.cron_expression IS 'cron执行表达式';
COMMENT ON COLUMN ANIVIA.system_job.misfire_policy IS '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';
COMMENT ON COLUMN ANIVIA.system_job.concurrent IS '是否并发执行（0允许 1禁止）';
COMMENT ON COLUMN ANIVIA.system_job.status IS '状态（0正常 1暂停）';
COMMENT ON COLUMN ANIVIA.system_job.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_job.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_job.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_job.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_job.remark IS '备注信息';
COMMENT ON TABLE ANIVIA.system_job IS '定时任务调度表';

-- ----------------------------
-- Records of system_job
-- ----------------------------

-- ----------------------------
-- Table structure for system_job_log
-- ----------------------------
DROP TABLE ANIVIA.system_job_log;
CREATE TABLE ANIVIA.system_job_log (
  job_log_id NUMBER(20,0) VISIBLE NOT NULL,
  job_name NVARCHAR2(64) VISIBLE NOT NULL,
  job_group NVARCHAR2(64) VISIBLE NOT NULL,
  invoke_target NVARCHAR2(500) VISIBLE NOT NULL,
  job_message NVARCHAR2(500) VISIBLE,
  status NCHAR(1) VISIBLE,
  exception_info NCLOB VISIBLE,
  create_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_job_log.job_log_id IS '任务日志ID';
COMMENT ON COLUMN ANIVIA.system_job_log.job_name IS '任务名称';
COMMENT ON COLUMN ANIVIA.system_job_log.job_group IS '任务组名';
COMMENT ON COLUMN ANIVIA.system_job_log.invoke_target IS '调用目标字符串';
COMMENT ON COLUMN ANIVIA.system_job_log.job_message IS '日志信息';
COMMENT ON COLUMN ANIVIA.system_job_log.status IS '执行状态（0正常 1失败）';
COMMENT ON COLUMN ANIVIA.system_job_log.exception_info IS '异常信息';
COMMENT ON COLUMN ANIVIA.system_job_log.create_time IS '创建时间';
COMMENT ON TABLE ANIVIA.system_job_log IS '定时任务调度日志表';

-- ----------------------------
-- Records of system_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_logininfor
-- ----------------------------
DROP TABLE ANIVIA.system_logininfor;
CREATE TABLE ANIVIA.system_logininfor (
  info_id NUMBER(20,0) VISIBLE NOT NULL,
  user_name NVARCHAR2(50) VISIBLE,
  ipaddr NVARCHAR2(128) VISIBLE,
  login_location NVARCHAR2(255) VISIBLE,
  browser NVARCHAR2(50) VISIBLE,
  os NVARCHAR2(50) VISIBLE,
  status NCHAR(1) VISIBLE,
  msg NVARCHAR2(255) VISIBLE,
  login_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_logininfor.info_id IS '访问ID';
COMMENT ON COLUMN ANIVIA.system_logininfor.user_name IS '用户账号';
COMMENT ON COLUMN ANIVIA.system_logininfor.ipaddr IS '登录IP地址';
COMMENT ON COLUMN ANIVIA.system_logininfor.login_location IS '登录地点';
COMMENT ON COLUMN ANIVIA.system_logininfor.browser IS '浏览器类型';
COMMENT ON COLUMN ANIVIA.system_logininfor.os IS '操作系统';
COMMENT ON COLUMN ANIVIA.system_logininfor.status IS '登录状态（0成功 1失败）';
COMMENT ON COLUMN ANIVIA.system_logininfor.msg IS '提示消息';
COMMENT ON COLUMN ANIVIA.system_logininfor.login_time IS '访问时间';
COMMENT ON TABLE ANIVIA.system_logininfor IS '系统访问记录';

-- ----------------------------
-- Records of system_logininfor
-- ----------------------------
INSERT INTO ANIVIA.system_logininfor VALUES ('1', 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', TO_DATE('2024-11-26 17:17:41', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('2', 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', TO_DATE('2024-11-26 17:17:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('3', 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Mac OS X', '0', '退出成功', TO_DATE('2024-11-26 17:24:21', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('4', 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Mac OS X', '0', '登录成功', TO_DATE('2024-11-26 17:26:18', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('5', 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Mac OS X', '0', '登录成功', TO_DATE('2024-11-27 09:05:11', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('6', 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', TO_DATE('2024-11-27 09:06:16', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('7', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', TO_DATE('2024-11-27 09:34:42', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('8', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', TO_DATE('2024-11-27 09:42:35', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('9', 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', TO_DATE('2024-11-27 09:53:31', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('10', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', TO_DATE('2024-11-27 13:31:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO ANIVIA.system_logininfor VALUES ('11', 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', TO_DATE('2024-11-27 13:57:02', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE ANIVIA.system_menu;
CREATE TABLE ANIVIA.system_menu (
  menu_id NUMBER(20,0) VISIBLE NOT NULL,
  menu_name NVARCHAR2(50) VISIBLE NOT NULL,
  parent_id NUMBER(20,0) VISIBLE,
  order_num NUMBER(11,0) VISIBLE,
  path NVARCHAR2(200) VISIBLE,
  component NVARCHAR2(50) VISIBLE,
  query NVARCHAR2(255) VISIBLE,
  is_frame NUMBER(11,0) VISIBLE,
  is_cache NUMBER(11,0) VISIBLE,
  route_name NVARCHAR2(255) VISIBLE,
  menu_type NCHAR(1) VISIBLE,
  visible NCHAR(1) VISIBLE,
  status NCHAR(1) VISIBLE,
  perms NVARCHAR2(100) VISIBLE,
  icon NVARCHAR2(100) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_menu.menu_id IS '菜单ID';
COMMENT ON COLUMN ANIVIA.system_menu.menu_name IS '菜单名称';
COMMENT ON COLUMN ANIVIA.system_menu.parent_id IS '父菜单ID';
COMMENT ON COLUMN ANIVIA.system_menu.order_num IS '显示顺序';
COMMENT ON COLUMN ANIVIA.system_menu.path IS '路由地址';
COMMENT ON COLUMN ANIVIA.system_menu.component IS '组件路径';
COMMENT ON COLUMN ANIVIA.system_menu.query IS '路由参数';
COMMENT ON COLUMN ANIVIA.system_menu.is_frame IS '是否为外链（0是 1否）';
COMMENT ON COLUMN ANIVIA.system_menu.is_cache IS '是否缓存（0缓存 1不缓存）';
COMMENT ON COLUMN ANIVIA.system_menu.route_name IS '路由名称';
COMMENT ON COLUMN ANIVIA.system_menu.menu_type IS '菜单类型（M目录 C菜单 F按钮）';
COMMENT ON COLUMN ANIVIA.system_menu.visible IS '菜单状态（0显示 1隐藏）';
COMMENT ON COLUMN ANIVIA.system_menu.status IS '菜单状态（0正常 1停用）';
COMMENT ON COLUMN ANIVIA.system_menu.perms IS '权限标识';
COMMENT ON COLUMN ANIVIA.system_menu.icon IS '菜单图标';
COMMENT ON COLUMN ANIVIA.system_menu.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_menu.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_menu.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_menu.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_menu.remark IS '备注';
COMMENT ON TABLE ANIVIA.system_menu IS '菜单权限表';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO ANIVIA.system_menu VALUES ('1', '系统管理', '0', '1', 'system', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'system', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '系统管理目录');
INSERT INTO ANIVIA.system_menu VALUES ('2', '系统监控', '0', '3', 'monitor', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'monitor', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:49:38', 'SYYYY-MM-DD HH24:MI:SS'), '系统监控目录');
INSERT INTO ANIVIA.system_menu VALUES ('3', '系统工具', '0', '3', 'tool', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'tool', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '系统工具目录');
INSERT INTO ANIVIA.system_menu VALUES ('100', '用户管理', '1', '1', 'user', 'system/system/user/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:user:list', 'user', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-10-14 16:18:24', 'SYYYY-MM-DD HH24:MI:SS'), '用户管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('101', '角色管理', '1', '2', 'role', 'system/system/role/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '角色管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/system/menu/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '菜单管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('103', '部门管理', '1', '4', 'dept', 'system/system/dept/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '部门管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('104', '岗位管理', '1', '5', 'post', 'system/system/post/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:post:list', 'post', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '岗位管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('105', '字典管理', '1', '6', 'dict', 'system/system/dict/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '字典管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('106', '参数设置', '1', '7', 'config', 'system/system/config/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:config:list', 'edit', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '参数设置菜单');
INSERT INTO ANIVIA.system_menu VALUES ('107', '通知公告', '1', '8', 'notice', 'system/system/notice/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:notice:list', 'message', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '通知公告菜单');
INSERT INTO ANIVIA.system_menu VALUES ('108', '日志管理', '1', '9', 'log', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'log', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '日志管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('109', '在线用户', '2', '1', 'online', 'system/monitor/online/index', NULL, '1', '0', NULL, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '在线用户菜单');
INSERT INTO ANIVIA.system_menu VALUES ('110', '定时任务', '2', '2', 'job', 'system/monitor/job/index', NULL, '1', '0', NULL, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '定时任务菜单');
INSERT INTO ANIVIA.system_menu VALUES ('111', '数据监控', '2', '3', 'druid', 'system/monitor/druid/index', NULL, '1', '0', NULL, 'C', '1', '1', 'monitor:druid:list', 'druid', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 14:06:21', 'SYYYY-MM-DD HH24:MI:SS'), '数据监控菜单');
INSERT INTO ANIVIA.system_menu VALUES ('112', '服务监控', '2', '4', 'server', 'system/monitor/server/index', NULL, '1', '0', NULL, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '服务监控菜单');
INSERT INTO ANIVIA.system_menu VALUES ('113', '缓存监控', '2', '5', 'cache', 'system/monitor/cache/index', NULL, '1', '0', NULL, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '缓存监控菜单');
INSERT INTO ANIVIA.system_menu VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'system/monitor/cache/list', NULL, '1', '0', NULL, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '缓存列表菜单');
INSERT INTO ANIVIA.system_menu VALUES ('115', '表单构建', '3', '1', 'build', 'system/tool/build/index', NULL, '1', '0', NULL, 'C', '1', '1', 'tool:build:list', 'build', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 14:05:59', 'SYYYY-MM-DD HH24:MI:SS'), '表单构建菜单');
INSERT INTO ANIVIA.system_menu VALUES ('116', '代码生成', '3', '2', 'gen', 'system/tool/gen/index', NULL, '1', '0', NULL, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '代码生成菜单');
INSERT INTO ANIVIA.system_menu VALUES ('117', '系统接口', '3', '3', 'swagger', 'system/tool/swagger/index', NULL, '1', '0', NULL, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '系统接口菜单');
INSERT INTO ANIVIA.system_menu VALUES ('500', '操作日志', '108', '1', 'operlog', 'system/monitor/operlog/index', NULL, '1', '0', NULL, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '操作日志菜单');
INSERT INTO ANIVIA.system_menu VALUES ('501', '登录日志', '108', '2', 'logininfor', 'system/monitor/logininfor/index', NULL, '1', '0', NULL, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '登录日志菜单');
INSERT INTO ANIVIA.system_menu VALUES ('1000', '用户查询', '100', '1', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:user:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1001', '用户新增', '100', '2', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:user:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1002', '用户修改', '100', '3', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:user:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1003', '用户删除', '100', '4', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:user:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1004', '用户导出', '100', '5', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:user:export', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1005', '用户导入', '100', '6', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:user:import', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1006', '重置密码', '100', '7', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1007', '角色查询', '101', '1', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:role:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1008', '角色新增', '101', '2', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:role:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1009', '角色修改', '101', '3', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:role:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1010', '角色删除', '101', '4', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:role:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1011', '角色导出', '101', '5', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:role:export', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1012', '菜单查询', '102', '1', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:menu:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1013', '菜单新增', '102', '2', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:menu:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1014', '菜单修改', '102', '3', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:menu:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1015', '菜单删除', '102', '4', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:menu:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1016', '部门查询', '103', '1', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dept:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1017', '部门新增', '103', '2', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dept:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1018', '部门修改', '103', '3', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dept:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1019', '部门删除', '103', '4', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dept:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1020', '岗位查询', '104', '1', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:post:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1021', '岗位新增', '104', '2', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:post:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1022', '岗位修改', '104', '3', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:post:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1023', '岗位删除', '104', '4', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:post:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1024', '岗位导出', '104', '5', NULL, NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:post:export', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1025', '字典查询', '105', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dict:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1026', '字典新增', '105', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dict:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1027', '字典修改', '105', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dict:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1028', '字典删除', '105', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dict:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1029', '字典导出', '105', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:dict:export', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1030', '参数查询', '106', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:config:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1031', '参数新增', '106', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:config:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1032', '参数修改', '106', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:config:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1033', '参数删除', '106', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:config:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1034', '参数导出', '106', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:config:export', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1035', '公告查询', '107', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:notice:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1036', '公告新增', '107', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:notice:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1037', '公告修改', '107', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:notice:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1038', '公告删除', '107', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:notice:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1039', '操作查询', '500', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1040', '操作删除', '500', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1041', '日志导出', '500', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1042', '登录查询', '501', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1043', '登录删除', '501', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1044', '日志导出', '501', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1045', '账户解锁', '501', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1046', '在线查询', '109', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:online:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1047', '批量强退', '109', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1048', '单条强退', '109', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1049', '任务查询', '110', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:job:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1050', '任务新增', '110', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:job:add', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1051', '任务修改', '110', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1052', '任务删除', '110', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1053', '状态修改', '110', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1054', '任务导出', '110', '6', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'monitor:job:export', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1055', '生成查询', '116', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'tool:gen:query', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1056', '生成修改', '116', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1057', '生成删除', '116', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1058', '导入代码', '116', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'tool:gen:import', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1059', '预览代码', '116', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('1060', '生成代码', '116', '6', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'tool:gen:code', '#', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2000', '流程管理', '0', '2', 'flyflow', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'example', 'admin', TO_DATE('2024-05-06 06:17:26', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-10-22 15:12:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2001', '流程组', '2002', '1', 'group', 'flyflow/flow/group', NULL, '1', '1', NULL, 'C', '0', '0', 'flyflow:flow:group', 'button', 'admin', TO_DATE('2024-05-06 08:28:25', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-06 12:03:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2002', '流程', '2000', '1', 'flow', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'component', 'admin', TO_DATE('2024-05-06 08:29:31', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-06 11:59:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2003', '流程列表', '2002', '2', 'list', 'flyflow/flow/list', NULL, '1', '1', NULL, 'C', '0', '0', 'flyflow:flow:list', 'date', 'admin', TO_DATE('2024-05-06 08:34:14', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-06 13:25:03', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2004', '创建流程', '2002', '1', 'create', 'flyflow/flow/create', NULL, '1', '1', NULL, 'C', '1', '0', 'flyflow:flow:create', 'component', 'admin', TO_DATE('2024-05-06 12:56:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2005', '任务管理', '2000', '3', 'task', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'date', 'admin', TO_DATE('2024-05-06 13:29:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2006', '待办任务', '2005', '1', 'todo', 'flyflow/task/pending', NULL, '1', '1', NULL, 'C', '0', '0', 'flyflow:task:pending', 'date', 'admin', TO_DATE('2024-05-06 13:30:36', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2007', '我的发起', '2005', '2', 'started', 'flyflow/task/started', NULL, '1', '1', NULL, 'C', '0', '0', 'flyflow:task:started', 'button', 'admin', TO_DATE('2024-05-06 13:32:07', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2008', '我的已办', '2005', '3', 'completed', 'flyflow/task/completed', NULL, '1', '1', NULL, 'C', '0', '0', 'flyflow:task:completed', 'download', 'admin', TO_DATE('2024-05-06 13:33:44', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2009', '抄送我的', '2005', '4', 'cc', 'flyflow/task/cc', NULL, '1', '1', NULL, 'C', '0', '0', 'flyflow:task:cc', 'example', 'admin', TO_DATE('2024-05-06 13:35:08', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-06 13:35:51', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2010', '数字证书', '1', '10', 'ca', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'password', 'admin', NULL, 'admin', TO_DATE('2024-11-06 15:28:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2011', '证书管理', '2010', '1', 'cert', 'system/ca/cert/index', NULL, '1', '0', NULL, 'C', '0', '0', 'ca:cert:list', '#', 'admin', TO_DATE('2024-08-18 01:49:14', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '证书管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('2012', '证书管理查询', '2010', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:cert:query', '#', 'admin', TO_DATE('2024-08-18 01:49:14', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2013', '证书管理新增', '2010', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:cert:add', '#', 'admin', TO_DATE('2024-08-18 01:49:14', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2014', '证书管理修改', '2010', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:cert:edit', '#', 'admin', TO_DATE('2024-08-18 01:49:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2015', '证书管理删除', '2010', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:cert:remove', '#', 'admin', TO_DATE('2024-08-18 01:49:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2016', '证书管理导出', '2010', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:cert:export', '#', 'admin', TO_DATE('2024-08-18 01:49:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2017', '主体管理', '2010', '0', 'subject', 'system/ca/subject/index', NULL, '1', '0', NULL, 'C', '0', '0', 'ca:subject:list', '#', 'admin', TO_DATE('2024-08-18 01:49:32', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-08-18 01:49:49', 'SYYYY-MM-DD HH24:MI:SS'), '主体管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('2018', '主体管理查询', '2017', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:subject:query', '#', 'admin', TO_DATE('2024-08-18 01:49:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2019', '主体管理新增', '2017', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:subject:add', '#', 'admin', TO_DATE('2024-08-18 01:49:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2020', '主体管理修改', '2017', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:subject:edit', '#', 'admin', TO_DATE('2024-08-18 01:49:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2021', '主体管理删除', '2017', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:subject:remove', '#', 'admin', TO_DATE('2024-08-18 01:49:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2022', '主体管理导出', '2017', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'ca:subject:export', '#', 'admin', TO_DATE('2024-08-18 01:49:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2023', '实例演示', '0', '4', 'example', NULL, NULL, '1', '0', NULL, 'M', '0', '0', NULL, 'code', 'admin', TO_DATE('2024-08-20 22:54:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2024', 'websocket', '2023', '0', 'websocket', 'example/websocket', NULL, '1', '0', NULL, 'C', '0', '0', NULL, NULL, 'admin', TO_DATE('2024-08-20 22:57:35', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-08-20 22:58:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2025', '支付演示', '2023', '1', 'pay', 'example/pay', NULL, '1', '0', 'pay', 'C', '0', '0', NULL, NULL, 'admin', TO_DATE('2024-08-25 16:33:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2026', '应用管理', '1', '1', 'client', 'system/auth/client/index', NULL, '1', '0', NULL, 'C', '0', '0', 'auth:client:list', 'github', 'admin', TO_DATE('2024-08-31 14:33:05', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 14:23:32', 'SYYYY-MM-DD HH24:MI:SS'), '应用管理菜单');
INSERT INTO ANIVIA.system_menu VALUES ('2027', '应用管理查询', '2026', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'auth:client:query', '#', 'admin', TO_DATE('2024-08-31 14:33:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2028', '应用管理新增', '2026', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'auth:client:add', '#', 'admin', TO_DATE('2024-08-31 14:33:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2029', '应用管理修改', '2026', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'auth:client:edit', '#', 'admin', TO_DATE('2024-08-31 14:33:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2030', '应用管理删除', '2026', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'auth:client:remove', '#', 'admin', TO_DATE('2024-08-31 14:33:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2031', '应用管理导出', '2026', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'auth:client:export', '#', 'admin', TO_DATE('2024-08-31 14:33:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2050', '示例用户', '2023', '1', 'user1', 'example/user/user/index', NULL, '1', '0', NULL, 'C', '0', '0', 'example:user:user:list', '#', 'admin', TO_DATE('2024-10-23 15:47:09', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-10-24 10:03:37', 'SYYYY-MM-DD HH24:MI:SS'), '示例用户菜单');
INSERT INTO ANIVIA.system_menu VALUES ('2051', '示例用户查询', '2050', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:user:query', '#', 'admin', TO_DATE('2024-10-23 15:47:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2052', '示例用户新增', '2050', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:user:add', '#', 'admin', TO_DATE('2024-10-23 15:47:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2053', '示例用户修改', '2050', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:user:edit', '#', 'admin', TO_DATE('2024-10-23 15:47:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2054', '示例用户删除', '2050', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:user:remove', '#', 'admin', TO_DATE('2024-10-23 15:47:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2055', '示例用户导出', '2050', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:user:export', '#', 'admin', TO_DATE('2024-10-23 15:47:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2062', '消息', '1', '1', 'message', 'system/message/message/index', NULL, '1', '0', NULL, 'C', '0', '1', 'system:message:message:list', '#', 'admin', TO_DATE('2024-11-01 09:51:29', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-01 09:52:41', 'SYYYY-MM-DD HH24:MI:SS'), '消息菜单');
INSERT INTO ANIVIA.system_menu VALUES ('2063', '消息查询', '2062', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:message:query', '#', 'admin', TO_DATE('2024-11-01 09:51:29', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2064', '消息新增', '2062', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:message:add', '#', 'admin', TO_DATE('2024-11-01 09:51:29', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2065', '消息修改', '2062', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:message:edit', '#', 'admin', TO_DATE('2024-11-01 09:51:29', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2066', '消息删除', '2062', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:message:remove', '#', 'admin', TO_DATE('2024-11-01 09:51:29', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2067', '消息导出', '2062', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:message:export', '#', 'admin', TO_DATE('2024-11-01 09:51:29', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2068', '消息模板', '1', '0', 'messageTemplate', 'system/system/messageTemplate/index', NULL, '1', '0', NULL, 'C', '0', '0', 'system:message:messageTemplate:list', 'email', 'admin', TO_DATE('2024-11-01 09:52:03', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-19 14:23:11', 'SYYYY-MM-DD HH24:MI:SS'), '消息模板菜单');
INSERT INTO ANIVIA.system_menu VALUES ('2069', '消息模板查询', '2068', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:messageTemplate:query', '#', 'admin', TO_DATE('2024-11-01 09:52:03', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2070', '消息模板新增', '2068', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:messageTemplate:add', '#', 'admin', TO_DATE('2024-11-01 09:52:03', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2071', '消息模板修改', '2068', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:messageTemplate:edit', '#', 'admin', TO_DATE('2024-11-01 09:52:03', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2072', '消息模板删除', '2068', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:messageTemplate:remove', '#', 'admin', TO_DATE('2024-11-01 09:52:03', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2073', '消息模板导出', '2068', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'system:message:messageTemplate:export', '#', 'admin', TO_DATE('2024-11-01 09:52:03', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2075', '组件测试', '2023', '8', 'comCeshi', 'example/coms', NULL, '1', '0', 'comCeshi', 'C', '0', '0', NULL, '#', 'admin', TO_DATE('2024-11-07 11:34:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2076', '单选多选', '2023', '4', 'choose', 'system/tool/choose/index', NULL, '1', '0', NULL, 'C', '0', '0', NULL, '#', 'admin', TO_DATE('2024-11-26 10:11:59', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 11:50:33', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2077', '生产领料记录', '2023', '1', 'proTaskReceive', 'example/taskReceive/index', NULL, '1', '0', NULL, 'C', '0', '0', 'example:taskReceive:list', '#', 'admin', TO_DATE('2024-11-26 11:22:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '生产领料记录菜单');
INSERT INTO ANIVIA.system_menu VALUES ('2078', '生产领料记录查询', '2077', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:taskReceive:query', '#', 'admin', TO_DATE('2024-11-26 11:22:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2079', '生产领料记录新增', '2077', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:taskReceive:add', '#', 'admin', TO_DATE('2024-11-26 11:22:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2080', '生产领料记录修改', '2077', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:taskReceive:edit', '#', 'admin', TO_DATE('2024-11-26 11:22:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2081', '生产领料记录删除', '2077', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:taskReceive:remove', '#', 'admin', TO_DATE('2024-11-26 11:22:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2082', '生产领料记录导出', '2077', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:taskReceive:export', '#', 'admin', TO_DATE('2024-11-26 11:22:32', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2083', '代码生成模版', '2023', '5', 'genTemplate', 'example/gen/index', NULL, '1', '0', NULL, 'C', '0', '0', NULL, '#', 'admin', TO_DATE('2024-11-26 13:41:33', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:04:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2084', '用户类型', '2023', '1', 'userType', 'example/user/index', NULL, '1', '0', NULL, 'C', '0', '0', 'example:user:list', '#', 'admin', TO_DATE('2024-11-27 10:03:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '用户类型菜单');
INSERT INTO ANIVIA.system_menu VALUES ('2085', '用户类型查询', '2084', '1', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:query', '#', 'admin', TO_DATE('2024-11-27 10:03:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2086', '用户类型新增', '2084', '2', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:add', '#', 'admin', TO_DATE('2024-11-27 10:03:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2087', '用户类型修改', '2084', '3', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:edit', '#', 'admin', TO_DATE('2024-11-27 10:03:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2088', '用户类型删除', '2084', '4', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:remove', '#', 'admin', TO_DATE('2024-11-27 10:03:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_menu VALUES ('2089', '用户类型导出', '2084', '5', '#', NULL, NULL, '1', '0', NULL, 'F', '0', '0', 'example:user:export', '#', 'admin', TO_DATE('2024-11-27 10:03:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE ANIVIA.system_notice;
CREATE TABLE ANIVIA.system_notice (
  notice_id NUMBER(11,0) VISIBLE NOT NULL,
  notice_title NVARCHAR2(50) VISIBLE NOT NULL,
  notice_type NCHAR(1) VISIBLE NOT NULL,
  notice_content BLOB VISIBLE,
  status NCHAR(1) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(255) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_notice.notice_id IS '公告ID';
COMMENT ON COLUMN ANIVIA.system_notice.notice_title IS '公告标题';
COMMENT ON COLUMN ANIVIA.system_notice.notice_type IS '公告类型（1通知 2公告）';
COMMENT ON COLUMN ANIVIA.system_notice.notice_content IS '公告内容';
COMMENT ON COLUMN ANIVIA.system_notice.status IS '公告状态（0正常 1关闭）';
COMMENT ON COLUMN ANIVIA.system_notice.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_notice.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_notice.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_notice.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_notice.remark IS '备注';
COMMENT ON TABLE ANIVIA.system_notice IS '通知公告表';

-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO ANIVIA.system_notice VALUES ('1', '温馨提醒：2018-07-01 冰风框架新版本发布啦', '2', HEXTORAW('3C703EE696B0E78988E69CACE58685E5AEB93C2F703E'), '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:51:37', 'SYYYY-MM-DD HH24:MI:SS'), '管理员');
INSERT INTO ANIVIA.system_notice VALUES ('2', '维护通知：2018-07-01 冰风框架系统凌晨维护', '1', HEXTORAW('E7BBB4E68AA4E58685E5AEB9'), '0', 'admin', TO_DATE('2024-05-06 06:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '管理员');

-- ----------------------------
-- Table structure for system_oper_log
-- ----------------------------
DROP TABLE ANIVIA.system_oper_log;
CREATE TABLE ANIVIA.system_oper_log (
  oper_id NUMBER(20,0) VISIBLE NOT NULL,
  title NVARCHAR2(50) VISIBLE,
  business_type NUMBER(11,0) VISIBLE,
  method NVARCHAR2(100) VISIBLE,
  request_method NVARCHAR2(10) VISIBLE,
  operator_type NUMBER(11,0) VISIBLE,
  oper_name NVARCHAR2(50) VISIBLE,
  dept_name NVARCHAR2(50) VISIBLE,
  oper_url NVARCHAR2(255) VISIBLE,
  oper_ip NVARCHAR2(128) VISIBLE,
  oper_location NVARCHAR2(255) VISIBLE,
  oper_param NCLOB VISIBLE,
  json_result NCLOB VISIBLE,
  status NUMBER(11,0) VISIBLE,
  error_msg NCLOB VISIBLE,
  oper_time DATE VISIBLE,
  cost_time NUMBER(20,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_oper_log.oper_id IS '日志主键';
COMMENT ON COLUMN ANIVIA.system_oper_log.title IS '模块标题';
COMMENT ON COLUMN ANIVIA.system_oper_log.business_type IS '业务类型（0其它 1新增 2修改 3删除）';
COMMENT ON COLUMN ANIVIA.system_oper_log.method IS '方法名称';
COMMENT ON COLUMN ANIVIA.system_oper_log.request_method IS '请求方式';
COMMENT ON COLUMN ANIVIA.system_oper_log.operator_type IS '操作类别（0其它 1后台用户 2手机端用户）';
COMMENT ON COLUMN ANIVIA.system_oper_log.oper_name IS '操作人员';
COMMENT ON COLUMN ANIVIA.system_oper_log.dept_name IS '部门名称';
COMMENT ON COLUMN ANIVIA.system_oper_log.oper_url IS '请求URL';
COMMENT ON COLUMN ANIVIA.system_oper_log.oper_ip IS '主机地址';
COMMENT ON COLUMN ANIVIA.system_oper_log.oper_location IS '操作地点';
COMMENT ON COLUMN ANIVIA.system_oper_log.oper_param IS '请求参数';
COMMENT ON COLUMN ANIVIA.system_oper_log.json_result IS '返回参数';
COMMENT ON COLUMN ANIVIA.system_oper_log.status IS '操作状态（0正常 1异常）';
COMMENT ON COLUMN ANIVIA.system_oper_log.error_msg IS '错误消息';
COMMENT ON COLUMN ANIVIA.system_oper_log.oper_time IS '操作时间';
COMMENT ON COLUMN ANIVIA.system_oper_log.cost_time IS '消耗时间';
COMMENT ON TABLE ANIVIA.system_oper_log IS '操作日志记录';

-- ----------------------------
-- Records of system_oper_log
-- ----------------------------
INSERT INTO ANIVIA.system_oper_log VALUES ('1', '操作日志', '9', 'monitor.admin.controller.system.tech.qiantong.qmodel.module.SysOperlogController.clean()', 'DELETE', '1', 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-26 15:51:44', 'SYYYY-MM-DD HH24:MI:SS'), '81');
INSERT INTO ANIVIA.system_oper_log VALUES ('2', '登录日志', '9', 'monitor.admin.controller.system.tech.qiantong.qmodel.module.SysLogininforController.clean()', 'DELETE', '1', 'admin', '研发部门', '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '{}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-26 15:51:51', 'SYYYY-MM-DD HH24:MI:SS'), '90');
INSERT INTO ANIVIA.system_oper_log VALUES ('3', '定时任务', '1', 'tech.qiantong.qmodel.quartz.controller.SysJobController.add()', 'POST', '1', 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{concurrent:1,cronExpression:* * * * * ?,invokeTarget:11,jobGroup:DEFAULT,jobName:1,misfirePolicy:1,nextValidTime:2024-11-26 15:52:08,params:{},status:0}', NULL, '1', 'No bean named ''11'' available', TO_DATE('2024-11-26 15:52:08', 'SYYYY-MM-DD HH24:MI:SS'), '13');
INSERT INTO ANIVIA.system_oper_log VALUES ('4', '定时任务', '1', 'tech.qiantong.qmodel.quartz.controller.SysJobController.add()', 'POST', '1', 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{concurrent:1,cronExpression:* * * * * ?,invokeTarget:22,jobGroup:DEFAULT,jobName:1,misfirePolicy:1,nextValidTime:2024-11-26 15:52:11,params:{},status:0}', NULL, '1', 'No bean named ''22'' available', TO_DATE('2024-11-26 15:52:10', 'SYYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO ANIVIA.system_oper_log VALUES ('5', '调度日志', '9', 'tech.qiantong.qmodel.quartz.controller.SysJobLogController.clean()', 'DELETE', '1', 'admin', '研发部门', '/monitor/jobLog/clean', '127.0.0.1', '内网IP', '{}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-26 15:52:16', 'SYYYY-MM-DD HH24:MI:SS'), '75');
INSERT INTO ANIVIA.system_oper_log VALUES ('6', '代码生成', '2', 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{businessName:message3,className:Message,columns:[{capJavaField:Id,columnComment:ID,columnId:308,columnName:id,columnType:int(11),createBy:admin,createTime:2024-10-31 14:25:34,dictType:,edit:true,htmlType:input,increment:true,insert:true,isEdit:1,isIncrement:1,isInsert:1,isList:1,isPk:1,isQuery:1,isRequired:0,javaField:id,javaType:Long,list:true,params:{},pk:true,query:true,queryType:EQ,required:false,sort:1,superColumn:false,tableId:22,updateBy:,updateTime:2024-11-01 09:50:06,usableColumn:false},{capJavaField:SenderId,columnComment:发送人,columnId:309,columnName:sender_id,columnType:bigint(20),createBy:admin,createTime:2024-10-31 14:25:34,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:0,javaField:senderId,javaType:Long,list:true,params:{},pk:false,query:true,queryType:EQ,required:false,sort:2,superColumn:false,tableId:22,updateBy:,updateTime:2024-11-01 09:50:06,usableColumn:false},{capJavaField:ReceiverId,columnComment:接收人,columnId:310,columnName:receiver_id,columnType:bigint(20),createBy:admin,createTime:2024-10-31 14:25:34,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:0,javaField:receiverId,javaType:Long,list:true,params:{},pk:false,query:true,queryType:EQ,required:false,sort:3,superColumn:false,tableId:22,updateBy:,updateTime:2024-11-01 09:50:06,usableColumn:false},{capJavaField:Title,columnComment:消息标题,columnId:311,columnName:title,columnType:varchar(128),createBy:admin,createTime:2024-10-31 14:25:34,dictType:,edit:true,htmlType:input,', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-26 15:52:45', 'SYYYY-MM-DD HH24:MI:SS'), '1856');
INSERT INTO ANIVIA.system_oper_log VALUES ('7', '代码生成', '8', 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{tables:sys_dept}', NULL, '0', NULL, TO_DATE('2024-11-27 09:35:49', 'SYYYY-MM-DD HH24:MI:SS'), '186');
INSERT INTO ANIVIA.system_oper_log VALUES ('8', '代码生成', '3', 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', '研发部门', '/tool/gen/25', '127.0.0.1', '内网IP', '{}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 09:57:46', 'SYYYY-MM-DD HH24:MI:SS'), '291');
INSERT INTO ANIVIA.system_oper_log VALUES ('9', '代码生成', '6', 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{tables:user_type}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 09:57:53', 'SYYYY-MM-DD HH24:MI:SS'), '1065');
INSERT INTO ANIVIA.system_oper_log VALUES ('10', '代码生成', '2', 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{businessName:type,className:UserType,columns:[{capJavaField:Id,columnComment:ID,columnId:426,columnName:id,columnType:int(11),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:false,htmlType:input,increment:true,insert:false,isEdit:0,isIncrement:1,isInsert:0,isList:0,isPk:1,isQuery:0,isRequired:0,javaField:id,javaType:Long,list:false,params:{},pk:true,query:false,queryType:EQ,required:false,sort:1,superColumn:false,tableId:29,updateBy:,usableColumn:false},{capJavaField:Name,columnComment:类型名称,columnId:427,columnName:name,columnType:varchar(128),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:0,javaField:name,javaType:String,list:true,params:{},pk:false,query:true,queryType:LIKE,required:false,sort:2,superColumn:false,tableId:29,updateBy:,usableColumn:false},{capJavaField:ValidFlag,columnComment:是否有效,columnId:428,columnName:valid_flag,columnType:tinyint(1),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:false,htmlType:input,increment:false,insert:false,isEdit:0,isIncrement:0,isInsert:0,isList:0,isPk:0,isQuery:0,isRequired:0,javaField:validFlag,javaType:Boolean,list:false,params:{},pk:false,query:false,queryType:EQ,required:false,sort:3,superColumn:false,tableId:29,updateBy:,usableColumn:false},{capJavaField:DelFlag,columnComment:删除标志,columnId:429,columnName:del_flag,columnType:tinyint(1),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:false,htmlType:input,increment:false,insert:false,isEdit:0,isIncrement:0,isInsert:0,isList:0,isPk:0', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 09:58:40', 'SYYYY-MM-DD HH24:MI:SS'), '1314');
INSERT INTO ANIVIA.system_oper_log VALUES ('11', '代码生成', '2', 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{businessName:type,className:UserType,columns:[{capJavaField:Id,columnComment:ID,columnId:426,columnName:id,columnType:int(11),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,increment:true,insert:true,isEdit:1,isIncrement:1,isInsert:1,isList:1,isPk:1,isQuery:1,isRequired:0,javaField:id,javaType:Long,list:true,params:{},pk:true,query:true,queryType:EQ,required:false,sort:1,superColumn:false,tableId:29,updateBy:,updateTime:2024-11-27 09:58:39,usableColumn:false},{capJavaField:Name,columnComment:类型名称,columnId:427,columnName:name,columnType:varchar(128),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:0,javaField:name,javaType:String,list:true,params:{},pk:false,query:true,queryType:LIKE,required:false,sort:2,superColumn:false,tableId:29,updateBy:,updateTime:2024-11-27 09:58:39,usableColumn:false},{capJavaField:ValidFlag,columnComment:是否有效,columnId:428,columnName:valid_flag,columnType:tinyint(1),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:0,javaField:validFlag,javaType:Boolean,list:true,params:{},pk:false,query:true,queryType:EQ,required:false,sort:3,superColumn:false,tableId:29,updateBy:,updateTime:2024-11-27 09:58:39,usableColumn:false},{capJavaField:DelFlag,columnComment:删除标志,columnId:429,columnName:del_flag,columnType:tinyint(1),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,incr', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 09:58:50', 'SYYYY-MM-DD HH24:MI:SS'), '1254');
INSERT INTO ANIVIA.system_oper_log VALUES ('12', '代码生成', '2', 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{businessName:userType,className:UserType,columns:[{capJavaField:Id,columnComment:ID,columnId:426,columnName:id,columnType:int(11),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,increment:true,insert:true,isEdit:1,isIncrement:1,isInsert:1,isList:1,isPk:1,isQuery:1,isRequired:0,javaField:id,javaType:Long,list:true,params:{},pk:true,query:true,queryType:EQ,required:false,sort:1,superColumn:false,tableId:29,updateBy:,updateTime:2024-11-27 09:58:49,usableColumn:false},{capJavaField:Name,columnComment:类型名称,columnId:427,columnName:name,columnType:varchar(128),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:0,javaField:name,javaType:String,list:true,params:{},pk:false,query:true,queryType:LIKE,required:false,sort:2,superColumn:false,tableId:29,updateBy:,updateTime:2024-11-27 09:58:49,usableColumn:false},{capJavaField:ValidFlag,columnComment:是否有效,columnId:428,columnName:valid_flag,columnType:tinyint(1),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:0,javaField:validFlag,javaType:Boolean,list:true,params:{},pk:false,query:true,queryType:EQ,required:false,sort:3,superColumn:false,tableId:29,updateBy:,updateTime:2024-11-27 09:58:49,usableColumn:false},{capJavaField:DelFlag,columnComment:删除标志,columnId:429,columnName:del_flag,columnType:tinyint(1),createBy:admin,createTime:2024-11-27 09:57:52,dictType:,edit:true,htmlType:input,', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 10:00:07', 'SYYYY-MM-DD HH24:MI:SS'), '1124');
INSERT INTO ANIVIA.system_oper_log VALUES ('13', '代码生成', '8', 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{tables:user_type}', NULL, '0', NULL, TO_DATE('2024-11-27 10:00:10', 'SYYYY-MM-DD HH24:MI:SS'), '419');
INSERT INTO ANIVIA.system_oper_log VALUES ('14', '代码生成', '2', 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{businessName:user,className:ExampleUser,columns:[{capJavaField:Id,columnComment:ID,columnId:284,columnName:id,columnType:int(11),createBy:,createTime:2024-10-23 16:21:16,dictType:,edit:true,htmlType:input,increment:true,insert:true,isEdit:1,isIncrement:1,isInsert:1,isList:1,isPk:1,isQuery:1,isRequired:0,javaField:id,javaType:Long,list:true,params:{},pk:true,query:true,queryType:EQ,required:false,sort:1,superColumn:false,tableId:19,updateBy:,updateTime:2024-11-26 10:48:44,usableColumn:false},{capJavaField:Name,columnComment:名称,columnId:285,columnName:name,columnType:varchar(32),createBy:,createTime:2024-10-23 16:21:16,dictType:,edit:true,htmlType:textarea,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:1,javaField:name,javaType:String,list:true,params:{},pk:false,query:true,queryType:LIKE,required:true,sort:2,superColumn:false,tableId:19,updateBy:,updateTime:2024-11-26 10:48:44,usableColumn:false},{capJavaField:Age,columnComment:年龄,columnId:286,columnName:age,columnType:int(11),createBy:,createTime:2024-10-23 16:21:16,dictType:,edit:true,htmlType:select,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:1,javaField:age,javaType:Long,list:true,params:{},pk:false,query:true,queryType:EQ,required:true,sort:3,superColumn:false,tableId:19,updateBy:,updateTime:2024-11-26 10:48:44,usableColumn:false},{capJavaField:Phone,columnComment:手机号,columnId:287,columnName:phone,columnType:varchar(32),createBy:,createTime:2024-10-23 16:21:16,dictType:sys_yes_no,edit:true,htmlType:radio,increment:false,insert:true,isEdit:1,', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 10:05:38', 'SYYYY-MM-DD HH24:MI:SS'), '1582');
INSERT INTO ANIVIA.system_oper_log VALUES ('15', '字典数据', '5', 'system.admin.controller.system.tech.qiantong.qmodel.module.SysDictDataController.export()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/export', '127.0.0.1', '内网IP', '{pageSize:10,pageNum:1,dictType:sys_show_hide}', NULL, '0', NULL, TO_DATE('2024-11-27 10:12:07', 'SYYYY-MM-DD HH24:MI:SS'), '792');
INSERT INTO ANIVIA.system_oper_log VALUES ('16', '代码生成', '3', 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', '研发部门', '/tool/gen/28', '127.0.0.1', '内网IP', '{}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 10:19:20', 'SYYYY-MM-DD HH24:MI:SS'), '325');
INSERT INTO ANIVIA.system_oper_log VALUES ('17', '代码生成', '6', 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{tables:example_dept}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 10:26:27', 'SYYYY-MM-DD HH24:MI:SS'), '1310');
INSERT INTO ANIVIA.system_oper_log VALUES ('18', '代码生成', '3', 'tech.qiantong.qmodel.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', '研发部门', '/tool/gen/30', '127.0.0.1', '内网IP', '{}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 10:28:57', 'SYYYY-MM-DD HH24:MI:SS'), '244');
INSERT INTO ANIVIA.system_oper_log VALUES ('19', '代码生成', '6', 'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{tables:example_dept}', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 10:29:02', 'SYYYY-MM-DD HH24:MI:SS'), '1133');
INSERT INTO ANIVIA.system_oper_log VALUES ('20', '代码生成', '2', 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{businessName:dept,className:ExampleDept,columns:[{capJavaField:Id,columnComment:ID,columnId:452,columnName:id,columnType:int(11),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increment:true,insert:true,isEdit:1,isIncrement:1,isInsert:1,isList:1,isPk:1,isQuery:1,isRequired:0,javaField:id,javaType:Long,list:true,params:{},pk:true,query:true,queryType:EQ,required:false,sort:1,superColumn:false,tableId:31,updateBy:,usableColumn:false},{capJavaField:ParentId,columnComment:父部门id,columnId:453,columnName:parent_id,columnType:bigint(20),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:1,javaField:parentId,javaType:Long,list:true,params:{},pk:false,query:true,queryType:EQ,required:true,sort:2,superColumn:true,tableId:31,updateBy:,usableColumn:true},{capJavaField:Name,columnComment:部门名称,columnId:454,columnName:name,columnType:varchar(128),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:0,javaField:name,javaType:String,list:true,params:{},pk:false,query:true,queryType:LIKE,required:false,sort:3,superColumn:false,tableId:31,updateBy:,usableColumn:false},{capJavaField:Leader,columnComment:负责人,columnId:455,columnName:leader,columnType:varchar(32),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,i', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 10:30:33', 'SYYYY-MM-DD HH24:MI:SS'), '956');
INSERT INTO ANIVIA.system_oper_log VALUES ('21', '代码生成', '2', 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{businessName:dept,className:ExampleDept,columns:[{capJavaField:Id,columnComment:ID,columnId:452,columnName:id,columnType:int(11),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:false,htmlType:input,increment:true,insert:false,isEdit:0,isIncrement:1,isInsert:0,isList:0,isPk:1,isQuery:0,isRequired:0,javaField:id,javaType:Long,list:false,params:{},pk:true,query:false,queryType:EQ,required:false,sort:1,superColumn:false,tableId:31,updateBy:,updateTime:2024-11-27 10:30:33,usableColumn:false},{capJavaField:ParentId,columnComment:父部门id,columnId:453,columnName:parent_id,columnType:bigint(20),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:0,isPk:0,isQuery:0,isRequired:1,javaField:parentId,javaType:Long,list:false,params:{},pk:false,query:false,queryType:EQ,required:true,sort:2,superColumn:true,tableId:31,updateBy:,updateTime:2024-11-27 10:30:33,usableColumn:true},{capJavaField:Name,columnComment:部门名称,columnId:454,columnName:name,columnType:varchar(128),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:1,javaField:name,javaType:String,list:true,params:{},pk:false,query:true,queryType:LIKE,required:true,sort:3,superColumn:false,tableId:31,updateBy:,updateTime:2024-11-27 10:30:33,usableColumn:false},{capJavaField:Leader,columnComment:负责人,columnId:455,columnName:leader,columnType:varchar(32),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increme', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 10:32:37', 'SYYYY-MM-DD HH24:MI:SS'), '1027');
INSERT INTO ANIVIA.system_oper_log VALUES ('22', '代码生成', '8', 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{tables:example_dept}', NULL, '0', NULL, TO_DATE('2024-11-27 10:32:43', 'SYYYY-MM-DD HH24:MI:SS'), '439');
INSERT INTO ANIVIA.system_oper_log VALUES ('23', '代码生成', '8', 'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{tables:example_dept}', NULL, '0', NULL, TO_DATE('2024-11-27 10:51:30', 'SYYYY-MM-DD HH24:MI:SS'), '192');
INSERT INTO ANIVIA.system_oper_log VALUES ('24', '示例部门', '1', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.add()', 'POST', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 10:55:32.716,creatorId:1,email:xxxxxxx,leader:张三,name:云桐科技,phone:xxxxxxxx,remark:测试数据,status:0}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 10:55:33', 'SYYYY-MM-DD HH24:MI:SS'), '404');
INSERT INTO ANIVIA.system_oper_log VALUES ('25', '示例部门', '1', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.add()', 'POST', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 10:56:24.591,creatorId:1,email:/,leader:李四,name:郑州总部,phone:/,remark:总部测试,status:0}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 10:56:24', 'SYYYY-MM-DD HH24:MI:SS'), '140');
INSERT INTO ANIVIA.system_oper_log VALUES ('26', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 10:58:48.422,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 10:58:48', 'SYYYY-MM-DD HH24:MI:SS'), '301');
INSERT INTO ANIVIA.system_oper_log VALUES ('27', '代码生成', '2', 'tech.qiantong.qmodel.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{businessName:dept,className:ExampleDept,columns:[{capJavaField:Id,columnComment:ID,columnId:452,columnName:id,columnType:int(11),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:false,htmlType:input,increment:true,insert:false,isEdit:0,isIncrement:1,isInsert:0,isList:0,isPk:1,isQuery:0,isRequired:0,javaField:id,javaType:Long,list:false,params:{},pk:true,query:false,queryType:EQ,required:false,sort:1,superColumn:false,tableId:31,updateBy:,updateTime:2024-11-27 10:32:36,usableColumn:false},{capJavaField:ParentId,columnComment:父部门id,columnId:453,columnName:parent_id,columnType:bigint(20),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:0,isPk:0,isQuery:0,isRequired:1,javaField:parentId,javaType:Long,list:false,params:{},pk:false,query:false,queryType:EQ,required:true,sort:2,superColumn:true,tableId:31,updateBy:,updateTime:2024-11-27 10:32:36,usableColumn:true},{capJavaField:Name,columnComment:部门名称,columnId:454,columnName:name,columnType:varchar(128),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increment:false,insert:true,isEdit:1,isIncrement:0,isInsert:1,isList:1,isPk:0,isQuery:1,isRequired:1,javaField:name,javaType:String,list:true,params:{},pk:false,query:true,queryType:LIKE,required:true,sort:3,superColumn:false,tableId:31,updateBy:,updateTime:2024-11-27 10:32:36,usableColumn:false},{capJavaField:Leader,columnComment:负责人,columnId:455,columnName:leader,columnType:varchar(32),createBy:admin,createTime:2024-11-27 10:29:01,dictType:,edit:true,htmlType:input,increme', '{msg:操作成功,code:200}', '0', NULL, TO_DATE('2024-11-27 11:17:26', 'SYYYY-MM-DD HH24:MI:SS'), '1381');
INSERT INTO ANIVIA.system_oper_log VALUES ('28', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,parentId:1,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 13:38:44.968,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 13:38:45', 'SYYYY-MM-DD HH24:MI:SS'), '444');
INSERT INTO ANIVIA.system_oper_log VALUES ('29', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,parentId:1,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 13:40:15.998,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 13:40:16', 'SYYYY-MM-DD HH24:MI:SS'), '190');
INSERT INTO ANIVIA.system_oper_log VALUES ('30', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,parentId:1,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 13:40:56.874,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 13:41:12', 'SYYYY-MM-DD HH24:MI:SS'), '35355');
INSERT INTO ANIVIA.system_oper_log VALUES ('31', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,parentId:1,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 13:42:31.851,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 13:42:32', 'SYYYY-MM-DD HH24:MI:SS'), '5388');
INSERT INTO ANIVIA.system_oper_log VALUES ('32', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,parentId:1,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 13:42:45.282,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 13:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '173');
INSERT INTO ANIVIA.system_oper_log VALUES ('33', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,parentId:1,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 13:43:12.329,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 13:44:31', 'SYYYY-MM-DD HH24:MI:SS'), '79152');
INSERT INTO ANIVIA.system_oper_log VALUES ('34', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,parentId:1,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 13:44:34.734,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 13:44:39', 'SYYYY-MM-DD HH24:MI:SS'), '4972');
INSERT INTO ANIVIA.system_oper_log VALUES ('35', '示例部门', '2', 'gen.admin.controller.example.tech.qiantong.qmodel.module.ExampleDeptController.edit()', 'PUT', '1', 'admin', '研发部门', '/example/dept', '127.0.0.1', '内网IP', '{createBy:admin,createTime:2024-11-27 00:00:00,creatorId:1,delFlag:false,email:/,id:2,leader:李四,name:郑州总部,parentId:1,phone:/,remark:总部测试,status:0,updateBy:admin,updateTime:2024-11-27 13:45:26.986,updatorId:1,validFlag:true}', '{code:200,msg:操作成功}', '0', NULL, TO_DATE('2024-11-27 13:45:32', 'SYYYY-MM-DD HH24:MI:SS'), '5157');

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE ANIVIA.system_post;
CREATE TABLE ANIVIA.system_post (
  post_id NUMBER(20,0) VISIBLE NOT NULL,
  post_code NVARCHAR2(64) VISIBLE NOT NULL,
  post_name NVARCHAR2(50) VISIBLE NOT NULL,
  post_sort NUMBER(11,0) VISIBLE NOT NULL,
  status NCHAR(1) VISIBLE NOT NULL,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_post.post_id IS '岗位ID';
COMMENT ON COLUMN ANIVIA.system_post.post_code IS '岗位编码';
COMMENT ON COLUMN ANIVIA.system_post.post_name IS '岗位名称';
COMMENT ON COLUMN ANIVIA.system_post.post_sort IS '显示顺序';
COMMENT ON COLUMN ANIVIA.system_post.status IS '状态（0正常 1停用）';
COMMENT ON COLUMN ANIVIA.system_post.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_post.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_post.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_post.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_post.remark IS '备注';
COMMENT ON TABLE ANIVIA.system_post IS '岗位信息表';

-- ----------------------------
-- Records of system_post
-- ----------------------------
INSERT INTO ANIVIA.system_post VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_post VALUES ('2', 'se', '项目经理', '2', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO ANIVIA.system_post VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:50:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.system_post VALUES ('4', 'user', '普通员工', '4', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE ANIVIA.system_role;
CREATE TABLE ANIVIA.system_role (
  role_id NUMBER(20,0) VISIBLE NOT NULL,
  role_name NVARCHAR2(30) VISIBLE NOT NULL,
  role_key NVARCHAR2(100) VISIBLE NOT NULL,
  role_sort NUMBER(11,0) VISIBLE NOT NULL,
  data_scope NCHAR(1) VISIBLE,
  menu_check_strictly NUMBER(4,0) VISIBLE,
  dept_check_strictly NUMBER(4,0) VISIBLE,
  status NCHAR(1) VISIBLE NOT NULL,
  del_flag NCHAR(1) VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_role.role_id IS '角色ID';
COMMENT ON COLUMN ANIVIA.system_role.role_name IS '角色名称';
COMMENT ON COLUMN ANIVIA.system_role.role_key IS '角色权限字符串';
COMMENT ON COLUMN ANIVIA.system_role.role_sort IS '显示顺序';
COMMENT ON COLUMN ANIVIA.system_role.data_scope IS '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';
COMMENT ON COLUMN ANIVIA.system_role.menu_check_strictly IS '菜单树选择项是否关联显示';
COMMENT ON COLUMN ANIVIA.system_role.dept_check_strictly IS '部门树选择项是否关联显示';
COMMENT ON COLUMN ANIVIA.system_role.status IS '角色状态（0正常 1停用）';
COMMENT ON COLUMN ANIVIA.system_role.del_flag IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN ANIVIA.system_role.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_role.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_role.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_role.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_role.remark IS '备注';
COMMENT ON TABLE ANIVIA.system_role IS '角色信息表';

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO ANIVIA.system_role VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '超级管理员');
INSERT INTO ANIVIA.system_role VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', '0', '0', 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:49:20', 'SYYYY-MM-DD HH24:MI:SS'), '普通角色');

-- ----------------------------
-- Table structure for system_role_dept
-- ----------------------------
DROP TABLE ANIVIA.system_role_dept;
CREATE TABLE ANIVIA.system_role_dept (
  role_id NUMBER(20,0) VISIBLE NOT NULL,
  dept_id NUMBER(20,0) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_role_dept.role_id IS '角色ID';
COMMENT ON COLUMN ANIVIA.system_role_dept.dept_id IS '部门ID';
COMMENT ON TABLE ANIVIA.system_role_dept IS '角色和部门关联表';

-- ----------------------------
-- Records of system_role_dept
-- ----------------------------
INSERT INTO ANIVIA.system_role_dept VALUES ('2', '100');
INSERT INTO ANIVIA.system_role_dept VALUES ('2', '101');
INSERT INTO ANIVIA.system_role_dept VALUES ('2', '105');

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE ANIVIA.system_role_menu;
CREATE TABLE ANIVIA.system_role_menu (
  role_id NUMBER(20,0) VISIBLE NOT NULL,
  menu_id NUMBER(20,0) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_role_menu.role_id IS '角色ID';
COMMENT ON COLUMN ANIVIA.system_role_menu.menu_id IS '菜单ID';
COMMENT ON TABLE ANIVIA.system_role_menu IS '角色和菜单关联表';

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '3');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '100');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '101');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '102');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '103');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '104');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '105');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '106');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '107');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '108');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '109');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '110');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '111');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '112');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '113');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '114');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '115');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '116');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '117');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '500');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '501');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1000');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1001');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1002');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1003');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1004');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1005');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1006');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1007');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1008');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1009');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1010');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1011');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1012');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1013');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1014');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1015');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1016');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1017');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1018');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1019');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1020');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1021');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1022');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1023');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1024');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1025');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1026');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1027');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1028');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1029');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1030');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1031');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1032');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1033');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1034');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1035');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1036');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1037');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1038');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1039');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1040');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1041');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1042');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1043');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1044');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1045');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1046');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1047');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1048');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1049');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1050');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1051');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1052');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1053');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1054');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1055');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1056');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1057');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1058');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1059');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '1060');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2000');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2001');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2002');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2003');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2004');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2005');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2006');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2007');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2008');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2009');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2010');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2011');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2012');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2013');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2014');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2015');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2016');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2017');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2022');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2023');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2024');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2025');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2026');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2027');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2028');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2029');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2030');
INSERT INTO ANIVIA.system_role_menu VALUES ('2', '2031');

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE ANIVIA.system_user;
CREATE TABLE ANIVIA.system_user (
  user_id NUMBER(20,0) VISIBLE NOT NULL,
  dept_id NUMBER(20,0) VISIBLE,
  user_name NVARCHAR2(30) VISIBLE NOT NULL,
  nick_name NVARCHAR2(30) VISIBLE NOT NULL,
  user_type NVARCHAR2(2) VISIBLE,
  email NVARCHAR2(50) VISIBLE,
  phonenumber NVARCHAR2(11) VISIBLE,
  sex NCHAR(1) VISIBLE,
  avatar NVARCHAR2(100) VISIBLE,
  password NVARCHAR2(100) VISIBLE,
  status NCHAR(1) VISIBLE,
  del_flag NCHAR(1) VISIBLE,
  login_ip NVARCHAR2(128) VISIBLE,
  login_date DATE VISIBLE,
  create_by NVARCHAR2(64) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(64) VISIBLE,
  update_time DATE VISIBLE,
  remark NVARCHAR2(500) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_user.user_id IS '用户ID';
COMMENT ON COLUMN ANIVIA.system_user.dept_id IS '部门ID';
COMMENT ON COLUMN ANIVIA.system_user.user_name IS '用户账号';
COMMENT ON COLUMN ANIVIA.system_user.nick_name IS '用户昵称';
COMMENT ON COLUMN ANIVIA.system_user.user_type IS '用户类型（00系统用户）';
COMMENT ON COLUMN ANIVIA.system_user.email IS '用户邮箱';
COMMENT ON COLUMN ANIVIA.system_user.phonenumber IS '手机号码';
COMMENT ON COLUMN ANIVIA.system_user.sex IS '用户性别（0男 1女 2未知）';
COMMENT ON COLUMN ANIVIA.system_user.avatar IS '头像地址';
COMMENT ON COLUMN ANIVIA.system_user.password IS '密码';
COMMENT ON COLUMN ANIVIA.system_user.status IS '帐号状态（0正常 1停用）';
COMMENT ON COLUMN ANIVIA.system_user.del_flag IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN ANIVIA.system_user.login_ip IS '最后登录IP';
COMMENT ON COLUMN ANIVIA.system_user.login_date IS '最后登录时间';
COMMENT ON COLUMN ANIVIA.system_user.create_by IS '创建者';
COMMENT ON COLUMN ANIVIA.system_user.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.system_user.update_by IS '更新者';
COMMENT ON COLUMN ANIVIA.system_user.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.system_user.remark IS '备注';
COMMENT ON TABLE ANIVIA.system_user IS '用户信息表';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO ANIVIA.system_user VALUES ('1', '103', 'admin', 'admin', '00', 'bf@163.com', '19951942682', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', TO_DATE('2024-11-27 13:57:02', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-11-27 13:57:02', 'SYYYY-MM-DD HH24:MI:SS'), '管理员');
INSERT INTO ANIVIA.system_user VALUES ('2', '105', 'bf2', '冰风2', '00', 'bf1@qq.com', '15666666666', '0', NULL, '$2a$10$J7Ymz2DNLfGXnmKHm9RYnOHBTexve38Owo.Tg/D2XbTwAoc0X1f66', '0', '0', '127.0.0.1', TO_DATE('2024-10-30 16:49:04', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-26 15:48:49', 'SYYYY-MM-DD HH24:MI:SS'), '测试员');
INSERT INTO ANIVIA.system_user VALUES ('3', '105', 'bf3', '冰风3', '00', 'bf2@qq.com', '15666666667', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-11-12 23:30:18', 'SYYYY-MM-DD HH24:MI:SS'), '测试员');
INSERT INTO ANIVIA.system_user VALUES ('4', '105', 'bf4', '冰风4', '00', 'bf3@qq.com', '15666666668', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-06 06:12:17', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '测试员');

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE ANIVIA.system_user_post;
CREATE TABLE ANIVIA.system_user_post (
  user_id NUMBER(20,0) VISIBLE NOT NULL,
  post_id NUMBER(20,0) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_user_post.user_id IS '用户ID';
COMMENT ON COLUMN ANIVIA.system_user_post.post_id IS '岗位ID';
COMMENT ON TABLE ANIVIA.system_user_post IS '用户与岗位关联表';

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
INSERT INTO ANIVIA.system_user_post VALUES ('1', '1');
INSERT INTO ANIVIA.system_user_post VALUES ('2', '2');

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE ANIVIA.system_user_role;
CREATE TABLE ANIVIA.system_user_role (
  user_id NUMBER(20,0) VISIBLE NOT NULL,
  role_id NUMBER(20,0) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.system_user_role.user_id IS '用户ID';
COMMENT ON COLUMN ANIVIA.system_user_role.role_id IS '角色ID';
COMMENT ON TABLE ANIVIA.system_user_role IS '用户和角色关联表';

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO ANIVIA.system_user_role VALUES ('1', '1');
INSERT INTO ANIVIA.system_user_role VALUES ('2', '2');

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE ANIVIA.user_type;
CREATE TABLE ANIVIA.user_type (
  id NUMBER(11,0) VISIBLE NOT NULL,
  name NVARCHAR2(128) VISIBLE,
  valid_flag NUMBER(4,0) VISIBLE NOT NULL,
  del_flag NUMBER(4,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(32) VISIBLE,
  creator_id NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE NOT NULL,
  update_by NVARCHAR2(32) VISIBLE,
  updator_id NUMBER(20,0) VISIBLE,
  update_time DATE VISIBLE NOT NULL,
  remark NVARCHAR2(512) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN ANIVIA.user_type.id IS 'ID';
COMMENT ON COLUMN ANIVIA.user_type.name IS '类型名称';
COMMENT ON COLUMN ANIVIA.user_type.valid_flag IS '是否有效;0：无效，1：有效';
COMMENT ON COLUMN ANIVIA.user_type.del_flag IS '删除标志;1：已删除，0：未删除';
COMMENT ON COLUMN ANIVIA.user_type.create_by IS '创建人';
COMMENT ON COLUMN ANIVIA.user_type.creator_id IS '创建人id';
COMMENT ON COLUMN ANIVIA.user_type.create_time IS '创建时间';
COMMENT ON COLUMN ANIVIA.user_type.update_by IS '更新人';
COMMENT ON COLUMN ANIVIA.user_type.updator_id IS '更新人id';
COMMENT ON COLUMN ANIVIA.user_type.update_time IS '更新时间';
COMMENT ON COLUMN ANIVIA.user_type.remark IS '备注';
COMMENT ON TABLE ANIVIA.user_type IS '用户类型';

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO ANIVIA.user_type VALUES ('1', '1', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('2', '2', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:54:13', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, TO_DATE('2024-10-23 15:54:13', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('5', '5', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('6', '6', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('7', '7', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('8', '8', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('9', '9', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('10', '10', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('11', '11', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('12', '12', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('13', '13', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('14', '14', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('15', '15', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('16', '16', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('17', '17', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('18', '18', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('19', '19', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('20', '20', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('21', '21', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('22', '22', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('23', '23', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('24', '24', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('25', '25', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('26', '26', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('27', '27', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('28', '28', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('29', '29', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('30', '30', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('31', '31', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('32', '32', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('33', '33', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('34', '34', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('35', '35', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('36', '36', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('37', '375', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 16:15:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('38', '38', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('39', '39', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('40', '40', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('41', '41', '1', '1', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('42', '42', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('43', '43', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('44', '44', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('45', '45', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('46', '46', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('47', '47', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('48', '48', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('49', '49', '1', '0', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('50', '50333', '1', '1', '若依1', '1', TO_DATE('2024-10-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 18:20:23', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('51', '513', '1', '1', '若依1', '1', TO_DATE('2024-10-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 16:43:08', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('52', '52', '1', '1', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('53', '53', '1', '1', '若依1', '1', TO_DATE('2024-10-23 15:53:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 15:32:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('54', '2', '1', '1', 'admin', '1', TO_DATE('2024-11-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 18:36:13', 'SYYYY-MM-DD HH24:MI:SS'), '122112');
INSERT INTO ANIVIA.user_type VALUES ('55', '222', '1', '0', 'admin', '1', TO_DATE('2024-11-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 18:36:09', 'SYYYY-MM-DD HH24:MI:SS'), '212121');
INSERT INTO ANIVIA.user_type VALUES ('56', '2123332222', '1', '0', 'admin', '1', TO_DATE('2024-11-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 18:35:45', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO ANIVIA.user_type VALUES ('57', '243423332', '1', '0', 'admin', '1', TO_DATE('2024-11-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', '1', TO_DATE('2024-11-20 18:35:40', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Primary Key structure for table auth_client
-- ----------------------------
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013740 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table auth_client
-- ----------------------------
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013540 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013541 CHECK (secret_key IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013542 CHECK (name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013543 CHECK (type IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013544 CHECK (redirect_url IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013545 CHECK (public_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013546 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013547 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013548 CHECK (create_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client ADD CONSTRAINT SYS_C0013549 CHECK (update_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table auth_client_user
-- ----------------------------
ALTER TABLE ANIVIA.auth_client_user ADD CONSTRAINT SYS_C0013573 CHECK (client_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client_user ADD CONSTRAINT SYS_C0013574 CHECK (user_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.auth_client_user ADD CONSTRAINT SYS_C0013575 CHECK (open_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table ca_cert
-- ----------------------------
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013742 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table ca_cert
-- ----------------------------
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013562 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013563 CHECK (name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013564 CHECK (subject_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013565 CHECK (subject_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013566 CHECK (certificate IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013567 CHECK (private_key IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013568 CHECK (issuer IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013569 CHECK (possessor IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013570 CHECK (valid_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013571 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_cert ADD CONSTRAINT SYS_C0013572 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table ca_subject
-- ----------------------------
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013741 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table ca_subject
-- ----------------------------
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013550 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013551 CHECK (name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013552 CHECK (cn IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013553 CHECK (ou IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013554 CHECK (o IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013555 CHECK (l IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013556 CHECK (st IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013557 CHECK (c IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013558 CHECK (certificate IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013559 CHECK (private_key IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013560 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.ca_subject ADD CONSTRAINT SYS_C0013561 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table example_dept
-- ----------------------------
ALTER TABLE ANIVIA.example_dept ADD CONSTRAINT SYS_C0013743 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table example_dept
-- ----------------------------
ALTER TABLE ANIVIA.example_dept ADD CONSTRAINT SYS_C0013576 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_dept ADD CONSTRAINT SYS_C0013577 CHECK (parent_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_dept ADD CONSTRAINT SYS_C0013578 CHECK (status IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_dept ADD CONSTRAINT SYS_C0013579 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_dept ADD CONSTRAINT SYS_C0013580 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_dept ADD CONSTRAINT SYS_C0013581 CHECK (create_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_dept ADD CONSTRAINT SYS_C0013582 CHECK (update_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table example_user
-- ----------------------------
ALTER TABLE ANIVIA.example_user ADD CONSTRAINT SYS_C0013744 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table example_user
-- ----------------------------
ALTER TABLE ANIVIA.example_user ADD CONSTRAINT SYS_C0013584 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_user ADD CONSTRAINT SYS_C0013585 CHECK (name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_user ADD CONSTRAINT SYS_C0013586 CHECK (age IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_user ADD CONSTRAINT SYS_C0013587 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_user ADD CONSTRAINT SYS_C0013588 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_user ADD CONSTRAINT SYS_C0013589 CHECK (create_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.example_user ADD CONSTRAINT SYS_C0013590 CHECK (update_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table gen_table
-- ----------------------------
ALTER TABLE ANIVIA.gen_table ADD CONSTRAINT SYS_C0013745 PRIMARY KEY (table_id);

-- ----------------------------
-- Checks structure for table gen_table
-- ----------------------------
ALTER TABLE ANIVIA.gen_table ADD CONSTRAINT SYS_C0013583 CHECK (table_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table gen_table_column
-- ----------------------------
ALTER TABLE ANIVIA.gen_table_column ADD CONSTRAINT SYS_C0013746 PRIMARY KEY (column_id);

-- ----------------------------
-- Checks structure for table gen_table_column
-- ----------------------------
ALTER TABLE ANIVIA.gen_table_column ADD CONSTRAINT SYS_C0013591 CHECK (column_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table message
-- ----------------------------
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013747 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table message
-- ----------------------------
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013592 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013593 CHECK (title IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013594 CHECK (content IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013595 CHECK (category IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013596 CHECK (msg_level IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013597 CHECK (module IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013598 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013599 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013600 CHECK (create_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message ADD CONSTRAINT SYS_C0013601 CHECK (update_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table message_template
-- ----------------------------
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013748 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table message_template
-- ----------------------------
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013602 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013603 CHECK (title IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013604 CHECK (content IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013605 CHECK (category IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013606 CHECK (msg_level IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013607 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013608 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013609 CHECK (create_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.message_template ADD CONSTRAINT SYS_C0013610 CHECK (update_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table pro_plan
-- ----------------------------
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013749 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table pro_plan
-- ----------------------------
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013611 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013612 CHECK (code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013613 CHECK (product_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013614 CHECK (product_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013615 CHECK (split_route_type IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013616 CHECK (status IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013617 CHECK (plan_number IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013618 CHECK (begin_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013619 CHECK (end_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013620 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013621 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013622 CHECK (create_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_plan ADD CONSTRAINT SYS_C0013623 CHECK (update_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table pro_task_receive
-- ----------------------------
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013750 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table pro_task_receive
-- ----------------------------
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013624 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013625 CHECK (task_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013626 CHECK (task_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013627 CHECK (order_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013628 CHECK (order_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013629 CHECK (reveive_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013630 CHECK (material_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013631 CHECK (material_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013632 CHECK (staff_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013633 CHECK (count IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013634 CHECK (unit_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013635 CHECK (unit_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013636 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013637 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013638 CHECK (create_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.pro_task_receive ADD CONSTRAINT SYS_C0013639 CHECK (update_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_blob_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_blob_triggers ADD CONSTRAINT SYS_C0013751 PRIMARY KEY (sched_name, trigger_name, trigger_group);

-- ----------------------------
-- Checks structure for table qrtz_blob_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_blob_triggers ADD CONSTRAINT SYS_C0013640 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_blob_triggers ADD CONSTRAINT SYS_C0013641 CHECK (trigger_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_blob_triggers ADD CONSTRAINT SYS_C0013642 CHECK (trigger_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_calendars
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_calendars ADD CONSTRAINT SYS_C0013752 PRIMARY KEY (sched_name, calendar_name);

-- ----------------------------
-- Checks structure for table qrtz_calendars
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_calendars ADD CONSTRAINT SYS_C0013643 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_calendars ADD CONSTRAINT SYS_C0013644 CHECK (calendar_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_calendars ADD CONSTRAINT SYS_C0013645 CHECK (calendar IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_cron_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_cron_triggers ADD CONSTRAINT SYS_C0013753 PRIMARY KEY (sched_name, trigger_name, trigger_group);

-- ----------------------------
-- Checks structure for table qrtz_cron_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_cron_triggers ADD CONSTRAINT SYS_C0013646 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_cron_triggers ADD CONSTRAINT SYS_C0013647 CHECK (trigger_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_cron_triggers ADD CONSTRAINT SYS_C0013648 CHECK (trigger_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_cron_triggers ADD CONSTRAINT SYS_C0013649 CHECK (cron_expression IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_fired_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013754 PRIMARY KEY (sched_name, entry_id);

-- ----------------------------
-- Checks structure for table qrtz_fired_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013650 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013651 CHECK (entry_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013652 CHECK (trigger_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013653 CHECK (trigger_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013654 CHECK (instance_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013655 CHECK (fired_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013656 CHECK (sched_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013657 CHECK (priority IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_fired_triggers ADD CONSTRAINT SYS_C0013658 CHECK (state IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_job_details
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013755 PRIMARY KEY (sched_name, job_name, job_group);

-- ----------------------------
-- Checks structure for table qrtz_job_details
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013659 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013660 CHECK (job_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013661 CHECK (job_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013662 CHECK (job_class_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013663 CHECK (is_durable IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013664 CHECK (is_nonconcurrent IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013665 CHECK (is_update_data IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_job_details ADD CONSTRAINT SYS_C0013666 CHECK (requests_recovery IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_locks
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_locks ADD CONSTRAINT SYS_C0013756 PRIMARY KEY (sched_name, lock_name);

-- ----------------------------
-- Checks structure for table qrtz_locks
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_locks ADD CONSTRAINT SYS_C0013667 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_locks ADD CONSTRAINT SYS_C0013668 CHECK (lock_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_paused_trigger_grps
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_paused_trigger_grps ADD CONSTRAINT SYS_C0013757 PRIMARY KEY (sched_name, trigger_group);

-- ----------------------------
-- Checks structure for table qrtz_paused_trigger_grps
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_paused_trigger_grps ADD CONSTRAINT SYS_C0013669 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_paused_trigger_grps ADD CONSTRAINT SYS_C0013670 CHECK (trigger_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_scheduler_state
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_scheduler_state ADD CONSTRAINT SYS_C0013758 PRIMARY KEY (sched_name, instance_name);

-- ----------------------------
-- Checks structure for table qrtz_scheduler_state
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_scheduler_state ADD CONSTRAINT SYS_C0013671 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_scheduler_state ADD CONSTRAINT SYS_C0013672 CHECK (instance_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_scheduler_state ADD CONSTRAINT SYS_C0013673 CHECK (last_checkin_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_scheduler_state ADD CONSTRAINT SYS_C0013674 CHECK (checkin_interval IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_simple_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_simple_triggers ADD CONSTRAINT SYS_C0013759 PRIMARY KEY (sched_name, trigger_name, trigger_group);

-- ----------------------------
-- Checks structure for table qrtz_simple_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_simple_triggers ADD CONSTRAINT SYS_C0013675 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_simple_triggers ADD CONSTRAINT SYS_C0013676 CHECK (trigger_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_simple_triggers ADD CONSTRAINT SYS_C0013677 CHECK (trigger_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_simple_triggers ADD CONSTRAINT SYS_C0013678 CHECK (repeat_count IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_simple_triggers ADD CONSTRAINT SYS_C0013679 CHECK (repeat_interval IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_simple_triggers ADD CONSTRAINT SYS_C0013680 CHECK (times_triggered IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_simprop_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_simprop_triggers ADD CONSTRAINT SYS_C0013760 PRIMARY KEY (sched_name, trigger_name, trigger_group);

-- ----------------------------
-- Checks structure for table qrtz_simprop_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_simprop_triggers ADD CONSTRAINT SYS_C0013681 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_simprop_triggers ADD CONSTRAINT SYS_C0013682 CHECK (trigger_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_simprop_triggers ADD CONSTRAINT SYS_C0013683 CHECK (trigger_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table qrtz_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013761 PRIMARY KEY (sched_name, trigger_name, trigger_group);

-- ----------------------------
-- Checks structure for table qrtz_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013684 CHECK (sched_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013685 CHECK (trigger_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013686 CHECK (trigger_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013687 CHECK (job_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013688 CHECK (job_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013689 CHECK (trigger_state IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013690 CHECK (trigger_type IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.qrtz_triggers ADD CONSTRAINT SYS_C0013691 CHECK (start_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table qrtz_triggers
-- ----------------------------
CREATE INDEX ANIVIA.sched_name
  ON ANIVIA.qrtz_triggers (sched_name ASC, job_name ASC, job_group ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  FLASH_CACHE DEFAULT
)
   USABLE;

-- ----------------------------
-- Primary Key structure for table rel_user_auth_product
-- ----------------------------
ALTER TABLE ANIVIA.rel_user_auth_product ADD CONSTRAINT SYS_C0013762 PRIMARY KEY (user_id, auth_id, auth_product_type);

-- ----------------------------
-- Checks structure for table rel_user_auth_product
-- ----------------------------
ALTER TABLE ANIVIA.rel_user_auth_product ADD CONSTRAINT SYS_C0013692 CHECK (user_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.rel_user_auth_product ADD CONSTRAINT SYS_C0013693 CHECK (auth_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.rel_user_auth_product ADD CONSTRAINT SYS_C0013694 CHECK (auth_product_type IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_config
-- ----------------------------
ALTER TABLE ANIVIA.system_config ADD CONSTRAINT SYS_C0013763 PRIMARY KEY (config_id);

-- ----------------------------
-- Checks structure for table system_config
-- ----------------------------
ALTER TABLE ANIVIA.system_config ADD CONSTRAINT SYS_C0013695 CHECK (config_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_dept
-- ----------------------------
ALTER TABLE ANIVIA.system_dept ADD CONSTRAINT SYS_C0013764 PRIMARY KEY (dept_id);

-- ----------------------------
-- Checks structure for table system_dept
-- ----------------------------
ALTER TABLE ANIVIA.system_dept ADD CONSTRAINT SYS_C0013696 CHECK (dept_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_dict_data
-- ----------------------------
ALTER TABLE ANIVIA.system_dict_data ADD CONSTRAINT SYS_C0013766 PRIMARY KEY (dict_code);

-- ----------------------------
-- Checks structure for table system_dict_data
-- ----------------------------
ALTER TABLE ANIVIA.system_dict_data ADD CONSTRAINT SYS_C0013698 CHECK (dict_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_dict_type
-- ----------------------------
ALTER TABLE ANIVIA.system_dict_type ADD CONSTRAINT SYS_C0013765 PRIMARY KEY (dict_id);

-- ----------------------------
-- Checks structure for table system_dict_type
-- ----------------------------
ALTER TABLE ANIVIA.system_dict_type ADD CONSTRAINT SYS_C0013697 CHECK (dict_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table system_dict_type
-- ----------------------------
CREATE UNIQUE INDEX ANIVIA.dict_type
  ON ANIVIA.system_dict_type (dict_type ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  FLASH_CACHE DEFAULT
)
   USABLE;

-- ----------------------------
-- Primary Key structure for table system_job
-- ----------------------------
ALTER TABLE ANIVIA.system_job ADD CONSTRAINT SYS_C0013767 PRIMARY KEY (job_id, job_name, job_group);

-- ----------------------------
-- Checks structure for table system_job
-- ----------------------------
ALTER TABLE ANIVIA.system_job ADD CONSTRAINT SYS_C0013699 CHECK (job_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_job ADD CONSTRAINT SYS_C0013700 CHECK (job_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_job ADD CONSTRAINT SYS_C0013701 CHECK (job_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_job ADD CONSTRAINT SYS_C0013702 CHECK (invoke_target IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_job_log
-- ----------------------------
ALTER TABLE ANIVIA.system_job_log ADD CONSTRAINT SYS_C0013768 PRIMARY KEY (job_log_id);

-- ----------------------------
-- Checks structure for table system_job_log
-- ----------------------------
ALTER TABLE ANIVIA.system_job_log ADD CONSTRAINT SYS_C0013703 CHECK (job_log_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_job_log ADD CONSTRAINT SYS_C0013704 CHECK (job_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_job_log ADD CONSTRAINT SYS_C0013705 CHECK (job_group IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_job_log ADD CONSTRAINT SYS_C0013706 CHECK (invoke_target IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_logininfor
-- ----------------------------
ALTER TABLE ANIVIA.system_logininfor ADD CONSTRAINT SYS_C0013769 PRIMARY KEY (info_id);

-- ----------------------------
-- Checks structure for table system_logininfor
-- ----------------------------
ALTER TABLE ANIVIA.system_logininfor ADD CONSTRAINT SYS_C0013707 CHECK (info_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table system_logininfor
-- ----------------------------
CREATE INDEX ANIVIA.idx_sys_logininfor_lt
  ON ANIVIA.system_logininfor (login_time ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  FLASH_CACHE DEFAULT
)
   USABLE;
CREATE INDEX ANIVIA.idx_sys_logininfor_s
  ON ANIVIA.system_logininfor (status ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  FLASH_CACHE DEFAULT
)
   USABLE;

-- ----------------------------
-- Primary Key structure for table system_menu
-- ----------------------------
ALTER TABLE ANIVIA.system_menu ADD CONSTRAINT SYS_C0013771 PRIMARY KEY (menu_id);

-- ----------------------------
-- Checks structure for table system_menu
-- ----------------------------
ALTER TABLE ANIVIA.system_menu ADD CONSTRAINT SYS_C0013708 CHECK (menu_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_menu ADD CONSTRAINT SYS_C0013709 CHECK (menu_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_notice
-- ----------------------------
ALTER TABLE ANIVIA.system_notice ADD CONSTRAINT SYS_C0013770 PRIMARY KEY (notice_id);

-- ----------------------------
-- Checks structure for table system_notice
-- ----------------------------
ALTER TABLE ANIVIA.system_notice ADD CONSTRAINT SYS_C0013710 CHECK (notice_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_notice ADD CONSTRAINT SYS_C0013711 CHECK (notice_title IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_notice ADD CONSTRAINT SYS_C0013712 CHECK (notice_type IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_oper_log
-- ----------------------------
ALTER TABLE ANIVIA.system_oper_log ADD CONSTRAINT SYS_C0013772 PRIMARY KEY (oper_id);

-- ----------------------------
-- Checks structure for table system_oper_log
-- ----------------------------
ALTER TABLE ANIVIA.system_oper_log ADD CONSTRAINT SYS_C0013713 CHECK (oper_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table system_oper_log
-- ----------------------------
CREATE INDEX ANIVIA.idx_sys_oper_log_bt
  ON ANIVIA.system_oper_log (business_type ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  FLASH_CACHE DEFAULT
)
   USABLE;
CREATE INDEX ANIVIA.idx_sys_oper_log_ot
  ON ANIVIA.system_oper_log (oper_time ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  FLASH_CACHE DEFAULT
)
   USABLE;
CREATE INDEX ANIVIA.idx_sys_oper_log_s
  ON ANIVIA.system_oper_log (status ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  FLASH_CACHE DEFAULT
)
   USABLE;

-- ----------------------------
-- Primary Key structure for table system_post
-- ----------------------------
ALTER TABLE ANIVIA.system_post ADD CONSTRAINT SYS_C0013773 PRIMARY KEY (post_id);

-- ----------------------------
-- Checks structure for table system_post
-- ----------------------------
ALTER TABLE ANIVIA.system_post ADD CONSTRAINT SYS_C0013714 CHECK (post_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_post ADD CONSTRAINT SYS_C0013715 CHECK (post_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_post ADD CONSTRAINT SYS_C0013716 CHECK (post_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_post ADD CONSTRAINT SYS_C0013717 CHECK (post_sort IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_post ADD CONSTRAINT SYS_C0013718 CHECK (status IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_role
-- ----------------------------
ALTER TABLE ANIVIA.system_role ADD CONSTRAINT SYS_C0013774 PRIMARY KEY (role_id);

-- ----------------------------
-- Checks structure for table system_role
-- ----------------------------
ALTER TABLE ANIVIA.system_role ADD CONSTRAINT SYS_C0013719 CHECK (role_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_role ADD CONSTRAINT SYS_C0013720 CHECK (role_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_role ADD CONSTRAINT SYS_C0013721 CHECK (role_key IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_role ADD CONSTRAINT SYS_C0013722 CHECK (role_sort IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_role ADD CONSTRAINT SYS_C0013723 CHECK (status IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_role_dept
-- ----------------------------
ALTER TABLE ANIVIA.system_role_dept ADD CONSTRAINT SYS_C0013775 PRIMARY KEY (role_id, dept_id);

-- ----------------------------
-- Checks structure for table system_role_dept
-- ----------------------------
ALTER TABLE ANIVIA.system_role_dept ADD CONSTRAINT SYS_C0013724 CHECK (role_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_role_dept ADD CONSTRAINT SYS_C0013725 CHECK (dept_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_role_menu
-- ----------------------------
ALTER TABLE ANIVIA.system_role_menu ADD CONSTRAINT SYS_C0013776 PRIMARY KEY (role_id, menu_id);

-- ----------------------------
-- Checks structure for table system_role_menu
-- ----------------------------
ALTER TABLE ANIVIA.system_role_menu ADD CONSTRAINT SYS_C0013726 CHECK (role_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_role_menu ADD CONSTRAINT SYS_C0013727 CHECK (menu_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_user
-- ----------------------------
ALTER TABLE ANIVIA.system_user ADD CONSTRAINT SYS_C0013777 PRIMARY KEY (user_id);

-- ----------------------------
-- Checks structure for table system_user
-- ----------------------------
ALTER TABLE ANIVIA.system_user ADD CONSTRAINT SYS_C0013728 CHECK (user_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_user ADD CONSTRAINT SYS_C0013729 CHECK (user_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_user ADD CONSTRAINT SYS_C0013730 CHECK (nick_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_user_post
-- ----------------------------
ALTER TABLE ANIVIA.system_user_post ADD CONSTRAINT SYS_C0013778 PRIMARY KEY (user_id, post_id);

-- ----------------------------
-- Checks structure for table system_user_post
-- ----------------------------
ALTER TABLE ANIVIA.system_user_post ADD CONSTRAINT SYS_C0013731 CHECK (user_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_user_post ADD CONSTRAINT SYS_C0013732 CHECK (post_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table system_user_role
-- ----------------------------
ALTER TABLE ANIVIA.system_user_role ADD CONSTRAINT SYS_C0013779 PRIMARY KEY (user_id, role_id);

-- ----------------------------
-- Checks structure for table system_user_role
-- ----------------------------
ALTER TABLE ANIVIA.system_user_role ADD CONSTRAINT SYS_C0013733 CHECK (user_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.system_user_role ADD CONSTRAINT SYS_C0013734 CHECK (role_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table user_type
-- ----------------------------
ALTER TABLE ANIVIA.user_type ADD CONSTRAINT SYS_C0013780 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table user_type
-- ----------------------------
ALTER TABLE ANIVIA.user_type ADD CONSTRAINT SYS_C0013735 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.user_type ADD CONSTRAINT SYS_C0013736 CHECK (valid_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.user_type ADD CONSTRAINT SYS_C0013737 CHECK (del_flag IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.user_type ADD CONSTRAINT SYS_C0013738 CHECK (create_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE ANIVIA.user_type ADD CONSTRAINT SYS_C0013739 CHECK (update_time IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table qrtz_blob_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_blob_triggers ADD CONSTRAINT qrtz_blob_triggers_ibfk_1 FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES ANIVIA.qrtz_triggers (sched_name, trigger_name, trigger_group) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table qrtz_cron_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_cron_triggers ADD CONSTRAINT qrtz_cron_triggers_ibfk_1 FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES ANIVIA.qrtz_triggers (sched_name, trigger_name, trigger_group) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table qrtz_simple_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_simple_triggers ADD CONSTRAINT qrtz_simple_triggers_ibfk_1 FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES ANIVIA.qrtz_triggers (sched_name, trigger_name, trigger_group) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table qrtz_simprop_triggers
-- ----------------------------
ALTER TABLE ANIVIA.qrtz_simprop_triggers ADD CONSTRAINT qrtz_simprop_triggers_ibfk_1 FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES ANIVIA.qrtz_triggers (sched_name, trigger_name, trigger_group) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
