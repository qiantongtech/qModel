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

package tech.qiantong.qmodel.module.model.controller.admin.operate.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;

/**
 * 模型历史管理 创建/修改 Request VO MODEL_OPERATE
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "模型历史管理 Response VO")
@Data
public class ModelOperateSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "操作模块", example = "")
    @NotBlank(message = "操作模块不能为空")
    private String moduleName;

    @Schema(description = "操作类型", example = "")
    private Integer type;

    @Schema(description = "操作内容", example = "")
    @NotBlank(message = "操作内容不能为空")
    private String content;

    @Schema(description = "请求方式", example = "")
    @NotBlank(message = "请求方式不能为空")
    private String method;

    @Schema(description = "请求参数", example = "")
    @NotBlank(message = "请求参数不能为空")
    private String reqContent;

    @Schema(description = "返回参数", example = "")
    @NotBlank(message = "返回参数不能为空")
    private String respContent;

    @Schema(description = "操作地址(Ip)", example = "")
    @NotBlank(message = "操作地址(Ip)不能为空")
    private String ip;

    @Schema(description = "操作地点", example = "")
    @NotBlank(message = "操作地点不能为空")
    private String address;

    @Schema(description = "操作状态", example = "")
    private Integer status;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    private String remark;


}
