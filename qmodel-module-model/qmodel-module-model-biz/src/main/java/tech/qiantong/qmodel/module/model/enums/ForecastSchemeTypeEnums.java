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

public enum ForecastSchemeTypeEnums {
    RV("0", "河道水情"),
    UW("1","地下水"),
    XX("2","生态流量下泄水")
    ;
    public final String code;
    public final String info;

    ForecastSchemeTypeEnums(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public static ForecastSchemeTypeEnums get(String code) {
        for (ForecastSchemeTypeEnums v : values()) {
            if (v.eq(code)) {
                return v;
            }
        }
        return null;
    }

    // 根据code返回县市名称
    public static ForecastSchemeTypeEnums getName(String info) {
        for (ForecastSchemeTypeEnums v : values()) {
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
        return ForecastSchemeTypeEnums.get(code).getInfo();
    }

    public static String getCode(String info) {
        return ForecastSchemeTypeEnums.getName(info).getCode();
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
