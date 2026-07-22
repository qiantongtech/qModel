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
 * 资源类型枚举
 *
 * @author qModel
 * @date 2026-07-16
 */
@Getter
@AllArgsConstructor
public enum ResourceTypeEnum {

    MODEL_FILE("1", "模型文件"),
    PYTHON_SCRIPT("2", "Python算法脚本");

    private final String type;
    private final String desc;

    public static ResourceTypeEnum getByType(String type) {
        for (ResourceTypeEnum typeEnum : values()) {
            if (typeEnum.getType().equals(type)) {
                return typeEnum;
            }
        }
        return null;
    }
}
