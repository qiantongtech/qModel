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

package tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型审批 创建/修改 Request VO model_audit
 *
 * @author anivia
 * @date 2026-07-23
 */
@Schema(description = "模型审批 Response VO")
@Data
public class ModelAuditSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "模型id", example = "")
    @NotNull(message = "模型id不能为空")
    private Long modelId;

    @Schema(description = "申请人", example = "")
    @NotNull(message = "申请人不能为空")
    private Long applyId;

    @Schema(description = "申请时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date applyTime;

    @Schema(description = "申请理由", example = "")
    @NotBlank(message = "申请理由不能为空")
    @Size(max = 256, message = "申请理由长度不能超过256个字符")
    private String applyReason;

    @Schema(description = "审核状态", example = "")
    @NotBlank(message = "审核状态不能为空")
    private String auditStatus;

    @Schema(description = "审核人", example = "")
    private Long auditorId;

    @Schema(description = "审核时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date auditTime;

    @Schema(description = "审核理由", example = "")
    @NotBlank(message = "审核理由不能为空")
    @Size(max = 256, message = "审核理由长度不能超过256个字符")
    private String auditReason;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    @Size(max = 512, message = "备注长度不能超过512个字符")
    private String remark;


}
