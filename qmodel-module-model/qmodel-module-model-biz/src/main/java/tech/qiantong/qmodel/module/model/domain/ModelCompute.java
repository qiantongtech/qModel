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

package tech.qiantong.qmodel.module.model.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.sql.Timestamp;

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
