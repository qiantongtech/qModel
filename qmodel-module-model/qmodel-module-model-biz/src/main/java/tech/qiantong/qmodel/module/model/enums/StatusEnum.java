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

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 状态枚举
 * 用于表示启用/停用状态
 *
 * @author qModel
 * @date 2026-01-20
 */
@Getter
@AllArgsConstructor
public enum StatusEnum {

    /**
     * 停用
     */
    DISABLED(0, "停用"),

    /**
     * 启用
     */
    ENABLED(1, "启用");

    /**
     * 状态值
     */
    private final Integer value;

    /**
     * 状态描述
     */
    private final String desc;

    /**
     * 根据值获取枚举
     *
     * @param value 值
     * @return 枚举
     */
    public static StatusEnum getByValue(Long value) {
        for (StatusEnum statusEnum : values()) {
            if (statusEnum.getValue().equals(value)) {
                return statusEnum;
            }
        }
        return null;
    }

    /**
     * 是否为启用状态
     *
     * @param value 状态值
     * @return 是否启用
     */
    public static boolean isEnabled(Integer value) {
        return ENABLED.getValue().equals(value);
    }

    /**
     * 是否为停用状态
     *
     * @param value 状态值
     * @return 是否停用
     */
    public static boolean isDisabled(Integer value) {
        return DISABLED.getValue().equals(value);
    }
}
