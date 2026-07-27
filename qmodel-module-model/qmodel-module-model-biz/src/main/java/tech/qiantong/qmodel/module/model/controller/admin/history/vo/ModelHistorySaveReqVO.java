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

package tech.qiantong.qmodel.module.model.controller.admin.history.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;
import java.util.Date;

/**
 * 模型历史 创建/修改 Request VO MODEL_HISTORY
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "模型历史 Response VO")
@Data
public class ModelHistorySaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "所属模型id", example = "")
    private Long modelId;

    @Schema(description = "所属模型名称", example = "")
    @NotBlank(message = "所属模型名称不能为空")
    private String modelName;

    @Schema(description = "操作内容", example = "")
    @NotBlank(message = "操作内容不能为空")
    private String context;

    @Schema(description = "启用时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @Schema(description = "启用版本号", example = "")
    @NotBlank(message = "启用版本号不能为空")
    private String modelVersion;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    private String remark;


}
