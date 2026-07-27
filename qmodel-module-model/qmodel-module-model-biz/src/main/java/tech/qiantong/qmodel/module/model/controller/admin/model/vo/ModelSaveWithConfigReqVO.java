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

package tech.qiantong.qmodel.module.model.controller.admin.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigSaveReqVO;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 模型基础信息 + 配置详情 合并保存 Request VO
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型基础信息 + 配置详情 合并保存 Request VO")
@Data
public class ModelSaveWithConfigReqVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "模型基础信息", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "模型基础信息不能为空")
    @Valid
    private ModelSaveReqVO model;

    @Schema(description = "模型配置详情")
    @Valid
    private ModelConfigSaveReqVO config;

}
