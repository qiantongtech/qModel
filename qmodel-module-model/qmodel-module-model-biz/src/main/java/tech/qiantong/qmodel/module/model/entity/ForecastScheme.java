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

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.*;
import lombok.*;

import java.util.*;

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
