/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

import java.util.Date;

/**
 * 模型访问 key Request VO 对象 model_key
 *
 * @author anivia
 * @date 2026-07-30
 */
@Schema(description = "模型访问 key Request VO")
@Data
public class ModelKeyPageVO extends PageParam {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID", example = "")
    private Long id;

    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    private String name;

    @Schema(description = "key", example = "")
    private String apiKey;

    @Schema(description = "描述", example = "")
    private String description;

    @Schema(description = "最后使用时间", example = "")
    private Date lastUseTime;
}
