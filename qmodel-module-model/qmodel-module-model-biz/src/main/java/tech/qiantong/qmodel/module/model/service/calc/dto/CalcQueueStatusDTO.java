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

package tech.qiantong.qmodel.module.model.service.calc.dto;

import lombok.Data;

/**
 * 队列状态 DTO
 *
 * @author qModel
 * @date 2026-07-28
 */
@Data
public class CalcQueueStatusDTO {

    /**
     * 等待中任务数
     */
    private Long waiting;

    /**
     * 运行中任务数
     */
    private Long running;

    /**
     * 死信队列任务数
     */
    private Long dead;

}
