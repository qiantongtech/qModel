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

package tech.qiantong.qmodel.module.model.controller.admin.classify.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;

/**
 * 模型分类 创建/修改 Request VO MODEL_CLASSIFY
 *
 * @author qModel
 * @date 2026-01-07
 */
@Schema(description = "模型分类 Response VO")
@Data
public class ModelClassifySaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "父级id", example = "")
    private Long parentId;

    @Schema(description = "祖籍列表", example = "")
    private String ancestors;

    @Schema(description = "分类名称", example = "")
    @NotBlank(message = "分类名称不能为空")
    private String name;

    @Schema(description = "分类描述", example = "")
    private String description;

    @Schema(description = "显示顺序", example = "")
    private Integer orderNum;

    @Schema(description = "备注", example = "")
    private String remark;


}
