/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *
 * More information: https://qmodel.qiantong.tech/business.html
 *
 * ============================================================================
 *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
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
