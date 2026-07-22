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
 * 请求方法枚举
 *
 * @author qModel
 * @date 2026-01-13
 */
public enum RequestMethodEnum {
    GET(0, "GET"),
    POST(1, "POST"),
    PUT(2, "PUT"),
    DELETE(3, "DELETE");

    @EnumValue
    private final Integer value;
    @JsonValue
    private final String label;

    RequestMethodEnum(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public Integer getValue() {
        return value;
    }

    public String getLabel() {
        return label;
    }

    public static RequestMethodEnum getByValue(Integer value) {
        if (value == null) {
            return null;
        }
        for (RequestMethodEnum method : RequestMethodEnum.values()) {
            if (method.getValue().equals(value)) {
                return method;
            }
        }
        return null;
    }
}
