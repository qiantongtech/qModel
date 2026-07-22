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

public enum ForecastStatusEnums {
    DKS("0", "待开始"),
    YCZ("1", "预测中"),
    WC("2", "完成");
    public final String code;
    public final String info;

    ForecastStatusEnums(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public static ForecastStatusEnums get(String code) {
        for (ForecastStatusEnums v : values()) {
            if (v.eq(code)) {
                return v;
            }
        }
        return null;
    }

    // 根据code返回县市名称
    public static ForecastStatusEnums getName(String info) {
        for (ForecastStatusEnums v : values()) {
            if (v.like(info)) {
                return v;
            }
        }
        return null;
    }

    public boolean eq(String code) {
        return this.code.equals(code);
    }

    public boolean like(String info) {
        return this.info.equals(info);
    }

    public static String getInfo(String code) {
        return ForecastStatusEnums.get(code).getInfo();
    }

    public static String getCode(String info) {
        return ForecastStatusEnums.getName(info).getCode();
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
