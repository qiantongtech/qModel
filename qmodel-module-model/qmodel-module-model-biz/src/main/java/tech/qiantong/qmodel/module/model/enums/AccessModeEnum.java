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

package tech.qiantong.qmodel.module.model.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * 访问模式、接入模式枚举
 *
 * @author qModel
 * @date 2026-01-15
 */
public enum AccessModeEnum {
    FILE(0, "文件访问"),
    API_INTERFACE(1, "API接口");

    @EnumValue
    private final Integer value;
    @JsonValue
    private final String label;

    AccessModeEnum(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public Integer getValue() {
        return value;
    }

    public String getLabel() {
        return label;
    }

    public static AccessModeEnum getByValue(Integer value) {
        if (value == null) {
            return null;
        }
        for (AccessModeEnum mode : AccessModeEnum.values()) {
            if (mode.getValue().equals(value)) {
                return mode;
            }
        }
        return null;
    }
}
