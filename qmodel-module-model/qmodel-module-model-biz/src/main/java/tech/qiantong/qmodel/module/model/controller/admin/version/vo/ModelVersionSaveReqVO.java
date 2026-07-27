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

package tech.qiantong.qmodel.module.model.controller.admin.version.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;

/**
 * 版本管理 创建/修改 Request VO MODEL_VERSION
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "版本管理 Response VO")
@Data
public class ModelVersionSaveReqVO extends BaseEntity {

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

    @Schema(description = "模型版本号", example = "")
    @NotBlank(message = "模型版本号不能为空")
    private String version;

    @Schema(description = "文件地址", example = "")
    private String fileAddress;

    @Schema(description = "接口地址", example = "")
    private String interfaceAddress;

    @Schema(description = "版本状态0-停用、1-启用", example = "")
    private Integer status;

    @Schema(description = "描述", example = "")
    private String description;

    @Schema(description = "备注", example = "")
    private String remark;

    @Schema(description = "文件的名称", example = "")
    private String fileName;

    @Schema(description = "可执行文件地址", example = "")
    private String runnableFileAddress;


}
