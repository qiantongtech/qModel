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

package tech.qiantong.qmodel.module.model.dal.dataobject.cacl;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 模型计算重构 DO 对象 MODEL_CACL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Data
@TableName(value = "model_cacl")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("MODEL_CACL_RECONSTITUTION_seq")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ModelCaclDO extends BaseEntity {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 企业id
     */
    private Long companyId;

    /**
     * 计算编码
     */
    private String code;

    /**
     * 计算名称
     */
    private String name;

    /**
     * 模型id
     */
    private Long modelId;

    /**
     * 模型名称
     */
    private String modelName;

    /**
     * 模型版本
     */
    private String modelVersion;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 计算状态
     */
    private Integer status;

    /**
     * 模型输入内容
     */
    private String inputContent;

    /**
     * 模型输出内容
     */
    private String outputContent;

    /**
     * 是否有效 0：无效，1：有效
     */
    private Boolean validFlag;

    /**
     * 删除标志 1：已删除，0：未删除
     */
    @TableLogic
    private Boolean delFlag;

    /**
     * 文件或接口地址id
     */
    private Long addressId;

    /**
     * 判断是文件的id还是地址的id，0:文件，1：接口
     */
    private Integer addressType;

    /**
     * 文件计算的历史方案id
     */
    private Long mpProgrammeId;

    /**
     * 地址
     */
    @TableField(exist = false)
    private String address;

    /**
     * 请求方式  0：get，1：post，2：put，3：delete
     */
    @TableField(exist = false)
    private Integer requestMethod;
}
