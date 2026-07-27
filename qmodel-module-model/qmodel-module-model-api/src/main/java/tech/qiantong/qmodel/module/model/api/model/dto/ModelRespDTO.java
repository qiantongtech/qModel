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

package tech.qiantong.qmodel.module.model.api.model.dto;

import lombok.*;

/**
 * 模型基础信息 DTO 对象 model
 *
 * @author anivia
 * @date 2026-07-07
 */
@Data
public class ModelRespDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业ID */
    private Long companyId;

    /** 分类id */
    private Long classifyId;

    /** 名称 */
    private String name;

    /** 编码 */
    private String code;

    /** 接入方式 */
    private String accessType;

    /** 版本号 */
    private String version;

    /** 作者 */
    private String author;

    /** 状态 */
    private String status;

    /** 标签 */
    private String tags;

    /** 描述 */
    private String description;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    private Boolean delFlag;


}
