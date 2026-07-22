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

package tech.qiantong.qmodel.mybatis.config;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 主数据源配置文件
 * @author anivia
 */
@Component
public class MasterDataSourceConfig {

    private static String databaseType;

    @Value("${datasource.type}")
    public void setDatabaseType(String databaseType) {
        MasterDataSourceConfig.databaseType = databaseType;
    }

    public static String getDatabaseType() {
        return databaseType;
    }
}
