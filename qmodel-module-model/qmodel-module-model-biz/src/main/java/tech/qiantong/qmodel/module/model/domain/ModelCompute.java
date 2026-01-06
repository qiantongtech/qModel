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

package tech.qiantong.qmodel.module.model.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.*;

import java.math.*;
import java.sql.*;

/**
 * moxing
 * @author jinwang
 * @date 2024/10/25 15:01
 **/
@TableName("MODEL_COMPUTE")
@Data
public class ModelCompute {

    @TableId(value = "ID", type = IdType.AUTO)
    private Long id; // ID

    @TableField("START_TIME")
    private Timestamp startTime; // 开始时间

    @TableField(exist = false)
    private Long createById; // 操作人 id

    @TableField("CREATE_BY")
    private String createBy; // 操作人

    @TableField("CREATE_TIME")
    private Timestamp createTime; // 操作时间

    @TableField("NAME")
    private String name; // 方案名称

    @TableField("MONITOR1")
    private BigDecimal monitor1; // 监测站 1 号

    @TableField("MONITOR2")
    private BigDecimal monitor2; // 监测站 2 号

    @TableField("MONITOR3")
    private BigDecimal monitor3; // 监测站 3 号

    @TableField("AVG_RAIN_FALL")
    private BigDecimal avgRainFall; // 面均雨量

    @TableField("RAIN_FALL_LAST")
    private BigDecimal rainFallLast; // 降雨历时

    @TableField("WATER_SCALE")
    private BigDecimal waterScale; // 降雨分布比例

    @TableField("Q")
    private BigDecimal z; // 初始库水位

    @TableField("Z")
    private BigDecimal q; // 初始出库流量

    @TableField("SOIL_CONDITION")
    private String soilCondition; // 土壤条件

    @TableField("ZFZSXSKC")
    private BigDecimal zfzsxskc; // 蒸发折算系数(kc)

    @TableField("ZFZSXSC")
    private BigDecimal zfzsxsc; // 蒸发折算系数(c)

    @TableField("ZLSXL")
    private BigDecimal zlsxl; // 初始土壤张力水蓄量(w0)

    @TableField("SCZLSXL")
    private BigDecimal sczlsxl; // 初始上层张力水蓄量(wu0)

    @TableField("XCZLSXL")
    private BigDecimal xczlsxl; // 初始下层张力水蓄量(wl0)

    @TableField("SCZLSXLWDO")
    private BigDecimal sczlsxlwdo; // 初始深层张力水蓄量(wd0)

    @TableField("PJZLSXL")
    private BigDecimal pjzlsxl; // 流域平均张力水蓄量(wmm)

    @TableField("LYSCZLSXL")
    private BigDecimal lysczlsxl; // 流域上层张力水蓄量(wum)

    @TableField("LYXCZLSXL")
    private BigDecimal lyxczlsxl; // 流域下层张力水蓄量(wlm)

    @TableField("LYSCZLSXLWDO")
    private BigDecimal lysczlsxlwdo; // 流域深层张力水蓄量(wdm)

    @TableField("XTXS")
    private BigDecimal xtxs; // 消退系数(kb)

    @TableField("JL")
    private BigDecimal jl; // 基流(qb)
}
