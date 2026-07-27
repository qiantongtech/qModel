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
 * 模型状态枚举
 *
 * @author qModel
 * @date 2026-07-16
 */
@Getter
@AllArgsConstructor
public enum ModelStatusEnum {

    BUILDING("0", "部署中"),
    BUILD_SUCCESS("1", "构建成功"),
    BUILD_FAILED("2", "构建失败"),
    CUT_IN("3", "已接入"),
    AUDITING("4", "审核中"),
    PUBLISHED("5", "已发布"),
    AUDIT_FAILED("6", "审核拒绝"),
    OFFLINE("7", "已下线"),
    ;

    private final String status;
    private final String desc;

    public static ModelStatusEnum getByStatus(String status) {
        for (ModelStatusEnum statusEnum : values()) {
            if (statusEnum.getStatus().equals(status)) {
                return statusEnum;
            }
        }
        return null;
    }

    public String getValue() {
        return status;
    }
}
