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

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.Map;

/**
 * 模型执行参数
 *
 * @author anivia
 * @date 2026-07-30
 */
@Data
public class ModelExecuteVO {
    /**
     * 模型编号
     */
    @NotBlank(message = "模型编码不能为空")
    String modelCode;

    /**
     * 模型执行参数
     */
    Map<String,Object> param;
}
