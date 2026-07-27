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

package tech.qiantong.qmodel.module.model.api.modelReconstitution.dto;

import lombok.Data;

import java.util.Date;

/**
 * 模型库重构 DTO 对象 MODEL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Data
public class ModelReconstitutionReqDTO {

    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 模型名称 */
    private String name;

    /** 模型分类 */
    private Long classifyId;

    /** 是否预置 */
    private Long builtin;

    /** 接入方式 */
    private Integer accessMode;

    /** 请求方式 */
    private Integer requestMethod;

    /** 接口和文件的地址 */
    private String interfaceorfileAddress;

    /** 版本id */
    private Long versionId;

    /** 是否发布 */
    private Long whetherPublish;

    /** 发布时间 */
    private Date publishTime;

    /** 删除标志 */
    private Boolean delFlag;

    /** 接口的端口号 */
    private String port;

    /** 文件名称 */
    private String filename;

    /** 可执行文件相对路径 */
    private String runnableFileAddress;


}
