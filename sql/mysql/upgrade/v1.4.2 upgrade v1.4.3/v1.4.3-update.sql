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

-- =====================================================================
-- V1.4.3 DDL：新增 数据管理 - API 接入表 model_data_api
-- 对应后端：ModelDataApiDO / ModelDataApiMapper.xml
-- 注：model_calc / model_config 表本次不改动（resourceId、outputSchema 已存在）
-- =====================================================================

DROP TABLE IF EXISTS `model_data_api`;
CREATE TABLE `model_data_api` (
    `id`                  bigint(20)      NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`                varchar(128)    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'API数据名称',
    `model_id`            bigint(20)      NULL DEFAULT NULL COMMENT '关联模型ID',
    `api_type`            varchar(64)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API类型（字典 model_data_api_type）',
    `api_url`             varchar(512)    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口地址',
    `request_method`      varchar(16)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'POST' COMMENT '请求方式（字典 model_access_mode）',
    `content_type`        varchar(64)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'application/json' COMMENT '请求内容类型（字典 content_type）',
    `timeout_seconds`     bigint(20)      NULL DEFAULT 30 COMMENT '超时时间（秒）',

    `auth_type`           varchar(32)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'NONE' COMMENT '鉴权类型：NONE/FIXED/DYNAMIC（字典 auth_type）',
    `auth_method`         varchar(32)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鉴权方式：apiKey/bearer',
    `auth_inject_pos`     varchar(32)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注入位置：header/query（字典 auth_inject_position）',
    `auth_key_name`       varchar(128)    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鉴权键名',
    `auth_token_prefix`   varchar(64)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Token 前缀',
    `auth_token_value`    varchar(512)    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '固定 Token 值 / APIKey',

    `auth_dyn_method`     varchar(16)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '动态获取 Token 方式',
    `auth_dyn_url`        varchar(512)    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '动态获取 Token 地址',
    `auth_dyn_headers`    text            CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '动态获取 Token 请求头(JSON)',
    `auth_dyn_params`     text            CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '动态获取 Token Query 参数(JSON)',
    `auth_dyn_body`       text            CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '动态获取 Token 请求体(JSON)',
    `auth_extract_path`   varchar(128)    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Token 提取路径（JSONPath）',

    `request_template`    longtext        CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求参数模板',
    `batch_params`        longtext        CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '批量请求参数',
    `input_schema`        longtext        CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入参 JSON Schema 定义',
    `output_schema`       longtext        CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出参 JSON Schema 定义',
    `description`         varchar(512)    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',

    `valid_flag`          tinyint(1)      NOT NULL DEFAULT 1 COMMENT '是否有效：0-无效，1-有效',
    `del_flag`            tinyint(1)      NOT NULL DEFAULT 0 COMMENT '删除标志：0-未删除，1-已删除',

    `create_by`           varchar(32)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `creator_id`          bigint(20)      NULL DEFAULT NULL COMMENT '创建人ID',
    `create_time`         datetime        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`           varchar(32)     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
    `updater_id`          bigint(20)      NULL DEFAULT NULL COMMENT '更新人ID',
    `update_time`         datetime        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`              varchar(512)    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',

    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_mda_model_id`     (`model_id`)     USING BTREE,
    INDEX `idx_mda_name`         (`name`)         USING BTREE,
    INDEX `idx_mda_create_time`  (`create_time`)  USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '模型数据API接入表' ROW_FORMAT = Dynamic;
