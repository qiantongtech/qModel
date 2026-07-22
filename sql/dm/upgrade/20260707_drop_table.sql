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


-- 删除示例表格
DROP TABLE IF EXISTS QMODEL_DEV.EXAMPLE_DEPT;

DROP TABLE IF EXISTS QMODEL_DEV.EXAMPLE_STUDENT;

-- 删除弃用表
DROP TABLE IF EXISTS QMODEL_DEV.MODEL_CACL;

-- 修改模型计算表名称
ALTER TABLE QMODEL_DEV.MODEL_CACL_RECONSTITUTION RENAME TO MODEL_CACL;

COMMENT ON TABLE QMODEL_DEV.MODEL_CACL IS '模型计算';


-- 添加表注释
COMMENT ON TABLE QMODEL_DEV.MODEL_HISTORY IS '模型历史';

COMMENT ON TABLE QMODEL_DEV.SYSTEM_CONTENT IS '系统配置信息';
