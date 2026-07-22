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

package tech.qiantong.qmodel.module.model.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 入库流量计算实体
 */
@Data
public class InboundFlow {

    private Date startTime; // 开始时间

    private String type; // 计算类型；0：实时计算；1：模拟计算

    private BigDecimal avgRainfall; // 面均雨量

    private Integer rainfallLast; // 降雨历时

    private BigDecimal waterLevel; // 初始库水位

    private BigDecimal outFlow; // 初始出库流量

    private BigDecimal rainfall1; // 输入-近1小时降雨量

    private BigDecimal rainfall3; // 输入-近3小时降雨量

    private BigDecimal rainfall6; // 输入-近6小时降雨量

    private BigDecimal rainfall12; // 输入-近12小时降雨量

    private BigDecimal rainfall24; // 输入-近24小时降雨量

    private BigDecimal rainfall48; // 输入-近48小时降雨量

    private BigDecimal rainfall120; // 输入-近120小时降雨量

    private BigDecimal rainfallOther; // 其他

    // 设定默认值
    public InboundFlow() {
        this.rainfall1 = new BigDecimal("0.072847977");
        this.rainfall3 = new BigDecimal("0.162257746");
        this.rainfall6 = new BigDecimal("-0.167724418");
        this.rainfall12 = new BigDecimal("0.720720906");
        this.rainfall24 = new BigDecimal("-0.656641586");
        this.rainfall48 = new BigDecimal("0.054752314");
        this.rainfall120 = new BigDecimal("0.095210096");
        this.rainfallOther = new BigDecimal("3.685260631");
    }
}
