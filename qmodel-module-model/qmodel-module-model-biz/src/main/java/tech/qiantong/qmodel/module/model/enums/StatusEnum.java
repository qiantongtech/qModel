/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
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
