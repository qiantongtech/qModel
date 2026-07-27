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

package tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;

/**
 * 接口地址 创建/修改 Request VO MODEL_INTERFACE_ADDRESS
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "接口地址 Response VO")
@Data
public class ModelInterfaceAddressSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "接口地址", example = "")
    @NotBlank(message = "接口地址不能为空")
    private String interfaceAddress;

    @Schema(description = "模型版本id", example = "")
    private Long versionId;

    @Schema(description = "请求方式", example = "")
    private Integer requestMethod;

    @Schema(description = "输入参数", example = "")
    private String inputParameter;

    @Schema(description = "输出参数", example = "")
    private String outputParameter;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    private String remark;

    @Schema(description = "输入参数说明", example = "")
    private String inputParameterIllustrate;

    @Schema(description = "输出参数说明", example = "")
    private String outputParameterIllustrate;

    @Schema(description = "模型名称", example = "")
    @TableField(exist = false)
    private String modelName;

    @Schema(description = "模型版本", example = "")
    @TableField(exist = false)
    private String version;

}
