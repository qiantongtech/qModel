/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.enums;

/**
 * 模型接入类型枚举
 *
 * @author qModel
 * @date 2026-07-17
 */
public enum AccessTypeEnum {
    PYTHON("PYTHON", "Python脚本"),
    API("API", "API接口");

    private final String type;
    private final String description;

    AccessTypeEnum(String type, String description) {
        this.type = type;
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }

    public static AccessTypeEnum getByType(String type) {
        if (type == null) {
            return null;
        }
        for (AccessTypeEnum accessType : AccessTypeEnum.values()) {
            if (accessType.getType().equals(type)) {
                return accessType;
            }
        }
        return null;
    }
}
