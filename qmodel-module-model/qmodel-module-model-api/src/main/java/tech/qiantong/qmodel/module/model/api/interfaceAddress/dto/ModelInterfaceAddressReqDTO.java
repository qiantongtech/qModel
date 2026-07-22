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

package tech.qiantong.qmodel.module.model.api.interfaceAddress.dto;

import lombok.Data;

/**
 * 接口地址 DTO 对象 MODEL_INTERFACE_ADDRESS
 *
 * @author qModel
 * @date 2026-01-09
 */
@Data
public class ModelInterfaceAddressReqDTO {

    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 模型id */
    private Long modelId;

    /** 接口地址 */
    private String interfaceAddress;

    /** 模型版本id */
    private Long versionId;

    /** 请求方式 */
    private Integer requestMethod;

    /** 输入参数 */
    private String inputParameter;

    /** 输出参数 */
    private String outputParameter;

    /** 删除标志 */
    private Boolean delFlag;

    /** 输入参数说明 */
    private String inputParameterIllustrate;

    /** 输出参数说明 */
    private String outputParameterIllustrate;


}
