CREATE TABLE "QMODEL_DEV"."CA_CERT"
(
    "id" BIGINT IDENTITY(11,1) NOT NULL,
    "name" VARCHAR(90 char) NOT NULL,
 "subject_id" INT NOT NULL,
 "subject_name" VARCHAR(90 char) NOT NULL,
 "certificate" VARCHAR(255 char) NOT NULL,
 "private_key" VARCHAR(255 char) NOT NULL,
 "issuer" VARCHAR(255 char) NOT NULL,
 "possessor" VARCHAR(255 char) NOT NULL,
 "valid_time" VARCHAR(255 char) NOT NULL,
 "valid_flag" INT DEFAULT 1
 NOT NULL,
 "del_flag" INT DEFAULT 0
 NOT NULL,
 "create_by" VARCHAR(90 char) NULL,
 "creator_id" INT NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(90 char) NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(900 char) NULL
);
CREATE TABLE "QMODEL_DEV"."CA_SUBJECT"
(
    "id" BIGINT IDENTITY(11,1) NOT NULL,
    "name" VARCHAR(90 char) NOT NULL,
 "cn" VARCHAR(255 char) NOT NULL,
 "ou" VARCHAR(255 char) NOT NULL,
 "o" VARCHAR(255 char) NOT NULL,
 "l" VARCHAR(255 char) NOT NULL,
 "st" VARCHAR(255 char) NOT NULL,
 "c" VARCHAR(255 char) NOT NULL,
 "certificate" VARCHAR(255 char) NOT NULL,
 "private_key" VARCHAR(255 char) NOT NULL,
 "valid_flag" INT DEFAULT 1
 NOT NULL,
 "del_flag" INT DEFAULT 0
 NOT NULL,
 "create_by" VARCHAR(90 char) NULL,
 "creator_id" INT NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(90 char) NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(900 char) NULL
);
SET IDENTITY_INSERT "QMODEL_DEV"."CA_CERT" ON;
INSERT INTO "QMODEL_DEV"."CA_CERT"("id","name","subject_id","subject_name","certificate","private_key","issuer","possessor","valid_time","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","remark") VALUES(9,'冰凤框架Nginx证书',9,'江苏千桐科技有限公司','/profile/ca/2024/10/23/6718d6e3a921cf6536292244.cer','/profile/ca/2024/10/23/6718d6e3a921cf6536292245.pem','江苏千桐科技有限公司','192.168.0.1','30',1,0,'admin',1,TO_DATE('2024-10-23 18:58:44','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."CA_CERT"("id","name","subject_id","subject_name","certificate","private_key","issuer","possessor","valid_time","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","remark") VALUES(10,'测试',9,'江苏千桐科技有限公司','/profile/ca/2024/12/09/6756acfbe2f804e7283bef9d.cer','/profile/ca/2024/12/09/6756acfbe2f804e7283bef9e.pem','江苏千桐科技有限公司','1000','3',1,0,'admin',1,TO_DATE('2024-12-09 16:40:27','YYYY-MM-DD HH24:MI:SS'),null,null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."CA_CERT" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."CA_SUBJECT" ON;
INSERT INTO "QMODEL_DEV"."CA_SUBJECT"("id","name","cn","ou","o","l","st","c","certificate","private_key","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","remark") VALUES(9,'江苏千桐科技有限公司','江苏千桐科技有限公司','技术部','技术部','南京','江苏','中国','/profile/ca/2024/10/23/6718d658a921cf6536292242.cer','/profile/ca/2024/10/23/6718d658a921cf6536292243.pem',1,0,'admin',1,TO_DATE('2024-10-23 18:56:25','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."CA_SUBJECT"("id","name","cn","ou","o","l","st","c","certificate","private_key","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","remark") VALUES(10,'12','12','12','12','12','12','12','/profile/ca/2024/12/09/6756abdbe2f804e7283bef9b.cer','/profile/ca/2024/12/09/6756abdbe2f804e7283bef9c.pem',1,0,'admin',1,TO_DATE('2024-12-09 16:35:39','YYYY-MM-DD HH24:MI:SS'),null,null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."CA_SUBJECT" OFF;
ALTER TABLE "QMODEL_DEV"."CA_CERT" ADD CONSTRAINT "CA_CERT_PRIMARY" PRIMARY KEY("id") ;

ALTER TABLE "QMODEL_DEV"."CA_SUBJECT" ADD CONSTRAINT "CA_SUBJECT_PRIMARY" PRIMARY KEY("id") ;

COMMENT ON TABLE "QMODEL_DEV"."CA_CERT" IS '证书管理';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."id" IS 'ID;ID';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."name" IS '证书名称';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."subject_id" IS '主体id';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."subject_name" IS '主体名称';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."certificate" IS '证书;证书';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."private_key" IS '私钥;私钥';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."issuer" IS '颁发者';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."possessor" IS '所有者';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."valid_time" IS '有效期';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."valid_flag" IS '是否有效;0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."del_flag" IS '删除标志;1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."create_by" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."creator_id" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."update_by" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."CA_CERT"."remark" IS '备注;备注';

COMMENT ON TABLE "QMODEL_DEV"."CA_SUBJECT" IS '主体管理';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."id" IS 'ID;主体ID';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."name" IS '主体名称;主体名称';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."cn" IS '通用名称;通用名称';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."ou" IS '组织部门;组织单位名称';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."o" IS '组织名称';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."l" IS '城市名称';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."st" IS '省名称';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."c" IS '国家';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."certificate" IS '证书;证书';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."private_key" IS '私钥;私钥';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."valid_flag" IS '是否有效;是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."del_flag" IS '删除标志;删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."create_by" IS '创建人;创建人';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."creator_id" IS '创建人id;创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."create_time" IS '创建时间;创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."update_by" IS '更新人;更新人';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."update_time" IS '更新时间;更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."CA_SUBJECT"."remark" IS '备注;备注';

CREATE TABLE "QMODEL_DEV"."EXAMPLE_STUDENT"
(
    "id" BIGINT IDENTITY(82,1) NOT NULL,
    "name" VARCHAR(256 char) NOT NULL,
 "picture_url" VARCHAR(3072 char) NULL,
 "experience" VARCHAR(3072 char) NULL,
 "sex" INT NULL,
 "birthday" TIMESTAMP(0) NULL,
 "age" INT NOT NULL,
 "student_number" VARCHAR(128 char) NULL,
 "grade" INT NULL,
 "hobby" VARCHAR(3072 char) NULL,
 "valid_flag" TINYINT DEFAULT 1
 NOT NULL,
 "del_flag" TINYINT DEFAULT 0
 NOT NULL,
 "create_by" VARCHAR(32 char) NULL,
 "creator_id" BIGINT NULL,
 "create_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "update_by" VARCHAR(32 char) NULL,
 "updator_id" BIGINT NULL,
 "update_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "remark" VARCHAR(512 char) NULL
);
CREATE TABLE "QMODEL_DEV"."GEN_TABLE"
(
    "table_id" BIGINT IDENTITY(137,1) NOT NULL,
    "table_name" VARCHAR(200 char) DEFAULT ''
 NULL,
 "table_comment" VARCHAR(500 char) DEFAULT ''
 NULL,
 "sub_table_name" VARCHAR(64 char) NULL,
 "sub_table_fk_name" VARCHAR(64 char) NULL,
 "class_name" VARCHAR(100 char) DEFAULT ''
 NULL,
 "tpl_category" VARCHAR(200 char) DEFAULT 'crud'
 NULL,
 "tpl_web_type" VARCHAR(30 char) DEFAULT ''
 NULL,
 "package_name" VARCHAR(100 char) NULL,
 "module_name" VARCHAR(30 char) NULL,
 "business_name" VARCHAR(30 char) NULL,
 "function_name" VARCHAR(50 char) NULL,
 "function_author" VARCHAR(50 char) NULL,
 "gen_type" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "gen_path" VARCHAR(200 char) DEFAULT '/'
 NULL,
 "options" VARCHAR(1000 char) NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) NULL
);
CREATE TABLE "QMODEL_DEV"."GEN_TABLE_COLUMN"
(
    "column_id" BIGINT IDENTITY(2206,1) NOT NULL,
    "table_id" BIGINT NULL,
    "column_name" VARCHAR(200 char) NULL,
 "column_comment" VARCHAR(500 char) NULL,
 "column_type" VARCHAR(100 char) NULL,
 "java_type" VARCHAR(500 char) NULL,
 "java_field" VARCHAR(200 char) NULL,
 "is_pk" VARCHAR(1 char) NULL,
 "is_increment" VARCHAR(1 char) NULL,
 "is_required" VARCHAR(1 char) NULL,
 "is_insert" VARCHAR(1 char) NULL,
 "is_edit" VARCHAR(1 char) NULL,
 "is_list" VARCHAR(1 char) NULL,
 "is_query" VARCHAR(1 char) NULL,
 "query_type" VARCHAR(200 char) DEFAULT 'EQ'
 NULL,
 "html_type" VARCHAR(200 char) NULL,
 "dict_type" VARCHAR(200 char) DEFAULT ''
 NULL,
 "sort" INT NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL
);
CREATE TABLE "QMODEL_DEV"."MESSAGE"
(
    "id" INT IDENTITY(49,1) NOT NULL,
    "sender_id" BIGINT NULL,
    "receiver_id" BIGINT NULL,
    "title" VARCHAR(128 char) NOT NULL,
 "content" VARCHAR(3072 char) NOT NULL,
 "category" INT NOT NULL,
 "msg_level" INT DEFAULT 0
 NOT NULL,
 "module" INT DEFAULT 0
 NOT NULL,
 "entity_type" INT NULL,
 "entity_id" BIGINT NULL,
 "entity_url" VARCHAR(256 char) NULL,
 "has_read" TINYINT DEFAULT 0
 NULL,
 "has_retraction" TINYINT DEFAULT 0
 NULL,
 "valid_flag" TINYINT DEFAULT 1
 NOT NULL,
 "del_flag" TINYINT DEFAULT 0
 NOT NULL,
 "create_by" VARCHAR(32 char) NULL,
 "creator_id" BIGINT NULL,
 "create_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "update_by" VARCHAR(32 char) NULL,
 "update_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "updator_id" BIGINT NULL,
 "remark" VARCHAR(512 char) NULL
);
CREATE TABLE "QMODEL_DEV"."MESSAGE_TEMPLATE"
(
    "id" INT IDENTITY(3,1) NOT NULL,
    "title" VARCHAR(128 char) NOT NULL,
 "content" VARCHAR(3072 char) NOT NULL,
 "category" INT NOT NULL,
 "msg_level" INT DEFAULT 0
 NOT NULL,
 "valid_flag" TINYINT DEFAULT 1
 NOT NULL,
 "del_flag" TINYINT DEFAULT 0
 NOT NULL,
 "create_by" VARCHAR(32 char) NULL,
 "creator_id" BIGINT NULL,
 "create_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "update_by" VARCHAR(32 char) NULL,
 "updator_id" BIGINT NULL,
 "update_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "remark" VARCHAR(512 char) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL"
(
    "ID" BIGINT IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "CLASSIFY_ID" INTEGER NULL,
    "ANCESTORS" VARCHAR2(510) NULL,
    "NAME" VARCHAR2(256) NULL,
    "DESCRIPTION" VARCHAR2(1024) NULL,
    "TYPE" INTEGER NULL,
    "DIMENSIONS" INTEGER NULL,
    "VERSION" VARCHAR2(128) NULL,
    "INTERFACE_ADDRESS" VARCHAR2(256) NULL,
    "BUILTIN" INTEGER NULL,
    "FORMAT" INTEGER NULL,
    "SIZE" INTEGER NULL,
    "SOURCE" VARCHAR2(256) NULL,
    "UPLOAD_STATUS" INTEGER NULL,
    "UPLOAD_TIME" DATETIME(6) NULL,
    "UPLOAD_INTERFACE" VARCHAR2(256) NULL,
    "UPLOAD_FILE" VARCHAR2(256) NULL,
    "UPLOAD_LOCATION" VARCHAR2(256) NULL,
    "VALID_FLAG" INTEGER DEFAULT '1'
        NOT NULL,
    "DEL_FLAG" INTEGER DEFAULT '0'
        NOT NULL,
    "CREATE_BY" VARCHAR2(64) NULL,
    "CREATOR_ID" INTEGER NULL,
    "CREATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
        NULL,
    "UPDATE_BY" VARCHAR2(64) NULL,
    "UPDATOR_ID" INTEGER NULL,
    "UPDATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
        NULL,
    "REMARK" VARCHAR2(1024) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_CACL"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "CODE" VARCHAR2(128) NULL,
    "NAME" VARCHAR2(256) NULL,
    "MODEL_ID" INTEGER NULL,
    "MODEL_NAME" VARCHAR2(256) NULL,
    "MODEL_VERSION" VARCHAR2(128) NULL,
    "START_TIME" DATETIME(6) NULL,
    "END_TIME" DATETIME(6) NULL,
    "STATUS" INTEGER NULL,
    "INPUT_CONTENT" VARCHAR2(6144) NULL,
    "OUTPUT_CONTENT" VARCHAR2(6144) NULL,
    "VALID_FLAG" INTEGER DEFAULT '1'
        NOT NULL,
    "DEL_FLAG" INTEGER DEFAULT '0'
        NOT NULL,
    "CREATE_BY" VARCHAR2(64) NULL,
    "CREATOR_ID" INTEGER NULL,
    "CREATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
        NOT NULL,
    "UPDATE_BY" VARCHAR2(64) NULL,
    "UPDATOR_ID" INTEGER NULL,
    "UPDATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
        NOT NULL,
    "REMARK" VARCHAR2(1024) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "CODE" VARCHAR2(128) NULL,
    "NAME" VARCHAR2(256) NULL,
    "MODEL_ID" INTEGER NULL,
    "MODEL_NAME" VARCHAR2(256) NULL,
    "MODEL_VERSION" VARCHAR2(128) NULL,
    "START_TIME" DATETIME(6) NULL,
    "END_TIME" DATETIME(6) NULL,
    "STATUS" INTEGER NULL,
    "INPUT_CONTENT" VARCHAR2(6144) NULL,
    "OUTPUT_CONTENT" TEXT NULL,
    "VALID_FLAG" INTEGER DEFAULT '1'
        NOT NULL,
    "DEL_FLAG" INTEGER DEFAULT '0'
        NOT NULL,
    "CREATE_BY" VARCHAR2(64) NULL,
    "CREATOR_ID" INTEGER NULL,
    "CREATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
        NOT NULL,
    "UPDATE_BY" VARCHAR2(64) NULL,
    "UPDATOR_ID" INTEGER NULL,
    "UPDATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
        NOT NULL,
    "REMARK" VARCHAR2(1024) NULL,
    "ADDRESS_ID" INTEGER NULL,
    "ADDRESS_TYPE" INTEGER NULL,
    "MP_PROGRAMME_ID" INTEGER NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_CLASSIFY"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "PARENT_ID" INTEGER NULL,
    "ANCESTORS" VARCHAR2(100) NULL,
    "NAME" VARCHAR2(256) NULL,
    "DESCRIPTION" VARCHAR2(1024) NULL,
    "VALID_FLAG" INTEGER DEFAULT '1'
                         NOT NULL,
    "DEL_FLAG" INTEGER DEFAULT '0'
                         NOT NULL,
    "CREATE_BY" VARCHAR2(64) NULL,
    "CREATOR_ID" INTEGER NULL,
    "CREATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "UPDATE_BY" VARCHAR2(64) NULL,
    "UPDATOR_ID" INTEGER NULL,
    "UPDATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "REMARK" VARCHAR2(1024) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_COMPUTE"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "START_TIME" TIMESTAMP(6) NOT NULL,
    "CREATE_BY_ID" INTEGER NULL,
    "CREATE_BY" VARCHAR2(100) DEFAULT ''
        NULL,
    "CREATE_TIME" TIMESTAMP(6) NULL,
    "NAME" VARCHAR2(100) NULL,
    "MONITOR1" NUMBER(9,6) NULL,
    "MONITOR2" NUMBER(9,6) NULL,
    "MONITOR3" NUMBER(9,6) NULL,
    "AVG_RAIN_FALL" NUMBER(9,6) NULL,
    "RAIN_FALL_LAST" NUMBER(9,6) NULL,
    "WATER_SCALE" NUMBER(9,6) NULL,
    "Z" NUMBER(20,6) NULL,
    "Q" NUMBER(20,6) NULL,
    "SOIL_CONDITION" VARCHAR2(2) DEFAULT '0'
        NOT NULL,
    "ZFZSXSKC" NUMBER(9,6) NULL,
    "ZFZSXSC" NUMBER(9,6) NULL,
    "ZLSXL" NUMBER(9,6) NULL,
    "SCZLSXL" NUMBER(9,6) NULL,
    "XCZLSXL" NUMBER(9,6) NULL,
    "SCZLSXLWDO" NUMBER(9,6) NULL,
    "PJZLSXL" NUMBER(9,6) NULL,
    "LYSCZLSXL" NUMBER(9,6) NULL,
    "LYXCZLSXL" NUMBER(9,6) NULL,
    "LYSCZLSXLWDO" NUMBER(9,6) NULL,
    "XTXS" NUMBER(9,6) NULL,
    "JL" NUMBER(9,6) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_HISTORY"
(
    "ID" BIGINT IDENTITY(1251,1) NOT NULL,
    "COMPANY_ID" BIGINT NULL,
    "MODEL_ID" BIGINT NULL,
    "MODEL_NAME" VARCHAR(256) NULL,
    "CONTEXT" VARCHAR(1024) NULL,
    "START_TIME" TIMESTAMP(0) NULL,
    "MODEL_VERSION" VARCHAR(128) NULL,
    "VALID_FLAG" TINYINT DEFAULT 1
        NOT NULL,
    "DEL_FLAG" TINYINT DEFAULT 0
        NOT NULL,
    "CREATE_BY" VARCHAR(64) NULL,
    "CREATOR_ID" BIGINT NULL,
    "CREATE_TIME" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
        NOT NULL,
    "UPDATE_BY" VARCHAR(64) NULL,
    "UPDATOR_ID" BIGINT NULL,
    "UPDATE_TIME" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
        NOT NULL,
    "REMARK" VARCHAR(1024) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_INPUT"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "NAME" VARCHAR2(256) NULL,
    "ENG_NAME" VARCHAR2(256) NULL,
    "TYPE" INTEGER NULL,
    "MODEL_ID" INTEGER NULL,
    "MODEL_NAME" VARCHAR2(256) NULL,
    "MODEL_VERSION" VARCHAR2(128) NULL,
    "DESCRIPTION" VARCHAR2(1024) NULL,
    "EXAMPLE" VARCHAR2(512) NULL,
    "PARAM_FILE" VARCHAR2(512) NULL,
    "SINGLE_CONTENT" VARCHAR2(6144) NULL,
    "MULTIPLE_CONTENT" VARCHAR2(6144) NULL,
    "VALID_FLAG" INTEGER DEFAULT '1'
                         NOT NULL,
    "DEL_FLAG" INTEGER DEFAULT '0'
                         NOT NULL,
    "CREATE_BY" VARCHAR2(64) NULL,
    "CREATOR_ID" INTEGER NULL,
    "CREATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "UPDATE_BY" VARCHAR2(64) NULL,
    "UPDATOR_ID" INTEGER NULL,
    "UPDATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "REMARK" VARCHAR2(1024) NULL,
    "CHANGE_FLAG" NUMBER(1,0) DEFAULT 0
        NOT NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"
(
    "ID" BIGINT IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" NUMBER(10,0) NULL,
    "MODEL_ID" BIGINT NULL,
    "INTERFACE_ADDRESS" VARCHAR2(512) NULL,
    "VERSION_ID" BIGINT NULL,
    "REQUEST_METHOD" BIGINT NULL,
    "INPUT_PARAMETER" TEXT NULL,
    "OUTPUT_PARAMETER" TEXT NULL,
    "DEL_FLAG" BIGINT DEFAULT 0
        NOT NULL,
    "CREATE_BY" VARCHAR2(512) NULL,
    "CREATOR_ID" BIGINT NULL,
    "CREATE_TIME" DATETIME(6) NULL,
    "UPDATE_BY" VARCHAR2(512) NULL,
    "UPDATOR_ID" BIGINT NULL,
    "UPDATE_TIME" DATETIME(6) NULL,
    "REMARK" VARCHAR2(4096) NULL,
    "INPUT_PARAMETER_ILLUSTRATE" TEXT NULL,
    "OUTPUT_PARAMETER_ILLUSTRATE" TEXT NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_OPERATE"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "MODULE_NAME" VARCHAR2(256) NULL,
    "TYPE" INTEGER NULL,
    "CONTENT" VARCHAR2(256) NULL,
    "METHOD" VARCHAR2(2048) NULL,
    "REQ_CONTENT" VARCHAR2(2048) NULL,
    "RESP_CONTENT" VARCHAR2(2048) NULL,
    "IP" VARCHAR2(128) NULL,
    "ADDRESS" VARCHAR2(128) NULL,
    "STATUS" INTEGER NULL,
    "VALID_FLAG" INTEGER DEFAULT '1'
                         NOT NULL,
    "DEL_FLAG" INTEGER DEFAULT '0'
                         NOT NULL,
    "CREATE_BY" VARCHAR2(64) NULL,
    "CREATOR_ID" INTEGER NULL,
    "CREATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "UPDATE_BY" VARCHAR2(64) NULL,
    "UPDATOR_ID" INTEGER NULL,
    "UPDATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "REMARK" VARCHAR2(1024) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_OUTPUT"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "NAME" VARCHAR2(256) NULL,
    "ENG_NAME" VARCHAR2(256) NULL,
    "TYPE" INTEGER NULL,
    "MODEL_ID" INTEGER NULL,
    "MODEL_NAME" VARCHAR2(256) NULL,
    "MODEL_VERSION" VARCHAR2(128) NULL,
    "DESCRIPTION" VARCHAR2(1024) NULL,
    "SINGLE_CONTENT" VARCHAR2(6144) NULL,
    "MULTIPLE_CONTENT" VARCHAR2(6144) NULL,
    "VALID_FLAG" INTEGER DEFAULT '1'
                         NOT NULL,
    "DEL_FLAG" INTEGER DEFAULT '0'
                         NOT NULL,
    "CREATE_BY" VARCHAR2(64) NULL,
    "CREATOR_ID" INTEGER NULL,
    "CREATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "UPDATE_BY" VARCHAR2(64) NULL,
    "UPDATOR_ID" INTEGER NULL,
    "UPDATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "REMARK" VARCHAR2(1024) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_RECONSTITUTION"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "NAME" VARCHAR2(256) NULL,
    "CLASSIFY_ID" NUMBER(10,0) NULL,
    "BUILTIN" NUMBER(10,0) NULL,
    "ACCESS_MODE" NUMBER(10,0) NULL,
    "REQUEST_METHOD" NUMBER(10,0) NULL,
    "INTERFACEORFILE_ADDRESS" VARCHAR2(512) NULL,
    "VERSION_ID" NUMBER(10,0) NULL,
    "WHETHER_PUBLISH" NUMBER(10,0) DEFAULT 0
        NOT NULL,
    "PUBLISH_TIME" DATETIME(6) NULL,
    "DEL_FLAG" BIGINT DEFAULT 0
        NOT NULL,
    "CREATE_BY" VARCHAR2(512) NULL,
    "CREATOR_ID" BIGINT NULL,
    "CREATE_TIME" DATETIME(6) NULL,
    "UPDATE_BY" VARCHAR2(512) NULL,
    "UPDATOR_ID" BIGINT NULL,
    "UPDATE_TIME" DATETIME(6) NULL,
    "REMARK" VARCHAR2(4096) NULL,
    "PORT" VARCHAR2(100) NULL,
    "FILE_NAME" VARCHAR2(100) NULL,
    "RUNNABLE_FILE_ADDRESS" VARCHAR2(50) NULL
);
CREATE TABLE "QMODEL_DEV"."MODEL_VERSION"
(
    "ID" INTEGER IDENTITY(1,1) NOT NULL,
    "COMPANY_ID" INTEGER NULL,
    "MODEL_ID" INTEGER NULL,
    "MODEL_NAME" VARCHAR2(256) NULL,
    "VERSION" VARCHAR2(128) NULL,
    "FILE_ADDRESS" VARCHAR2(256) NULL,
    "INTERFACE_ADDRESS" VARCHAR2(256) NULL,
    "STATUS" INTEGER NULL,
    "DESCRIPTION" VARCHAR2(1024) NULL,
    "VALID_FLAG" INTEGER DEFAULT '1'
                         NOT NULL,
    "DEL_FLAG" INTEGER DEFAULT '0'
                         NOT NULL,
    "CREATE_BY" VARCHAR2(64) NULL,
    "CREATOR_ID" INTEGER NULL,
    "CREATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "UPDATE_BY" VARCHAR2(64) NULL,
    "UPDATOR_ID" INTEGER NULL,
    "UPDATE_TIME" DATETIME(6) DEFAULT CURRENT_TIMESTAMP
                         NOT NULL,
    "REMARK" VARCHAR2(1024) NULL,
    "FILE_NAME" VARCHAR2(100) NULL,
    "RUNNABLE_FILE_ADDRESS" VARCHAR2(50) NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_BLOB_TRIGGERS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "trigger_name" VARCHAR(200 char) NOT NULL,
 "trigger_group" VARCHAR(200 char) NOT NULL,
 "blob_data" BLOB NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_CALENDARS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "calendar_name" VARCHAR(200 char) NOT NULL,
 "calendar" BLOB NOT NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "trigger_name" VARCHAR(200 char) NOT NULL,
 "trigger_group" VARCHAR(200 char) NOT NULL,
 "cron_expression" VARCHAR(200 char) NOT NULL,
 "time_zone_id" VARCHAR(80 char) NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "entry_id" VARCHAR(95 char) NOT NULL,
 "trigger_name" VARCHAR(200 char) NOT NULL,
 "trigger_group" VARCHAR(200 char) NOT NULL,
 "instance_name" VARCHAR(200 char) NOT NULL,
 "fired_time" BIGINT NOT NULL,
 "sched_time" BIGINT NOT NULL,
 "priority" INT NOT NULL,
 "state" VARCHAR(16 char) NOT NULL,
 "job_name" VARCHAR(200 char) NULL,
 "job_group" VARCHAR(200 char) NULL,
 "is_nonconcurrent" VARCHAR(1 char) NULL,
 "requests_recovery" VARCHAR(1 char) NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_JOB_DETAILS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "job_name" VARCHAR(200 char) NOT NULL,
 "job_group" VARCHAR(200 char) NOT NULL,
 "description" VARCHAR(250 char) NULL,
 "job_class_name" VARCHAR(250 char) NOT NULL,
 "is_durable" VARCHAR(1 char) NOT NULL,
 "is_nonconcurrent" VARCHAR(1 char) NOT NULL,
 "is_update_data" VARCHAR(1 char) NOT NULL,
 "requests_recovery" VARCHAR(1 char) NOT NULL,
 "job_data" BLOB NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_LOCKS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "lock_name" VARCHAR(40 char) NOT NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_PAUSED_TRIGGER_GRPS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "trigger_group" VARCHAR(200 char) NOT NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_SCHEDULER_STATE"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "instance_name" VARCHAR(200 char) NOT NULL,
 "last_checkin_time" BIGINT NOT NULL,
 "checkin_interval" BIGINT NOT NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "trigger_name" VARCHAR(200 char) NOT NULL,
 "trigger_group" VARCHAR(200 char) NOT NULL,
 "repeat_count" BIGINT NOT NULL,
 "repeat_interval" BIGINT NOT NULL,
 "times_triggered" BIGINT NOT NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "trigger_name" VARCHAR(200 char) NOT NULL,
 "trigger_group" VARCHAR(200 char) NOT NULL,
 "str_prop_1" VARCHAR(512 char) NULL,
 "str_prop_2" VARCHAR(512 char) NULL,
 "str_prop_3" VARCHAR(512 char) NULL,
 "int_prop_1" INT NULL,
 "int_prop_2" INT NULL,
 "long_prop_1" BIGINT NULL,
 "long_prop_2" BIGINT NULL,
 "dec_prop_1" DECIMAL(13,4) NULL,
 "dec_prop_2" DECIMAL(13,4) NULL,
 "bool_prop_1" VARCHAR(1 char) NULL,
 "bool_prop_2" VARCHAR(1 char) NULL
);
CREATE TABLE "QMODEL_DEV"."QRTZ_TRIGGERS"
(
    "sched_name" VARCHAR(120 char) NOT NULL,
 "trigger_name" VARCHAR(200 char) NOT NULL,
 "trigger_group" VARCHAR(200 char) NOT NULL,
 "job_name" VARCHAR(200 char) NOT NULL,
 "job_group" VARCHAR(200 char) NOT NULL,
 "description" VARCHAR(250 char) NULL,
 "next_fire_time" BIGINT NULL,
 "prev_fire_time" BIGINT NULL,
 "priority" INT NULL,
 "trigger_state" VARCHAR(16 char) NOT NULL,
 "trigger_type" VARCHAR(8 char) NOT NULL,
 "start_time" BIGINT NOT NULL,
 "end_time" BIGINT NULL,
 "calendar_name" VARCHAR(200 char) NULL,
 "misfire_instr" SMALLINT NULL,
 "job_data" BLOB NULL
);
CREATE TABLE "QMODEL_DEV"."REL_USER_AUTH_PRODUCT"
(
    "user_id" BIGINT NOT NULL,
    "auth_id" VARCHAR(256 char) NOT NULL,
 "auth_product_type" INT DEFAULT 0
 NOT NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_CONFIG"
(
    "config_id" INT IDENTITY(7,1) NOT NULL,
    "config_name" VARCHAR(100 char) DEFAULT ''
 NULL,
 "config_key" VARCHAR(100 char) DEFAULT ''
 NULL,
 "config_value" VARCHAR(500 char) DEFAULT ''
 NULL,
 "config_type" VARCHAR(1 char) DEFAULT 'N'
 NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_CONTENT"
(
    "id" INT NOT NULL,
    "sys_name" VARCHAR(255 char) NULL,
 "logo" VARCHAR(255 char) NULL,
 "login_logo" VARCHAR(255 char) NULL,
 "carousel_image" VARCHAR(512 char) NULL,
 "contact_number" VARCHAR(255 char) NULL,
 "email" VARCHAR(255 char) NULL,
 "copyright" VARCHAR(255 char) NULL,
 "record_number" VARCHAR(255 char) NULL,
 "del_flag" INT NULL,
 "status" INT NULL,
 "create_by" VARCHAR(255 char) NULL,
 "creator_id" INT NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(255 char) NULL,
 "updator_id" INT NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(255 char) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_DEPT"
(
    "dept_id" BIGINT IDENTITY(110,1) NOT NULL,
    "parent_id" BIGINT DEFAULT 0
        NULL,
    "ancestors" VARCHAR(50 char) DEFAULT ''
 NULL,
 "dept_name" VARCHAR(30 char) DEFAULT ''
 NULL,
 "order_num" INT DEFAULT 0
 NULL,
 "leader" VARCHAR(20 char) NULL,
 "phone" VARCHAR(11 char) NULL,
 "email" VARCHAR(50 char) NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "del_flag" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_DICT_DATA"
(
    "dict_code" BIGINT IDENTITY(102,1) NOT NULL,
    "dict_sort" INT DEFAULT 0
        NULL,
    "dict_label" VARCHAR(100 char) DEFAULT ''
 NULL,
 "dict_value" VARCHAR(100 char) DEFAULT ''
 NULL,
 "dict_type" VARCHAR(100 char) DEFAULT ''
 NULL,
 "css_class" VARCHAR(100 char) NULL,
 "list_class" VARCHAR(100 char) NULL,
 "is_default" VARCHAR(1 char) DEFAULT 'N'
 NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_DICT_TYPE"
(
    "dict_id" BIGINT IDENTITY(31,1) NOT NULL,
    "dict_name" VARCHAR(100 char) DEFAULT ''
 NULL,
 "dict_type" VARCHAR(100 char) DEFAULT ''
 NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_JOB"
(
    "job_id" BIGINT IDENTITY(4,1) NOT NULL,
    "job_name" VARCHAR(64 char) DEFAULT ''
 NOT NULL,
 "job_group" VARCHAR(64 char) DEFAULT 'DEFAULT'
 NOT NULL,
 "invoke_target" VARCHAR(500 char) NOT NULL,
 "cron_expression" VARCHAR(255 char) DEFAULT ''
 NULL,
 "misfire_policy" VARCHAR(20 char) DEFAULT '3'
 NULL,
 "concurrent" VARCHAR(1 char) DEFAULT '1'
 NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) DEFAULT ''
 NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_JOB_LOG"
(
    "job_log_id" BIGINT IDENTITY(168,1) NOT NULL,
    "job_name" VARCHAR(64 char) NOT NULL,
 "job_group" VARCHAR(64 char) NOT NULL,
 "invoke_target" VARCHAR(500 char) NOT NULL,
 "job_message" VARCHAR(500 char) NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "exception_info" VARCHAR(2000 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_LOGININFOR"
(
    "info_id" BIGINT IDENTITY(1432,1) NOT NULL,
    "user_name" VARCHAR(50 char) DEFAULT ''
 NULL,
 "ipaddr" VARCHAR(128 char) DEFAULT ''
 NULL,
 "login_location" VARCHAR(255 char) DEFAULT ''
 NULL,
 "browser" VARCHAR(50 char) DEFAULT ''
 NULL,
 "os" VARCHAR(50 char) DEFAULT ''
 NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "msg" VARCHAR(255 char) DEFAULT ''
 NULL,
 "login_time" TIMESTAMP(0) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_MENU"
(
    "menu_id" BIGINT IDENTITY(2253,1) NOT NULL,
    "menu_name" VARCHAR(50 char) NOT NULL,
 "parent_id" BIGINT DEFAULT 0
 NULL,
 "order_num" INT DEFAULT 0
 NULL,
 "path" VARCHAR(200 char) DEFAULT ''
 NULL,
 "component" VARCHAR(50 char) NULL,
 "query" VARCHAR(255 char) NULL,
 "is_frame" INT DEFAULT 1
 NULL,
 "is_cache" INT DEFAULT 0
 NULL,
 "route_name" VARCHAR(255 char) NULL,
 "menu_type" VARCHAR(1 char) DEFAULT ''
 NULL,
 "visible" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "perms" VARCHAR(100 char) NULL,
 "icon" VARCHAR(100 char) DEFAULT '#'
 NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) DEFAULT ''
 NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_NOTICE"
(
    "notice_id" INT IDENTITY(14,1) NOT NULL,
    "notice_title" VARCHAR(50 char) NOT NULL,
 "notice_type" VARCHAR(1 char) NOT NULL,
 "notice_content" BLOB NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(255 char) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_OPER_LOG"
(
    "oper_id" BIGINT IDENTITY(2788,1) NOT NULL,
    "title" VARCHAR(50 char) DEFAULT ''
 NULL,
 "business_type" INT DEFAULT 0
 NULL,
 "method" VARCHAR(200 char) DEFAULT ''
 NULL,
 "request_method" VARCHAR(10 char) DEFAULT ''
 NULL,
 "operator_type" INT DEFAULT 0
 NULL,
 "oper_name" VARCHAR(50 char) DEFAULT ''
 NULL,
 "dept_name" VARCHAR(50 char) DEFAULT ''
 NULL,
 "oper_url" VARCHAR(255 char) DEFAULT ''
 NULL,
 "oper_ip" VARCHAR(128 char) DEFAULT ''
 NULL,
 "oper_location" VARCHAR(255 char) DEFAULT ''
 NULL,
 "oper_param" VARCHAR(2000 char) DEFAULT ''
 NULL,
 "json_result" VARCHAR(2000 char) DEFAULT ''
 NULL,
 "status" INT DEFAULT 0
 NULL,
 "error_msg" VARCHAR(2000 char) DEFAULT ''
 NULL,
 "oper_time" TIMESTAMP(0) NULL,
 "cost_time" BIGINT DEFAULT 0
 NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_POST"
(
    "post_id" BIGINT IDENTITY(5,1) NOT NULL,
    "post_code" VARCHAR(64 char) NOT NULL,
 "post_name" VARCHAR(50 char) NOT NULL,
 "post_sort" INT NOT NULL,
 "status" VARCHAR(1 char) NOT NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_ROLE"
(
    "role_id" BIGINT IDENTITY(5,1) NOT NULL,
    "role_name" VARCHAR(30 char) NOT NULL,
 "role_key" VARCHAR(100 char) NOT NULL,
 "role_sort" INT NOT NULL,
 "data_scope" VARCHAR(1 char) DEFAULT '1'
 NULL,
 "menu_check_strictly" TINYINT DEFAULT 1
 NULL,
 "dept_check_strictly" TINYINT DEFAULT 1
 NULL,
 "status" VARCHAR(1 char) NOT NULL,
 "del_flag" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_ROLE_DEPT"
(
    "role_id" BIGINT NOT NULL,
    "dept_id" BIGINT NOT NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_ROLE_MENU"
(
    "role_id" BIGINT NOT NULL,
    "menu_id" BIGINT NOT NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_USER"
(
    "user_id" BIGINT IDENTITY(763,1) NOT NULL,
    "dept_id" BIGINT NULL,
    "user_name" VARCHAR(30 char) NOT NULL,
 "nick_name" VARCHAR(30 char) NOT NULL,
 "user_type" VARCHAR(2 char) DEFAULT '00'
 NULL,
 "email" VARCHAR(50 char) DEFAULT ''
 NULL,
 "phonenumber" VARCHAR(11 char) DEFAULT ''
 NULL,
 "sex" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "avatar" VARCHAR(100 char) DEFAULT ''
 NULL,
 "password" VARCHAR(100 char) DEFAULT ''
 NULL,
 "status" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "del_flag" VARCHAR(1 char) DEFAULT '0'
 NULL,
 "login_ip" VARCHAR(128 char) DEFAULT ''
 NULL,
 "login_date" TIMESTAMP(0) NULL,
 "create_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "create_time" TIMESTAMP(0) NULL,
 "update_by" VARCHAR(64 char) DEFAULT ''
 NULL,
 "update_time" TIMESTAMP(0) NULL,
 "remark" VARCHAR(500 char) NULL,
 "auth_id" VARCHAR(20 char) NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_USER_POST"
(
    "user_id" BIGINT NOT NULL,
    "post_id" BIGINT NOT NULL
);
CREATE TABLE "QMODEL_DEV"."SYSTEM_USER_ROLE"
(
    "user_id" BIGINT NOT NULL,
    "role_id" BIGINT NOT NULL
);
CREATE TABLE "QMODEL_DEV"."EXAMPLE_DEPT"
(
    "id" INT IDENTITY(19,1) NOT NULL,
    "parent_id" BIGINT DEFAULT 0
        NOT NULL,
    "name" VARCHAR(128 char) NULL,
 "leader" VARCHAR(32 char) NULL,
 "phone" VARCHAR(32 char) NULL,
 "email" VARCHAR(128 char) NULL,
 "status" INT DEFAULT 0
 NOT NULL,
 "valid_flag" TINYINT DEFAULT 1
 NOT NULL,
 "del_flag" TINYINT DEFAULT 0
 NOT NULL,
 "create_by" VARCHAR(32 char) NULL,
 "creator_id" BIGINT NULL,
 "create_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "update_by" VARCHAR(32 char) NULL,
 "updator_id" BIGINT NULL,
 "update_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "remark" VARCHAR(512 char) NULL
);
CREATE TABLE "QMODEL_DEV"."AUTH_CLIENT"
(
    "id" INT IDENTITY(39,1) NOT NULL,
    "secret_key" VARCHAR(256 char) NOT NULL,
 "name" VARCHAR(128 char) NOT NULL,
 "type" INT NOT NULL,
 "icon" VARCHAR(256 char) NULL,
 "home_url" VARCHAR(256 char) NULL,
 "sync_url" VARCHAR(256 char) NULL,
 "redirect_url" VARCHAR(1024 char) NOT NULL,
 "public_flag" TINYINT DEFAULT 1
 NOT NULL,
 "valid_flag" TINYINT DEFAULT 1
 NOT NULL,
 "del_flag" TINYINT DEFAULT 0
 NOT NULL,
 "create_by" VARCHAR(128 char) NULL,
 "creator_id" BIGINT NULL,
 "create_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "update_by" VARCHAR(128 char) NULL,
 "updator_id" VARCHAR(20 char) NULL,
 "update_time" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP()
 NOT NULL,
 "remark" VARCHAR(512 char) NULL
);
CREATE TABLE "QMODEL_DEV"."AUTH_CLIENT_USER"
(
    "client_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "open_id" VARCHAR(256 char) NOT NULL
);
SET IDENTITY_INSERT "QMODEL_DEV"."EXAMPLE_STUDENT" ON;
INSERT INTO "QMODEL_DEV"."EXAMPLE_STUDENT"("id","name","picture_url","experience","sex","birthday","age","student_number","grade","hobby","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(77,'2',null,null,null,TO_DATE('2025-02-11 00:00:00','YYYY-MM-DD HH24:MI:SS'),23,null,null,null,1,0,'admin',1,TO_DATE('2025-02-18 15:20:22','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-02-18 15:22:48','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_STUDENT"("id","name","picture_url","experience","sex","birthday","age","student_number","grade","hobby","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(78,'25',null,null,null,TO_DATE('2025-02-14 00:00:00','YYYY-MM-DD HH24:MI:SS'),35,null,null,null,1,0,'admin',1,TO_DATE('2025-02-18 15:22:58','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-02-18 15:29:36','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_STUDENT"("id","name","picture_url","experience","sex","birthday","age","student_number","grade","hobby","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(79,'2',null,null,null,TO_DATE('2025-02-06 00:00:00','YYYY-MM-DD HH24:MI:SS'),3,null,null,null,1,0,'admin',1,TO_DATE('2025-02-18 15:37:17','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-02-18 15:37:17','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_STUDENT"("id","name","picture_url","experience","sex","birthday","age","student_number","grade","hobby","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(80,'3',null,null,null,TO_DATE('2025-02-07 00:00:00','YYYY-MM-DD HH24:MI:SS'),45,null,null,null,1,0,'admin',1,TO_DATE('2025-02-18 15:37:24','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-02-18 15:37:33','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_STUDENT"("id","name","picture_url","experience","sex","birthday","age","student_number","grade","hobby","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(81,'4',null,null,null,TO_DATE('2025-02-12 00:00:00','YYYY-MM-DD HH24:MI:SS'),57,null,null,null,1,0,'admin',1,TO_DATE('2025-02-18 15:48:28','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-02-18 15:48:34','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."EXAMPLE_STUDENT" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."GEN_TABLE" ON;
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(121,'MODEL','模型管理',null,null,'Model','crud','element-plus','tech.qiantong.qmodel.module.model','model','model','模型管理','qModel','0','/','{"parentMenuId":"2243"}','qModel',TO_DATE('2026-01-06 16:08:28','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:26','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(123,'MODEL_CLASSIFY','模型分类',null,null,'ModelClassify','crud','element-plus','tech.qiantong.qmodel.module.model','classify','Classify','模型分类','qModel','0','/','{"parentMenuId":"2244"}','qModel',TO_DATE('2026-01-07 10:12:55','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(127,'MODEL_HISTORY','模型历史',null,null,'ModelHistory','crud','element-plus','tech.qiantong.qmodel.module.model','history','Hhistory','模型历史','qModel','0','/','{"parentMenuId":2245}','qModel',TO_DATE('2026-01-09 13:22:19','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:22','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(129,'MODEL_INPUT','模型输入管理',null,null,'ModelInput','crud','element-plus','tech.qiantong.qmodel.module.model','input','Input','模型输入管理','qModel','0','/','{"parentMenuId":2246}','qModel',TO_DATE('2026-01-09 13:54:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:29','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(130,'MODEL_OUTPUT','模型输入管理',null,null,'ModelOutput','crud','element-plus','tech.qiantong.qmodel.module.model','output','Output','模型输出管理','qModel','0','/','{"parentMenuId":"2247"}','qModel',TO_DATE('2026-01-09 13:54:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:54','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(131,'MODEL_OPERATE','模型历史管理',null,null,'ModelOperate','crud','element-plus','tech.qiantong.qmodel.module.model','operate','Operate','模型历史管理','qModel','0','/','{"parentMenuId":2249}','qModel',TO_DATE('2026-01-09 16:43:44','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:07','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(132,'MODEL_INTERFACE_ADDRESS','接口地址',null,null,'ModelInterfaceAddress','crud','element-plus','tech.qiantong.qmodel.module.model','interfaceAddress','interfaceAddress','接口地址','qModel','0','/','{"parentMenuId":"2248"}','qModel',TO_DATE('2026-01-09 17:20:25','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:02','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(133,'MODEL_VERSION','版本管理',null,null,'ModelVersion','crud','element-plus','tech.qiantong.qmodel.module.model','version','version','版本管理','qModel','0','/','{"parentMenuId":2248}','qModel',TO_DATE('2026-01-09 17:20:55','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:46','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(135,'MODEL_RECONSTITUTION','模型库重构表',null,null,'ModelReconstitution','crud','element-plus','tech.qiantong.qmodel.module.model','modelReconstitution','modelReconstitution','模型库重构','qModel','0','/','{"parentMenuId":2245}','qModel',TO_DATE('2026-01-12 11:59:18','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:33','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."GEN_TABLE"("table_id","table_name","table_comment","sub_table_name","sub_table_fk_name","class_name","tpl_category","tpl_web_type","package_name","module_name","business_name","function_name","function_author","gen_type","gen_path","options","create_by","create_time","update_by","update_time","remark") VALUES(136,'MODEL_CACL_RECONSTITUTION','模型计算重构表',null,null,'ModelCacl','crud','element-plus','tech.qiantong.qmodel.module.model','modelCacl','modelCacl','模型计算重构','qModel','0','/','{"parentMenuId":2248}','qModel',TO_DATE('2026-01-12 13:34:59','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:49','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."GEN_TABLE" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."GEN_TABLE_COLUMN" ON;
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1884,121,'ID','ID','BIGINT','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-06 16:08:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1885,121,'COMPANY_ID','企业id','INTEGER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-06 16:08:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1886,121,'CLASSIFY_ID','分类id','INTEGER','Long','classifyId','0','0','0','1','1','1','1','EQ','input',null,3,'qModel',TO_DATE('2026-01-06 16:08:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1887,121,'ANCESTORS','父级和自己id','VARCHAR2','String','ANCESTORS','0','0','0','1','1','1','1','EQ','input',null,4,'qModel',TO_DATE('2026-01-06 16:08:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1888,121,'NAME','模型名称','VARCHAR2','String','NAME','0','0','0','1','1','1','1','LIKE','input',null,5,'qModel',TO_DATE('2026-01-06 16:08:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1889,121,'DESCRIPTION','模型介绍','VARCHAR2','String','DESCRIPTION','0','0','0','1','1','1','1','EQ','input',null,6,'qModel',TO_DATE('2026-01-06 16:08:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1890,121,'TYPE','所属模型类别 0：水文，1：水动力，2：水质','INTEGER','Long','TYPE','0','0','0','1','1','1','1','EQ','select',null,7,'qModel',TO_DATE('2026-01-06 16:08:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1891,121,'DIMENSIONS','所属纬度 0：一维，1：二维，2：三维','INTEGER','Long','DIMENSIONS','0','0','0','1','1','1','1','EQ','input',null,8,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1892,121,'VERSION','模型版本号','VARCHAR2','String','VERSION','0','0','0','1','1','1','1','EQ','input',null,9,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1893,121,'INTERFACE_ADDRESS','模型调用接口','VARCHAR2','String','interfaceAddress','0','0','0','1','1','1','1','EQ','input',null,10,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1894,121,'BUILTIN','是否内置 0：否，1：是','INTEGER','Long','BUILTIN','0','0','0','1','1','1','1','EQ','input',null,11,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1895,121,'FORMAT','模型格式','INTEGER','Long','FORMAT','0','0','0','1','1','1','1','EQ','input',null,12,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1896,121,'SIZE','模型大小 0：exe格式','INTEGER','Long','SIZE','0','0','0','1','1','1','1','EQ','input',null,13,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1897,121,'SOURCE','数据来源','VARCHAR2','String','SOURCE','0','0','0','1','1','1','1','EQ','input',null,14,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1898,121,'UPLOAD_STATUS','上传状态','INTEGER','Long','uploadStatus','0','0','0','1','1','1','1','EQ','radio',null,15,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1899,121,'UPLOAD_TIME','上传时间','DATETIME','Date','uploadTime','0','0','0','1','1','1','1','EQ','datetime',null,16,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1900,121,'UPLOAD_INTERFACE','上传接口','VARCHAR2','String','uploadInterface','0','0','0','1','1','1','1','EQ','input',null,17,'qModel',TO_DATE('2026-01-06 16:08:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1901,121,'UPLOAD_FILE','上传文件','VARCHAR2','String','uploadFile','0','0','0','1','1','1','1','EQ','fileUpload',null,18,'qModel',TO_DATE('2026-01-06 16:08:31','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1902,121,'UPLOAD_LOCATION','文件地址','VARCHAR2','String','uploadLocation','0','0','0','1','1','1','1','EQ','input',null,19,'qModel',TO_DATE('2026-01-06 16:08:31','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1903,121,'VALID_FLAG','是否有效 0：无效，1：有效','INTEGER','Boolean','validFlag','0','0','0','1',null,null,null,'EQ','input',null,20,'qModel',TO_DATE('2026-01-06 16:08:31','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1904,121,'DEL_FLAG','删除标志 1：已删除，0：未删除','INTEGER','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,21,'qModel',TO_DATE('2026-01-06 16:08:31','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1905,121,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,22,'qModel',TO_DATE('2026-01-06 16:08:31','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1906,121,'CREATOR_ID','创建人id 创建者的sys_user_id','INTEGER','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,23,'qModel',TO_DATE('2026-01-06 16:08:31','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1907,121,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,24,'qModel',TO_DATE('2026-01-06 16:08:31','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1908,121,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,25,'qModel',TO_DATE('2026-01-06 16:08:31','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1909,121,'UPDATOR_ID','更新人id 更新者的sys_user_id','INTEGER','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,26,'qModel',TO_DATE('2026-01-06 16:08:32','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1910,121,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,27,'qModel',TO_DATE('2026-01-06 16:08:32','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1911,121,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,28,'qModel',TO_DATE('2026-01-06 16:08:32','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 08:53:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1940,123,'ID','ID','INTEGER','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-07 10:12:55','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1941,123,'COMPANY_ID','企业id','INTEGER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1942,123,'PARENT_ID','父级id','INTEGER','Long','parentId','0','0','0','1','1','1','1','EQ','input',null,3,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1943,123,'ANCESTORS','祖籍列表','VARCHAR2','String','ANCESTORS','0','0','0','1','1','1','1','EQ','input',null,4,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1944,123,'NAME','分类名称','VARCHAR2','String','NAME','0','0','0','1','1','1','1','LIKE','input',null,5,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1945,123,'DESCRIPTION','分类描述','VARCHAR2','String','DESCRIPTION','0','0','0','1','1','1','1','EQ','input',null,6,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1946,123,'VALID_FLAG','是否有效 0：无效，1：有效','INTEGER','Boolean','validFlag','0','0','0','1',null,null,null,'EQ','input',null,7,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1947,123,'DEL_FLAG','删除标志 1：已删除，0：未删除','INTEGER','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,8,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1948,123,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,9,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1949,123,'CREATOR_ID','创建人id 创建者的sys_user_id','INTEGER','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,10,'qModel',TO_DATE('2026-01-07 10:12:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1950,123,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,11,'qModel',TO_DATE('2026-01-07 10:12:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1951,123,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,12,'qModel',TO_DATE('2026-01-07 10:12:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1952,123,'UPDATOR_ID','更新人id 更新者的sys_user_id','INTEGER','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,13,'qModel',TO_DATE('2026-01-07 10:12:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1953,123,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,14,'qModel',TO_DATE('2026-01-07 10:12:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(1954,123,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,15,'qModel',TO_DATE('2026-01-07 10:12:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-07 10:25:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2003,127,'ID','主键id','BIGINT','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-09 13:22:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2004,127,'COMPANY_ID','企业id','BIGINT','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-09 13:22:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2005,127,'MODEL_ID','所属模型id','BIGINT','Long','modelId','0','0','0','1','1','1','1','EQ','input',null,3,'qModel',TO_DATE('2026-01-09 13:22:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2008,127,'MODEL_NAME','所属模型名称','VARCHAR','String','modelName','0','0','0','1','1','1','1','LIKE','input',null,4,'qModel',TO_DATE('2026-01-09 13:22:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2010,127,'CONTEXT','操作内容','VARCHAR','String','CONTEXT','0','0','0','1','1','1','1','EQ','input',null,5,'qModel',TO_DATE('2026-01-09 13:22:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2012,127,'START_TIME','启用时间','TIMESTAMP','Date','startTime','0','0','0','1','1','1','1','EQ','datetime',null,6,'qModel',TO_DATE('2026-01-09 13:22:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2013,127,'MODEL_VERSION','启用版本号','VARCHAR','String','modelVersion','0','0','0','1','1','1','1','EQ','input',null,7,'qModel',TO_DATE('2026-01-09 13:22:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2015,127,'VALID_FLAG','是否有效 0：无效，1：有效','TINYINT','Boolean','validFlag','0','0','0','1',null,null,null,'EQ','input',null,8,'qModel',TO_DATE('2026-01-09 13:22:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2017,127,'DEL_FLAG','删除标志 1：已删除，0：未删除 ','TINYINT','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,9,'qModel',TO_DATE('2026-01-09 13:22:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2021,127,'CREATE_BY','创建人','VARCHAR','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,10,'qModel',TO_DATE('2026-01-09 13:22:22','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2022,127,'CREATOR_ID','创建人id','BIGINT','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,11,'qModel',TO_DATE('2026-01-09 13:22:22','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2025,127,'CREATE_TIME','创建时间','TIMESTAMP','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,12,'qModel',TO_DATE('2026-01-09 13:22:22','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2026,127,'UPDATE_BY','更新人','VARCHAR','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,13,'qModel',TO_DATE('2026-01-09 13:22:22','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2029,127,'UPDATOR_ID','更新人id','BIGINT','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,14,'qModel',TO_DATE('2026-01-09 13:22:22','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2030,127,'UPDATE_TIME','更新时间','TIMESTAMP','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,15,'qModel',TO_DATE('2026-01-09 13:22:22','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2033,127,'REMARK','备注','VARCHAR','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,16,'qModel',TO_DATE('2026-01-09 13:22:23','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:23:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2035,129,'ID','ID','INTEGER','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-09 13:54:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2036,129,'COMPANY_ID','企业Id','INTEGER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-09 13:54:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2037,129,'NAME','参数名称','VARCHAR2','String','NAME','0','0','0','1','1','1','1','LIKE','input',null,3,'qModel',TO_DATE('2026-01-09 13:54:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2038,129,'ENG_NAME','英文名称','VARCHAR2','String','engName','0','0','0','1','1','1','1','LIKE','input',null,4,'qModel',TO_DATE('2026-01-09 13:54:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2039,129,'TYPE','参数类型 0:单值，1：多列数值，2：文件','INTEGER','Long','TYPE','0','0','0','1','1','1','1','EQ','select',null,5,'qModel',TO_DATE('2026-01-09 13:54:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2040,129,'MODEL_ID','所属模型id','INTEGER','Long','modelId','0','0','0','1','1','1','1','EQ','input',null,6,'qModel',TO_DATE('2026-01-09 13:54:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2041,129,'MODEL_NAME','所属模型名称','VARCHAR2','String','modelName','0','0','0','1','1','1','1','LIKE','input',null,7,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2042,129,'MODEL_VERSION','所属模型版本','VARCHAR2','String','modelVersion','0','0','0','1','1','1','1','EQ','input',null,8,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2043,129,'DESCRIPTION','参数说明(描述)','VARCHAR2','String','DESCRIPTION','0','0','0','1','1','1','1','EQ','input',null,9,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2044,129,'EXAMPLE','参数示例（文件上传）','VARCHAR2','String','EXAMPLE','0','0','0','1','1','1','1','EQ','input',null,10,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2045,129,'PARAM_FILE','参数文件','VARCHAR2','String','paramFile','0','0','0','1','1','1','1','EQ','fileUpload',null,11,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2046,129,'SINGLE_CONTENT','参数单值','VARCHAR2','String','singleContent','0','0','0','1','1','1','1','EQ','editor',null,12,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2047,129,'MULTIPLE_CONTENT','参数多列值','VARCHAR2','String','multipleContent','0','0','0','1','1','1','1','EQ','editor',null,13,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2048,129,'VALID_FLAG','是否有效 0：无效，1：有效','INTEGER','Boolean','validFlag','0','0','0','1',null,null,null,'EQ','input',null,14,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2049,129,'DEL_FLAG','删除标志 1：已删除，0：未删除','INTEGER','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,15,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2050,129,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,16,'qModel',TO_DATE('2026-01-09 13:54:03','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2051,129,'CREATOR_ID','创建人id 创建者的sys_user_id','INTEGER','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,17,'qModel',TO_DATE('2026-01-09 13:54:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2052,129,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,18,'qModel',TO_DATE('2026-01-09 13:54:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2053,129,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,19,'qModel',TO_DATE('2026-01-09 13:54:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2054,129,'UPDATOR_ID','更新人id 更新者的sys_user_id','INTEGER','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,20,'qModel',TO_DATE('2026-01-09 13:54:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2055,129,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,21,'qModel',TO_DATE('2026-01-09 13:54:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2056,129,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,22,'qModel',TO_DATE('2026-01-09 13:54:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2057,129,'CHANGE_FLAG','是否可变','NUMBER','Long','changeFlag','0','0','0','1','1','1','1','EQ','input',null,23,'qModel',TO_DATE('2026-01-09 13:54:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:56:33','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2058,130,'ID','ID','INTEGER','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-09 13:54:05','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2059,130,'COMPANY_ID','企业Id','INTEGER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-09 13:54:05','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2060,130,'NAME','参数名称','VARCHAR2','String','NAME','0','0','0','1','1','1','1','LIKE','input',null,3,'qModel',TO_DATE('2026-01-09 13:54:05','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2061,130,'ENG_NAME','英文名称','VARCHAR2','String','engName','0','0','0','1','1','1','1','LIKE','input',null,4,'qModel',TO_DATE('2026-01-09 13:54:05','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2062,130,'TYPE','参数类型 0:单值，1：多列数值','INTEGER','Long','TYPE','0','0','0','1','1','1','1','EQ','select',null,5,'qModel',TO_DATE('2026-01-09 13:54:05','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2063,130,'MODEL_ID','所属模型id','INTEGER','Long','modelId','0','0','0','1','1','1','1','EQ','input',null,6,'qModel',TO_DATE('2026-01-09 13:54:05','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2064,130,'MODEL_NAME','所属模型名称','VARCHAR2','String','modelName','0','0','0','1','1','1','1','LIKE','input',null,7,'qModel',TO_DATE('2026-01-09 13:54:05','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2065,130,'MODEL_VERSION','所属模型版本','VARCHAR2','String','modelVersion','0','0','0','1','1','1','1','EQ','input',null,8,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2066,130,'DESCRIPTION','参数说明(描述)','VARCHAR2','String','DESCRIPTION','0','0','0','1','1','1','1','EQ','input',null,9,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2067,130,'SINGLE_CONTENT','参数单值','VARCHAR2','String','singleContent','0','0','0','1','1','1','1','EQ','editor',null,10,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2068,130,'MULTIPLE_CONTENT','参数多列值','VARCHAR2','String','multipleContent','0','0','0','1','1','1','1','EQ','editor',null,11,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2069,130,'VALID_FLAG','是否有效 0：无效，1：有效','INTEGER','Boolean','validFlag','0','0','0','1',null,null,null,'EQ','input',null,12,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2070,130,'DEL_FLAG','删除标志 1：已删除，0：未删除','INTEGER','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,13,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2071,130,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,14,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2072,130,'CREATOR_ID','创建人id 创建者的sys_user_id','INTEGER','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,15,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2073,130,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,16,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2074,130,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,17,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2075,130,'UPDATOR_ID','更新人id 更新者的sys_user_id','INTEGER','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,18,'qModel',TO_DATE('2026-01-09 13:54:06','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2076,130,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,19,'qModel',TO_DATE('2026-01-09 13:54:07','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2077,130,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,20,'qModel',TO_DATE('2026-01-09 13:54:07','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 13:59:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2078,131,'ID','ID','INTEGER','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-09 16:43:45','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2079,131,'COMPANY_ID','企业id','INTEGER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-09 16:43:45','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2080,131,'MODULE_NAME','操作模块','VARCHAR2','String','moduleName','0','0','0','1','1','1','1','LIKE','input',null,3,'qModel',TO_DATE('2026-01-09 16:43:45','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2081,131,'TYPE','操作类型','INTEGER','Long','TYPE','0','0','0','1','1','1','1','EQ','select',null,4,'qModel',TO_DATE('2026-01-09 16:43:45','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2082,131,'CONTENT','操作内容','VARCHAR2','String','CONTENT','0','0','0','1','1','1','1','EQ','editor',null,5,'qModel',TO_DATE('2026-01-09 16:43:45','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2083,131,'METHOD','请求方式','VARCHAR2','String','METHOD','0','0','0','1','1','1','1','EQ','input',null,6,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2084,131,'REQ_CONTENT','请求参数','VARCHAR2','String','reqContent','0','0','0','1','1','1','1','EQ','editor',null,7,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2085,131,'RESP_CONTENT','返回参数','VARCHAR2','String','respContent','0','0','0','1','1','1','1','EQ','editor',null,8,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2086,131,'IP','操作地址(Ip)','VARCHAR2','String','IP','0','0','0','1','1','1','1','EQ','input',null,9,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2087,131,'ADDRESS','操作地点','VARCHAR2','String','ADDRESS','0','0','0','1','1','1','1','EQ','input',null,10,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2088,131,'STATUS','操作状态','INTEGER','Long','STATUS','0','0','0','1','1','1','1','EQ','radio',null,11,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2089,131,'VALID_FLAG','是否有效 0：无效，1：有效','INTEGER','Boolean','validFlag','0','0','0','1',null,null,null,'EQ','input',null,12,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2090,131,'DEL_FLAG','删除标志 1：已删除，0：未删除','INTEGER','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,13,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2091,131,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,14,'qModel',TO_DATE('2026-01-09 16:43:46','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2092,131,'CREATOR_ID','创建人id 创建者的sys_user_id','INTEGER','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,15,'qModel',TO_DATE('2026-01-09 16:43:47','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2093,131,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,16,'qModel',TO_DATE('2026-01-09 16:43:47','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2094,131,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,17,'qModel',TO_DATE('2026-01-09 16:43:47','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2095,131,'UPDATOR_ID','更新人id 更新者的sys_user_id','INTEGER','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,18,'qModel',TO_DATE('2026-01-09 16:43:47','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2096,131,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,19,'qModel',TO_DATE('2026-01-09 16:43:47','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2097,131,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,20,'qModel',TO_DATE('2026-01-09 16:43:47','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 16:45:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2098,132,'ID','id','BIGINT','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-09 17:20:26','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2099,132,'COMPANY_ID','企业id','NUMBER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-09 17:20:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2100,132,'MODEL_ID','模型id','BIGINT','Long','modelId','0','0','0','1','1','1','1','EQ','input',null,3,'qModel',TO_DATE('2026-01-09 17:20:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2101,132,'INTERFACE_ADDRESS','接口地址','VARCHAR2','String','interfaceAddress','0','0','0','1','1','1','1','EQ','input',null,4,'qModel',TO_DATE('2026-01-09 17:20:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2102,132,'VERSION_ID','模型版本id','BIGINT','Long','versionId','0','0','0','1','1','1','1','EQ','input',null,5,'qModel',TO_DATE('2026-01-09 17:20:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2103,132,'REQUEST_METHOD','请求方式','BIGINT','Long','requestMethod','0','0','0','1','1','1','1','EQ','input',null,6,'qModel',TO_DATE('2026-01-09 17:20:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2104,132,'INPUT_PARAMETER','输入参数','TEXT','String','inputParameter','0','0','0','1','1','1','1','EQ','textarea',null,7,'qModel',TO_DATE('2026-01-09 17:20:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2105,132,'OUTPUT_PARAMETER','输出参数','TEXT','String','outputParameter','0','0','0','1','1','1','1','EQ','textarea',null,8,'qModel',TO_DATE('2026-01-09 17:20:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2106,132,'DEL_FLAG','删除标志','BIGINT','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,9,'qModel',TO_DATE('2026-01-09 17:20:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2107,132,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,10,'qModel',TO_DATE('2026-01-09 17:20:28','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2108,132,'CREATOR_ID','创建人id','BIGINT','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,11,'qModel',TO_DATE('2026-01-09 17:20:28','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2109,132,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,12,'qModel',TO_DATE('2026-01-09 17:20:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2110,132,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,13,'qModel',TO_DATE('2026-01-09 17:20:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2111,132,'UPDATOR_ID','更新人id','BIGINT','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,14,'qModel',TO_DATE('2026-01-09 17:20:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2112,132,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,15,'qModel',TO_DATE('2026-01-09 17:20:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2113,132,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,16,'qModel',TO_DATE('2026-01-09 17:20:29','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2114,132,'INPUT_PARAMETER_ILLUSTRATE','输入参数说明','TEXT','String','inputParameterIllustrate','0','0','0','1','1','1','1','EQ','textarea',null,17,'qModel',TO_DATE('2026-01-09 17:20:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2115,132,'OUTPUT_PARAMETER_ILLUSTRATE','输出参数说明','TEXT','String','outputParameterIllustrate','0','0','0','1','1','1','1','EQ','textarea',null,18,'qModel',TO_DATE('2026-01-09 17:20:30','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2116,133,'ID','ID','INTEGER','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-09 17:20:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2117,133,'COMPANY_ID','企业id','INTEGER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-09 17:20:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2118,133,'MODEL_ID','所属模型id','INTEGER','Long','modelId','0','0','0','1','1','1','1','EQ','input',null,3,'qModel',TO_DATE('2026-01-09 17:20:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2119,133,'MODEL_NAME','所属模型名称','VARCHAR2','String','modelName','0','0','0','1','1','1','1','LIKE','input',null,4,'qModel',TO_DATE('2026-01-09 17:20:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2120,133,'VERSION','模型版本号','VARCHAR2','String','VERSION','0','0','0','1','1','1','1','EQ','input',null,5,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2121,133,'FILE_ADDRESS','文件地址','VARCHAR2','String','fileAddress','0','0','0','1','1','1','1','EQ','input',null,6,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2122,133,'INTERFACE_ADDRESS','接口地址','VARCHAR2','String','interfaceAddress','0','0','0','1','1','1','1','EQ','input',null,7,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2123,133,'STATUS','版本状态','INTEGER','Long','STATUS','0','0','0','1','1','1','1','EQ','radio',null,8,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2124,133,'DESCRIPTION','描述','VARCHAR2','String','DESCRIPTION','0','0','0','1','1','1','1','EQ','input',null,9,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2125,133,'VALID_FLAG','是否有效 0：无效，1：有效','INTEGER','Boolean','validFlag','0','0','0','1',null,null,null,'EQ','input',null,10,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2126,133,'DEL_FLAG','删除标志 1：已删除，0：未删除','INTEGER','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,11,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2127,133,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,12,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2128,133,'CREATOR_ID','创建人id 创建者的sys_user_id','INTEGER','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,13,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2129,133,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,14,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2130,133,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,15,'qModel',TO_DATE('2026-01-09 17:20:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2131,133,'UPDATOR_ID','更新人id 更新者的sys_user_id','INTEGER','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,16,'qModel',TO_DATE('2026-01-09 17:20:58','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2132,133,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,17,'qModel',TO_DATE('2026-01-09 17:20:58','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2133,133,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,18,'qModel',TO_DATE('2026-01-09 17:20:58','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2134,133,'FILENAME','文件的名称','VARCHAR2','String','FILENAME','0','0','0','1','1','1','1','LIKE','input',null,19,'qModel',TO_DATE('2026-01-09 17:20:58','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2135,133,'RUNNABLE_FILE_ADDRESS','可执行文件地址','VARCHAR2','String','runnableFileAddress','0','0','0','1','1','1','1','EQ','input',null,20,'qModel',TO_DATE('2026-01-09 17:20:58','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-09 17:26:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2160,135,'ID','id','INTEGER','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-12 11:59:19','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2161,135,'COMPANY_ID','企业id','INTEGER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-12 11:59:19','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2162,135,'NAME','模型名称','VARCHAR2','String','NAME','0','0','0','1','1','1','1','LIKE','input',null,3,'qModel',TO_DATE('2026-01-12 11:59:19','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2163,135,'CLASSIFY_ID','模型分类','NUMBER','Long','classifyId','0','0','0','1','1','1','1','EQ','input',null,4,'qModel',TO_DATE('2026-01-12 11:59:19','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2164,135,'BUILTIN','是否预置','NUMBER','Long','BUILTIN','0','0','0','1','1','1','1','EQ','input',null,5,'qModel',TO_DATE('2026-01-12 11:59:19','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2165,135,'ACCESS_MODE','接入方式','NUMBER','Long','accessMode','0','0','0','1','1','1','1','EQ','input',null,6,'qModel',TO_DATE('2026-01-12 11:59:19','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2166,135,'REQUEST_METHOD','请求方式','NUMBER','Long','requestMethod','0','0','0','1','1','1','1','EQ','input',null,7,'qModel',TO_DATE('2026-01-12 11:59:19','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2167,135,'INTERFACEORFILE_ADDRESS','接口和文件的地址','VARCHAR2','String','interfaceorfileAddress','0','0','0','1','1','1','1','EQ','input',null,8,'qModel',TO_DATE('2026-01-12 11:59:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2168,135,'VERSION_ID','版本id','NUMBER','Long','versionId','0','0','0','1','1','1','1','EQ','input',null,9,'qModel',TO_DATE('2026-01-12 11:59:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2169,135,'WHETHER_PUBLISH','是否发布','NUMBER','Long','whetherPublish','0','0','0','1','1','1','1','EQ','input',null,10,'qModel',TO_DATE('2026-01-12 11:59:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2170,135,'PUBLISH_TIME','发布时间','DATETIME','Date','publishTime','0','0','0','1','1','1','1','EQ','datetime',null,11,'qModel',TO_DATE('2026-01-12 11:59:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2171,135,'DEL_FLAG','删除标志','BIGINT','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,12,'qModel',TO_DATE('2026-01-12 11:59:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2172,135,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,13,'qModel',TO_DATE('2026-01-12 11:59:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2173,135,'CREATOR_ID','创建人id','BIGINT','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,14,'qModel',TO_DATE('2026-01-12 11:59:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2174,135,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,15,'qModel',TO_DATE('2026-01-12 11:59:20','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2175,135,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,16,'qModel',TO_DATE('2026-01-12 11:59:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2176,135,'UPDATOR_ID','更新人id','BIGINT','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,17,'qModel',TO_DATE('2026-01-12 11:59:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2177,135,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,18,'qModel',TO_DATE('2026-01-12 11:59:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2178,135,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,19,'qModel',TO_DATE('2026-01-12 11:59:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2179,135,'PORT','接口的端口号','VARCHAR2','String','PORT','0','0','0','1','1','1','1','EQ','input',null,20,'qModel',TO_DATE('2026-01-12 11:59:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2180,135,'FILENAME','文件名称','VARCHAR2','String','FILENAME','0','0','0','1','1','1','1','LIKE','input',null,21,'qModel',TO_DATE('2026-01-12 11:59:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2181,135,'RUNNABLE_FILE_ADDRESS','可执行文件相对路径','VARCHAR2','String','runnableFileAddress','0','0','0','1','1','1','1','EQ','input',null,22,'qModel',TO_DATE('2026-01-12 11:59:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 12:04:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2182,136,'ID','主键id','INTEGER','Long','ID','1','0','0','1',null,null,null,'EQ','input',null,1,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2183,136,'COMPANY_ID','企业id','INTEGER','Long','companyId','0','0','0','1','1','1','1','EQ','input',null,2,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2184,136,'CODE','计算编码','VARCHAR2','String','CODE','0','0','0','1','1','1','1','EQ','input',null,3,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2185,136,'NAME','计算名称','VARCHAR2','String','NAME','0','0','0','1','1','1','1','LIKE','input',null,4,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2186,136,'MODEL_ID','模型id','INTEGER','Long','modelId','0','0','0','1','1','1','1','EQ','input',null,5,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2187,136,'MODEL_NAME','模型名称','VARCHAR2','String','modelName','0','0','0','1','1','1','1','LIKE','input',null,6,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2188,136,'MODEL_VERSION','模型版本','VARCHAR2','String','modelVersion','0','0','0','1','1','1','1','EQ','input',null,7,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2189,136,'START_TIME','开始时间','DATETIME','Date','startTime','0','0','0','1','1','1','1','EQ','datetime',null,8,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2190,136,'END_TIME','结束时间','DATETIME','Date','endTime','0','0','0','1','1','1','1','EQ','datetime',null,9,'qModel',TO_DATE('2026-01-12 13:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2191,136,'STATUS','计算状态','INTEGER','Long','STATUS','0','0','0','1','1','1','1','EQ','radio',null,10,'qModel',TO_DATE('2026-01-12 13:35:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2192,136,'INPUT_CONTENT','模型输入内容','VARCHAR2','String','inputContent','0','0','0','1','1','1','1','EQ','editor',null,11,'qModel',TO_DATE('2026-01-12 13:35:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2193,136,'OUTPUT_CONTENT','模型输出内容','VARCHAR2','String','outputContent','0','0','0','1','1','1','1','EQ','editor',null,12,'qModel',TO_DATE('2026-01-12 13:35:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2194,136,'VALID_FLAG','是否有效 0：无效，1：有效','INTEGER','Boolean','validFlag','0','0','0','1',null,null,null,'EQ','input',null,13,'qModel',TO_DATE('2026-01-12 13:35:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2195,136,'DEL_FLAG','删除标志 1：已删除，0：未删除','INTEGER','Boolean','delFlag','0','0','0','1',null,null,null,'EQ','input',null,14,'qModel',TO_DATE('2026-01-12 13:35:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2196,136,'CREATE_BY','创建人','VARCHAR2','String','createBy','0','0','0','1',null,'1',null,'EQ','input',null,15,'qModel',TO_DATE('2026-01-12 13:35:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2197,136,'CREATOR_ID','创建人id','INTEGER','Long','creatorId','0','0','0','1',null,null,null,'EQ','input',null,16,'qModel',TO_DATE('2026-01-12 13:35:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2198,136,'CREATE_TIME','创建时间','DATETIME','Date','createTime','0','0','0','1',null,'1','1','EQ','datetime',null,17,'qModel',TO_DATE('2026-01-12 13:35:01','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2199,136,'UPDATE_BY','更新人','VARCHAR2','String','updateBy','0','0','0','1',null,null,null,'EQ','input',null,18,'qModel',TO_DATE('2026-01-12 13:35:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2200,136,'UPDATOR_ID','更新人id','INTEGER','Long','updatorId','0','0','0','1',null,null,null,'EQ','input',null,19,'qModel',TO_DATE('2026-01-12 13:35:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2201,136,'UPDATE_TIME','更新时间','DATETIME','Date','updateTime','0','0','0','1',null,null,null,'EQ','datetime',null,20,'qModel',TO_DATE('2026-01-12 13:35:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2202,136,'REMARK','备注','VARCHAR2','String','REMARK','0','0','0','1','1','1',null,'EQ','input',null,21,'qModel',TO_DATE('2026-01-12 13:35:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2203,136,'ADDRESS_ID','文件或接口地址id','INTEGER','Long','addressId','0','0','0','1','1','1','1','EQ','input',null,22,'qModel',TO_DATE('2026-01-12 13:35:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2204,136,'ADDRESS_TYPE','判断是文件的id还是地址的id，0:文件，1：接口','INTEGER','Long','addressType','0','0','0','1','1','1','1','EQ','select',null,23,'qModel',TO_DATE('2026-01-12 13:35:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:52','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."GEN_TABLE_COLUMN"("column_id","table_id","column_name","column_comment","column_type","java_type","java_field","is_pk","is_increment","is_required","is_insert","is_edit","is_list","is_query","query_type","html_type","dict_type","sort","create_by","create_time","update_by","update_time") VALUES(2205,136,'MP_PROGRAMME_ID','文件计算的历史方案id','INTEGER','Long','mpProgrammeId','0','0','0','1','1','1','1','EQ','input',null,24,'qModel',TO_DATE('2026-01-12 13:35:02','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-12 13:38:52','YYYY-MM-DD HH24:MI:SS'));

SET IDENTITY_INSERT "QMODEL_DEV"."GEN_TABLE_COLUMN" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MESSAGE" ON;
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(1,null,1,'测试模版','测试消息测试模版',0,0,0,null,null,'1',0,0,1,1,null,null,TO_DATE('2024-11-01 15:51:36','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(2,null,1,'测试模版','测试消息测试模版',0,0,0,null,null,'1',1,0,1,1,null,null,TO_DATE('2024-11-01 15:51:48','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(3,null,1,'测试模版','测试消息测试模版',0,0,0,null,null,'1',1,0,1,1,null,null,TO_DATE('2024-11-01 15:51:52','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(4,null,2,'测试模版','测试消息测试模版2',0,0,0,null,null,'1',0,0,1,0,null,null,TO_DATE('2024-11-01 15:52:53','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(5,null,2,'测试模版','测试消息测试模版2',0,0,0,null,null,'1',0,0,1,0,null,null,TO_DATE('2024-11-01 15:52:54','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(6,null,2,'测试模版','测试消息测试模版2',0,0,0,null,null,'1',0,0,1,0,null,null,TO_DATE('2024-11-01 15:52:56','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(7,null,1,'测试模版','测试消息测试模版',1,0,0,null,null,'1',1,0,1,0,null,null,TO_DATE('2024-11-01 15:53:00','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-01-20 09:33:09','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(8,null,1,'测试模版','测试消息测试模版',1,0,0,null,null,'1',0,0,1,1,null,null,TO_DATE('2024-11-01 17:19:43','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(9,null,1,'测试模版','***************测试模版',1,0,0,null,null,'1',0,0,1,1,null,null,TO_DATE('2024-11-04 09:17:08','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(10,null,1,'测试模版','***************测试模版',1,0,0,null,null,'1',0,0,1,1,null,null,TO_DATE('2024-11-04 09:17:27','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(11,null,1,'测试模版','***************测试模版',1,0,0,null,null,'1',1,0,1,0,null,null,TO_DATE('2024-11-04 09:17:52','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-24 12:01:21','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(12,null,1,'测试模版','***************测试模版',1,0,0,null,null,'1',1,0,1,0,null,null,TO_DATE('2024-11-04 09:17:59','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-24 11:12:06','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(13,null,1,'测试模版','111111111111测试模版',1,0,0,null,null,'1',0,0,1,1,null,null,TO_DATE('2024-11-04 09:21:32','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(14,null,1,'测试模版','111111111111测试模版',1,0,0,null,null,'1',0,0,1,1,null,null,TO_DATE('2024-11-04 09:21:36','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(15,null,null,'测试','测试内容',0,0,0,null,null,null,0,0,1,0,'admin',1,TO_DATE('2024-12-23 11:35:00','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(16,null,null,'测试','测试内容',0,0,0,null,null,null,0,0,1,0,'admin',1,TO_DATE('2024-12-23 11:49:50','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-23 15:32:11','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(40,null,null,'测试','测试内容',0,0,0,null,null,null,1,0,1,0,'admin',1,TO_DATE('2024-12-23 15:33:11','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-23 15:33:11','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(41,null,null,'测试','测试内容',0,0,0,null,null,null,1,0,1,0,'admin',1,TO_DATE('2024-12-23 15:34:47','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-23 15:34:47','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(42,null,null,'测试','测试内容',0,0,0,null,null,null,1,0,1,0,'admin',1,TO_DATE('2024-12-23 15:39:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-23 15:39:17','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(43,null,null,'测试','测试内容',0,0,0,null,null,null,0,0,1,0,'admin',1,TO_DATE('2025-12-30 10:51:44','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-12-30 10:51:44','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(44,null,null,'测试','测试内容',0,0,0,null,null,null,0,0,1,0,'小桐',1,TO_DATE('2025-12-30 10:59:28','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-30 10:59:28','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(45,null,null,'测试','测试内容',0,0,0,null,null,null,0,0,1,0,'小桐',1,TO_DATE('2025-12-30 13:59:46','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-30 13:59:46','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(46,null,null,'测试','测试内容',0,0,0,null,null,null,0,0,1,0,'小桐',1,TO_DATE('2025-12-30 14:00:24','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-30 14:00:24','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(47,null,null,'测试','测试内容',0,0,0,null,null,null,0,0,1,0,'小桐',1,TO_DATE('2025-12-30 14:01:37','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-30 14:01:37','YYYY-MM-DD HH24:MI:SS'),1,null);
INSERT INTO "QMODEL_DEV"."MESSAGE"("id","sender_id","receiver_id","title","content","category","msg_level","module","entity_type","entity_id","entity_url","has_read","has_retraction","valid_flag","del_flag","create_by","creator_id","create_time","update_by","update_time","updator_id","remark") VALUES(48,null,null,'测试','测试内容',0,0,0,null,null,null,0,0,1,0,'小桐',1,TO_DATE('2025-12-30 14:01:41','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-30 14:01:41','YYYY-MM-DD HH24:MI:SS'),1,null);

SET IDENTITY_INSERT "QMODEL_DEV"."MESSAGE" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MESSAGE_TEMPLATE" ON;
INSERT INTO "QMODEL_DEV"."MESSAGE_TEMPLATE"("id","title","content","category","msg_level","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(1,'测试模版','${test}测试模版',0,0,1,1,null,1,TO_DATE('2024-11-01 10:35:16','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-12-30 10:45:41','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MESSAGE_TEMPLATE"("id","title","content","category","msg_level","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(2,'测试','2',0,0,1,1,'admin',1,TO_DATE('2024-11-20 11:12:52','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-12-30 10:45:38','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."MESSAGE_TEMPLATE" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL" ON;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_CACL" ON;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_CACL" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION" ON;
INSERT INTO "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"("ID","COMPANY_ID","CODE","NAME","MODEL_ID","MODEL_NAME","MODEL_VERSION","START_TIME","END_TIME","STATUS","INPUT_CONTENT","OUTPUT_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","ADDRESS_ID","ADDRESS_TYPE","MP_PROGRAMME_ID") VALUES(6,null,null,'avq',12,'平均流量计算','2',TO_DATE('2026-01-21 15:41:13.773000','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-21 15:41:13.773000','YYYY-MM-DD HH24:MI:SS'),2,'{"success":true,"errorCode":"2000","message":"操作成功","data":[{"buildingId":"SGJZ00000849","buildingName":"西泵站 5#机组","buildingType":"100008","buildingTypeName":"泵站","useable":true,"realFlow":3,"pumpSate":3,"maxTheoryFlow":8,"minTheoryFlow":4}]}','{"data":[0.0,0.0,0.0,1.2427905114591766,3.1020725448322852,6.870074077654037,13.636834180457212,18.874605990705735,23.476188883749202,27.79405342829416,37.33358287235341,52.63983773350419,74.70931780382192,95.46579058109516,110.19415112364784,112.22872668974202,109.69065142162646,113.17366569389996,118.20369823427129,124.59372597530198,129.56332489658763,131.89507127732998,132.0682737750803,129.45668925476187,0.490526010180646,118.80979541832136]}',1,0,'小桐',1,TO_DATE('2026-01-15 10:04:36.217000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 15:41:14.006000','YYYY-MM-DD HH24:MI:SS'),null,null,0,null);
INSERT INTO "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"("ID","COMPANY_ID","CODE","NAME","MODEL_ID","MODEL_NAME","MODEL_VERSION","START_TIME","END_TIME","STATUS","INPUT_CONTENT","OUTPUT_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","ADDRESS_ID","ADDRESS_TYPE","MP_PROGRAMME_ID") VALUES(8,null,null,'base64服务',13,'接口服务类','1',TO_DATE('2026-01-22 09:12:29.453000','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-22 09:12:29.453000','YYYY-MM-DD HH24:MI:SS'),1,'{"code":"1","data":"test"}','{"msg":"操作成功","img":"/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAA8AKADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDtrW1ga1hZoIySikkoOeKsCztv+feL/vgU2z/484P+ua/yqyKiMY8q0IjGPKtCIWdr/wA+0P8A3wKeLK1/59of+/YqUU7pT5Y9h8sexELK0/59Yf8Av2KcLG0/59YP+/YqhJ4k0WG8+yS6paRzg4KNKBz6fX2rWjdXUMrAg8gg9auVFxtzRtfyDlj2IxYWf/PrB/37FOFhZ/8APpB/37FV9V1mw0OyN5qNwIIAwXeVLcnoMAE1dgmSeJJY2yjqGU+oNJ0rRUnHR9bByx7DRp9l/wA+lv8A9+x/hThp1l/z52//AH6X/CptwHU0yG8tpnKxTxOy8EK4JFLkXYOWPYBp1j/z52//AH6X/CnDTbH/AJ8rf/v0v+FWBThS5Y9g5Y9iuNMsP+fK2/79L/hTxplh/wA+Nt/36X/CrArP1PxBpOihf7Rv4LYv90SNyfoOtVClzvljG79A5Y9i0NL0/wD58bb/AL8r/hTxpWn/APPha/8Aflf8Ki07WNN1WPzLC+t7lPWGUNj646VoDmlKmouzVmHLHsVhpWnf8+Fr/wB+V/wpw0nTv+gfa/8Aflf8KtCnilyx7Byx7FUaTpv/AED7T/vyv+FVtT0vT49IvXSxtVdYHKsIVBB2nkcVrCqurf8AIFv/APr3k/8AQTSlGPK9BSjHlehyVn/x5wf9c1/lVkVXs/8Ajzg/65r/ACqyKcfhQ4/Chwqjqc5itJArbSVIB9KvgVR1K3M1uwHpVFHzrb2UcuuyWmpSSRsXYFwed2fU+tdlo/iXVPBN1HBdzPe6NK2FYnLR/T0+n5UniPwubidnX93MPuvj+dc3f3+oQafJp+oWm/PCzdvr7n8q+5p47+1eSOjTSUoOya/vwb/I5nHk/wAzsvHGq6jqNjcTRXtpJo8qI0aFctkdwcdc/Wk8E+KNbl1i3S9v08logi2sq7QycfMh7kY/nXFaTdtaslhfrus7jBUPyFPrXoNt4ahubJbeWLMQGUKnBQ9ip7GuHGVKeCpfVKkFKLvyzSW1kr/4rrXb1KinJ8yM74r6vfSXdrbR3EiWTISyqxAZs9/Wub+w3WhRW+saNfyO8YDvjjA69O49a67xJoMl1py28sjyMg+WV+ufWuR0O9fT7ttK1EbAThGbp9Poe1a4DHTeBUMMk3Tb5o2+OL6/L+uwpR9676nsWhfEGwv/AAw2rTq4NuALuOJdxi9Wx12+/pn0Natn488L3se+LXLJR6TSiI/k+DXhTvceENaF7ZjdZzZWSFuQynqp/of8ma703wu9vHfbrq2gl+75ZyoPp0OK5Z5bgW1UTlyVPhcVe3eLW9103uilOW3VHtF38RvC1vOluNYt5JJGCDysuoJ45YDAHvmvLfG/h+/1XxTPqD3MUlu7KFQsdyqAOAMY9e9YMN54R085WxuL9x0MrYH9P5V2fhXxLp3ibUBp0tqLOXbi3UybhJjsOBg47Vp9VxGXJ4nBQmkk1JzSX3LcXMp+7JmEnhm504i88P6pc292mCFZ9u72yP5GvRPhz8RpdfmfSNXRY9TiU4YDaJQOuR2b2+tLrWi/YbCWWFcuqkqB3NeXfDt2k8cpcyv+8UOxHqTxU0KksywNeeLs3TV1L7Xp5r1BrkkuXqfTqnIqQVUsnLwqT6VcFfLm44VV1b/kCX//AF7Sf+gmrYqrq/8AyBL/AP69pP8A0E1MvhZMvhZyVn/x5Qf9c1/lVkVXsv8Ajyg/65r/ACqyKI/Cgj8KHClKhhg0CniqKMfUNJSdSdozXmvi7R7+CEyWR5X7yYySPavYyuRWFq+lfaUOBWtCr7Koqlk7dGrp+omrqx8+TS3epCK2+ysZlPUDr/hXvnhW2f8Asa1juDulSNVY+pArn4vC7/ad23jNdzpNl9mhVT2r0MfmSxVOFGnTUIxu7K71e+/TyJjDld2yHUdISeEgLzXm3iXwrHdoVddki/ckA5H+Ir2XaCMGsy/0mO5U/LzXn0K9ShUVSk7SXUppNWZ86al/a1naNZXiCeHosvU/n/jV7whbPfW13ZTxF7ZwDg5xmvStU8JNI5KrV7QPDH2ZvmT68V7NTPHPCyoKkottO601XW3R+hmqVpXucfZ+EreCQGGyQHsWG4/rXeaFYTRhVdBtBBAI6V08GlwoB8gq7FbInRRXi1KtSq+apJt+buaJJbGTq1o01kRjtXi3iGKbwnqUep2On27zSyEebIrMVcjsAe4z+tfQkkQdCMVzWoaOXnDqvQ1thMT9XqqclzR6q7Sa7OwpK6NLwtqY1XQrS88p4WljDNG4IKnuOffNb4rH0m3eGMBq2Vrmk022lZFDhVXV/wDkCX//AF7Sf+gmrYqrq/8AyBL/AP69pP8A0E1EvhZMvhZyVl/x5W//AFzX+VWRXMxa1cxRJGqREIoUZB7fjUn9v3X/ADzh/wC+T/jWUa0bIzjVjZHSinCuZ/4SG7/55wf98n/Gl/4SK7/55wf98n/Gq9tEftonUCl2Butcv/wkl5/zyg/75P8AjS/8JLef88oP++T/AI0e2iHtonTrAgOcCp1UCuS/4Se9/wCeVv8A98t/jS/8JRe/88rf/vlv8aPbRD20TrxT8Zrjv+Eqvv8Anlb/APfLf40v/CV33/PK2/75b/Gj20Q9tE68wo3UCnpCq9BXHf8ACW3/APzxtv8Avlv8aX/hL9Q/5423/fLf/FUe2iHtonbAU8Vw/wDwmGof88bX/vlv/iqX/hMtR/542v8A3y3/AMVR7aIe2id0BQYlbqK4b/hM9R/542v/AHw3/wAVS/8ACa6l/wA8LT/vhv8A4qj20Q9tE7xEC9KkFcB/wm2pf88LT/vhv/iqX/hONT/54Wn/AHw3/wAVR7aIe2iegiqur/8AID1D/r2k/wDQTXFf8Jzqf/PC0/74b/4qo7nxnqN1azW7w2oSVGRiqtkAjHHzVMq0bMUqsbM//9k=","code":200,"captchaEnabled":true,"uuid":"aaa3320d3c434fad8839aee78aa14a8b"}',1,0,'小桐',1,TO_DATE('2026-01-20 13:20:55.871000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-22 09:12:29.459000','YYYY-MM-DD HH24:MI:SS'),null,3,1,null);

SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_CLASSIFY" ON;
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1,null,0,'0','产汇',null,1,1,'admin',1,TO_DATE('2025-11-14 18:32:07.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 13:58:54.546000','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(2,null,1,'0,1','产汇流','产汇流信息',1,1,'admin',1,TO_DATE('2025-11-14 18:32:20.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-07 14:09:38.504000','YYYY-MM-DD HH24:MI:SS'),'备注');
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(3,null,2,'0,1,2','产汇子流',null,1,1,'admin',1,TO_DATE('2025-12-11 10:11:01.786000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-07 14:09:38.294000','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(4,null,0,'0','水文预报',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:01:40.195000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:01:39.747354','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(5,null,0,'0','水文预报',null,1,1,'小桐',1,TO_DATE('2025-12-31 14:01:40.195000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:01:39.797140','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(6,null,4,'0,4','降雨径流模型',null,1,1,'小桐',1,TO_DATE('2025-12-31 14:01:55.418000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:01:55.028305','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(7,null,4,'0,4','洪水演进模型',null,1,1,'小桐',1,TO_DATE('2025-12-31 14:02:03.412000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:02:02.944971','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(8,null,4,'0,4','产汇流模型',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:02:11.096000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:02:10.355841','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(9,null,4,'0,4','实时洪水预报',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:02:17.963000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:02:17.218780','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(10,null,4,'0,4','中长期水文预测',null,1,1,'小桐',1,TO_DATE('2025-12-31 14:02:26.620000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:02:25.884513','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(11,null,0,'0','水工程安全',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:02:37.674000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:02:36.937830','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(12,null,11,'0,11','大坝渗流分析',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:02:45.087000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:02:44.350394','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(13,null,11,'0,11','堤防稳定性模型',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:02:50.961000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:02:50.223693','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(14,null,11,'0,11','溃坝风险模拟',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:02:56.663000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:02:55.926326','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(15,null,11,'0,11','泵站运行仿真',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:03:02.240000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:03:01.518488','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(16,null,11,'0,11','渡槽结构安全评估',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:03:08.006000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:03:07.265315','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(17,null,4,'0,4','中长期水文预测',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:03:52.680000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:03:51.957950','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(18,null,0,'0','水资源调度',null,1,1,'小桐',1,TO_DATE('2025-12-31 14:04:12.346000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:04:11.955667','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(19,null,0,'0','水资源调度',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:10:51.892000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:10:51.546755','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(20,null,19,'0,19','水库优化调度',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:10:59.906000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:10:59.492423','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(21,null,19,'0,19','流域水量分配',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:11:06.760000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:11:06.011118','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(22,null,0,'0','智慧水利',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:11:25.233000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:11:24.510223','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(23,null,22,'0,22','数字孪生流域',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:11:32.560000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:11:31.823621','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(24,null,22,'0,22','AI水位预测',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:11:38.776000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:11:38.048184','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(25,null,22,'0,22','无人机巡河识别模型',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:11:44.467000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:11:43.732902','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(26,null,22,'0,22','智能预警决策模型',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:11:51.320000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:11:50.594048','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(27,null,0,'0','其他',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:11:58.456000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:11:57.718672','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(28,null,27,'0,27','综合水利集成模型',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:12:04.449000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:12:03.694092','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(29,null,27,'0,27','跨流域调水仿真',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:12:10.400000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:12:09.652952','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(30,null,27,'0,27','水土保持模型',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:12:16.031000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:12:15.314793','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_CLASSIFY"("ID","COMPANY_ID","PARENT_ID","ANCESTORS","NAME","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(31,null,27,'0,27','冰凌洪水模拟',null,1,0,'小桐',1,TO_DATE('2025-12-31 14:12:23.519000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 14:12:22.789155','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_CLASSIFY" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_COMPUTE" ON;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_COMPUTE" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_HISTORY" ON;
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1251,null,1,'产汇流模型','新增了产汇流模型',null,null,1,0,null,null,TO_DATE('2025-11-14 18:34:05','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-14 18:34:04','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1252,null,1,'产汇流模型','修改了产汇流模型基本信息',null,null,1,0,null,null,TO_DATE('2025-11-14 18:35:44','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-14 18:34:04','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1253,null,2,'123','新增了123',null,'123',1,0,null,null,TO_DATE('2025-11-14 19:38:18','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-14 19:38:17','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1254,null,3,'test','新增了test',null,'1',1,0,null,null,TO_DATE('2025-11-16 15:38:07','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-16 15:38:07','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1255,null,4,'123123','新增了123123',null,'1',1,0,null,null,TO_DATE('2025-11-16 15:40:03','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-16 15:40:03','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1256,null,4,'123123','添加了一条【333】模型计算',null,'1',1,0,null,null,TO_DATE('2025-11-17 03:17:56','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-17 03:17:56','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1257,null,4,'测试','修改了测试基本信息',null,'1',1,0,null,null,TO_DATE('2025-11-17 04:21:54','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-16 15:40:03','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1258,null,5,'测试','新增了测试',null,'1',1,0,null,null,TO_DATE('2025-11-17 06:20:23','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-17 06:20:23','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1259,null,6,'ceshi ','新增了ceshi ',null,'1',1,0,null,null,TO_DATE('2025-11-18 10:45:41','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-18 10:45:41','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1260,null,5,'测试','添加了一条【null】模型计算',null,'1',1,0,null,null,TO_DATE('2025-11-18 10:48:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-18 10:48:00','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1261,null,5,'测试','修改了测试基本信息',null,'1',1,0,null,null,TO_DATE('2025-12-11 10:11:24','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-11-17 06:20:23','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1262,null,7,'来水预测模型','新增了来水预测模型',null,'v1.0',1,0,null,null,TO_DATE('2025-12-11 10:38:29','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-12-11 10:38:29','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1263,null,7,'来水预测模型','修改了来水预测模型基本信息',null,'v1.0',1,0,null,null,TO_DATE('2025-12-11 10:42:23','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-12-11 10:38:28','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1264,null,7,'来水预测模型','添加了一条【来水量】模型计算',null,null,1,0,null,null,TO_DATE('2025-12-11 13:49:48','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-12-11 13:49:48','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1265,null,7,'来水预测模型','添加了一条【入库流量】模型计算',null,null,1,0,null,null,TO_DATE('2025-12-11 13:50:24','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-12-11 13:50:24','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1266,null,7,'来水预测模型','修改了来水预测模型基本信息',null,'v1.0',1,0,null,null,TO_DATE('2025-12-11 14:38:09','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2025-12-11 10:38:28','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1267,null,5,'单机程序','修改了单机程序基本信息',null,'1',1,0,null,null,TO_DATE('2025-12-30 13:30:41','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-11-17 06:20:23','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1268,null,8,'综合水利集成模型','新增了综合水利集成模型',null,'1.0',1,0,null,null,TO_DATE('2025-12-31 15:40:24','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 15:40:24','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1269,null,9,'水土保持模型','新增了水土保持模型',null,'1.0',1,0,null,null,TO_DATE('2025-12-31 15:40:56','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 15:40:55','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1270,null,10,'水土保持模型','新增了水土保持模型',null,'1.0',1,0,null,null,TO_DATE('2025-12-31 18:17:47','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:17:47','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1271,null,10,'水土保持模型','添加了一条【水位计算】模型计算',null,'1',1,0,null,null,TO_DATE('2025-12-31 18:21:59','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:21:59','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1272,null,11,'AI水位预测','新增了AI水位预测',null,'1.2',1,0,null,null,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1273,null,11,'AI水位预测','修改了AI水位预测基本信息',null,'1.2',1,0,null,null,TO_DATE('2025-12-31 18:25:35','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1274,null,11,'AI水位预测1','修改了AI水位预测1基本信息',null,'1.2',1,0,null,null,TO_DATE('2026-01-06 11:20:45','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1275,null,11,'AI水位预测','修改了AI水位预测基本信息',null,'1.2',1,0,null,null,TO_DATE('2026-01-06 11:21:02','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1276,null,10,'水土保持模型','【水位计算】进行了模型计算',null,'1',1,0,null,null,TO_DATE('2026-01-06 12:07:39','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-06 12:07:39','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1277,null,11,'AI水位预测1','修改了AI水位预测1基本信息',null,'1.2',1,0,null,null,TO_DATE('2026-01-06 16:12:33','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1278,null,11,'AI水位预测','修改了AI水位预测基本信息',null,'1.2',1,0,null,null,TO_DATE('2026-01-06 16:12:38','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1279,null,11,'AI水位预测1','修改了AI水位预测1基本信息',null,'1.2',1,0,null,null,TO_DATE('2026-01-06 16:48:07','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1280,null,11,'AI水位预测','修改了AI水位预测基本信息',null,'1.2',1,0,null,null,TO_DATE('2026-01-06 16:48:23','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1281,null,11,'AI水位预测1','修改了AI水位预测1基本信息',null,'1.2',1,0,null,null,TO_DATE('2026-01-06 17:14:00','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1282,null,11,'AI水位预测','修改了AI水位预测基本信息',null,'1.2',1,0,null,null,TO_DATE('2026-01-06 17:14:12','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1283,null,7,null,'新增了【null:6379/123】接口地址',null,null,1,0,'小桐',1,TO_DATE('2026-01-14 14:20:25','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 14:20:25','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1284,null,7,null,'修改了【null:6379/null:6379/123】接口基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-14 14:46:12','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 14:46:12','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1285,null,7,'来水预测模型','新增了来水预测模型一个版本',null,'2',1,0,'小桐',1,TO_DATE('2026-01-14 15:26:32','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 15:26:32','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1286,null,7,null,'新增了【null:6379/123】接口地址',null,null,1,0,'小桐',1,TO_DATE('2026-01-14 15:27:03','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 15:27:03','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1287,null,7,'来水预测模型','切换了模型的版本号, 切换到了【2.0】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-14 15:32:22','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 15:32:22','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1288,null,7,'来水预测模型','切换了模型的版本号, 切换到了【null】',null,'v1.0',1,0,'小桐',1,TO_DATE('2026-01-14 15:32:30','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 15:32:30','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1289,null,7,null,'修改了【null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml】接口基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-14 16:04:23','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 16:04:23','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1290,null,7,null,'修改了【null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml】接口基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-14 16:04:43','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 16:04:43','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1291,null,7,null,'修改了【null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml】接口基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-14 16:04:56','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 16:04:56','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1292,null,null,'流量是计算','新增了流量是计算',null,'1',1,0,'小桐',1,TO_DATE('2026-01-14 16:22:54','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 16:22:54','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1293,null,12,'流量是计算','新增了流量是计算一个版本',null,'2',1,0,'小桐',1,TO_DATE('2026-01-14 16:51:33','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 16:51:33','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1294,null,12,'流量是计算','切换了模型的版本号, 切换到了【2.0】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-14 16:51:39','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 16:51:39','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1295,null,12,'流量是计算','添加了一条【avq】模型计算',null,'2',1,0,'小桐',1,TO_DATE('2026-01-15 10:04:36','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-15 10:04:36','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1296,null,7,'来水预测模型','添加了一条【测试】模型计算',null,'v1.0',1,0,'小桐',1,TO_DATE('2026-01-15 11:10:17','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-15 11:10:17','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1297,null,null,null,'修改了【null】基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-19 17:45:13','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-19 17:45:13','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1298,null,null,null,'修改了【null】基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-19 17:45:29','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-19 17:45:29','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1299,null,null,null,'修改了【null】基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-19 17:45:53','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-19 17:45:53','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1300,null,null,null,'修改了【null】基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-19 17:46:25','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-19 17:46:25','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1301,null,null,'接口服务类','新增了接口服务类',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 09:17:26','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 09:17:26','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1302,null,12,'流量是计算','新增了流量是计算一个版本',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 09:22:58','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 09:22:58','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1303,null,12,'流量是计算','切换了模型的版本号, 切换到了【3.0】',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 10:34:01','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 10:34:01','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1304,null,12,'流量是计算','切换了模型的版本号, 切换到了【2.0】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-20 10:52:30','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 10:52:30','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1305,null,12,'流量是计算','删除了流量是计算【3】版本的内容',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 11:03:54','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:03:54','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1308,null,12,'流量是计算','切换了模型的版本号, 切换到了【3】',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 11:27:10','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:27:10','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1309,null,12,'流量是计算','切换了模型的版本号, 切换到了【2】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-20 11:28:27','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:28:27','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1310,null,12,'流量是计算','切换了模型的版本号, 切换到了【3】',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 11:28:38','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:28:38','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1311,null,12,'流量是计算','切换了模型的版本号, 切换到了【3】',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 11:28:42','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:28:42','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1312,null,12,'流量是计算','切换了模型的版本号, 切换到了【2】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-20 11:28:47','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:28:47','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1313,null,12,'流量是计算','切换了模型的版本号, 切换到了【3】',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 11:30:36','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:30:36','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1314,null,12,'流量是计算','切换了模型的版本号, 切换到了【2】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-20 11:38:21','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:38:21','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1315,null,12,'流量是计算','切换了模型的版本号, 切换到了【3】',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 11:41:12','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:41:12','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1316,null,12,'流量是计算','切换了模型的版本号, 切换到了【2】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-20 11:41:23','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:41:23','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1317,null,7,'来水预测模型','新增了来水预测模型一个版本',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 11:56:45','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:56:45','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1318,null,7,'来水预测模型','切换了模型的版本号, 切换到了【3】',null,'3',1,0,'小桐',1,TO_DATE('2026-01-20 11:57:00','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:57:00','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1319,null,7,'来水预测模型','删除了来水预测模型【v1.0】版本的内容',null,'v1.0',1,0,'小桐',1,TO_DATE('2026-01-20 11:57:09','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:57:09','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1320,null,7,'来水预测模型','切换了模型的版本号, 切换到了【2】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-20 13:18:54','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 13:18:54','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1321,null,13,'接口服务类','新增了接口服务类一个版本',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 13:19:31','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 13:19:31','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1322,null,13,'接口服务类','切换了模型的版本号, 切换到了【1】',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 13:19:36','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 13:19:36','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1323,null,13,null,'新增了【null:80/http://localhost/dev-api/captchaImage】接口地址',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 13:20:18','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 13:20:18','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1324,null,13,'接口服务类','添加了一条【接口计算】模型计算',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 13:20:55','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 13:20:55','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1325,null,13,null,'修改了【null:80/http://localhost/dev-api/captchaImage】接口基本信息',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 15:48:04','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 15:48:04','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1326,null,13,'接口服务类','修改了接口服务类基本信息',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 16:03:02','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 16:03:02','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1327,null,13,'接口服务类','修改了接口服务类基本信息',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 16:03:38','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 16:03:38','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1328,null,13,'接口服务类','修改了接口服务类基本信息',null,'1',1,0,'小桐',1,TO_DATE('2026-01-20 16:04:14','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 16:04:14','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1329,null,null,null,'修改了【null】基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-20 17:22:42','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 17:22:42','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1330,null,null,null,'修改了【null】基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-20 17:23:37','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 17:23:37','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1331,null,null,null,'修改了【null】基本信息',null,null,1,0,'小桐',1,TO_DATE('2026-01-20 17:29:54','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 17:29:54','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1332,null,13,null,'新增了【null:80/http://localhost:8090/captchaImage】接口地址',null,'1',1,0,'小桐',1,TO_DATE('2026-01-21 14:26:05','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 14:26:05','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1333,null,null,'base64图片获取','新增了base64图片获取',null,'1',1,0,'小桐',1,TO_DATE('2026-01-21 14:41:42','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 14:41:42','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1334,null,null,'测试','新增了测试',null,'1',1,0,'小桐',1,TO_DATE('2026-01-21 14:47:59','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 14:47:59','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1335,null,null,'测试','新增了测试',null,'1',1,0,'小桐',1,TO_DATE('2026-01-21 15:27:04','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 15:27:04','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1336,null,13,'接口服务类','新增了接口服务类一个版本',null,'2',1,0,'小桐',1,TO_DATE('2026-01-21 16:30:20','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 16:30:20','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1337,null,13,'接口服务类','修改了接口服务类【2】版本的内容',null,'2',1,0,'小桐',1,TO_DATE('2026-01-21 16:47:49','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 16:47:49','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1338,null,13,'接口服务类','修改了接口服务类【2】版本的内容',null,'2',1,0,'小桐',1,TO_DATE('2026-01-21 16:50:09','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 16:50:09','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1339,null,13,'接口服务类','切换了模型的版本号, 切换到了【2】',null,'2',1,0,'小桐',1,TO_DATE('2026-01-21 16:50:18','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 16:50:18','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_HISTORY"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","CONTEXT","START_TIME","MODEL_VERSION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1340,null,13,'接口服务类','修改了接口服务类【1】版本的内容',null,'1',1,0,'小桐',1,TO_DATE('2026-01-21 16:50:34','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 16:50:34','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_HISTORY" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_INPUT" ON;
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(1,null,'123','333',0,4,'测试','1',null,null,null,'[]','[]',1,1,'admin',null,TO_DATE('2025-11-17 04:22:12.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-17 04:57:36.024000','YYYY-MM-DD HH24:MI:SS'),null,1);
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(2,null,'q','q',0,8,'综合水利集成模型','1','水位',null,null,'[]','[]',1,0,'admin',null,TO_DATE('2025-11-17 06:20:52.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 16:09:04.548000','YYYY-MM-DD HH24:MI:SS'),null,0);
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(3,null,'日水量','AW_DT',0,7,'来水预测模型',null,null,null,null,'[]','[]',1,1,'admin',null,TO_DATE('2025-12-11 13:53:10.981000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-11 13:53:11.165593','YYYY-MM-DD HH24:MI:SS'),null,1);
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(4,null,'水位','P',1,10,'水土保持模型','1',null,null,null,'[]','[]',1,0,'小桐',null,TO_DATE('2025-12-31 18:21:14.953000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 18:21:14.216923','YYYY-MM-DD HH24:MI:SS'),null,1);
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(5,null,'q','123',null,11,'AI水位预测','1',null,null,null,'[]','[]',1,1,'小桐',null,TO_DATE('2026-01-06 11:43:32.717000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2026-01-06 11:43:32.884980','YYYY-MM-DD HH24:MI:SS'),null,1);
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(6,null,'q','123',1,11,'AI水位预测','1',null,null,null,'[]','[{"name":"q","value":"1","order":2,"index":1}]',1,0,'小桐',null,TO_DATE('2026-01-06 11:44:06.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2026-01-06 11:48:17.647000','YYYY-MM-DD HH24:MI:SS'),null,1);
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(7,null,'测试','name',0,5,'单机程序','1',null,null,null,'[]','[]',1,1,'小桐',null,TO_DATE('2026-01-06 13:58:57.529000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2026-01-06 11:48:17.000000','YYYY-MM-DD HH24:MI:SS'),null,0);
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(8,null,'q','level',0,5,'单机程序','1','说明',null,null,'[]','[]',1,0,'小桐',1,TO_DATE('2026-01-09 16:35:37.330000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-09 16:35:37.330000','YYYY-MM-DD HH24:MI:SS'),null,1);
INSERT INTO "QMODEL_DEV"."MODEL_INPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","EXAMPLE","PARAM_FILE","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","CHANGE_FLAG") VALUES(9,null,'q','/data/jgst/jgst.chaoshen.20250113/data_input.json',1,12,'流量是计算','2','参数说明',null,null,'[]','[{"name":"q","value":"0","order":213,"index":1}]',1,0,'小桐',1,TO_DATE('2026-01-14 16:59:34.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 15:17:32.386000','YYYY-MM-DD HH24:MI:SS'),null,1);

SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_INPUT" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS" ON;
INSERT INTO "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"("ID","COMPANY_ID","MODEL_ID","INTERFACE_ADDRESS","VERSION_ID","REQUEST_METHOD","INPUT_PARAMETER","OUTPUT_PARAMETER","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","INPUT_PARAMETER_ILLUSTRATE","OUTPUT_PARAMETER_ILLUSTRATE") VALUES(1,null,7,'null:6379/null:6379/123',7,1,null,null,1,'小桐',1,TO_DATE('2026-01-14 14:20:25.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 14:46:12.370000','YYYY-MM-DD HH24:MI:SS'),'测试',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"("ID","COMPANY_ID","MODEL_ID","INTERFACE_ADDRESS","VERSION_ID","REQUEST_METHOD","INPUT_PARAMETER","OUTPUT_PARAMETER","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","INPUT_PARAMETER_ILLUSTRATE","OUTPUT_PARAMETER_ILLUSTRATE") VALUES(2,null,7,'null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml',7,2,null,null,0,'小桐',1,TO_DATE('2026-01-14 15:27:03.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 16:04:55.923000','YYYY-MM-DD HH24:MI:SS'),'测试新增',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"("ID","COMPANY_ID","MODEL_ID","INTERFACE_ADDRESS","VERSION_ID","REQUEST_METHOD","INPUT_PARAMETER","OUTPUT_PARAMETER","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","INPUT_PARAMETER_ILLUSTRATE","OUTPUT_PARAMETER_ILLUSTRATE") VALUES(3,null,13,'http://localhost/dev-api/captchaImage',18,0,null,null,0,'小桐',1,TO_DATE('2026-01-20 13:20:18.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 15:48:04.800000','YYYY-MM-DD HH24:MI:SS'),'q',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"("ID","COMPANY_ID","MODEL_ID","INTERFACE_ADDRESS","VERSION_ID","REQUEST_METHOD","INPUT_PARAMETER","OUTPUT_PARAMETER","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","INPUT_PARAMETER_ILLUSTRATE","OUTPUT_PARAMETER_ILLUSTRATE") VALUES(4,null,13,'null:80/http://localhost:8090/captchaImage',18,0,null,null,0,'小桐',1,TO_DATE('2026-01-21 14:26:04.993000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 14:26:04.993000','YYYY-MM-DD HH24:MI:SS'),'z',null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_OPERATE" ON;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_OPERATE" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_OUTPUT" ON;
INSERT INTO "QMODEL_DEV"."MODEL_OUTPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(1,null,'33','22',1,4,'测试','1',null,'[]','[{"name":"1","value":"2","order":0,"index":1}]',1,1,'admin',1,TO_DATE('2025-11-17 04:29:29.083000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-17 04:29:28.724828','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_OUTPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(2,null,'z','z',0,5,'测试','1',null,'"1"','[]',1,0,'admin',1,TO_DATE('2025-11-17 06:21:19.995000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-17 06:21:20.060947','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_OUTPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(3,null,'水利1112','weater',0,5,'单机程序','1',null,'[]','[]',1,1,'小桐',1,TO_DATE('2026-01-06 14:47:18.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2026-01-06 14:47:24.096000','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_OUTPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(4,null,'输出模型','q',0,5,'单机程序','1','qqq','"0"','[]',1,0,'小桐',1,TO_DATE('2026-01-09 16:26:54.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-13 14:52:55.519000','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."MODEL_OUTPUT"("ID","COMPANY_ID","NAME","ENG_NAME","TYPE","MODEL_ID","MODEL_NAME","MODEL_VERSION","DESCRIPTION","SINGLE_CONTENT","MULTIPLE_CONTENT","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK") VALUES(5,null,'AVQ','/data/jgst/jgst.chaoshen.20250113/data_output.json',0,12,'流量是计算','2','测试','"0"','[]',1,0,'小桐',1,TO_DATE('2026-01-14 18:05:18.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 15:16:51.571000','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_OUTPUT" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_RECONSTITUTION" ON;
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(1,null,'产汇流模型',2,null,null,null,null,1,0,TO_DATE('2025-11-14 18:35:43.813000','YYYY-MM-DD HH24:MI:SS'),1,'admin',1,TO_DATE('2025-11-14 18:34:04.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-14 18:35:43.813000','YYYY-MM-DD HH24:MI:SS'),null,null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(2,null,'123',2,1,1,null,null,2,0,null,1,'admin',1,TO_DATE('2025-11-14 19:38:17.146000','YYYY-MM-DD HH24:MI:SS'),null,null,null,null,'123',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(3,null,'test',2,0,0,null,'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip',3,0,null,1,'admin',1,TO_DATE('2025-11-16 15:38:07.007000','YYYY-MM-DD HH24:MI:SS'),null,null,null,null,null,'YL_DP_USER-MODEL etc.zip',null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(4,null,'测试',2,0,0,null,'http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip',4,0,TO_DATE('2025-11-17 04:21:54.682000','YYYY-MM-DD HH24:MI:SS'),1,'admin',1,TO_DATE('2025-11-16 15:40:03.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-17 04:21:54.682000','YYYY-MM-DD HH24:MI:SS'),null,null,'YL_DP_USER-MODEL etc.zip',null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(5,null,'单机程序',3,0,0,null,'http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip',5,0,TO_DATE('2025-12-30 13:30:41.029000','YYYY-MM-DD HH24:MI:SS'),1,'admin',1,TO_DATE('2025-11-17 06:20:23.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-30 13:30:41.029000','YYYY-MM-DD HH24:MI:SS'),null,null,'YL_DP_USER-MODEL etc.zip',null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(6,null,'ceshi ',2,null,1,null,null,6,0,null,1,'admin',1,TO_DATE('2025-11-18 10:45:41.091000','YYYY-MM-DD HH24:MI:SS'),null,null,null,null,'1001',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(7,null,'来水预测模型',3,0,1,null,null,12,0,TO_DATE('2025-12-11 14:38:09.450000','YYYY-MM-DD HH24:MI:SS'),1,'admin',1,TO_DATE('2025-12-11 10:38:28.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 15:32:29.822000','YYYY-MM-DD HH24:MI:SS'),'模型介绍','6379',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(8,null,'综合水利集成模型',28,1,0,null,null,8,0,null,1,'小桐',1,TO_DATE('2025-12-31 15:40:23.662000','YYYY-MM-DD HH24:MI:SS'),null,null,null,null,null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(9,null,'水土保持模型',30,null,0,null,null,9,0,null,1,'小桐',1,TO_DATE('2025-12-31 15:40:55.356000','YYYY-MM-DD HH24:MI:SS'),null,null,null,null,null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(10,null,'水土保持模型',30,1,0,null,'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip',10,0,null,1,'小桐',1,TO_DATE('2025-12-31 18:17:47.374000','YYYY-MM-DD HH24:MI:SS'),null,null,null,null,null,'jgst.chaoshen.20250113.zip',null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(11,null,'AI水位预测',29,0,0,null,'http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip',11,0,TO_DATE('2026-01-06 17:14:08.947000','YYYY-MM-DD HH24:MI:SS'),0,'小桐',1,TO_DATE('2025-12-31 18:25:19.000000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2026-01-06 17:14:08.947000','YYYY-MM-DD HH24:MI:SS'),null,null,'jgst.chaoshen.20250113.zip',null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(12,null,'流量是计算',9,1,0,null,'http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip',14,0,null,0,'小桐',1,TO_DATE('2026-01-14 16:22:53.059000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 10:52:30.483000','YYYY-MM-DD HH24:MI:SS'),null,null,null,'\jgst.chaoshen.20250113\data.json');
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(13,null,'接口服务类',9,1,1,null,null,22,1,TO_DATE('2026-01-20 16:04:14.488000','YYYY-MM-DD HH24:MI:SS'),0,'小桐',1,TO_DATE('2026-01-20 09:17:25.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 16:04:14.490000','YYYY-MM-DD HH24:MI:SS'),null,'80',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(14,null,'base64图片获取',3,1,1,null,null,19,0,null,1,'小桐',1,TO_DATE('2026-01-21 14:41:41.405000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 14:41:41.405000','YYYY-MM-DD HH24:MI:SS'),null,'80',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(15,null,'测试',3,1,1,null,null,20,0,null,1,'小桐',1,TO_DATE('2026-01-21 14:47:59.010000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 14:47:59.010000','YYYY-MM-DD HH24:MI:SS'),null,'6379',null,null);
INSERT INTO "QMODEL_DEV"."MODEL_RECONSTITUTION"("ID","COMPANY_ID","NAME","CLASSIFY_ID","BUILTIN","ACCESS_MODE","REQUEST_METHOD","INTERFACEORFILE_ADDRESS","VERSION_ID","WHETHER_PUBLISH","PUBLISH_TIME","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","PORT","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(16,null,'测试',17,0,1,null,'http:192.1623',21,0,null,1,'小桐',1,TO_DATE('2026-01-21 15:27:03.909000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 15:27:03.909000','YYYY-MM-DD HH24:MI:SS'),null,'8888',null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_RECONSTITUTION" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_VERSION" ON;
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(1,null,1,'产汇流模型',null,null,null,1,'产汇流模型',1,0,'admin',1,TO_DATE('2025-11-14 18:34:04.263000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-14 18:34:04.438000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(2,null,2,'123','123',null,null,1,'123',1,0,'admin',1,TO_DATE('2025-11-14 19:38:17.041000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-14 19:38:17.242000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(3,null,3,'test','1','http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip','http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153741A009.zip',1,'1',1,0,'admin',1,TO_DATE('2025-11-16 15:38:06.872000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-16 15:38:07.134000','YYYY-MM-DD HH24:MI:SS'),null,null,'\MODEL_OUTPUT.sql');
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(4,null,4,'123123','1','http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip','http://localhost:8080/profile/upload/2025/11/16/YL_DP_USER-MODEL etc_20251116153827A010.zip',1,'1',1,0,'admin',1,TO_DATE('2025-11-16 15:40:03.110000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-16 15:40:03.199000','YYYY-MM-DD HH24:MI:SS'),null,null,'\MODEL_OUTPUT.sql');
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(5,null,5,'测试','1','http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip','http://110.42.38.62:52000/profile/upload/2025/11/17/YL_DP_USER-MODEL etc_20251117062018A001.zip',1,'1',1,0,'admin',1,TO_DATE('2025-11-17 06:20:22.880000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-17 06:20:23.160000','YYYY-MM-DD HH24:MI:SS'),null,null,'MODEL_COMPUTE.sql');
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(6,null,6,'ceshi ','1',null,null,1,'1',1,0,'admin',1,TO_DATE('2025-11-18 10:45:41.025000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-11-18 10:45:41.173000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(7,null,7,'来水预测模型','v1.0',null,null,0,'测试',1,1,'admin',1,TO_DATE('2025-12-11 10:38:28.382000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:56:59.729000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(8,null,8,'综合水利集成模型','1.0',null,null,1,'综合水利集成模型演算',1,0,'小桐',1,TO_DATE('2025-12-31 15:40:23.448000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 15:40:23.872000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(9,null,9,'水土保持模型','1.0',null,null,1,'水土保持模型',1,0,'小桐',1,TO_DATE('2025-12-31 15:40:54.866000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 15:40:55.888000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(10,null,10,'水土保持模型','1.0','http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip','http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip',1,'水土保持模型',1,0,'小桐',1,TO_DATE('2025-12-31 18:17:47.111000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 18:17:47.564000','YYYY-MM-DD HH24:MI:SS'),null,null,'\jgst.chaoshen.20250113\chaoshen.20250113.py');
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(11,null,11,'AI水位预测','1.2','http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip','http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip',1,'AI水位预测',1,0,'小桐',1,TO_DATE('2025-12-31 18:25:19.168000','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2025-12-31 18:25:19.859000','YYYY-MM-DD HH24:MI:SS'),null,null,'\jgst.chaoshen.20250113\chaoshen.20250113.py');
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(12,null,7,'来水预测模型','2',null,null,1,'测试',1,0,'小桐',1,TO_DATE('2026-01-14 15:26:32.786000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 13:18:54.226000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(13,null,null,'流量是计算','1','http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip','http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip',1,'不能为空',1,0,'小桐',1,TO_DATE('2026-01-14 16:22:52.523000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-14 16:22:52.523000','YYYY-MM-DD HH24:MI:SS'),null,null,'\jgst.chaoshen.20250113\data.json');
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(14,null,12,'流量是计算','2',null,null,1,null,1,0,'小桐',1,TO_DATE('2026-01-14 16:51:33.881000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 11:41:22.482000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(15,null,null,'接口服务类','1',null,null,1,'接口服务类',1,0,'小桐',1,TO_DATE('2026-01-20 09:17:24.958000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 09:17:24.958000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(16,null,12,'流量是计算','3',null,null,0,null,1,1,'小桐',1,TO_DATE('2026-01-20 09:22:58.602000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 10:52:29.104000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(17,null,7,'来水预测模型','3',null,null,0,null,1,0,'小桐',1,TO_DATE('2026-01-20 11:56:45.131000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-20 13:18:54.051000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(18,null,13,'接口服务类','1',null,null,0,'version1',1,0,'小桐',1,TO_DATE('2026-01-20 13:19:31.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 16:50:33.965000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(19,null,null,'base64图片获取','1',null,null,1,'测试',1,0,'小桐',1,TO_DATE('2026-01-21 14:41:41.014000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 14:41:41.014000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(20,null,null,'测试','1',null,null,1,'测试',1,0,'小桐',1,TO_DATE('2026-01-21 14:47:58.778000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 14:47:58.778000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(21,null,null,'测试','1','http:192.1623','http:192.1623',1,'1',1,0,'小桐',1,TO_DATE('2026-01-21 15:27:03.672000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 15:27:03.672000','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."MODEL_VERSION"("ID","COMPANY_ID","MODEL_ID","MODEL_NAME","VERSION","FILE_ADDRESS","INTERFACE_ADDRESS","STATUS","DESCRIPTION","VALID_FLAG","DEL_FLAG","CREATE_BY","CREATOR_ID","CREATE_TIME","UPDATE_BY","UPDATOR_ID","UPDATE_TIME","REMARK","FILE_NAME","RUNNABLE_FILE_ADDRESS") VALUES(22,null,13,'接口服务类','2',null,null,1,'version22',1,0,'小桐',1,TO_DATE('2026-01-21 16:30:20.000000','YYYY-MM-DD HH24:MI:SS'),'小桐',1,TO_DATE('2026-01-21 16:50:18.184000','YYYY-MM-DD HH24:MI:SS'),null,null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."MODEL_VERSION" OFF;
INSERT INTO "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"("sched_name","trigger_name","trigger_group","cron_expression","time_zone_id") VALUES('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai');
INSERT INTO "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"("sched_name","trigger_name","trigger_group","cron_expression","time_zone_id") VALUES('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai');
INSERT INTO "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"("sched_name","trigger_name","trigger_group","cron_expression","time_zone_id") VALUES('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');

INSERT INTO "QMODEL_DEV"."QRTZ_JOB_DETAILS"("sched_name","job_name","job_group","description","job_class_name","is_durable","is_nonconcurrent","is_update_data","requests_recovery","job_data") VALUES('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',null,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO "QMODEL_DEV"."QRTZ_JOB_DETAILS"("sched_name","job_name","job_group","description","job_class_name","is_durable","is_nonconcurrent","is_update_data","requests_recovery","job_data") VALUES('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',null,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO "QMODEL_DEV"."QRTZ_JOB_DETAILS"("sched_name","job_name","job_group","description","job_class_name","is_durable","is_nonconcurrent","is_update_data","requests_recovery","job_data") VALUES('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',null,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D6571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978707074000561646D696E740013323032342D30382D31382030313A32333A323970707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

INSERT INTO "QMODEL_DEV"."QRTZ_LOCKS"("sched_name","lock_name") VALUES('RuoyiScheduler','TRIGGER_ACCESS');

INSERT INTO "QMODEL_DEV"."QRTZ_TRIGGERS"("sched_name","trigger_name","trigger_group","job_name","job_group","description","next_fire_time","prev_fire_time","priority","trigger_state","trigger_type","start_time","end_time","calendar_name","misfire_instr","job_data") VALUES('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',null,1723915630000,-1,5,'PAUSED','CRON',1723915630000,0,null,2,null);
INSERT INTO "QMODEL_DEV"."QRTZ_TRIGGERS"("sched_name","trigger_name","trigger_group","job_name","job_group","description","next_fire_time","prev_fire_time","priority","trigger_state","trigger_type","start_time","end_time","calendar_name","misfire_instr","job_data") VALUES('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',null,1723915635000,-1,5,'PAUSED','CRON',1723915631000,0,null,2,null);
INSERT INTO "QMODEL_DEV"."QRTZ_TRIGGERS"("sched_name","trigger_name","trigger_group","job_name","job_group","description","next_fire_time","prev_fire_time","priority","trigger_state","trigger_type","start_time","end_time","calendar_name","misfire_instr","job_data") VALUES('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',null,1723915640000,-1,5,'PAUSED','CRON',1723915632000,0,null,2,null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_CONFIG" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_CONFIG"("config_id","config_name","config_key","config_value","config_type","create_by","create_time","update_by","update_time","remark") VALUES(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO "QMODEL_DEV"."SYSTEM_CONFIG"("config_id","config_name","config_key","config_value","config_type","create_by","create_time","update_by","update_time","remark") VALUES(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'初始化密码 123456');
INSERT INTO "QMODEL_DEV"."SYSTEM_CONFIG"("config_id","config_name","config_key","config_value","config_type","create_by","create_time","update_by","update_time","remark") VALUES(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'深色主题theme-dark，浅色主题theme-light');
INSERT INTO "QMODEL_DEV"."SYSTEM_CONFIG"("config_id","config_name","config_key","config_value","config_type","create_by","create_time","update_by","update_time","remark") VALUES(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'是否开启验证码功能（true开启，false关闭）');
INSERT INTO "QMODEL_DEV"."SYSTEM_CONFIG"("config_id","config_name","config_key","config_value","config_type","create_by","create_time","update_by","update_time","remark") VALUES(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'是否开启注册用户功能（true开启，false关闭）');
INSERT INTO "QMODEL_DEV"."SYSTEM_CONFIG"("config_id","config_name","config_key","config_value","config_type","create_by","create_time","update_by","update_time","remark") VALUES(6,'用户登录-黑名单列表','sys.login.blackIPList','-','Y','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-26 15:51:27','YYYY-MM-DD HH24:MI:SS'),'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_CONFIG" OFF;
INSERT INTO "QMODEL_DEV"."SYSTEM_CONTENT"("id","sys_name","logo","login_logo","carousel_image","contact_number","email","copyright","record_number","del_flag","status","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(1,null,null,null,null,'400-660-8208','support@qiantong.tech','Copyright© 2026 江苏干桐科技有限公司 版权所有','苏ICP备2022008519号-3',0,null,null,null,null,'小桐',1,TO_DATE('2025-12-31 11:56:30','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_DEPT" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(100,0,'0','千桐科技',0,'千桐','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-10-29 16:51:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(101,100,'0,100','南京总公司',1,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-19 13:46:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(102,100,'0,100','郑州分公司',2,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-19 13:46:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(103,101,'0,100,101','研发部门',1,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(104,101,'0,100,101','市场部门',2,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(105,101,'0,100,101','测试部门',3,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(106,101,'0,100,101','财务部门',4,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(107,101,'0,100,101','运维部门',5,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-26 15:50:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(108,102,'0,100,102','市场部门',1,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DEPT"("dept_id","parent_id","ancestors","dept_name","order_num","leader","phone","email","status","del_flag","create_by","create_time","update_by","update_time") VALUES(109,102,'0,100,102','财务部门',2,'冰凤','15888888888','bf@qq.com','0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_DEPT" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_DICT_DATA" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(1,1,'男','0','sys_user_sex',null,null,'Y','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'性别男');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(2,2,'女','1','sys_user_sex',null,null,'N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'性别女');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(3,3,'未知','2','sys_user_sex',null,null,'N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'性别未知');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(4,1,'显示','0','sys_show_hide',null,'primary','Y','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'显示菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(5,2,'隐藏','1','sys_show_hide',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'隐藏菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(6,1,'正常','0','sys_normal_disable',null,'primary','Y','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'正常状态');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(7,2,'停用','1','sys_normal_disable',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'停用状态');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(8,1,'正常','0','sys_job_status',null,'primary','Y','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'正常状态');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(9,2,'暂停','1','sys_job_status',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'停用状态');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(10,1,'默认','DEFAULT','sys_job_group',null,null,'Y','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'默认分组');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(11,2,'系统','SYSTEM','sys_job_group',null,null,'N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'系统分组');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(12,1,'是','Y','sys_yes_no',null,'primary','Y','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'系统默认是');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(13,2,'否','N','sys_yes_no',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'系统默认否');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(14,1,'通知','1','sys_notice_type',null,'warning','Y','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'通知');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(15,2,'公告','2','sys_notice_type',null,'success','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'公告');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(16,1,'正常','0','sys_notice_status',null,'primary','Y','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'正常状态');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(17,2,'关闭','1','sys_notice_status',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'关闭状态');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(18,99,'其他','0','sys_oper_type',null,'info','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'其他操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(19,1,'新增','1','sys_oper_type',null,'info','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'新增操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(20,2,'修改','2','sys_oper_type',null,'info','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'修改操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(21,3,'删除','3','sys_oper_type',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'删除操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(22,4,'授权','4','sys_oper_type',null,'primary','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'授权操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(23,5,'导出','5','sys_oper_type',null,'warning','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'导出操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(24,6,'导入','6','sys_oper_type',null,'warning','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'导入操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(25,7,'强退','7','sys_oper_type',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'强退操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(26,8,'生成代码','8','sys_oper_type',null,'warning','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'生成操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(27,9,'清空数据','9','sys_oper_type',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'清空操作');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(28,1,'成功','0','sys_common_status',null,'primary','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'正常状态');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(29,2,'失败','1','sys_common_status',null,'danger','N','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'停用状态');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(30,0,'Web','0','auth_app_type',null,'primary','N','0','admin',TO_DATE('2024-08-31 14:27:22','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-08-31 14:27:31','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(31,1,'App','1','auth_app_type',null,'info','N','0','admin',TO_DATE('2024-08-31 14:27:47','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(32,2,'小程序','2','auth_app_type',null,'warning','N','0','admin',TO_DATE('2024-08-31 14:28:06','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(33,1,'有效','1','sys_valid',null,'success','N','0','admin',TO_DATE('2024-08-31 15:33:49','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-08-31 15:34:08','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(34,0,'无效','0','sys_valid',null,'danger','N','0','admin',TO_DATE('2024-08-31 15:34:21','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(35,0,'非公开','0','auth_public',null,'warning','N','0','admin',TO_DATE('2024-08-31 15:36:48','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(36,1,'公开','1','auth_public',null,'success','N','0','admin',TO_DATE('2024-08-31 15:36:59','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(37,0,'通知','0','message_category',null,'success','N','0','admin',TO_DATE('2024-11-07 14:28:29','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-19 14:19:58','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(38,0,'重要','0','message_level',null,'default','N','0','admin',TO_DATE('2024-11-07 14:28:42','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(39,2,'审批','2','message_category',null,'warning','N','0','admin',TO_DATE('2024-11-19 14:20:42','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-19 16:55:16','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(41,3,'其他','3','message_category',null,'info','N','0','admin',TO_DATE('2024-11-19 14:21:12','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-19 14:19:31','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(42,1,'公告','1','message_category',null,'primary','N','0','admin',TO_DATE('2024-11-19 16:54:18','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-19 16:55:05','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(43,0,'是','true','sys_boolean',null,'success','N','0','admin',TO_DATE('2024-12-03 15:46:40','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(44,0,'否','false','sys_boolean',null,'danger','N','0','admin',TO_DATE('2024-12-03 15:46:57','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(45,1,'一般','1','message_level',null,'info','N','0','admin',TO_DATE('2024-12-25 16:21:09','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(46,2,'警告','2','message_level',null,'warning','N','0','admin',TO_DATE('2024-12-25 16:21:30','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(54,1,'无关紧要(0-60)','1','project_priority',null,'info','N','0','admin',TO_DATE('2025-01-03 13:20:35','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-01-16 11:38:15','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(55,2,'低(60-80)','2','project_priority',null,'info','N','0','admin',TO_DATE('2025-01-03 13:20:56','YYYY-MM-DD HH24:MI:SS'),'bf2',TO_DATE('2025-01-21 10:50:59','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(56,3,'中(80-90)','3','project_priority',null,'primary','N','0','admin',TO_DATE('2025-01-03 13:21:11','YYYY-MM-DD HH24:MI:SS'),'bf2',TO_DATE('2025-01-21 10:51:35','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(57,4,'高(90-100)','4','project_priority',null,'success','N','0','admin',TO_DATE('2025-01-03 13:21:25','YYYY-MM-DD HH24:MI:SS'),'bf2',TO_DATE('2025-01-21 10:51:38','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(90,0,'水量调度','1','model_type',null,'default','N','0','admin',TO_DATE('2025-11-14 17:04:57','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(91,1,'水动力','2','model_type',null,'default','N','0','admin',TO_DATE('2025-11-14 17:05:06','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(92,2,'设备安全','3','model_type',null,'default','N','0','admin',TO_DATE('2025-11-14 17:05:13','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(93,0,'单值','0','model_input_param_type',null,'default','N','0','admin',TO_DATE('2025-11-17 04:24:22','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-11-17 04:27:48','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(94,1,'多列数值','1','model_input_param_type',null,'default','N','0','admin',TO_DATE('2025-11-17 04:24:29','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-11-17 04:27:53','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(95,2,'文件','2','model_input_param_type',null,'default','N','0','admin',TO_DATE('2025-11-17 04:24:35','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-11-17 04:27:59','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(96,0,'成功','0','calculation_status',null,'success','N','0','小桐',TO_DATE('2025-12-31 15:24:38','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(97,0,'失败','1','calculation_status',null,'danger','N','0','小桐',TO_DATE('2025-12-31 15:24:46','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(98,0,'get','0','model_access_mode',null,'primary','N','0','小桐',TO_DATE('2026-01-20 15:35:38','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-21 14:23:31','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(99,1,'post','1','model_access_mode',null,'warning','N','0','小桐',TO_DATE('2026-01-20 15:35:56','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-21 14:23:42','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(100,2,'put','2','model_access_mode',null,'warning','N','0','小桐',TO_DATE('2026-01-20 15:36:08','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-21 14:24:40','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_DATA"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark") VALUES(101,3,'delete','3','model_access_mode',null,'danger','N','0','小桐',TO_DATE('2026-01-20 15:36:20','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-21 14:23:52','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_DICT_DATA" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_DICT_TYPE" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(1,'用户性别','sys_user_sex','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-26 15:51:04','YYYY-MM-DD HH24:MI:SS'),'用户性别列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(2,'菜单状态','sys_show_hide','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'菜单状态列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(3,'系统开关','sys_normal_disable','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'系统开关列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(4,'任务状态','sys_job_status','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'任务状态列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(5,'任务分组','sys_job_group','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'任务分组列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(6,'系统是否','sys_yes_no','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'系统是否列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(7,'通知类型','sys_notice_type','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'通知类型列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(8,'通知状态','sys_notice_status','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'通知状态列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(9,'操作类型','sys_oper_type','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'操作类型列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(10,'系统状态','sys_common_status','0','admin',TO_DATE('2024-05-06 06:12:18','YYYY-MM-DD HH24:MI:SS'),null,null,'登录状态列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(11,'应用类型','auth_app_type','0','admin',TO_DATE('2024-08-31 14:27:03','YYYY-MM-DD HH24:MI:SS'),null,null,'应用类型列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(12,'是否有效','sys_valid','0','admin',TO_DATE('2024-08-31 15:33:08','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-08-31 15:36:13','YYYY-MM-DD HH24:MI:SS'),'系统有效列表');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(13,'是否公开','auth_public','0','admin',TO_DATE('2024-08-31 15:35:49','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-08-31 15:36:00','YYYY-MM-DD HH24:MI:SS'),'应用是否公开');
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(14,'消息类型','message_category','0','admin',TO_DATE('2024-11-07 14:27:58','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(15,'消息等级','message_level','0','admin',TO_DATE('2024-11-07 14:28:09','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(16,'布尔值字典','sys_boolean','0','admin',TO_DATE('2024-12-03 15:46:14','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(19,'优先级','project_priority','0','admin',TO_DATE('2025-01-03 13:20:13','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(27,'模型类型','model_type','0','admin',TO_DATE('2025-11-14 17:04:22','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(28,'模型输入类型','model_input_param_type','0','admin',TO_DATE('2025-11-17 04:24:11','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(29,'模型计算状态','calculation_status','0','小桐',TO_DATE('2025-12-31 15:24:22','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_DICT_TYPE"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark") VALUES(30,'请求方式','model_access_mode','0','小桐',TO_DATE('2026-01-20 15:35:11','YYYY-MM-DD HH24:MI:SS'),null,null,'模型API接口请求方式');

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_DICT_TYPE" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_JOB" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_JOB"("job_id","job_name","job_group","invoke_target","cron_expression","misfire_policy","concurrent","status","create_by","create_time","update_by","update_time","remark") VALUES(1,'系统默认（无参）','DEFAULT','qModelTask.qModelNoParams','0/10 * * * * ?','3','1','1','小桐',TO_DATE('2024-12-03 09:27:24','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2025-08-29 15:06:47','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_JOB"("job_id","job_name","job_group","invoke_target","cron_expression","misfire_policy","concurrent","status","create_by","create_time","update_by","update_time","remark") VALUES(2,'系统默认（有参）','DEFAULT','qModelTask.qModelParams(''qModel'')','0/15 * * * * ?','3','1','1','小桐',TO_DATE('2024-12-03 09:27:24','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_JOB"("job_id","job_name","job_group","invoke_target","cron_expression","misfire_policy","concurrent","status","create_by","create_time","update_by","update_time","remark") VALUES(3,'系统默认（多参）','DEFAULT','qModelTask.qModelMultipleParams(''qModel'', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','小桐',TO_DATE('2024-12-03 09:27:24','YYYY-MM-DD HH24:MI:SS'),null,null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_JOB" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_JOB_LOG" ON;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_JOB_LOG" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_LOGININFOR" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1283,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2025-12-30 17:48:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1284,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-30 18:09:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1285,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2025-12-30 18:12:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1286,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-30 18:12:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1287,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2025-12-30 18:17:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1288,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-30 18:17:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1289,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2025-12-30 18:17:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1290,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-30 18:17:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1291,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2025-12-30 18:18:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1292,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-30 18:26:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1293,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2025-12-30 18:33:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1294,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-30 18:33:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1295,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-31 09:03:53','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1296,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2025-12-31 09:43:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1297,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-31 09:48:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1298,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','登录成功',TO_DATE('2025-12-31 10:17:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1299,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','退出成功',TO_DATE('2025-12-31 10:20:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1300,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','1','验证码已失效',TO_DATE('2025-12-31 10:22:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1301,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','1','验证码错误',TO_DATE('2025-12-31 10:22:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1302,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','登录成功',TO_DATE('2025-12-31 10:22:52','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1303,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','登录成功',TO_DATE('2025-12-31 10:26:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1304,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','退出成功',TO_DATE('2025-12-31 10:37:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1305,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','登录成功',TO_DATE('2025-12-31 10:59:13','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1306,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-31 14:08:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1307,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-31 15:55:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1308,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','登录成功',TO_DATE('2025-12-31 15:55:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1309,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-31 16:07:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1310,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','退出成功',TO_DATE('2025-12-31 16:41:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1311,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','1','验证码已失效',TO_DATE('2025-12-31 16:48:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1312,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','登录成功',TO_DATE('2025-12-31 16:48:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1313,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2025-12-31 18:01:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1314,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','1','验证码已失效',TO_DATE('2025-12-31 18:22:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1315,'qModel','127.0.0.1','内网IP','Chrome 14','Mac OS X','0','登录成功',TO_DATE('2025-12-31 18:22:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1316,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-06 11:20:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1317,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-06 11:42:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1318,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误',TO_DATE('2026-01-06 11:55:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1319,'qModel','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功',TO_DATE('2026-01-06 11:56:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1320,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2026-01-06 14:58:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1321,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-06 14:58:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1322,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-06 15:11:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1323,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2026-01-06 16:20:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1324,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-06 16:23:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1325,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码已失效',TO_DATE('2026-01-06 16:47:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1326,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-06 16:47:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1327,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误',TO_DATE('2026-01-06 17:11:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1328,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误',TO_DATE('2026-01-06 17:11:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1329,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-06 17:12:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1330,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-06 17:16:01','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1331,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-07 08:50:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1332,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-07 13:28:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1333,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-07 14:07:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1334,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-07 15:26:53','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1335,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2026-01-07 17:19:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1336,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-07 17:19:20','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1337,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-08 09:03:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1338,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2026-01-08 09:50:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1339,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-08 09:50:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1340,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 09:08:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1341,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 09:21:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1342,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 10:58:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1343,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 13:53:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1344,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 16:05:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1345,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误',TO_DATE('2026-01-09 16:13:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1346,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 16:14:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1347,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 16:35:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1348,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 17:10:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1349,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-09 17:19:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1350,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 09:07:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1351,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 11:20:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1352,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2026-01-12 14:43:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1353,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 14:43:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1354,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 15:28:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1355,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2026-01-12 15:31:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1356,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 15:31:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1357,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 15:32:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1358,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 15:41:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1359,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 15:48:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1360,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 15:53:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1361,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 15:58:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1362,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 15:59:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1363,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 16:03:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1364,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 16:10:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1365,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 16:32:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1366,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 16:36:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1367,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2026-01-12 17:04:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1368,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-12 17:14:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1369,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 09:13:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1370,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 09:13:57','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1371,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 10:51:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1372,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 11:09:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1373,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2026-01-13 11:20:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1374,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 11:37:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1375,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 11:49:01','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1376,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 15:18:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1377,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 17:18:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1378,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-13 17:57:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1379,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 09:09:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1380,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 09:22:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1381,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 14:19:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1382,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 14:46:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1383,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 15:41:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1384,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2026-01-14 15:49:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1385,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 15:49:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1386,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码已失效',TO_DATE('2026-01-14 17:23:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1387,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 17:23:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1388,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2026-01-14 17:38:13','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1389,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2026-01-14 17:38:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1390,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 17:38:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1391,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-14 18:23:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1392,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-15 09:19:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1393,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-15 09:27:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1394,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-15 14:38:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1395,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-15 15:32:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1396,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-15 15:49:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1397,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-15 15:59:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1398,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2026-01-15 18:09:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1399,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-15 18:09:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1400,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-16 08:59:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1401,'qThing','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误',TO_DATE('2026-01-19 16:11:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1402,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码已失效',TO_DATE('2026-01-19 16:14:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1403,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-19 16:14:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1404,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 09:15:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1405,'swwater','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误',TO_DATE('2026-01-20 09:35:01','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1406,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2026-01-20 09:35:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1407,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误',TO_DATE('2026-01-20 09:35:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1408,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 09:35:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1409,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 10:32:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1410,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 11:08:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1411,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 11:20:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1412,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 11:26:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1413,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 11:49:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1414,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 11:53:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1415,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 11:56:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1416,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 13:58:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1417,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功',TO_DATE('2026-01-20 15:40:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1418,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-20 15:56:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1419,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 09:04:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1420,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码已失效',TO_DATE('2026-01-21 09:11:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1421,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 09:11:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1422,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 13:14:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1423,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 13:32:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1424,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 13:38:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1425,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 14:20:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1426,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 15:40:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1427,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 16:28:13','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1428,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 17:52:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1429,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-21 18:18:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1430,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-22 09:09:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "QMODEL_DEV"."SYSTEM_LOGININFOR"("info_id","user_name","ipaddr","login_location","browser","os","status","msg","login_time") VALUES(1431,'qModel','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功',TO_DATE('2026-01-22 09:28:49','YYYY-MM-DD HH24:MI:SS'));

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_LOGININFOR" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_MENU" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1,'系统管理',0,40,'system',null,null,1,0,null,'M','0','0',null,'system-m','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 10:03:45','YYYY-MM-DD HH24:MI:SS'),'系统管理目录');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2,'系统监控',0,70,'monitor',null,null,1,0,null,'M','0','0',null,'system-watch','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 10:04:15','YYYY-MM-DD HH24:MI:SS'),'系统监控目录');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(3,'系统工具',0,60,'tool',null,null,1,0,null,'M','0','0',null,'system-tool','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 10:04:03','YYYY-MM-DD HH24:MI:SS'),'系统工具目录');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(100,'用户管理',1,1,'user','system/system/user/index',null,1,0,null,'C','0','0','system:user:list','user','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-27 11:18:13','YYYY-MM-DD HH24:MI:SS'),'用户管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(101,'角色管理',1,2,'role','system/system/role/index',null,1,0,null,'C','0','0','system:role:list','peoples','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-27 11:18:36','YYYY-MM-DD HH24:MI:SS'),'角色管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(102,'菜单管理',1,3,'menu','system/system/menu/index',null,1,0,null,'C','0','0','system:menu:list','tree-table','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'菜单管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(103,'部门管理',1,4,'dept','system/system/dept/index',null,1,0,null,'C','0','0','system:dept:list','tree','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-27 11:18:49','YYYY-MM-DD HH24:MI:SS'),'部门管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(104,'岗位管理',1,5,'post','system/system/post/index',null,1,0,null,'C','0','0','system:post:list','post','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'岗位管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(105,'字典管理',1,6,'dict','system/system/dict/index',null,1,0,null,'C','0','0','system:dict:list','dict','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'字典管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(106,'参数设置',1,7,'config','system/system/config/index',null,1,0,null,'C','0','0','system:config:list','edit','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-27 11:18:57','YYYY-MM-DD HH24:MI:SS'),'参数设置菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(107,'通知公告',1,8,'notice','system/system/notice/index',null,1,0,null,'C','0','0','system:notice:list','message','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'通知公告菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(108,'日志管理',1,9,'log',null,null,1,0,null,'M','0','0',null,'log','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'日志管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(109,'在线用户',2,1,'online','system/monitor/online/index',null,1,0,null,'C','0','0','monitor:online:list','online','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'在线用户菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(110,'定时任务',2,2,'job','system/monitor/job/index',null,1,0,null,'C','0','0','monitor:job:list','job','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'定时任务菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(111,'数据监控',2,3,'druid','system/monitor/druid/index',null,1,0,null,'C','1','1','monitor:druid:list','druid','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-19 14:06:21','YYYY-MM-DD HH24:MI:SS'),'数据监控菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(112,'服务监控',2,4,'server','system/monitor/server/index',null,1,0,null,'C','0','0','monitor:server:list','server','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'服务监控菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(113,'缓存监控',2,5,'cache','system/monitor/cache/index',null,1,0,null,'C','0','0','monitor:cache:list','redis','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'缓存监控菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(114,'缓存列表',2,6,'cacheList','system/monitor/cache/list',null,1,0,null,'C','0','0','monitor:cache:list','redis-list','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'缓存列表菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(115,'表单构建',3,1,'build','system/tool/build/index',null,1,0,null,'C','1','1','tool:build:list','build','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-19 14:05:59','YYYY-MM-DD HH24:MI:SS'),'表单构建菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(116,'代码生成',3,2,'gen','system/tool/gen/index',null,1,0,null,'C','0','0','tool:gen:list','code','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'代码生成菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(117,'系统接口',3,3,'swagger','system/tool/swagger/index',null,1,0,null,'C','0','0','tool:swagger:list','swagger','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'系统接口菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(500,'操作日志',108,1,'operlog','system/monitor/operlog/index',null,1,0,null,'C','0','0','monitor:operlog:list','form','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'操作日志菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(501,'登录日志',108,2,'logininfor','system/monitor/logininfor/index',null,1,0,null,'C','0','0','monitor:logininfor:list','logininfor','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'登录日志菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1000,'用户查询',100,1,null,null,null,1,0,null,'F','0','0','system:user:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1001,'用户新增',100,2,null,null,null,1,0,null,'F','0','0','system:user:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1002,'用户修改',100,3,null,null,null,1,0,null,'F','0','0','system:user:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1003,'用户删除',100,4,null,null,null,1,0,null,'F','0','0','system:user:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1004,'用户导出',100,5,null,null,null,1,0,null,'F','0','0','system:user:export','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1005,'用户导入',100,6,null,null,null,1,0,null,'F','0','0','system:user:import','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1006,'重置密码',100,7,null,null,null,1,0,null,'F','0','0','system:user:resetPwd','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1007,'角色查询',101,1,null,null,null,1,0,null,'F','0','0','system:role:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1008,'角色新增',101,2,null,null,null,1,0,null,'F','0','0','system:role:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1009,'角色修改',101,3,null,null,null,1,0,null,'F','0','0','system:role:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1010,'角色删除',101,4,null,null,null,1,0,null,'F','0','0','system:role:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1011,'角色导出',101,5,null,null,null,1,0,null,'F','0','0','system:role:export','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1012,'菜单查询',102,1,null,null,null,1,0,null,'F','0','0','system:menu:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1013,'菜单新增',102,2,null,null,null,1,0,null,'F','0','0','system:menu:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1014,'菜单修改',102,3,null,null,null,1,0,null,'F','0','0','system:menu:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1015,'菜单删除',102,4,null,null,null,1,0,null,'F','0','0','system:menu:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1016,'部门查询',103,1,null,null,null,1,0,null,'F','0','0','system:dept:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1017,'部门新增',103,2,null,null,null,1,0,null,'F','0','0','system:dept:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1018,'部门修改',103,3,null,null,null,1,0,null,'F','0','0','system:dept:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1019,'部门删除',103,4,null,null,null,1,0,null,'F','0','0','system:dept:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1020,'岗位查询',104,1,null,null,null,1,0,null,'F','0','0','system:post:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1021,'岗位新增',104,2,null,null,null,1,0,null,'F','0','0','system:post:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1022,'岗位修改',104,3,null,null,null,1,0,null,'F','0','0','system:post:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1023,'岗位删除',104,4,null,null,null,1,0,null,'F','0','0','system:post:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1024,'岗位导出',104,5,null,null,null,1,0,null,'F','0','0','system:post:export','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1025,'字典查询',105,1,'#',null,null,1,0,null,'F','0','0','system:dict:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1026,'字典新增',105,2,'#',null,null,1,0,null,'F','0','0','system:dict:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1027,'字典修改',105,3,'#',null,null,1,0,null,'F','0','0','system:dict:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1028,'字典删除',105,4,'#',null,null,1,0,null,'F','0','0','system:dict:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1029,'字典导出',105,5,'#',null,null,1,0,null,'F','0','0','system:dict:export','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1030,'参数查询',106,1,'#',null,null,1,0,null,'F','0','0','system:config:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1031,'参数新增',106,2,'#',null,null,1,0,null,'F','0','0','system:config:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1032,'参数修改',106,3,'#',null,null,1,0,null,'F','0','0','system:config:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1033,'参数删除',106,4,'#',null,null,1,0,null,'F','0','0','system:config:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1034,'参数导出',106,5,'#',null,null,1,0,null,'F','0','0','system:config:export','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1035,'公告查询',107,1,'#',null,null,1,0,null,'F','0','0','system:notice:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1036,'公告新增',107,2,'#',null,null,1,0,null,'F','0','0','system:notice:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1037,'公告修改',107,3,'#',null,null,1,0,null,'F','0','0','system:notice:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1038,'公告删除',107,4,'#',null,null,1,0,null,'F','0','0','system:notice:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1039,'操作查询',500,1,'#',null,null,1,0,null,'F','0','0','monitor:operlog:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1040,'操作删除',500,2,'#',null,null,1,0,null,'F','0','0','monitor:operlog:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1041,'日志导出',500,3,'#',null,null,1,0,null,'F','0','0','monitor:operlog:export','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1042,'登录查询',501,1,'#',null,null,1,0,null,'F','0','0','monitor:logininfor:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1043,'登录删除',501,2,'#',null,null,1,0,null,'F','0','0','monitor:logininfor:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1044,'日志导出',501,3,'#',null,null,1,0,null,'F','0','0','monitor:logininfor:export','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1045,'账户解锁',501,4,'#',null,null,1,0,null,'F','0','0','monitor:logininfor:unlock','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1046,'在线查询',109,1,'#',null,null,1,0,null,'F','0','0','monitor:online:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1047,'批量强退',109,2,'#',null,null,1,0,null,'F','0','0','monitor:online:batchLogout','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1048,'单条强退',109,3,'#',null,null,1,0,null,'F','0','0','monitor:online:forceLogout','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1049,'任务查询',110,1,'#',null,null,1,0,null,'F','0','0','monitor:job:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1050,'任务新增',110,2,'#',null,null,1,0,null,'F','0','0','monitor:job:add','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1051,'任务修改',110,3,'#',null,null,1,0,null,'F','0','0','monitor:job:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1052,'任务删除',110,4,'#',null,null,1,0,null,'F','0','0','monitor:job:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1053,'状态修改',110,5,'#',null,null,1,0,null,'F','0','0','monitor:job:changeStatus','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1054,'任务导出',110,6,'#',null,null,1,0,null,'F','0','0','monitor:job:export','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1055,'生成查询',116,1,'#',null,null,1,0,null,'F','0','0','tool:gen:query','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1056,'生成修改',116,2,'#',null,null,1,0,null,'F','0','0','tool:gen:edit','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1057,'生成删除',116,3,'#',null,null,1,0,null,'F','0','0','tool:gen:remove','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1058,'导入代码',116,4,'#',null,null,1,0,null,'F','0','0','tool:gen:import','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1059,'预览代码',116,5,'#',null,null,1,0,null,'F','0','0','tool:gen:preview','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(1060,'生成代码',116,6,'#',null,null,1,0,null,'F','0','0','tool:gen:code','#','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2000,'流程管理',0,50,'flyflow',null,null,1,0,null,'M','1','1',null,'example_new_icon','admin',TO_DATE('2024-05-06 06:17:26','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-12 17:47:30','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2001,'流程组',2002,1,'group','flyflow/flow/group',null,1,1,null,'C','0','0','flyflow:flow:group','button','admin',TO_DATE('2024-05-06 08:28:25','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-05-06 12:03:39','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2002,'流程',2000,1,'flow',null,null,1,0,null,'M','0','0',null,'component','admin',TO_DATE('2024-05-06 08:29:31','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-05-06 11:59:48','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2003,'流程列表',2002,2,'list','flyflow/flow/list',null,1,1,null,'C','0','0','flyflow:flow:list','date_new_icon','admin',TO_DATE('2024-05-06 08:34:14','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-27 10:59:43','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2004,'创建流程',2002,1,'create','flyflow/flow/create',null,1,1,null,'C','1','0','flyflow:flow:create','component','admin',TO_DATE('2024-05-06 12:56:35','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2005,'任务管理',2000,3,'task',null,null,1,0,null,'M','0','0',null,'date','admin',TO_DATE('2024-05-06 13:29:59','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-27 11:19:29','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2006,'待办任务',2005,1,'todo','flyflow/task/pending',null,1,1,null,'C','0','0','flyflow:task:pending','date_new_icon','admin',TO_DATE('2024-05-06 13:30:36','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-27 10:57:08','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2007,'我的发起',2005,2,'started','flyflow/task/started',null,1,1,null,'C','0','0','flyflow:task:started','button','admin',TO_DATE('2024-05-06 13:32:07','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2008,'我的已办',2005,3,'completed','flyflow/task/completed',null,1,1,null,'C','0','0','flyflow:task:completed','download','admin',TO_DATE('2024-05-06 13:33:44','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2009,'抄送我的',2005,4,'cc','flyflow/task/cc',null,1,1,null,'C','0','0','flyflow:task:cc','example','admin',TO_DATE('2024-05-06 13:35:08','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-05-06 13:35:51','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2010,'数字证书',1,10,'ca',null,null,1,0,null,'M','1','1',null,'password','admin',null,'小桐',TO_DATE('2025-12-30 13:12:47','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2011,'证书管理',2010,1,'cert','system/ca/cert/index',null,1,0,null,'C','0','0','ca:cert:list','#','admin',TO_DATE('2024-08-18 01:49:14','YYYY-MM-DD HH24:MI:SS'),null,null,'证书管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2012,'证书管理查询',2010,1,'#',null,null,1,0,null,'F','0','0','ca:cert:query','#','admin',TO_DATE('2024-08-18 01:49:14','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2013,'证书管理新增',2010,2,'#',null,null,1,0,null,'F','0','0','ca:cert:add','#','admin',TO_DATE('2024-08-18 01:49:14','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2014,'证书管理修改',2010,3,'#',null,null,1,0,null,'F','0','0','ca:cert:edit','#','admin',TO_DATE('2024-08-18 01:49:15','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2015,'证书管理删除',2010,4,'#',null,null,1,0,null,'F','0','0','ca:cert:remove','#','admin',TO_DATE('2024-08-18 01:49:15','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2016,'证书管理导出',2010,5,'#',null,null,1,0,null,'F','0','0','ca:cert:export','#','admin',TO_DATE('2024-08-18 01:49:15','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2017,'主体管理',2010,0,'subject','system/ca/subject/index',null,1,0,null,'C','0','0','ca:subject:list','#','admin',TO_DATE('2024-08-18 01:49:32','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-08-18 01:49:49','YYYY-MM-DD HH24:MI:SS'),'主体管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2018,'主体管理查询',2017,1,'#',null,null,1,0,null,'F','0','0','ca:subject:query','#','admin',TO_DATE('2024-08-18 01:49:32','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2019,'主体管理新增',2017,2,'#',null,null,1,0,null,'F','0','0','ca:subject:add','#','admin',TO_DATE('2024-08-18 01:49:32','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2020,'主体管理修改',2017,3,'#',null,null,1,0,null,'F','0','0','ca:subject:edit','#','admin',TO_DATE('2024-08-18 01:49:32','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2021,'主体管理删除',2017,4,'#',null,null,1,0,null,'F','0','0','ca:subject:remove','#','admin',TO_DATE('2024-08-18 01:49:32','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2022,'主体管理导出',2017,5,'#',null,null,1,0,null,'F','0','0','ca:subject:export','#','admin',TO_DATE('2024-08-18 01:49:32','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2023,'实例演示',0,80,'example',null,null,1,0,null,'M','1','1',null,'code_new_iocn','admin',TO_DATE('2024-08-20 22:54:16','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-08 17:35:00','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2024,'websocket',2023,0,'websocket','example/websocket',null,1,0,null,'C','0','0',null,null,'admin',TO_DATE('2024-08-20 22:57:35','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-08-20 22:58:19','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2025,'支付演示',2023,1,'pay','example/pay',null,1,0,'pay','C','0','0',null,null,'admin',TO_DATE('2024-08-25 16:33:48','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2026,'应用管理',1,1,'client','system/auth/client/index',null,1,0,null,'C','1','1','auth:client:list','github','admin',TO_DATE('2024-08-31 14:33:05','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 15:38:56','YYYY-MM-DD HH24:MI:SS'),'应用管理菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2027,'应用管理查询',2026,1,'#',null,null,1,0,null,'F','0','0','auth:client:query','#','admin',TO_DATE('2024-08-31 14:33:05','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2028,'应用管理新增',2026,2,'#',null,null,1,0,null,'F','0','0','auth:client:add','#','admin',TO_DATE('2024-08-31 14:33:05','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2029,'应用管理修改',2026,3,'#',null,null,1,0,null,'F','0','0','auth:client:edit','#','admin',TO_DATE('2024-08-31 14:33:05','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2030,'应用管理删除',2026,4,'#',null,null,1,0,null,'F','0','0','auth:client:remove','#','admin',TO_DATE('2024-08-31 14:33:05','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2031,'应用管理导出',2026,5,'#',null,null,1,0,null,'F','0','0','auth:client:export','#','admin',TO_DATE('2024-08-31 14:33:05','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2062,'消息',1,1,'message','system/message/message/index',null,1,0,null,'C','0','1','system:message:message:list','#','admin',TO_DATE('2024-11-01 09:51:29','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-01 09:52:41','YYYY-MM-DD HH24:MI:SS'),'消息菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2063,'消息查询',2062,1,'#',null,null,1,0,null,'F','0','0','system:message:message:query','#','admin',TO_DATE('2024-11-01 09:51:29','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2064,'消息新增',2062,2,'#',null,null,1,0,null,'F','0','0','system:message:message:add','#','admin',TO_DATE('2024-11-01 09:51:29','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2065,'消息修改',2062,3,'#',null,null,1,0,null,'F','0','0','system:message:message:edit','#','admin',TO_DATE('2024-11-01 09:51:29','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2066,'消息删除',2062,4,'#',null,null,1,0,null,'F','0','0','system:message:message:remove','#','admin',TO_DATE('2024-11-01 09:51:29','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2067,'消息导出',2062,5,'#',null,null,1,0,null,'F','0','0','system:message:message:export','#','admin',TO_DATE('2024-11-01 09:51:29','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2068,'消息模板',1,0,'messageTemplate','system/system/messageTemplate/index',null,1,0,null,'C','1','1','system:message:messageTemplate:list','email','admin',TO_DATE('2024-11-01 09:52:03','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 15:38:50','YYYY-MM-DD HH24:MI:SS'),'消息模板菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2069,'消息模板查询',2068,1,'#',null,null,1,0,null,'F','0','0','system:message:messageTemplate:query','#','admin',TO_DATE('2024-11-01 09:52:03','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2070,'消息模板新增',2068,2,'#',null,null,1,0,null,'F','0','0','system:message:messageTemplate:add','#','admin',TO_DATE('2024-11-01 09:52:03','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2071,'消息模板修改',2068,3,'#',null,null,1,0,null,'F','0','0','system:message:messageTemplate:edit','#','admin',TO_DATE('2024-11-01 09:52:03','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2072,'消息模板删除',2068,4,'#',null,null,1,0,null,'F','0','0','system:message:messageTemplate:remove','#','admin',TO_DATE('2024-11-01 09:52:03','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2073,'消息模板导出',2068,5,'#',null,null,1,0,null,'F','0','0','system:message:messageTemplate:export','#','admin',TO_DATE('2024-11-01 09:52:03','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2075,'组件测试',2023,8,'comCeshi','example/coms',null,1,0,'comCeshi','C','0','0',null,'#','admin',TO_DATE('2024-11-07 11:34:00','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2076,'单选多选',2023,4,'choose','system/tool/choose/index',null,1,0,null,'C','0','0',null,'#','admin',TO_DATE('2024-11-26 10:11:59','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-26 11:50:33','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2084,'用户类型',2023,1,'userType','example/user/index',null,1,0,null,'C','0','0','example:user:list','#','admin',TO_DATE('2024-11-27 10:03:19','YYYY-MM-DD HH24:MI:SS'),null,null,'用户类型菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2085,'用户类型查询',2084,1,'#',null,null,1,0,null,'F','0','0','example:user:query','#','admin',TO_DATE('2024-11-27 10:03:19','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2086,'用户类型新增',2084,2,'#',null,null,1,0,null,'F','0','0','example:user:add','#','admin',TO_DATE('2024-11-27 10:03:19','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2087,'用户类型修改',2084,3,'#',null,null,1,0,null,'F','0','0','example:user:edit','#','admin',TO_DATE('2024-11-27 10:03:19','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2088,'用户类型删除',2084,4,'#',null,null,1,0,null,'F','0','0','example:user:remove','#','admin',TO_DATE('2024-11-27 10:03:19','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2089,'用户类型导出',2084,5,'#',null,null,1,0,null,'F','0','0','example:user:export','#','admin',TO_DATE('2024-11-27 10:03:19','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2092,'复杂详情',2023,10,'complexdetails','example/genStudent/detail/studentDetail',null,1,1,'complexdetails','C','1','0',null,'#','admin',TO_DATE('2024-12-03 10:03:56','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-09 12:51:36','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2123,'示例部门',2023,1,'dept2','example/gen/index',null,1,0,null,'C','0','0','example:gen:dept:list','#','admin',TO_DATE('2024-12-09 11:57:23','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-12-09 13:01:54','YYYY-MM-DD HH24:MI:SS'),'示例部门菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2124,'示例部门查询',2123,1,'#',null,null,1,0,null,'F','0','0','example:gen:dept:query','#','admin',TO_DATE('2024-12-09 11:57:23','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2125,'示例部门新增',2123,2,'#',null,null,1,0,null,'F','0','0','example:gen:dept:add','#','admin',TO_DATE('2024-12-09 11:57:24','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2126,'示例部门修改',2123,3,'#',null,null,1,0,null,'F','0','0','example:gen:dept:edit','#','admin',TO_DATE('2024-12-09 11:57:24','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2127,'示例部门删除',2123,4,'#',null,null,1,0,null,'F','0','0','example:gen:dept:remove','#','admin',TO_DATE('2024-12-09 11:57:24','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2128,'示例部门导出',2123,5,'#',null,null,1,0,null,'F','0','0','example:gen:dept:export','#','admin',TO_DATE('2024-12-09 11:57:24','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2135,'学生',2023,1,'student','example/genStudent/index',null,1,0,null,'C','0','0','example:genStudent:student:list','#','admin',TO_DATE('2024-12-09 12:40:17','YYYY-MM-DD HH24:MI:SS'),null,null,'学生菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2136,'学生查询',2135,1,'#',null,null,1,0,null,'F','0','0','example:genStudent:student:query','#','admin',TO_DATE('2024-12-09 12:40:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2137,'学生新增',2135,2,'#',null,null,1,0,null,'F','0','0','example:genStudent:student:add','#','admin',TO_DATE('2024-12-09 12:40:18','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2138,'学生修改',2135,3,'#',null,null,1,0,null,'F','0','0','example:genStudent:student:edit','#','admin',TO_DATE('2024-12-09 12:40:18','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2139,'学生删除',2135,4,'#',null,null,1,0,null,'F','0','0','example:genStudent:student:remove','#','admin',TO_DATE('2024-12-09 12:40:18','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2140,'学生导出',2135,5,'#',null,null,1,0,null,'F','0','0','example:genStudent:student:export','#','admin',TO_DATE('2024-12-09 12:40:18','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2141,'学生导入',2135,6,'#',null,null,1,0,null,'F','0','0','example:genStudent:student:import','#','admin',TO_DATE('2024-12-12 15:47:12','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2190,'系统配置',1,11,'sysContent','system/system/content/index',null,1,0,null,'C','1','1','system:system:content:query','build','admin',TO_DATE('2024-12-31 11:16:14','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 15:39:08','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2191,'灌溉',2023,5,'test','plant/index',null,1,0,null,'C','0','0',null,'#','admin',TO_DATE('2025-08-08 13:03:04','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2192,'组态管理生成',0,20,'graph',null,null,1,0,null,'M','1','1',null,'system_new_icon','admin',TO_DATE('2025-09-16 14:58:15','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-12-29 16:04:10','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2193,'图元管理',0,30,'element',null,null,1,0,null,'M','1','1',null,'system','admin',TO_DATE('2025-09-16 15:00:10','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-12-29 16:04:16','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2194,'topo_element',2193,1,'element','topo/element/index',null,1,0,null,'C','0','0','topo:element:element:list','#','admin',TO_DATE('2025-09-16 15:12:39','YYYY-MM-DD HH24:MI:SS'),null,null,'topo_element菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2195,'topo_element查询',2194,1,'#',null,null,1,0,null,'F','0','0','topo:element:element:query','#','admin',TO_DATE('2025-09-16 15:12:39','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2196,'topo_element新增',2194,2,'#',null,null,1,0,null,'F','0','0','topo:element:element:add','#','admin',TO_DATE('2025-09-16 15:12:39','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2197,'topo_element修改',2194,3,'#',null,null,1,0,null,'F','0','0','topo:element:element:edit','#','admin',TO_DATE('2025-09-16 15:12:39','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2198,'topo_element删除',2194,4,'#',null,null,1,0,null,'F','0','0','topo:element:element:remove','#','admin',TO_DATE('2025-09-16 15:12:39','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2199,'topo_element导出',2194,5,'#',null,null,1,0,null,'F','0','0','topo:element:element:export','#','admin',TO_DATE('2025-09-16 15:12:39','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2200,'topo_element导入',2194,6,'#',null,null,1,0,null,'F','0','0','topo:element:element:import','#','admin',TO_DATE('2025-09-16 15:12:39','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2208,'topo_graph',2192,1,'graph','topo/graph/index',null,1,0,null,'C','0','0','topo:graph:graph:list','#','admin',TO_DATE('2025-09-16 15:24:45','YYYY-MM-DD HH24:MI:SS'),null,null,'topo_graph菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2209,'topo_graph查询',2208,1,'#',null,null,1,0,null,'F','0','0','topo:graph:graph:query','#','admin',TO_DATE('2025-09-16 15:24:45','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2210,'topo_graph新增',2208,2,'#',null,null,1,0,null,'F','0','0','topo:graph:graph:add','#','admin',TO_DATE('2025-09-16 15:24:45','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2211,'topo_graph修改',2208,3,'#',null,null,1,0,null,'F','0','0','topo:graph:graph:edit','#','admin',TO_DATE('2025-09-16 15:24:45','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2212,'topo_graph删除',2208,4,'#',null,null,1,0,null,'F','0','0','topo:graph:graph:remove','#','admin',TO_DATE('2025-09-16 15:24:45','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2213,'topo_graph导出',2208,5,'#',null,null,1,0,null,'F','0','0','topo:graph:graph:export','#','admin',TO_DATE('2025-09-16 15:24:45','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2214,'topo_graph导入',2208,6,'#',null,null,1,0,null,'F','0','0','topo:graph:graph:import','#','admin',TO_DATE('2025-09-16 15:24:45','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2215,'topo_element_type',2193,1,'type','topo/elementType/index',null,1,0,null,'C','0','0','topo:elementType:type:list','#','admin',TO_DATE('2025-09-17 10:22:06','YYYY-MM-DD HH24:MI:SS'),null,null,'topo_element_type菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2216,'topo_element_type查询',2215,1,'#',null,null,1,0,null,'F','0','0','topo:elementType:type:query','#','admin',TO_DATE('2025-09-17 10:22:06','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2217,'topo_element_type新增',2215,2,'#',null,null,1,0,null,'F','0','0','topo:elementType:type:add','#','admin',TO_DATE('2025-09-17 10:22:06','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2218,'topo_element_type修改',2215,3,'#',null,null,1,0,null,'F','0','0','topo:elementType:type:edit','#','admin',TO_DATE('2025-09-17 10:22:06','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2219,'topo_element_type删除',2215,4,'#',null,null,1,0,null,'F','0','0','topo:elementType:type:remove','#','admin',TO_DATE('2025-09-17 10:22:06','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2220,'topo_element_type导出',2215,5,'#',null,null,1,0,null,'F','0','0','topo:elementType:type:export','#','admin',TO_DATE('2025-09-17 10:22:06','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2221,'topo_element_type导入',2215,6,'#',null,null,1,0,null,'F','0','0','topo:elementType:type:import','#','admin',TO_DATE('2025-09-17 10:22:06','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2236,'泵站信息',1,1,'pust','system/testPust/index',null,1,0,null,'C','1','1','system:testPust:pust:list','#','admin',TO_DATE('2025-11-11 14:43:41','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-30 13:12:30','YYYY-MM-DD HH24:MI:SS'),'泵站信息菜单');
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2237,'泵站信息查询',2236,1,'#',null,null,1,0,null,'F','0','0','system:testPust:pust:query','#','admin',TO_DATE('2025-11-11 14:43:42','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2238,'泵站信息新增',2236,2,'#',null,null,1,0,null,'F','0','0','system:testPust:pust:add','#','admin',TO_DATE('2025-11-11 14:43:42','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2239,'泵站信息修改',2236,3,'#',null,null,1,0,null,'F','0','0','system:testPust:pust:edit','#','admin',TO_DATE('2025-11-11 14:43:42','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2240,'泵站信息删除',2236,4,'#',null,null,1,0,null,'F','0','0','system:testPust:pust:remove','#','admin',TO_DATE('2025-11-11 14:43:42','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2241,'泵站信息导出',2236,5,'#',null,null,1,0,null,'F','0','0','system:testPust:pust:export','#','admin',TO_DATE('2025-11-11 14:43:42','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2242,'泵站信息导入',2236,6,'#',null,null,1,0,null,'F','0','0','system:testPust:pust:import','#','admin',TO_DATE('2025-11-11 14:43:42','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2243,'模型管理',0,11,'model',null,null,1,0,null,'M','0','0',null,'model-administration','admin',TO_DATE('2025-11-14 10:01:45','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 09:58:12','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2244,'模型分类',2250,0,'type','model/modelClassify/index',null,1,0,null,'C','0','0',null,'#','admin',TO_DATE('2025-11-14 10:06:39','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-15 18:06:27','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2245,'模型管理',2243,1,'version','model/modelManage/index',null,1,0,null,'C','0','0',null,'#','admin',TO_DATE('2025-11-14 15:32:43','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-15 10:11:47','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2246,'模型输入管理',2243,2,'input','model/inputList/index',null,1,0,null,'C','0','0',null,'#','admin',TO_DATE('2025-11-17 04:34:18','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-16 09:13:25','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2247,'模型输出管理',2243,3,'output','model/outputList/index',null,1,0,null,'C','0','0',null,'#','admin',TO_DATE('2025-11-17 04:34:46','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-16 09:14:28','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2248,'模拟计算',2252,4,'compute','model/computeList/index',null,1,0,null,'C','0','0',null,'#','admin',TO_DATE('2025-11-17 04:35:16','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-15 18:08:05','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2249,'历史记录',2251,5,'operate','model/operateList/index',null,1,0,null,'C','0','0',null,'#','admin',TO_DATE('2025-11-17 04:35:45','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-15 18:09:07','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2250,'类目管理',0,10,'model/modelClassify',null,null,1,0,null,'M','0','0',null,'category-management','admin',TO_DATE('2025-12-29 16:06:15','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 09:57:57','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2251,'计算历史',0,13,'model/operateList',null,null,1,0,null,'M','0','0',null,'calculate-history','admin',TO_DATE('2025-12-29 16:09:40','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-31 10:02:09','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_MENU"("menu_id","menu_name","parent_id","order_num","path","component","query","is_frame","is_cache","route_name","menu_type","visible","status","perms","icon","create_by","create_time","update_by","update_time","remark") VALUES(2252,'模型计算',0,12,'model/computeList',null,null,1,0,null,'M','0','0',null,'model-calculation','admin',TO_DATE('2025-12-29 16:18:52','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2026-01-06 12:01:25','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_MENU" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_NOTICE" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_NOTICE"("notice_id","notice_title","notice_type","notice_content","status","create_by","create_time","update_by","update_time","remark") VALUES(12,'qModel 模型服务平台正式上线！','2',0x3C703EE98EB4E6889CE6BB91E5AFB0E5A0A5E78FAEE98D8FE69D91E6B9B4E780B9EFBD85E7ABB7E9949BE5AEB74D6F64656C266E6273703BE5A6AFE280B3E780B7E98F88E5B685E5A79FE9AA9EE586B2E5BDB4E6B59CE5BA9DE7B296E98F83E383A6EE849CE5AFAEE5BF8EE7AC82E7BBBEE58CA1E7B492E6B5A3E6BB80E8B49FE98F82E9A281E7ABB4E6B5A0EFBD86E6ABA4E991B3E88AA5C481E98DA8E5ACACEE85B8E9909EE59795E7AC8CE98F88E5B685E5A79FE98D96E6A0A7E992A9E98D99E5B8AEE7B49D714D6F64656C266E6273703BE98F83E384A5E6B9AAE98EB5E692BBEFBFBDE6B0ABE7B2A0E5A6AFE280B3E780B7E5AFAEEFBFBDE98D99E68899EFBFBDE4BDBDEE8684E7BC81E586A6EFBFBDE4BE80E584B4E7BC83E68F92E59F8CE690B4E69782E695A4E990A8E58BABE58F8FE996BEE68D90E79FBEE5A8B4E4BDBAE296BCE9949BE5B1BDE5A7AAE98D94E6B69AEE9D96E990AEE69780E6BA80E98F8BE58BA9EFBFBDE4BDB9E69682E690B4E6BB88E584B4E99782E384A5E5BCB7E6B5BCE4BDB7E7AC9FE780B9E782B5E5B987E988A5E6BB84C481E98DA8E5ACAAE5B586E98F88E5B685E5A79FE988A5E6BF88E6AE91E6A582E6A8BBE699A5E98D97E5BF93E68293E98A86EFBFBD2F702667743B3C2F703E3C703E3C62723E3C2F703E3C703EE9AA9EE586B2E5BDB4E98F80EE889BE5AF94E6BEB6E6B0B3EE87A2E791B7EFBFBDE5A6AFE280B3E780B7E98EBAE383A5E58F86E9949BE59CA57974686F6E2F4A6176612F455845E9949BE5A488EFBFBDE4BDBDE59A9CE98D94E384A5E5AFB2E780B9E791B0E6AB92E98D96E6A0ADE584B4E7BC83E5B182EFBFBDE4B8845049266E6273703BE98F8DE59BA7E599AFE98D96E6A0A7E5BD82E794AFE586BFE7B49DE9AA9EE888B5E5BD81E6B89AE6B699C481E98DA8E5ACADE780BAE98D9AE5A09BEFBFBDE4BDBAE7B4AAE98EBAE68E8BEFBFBDE4BDBAE6B483E98EBAD185E79391E6A582E6A8BCE9AA87E991B3E89789E5A78FE98A86E5829CE6B4B0E98D93E5B685E587A1E98EB4E684ACE5A79BE99786E59798E59E9AE5A798E69D91E59F84E98A86E4BDB9E79AB5E7929EC2B0EFBFBDE4BDB7E6B0A6E996ABE6B0B1E79391E6BEB6E6B0ABE9879CE7909BE5B1BCE7AC9FE98DA6E78398E6AB99E5A6AFE280B3E780B7E9949BE5B1BDE58F8FE99788E388A1E695AEE98EB8E4BDB8E6B597E6B59CD183E5AFB2E9909CEE889AEE95A8E996AEE384A7E8AEB2E98A86EFBFBD2F702667743B3C2F703E3C703E3C62723E3C2F703E3C703EE98F88EE8185E6BDB5E9949BE5AEB74D6F64656C266E6273703BE7818FE59798E5AF94E7BC81EE85A1E587AFE6B5A0EFBD8FE7B49DE98EB5E692BBEFBFBDE78AB2E7B491E98F80E4BFB1EFBFBDE4BDB8E795A8E98D8FE384A3EFBFBDE4BE80E78FAEE98F81E5A0A2E6AE91E5A6AFE280B3E780B7E990A2E786B8EFBFBDE4BDB7E7B68BE7BBAFE6B187EFBFBDE5829BEE82BDE69DA9E5BAA1E7AE8DE6BEB6D183E7B491E98D99E688A3EFBFBDE591ADE68BB0E990A2E384A6E59F9BE5A889E384A5E594BDE6B5A3E8B7A8E695A4E9949BE5B1BDE58FA1E98D9AE5B1BEE5B8B0E7BBB1E388A1E6ABA4E991B3E88AA5C481E98DA8E5ACACE6AE91E98F83E78ABBE6AABAE98D99EE889DE58598E9949BEFBFBD2F702667743B3C2F703E,'0','小桐',TO_DATE('2025-12-30 11:32:59','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-30 14:01:41','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_NOTICE"("notice_id","notice_title","notice_type","notice_content","status","create_by","create_time","update_by","update_time","remark") VALUES(13,'qModel期待与您携手共建知识体系！','1',0x3C703EE98F88E786B7E7B79FE98EAEE384A7E6AE91E98D94E78AB2E58F863C2F703E,'0','小桐',TO_DATE('2025-12-30 14:01:26','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-12-30 14:01:37','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_NOTICE" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_OPER_LOG" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2586,'模型库的重构表',1,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.add()','POST',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":1,"classifyId":30,"createBy":"小桐","createTime":"2025-12-31 18:17:47","creatorId":1,"description":"水土保持模型","fileName":"jgst.chaoshen.20250113.zip","id":10,"interfaceorfileAddress":"http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231181715A001.zip","name":"水土保持模型","params":{},"runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","version":"1.0","versionId":10}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2025-12-31 18:17:47','YYYY-MM-DD HH24:MI:SS'),891);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2587,'模型库的重构表',3,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/modelReconstitution/model/9','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2025-12-31 18:18:08','YYYY-MM-DD HH24:MI:SS'),316);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2588,'模型输入管理 ',1,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.add()','POST',1,'qModel','研发部门','/modelReconstitution/input','127.0.0.1','内网IP','{"changeFlag":true,"createBy":"小桐","createTime":"2025-12-31 18:21:14","engName":"P","id":4,"modelId":10,"modelName":"水土保持模型","modelVersion":"1","multipleContent":"[]","name":"水位","params":{},"singleContent":"[]","type":1}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2025-12-31 18:21:14','YYYY-MM-DD HH24:MI:SS'),351);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2589,'模型计算管理 ',1,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelCaclReconstitutionController.add()','POST',1,'qModel','研发部门','/modelReconstitution/cacl','127.0.0.1','内网IP','{"addressType":0,"createBy":"小桐","createTime":"2025-12-31 18:22:00","creatorId":1,"id":5,"modelId":10,"modelName":"水土保持模型","modelVersion":"1","name":"水位计算","params":{},"status":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2025-12-31 18:22:00','YYYY-MM-DD HH24:MI:SS'),1112);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2590,'模型库的重构表',3,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/modelReconstitution/model/8','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2025-12-31 18:24:46','YYYY-MM-DD HH24:MI:SS'),534);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2591,'模型库的重构表',1,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.add()','POST',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":24,"createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"description":"AI水位预测","fileName":"jgst.chaoshen.20250113.zip","id":11,"interfaceorfileAddress":"http://localhost:8090/profile/upload/2025/12/31/jgst.chaoshen.20250113_20251231182507A002.zip","name":"AI水位预测","params":{},"runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","version":"1.2","versionId":11}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2025-12-31 18:25:19','YYYY-MM-DD HH24:MI:SS'),1034);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2592,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"AI水位预测","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测","params":{},"publishTime":"2025-12-31","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2025-12-31 18:25:35","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2025-12-31 18:25:35','YYYY-MM-DD HH24:MI:SS'),1184);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2593,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"跨流域调水仿真","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测1","params":{},"publishTime":"2026-01-06","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2026-01-06 11:20:42","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 11:20:45','YYYY-MM-DD HH24:MI:SS'),536);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2594,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"跨流域调水仿真","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测","params":{},"publishTime":"2026-01-06","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2026-01-06 11:20:59","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 11:21:02','YYYY-MM-DD HH24:MI:SS'),622);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2595,'模型输入管理 ',1,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.add()','POST',1,'qModel','研发部门','/modelReconstitution/input','127.0.0.1','内网IP','{"changeFlag":true,"createBy":"小桐","createTime":"2026-01-06 11:43:32","engName":"123","id":5,"modelId":11,"modelName":"AI水位预测","modelVersion":"1","multipleContent":"[]","name":"q","params":{},"singleContent":"[]"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 11:43:33','YYYY-MM-DD HH24:MI:SS'),345);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2596,'模型输入管理 ',1,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.add()','POST',1,'qModel','研发部门','/modelReconstitution/input','127.0.0.1','内网IP','{"changeFlag":true,"createBy":"小桐","createTime":"2026-01-06 11:44:06","engName":"123","id":6,"modelId":11,"modelName":"AI水位预测","modelVersion":"1","multipleContent":"[{\"name\":\"q\",\"value\":\"1\",\"order\":2,\"index\":1}]","name":"q","params":{},"singleContent":"[]","type":1}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 11:44:07','YYYY-MM-DD HH24:MI:SS'),675);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2597,'模型输入管理 ',3,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/modelReconstitution/input/5','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 11:44:24','YYYY-MM-DD HH24:MI:SS'),377);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2598,'模型输入管理 ',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/input','127.0.0.1','内网IP','{"changeFlag":true,"createBy":"小桐","createTime":"2026-01-06 11:44:06","delFlag":false,"engName":"123","id":6,"modelId":11,"modelName":"AI水位预测","modelVersion":"1","multipleContent":"[{\"name\":\"q\",\"value\":\"1\",\"order\":2,\"index\":1}]","name":"q","params":{},"singleContent":"[]","type":1,"updateTime":"2026-01-06 11:45:07","validFlag":true}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 11:45:08','YYYY-MM-DD HH24:MI:SS'),212);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2599,'模型输入管理 ',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/input','127.0.0.1','内网IP','{"changeFlag":true,"createBy":"小桐","createTime":"2026-01-06 11:44:06","delFlag":false,"engName":"123","id":6,"modelId":11,"modelName":"AI水位预测","modelVersion":"1","multipleContent":"[{\"name\":\"q\",\"value\":\"1\",\"order\":2,\"index\":1}]","name":"q","params":{},"singleContent":"[]","type":1,"updateTime":"2026-01-06 11:48:17","validFlag":true}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 11:48:18','YYYY-MM-DD HH24:MI:SS'),354);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2600,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"createTime":"2025-12-29 16:18:52","icon":"model-calculation","isCache":"0","isFrame":"1","menuId":2252,"menuName":"模型计算","menuType":"M","orderNum":12,"params":{},"parentId":0,"path":"model/modelCompute","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 11:59:23','YYYY-MM-DD HH24:MI:SS'),528);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2601,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"component":"model/modelCompute","createTime":"2025-11-17 04:35:16","icon":"#","isCache":"0","isFrame":"1","menuId":2248,"menuName":"模拟计算","menuType":"C","orderNum":4,"params":{},"parentId":2252,"path":"compute","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 12:00:19','YYYY-MM-DD HH24:MI:SS'),607);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2602,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"createTime":"2025-12-29 16:18:52","icon":"model-calculation","isCache":"0","isFrame":"1","menuId":2252,"menuName":"模型计算","menuType":"M","orderNum":12,"params":{},"parentId":0,"path":"model/computeList","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 12:01:25','YYYY-MM-DD HH24:MI:SS'),476);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2603,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"component":"model/computeList","createTime":"2025-11-17 04:35:16","icon":"#","isCache":"0","isFrame":"1","menuId":2248,"menuName":"模拟计算","menuType":"C","orderNum":4,"params":{},"parentId":2252,"path":"compute","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 12:01:37','YYYY-MM-DD HH24:MI:SS'),751);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2604,'模型计算管理 ',3,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelCaclReconstitutionController.calculate()','GET',1,'qModel','研发部门','/modelReconstitution/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"5"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 12:07:39','YYYY-MM-DD HH24:MI:SS'),586);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2605,'模型输入管理 ',1,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.add()','POST',1,'qModel','研发部门','/modelReconstitution/input','127.0.0.1','内网IP','{"changeFlag":false,"createBy":"小桐","createTime":"2026-01-06 13:58:57","delFlag":false,"engName":"name","id":7,"modelId":5,"modelName":"单机程序","modelVersion":"1","multipleContent":"[]","name":"测试","params":{},"singleContent":"[]","type":0,"updateTime":"2026-01-06 11:48:17","validFlag":true}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 13:59:00','YYYY-MM-DD HH24:MI:SS'),200);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2606,'模型输入管理 ',3,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelInputReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/modelReconstitution/input/7','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 13:59:32','YYYY-MM-DD HH24:MI:SS'),179);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2607,' 模型输出管理',1,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelOutputReconstitutionController.add()','POST',1,'qModel','研发部门','/modelReconstitution/output','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-06 14:47:18","creatorId":1,"engName":"weater","id":3,"modelId":5,"modelName":"单机程序","modelVersion":"1","multipleContent":"[]","name":"水利11","params":{},"singleContent":"[]","type":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 14:47:21','YYYY-MM-DD HH24:MI:SS'),269);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2608,' 模型输出管理',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelOutputReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/output','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-06 14:47:18","creatorId":1,"delFlag":false,"engName":"weater","id":3,"modelId":5,"modelName":"单机程序","modelVersion":"1","multipleContent":"[]","name":"水利1112","params":{},"singleContent":"[]","type":0,"updateTime":"2026-01-06 14:47:24","validFlag":true}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 14:47:27','YYYY-MM-DD HH24:MI:SS'),160);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2609,' 模型输出管理',3,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelOutputReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/modelReconstitution/output/3','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 14:47:33','YYYY-MM-DD HH24:MI:SS'),450);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2610,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/81','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 15:50:48','YYYY-MM-DD HH24:MI:SS'),1470);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2611,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/82','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 15:50:54','YYYY-MM-DD HH24:MI:SS'),771);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2612,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/89','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 15:50:58','YYYY-MM-DD HH24:MI:SS'),325);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2613,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 16:08:32','YYYY-MM-DD HH24:MI:SS'),4944);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2614,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 16:08:36','YYYY-MM-DD HH24:MI:SS'),5608);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2615,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/122','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 16:09:06','YYYY-MM-DD HH24:MI:SS'),659);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2616,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"model","className":"model","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":1884,"columnName":"ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-06 16:08:29","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":121,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":1885,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-06 16:08:29","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":121,"usableColumn":false},{"capJavaField":"ClassifyId","columnComment":"分类id","columnId":1886,"columnName":"CLASSIFY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-06 16:08:29","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"classifyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":121,"usableColumn":false},{"capJavaField":"ANCESTORS","columnComment":"父级和自己id","columnId":1887,"columnName":"ANCESTORS","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-06 16:08:29","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"ANCESTORS","javaType":"String","list":true,"params":{},"pk":false,"query":true,"qu','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 16:12:05','YYYY-MM-DD HH24:MI:SS'),4168);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2617,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"跨流域调水仿真","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测1","params":{},"publishTime":"2026-01-06","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2026-01-06 16:12:30","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 16:12:33','YYYY-MM-DD HH24:MI:SS'),430);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2618,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"跨流域调水仿真","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测","params":{},"publishTime":"2026-01-06","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2026-01-06 16:12:35","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 16:12:38','YYYY-MM-DD HH24:MI:SS'),217);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2619,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL"}',null,0,null,TO_DATE('2026-01-06 16:14:08','YYYY-MM-DD HH24:MI:SS'),888);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2620,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"跨流域调水仿真","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测1","params":{},"publishTime":"2026-01-06","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2026-01-06 16:48:04","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 16:48:07','YYYY-MM-DD HH24:MI:SS'),516);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2621,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"跨流域调水仿真","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测","params":{},"publishTime":"2026-01-06","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2026-01-06 16:48:19","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 16:48:22','YYYY-MM-DD HH24:MI:SS'),171);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2622,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"跨流域调水仿真","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测1","params":{},"publishTime":"2026-01-06","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2026-01-06 17:13:57","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 17:14:01','YYYY-MM-DD HH24:MI:SS'),1004);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2623,'模型库的重构表',2,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.edit()','PUT',1,'qModel','研发部门','/modelReconstitution/model','127.0.0.1','内网IP','{"accessMode":0,"builtin":0,"classifyId":29,"classifyName":"跨流域调水仿真","createBy":"小桐","createTime":"2025-12-31 18:25:19","creatorId":1,"delFlag":false,"description":"AI水位预测","id":11,"name":"AI水位预测","params":{},"publishTime":"2026-01-06","runnableFileAddress":"\\jgst.chaoshen.20250113\\chaoshen.20250113.py","updateTime":"2026-01-06 17:14:08","version":"1.2","versionId":11,"whetherPublish":0}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-06 17:14:12','YYYY-MM-DD HH24:MI:SS'),340);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2624,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"model","className":"Model","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":1884,"columnName":"ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-06 16:08:29","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":121,"updateTime":"2026-01-06 16:12:01","usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":1885,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-06 16:08:29","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":121,"updateTime":"2026-01-06 16:12:02","usableColumn":false},{"capJavaField":"ClassifyId","columnComment":"分类id","columnId":1886,"columnName":"CLASSIFY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-06 16:08:29","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"classifyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":121,"updateTime":"2026-01-06 16:12:02","usableColumn":false},{"capJavaField":"ANCESTORS","columnComment":"父级和自己id","columnId":1887,"columnName":"ANCESTORS","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-06 16:08:29","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequ','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-07 08:53:29','YYYY-MM-DD HH24:MI:SS'),3254);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2625,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL"}',null,0,null,TO_DATE('2026-01-07 08:54:16','YYYY-MM-DD HH24:MI:SS'),570);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2626,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_CLASSIFY"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-07 10:12:57','YYYY-MM-DD HH24:MI:SS'),2935);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2627,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"Classify","className":"ModelClassify","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":1940,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-07 10:12:55","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":123,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":1941,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-07 10:12:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":123,"usableColumn":false},{"capJavaField":"ParentId","columnComment":"父级id","columnId":1942,"columnName":"PARENT_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-07 10:12:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"parentId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":true,"tableId":123,"usableColumn":true},{"capJavaField":"ANCESTORS","columnComment":"祖籍列表","columnId":1943,"columnName":"ANCESTORS","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-07 10:12:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"ANCESTORS","javaType":"String","list":true,"params":{},"pk":false,"query":true,"q','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-07 10:14:47','YYYY-MM-DD HH24:MI:SS'),1435);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2628,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_CLASSIFY"}',null,0,null,TO_DATE('2026-01-07 10:17:34','YYYY-MM-DD HH24:MI:SS'),583);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2629,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"Classify","className":"ModelClassify","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":1940,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-07 10:12:55","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":123,"updateTime":"2026-01-07 10:14:46","usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":1941,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-07 10:12:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":123,"updateTime":"2026-01-07 10:14:46","usableColumn":false},{"capJavaField":"ParentId","columnComment":"父级id","columnId":1942,"columnName":"PARENT_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-07 10:12:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"parentId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":true,"tableId":123,"updateTime":"2026-01-07 10:14:46","usableColumn":true},{"capJavaField":"ANCESTORS","columnComment":"祖籍列表","columnId":1943,"columnName":"ANCESTORS","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-07 10:12:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isReq','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-07 10:25:24','YYYY-MM-DD HH24:MI:SS'),2181);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2630,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_CLASSIFY"}',null,0,null,TO_DATE('2026-01-07 10:25:26','YYYY-MM-DD HH24:MI:SS'),563);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2631,'模型分类',2,'tech.qiantong.qmodel.module.model.controller.admin.classify.ModelClassifyController.edit()','PUT',1,'qModel','研发部门','/model/classify','127.0.0.1','内网IP','{"ancestors":"0,1","createBy":"admin","createTime":"2025-11-14 18:32:20","creatorId":1,"description":"产汇流信息","id":2,"name":"产汇流","params":{},"parentId":1,"remark":"备注","updateTime":"2025-12-11 10:08:14"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-07 14:09:38','YYYY-MM-DD HH24:MI:SS'),1100);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2632,'模型库的重构表',3,'tech.qiantong.qmodel.server.controller.modelReconstitution.ModelReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/modelReconstitution/model/10','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-08 09:04:02','YYYY-MM-DD HH24:MI:SS'),368);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2633,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"createTime":"2024-08-20 22:54:16","icon":"code_new_iocn","isCache":"0","isFrame":"1","menuId":2023,"menuName":"实例演示","menuType":"M","orderNum":80,"params":{},"parentId":0,"path":"example","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-08 09:51:23','YYYY-MM-DD HH24:MI:SS'),592);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2634,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"createTime":"2024-08-20 22:54:16","icon":"code_new_iocn","isCache":"0","isFrame":"1","menuId":2023,"menuName":"实例演示","menuType":"M","orderNum":80,"params":{},"parentId":0,"path":"example","status":"1","updateBy":"小桐","visible":"1"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-08 17:35:00','YYYY-MM-DD HH24:MI:SS'),479);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2635,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_HISTORY"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:07:35','YYYY-MM-DD HH24:MI:SS'),3797);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2636,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_HISTORY"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:07:37','YYYY-MM-DD HH24:MI:SS'),4842);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2637,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_HISTORY"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:07:38','YYYY-MM-DD HH24:MI:SS'),4523);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2638,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/126','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:07:57','YYYY-MM-DD HH24:MI:SS'),707);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2639,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/125','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:08:00','YYYY-MM-DD HH24:MI:SS'),680);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2640,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"History","className":"ModelHistory","columns":[{"capJavaField":"ID","columnId":1955,"columnName":"ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 13:07:31","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":124,"usableColumn":false},{"capJavaField":"CompanyId","columnId":1956,"columnName":"COMPANY_ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 13:07:32","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":124,"usableColumn":false},{"capJavaField":"ModelId","columnId":1957,"columnName":"MODEL_ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 13:07:32","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"modelId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":124,"usableColumn":false},{"capJavaField":"ModelName","columnId":1958,"columnName":"MODEL_NAME","columnType":"VARCHAR","createBy":"qModel","createTime":"2026-01-09 13:07:32","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"modelName","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE","required":false,"sort":4,"superColumn":false,"tableId":124,"usableColumn":fals','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:09:07','YYYY-MM-DD HH24:MI:SS'),3196);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2641,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_HISTORY"}',null,0,null,TO_DATE('2026-01-09 13:09:17','YYYY-MM-DD HH24:MI:SS'),1384);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2642,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/124','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:22:14','YYYY-MM-DD HH24:MI:SS'),314);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2643,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_HISTORY"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:22:23','YYYY-MM-DD HH24:MI:SS'),4843);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2644,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_HISTORY"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:22:23','YYYY-MM-DD HH24:MI:SS'),3231);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2645,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/128','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:22:26','YYYY-MM-DD HH24:MI:SS'),505);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2646,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"Hhistory","className":"ModelHistory","columns":[{"capJavaField":"ID","columnComment":"主键id","columnId":2003,"columnName":"ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 13:22:20","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":127,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":2004,"columnName":"COMPANY_ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 13:22:20","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":127,"usableColumn":false},{"capJavaField":"ModelId","columnComment":"所属模型id","columnId":2005,"columnName":"MODEL_ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 13:22:20","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"modelId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":127,"usableColumn":false},{"capJavaField":"ModelName","columnComment":"所属模型名称","columnId":2008,"columnName":"MODEL_NAME","columnType":"VARCHAR","createBy":"qModel","createTime":"2026-01-09 13:22:21","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"modelName","javaType":"String","list":true,"params":{},"pk":false,"query":true,"','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:23:24','YYYY-MM-DD HH24:MI:SS'),2318);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2647,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_OUTPUT,MODEL_INPUT"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:54:07','YYYY-MM-DD HH24:MI:SS'),6547);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2648,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"Input","className":"ModelInput","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":2035,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 13:54:02","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":129,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业Id","columnId":2036,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 13:54:02","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":129,"usableColumn":false},{"capJavaField":"NAME","columnComment":"参数名称","columnId":2037,"columnName":"NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 13:54:02","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"NAME","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE","required":false,"sort":3,"superColumn":false,"tableId":129,"usableColumn":false},{"capJavaField":"EngName","columnComment":"英文名称","columnId":2038,"columnName":"ENG_NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 13:54:02","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"engName","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE",','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:56:33','YYYY-MM-DD HH24:MI:SS'),3504);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2649,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"Output","className":"ModelOutput","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":2058,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 13:54:05","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":130,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业Id","columnId":2059,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 13:54:05","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":130,"usableColumn":false},{"capJavaField":"NAME","columnComment":"参数名称","columnId":2060,"columnName":"NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 13:54:05","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"NAME","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE","required":false,"sort":3,"superColumn":false,"tableId":130,"usableColumn":false},{"capJavaField":"EngName","columnComment":"英文名称","columnId":2061,"columnName":"ENG_NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 13:54:05","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"engName","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:57:26','YYYY-MM-DD HH24:MI:SS'),2999);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2650,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_OUTPUT,MODEL_INPUT"}',null,0,null,TO_DATE('2026-01-09 13:57:37','YYYY-MM-DD HH24:MI:SS'),1394);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2651,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"Output","className":"ModelOutput","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":2058,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 13:54:05","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":130,"updateTime":"2026-01-09 13:57:24","usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业Id","columnId":2059,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 13:54:05","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":130,"updateTime":"2026-01-09 13:57:24","usableColumn":false},{"capJavaField":"NAME","columnComment":"参数名称","columnId":2060,"columnName":"NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 13:54:05","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"NAME","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE","required":false,"sort":3,"superColumn":false,"tableId":130,"updateTime":"2026-01-09 13:57:24","usableColumn":false},{"capJavaField":"EngName","columnComment":"英文名称","columnId":2061,"columnName":"ENG_NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 13:54:05","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","j','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 13:59:56','YYYY-MM-DD HH24:MI:SS'),2320);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2652,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_OUTPUT,MODEL_INPUT"}',null,0,null,TO_DATE('2026-01-09 14:00:03','YYYY-MM-DD HH24:MI:SS'),1414);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2653,'模型输出管理',1,'tech.qiantong.qmodel.module.model.controller.admin.output.ModelOutputController.add()','POST',1,'qModel','研发部门','/model/output','127.0.0.1','内网IP','{"description":"qqq","engName":"q","modelId":5,"modelName":"单机程序","modelVersion":"1","multipleContent":"[]","name":"测试新增","params":{},"singleContent":"\"0\"","type":0}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-09 16:26:54','YYYY-MM-DD HH24:MI:SS'),1229);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2654,'模型输入管理',1,'tech.qiantong.qmodel.module.model.controller.admin.input.ModelInputController.add()','POST',1,'qModel','研发部门','/model/input','127.0.0.1','内网IP','{"changeFlag":true,"description":"说明","engName":"level","modelId":5,"modelName":"单机程序","modelVersion":"1","multipleContent":"[]","name":"q","params":{},"singleContent":"[]","type":0}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-09 16:35:37','YYYY-MM-DD HH24:MI:SS'),729);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2655,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_OPERATE"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 16:43:48','YYYY-MM-DD HH24:MI:SS'),4450);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2656,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"Operate","className":"ModelOperate","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":2078,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 16:43:45","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":131,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":2079,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 16:43:45","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":131,"usableColumn":false},{"capJavaField":"ModuleName","columnComment":"操作模块","columnId":2080,"columnName":"MODULE_NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 16:43:45","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"moduleName","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE","required":false,"sort":3,"superColumn":false,"tableId":131,"usableColumn":false},{"capJavaField":"TYPE","columnComment":"操作类型","columnId":2081,"columnName":"TYPE","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 16:43:45","edit":true,"htmlType":"select","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"TYPE","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryTy','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 16:45:11','YYYY-MM-DD HH24:MI:SS'),4058);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2657,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_OPERATE"}',null,0,null,TO_DATE('2026-01-09 16:45:26','YYYY-MM-DD HH24:MI:SS'),1538);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2658,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_INTERFACE_ADDRESS"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 17:20:30','YYYY-MM-DD HH24:MI:SS'),5665);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2659,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_VERSION"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 17:20:58','YYYY-MM-DD HH24:MI:SS'),3038);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2660,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"address","className":"ModelInterfaceAddress","columns":[{"capJavaField":"ID","columnComment":"id","columnId":2098,"columnName":"ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 17:20:26","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":132,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":2099,"columnName":"COMPANY_ID","columnType":"NUMBER","createBy":"qModel","createTime":"2026-01-09 17:20:27","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":132,"usableColumn":false},{"capJavaField":"ModelId","columnComment":"模型id","columnId":2100,"columnName":"MODEL_ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 17:20:27","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"modelId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":132,"usableColumn":false},{"capJavaField":"InterfaceAddress","columnComment":"接口地址","columnId":2101,"columnName":"INTERFACE_ADDRESS","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 17:20:27","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"interfaceAddress","javaType":"String","list":true,"params":{},"','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 17:25:27','YYYY-MM-DD HH24:MI:SS'),4672);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2661,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"interfaceAddress","className":"ModelInterfaceAddress","columns":[{"capJavaField":"ID","columnComment":"id","columnId":2098,"columnName":"ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 17:20:26","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":132,"updateTime":"2026-01-09 17:25:22","usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":2099,"columnName":"COMPANY_ID","columnType":"NUMBER","createBy":"qModel","createTime":"2026-01-09 17:20:27","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":132,"updateTime":"2026-01-09 17:25:23","usableColumn":false},{"capJavaField":"ModelId","columnComment":"模型id","columnId":2100,"columnName":"MODEL_ID","columnType":"BIGINT","createBy":"qModel","createTime":"2026-01-09 17:20:27","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"modelId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":132,"updateTime":"2026-01-09 17:25:23","usableColumn":false},{"capJavaField":"InterfaceAddress","columnComment":"接口地址","columnId":2101,"columnName":"INTERFACE_ADDRESS","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 17:20:27","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isP','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 17:26:07','YYYY-MM-DD HH24:MI:SS'),4767);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2662,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"version","className":"ModelVersion","columns":[{"capJavaField":"ID","columnComment":"ID","columnId":2116,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 17:20:56","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":133,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":2117,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 17:20:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":133,"usableColumn":false},{"capJavaField":"ModelId","columnComment":"所属模型id","columnId":2118,"columnName":"MODEL_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-09 17:20:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"modelId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":133,"usableColumn":false},{"capJavaField":"ModelName","columnComment":"所属模型名称","columnId":2119,"columnName":"MODEL_NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-09 17:20:56","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"modelName","javaType":"String","list":true,"params":{},"pk":false,"query":true,','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-09 17:26:50','YYYY-MM-DD HH24:MI:SS'),4362);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2663,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_INTERFACE_ADDRESS,MODEL_VERSION"}',null,0,null,TO_DATE('2026-01-09 17:28:49','YYYY-MM-DD HH24:MI:SS'),2475);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2664,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_CACL_RECONSTITUTION,MODEL_RECONSTITUTION"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-12 11:59:22','YYYY-MM-DD HH24:MI:SS'),7971);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2665,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"cacl","className":"ModelCacl","columns":[{"capJavaField":"ID","columnId":2136,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-12 11:59:15","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":134,"usableColumn":false},{"capJavaField":"CompanyId","columnId":2137,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-12 11:59:15","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":134,"usableColumn":false},{"capJavaField":"CODE","columnId":2138,"columnName":"CODE","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-12 11:59:15","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"CODE","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":134,"usableColumn":false},{"capJavaField":"NAME","columnId":2139,"columnName":"NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-12 11:59:16","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"NAME","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE","required":false,"sort":4,"superColumn":false,"tableId":134,"usableColumn":false},{"capJavaField":"Model','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-12 12:02:19','YYYY-MM-DD HH24:MI:SS'),3892);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2666,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"modelReconstitution","className":"ModelReconstitution","columns":[{"capJavaField":"ID","columnComment":"id","columnId":2160,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-12 11:59:19","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":135,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":2161,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-12 11:59:19","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":135,"usableColumn":false},{"capJavaField":"NAME","columnComment":"模型名称","columnId":2162,"columnName":"NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-12 11:59:19","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"NAME","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE","required":false,"sort":3,"superColumn":false,"tableId":135,"usableColumn":false},{"capJavaField":"ClassifyId","columnComment":"模型分类","columnId":2163,"columnName":"CLASSIFY_ID","columnType":"NUMBER","createBy":"qModel","createTime":"2026-01-12 11:59:19","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"classifyId","javaType":"Long","list":true,"params":{},"pk":false,"que','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-12 12:04:36','YYYY-MM-DD HH24:MI:SS'),3152);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2667,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_CACL_RECONSTITUTION,MODEL_RECONSTITUTION"}',null,0,null,TO_DATE('2026-01-12 12:04:51','YYYY-MM-DD HH24:MI:SS'),1494);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2668,'代码生成',3,'tech.qiantong.qmodel.generator.controller.GenController.remove()','DELETE',1,'qModel','研发部门','/tool/gen/134','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-12 13:34:53','YYYY-MM-DD HH24:MI:SS'),660);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2669,'代码生成',6,'tech.qiantong.qmodel.generator.controller.GenController.importTableSave()','POST',1,'qModel','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{"tables":"MODEL_CACL_RECONSTITUTION"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-12 13:35:03','YYYY-MM-DD HH24:MI:SS'),4055);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2670,'代码生成',2,'tech.qiantong.qmodel.generator.controller.GenController.editSave()','PUT',1,'qModel','研发部门','/tool/gen','127.0.0.1','内网IP','{"businessName":"modelCacl","className":"ModelCacl","columns":[{"capJavaField":"ID","columnComment":"主键id","columnId":2182,"columnName":"ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-12 13:35:00","edit":false,"htmlType":"input","increment":false,"insert":true,"isIncrement":"0","isInsert":"1","isPk":"1","isRequired":"0","javaField":"ID","javaType":"Long","list":false,"params":{},"pk":true,"query":false,"queryType":"EQ","required":false,"sort":1,"superColumn":false,"tableId":136,"usableColumn":false},{"capJavaField":"CompanyId","columnComment":"企业id","columnId":2183,"columnName":"COMPANY_ID","columnType":"INTEGER","createBy":"qModel","createTime":"2026-01-12 13:35:00","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"companyId","javaType":"Long","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":2,"superColumn":false,"tableId":136,"usableColumn":false},{"capJavaField":"CODE","columnComment":"计算编码","columnId":2184,"columnName":"CODE","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-12 13:35:00","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"CODE","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"EQ","required":false,"sort":3,"superColumn":false,"tableId":136,"usableColumn":false},{"capJavaField":"NAME","columnComment":"计算名称","columnId":2185,"columnName":"NAME","columnType":"VARCHAR2","createBy":"qModel","createTime":"2026-01-12 13:35:00","edit":true,"htmlType":"input","increment":false,"insert":true,"isEdit":"1","isIncrement":"0","isInsert":"1","isList":"1","isPk":"0","isQuery":"1","isRequired":"0","javaField":"NAME","javaType":"String","list":true,"params":{},"pk":false,"query":true,"queryType":"LIKE","requir','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-12 13:38:52','YYYY-MM-DD HH24:MI:SS'),3179);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2671,'代码生成',8,'tech.qiantong.qmodel.generator.controller.GenController.batchGenCode()','GET',1,'qModel','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{"tables":"MODEL_CACL_RECONSTITUTION"}',null,0,null,TO_DATE('2026-01-12 13:39:11','YYYY-MM-DD HH24:MI:SS'),918);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2672,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"createTime":"2024-05-06 06:17:26","icon":"example_new_icon","isCache":"0","isFrame":"1","menuId":2000,"menuName":"流程管理","menuType":"M","orderNum":50,"params":{},"parentId":0,"path":"flyflow","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-12 17:46:04','YYYY-MM-DD HH24:MI:SS'),1047);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2673,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"createTime":"2024-05-06 06:17:26","icon":"example_new_icon","isCache":"0","isFrame":"1","menuId":2000,"menuName":"流程管理","menuType":"M","orderNum":50,"params":{},"parentId":0,"path":"flyflow","status":"1","updateBy":"小桐","visible":"1"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-12 17:47:30','YYYY-MM-DD HH24:MI:SS'),642);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2674,'模型输出管理',2,'tech.qiantong.qmodel.module.model.controller.admin.output.ModelOutputController.edit()','PUT',1,'qModel','研发部门','/model/output','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-09 16:26:54","creatorId":1,"description":"qqq","engName":"q","id":4,"modelId":5,"modelName":"单机程序","modelVersion":"1","multipleContent":"[]","name":"输出模型","params":{},"singleContent":"\"0\"","type":0,"updateBy":"小桐","updateTime":"2026-01-09 16:26:54","updatorId":1}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-13 14:52:55','YYYY-MM-DD HH24:MI:SS'),542);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2675,'接口地址',1,'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.add()','POST',1,'qModel','研发部门','/model/interfaceAddress','127.0.0.1','内网IP','{"interfaceAddress":"null:6379/123","modelId":7,"params":{},"remark":"测试","requestMethod":2,"versionId":7}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 14:20:24','YYYY-MM-DD HH24:MI:SS'),855);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2676,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"3"}',null,1,null,TO_DATE('2026-01-14 14:32:00','YYYY-MM-DD HH24:MI:SS'),683);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2677,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"4"}',null,1,null,TO_DATE('2026-01-14 14:32:04','YYYY-MM-DD HH24:MI:SS'),512);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2678,'接口地址',2,'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.edit()','PUT',1,'qModel','研发部门','/model/interfaceAddress','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-14 14:20:25","creatorId":1,"id":1,"interfaceAddress":"null:6379/null:6379/123","modelId":7,"params":{},"remark":"测试","requestMethod":1,"updateBy":"小桐","updateTime":"2026-01-14 14:20:25","updatorId":1,"versionId":7}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 14:46:11','YYYY-MM-DD HH24:MI:SS'),564);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2679,'接口地址',3,'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.remove()','DELETE',1,'qModel','研发部门','/model/interfaceAddress/1','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 14:46:18','YYYY-MM-DD HH24:MI:SS'),389);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2680,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"3"}',null,1,null,TO_DATE('2026-01-14 14:46:29','YYYY-MM-DD HH24:MI:SS'),500);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2681,'模型输入管理',3,'tech.qiantong.qmodel.module.model.controller.admin.input.ModelInputController.remove()','DELETE',1,'qModel','研发部门','/model/input/3','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 16:00:46','YYYY-MM-DD HH24:MI:SS'),267);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2682,'接口地址',2,'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.edit()','PUT',1,'qModel','研发部门','/model/interfaceAddress','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-14 15:27:03","creatorId":1,"id":2,"interfaceAddress":"null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml","modelId":7,"params":{},"remark":"测试新增","requestMethod":2,"updateBy":"小桐","updateTime":"2026-01-14 15:27:03","updatorId":1,"versionId":7}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 16:04:23','YYYY-MM-DD HH24:MI:SS'),454);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2683,'接口地址',2,'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.edit()','PUT',1,'qModel','研发部门','/model/interfaceAddress','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-14 15:27:03","creatorId":1,"id":2,"interfaceAddress":"null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml","modelId":7,"params":{},"remark":"测试新增","requestMethod":2,"updateBy":"小桐","updateTime":"2026-01-14 16:04:23","updatorId":1,"versionId":7}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 16:04:43','YYYY-MM-DD HH24:MI:SS'),335);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2684,'接口地址',2,'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.edit()','PUT',1,'qModel','研发部门','/model/interfaceAddress','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-14 15:27:03","creatorId":1,"id":2,"interfaceAddress":"null:6379/https://baidu.weather.com.cn/mweather15d/101180101.shtml","modelId":7,"params":{},"remark":"测试新增","requestMethod":2,"updateBy":"小桐","updateTime":"2026-01-14 16:04:43","updatorId":1,"versionId":7}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 16:04:56','YYYY-MM-DD HH24:MI:SS'),289);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2685,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"4"}',null,1,null,TO_DATE('2026-01-14 16:06:25','YYYY-MM-DD HH24:MI:SS'),991);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2686,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"3"}',null,1,null,TO_DATE('2026-01-14 16:06:31','YYYY-MM-DD HH24:MI:SS'),429);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2687,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"3"}',null,1,null,TO_DATE('2026-01-14 16:07:21','YYYY-MM-DD HH24:MI:SS'),22742);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2688,'模型库重构',1,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()','POST',1,'qModel','研发部门','/model/modelReconstitution','127.0.0.1','内网IP','{"accessMode":0,"builtin":1,"classifyId":9,"createBy":"小桐","creatorId":1,"description":"不能为空","interfaceorfileAddress":"http://localhost:8090/profile/upload/2026/01/14/jgst.chaoshen.20250113_20260114161110A002.zip","name":"流量是计算","params":{},"runnableFileAddress":"\\jgst.chaoshen.20250113\\data.json","version":"1"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 16:22:54','YYYY-MM-DD HH24:MI:SS'),1898);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2689,'版本管理',1,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()','POST',1,'qModel','研发部门','/model/version','127.0.0.1','内网IP','{"modelId":12,"modelName":"流量是计算","params":{},"status":0,"version":"2"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 16:51:34','YYYY-MM-DD HH24:MI:SS'),791);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2690,'模型输入管理',1,'tech.qiantong.qmodel.module.model.controller.admin.input.ModelInputController.add()','POST',1,'qModel','研发部门','/model/input','127.0.0.1','内网IP','{"changeFlag":true,"description":"参数说明","engName":"data_input.json","modelId":12,"modelName":"流量是计算","modelVersion":"2","multipleContent":"[{\"name\":\"q\",\"value\":\"0\",\"order\":213,\"index\":1}]","name":"q","params":{},"singleContent":"[]","type":1}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-14 16:59:35','YYYY-MM-DD HH24:MI:SS'),1034);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2691,'模型计算重构',1,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.add()','POST',1,'qModel','研发部门','/model/cacl','127.0.0.1','内网IP','{"addressType":0,"modelId":12,"modelName":"流量是计算","modelVersion":"2","name":"avq","params":{},"status":0}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-15 10:04:35','YYYY-MM-DD HH24:MI:SS'),695);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2692,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"6"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-15 10:04:40','YYYY-MM-DD HH24:MI:SS'),1006);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2693,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"component":"model/modelManage/index","createTime":"2025-11-14 15:32:43","icon":"#","isCache":"0","isFrame":"1","menuId":2245,"menuName":"模型管理","menuType":"C","orderNum":1,"params":{},"parentId":2243,"path":"version","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-15 10:11:48','YYYY-MM-DD HH24:MI:SS'),459);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2694,'模型计算重构',1,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.add()','POST',1,'qModel','研发部门','/model/cacl','127.0.0.1','内网IP','{"addressId":2,"addressType":1,"modelId":7,"modelName":"来水预测模型","modelVersion":"v1.0","name":"测试","params":{},"status":0}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-15 11:10:18','YYYY-MM-DD HH24:MI:SS'),493);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2695,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"7"}',null,1,'UnknownHostException: null',TO_DATE('2026-01-15 14:31:59','YYYY-MM-DD HH24:MI:SS'),4968);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2696,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"7"}',null,1,'UnknownHostException: null',TO_DATE('2026-01-15 14:31:59','YYYY-MM-DD HH24:MI:SS'),261);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2697,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"component":"model/modelClassify/index","createTime":"2025-11-14 10:06:39","icon":"#","isCache":"0","isFrame":"1","menuId":2244,"menuName":"模型分类","menuType":"C","orderNum":0,"params":{},"parentId":2250,"path":"type","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-15 18:06:27','YYYY-MM-DD HH24:MI:SS'),402);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2698,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"component":"model/computeList/index","createTime":"2025-11-17 04:35:16","icon":"#","isCache":"0","isFrame":"1","menuId":2248,"menuName":"模拟计算","menuType":"C","orderNum":4,"params":{},"parentId":2252,"path":"compute","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-15 18:08:05','YYYY-MM-DD HH24:MI:SS'),373);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2699,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"component":"model/operateList/index","createTime":"2025-11-17 04:35:45","icon":"#","isCache":"0","isFrame":"1","menuId":2249,"menuName":"历史记录","menuType":"C","orderNum":5,"params":{},"parentId":2251,"path":"operate","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-15 18:09:07','YYYY-MM-DD HH24:MI:SS'),323);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2700,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"component":"model/inputList/index","createTime":"2025-11-17 04:34:18","icon":"#","isCache":"0","isFrame":"1","menuId":2246,"menuName":"模型输入管理","menuType":"C","orderNum":2,"params":{},"parentId":2243,"path":"input","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-16 09:13:26','YYYY-MM-DD HH24:MI:SS'),371);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2701,'菜单管理',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysMenuController.edit()','PUT',1,'qModel','研发部门','/system/menu','127.0.0.1','内网IP','{"children":[],"component":"model/outputList/index","createTime":"2025-11-17 04:34:46","icon":"#","isCache":"0","isFrame":"1","menuId":2247,"menuName":"模型输出管理","menuType":"C","orderNum":3,"params":{},"parentId":2243,"path":"output","status":"0","updateBy":"小桐","visible":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-16 09:14:28','YYYY-MM-DD HH24:MI:SS'),248);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2702,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"6"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-19 17:34:03','YYYY-MM-DD HH24:MI:SS'),1522);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2703,'模型计算重构',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.edit()','PUT',1,'qModel','研发部门','/model/cacl','127.0.0.1','内网IP','{"id":6,"inputContent":"{\"success\":true,\"errorCode\":\"2000\",\"message\":\"操作成功\",\"data\":[{\"buildingId\":\"SGJZ00000849\",\"buildingName\":\"西泵站 5#机组\",\"buildingType\":\"100008\",\"buildingTypeName\":\"泵站\",\"useable\":true,\"realFlow\":3,\"pumpSate\":3,\"maxTheoryFlow\":8,\"minTheoryFlow\":3}]}","params":{}}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-19 17:45:19','YYYY-MM-DD HH24:MI:SS'),8838);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2704,'模型计算重构',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.edit()','PUT',1,'qModel','研发部门','/model/cacl','127.0.0.1','内网IP','{"id":6,"inputContent":"{\"success\":true,\"errorCode\":\"2000\",\"message\":\"操作成功\",\"data\":[{\"buildingId\":\"SGJZ00000849\",\"buildingName\":\"西泵站 5#机组\",\"buildingType\":\"100008\",\"buildingTypeName\":\"泵站\",\"useable\":true,\"realFlow\":3,\"pumpSate\":3,\"maxTheoryFlow\":8,\"minTheoryFlow\":3}]}","params":{}}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-19 17:45:29','YYYY-MM-DD HH24:MI:SS'),543);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2705,'模型计算重构',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.edit()','PUT',1,'qModel','研发部门','/model/cacl','127.0.0.1','内网IP','{"id":6,"inputContent":"{\"success\":true,\"errorCode\":\"2000\",\"message\":\"操作成功\",\"data\":[{\"buildingId\":\"SGJZ00000849\",\"buildingName\":\"西泵站 5#机组\",\"buildingType\":\"100008\",\"buildingTypeName\":\"泵站\",\"useable\":true,\"realFlow\":3,\"pumpSate\":3,\"maxTheoryFlow\":8,\"minTheoryFlow\":4}]}","params":{}}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-19 17:45:54','YYYY-MM-DD HH24:MI:SS'),744);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2706,'模型计算重构',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.edit()','PUT',1,'qModel','研发部门','/model/cacl','127.0.0.1','内网IP','{"id":6,"inputContent":"{\"success\":true,\"errorCode\":\"2000\",\"message\":\"操作成功\",\"data\":[{\"buildingId\":\"SGJZ00000849\",\"buildingName\":\"西泵站 5#机组\",\"buildingType\":\"100008\",\"buildingTypeName\":\"泵站\",\"useable\":true,\"realFlow\":3,\"pumpSate\":3,\"maxTheoryFlow\":8,\"minTheoryFlow\":4}]}","params":{}}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-19 17:46:34','YYYY-MM-DD HH24:MI:SS'),9178);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2707,'模型库重构',1,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()','POST',1,'qModel','研发部门','/model/modelReconstitution','127.0.0.1','内网IP','{"accessMode":1,"builtin":1,"classifyId":9,"description":"接口服务类","name":"接口服务类","params":{},"port":"80","version":"1","versionId":15}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-20 09:17:25','YYYY-MM-DD HH24:MI:SS'),1634);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2708,'版本管理',1,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()','POST',1,'qModel','研发部门','/model/version','127.0.0.1','内网IP','{"modelId":12,"modelName":"流量是计算","params":{},"status":0,"version":"3"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-20 09:22:58','YYYY-MM-DD HH24:MI:SS'),696);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2709,'版本管理',3,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.remove()','DELETE',1,'qModel','研发部门','/model/version/16','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-20 11:03:54','YYYY-MM-DD HH24:MI:SS'),1710);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2710,'版本管理',1,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()','POST',1,'qModel','研发部门','/model/version','127.0.0.1','内网IP','{"modelId":7,"modelName":"来水预测模型","params":{},"status":0,"version":"3"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-20 11:56:44','YYYY-MM-DD HH24:MI:SS'),851);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2711,'版本管理',3,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.remove()','DELETE',1,'qModel','研发部门','/model/version/7','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-20 11:57:09','YYYY-MM-DD HH24:MI:SS'),1298);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2712,'版本管理',1,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()','POST',1,'qModel','研发部门','/model/version','127.0.0.1','内网IP','{"modelId":13,"modelName":"接口服务类","params":{},"status":0,"version":"1"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-20 13:19:31','YYYY-MM-DD HH24:MI:SS'),1400);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2713,'接口地址',1,'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.add()','POST',1,'qModel','研发部门','/model/interfaceAddress','127.0.0.1','内网IP','{"interfaceAddress":"null:80/http://localhost/dev-api/captchaImage","modelId":13,"params":{},"remark":"q","requestMethod":1,"version":"1","versionId":18}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-20 13:20:18','YYYY-MM-DD HH24:MI:SS'),1370);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2714,'模型计算重构',1,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.add()','POST',1,'qModel','研发部门','/model/cacl','127.0.0.1','内网IP','{"addressId":3,"addressType":1,"modelId":13,"modelName":"接口服务类","modelVersion":"1","name":"接口计算","params":{},"status":0}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-20 13:20:55','YYYY-MM-DD HH24:MI:SS'),815);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2715,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'UnknownHostException: null',TO_DATE('2026-01-20 13:21:01','YYYY-MM-DD HH24:MI:SS'),3519);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2716,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'UnknownHostException: null',TO_DATE('2026-01-20 13:21:02','YYYY-MM-DD HH24:MI:SS'),781);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2717,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'UnknownHostException: null',TO_DATE('2026-01-20 13:21:04','YYYY-MM-DD HH24:MI:SS'),774);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2718,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'UnknownHostException: null',TO_DATE('2026-01-20 13:24:07','YYYY-MM-DD HH24:MI:SS'),20585);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2719,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'UnknownHostException: null',TO_DATE('2026-01-20 13:24:46','YYYY-MM-DD HH24:MI:SS'),21514);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2720,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()','DELETE',1,'qModel','研发部门','/system/dict/type/18','127.0.0.1','内网IP','{}',null,1,'故事状态已分配,不能删除',TO_DATE('2026-01-20 13:33:31','YYYY-MM-DD HH24:MI:SS'),399);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2721,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/53','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:33:40','YYYY-MM-DD HH24:MI:SS'),866);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2722,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/52','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:33:42','YYYY-MM-DD HH24:MI:SS'),608);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2723,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/51','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:33:47','YYYY-MM-DD HH24:MI:SS'),2475);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2724,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/50','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:33:51','YYYY-MM-DD HH24:MI:SS'),877);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2725,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()','DELETE',1,'qModel','研发部门','/system/dict/type/18','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:33:56','YYYY-MM-DD HH24:MI:SS'),654);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2726,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/49','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:34:02','YYYY-MM-DD HH24:MI:SS'),342);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2727,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/48','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:34:05','YYYY-MM-DD HH24:MI:SS'),509);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2728,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/47','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:34:07','YYYY-MM-DD HH24:MI:SS'),308);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2729,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()','DELETE',1,'qModel','研发部门','/system/dict/type/17','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 13:34:12','YYYY-MM-DD HH24:MI:SS'),775);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2730,'字典类型',1,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.add()','POST',1,'qModel','研发部门','/system/dict/type','127.0.0.1','内网IP','{"createBy":"小桐","dictName":"请求方式","dictType":"model_access_mode","params":{},"remark":"模型API接口请求方式","status":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 15:35:12','YYYY-MM-DD HH24:MI:SS'),1849);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2731,'字典数据',1,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.add()','POST',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","default":false,"dictLabel":"get","dictSort":0,"dictType":"model_access_mode","dictValue":"0","listClass":"default","params":{},"status":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 15:35:38','YYYY-MM-DD HH24:MI:SS'),733);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2732,'字典数据',1,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.add()','POST',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","cssClass":"","default":false,"dictLabel":"post","dictSort":1,"dictType":"model_access_mode","dictValue":"1","listClass":"default","params":{},"status":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 15:35:57','YYYY-MM-DD HH24:MI:SS'),783);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2733,'字典数据',1,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.add()','POST',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","default":false,"dictLabel":"put","dictSort":2,"dictType":"model_access_mode","dictValue":"2","listClass":"default","params":{},"status":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 15:36:08','YYYY-MM-DD HH24:MI:SS'),419);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2734,'字典数据',1,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.add()','POST',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","default":false,"dictLabel":"delete","dictSort":3,"dictType":"model_access_mode","dictValue":"3","listClass":"default","params":{},"status":"0"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-20 15:36:20','YYYY-MM-DD HH24:MI:SS'),277);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2735,'字典数据',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()','PUT',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-20 15:35:38","default":false,"dictCode":98,"dictLabel":"get","dictSort":0,"dictType":"model_access_mode","dictValue":"0","isDefault":"N","listClass":"primary","params":{},"status":"0","updateBy":"小桐"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-21 14:23:32','YYYY-MM-DD HH24:MI:SS'),288);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2736,'字典数据',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()','PUT',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-20 15:35:56","default":false,"dictCode":99,"dictLabel":"post","dictSort":1,"dictType":"model_access_mode","dictValue":"1","isDefault":"N","listClass":"info","params":{},"status":"0","updateBy":"小桐"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-21 14:23:38','YYYY-MM-DD HH24:MI:SS'),327);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2737,'字典数据',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()','PUT',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-20 15:35:56","default":false,"dictCode":99,"dictLabel":"post","dictSort":1,"dictType":"model_access_mode","dictValue":"1","isDefault":"N","listClass":"warning","params":{},"status":"0","updateBy":"小桐"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-21 14:23:43','YYYY-MM-DD HH24:MI:SS'),152);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2738,'字典数据',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()','PUT',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-20 15:36:20","default":false,"dictCode":101,"dictLabel":"delete","dictSort":3,"dictType":"model_access_mode","dictValue":"3","isDefault":"N","listClass":"danger","params":{},"status":"0","updateBy":"小桐"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-21 14:23:52','YYYY-MM-DD HH24:MI:SS'),112);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2739,'字典数据',2,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.edit()','PUT',1,'qModel','研发部门','/system/dict/data','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-20 15:36:08","default":false,"dictCode":100,"dictLabel":"put","dictSort":2,"dictType":"model_access_mode","dictValue":"2","isDefault":"N","listClass":"warning","params":{},"status":"0","updateBy":"小桐"}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-21 14:24:40','YYYY-MM-DD HH24:MI:SS'),137);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2740,'接口地址',1,'tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.ModelInterfaceAddressController.add()','POST',1,'qModel','研发部门','/model/interfaceAddress','127.0.0.1','内网IP','{"interfaceAddress":"null:80/http://localhost:8090/captchaImage","modelId":13,"params":{},"remark":"z","requestMethod":0,"version":"1","versionId":18}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 14:26:05','YYYY-MM-DD HH24:MI:SS'),774);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2741,'模型库重构',1,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()','POST',1,'qModel','研发部门','/model/modelReconstitution','127.0.0.1','内网IP','{"accessMode":1,"builtin":1,"classifyId":3,"description":"测试","name":"base64图片获取","params":{},"port":"80","version":"1","versionId":19}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 14:41:42','YYYY-MM-DD HH24:MI:SS'),1495);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2742,'模型库重构',1,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()','POST',1,'qModel','研发部门','/model/modelReconstitution','127.0.0.1','内网IP','{"accessMode":1,"builtin":1,"classifyId":3,"description":"测试","name":"测试","params":{},"port":"6379","version":"1","versionId":20}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 14:48:00','YYYY-MM-DD HH24:MI:SS'),584);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2743,'模型输出管理',2,'tech.qiantong.qmodel.module.model.controller.admin.output.ModelOutputController.edit()','PUT',1,'qModel','研发部门','/model/output','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-14 18:05:18","creatorId":1,"description":"测试","engName":"/data/jgst/jgst.chaoshen.20250113/data_output.json","id":5,"modelId":12,"modelName":"流量是计算","modelVersion":"2","multipleContent":"[]","name":"AVQ","params":{},"singleContent":"\"0\"","type":0,"updateBy":"小桐","updateTime":"2026-01-14 18:05:18","updatorId":1}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 15:16:51','YYYY-MM-DD HH24:MI:SS'),377);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2744,'模型输入管理',2,'tech.qiantong.qmodel.module.model.controller.admin.input.ModelInputController.edit()','PUT',1,'qModel','研发部门','/model/input','127.0.0.1','内网IP','{"changeFlag":true,"createBy":"小桐","createTime":"2026-01-14 16:59:34","creatorId":1,"description":"参数说明","engName":"/data/jgst/jgst.chaoshen.20250113/data_input.json","id":9,"modelId":12,"modelName":"流量是计算","modelVersion":"2","multipleContent":"[{\"name\":\"q\",\"value\":\"0\",\"order\":213,\"index\":1}]","name":"q","params":{},"singleContent":"[]","type":1,"updateBy":"小桐","updateTime":"2026-01-14 16:59:34","updatorId":1}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 15:17:32','YYYY-MM-DD HH24:MI:SS'),401);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2745,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"6"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 15:19:15','YYYY-MM-DD HH24:MI:SS'),659);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2746,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"6"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 15:20:08','YYYY-MM-DD HH24:MI:SS'),23552);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2747,'模型库重构',3,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/model/modelReconstitution/15','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 15:26:32','YYYY-MM-DD HH24:MI:SS'),186);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2748,'模型库重构',1,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.add()','POST',1,'qModel','研发部门','/model/modelReconstitution','127.0.0.1','内网IP','{"accessMode":1,"builtin":0,"classifyId":17,"description":"1","interfaceorfileAddress":"http:192.1623","name":"测试","params":{},"port":"8888","version":"1","versionId":21}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 15:27:05','YYYY-MM-DD HH24:MI:SS'),632);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2749,'模型库重构',3,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/model/modelReconstitution/16','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 15:27:39','YYYY-MM-DD HH24:MI:SS'),194);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2750,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'
### Error updating database.  Cause: dm.jdbc.driver.DMException: 记录超长
### The error may exist in tech/qiantong/qmodel/module/model/dal/mapper/cacl/ModelCaclMapper.java (best guess)
### The error may involve tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper.updateById-Inline
### The error occurred while setting parameters
### SQL: UPDATE MODEL_CACL_RECONSTITUTION  SET name=?, model_id=?, model_name=?, model_version=?, start_time=?, end_time=?, status=?, input_content=?, output_content=?,  address_id=?, address_type=?,  creator_id=?, create_by=?, create_time=?, updator_id=?, update_by=?, update_time=?  WHERE id=?  AND del_flag=0
### Cause: dm.jdbc.driver.DMException: 记录超长
; 记录超长; nested exception is dm.jdbc.driver.DMException: 记录超长',TO_DATE('2026-01-21 15:32:15','YYYY-MM-DD HH24:MI:SS'),808);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2751,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"6"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 15:41:14','YYYY-MM-DD HH24:MI:SS'),1254);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2752,'版本管理',1,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.add()','POST',1,'qModel','研发部门','/model/version','127.0.0.1','内网IP','{"modelId":13,"modelName":"接口服务类","params":{},"status":0,"version":"2"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 16:30:20','YYYY-MM-DD HH24:MI:SS'),1019);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2753,'版本管理',2,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.edit()','PUT',1,'qModel','研发部门','/model/version','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-21 16:30:20","creatorId":1,"description":"version2","id":22,"modelId":13,"modelName":"接口服务类","params":{},"status":0,"updateBy":"小桐","updateTime":"2026-01-21 16:30:20","updatorId":1,"version":"2"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 16:47:49','YYYY-MM-DD HH24:MI:SS'),705);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2754,'版本管理',2,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.edit()','PUT',1,'qModel','研发部门','/model/version','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-21 16:30:20","creatorId":1,"description":"version22","id":22,"modelId":13,"modelName":"接口服务类","params":{},"status":0,"updateBy":"小桐","updateTime":"2026-01-21 16:47:49","updatorId":1,"version":"2"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 16:50:10','YYYY-MM-DD HH24:MI:SS'),23093);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2755,'版本管理',2,'tech.qiantong.qmodel.module.model.controller.admin.version.ModelVersionController.edit()','PUT',1,'qModel','研发部门','/model/version','127.0.0.1','内网IP','{"createBy":"小桐","createTime":"2026-01-20 13:19:31","creatorId":1,"description":"version1","id":18,"modelId":13,"modelName":"接口服务类","params":{},"status":0,"updateBy":"小桐","updateTime":"2026-01-21 16:50:17","updatorId":1,"version":"1"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 16:50:34','YYYY-MM-DD HH24:MI:SS'),6072);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2756,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'
### Error updating database.  Cause: dm.jdbc.driver.DMException: 记录超长
### The error may exist in tech/qiantong/qmodel/module/model/dal/mapper/cacl/ModelCaclMapper.java (best guess)
### The error may involve tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper.updateById-Inline
### The error occurred while setting parameters
### SQL: UPDATE MODEL_CACL_RECONSTITUTION  SET name=?, model_id=?, model_name=?, model_version=?, start_time=?, end_time=?, status=?, input_content=?, output_content=?,  address_id=?, address_type=?,  creator_id=?, create_by=?, create_time=?, updator_id=?, update_by=?, update_time=?  WHERE id=?  AND del_flag=0
### Cause: dm.jdbc.driver.DMException: 记录超长
; 记录超长; nested exception is dm.jdbc.driver.DMException: 记录超长',TO_DATE('2026-01-21 17:02:33','YYYY-MM-DD HH24:MI:SS'),879);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2757,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'
### Error updating database.  Cause: dm.jdbc.driver.DMException: 记录超长
### The error may exist in tech/qiantong/qmodel/module/model/dal/mapper/cacl/ModelCaclMapper.java (best guess)
### The error may involve tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper.updateById-Inline
### The error occurred while setting parameters
### SQL: UPDATE MODEL_CACL_RECONSTITUTION  SET name=?, model_id=?, model_name=?, model_version=?, start_time=?, end_time=?, status=?, input_content=?, output_content=?,  address_id=?, address_type=?,  creator_id=?, create_by=?, create_time=?, updator_id=?, update_by=?, update_time=?  WHERE id=?  AND del_flag=0
### Cause: dm.jdbc.driver.DMException: 记录超长
; 记录超长; nested exception is dm.jdbc.driver.DMException: 记录超长',TO_DATE('2026-01-21 17:07:50','YYYY-MM-DD HH24:MI:SS'),1571);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2758,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}',null,1,'
### Error updating database.  Cause: dm.jdbc.driver.DMException: 记录超长
### The error may exist in tech/qiantong/qmodel/module/model/dal/mapper/cacl/ModelCaclMapper.java (best guess)
### The error may involve tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper.updateById-Inline
### The error occurred while setting parameters
### SQL: UPDATE MODEL_CACL_RECONSTITUTION  SET name=?, model_id=?, model_name=?, model_version=?, start_time=?, end_time=?, status=?, input_content=?, output_content=?,  address_id=?, address_type=?,  creator_id=?, create_by=?, create_time=?, updator_id=?, update_by=?, update_time=?  WHERE id=?  AND del_flag=0
### Cause: dm.jdbc.driver.DMException: 记录超长
; 记录超长; nested exception is dm.jdbc.driver.DMException: 记录超长',TO_DATE('2026-01-21 17:10:24','YYYY-MM-DD HH24:MI:SS'),18731);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2759,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-21 17:11:43','YYYY-MM-DD HH24:MI:SS'),3581);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2760,'模型计算管理',2,'tech.qiantong.qmodel.module.model.controller.admin.cacl.ModelCaclController.calculate()','GET',1,'qModel','研发部门','/model/cacl/calculate','127.0.0.1','内网IP','{"modelCaclId":"8"}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-22 09:12:28','YYYY-MM-DD HH24:MI:SS'),1280);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2761,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/89','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:30:36','YYYY-MM-DD HH24:MI:SS'),644);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2762,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/88','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:30:38','YYYY-MM-DD HH24:MI:SS'),654);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2763,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()','DELETE',1,'qModel','研发部门','/system/dict/type/26','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:30:41','YYYY-MM-DD HH24:MI:SS'),427);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2764,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/72','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:30:49','YYYY-MM-DD HH24:MI:SS'),232);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2765,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/71','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:30:50','YYYY-MM-DD HH24:MI:SS'),263);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2766,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/70','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:30:52','YYYY-MM-DD HH24:MI:SS'),232);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2767,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()','DELETE',1,'qModel','研发部门','/system/dict/type/22','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:30:55','YYYY-MM-DD HH24:MI:SS'),245);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2768,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/87','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:31:04','YYYY-MM-DD HH24:MI:SS'),255);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2769,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/86','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:31:06','YYYY-MM-DD HH24:MI:SS'),276);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2770,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/85','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:31:08','YYYY-MM-DD HH24:MI:SS'),283);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2771,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/84','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:31:09','YYYY-MM-DD HH24:MI:SS'),278);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2772,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/83','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:53:50','YYYY-MM-DD HH24:MI:SS'),415);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2773,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/64','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:53:52','YYYY-MM-DD HH24:MI:SS'),259);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2774,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/63','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:53:55','YYYY-MM-DD HH24:MI:SS'),886);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2775,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()','DELETE',1,'qModel','研发部门','/system/dict/type/21','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:53:59','YYYY-MM-DD HH24:MI:SS'),561);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2776,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/62','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:54:04','YYYY-MM-DD HH24:MI:SS'),326);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2777,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/61','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:54:06','YYYY-MM-DD HH24:MI:SS'),267);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2778,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/60','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:54:08','YYYY-MM-DD HH24:MI:SS'),315);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2779,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/59','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:54:10','YYYY-MM-DD HH24:MI:SS'),303);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2780,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictDataController.remove()','DELETE',1,'qModel','研发部门','/system/dict/data/58','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:54:12','YYYY-MM-DD HH24:MI:SS'),275);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2781,'字典类型',3,'tech.qiantong.qmodel.module.system.controller.admin.system.SysDictTypeController.remove()','DELETE',1,'qModel','研发部门','/system/dict/type/20','127.0.0.1','内网IP','{}','{"msg":"操作成功","code":200}',0,null,TO_DATE('2026-01-22 09:54:17','YYYY-MM-DD HH24:MI:SS'),283);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2782,'模型库重构',3,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/model/modelReconstitution/14','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-22 10:56:57','YYYY-MM-DD HH24:MI:SS'),302);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2783,'模型库重构',3,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/model/modelReconstitution/7','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-22 10:57:15','YYYY-MM-DD HH24:MI:SS'),233);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2784,'模型库重构',3,'tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.ModelReconstitutionController.remove()','DELETE',1,'qModel','研发部门','/model/modelReconstitution/5','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-22 10:57:18','YYYY-MM-DD HH24:MI:SS'),103);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2785,'模型分类',3,'tech.qiantong.qmodel.module.model.controller.admin.classify.ModelClassifyController.remove()','DELETE',1,'qModel','研发部门','/model/classify/1','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-22 10:57:48','YYYY-MM-DD HH24:MI:SS'),285);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2786,'模型分类',3,'tech.qiantong.qmodel.module.model.controller.admin.classify.ModelClassifyController.remove()','DELETE',1,'qModel','研发部门','/model/classify/2','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-22 10:57:52','YYYY-MM-DD HH24:MI:SS'),173);
INSERT INTO "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_id","title","business_type","method","request_method","operator_type","oper_name","dept_name","oper_url","oper_ip","oper_location","oper_param","json_result","status","error_msg","oper_time","cost_time") VALUES(2787,'模型分类',3,'tech.qiantong.qmodel.module.model.controller.admin.classify.ModelClassifyController.remove()','DELETE',1,'qModel','研发部门','/model/classify/3','127.0.0.1','内网IP','{}','{"code":200,"msg":"操作成功"}',0,null,TO_DATE('2026-01-22 10:57:55','YYYY-MM-DD HH24:MI:SS'),193);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_OPER_LOG" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_POST" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_POST"("post_id","post_code","post_name","post_sort","status","create_by","create_time","update_by","update_time","remark") VALUES(1,'ceo','董事长',1,'0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_POST"("post_id","post_code","post_name","post_sort","status","create_by","create_time","update_by","update_time","remark") VALUES(2,'se','项目经理',2,'0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_POST"("post_id","post_code","post_name","post_sort","status","create_by","create_time","update_by","update_time","remark") VALUES(3,'hr','人力资源',3,'0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2024-11-26 15:50:39','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_POST"("post_id","post_code","post_name","post_sort","status","create_by","create_time","update_by","update_time","remark") VALUES(4,'user','普通员工',4,'0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_POST" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_ROLE" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE"("role_id","role_name","role_key","role_sort","data_scope","menu_check_strictly","dept_check_strictly","status","del_flag","create_by","create_time","update_by","update_time","remark") VALUES(1,'超级管理员','admin',1,'1',1,1,'0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,null,'超级管理员');
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE"("role_id","role_name","role_key","role_sort","data_scope","menu_check_strictly","dept_check_strictly","status","del_flag","create_by","create_time","update_by","update_time","remark") VALUES(2,'普通角色','common',2,'1',1,1,'0','0','admin',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-11-11 14:45:59','YYYY-MM-DD HH24:MI:SS'),'普通角色');
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE"("role_id","role_name","role_key","role_sort","data_scope","menu_check_strictly","dept_check_strictly","status","del_flag","create_by","create_time","update_by","update_time","remark") VALUES(3,'默认角色','default',3,'1',1,1,'0','0','admin',TO_DATE('2024-12-20 14:54:59','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-14 15:31:42','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE"("role_id","role_name","role_key","role_sort","data_scope","menu_check_strictly","dept_check_strictly","status","del_flag","create_by","create_time","update_by","update_time","remark") VALUES(4,'组态图和图元管理测试','topo',0,'1',1,1,'0','0','admin',TO_DATE('2025-09-18 13:02:58','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-09-18 13:57:37','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_ROLE" OFF;
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,3);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,100);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,101);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,102);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,103);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,104);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,105);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,106);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,107);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,108);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,109);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,110);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,111);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,112);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,113);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,114);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,115);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,116);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,117);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,500);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,501);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1000);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1001);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1002);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1003);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1004);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1005);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1006);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1007);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1008);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1009);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1010);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1011);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1012);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1013);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1014);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1015);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1016);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1017);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1018);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1019);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1020);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1021);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1022);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1023);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1024);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1025);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1026);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1027);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1028);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1029);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1030);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1031);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1032);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1033);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1034);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1035);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1036);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1037);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1038);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1039);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1040);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1041);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1042);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1043);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1044);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1045);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1046);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1047);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1048);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1049);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1050);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1051);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1052);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1053);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1054);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1055);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1056);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1057);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1058);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1059);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,1060);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2000);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2001);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2002);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2003);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2004);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2005);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2006);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2007);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2008);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2009);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2010);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2011);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2012);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2013);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2014);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2015);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2016);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2017);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2018);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2019);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2020);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2021);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2022);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2023);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2024);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2025);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2026);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2027);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2028);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2029);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2030);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2031);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2062);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2063);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2064);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2065);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2066);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2067);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2068);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2069);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2070);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2071);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2072);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2073);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2075);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2076);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2084);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2085);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2086);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2087);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2088);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2089);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2092);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2123);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2124);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2125);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2126);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2127);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2128);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2135);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2136);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2137);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2138);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2139);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2140);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2141);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2190);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2236);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2237);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2238);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2239);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2240);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2241);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(2,2242);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,3);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,100);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,101);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,102);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,103);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,104);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,105);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,106);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,107);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,108);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,109);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,110);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,111);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,112);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,113);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,114);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,115);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,116);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,117);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,500);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,501);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1000);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1001);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1002);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1003);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1004);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1005);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1006);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1007);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1008);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1009);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1010);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1011);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1012);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1013);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1014);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1015);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1016);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1017);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1018);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1019);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1020);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1021);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1022);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1023);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1024);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1025);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1026);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1027);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1028);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1029);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1030);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1031);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1032);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1033);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1034);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1035);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1036);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1037);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1038);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1039);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1040);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1041);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1042);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1043);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1044);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1045);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1046);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1047);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1048);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1049);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1050);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1051);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1052);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1053);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1054);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1055);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1056);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1057);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1058);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1059);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,1060);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2000);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2001);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2002);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2003);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2004);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2005);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2006);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2007);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2008);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2009);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2010);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2011);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2012);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2013);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2014);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2015);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2016);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2017);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2018);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2019);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2020);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2021);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2022);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2023);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2024);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2025);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2026);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2027);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2028);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2029);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2030);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2031);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2062);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2063);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2064);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2065);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2066);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2067);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2068);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2069);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2070);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2071);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2072);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2073);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2075);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2076);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2084);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2085);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2086);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2087);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2088);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2089);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2092);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2123);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2124);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2125);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2126);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2127);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2128);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2135);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2136);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2137);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2138);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2139);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2140);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(3,2141);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2192);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2193);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2194);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2195);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2196);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2197);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2198);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2199);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2200);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2208);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2209);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2210);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2211);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2212);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2213);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2214);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2215);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2216);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2217);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2218);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2219);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2220);
INSERT INTO "QMODEL_DEV"."SYSTEM_ROLE_MENU"("role_id","menu_id") VALUES(4,2221);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_USER" ON;
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(1,103,'qModel','小桐','00','support@qiantong.tech','19951942682','1',null,'$2a$10$butlDwq0TSIeP/rT9PGx6u571M.2VE.VsTAPoSSMOyQ0jmTc9TEyy','0','0','127.0.0.1',TO_DATE('2026-01-22 09:28:48','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2026-01-22 09:28:48','YYYY-MM-DD HH24:MI:SS'),'管理员',null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(746,105,'bf2','冰凤2','00','bf1@qq.com','15666666666','0',null,'$2a$10$nK.l4FTmawh45nZnOmn4Le8lk9Otw/AbrDBfr31Qji1015a/bW72e','0','0','127.0.0.1',TO_DATE('2025-09-25 13:52:09','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2024-05-06 06:12:17','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-09-25 13:52:09','YYYY-MM-DD HH24:MI:SS'),'测试员',null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(749,104,'陈锦尧','17351555046','00',null,'17351555046','0',null,'$2a$10$dDcEvUlsZW16jXJa79dBuONL.YZloAAT607ZoyFyrBkd/hZJ.kfCy','0','0',null,null,'小桐',TO_DATE('2025-01-17 15:53:58','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-02-06 15:38:26','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(750,103,'jinpeng','金鹏','00',null,'15951995970','0',null,'$2a$10$Y2q8oI7LzS1ACaQG5KtUEuHZ0JFO71R.oE7mFO8hUyb/tAdkYScfa','0','0','127.0.0.1',TO_DATE('2025-04-28 17:40:33','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-02-04 16:56:39','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-04-28 17:40:34','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(751,103,'muyuanxiang','穆远祥','00',null,'18599297916','0',null,'$2a$10$Agn.bofA2qGoPNzYjJVne.KfYpIWDAzNH4Kf1GazgDzpD55mOAjX6','0','0',null,null,'小桐',TO_DATE('2025-02-10 13:58:41','YYYY-MM-DD HH24:MI:SS'),null,null,null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(752,852,'liuchanglei','刘长磊','00',null,'18240679712','0',null,'$2a$10$bcMDapX9AZlG5c5.zFUSyeYC2IBlziPwnbUVnzSHabF.PPGRpz0sO','0','0','127.0.0.1',TO_DATE('2025-02-13 10:19:52','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-02-11 13:38:43','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2025-02-13 10:19:51','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(755,852,'张冬冬','张冬冬','00',null,'13213118204','0',null,'$2a$10$fne9FkTU2AhLeNouSBxHBuF.zI4FkazYagSS.kRpH8NEaoEYoXaQ2','0','0','127.0.0.1',TO_DATE('2025-03-07 17:00:47','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-02-12 09:47:54','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-03-07 17:00:47','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(756,102,'zyg','张雨果','00',null,'17760752680','0',null,'$2a$10$yyS.DVfJ81ArgD3P5IRvcur3ui19nEns8z9/Me5mHzNEZa.O8d1Jy','0','0','127.0.0.1',TO_DATE('2025-09-18 13:56:24','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-09-18 13:02:01','YYYY-MM-DD HH24:MI:SS'),'admin',TO_DATE('2025-09-18 13:56:27','YYYY-MM-DD HH24:MI:SS'),'123',null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(757,100,'chuhongen','楚洪恩','00',null,'15539056859','0',null,'$2a$10$Rg2utB7rOyEY22vSIGosQ.0H25boy5IncmVm3Pcvq3VrSWTI1ywdG','0','0','127.0.0.1',TO_DATE('2025-10-29 10:47:39','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-09-23 14:19:21','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2025-10-29 10:47:37','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(758,100,'wangyu','王禹','00',null,'13951171340','0',null,'$2a$10$IFZCQy65rgVMMBqdpL7WYeGPzmavEX5Npygv359/pbCIgPSVoN6tS','0','0','127.0.0.1',TO_DATE('2025-09-28 09:32:32','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-09-23 14:20:13','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2025-09-28 09:32:31','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(760,100,'chengguishun','程桂顺','00',null,'18256679835','0',null,'$2a$10$GthBi0nmv8GGnxeyCI7yCe.D86JzuX/K2TfCJFpxPF6yZkBew9yUy','0','0','127.0.0.1',TO_DATE('2025-11-12 09:34:47','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-09-30 15:30:57','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2025-11-12 09:34:46','YYYY-MM-DD HH24:MI:SS'),null,null);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER"("user_id","dept_id","user_name","nick_name","user_type","email","phonenumber","sex","avatar","password","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark","auth_id") VALUES(762,100,'panlong','潘龙','00',null,'15026084418','0',null,'$2a$10$IQNgBO6dH06oeX0vy9BoQOMSXr/dB3PCTRMbN5lNdAHHlnwcfH.TG','0','0','127.0.0.1',TO_DATE('2025-11-10 14:28:17','YYYY-MM-DD HH24:MI:SS'),'小桐',TO_DATE('2025-10-29 10:55:04','YYYY-MM-DD HH24:MI:SS'),null,TO_DATE('2025-11-10 14:28:18','YYYY-MM-DD HH24:MI:SS'),null,null);

SET IDENTITY_INSERT "QMODEL_DEV"."SYSTEM_USER" OFF;
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_POST"("user_id","post_id") VALUES(1,1);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_POST"("user_id","post_id") VALUES(2,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_POST"("user_id","post_id") VALUES(730,1);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_POST"("user_id","post_id") VALUES(733,4);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_POST"("user_id","post_id") VALUES(738,4);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_POST"("user_id","post_id") VALUES(742,4);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_POST"("user_id","post_id") VALUES(744,4);

INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(1,1);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(2,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(729,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(730,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(731,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(733,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(734,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(737,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(738,4);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(739,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(739,4);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(740,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(740,4);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(742,2);
INSERT INTO "QMODEL_DEV"."SYSTEM_USER_ROLE"("user_id","role_id") VALUES(744,2);

SET IDENTITY_INSERT "QMODEL_DEV"."EXAMPLE_DEPT" ON;
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(1,0,'千桐科技','张三','xxxxxxxx','xxxxxxx',0,1,0,'admin',1,TO_DATE('2024-11-27 00:00:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2024-12-09 13:19:22','YYYY-MM-DD HH24:MI:SS'),'测试数据');
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(2,1,'郑州总部','李四',null,null,0,1,0,'admin',1,TO_DATE('2024-11-27 00:00:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2024-11-29 14:51:43','YYYY-MM-DD HH24:MI:SS'),'总部测试');
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(3,1,'老君山','君山',null,null,1,1,0,'admin',1,TO_DATE('2024-11-27 15:11:40','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-27 15:11:39','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(4,0,'千桐测试',null,null,null,0,1,1,'admin',1,TO_DATE('2024-11-28 09:52:38','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-28 09:52:42','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(5,1,'子部门1',null,null,null,1,1,1,'admin',1,TO_DATE('2024-11-28 00:00:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2024-11-28 16:40:44','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(6,4,'子部门2',null,null,null,1,1,1,'admin',1,TO_DATE('2024-11-28 09:53:00','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-28 09:53:03','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(7,6,'孙部门1',null,null,null,0,1,1,'admin',1,TO_DATE('2024-11-28 09:53:13','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-28 09:53:17','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(8,1,'孙部门1',null,null,null,0,1,1,'admin',1,TO_DATE('2024-11-28 00:00:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2024-11-28 16:42:03','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(9,9,'孙孙部门222',null,null,null,1,1,0,'admin',1,TO_DATE('2024-11-28 00:00:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2024-11-28 16:44:38','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(10,0,'测试1',null,null,null,0,1,1,'admin',1,TO_DATE('2024-11-28 16:49:08','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-28 16:49:12','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(11,1,'子测试1',null,null,null,0,1,1,'admin',1,TO_DATE('2024-11-28 00:00:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2024-11-28 16:50:21','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(12,11,'孙测试1',null,null,null,1,1,1,'admin',1,TO_DATE('2024-11-28 16:49:31','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-28 16:49:35','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(13,1,'测试部门123','23','1112223','44444',1,1,0,'admin',1,TO_DATE('2024-11-29 00:00:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2024-12-23 09:17:09','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(14,13,'测试子部门1',null,null,null,0,1,1,'admin',1,TO_DATE('2024-11-29 09:51:34','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-29 09:51:38','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(15,13,'测试子部门23',null,null,null,0,1,0,'admin',1,TO_DATE('2024-11-29 00:00:00','YYYY-MM-DD HH24:MI:SS'),'admin',1,TO_DATE('2024-12-09 12:03:17','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(16,15,'测试孙部门1',null,null,null,0,1,1,'admin',1,TO_DATE('2024-11-29 11:27:27','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-29 11:27:31','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(17,1,null,null,null,null,0,1,1,'admin',1,TO_DATE('2024-11-29 15:18:40','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-11-29 15:18:45','YYYY-MM-DD HH24:MI:SS'),null);
INSERT INTO "QMODEL_DEV"."EXAMPLE_DEPT"("id","parent_id","name","leader","phone","email","status","valid_flag","del_flag","create_by","creator_id","create_time","update_by","updator_id","update_time","remark") VALUES(18,0,'测试顶级部门2',null,null,null,0,1,0,'admin',1,TO_DATE('2024-12-06 15:52:50','YYYY-MM-DD HH24:MI:SS'),null,null,TO_DATE('2024-12-06 15:52:53','YYYY-MM-DD HH24:MI:SS'),null);

SET IDENTITY_INSERT "QMODEL_DEV"."EXAMPLE_DEPT" OFF;
SET IDENTITY_INSERT "QMODEL_DEV"."AUTH_CLIENT" ON;
SET IDENTITY_INSERT "QMODEL_DEV"."AUTH_CLIENT" OFF;
ALTER TABLE "QMODEL_DEV"."EXAMPLE_STUDENT" ADD CONSTRAINT "EXAMPLE_STUDENT_PRIMARY" PRIMARY KEY("id") ;

ALTER TABLE "QMODEL_DEV"."GEN_TABLE" ADD CONSTRAINT "GEN_TABLE_PRIMARY" PRIMARY KEY("table_id") ;

ALTER TABLE "QMODEL_DEV"."GEN_TABLE_COLUMN" ADD CONSTRAINT "GEN_TABLE_COLUMN_PRIMARY" PRIMARY KEY("column_id") ;

ALTER TABLE "QMODEL_DEV"."MESSAGE" ADD CONSTRAINT "MESSAGE_PRIMARY" PRIMARY KEY("id") ;

ALTER TABLE "QMODEL_DEV"."MESSAGE_TEMPLATE" ADD CONSTRAINT "MESSAGE_TEMPLATE_PRIMARY" PRIMARY KEY("id") ;

ALTER TABLE "QMODEL_DEV"."MODEL" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_CACL" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_CLASSIFY" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_COMPUTE" ADD CONSTRAINT "MODEL_COMPUTE" PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_HISTORY" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_INPUT" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_OPERATE" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_OUTPUT" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_RECONSTITUTION" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."MODEL_VERSION" ADD CONSTRAINT  PRIMARY KEY("ID") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "QRTZ_BLOB_TRIGGERS_PRIMARY" PRIMARY KEY("sched_name","trigger_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_CALENDARS" ADD CONSTRAINT "QRTZ_CALENDARS_PRIMARY" PRIMARY KEY("sched_name","calendar_name") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "QRTZ_CRON_TRIGGERS_PRIMARY" PRIMARY KEY("sched_name","trigger_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "QRTZ_FIRED_TRIGGERS_PRIMARY" PRIMARY KEY("sched_name","entry_id") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_JOB_DETAILS" ADD CONSTRAINT "QRTZ_JOB_DETAILS_PRIMARY" PRIMARY KEY("sched_name","job_name","job_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_LOCKS" ADD CONSTRAINT "QRTZ_LOCKS_PRIMARY" PRIMARY KEY("sched_name","lock_name") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_PAUSED_TRIGGER_GRPS" ADD CONSTRAINT "QRTZ_PAUSED_TRIGGER_GRPS_PRIMARY" PRIMARY KEY("sched_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "QRTZ_SCHEDULER_STATE_PRIMARY" PRIMARY KEY("sched_name","instance_name") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_PRIMARY" PRIMARY KEY("sched_name","trigger_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPROP_TRIGGERS_PRIMARY" PRIMARY KEY("sched_name","trigger_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_TRIGGERS" ADD CONSTRAINT "QRTZ_TRIGGERS_PRIMARY" PRIMARY KEY("sched_name","trigger_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."REL_USER_AUTH_PRODUCT" ADD CONSTRAINT "REL_USER_AUTH_PRODUCT_PRIMARY" PRIMARY KEY("user_id","auth_id","auth_product_type") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_CONFIG" ADD CONSTRAINT "SYSTEM_CONFIG_PRIMARY" PRIMARY KEY("config_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_CONTENT" ADD CONSTRAINT "SYSTEM_CONTENT_PRIMARY" PRIMARY KEY("id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_DEPT" ADD CONSTRAINT "SYSTEM_DEPT_PRIMARY" PRIMARY KEY("dept_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_DICT_DATA" ADD CONSTRAINT "SYSTEM_DICT_DATA_PRIMARY" PRIMARY KEY("dict_code") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_DICT_TYPE" ADD CONSTRAINT "SYSTEM_DICT_TYPE_PRIMARY" PRIMARY KEY("dict_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_JOB" ADD CONSTRAINT "SYSTEM_JOB_PRIMARY" PRIMARY KEY("job_id","job_name","job_group") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_JOB_LOG" ADD CONSTRAINT "SYSTEM_JOB_LOG_PRIMARY" PRIMARY KEY("job_log_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_LOGININFOR" ADD CONSTRAINT "SYSTEM_LOGININFOR_PRIMARY" PRIMARY KEY("info_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_MENU" ADD CONSTRAINT "SYSTEM_MENU_PRIMARY" PRIMARY KEY("menu_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_NOTICE" ADD CONSTRAINT "SYSTEM_NOTICE_PRIMARY" PRIMARY KEY("notice_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_OPER_LOG" ADD CONSTRAINT "SYSTEM_OPER_LOG_PRIMARY" PRIMARY KEY("oper_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_POST" ADD CONSTRAINT "SYSTEM_POST_PRIMARY" PRIMARY KEY("post_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_ROLE" ADD CONSTRAINT "SYSTEM_ROLE_PRIMARY" PRIMARY KEY("role_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_ROLE_DEPT" ADD CONSTRAINT "SYSTEM_ROLE_DEPT_PRIMARY" PRIMARY KEY("role_id","dept_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_ROLE_MENU" ADD CONSTRAINT "SYSTEM_ROLE_MENU_PRIMARY" PRIMARY KEY("role_id","menu_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_USER" ADD CONSTRAINT "SYSTEM_USER_PRIMARY" PRIMARY KEY("user_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_USER_POST" ADD CONSTRAINT "SYSTEM_USER_POST_PRIMARY" PRIMARY KEY("user_id","post_id") ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_USER_ROLE" ADD CONSTRAINT "SYSTEM_USER_ROLE_PRIMARY" PRIMARY KEY("user_id","role_id") ;

ALTER TABLE "QMODEL_DEV"."EXAMPLE_DEPT" ADD CONSTRAINT "EXAMPLE_DEPT_PRIMARY" PRIMARY KEY("id") ;

ALTER TABLE "QMODEL_DEV"."AUTH_CLIENT" ADD CONSTRAINT "AUTH_CLIENT_PRIMARY" PRIMARY KEY("id") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "QRTZ_CRON_TRIGGERS_QRTZ_CRON_TRIGGERS_IBFK_1" FOREIGN KEY("sched_name","trigger_name","trigger_group") REFERENCES "QMODEL_DEV"."QRTZ_TRIGGERS"("sched_name","trigger_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_QRTZ_SIMPLE_TRIGGERS_IBFK_1" FOREIGN KEY("sched_name","trigger_name","trigger_group") REFERENCES "QMODEL_DEV"."QRTZ_TRIGGERS"("sched_name","trigger_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPROP_TRIGGERS_QRTZ_SIMPROP_TRIGGERS_IBFK_1" FOREIGN KEY("sched_name","trigger_name","trigger_group") REFERENCES "QMODEL_DEV"."QRTZ_TRIGGERS"("sched_name","trigger_name","trigger_group") ;

ALTER TABLE "QMODEL_DEV"."QRTZ_TRIGGERS" ADD CONSTRAINT "QRTZ_TRIGGERS_QRTZ_TRIGGERS_IBFK_1" FOREIGN KEY("sched_name","job_name","job_group") REFERENCES "QMODEL_DEV"."QRTZ_JOB_DETAILS"("sched_name","job_name","job_group") ;

CREATE INDEX "SCHED_NAME"
    ON "QMODEL_DEV"."QRTZ_TRIGGERS"("sched_name","job_name","job_group");

CREATE INDEX "IDX_SYS_LOGININFOR_LT"
    ON "QMODEL_DEV"."SYSTEM_LOGININFOR"("login_time");

CREATE INDEX "IDX_SYS_LOGININFOR_S"
    ON "QMODEL_DEV"."SYSTEM_LOGININFOR"("status");

CREATE INDEX "IDX_SYS_OPER_LOG_BT"
    ON "QMODEL_DEV"."SYSTEM_OPER_LOG"("business_type");

CREATE INDEX "IDX_SYS_OPER_LOG_OT"
    ON "QMODEL_DEV"."SYSTEM_OPER_LOG"("oper_time");

CREATE INDEX "IDX_SYS_OPER_LOG_S"
    ON "QMODEL_DEV"."SYSTEM_OPER_LOG"("status");

ALTER TABLE "QMODEL_DEV"."EXAMPLE_STUDENT" ADD CHECK("grade" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."EXAMPLE_STUDENT" ADD CHECK("sex" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."MESSAGE" ADD CHECK("entity_type" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."MESSAGE" ADD CHECK("module" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."MESSAGE" ADD CHECK("msg_level" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."MESSAGE" ADD CHECK("category" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."MESSAGE_TEMPLATE" ADD CHECK("msg_level" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."MESSAGE_TEMPLATE" ADD CHECK("category" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."REL_USER_AUTH_PRODUCT" ADD CHECK("auth_product_type" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."EXAMPLE_DEPT" ADD CHECK("status" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."AUTH_CLIENT" ADD CHECK("type" >= 0) ENABLE ;

ALTER TABLE "QMODEL_DEV"."SYSTEM_DICT_TYPE" ADD CONSTRAINT "SYSTEM_DICT_TYPE_DICT_TYPE" UNIQUE("dict_type") ;

COMMENT ON TABLE "QMODEL_DEV"."EXAMPLE_STUDENT" IS '学生表';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."id" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."name" IS '姓名';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."picture_url" IS '学生照';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."experience" IS '教育经历';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."sex" IS '性别';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."birthday" IS '生日';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."age" IS '年龄';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."student_number" IS '学号';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."grade" IS '班级';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."hobby" IS '爱好';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."valid_flag" IS '是否有效;0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."del_flag" IS '删除标志;1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."create_by" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."creator_id" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."update_by" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."updator_id" IS '更新人id';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_STUDENT"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."GEN_TABLE" IS '代码生成业务表';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."table_id" IS '编号';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."table_name" IS '表名称';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."table_comment" IS '表描述';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."sub_table_name" IS '关联子表的表名';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."sub_table_fk_name" IS '子表关联的外键名';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."class_name" IS '实体类名称';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."tpl_category" IS '使用的模板（crud单表操作 tree树表操作）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."tpl_web_type" IS '前端模板类型（element-ui模版 element-plus模版）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."package_name" IS '生成包路径';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."module_name" IS '生成模块名';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."business_name" IS '生成业务名';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."function_name" IS '生成功能名';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."function_author" IS '生成功能作者';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."gen_type" IS '生成代码方式（0zip压缩包 1自定义路径）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."gen_path" IS '生成路径（不填默认项目路径）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."options" IS '其它生成选项';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."GEN_TABLE_COLUMN" IS '代码生成业务表字段';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."column_id" IS '编号';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."table_id" IS '归属表编号';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."column_name" IS '列名称';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."column_comment" IS '列描述';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."column_type" IS '列类型';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."java_type" IS 'JAVA类型';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."java_field" IS 'JAVA字段名';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."is_pk" IS '是否主键（1是）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."is_increment" IS '是否自增（1是）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."is_required" IS '是否必填（1是）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."is_insert" IS '是否为插入字段（1是）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."is_edit" IS '是否编辑字段（1是）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."is_list" IS '是否列表字段（1是）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."is_query" IS '是否查询字段（1是）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."query_type" IS '查询方式（等于、不等于、大于、小于、范围）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."html_type" IS '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."dict_type" IS '字典类型';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."sort" IS '排序';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."GEN_TABLE_COLUMN"."update_time" IS '更新时间';

COMMENT ON TABLE "QMODEL_DEV"."MESSAGE" IS '消息';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."id" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."sender_id" IS '发送人';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."receiver_id" IS '接收人';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."title" IS '消息标题';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."content" IS '消息模板内容';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."category" IS '消息类别';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."msg_level" IS '消息等级';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."module" IS '消息模块';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."entity_type" IS '实体类型';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."entity_id" IS '实体id';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."entity_url" IS '消息链接';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."has_read" IS '是否已读';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."has_retraction" IS '是否撤回';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."valid_flag" IS '是否有效;0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."del_flag" IS '删除标志;1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."create_by" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."creator_id" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."update_by" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."updator_id" IS '更新人id';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."MESSAGE_TEMPLATE" IS '消息模板';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."id" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."title" IS '消息标题';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."content" IS '消息模板内容';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."category" IS '消息类别';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."msg_level" IS '消息等级';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."valid_flag" IS '是否有效;0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."del_flag" IS '删除标志;1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."create_by" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."creator_id" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."update_by" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."updator_id" IS '更新人id';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MESSAGE_TEMPLATE"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."MODEL" IS '模型管理';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."ID" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."CLASSIFY_ID" IS '分类id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."ANCESTORS" IS '父级和自己id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."NAME" IS '模型名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."DESCRIPTION" IS '模型介绍';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."TYPE" IS '所属模型类别 0：水文，1：水动力，2：水质';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."DIMENSIONS" IS '所属纬度 0：一维，1：二维，2：三维';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."VERSION" IS '模型版本号';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."INTERFACE_ADDRESS" IS '模型调用接口';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."BUILTIN" IS '是否内置 0：否，1：是';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."FORMAT" IS '模型格式';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."SIZE" IS '模型大小 0：exe格式';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."SOURCE" IS '数据来源';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."UPLOAD_STATUS" IS '上传状态';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."UPLOAD_TIME" IS '上传时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."UPLOAD_INTERFACE" IS '上传接口';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."UPLOAD_FILE" IS '上传文件';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."UPLOAD_LOCATION" IS '文件地址';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."CREATOR_ID" IS '创建人id 创建者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."UPDATOR_ID" IS '更新人id 更新者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL"."REMARK" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_CACL" IS '模型计算管理';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."ID" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."CODE" IS '计算编码';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."NAME" IS '计算名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."MODEL_ID" IS '模型id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."MODEL_NAME" IS '模型名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."MODEL_VERSION" IS '模型版本';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."START_TIME" IS '开始时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."END_TIME" IS '结束时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."STATUS" IS '计算状态';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."INPUT_CONTENT" IS '模型输入内容';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."OUTPUT_CONTENT" IS '模型输出内容';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."CREATOR_ID" IS '创建人id 创建者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."UPDATOR_ID" IS '更新人id 更新者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL"."REMARK" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION" IS '模型计算重构表';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."ID" IS '主键id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."CODE" IS '计算编码';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."NAME" IS '计算名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."MODEL_ID" IS '模型id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."MODEL_NAME" IS '模型名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."MODEL_VERSION" IS '模型版本';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."START_TIME" IS '开始时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."END_TIME" IS '结束时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."STATUS" IS '计算状态';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."INPUT_CONTENT" IS '模型输入内容';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."OUTPUT_CONTENT" IS '模型输出内容';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."CREATOR_ID" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."UPDATOR_ID" IS '更新人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."REMARK" IS '备注';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."ADDRESS_ID" IS '文件或接口地址id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."ADDRESS_TYPE" IS '判断是文件的id还是地址的id，0:文件，1：接口';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CACL_RECONSTITUTION"."MP_PROGRAMME_ID" IS '文件计算的历史方案id';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_CLASSIFY" IS '模型分类';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."ID" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."PARENT_ID" IS '父级id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."ANCESTORS" IS '祖籍列表';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."NAME" IS '分类名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."DESCRIPTION" IS '分类描述';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."CREATOR_ID" IS '创建人id 创建者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."UPDATOR_ID" IS '更新人id 更新者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_CLASSIFY"."REMARK" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_COMPUTE" IS '模拟洪水预报-模型参数表';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."ID" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."START_TIME" IS '开始时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."CREATE_BY_ID" IS '操作人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."CREATE_BY" IS '操作人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."CREATE_TIME" IS '操作时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."NAME" IS '方案名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."MONITOR1" IS '监测站1号';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."MONITOR2" IS '监测站2号';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."MONITOR3" IS '监测站3号';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."AVG_RAIN_FALL" IS '面均雨量';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."RAIN_FALL_LAST" IS '降雨历时';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."WATER_SCALE" IS '降雨分布比例';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."Z" IS '初始库水位';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."Q" IS '初始出库流量';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."SOIL_CONDITION" IS '土壤条件';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."ZFZSXSKC" IS '蒸发折算系数(kc)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."ZFZSXSC" IS '蒸发折算系数(c)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."ZLSXL" IS '初始土壤张力水蓄量(w0)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."SCZLSXL" IS '初始上层张力水蓄量(wu0)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."XCZLSXL" IS '初始下层张力水蓄量(wl0)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."SCZLSXLWDO" IS '初始深层张力水蓄量(wd0)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."PJZLSXL" IS '流域平均张力水蓄量(wmm)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."LYSCZLSXL" IS '流域上层张力水蓄量(wum)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."LYXCZLSXL" IS '流域下层张力水蓄量(wlm)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."LYSCZLSXLWDO" IS '流域深层张力水蓄量(wdm)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."XTXS" IS '消退系数(kb)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_COMPUTE"."JL" IS '基流(qb)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."ID" IS '主键id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."MODEL_ID" IS '所属模型id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."MODEL_NAME" IS '所属模型名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."CONTEXT" IS '操作内容';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."START_TIME" IS '启用时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."MODEL_VERSION" IS '启用版本号';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除 ';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."CREATOR_ID" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."UPDATOR_ID" IS '更新人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_HISTORY"."REMARK" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_INPUT" IS '模型输入管理';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."ID" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."COMPANY_ID" IS '企业Id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."NAME" IS '参数名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."ENG_NAME" IS '英文名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."TYPE" IS '参数类型 0:单值，1：多列数值，2：文件';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."MODEL_ID" IS '所属模型id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."MODEL_NAME" IS '所属模型名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."MODEL_VERSION" IS '所属模型版本';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."DESCRIPTION" IS '参数说明(描述)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."EXAMPLE" IS '参数示例（文件上传）';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."PARAM_FILE" IS '参数文件';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."SINGLE_CONTENT" IS '参数单值';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."MULTIPLE_CONTENT" IS '参数多列值';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."CREATOR_ID" IS '创建人id 创建者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."UPDATOR_ID" IS '更新人id 更新者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."REMARK" IS '备注';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INPUT"."CHANGE_FLAG" IS '是否可变';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS" IS '接口地址';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."ID" IS 'id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."MODEL_ID" IS '模型id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."INTERFACE_ADDRESS" IS '接口地址';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."VERSION_ID" IS '模型版本id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."REQUEST_METHOD" IS '请求方式';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."INPUT_PARAMETER" IS '输入参数';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."OUTPUT_PARAMETER" IS '输出参数';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."DEL_FLAG" IS '删除标志';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."CREATOR_ID" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."UPDATOR_ID" IS '更新人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."REMARK" IS '备注';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."INPUT_PARAMETER_ILLUSTRATE" IS '输入参数说明';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_INTERFACE_ADDRESS"."OUTPUT_PARAMETER_ILLUSTRATE" IS '输出参数说明';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_OPERATE" IS '模型历史管理';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."ID" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."MODULE_NAME" IS '操作模块';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."TYPE" IS '操作类型';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."CONTENT" IS '操作内容';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."METHOD" IS '请求方式';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."REQ_CONTENT" IS '请求参数';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."RESP_CONTENT" IS '返回参数';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."IP" IS '操作地址(Ip)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."ADDRESS" IS '操作地点';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."STATUS" IS '操作状态';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."CREATOR_ID" IS '创建人id 创建者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."UPDATOR_ID" IS '更新人id 更新者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OPERATE"."REMARK" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_OUTPUT" IS '模型输入管理';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."ID" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."COMPANY_ID" IS '企业Id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."NAME" IS '参数名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."ENG_NAME" IS '英文名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."TYPE" IS '参数类型 0:单值，1：多列数值';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."MODEL_ID" IS '所属模型id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."MODEL_NAME" IS '所属模型名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."MODEL_VERSION" IS '所属模型版本';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."DESCRIPTION" IS '参数说明(描述)';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."SINGLE_CONTENT" IS '参数单值';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."MULTIPLE_CONTENT" IS '参数多列值';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."CREATOR_ID" IS '创建人id 创建者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."UPDATOR_ID" IS '更新人id 更新者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_OUTPUT"."REMARK" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_RECONSTITUTION" IS '模型库重构表';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."ID" IS 'id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."NAME" IS '模型名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."CLASSIFY_ID" IS '模型分类';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."BUILTIN" IS '是否预置';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."ACCESS_MODE" IS '接入方式';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."REQUEST_METHOD" IS '请求方式';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."INTERFACEORFILE_ADDRESS" IS '接口和文件的地址';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."VERSION_ID" IS '版本id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."WHETHER_PUBLISH" IS '是否发布';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."PUBLISH_TIME" IS '发布时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."DEL_FLAG" IS '删除标志';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."CREATOR_ID" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."UPDATOR_ID" IS '更新人id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."REMARK" IS '备注';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."PORT" IS '接口的端口号';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."FILE_NAME" IS '文件名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_RECONSTITUTION"."RUNNABLE_FILE_ADDRESS" IS '可执行文件相对路径';

COMMENT ON TABLE "QMODEL_DEV"."MODEL_VERSION" IS '版本管理';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."ID" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."COMPANY_ID" IS '企业id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."MODEL_ID" IS '所属模型id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."MODEL_NAME" IS '所属模型名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."VERSION" IS '模型版本号';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."FILE_ADDRESS" IS '文件地址';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."INTERFACE_ADDRESS" IS '接口地址';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."STATUS" IS '版本状态';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."DESCRIPTION" IS '描述';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."VALID_FLAG" IS '是否有效 0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."DEL_FLAG" IS '删除标志 1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."CREATE_BY" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."CREATOR_ID" IS '创建人id 创建者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."CREATE_TIME" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."UPDATE_BY" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."UPDATOR_ID" IS '更新人id 更新者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."UPDATE_TIME" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."REMARK" IS '备注';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."FILE_NAME" IS '文件的名称';

COMMENT ON COLUMN "QMODEL_DEV"."MODEL_VERSION"."RUNNABLE_FILE_ADDRESS" IS '可执行文件地址';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_BLOB_TRIGGERS" IS 'Blob类型的触发器表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_BLOB_TRIGGERS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_BLOB_TRIGGERS"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_BLOB_TRIGGERS"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_BLOB_TRIGGERS"."blob_data" IS '存放持久化Trigger对象';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_CALENDARS" IS '日历信息表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_CALENDARS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_CALENDARS"."calendar_name" IS '日历名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_CALENDARS"."calendar" IS '存放持久化calendar对象';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_CRON_TRIGGERS" IS 'Cron类型的触发器表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"."cron_expression" IS 'cron表达式';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_CRON_TRIGGERS"."time_zone_id" IS '时区';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS" IS '已触发的触发器表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."entry_id" IS '调度器实例id';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."instance_name" IS '调度器实例名';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."fired_time" IS '触发的时间';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."sched_time" IS '定时器制定的时间';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."priority" IS '优先级';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."state" IS '状态';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."job_name" IS '任务名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."job_group" IS '任务组名';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."is_nonconcurrent" IS '是否并发';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_FIRED_TRIGGERS"."requests_recovery" IS '是否接受恢复执行';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_JOB_DETAILS" IS '任务详细信息表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."job_name" IS '任务名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."job_group" IS '任务组名';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."description" IS '相关介绍';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."job_class_name" IS '执行任务类名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."is_durable" IS '是否持久化';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."is_nonconcurrent" IS '是否并发';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."is_update_data" IS '是否更新数据';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."requests_recovery" IS '是否接受恢复执行';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_JOB_DETAILS"."job_data" IS '存放持久化job对象';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_LOCKS" IS '存储的悲观锁信息表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_LOCKS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_LOCKS"."lock_name" IS '悲观锁名称';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_PAUSED_TRIGGER_GRPS" IS '暂停的触发器表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_PAUSED_TRIGGER_GRPS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_PAUSED_TRIGGER_GRPS"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_SCHEDULER_STATE" IS '调度器状态表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SCHEDULER_STATE"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SCHEDULER_STATE"."instance_name" IS '实例名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SCHEDULER_STATE"."last_checkin_time" IS '上次检查时间';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SCHEDULER_STATE"."checkin_interval" IS '检查间隔时间';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS" IS '简单触发器的信息表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS"."repeat_count" IS '重复的次数统计';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS"."repeat_interval" IS '重复的间隔时间';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPLE_TRIGGERS"."times_triggered" IS '已经触发的次数';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS" IS '同步机制的行锁表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."str_prop_1" IS 'String类型的trigger的第一个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."str_prop_2" IS 'String类型的trigger的第二个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."str_prop_3" IS 'String类型的trigger的第三个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."int_prop_1" IS 'int类型的trigger的第一个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."int_prop_2" IS 'int类型的trigger的第二个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."long_prop_1" IS 'long类型的trigger的第一个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."long_prop_2" IS 'long类型的trigger的第二个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."dec_prop_1" IS 'decimal类型的trigger的第一个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."dec_prop_2" IS 'decimal类型的trigger的第二个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."bool_prop_1" IS 'Boolean类型的trigger的第一个参数';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_SIMPROP_TRIGGERS"."bool_prop_2" IS 'Boolean类型的trigger的第二个参数';

COMMENT ON TABLE "QMODEL_DEV"."QRTZ_TRIGGERS" IS '触发器详细信息表';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."sched_name" IS '调度名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."trigger_name" IS '触发器的名字';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."trigger_group" IS '触发器所属组的名字';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."job_name" IS 'qrtz_job_details表job_name的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."job_group" IS 'qrtz_job_details表job_group的外键';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."description" IS '相关介绍';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."next_fire_time" IS '上一次触发时间（毫秒）';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."prev_fire_time" IS '下一次触发时间（默认为-1表示不触发）';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."priority" IS '优先级';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."trigger_state" IS '触发器状态';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."trigger_type" IS '触发器的类型';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."start_time" IS '开始时间';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."end_time" IS '结束时间';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."calendar_name" IS '日程表名称';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."misfire_instr" IS '补偿执行的策略';

COMMENT ON COLUMN "QMODEL_DEV"."QRTZ_TRIGGERS"."job_data" IS '存放持久化job对象';

COMMENT ON TABLE "QMODEL_DEV"."REL_USER_AUTH_PRODUCT" IS '用户与认证中心关系表';

COMMENT ON COLUMN "QMODEL_DEV"."REL_USER_AUTH_PRODUCT"."user_id" IS '用户ID';

COMMENT ON COLUMN "QMODEL_DEV"."REL_USER_AUTH_PRODUCT"."auth_id" IS '统一身份认证id';

COMMENT ON COLUMN "QMODEL_DEV"."REL_USER_AUTH_PRODUCT"."auth_product_type" IS '认证平台类型;0：冰凤框架；1：微信；2：支付宝';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_CONFIG" IS '参数配置表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."config_id" IS '参数主键';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."config_name" IS '参数名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."config_key" IS '参数键名';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."config_value" IS '参数键值';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."config_type" IS '系统内置（Y是 N否）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONFIG"."remark" IS '备注';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."id" IS 'id';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."sys_name" IS '系统名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."logo" IS '系统logo';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."login_logo" IS '登录页面logo';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."carousel_image" IS '轮播图';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."contact_number" IS '联系电话';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."email" IS '电子邮箱';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."copyright" IS '版权方';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."record_number" IS '备案号';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."del_flag" IS '删除标记';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."status" IS '状态';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."create_by" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."creator_id" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."update_by" IS '修改人';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."updator_id" IS '修改人id';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."update_time" IS '修改时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_CONTENT"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_DEPT" IS '部门表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."dept_id" IS '部门id';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."parent_id" IS '父部门id';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."ancestors" IS '祖级列表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."dept_name" IS '部门名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."order_num" IS '显示顺序';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."leader" IS '负责人';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."phone" IS '联系电话';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."email" IS '邮箱';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."status" IS '部门状态（0正常 1停用）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."del_flag" IS '删除标志（0代表存在 2代表删除）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DEPT"."update_time" IS '更新时间';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_DICT_DATA" IS '字典数据表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."dict_code" IS '字典编码';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."dict_sort" IS '字典排序';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."dict_label" IS '字典标签';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."dict_value" IS '字典键值';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."dict_type" IS '字典类型';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."css_class" IS '样式属性（其他样式扩展）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."list_class" IS '表格回显样式';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."is_default" IS '是否默认（Y是 N否）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."status" IS '状态（0正常 1停用）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_DATA"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_DICT_TYPE" IS '字典类型表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."dict_id" IS '字典主键';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."dict_name" IS '字典名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."dict_type" IS '字典类型';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."status" IS '状态（0正常 1停用）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_DICT_TYPE"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_JOB" IS '定时任务调度表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."job_id" IS '任务ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."job_name" IS '任务名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."job_group" IS '任务组名';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."invoke_target" IS '调用目标字符串';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."cron_expression" IS 'cron执行表达式';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."misfire_policy" IS '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."concurrent" IS '是否并发执行（0允许 1禁止）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."status" IS '状态（0正常 1暂停）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB"."remark" IS '备注信息';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_JOB_LOG" IS '定时任务调度日志表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB_LOG"."job_log_id" IS '任务日志ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB_LOG"."job_name" IS '任务名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB_LOG"."job_group" IS '任务组名';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB_LOG"."invoke_target" IS '调用目标字符串';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB_LOG"."job_message" IS '日志信息';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB_LOG"."status" IS '执行状态（0正常 1失败）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB_LOG"."exception_info" IS '异常信息';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_JOB_LOG"."create_time" IS '创建时间';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_LOGININFOR" IS '系统访问记录';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."info_id" IS '访问ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."user_name" IS '用户账号';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."ipaddr" IS '登录IP地址';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."login_location" IS '登录地点';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."browser" IS '浏览器类型';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."os" IS '操作系统';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."status" IS '登录状态（0成功 1失败）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."msg" IS '提示消息';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_LOGININFOR"."login_time" IS '访问时间';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_MENU" IS '菜单权限表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."menu_id" IS '菜单ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."menu_name" IS '菜单名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."parent_id" IS '父菜单ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."order_num" IS '显示顺序';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."path" IS '路由地址';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."component" IS '组件路径';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."query" IS '路由参数';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."is_frame" IS '是否为外链（0是 1否）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."is_cache" IS '是否缓存（0缓存 1不缓存）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."route_name" IS '路由名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."menu_type" IS '菜单类型（M目录 C菜单 F按钮）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."visible" IS '菜单状态（0显示 1隐藏）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."status" IS '菜单状态（0正常 1停用）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."perms" IS '权限标识';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."icon" IS '菜单图标';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_MENU"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_NOTICE" IS '通知公告表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."notice_id" IS '公告ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."notice_title" IS '公告标题';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."notice_type" IS '公告类型（1通知 2公告）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."notice_content" IS '公告内容';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."status" IS '公告状态（0正常 1关闭）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_NOTICE"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_OPER_LOG" IS '操作日志记录';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."oper_id" IS '日志主键';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."title" IS '模块标题';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."business_type" IS '业务类型（0其它 1新增 2修改 3删除）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."method" IS '方法名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."request_method" IS '请求方式';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."operator_type" IS '操作类别（0其它 1后台用户 2手机端用户）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."oper_name" IS '操作人员';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."dept_name" IS '部门名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."oper_url" IS '请求URL';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."oper_ip" IS '主机地址';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."oper_location" IS '操作地点';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."oper_param" IS '请求参数';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."json_result" IS '返回参数';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."status" IS '操作状态（0正常 1异常）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."error_msg" IS '错误消息';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."oper_time" IS '操作时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_OPER_LOG"."cost_time" IS '消耗时间';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_POST" IS '岗位信息表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."post_id" IS '岗位ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."post_code" IS '岗位编码';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."post_name" IS '岗位名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."post_sort" IS '显示顺序';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."status" IS '状态（0正常 1停用）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_POST"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_ROLE" IS '角色信息表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."role_id" IS '角色ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."role_name" IS '角色名称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."role_key" IS '角色权限字符串';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."role_sort" IS '显示顺序';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."data_scope" IS '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."menu_check_strictly" IS '菜单树选择项是否关联显示';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."dept_check_strictly" IS '部门树选择项是否关联显示';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."status" IS '角色状态（0正常 1停用）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."del_flag" IS '删除标志（0代表存在 2代表删除）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_ROLE_DEPT" IS '角色和部门关联表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE_DEPT"."role_id" IS '角色ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE_DEPT"."dept_id" IS '部门ID';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_ROLE_MENU" IS '角色和菜单关联表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE_MENU"."role_id" IS '角色ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_ROLE_MENU"."menu_id" IS '菜单ID';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_USER" IS '用户信息表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."user_id" IS '用户ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."dept_id" IS '部门ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."user_name" IS '用户账号';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."nick_name" IS '用户昵称';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."user_type" IS '用户类型（00系统用户）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."email" IS '用户邮箱';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."phonenumber" IS '手机号码';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."sex" IS '用户性别（0男 1女 2未知）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."avatar" IS '头像地址';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."password" IS '密码';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."status" IS '帐号状态（0正常 1停用）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."del_flag" IS '删除标志（0代表存在 2代表删除）';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."login_ip" IS '最后登录IP';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."login_date" IS '最后登录时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."create_by" IS '创建者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."update_by" IS '更新者';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."remark" IS '备注';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER"."auth_id" IS '认证平台id';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_USER_POST" IS '用户与岗位关联表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER_POST"."user_id" IS '用户ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER_POST"."post_id" IS '岗位ID';

COMMENT ON TABLE "QMODEL_DEV"."SYSTEM_USER_ROLE" IS '用户和角色关联表';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER_ROLE"."user_id" IS '用户ID';

COMMENT ON COLUMN "QMODEL_DEV"."SYSTEM_USER_ROLE"."role_id" IS '角色ID';

COMMENT ON TABLE "QMODEL_DEV"."EXAMPLE_DEPT" IS '示例部门表';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."id" IS 'ID';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."parent_id" IS '父部门id';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."name" IS '部门名称';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."leader" IS '负责人';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."phone" IS '联系电话';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."email" IS '邮箱';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."status" IS '部门状态';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."valid_flag" IS '是否有效;0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."del_flag" IS '删除标志;1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."create_by" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."creator_id" IS '创建人id';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."update_by" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."updator_id" IS '更新人id';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."EXAMPLE_DEPT"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."AUTH_CLIENT" IS '应用管理';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."id" IS '应用ID';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."secret_key" IS '应用秘钥';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."name" IS '应用名称';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."type" IS '应用类型;0：Web，1：App，2：小程序';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."icon" IS '应用图标';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."home_url" IS '应用首页';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."sync_url" IS '同步地址';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."redirect_url" IS '允许授权的url';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."public_flag" IS '是否公开';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."valid_flag" IS '是否有效;0：无效，1：有效';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."del_flag" IS '删除标志;1：已删除，0：未删除';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."create_by" IS '创建人';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."creator_id" IS '创建人id;创建者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."create_time" IS '创建时间';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."update_by" IS '更新人';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."updator_id" IS '更新人id;更新者的sys_user_id';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."update_time" IS '更新时间';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT"."remark" IS '备注';

COMMENT ON TABLE "QMODEL_DEV"."AUTH_CLIENT_USER" IS '应用和用户关联表';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT_USER"."client_id" IS '应用ID';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT_USER"."user_id" IS '用户ID';

COMMENT ON COLUMN "QMODEL_DEV"."AUTH_CLIENT_USER"."open_id" IS 'open_id';

