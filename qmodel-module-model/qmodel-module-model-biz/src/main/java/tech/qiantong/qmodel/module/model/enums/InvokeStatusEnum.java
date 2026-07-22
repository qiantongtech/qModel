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

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 调用状态枚举
 *
 * @author qModel
 * @date 2026-07-16
 */
@Getter
@AllArgsConstructor
public enum InvokeStatusEnum {

    SUCCESS("1", "成功"),
    FAILED("2", "失败");

    private final String status;
    private final String desc;

    public static InvokeStatusEnum getByStatus(String status) {
        for (InvokeStatusEnum statusEnum : values()) {
            if (statusEnum.getStatus().equals(status)) {
                return statusEnum;
            }
        }
        return null;
    }
}
