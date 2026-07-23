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
import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型审批 Request VO 对象 model_audit
 *
 * @author anivia
 * @date 2026-07-23
 */
@Schema(description = "模型审批 Request VO")
@Data
public class ModelAuditPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "申请人", example = "")
    private Long applyId;

    @Schema(description = "申请时间", example = "")
    private Date applyTime;

    @Schema(description = "申请理由", example = "")
    private String applyReason;

    @Schema(description = "审核状态", example = "")
    private String auditStatus;

    @Schema(description = "审核人", example = "")
    private Long auditorId;

    @Schema(description = "审核时间", example = "")
    private Date auditTime;

    @Schema(description = "审核理由", example = "")
    private String auditReason;

    @Excel(name = "模型名称")
    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Excel(name = "模型编码")
    @Schema(description = "模型编码", example = "")
    private String modelCode;

    @Excel(name = "申请人姓名")
    @Schema(description = "申请人姓名", example = "")
    private String applyName;

    @Excel(name = "审核人姓名")
    @Schema(description = "审核人姓名", example = "")
    private String auditorName;

}
