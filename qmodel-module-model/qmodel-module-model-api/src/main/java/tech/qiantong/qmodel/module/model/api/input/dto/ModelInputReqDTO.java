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

package tech.qiantong.qmodel.module.model.api.input.dto;

import lombok.Data;

/**
 * 模型输入管理 DTO 对象 MODEL_INPUT
 *
 * @author qModel
 * @date 2026-01-09
 */
@Data
public class ModelInputReqDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业Id */
    private Long companyId;

    /** 参数名称 */
    private String name;

    /** 英文名称 */
    private String engName;

    /** 参数类型 0:单值，1：多列数值，2：文件 */
    private Long type;

    /** 所属模型id */
    private Long modelId;

    /** 所属模型名称 */
    private String modelName;

    /** 所属模型版本 */
    private String modelVersion;

    /** 参数说明(描述) */
    private String description;

    /** 参数示例（文件上传） */
    private String example;

    /** 参数文件 */
    private String paramFile;

    /** 参数单值 */
    private String singleContent;

    /** 参数多列值 */
    private String multipleContent;

    /** 是否有效 0：无效，1：有效 */
    private Boolean validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    private Boolean delFlag;

    /** 是否可变 */
    private Boolean changeFlag;


}
