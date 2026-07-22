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

package tech.qiantong.qmodel.module.model.api.operate.dto;

import lombok.Data;

/**
 * 模型历史管理 DTO 对象 MODEL_OPERATE
 *
 * @author qModel
 * @date 2026-01-09
 */
@Data
public class ModelOperateReqDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 操作模块 */
    private String moduleName;

    /** 操作类型 */
    private Long type;

    /** 操作内容 */
    private String content;

    /** 请求方式 */
    private String method;

    /** 请求参数 */
    private String reqContent;

    /** 返回参数 */
    private String respContent;

    /** 操作地址(Ip) */
    private String ip;

    /** 操作地点 */
    private String address;

    /** 操作状态 */
    private Integer status;

    /** 是否有效 0：无效，1：有效 */
    private Boolean validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    private Boolean delFlag;


}
