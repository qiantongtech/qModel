/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Schema(description = "模型密钥保存 VO")
@Data
public class ModelKeySaveVO extends BaseEntity {


    @Schema(description = "名称", example = "")
    @NotNull(message = "名称不能为空")
    private String name;

    /**
     * 描述
     */
    @Schema(description = "描述", example = "")
    @Size(max = 255, message = "描述长度不能超过255个字符")
    private String description;
}
