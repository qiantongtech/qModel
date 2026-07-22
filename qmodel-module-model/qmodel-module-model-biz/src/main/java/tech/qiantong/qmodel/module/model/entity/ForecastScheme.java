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

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 预测方案
 * @author jinwang
 * @date 2024/10/21 10:53
 **/
@Data
@TableName("FORECAST_SCHEME")
public class ForecastScheme {

    /** ID */
    @TableId(value = "ID", type = IdType.AUTO)
    private Integer id;

    /** 方案名称 */
    @TableField(value = "NAME")
    private String name;

    /** 方案类型 */
    @TableField(value = "SCHEME_TYPE")
    private String schemeType;

    /** 编码 */
    @TableField(value = "OBJ_CODE")
    private String objCode;

    /** 开始时间 */
    @TableField(value = "START_TIME")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 结束时间 */
    @TableField(value = "END_TIME")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 预测时间 */
    @TableField(value = "FORECAST_TIME")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date forecastTime;

    /** 预测天数 */
    @TableField(value = "FORECAST_DAY")
    private Integer forecastDay;

    /** 预测状态 */
    @TableField(value = "STATUS")
    private String status;

    /** 模型类型 */
    @TableField(value = "MODEL_TYPE")
    private String modelType;

    /** 设置隐藏层 */
    @TableField(value = "MODEL_HIDDEN_LAYERS")
    private String modelHiddenLayers;

    /** 设置学习率 */
    @TableField(value = "MODEL_LEARNING_RATE")
    private Double modelLearningRate;

    /** 设置动量项 */
    @TableField(value = "MODEL_MOMENTUM")
    private Double modelMomentum;

    /** 设置训练迭代次数 */
    @TableField(value = "MODEL_TRAINIMG_TIME")
    private Integer modelTrainimgTime;

    /** 预测结果 */
    @TableField(value = "OUTPUT_CONTENT")
    private String outputContent;

    /** 删除标志（0 代表存在 2 代表删除） */
    @TableField(value = "DEL_FLAG")
    private String delFlag;

    /** 创建人 */
    @TableField(value = "CREATE_BY")
    private String createBy;

    /** 创建时间 */
    @TableField(value = "CREATE_TIME")
    private Date createTime;

    /** 更新人 */
    @TableField(value = "UPDATE_BY")
    private String updateBy;

    /** 更新时间 */
    @TableField(value = "UPDATE_TIME")
    private Date updateTime;
}
