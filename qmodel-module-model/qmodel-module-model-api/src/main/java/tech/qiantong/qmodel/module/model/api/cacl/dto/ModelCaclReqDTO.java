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

package tech.qiantong.qmodel.module.model.api.cacl.dto;

import lombok.Data;

import java.util.Date;

/**
 * 模型计算重构 DTO 对象 MODEL_CACL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Data
public class ModelCaclReqDTO {

    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long ID;

    /** 企业id */
    private Long companyId;

    /** 计算编码 */
    private String CODE;

    /** 计算名称 */
    private String NAME;

    /** 模型id */
    private Long modelId;

    /** 模型名称 */
    private String modelName;

    /** 模型版本 */
    private String modelVersion;

    /** 开始时间 */
    private Date startTime;

    /** 结束时间 */
    private Date endTime;

    /** 计算状态 */
    private Long STATUS;

    /** 模型输入内容 */
    private String inputContent;

    /** 模型输出内容 */
    private String outputContent;

    /** 是否有效 0：无效，1：有效 */
    private Boolean validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    private Boolean delFlag;

    /** 文件或接口地址id */
    private Long addressId;

    /** 判断是文件的id还是地址的id，0:文件，1：接口 */
    private Long addressType;

    /** 文件计算的历史方案id */
    private Long mpProgrammeId;


}
