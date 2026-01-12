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
