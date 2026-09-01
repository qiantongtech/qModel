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

UPDATE `model_config` SET `model_version` = 'V1.0' WHERE `id` = 1;
UPDATE `model_config` SET `model_version` = 'V2.0' WHERE `id` = 2;
UPDATE `model_config` SET `model_version` = 'V1.5' WHERE `id` = 3;
UPDATE `model_config` SET `model_version` = 'V1.0' WHERE `id` = 4;
UPDATE `model_config` SET `model_version` = 'V2.3' WHERE `id` = 5;
UPDATE `model_config` SET `model_version` = 'V1.2' WHERE `id` = 6;
UPDATE `model_config` SET `model_version` = 'V3.0' WHERE `id` = 7;
UPDATE `model_config` SET `model_version` = 'v1.0' WHERE `id` = 8;
UPDATE `model_config` SET `model_version` = 'v1.0' WHERE `id` = 9;
UPDATE `model_config` SET `model_version` = 'v1.0' WHERE `id` = 10;

UPDATE `model_file_resource` SET `model_version` = 'V1.0' WHERE `id` = 5;

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

INSERT INTO system_dict_type VALUES (42, '模型版本摘要', 'model_version_digest', '0', '超级管理员', '2026-08-14 14:22:46', NULL, NULL, NULL);

INSERT INTO system_dict_data VALUES (144, 1, '文件修改', '1', 'model_version_digest', NULL, 'info', NULL, '0', '超级管理员', '2026-08-14 14:23:28', '超级管理员', '2026-08-14 14:25:59', NULL);
INSERT INTO system_dict_data VALUES (145, 2, '参数修改', '2', 'model_version_digest', NULL, 'success', NULL, '0', '超级管理员', '2026-08-14 14:24:00', '超级管理员', '2026-08-14 14:26:07', NULL);
INSERT INTO system_dict_data VALUES (146, 3, '鉴权修改', '3', 'model_version_digest', NULL, 'warning', NULL, '0', '超级管理员', '2026-08-14 14:24:25', '超级管理员', '2026-08-14 14:26:16', NULL);
INSERT INTO system_dict_data VALUES (147, 4, '地址修改', '4', 'model_version_digest', NULL, 'danger', NULL, '0', '超级管理员', '2026-08-14 14:25:40', '超级管理员', '2026-08-14 14:26:20', NULL);
