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

package tech.qiantong.qmodel.module.model.service.calc.dto;

import lombok.Data;

/**
 * 队列任务对象
 *
 * @author qModel
 * @date 2026-07-28
 */
@Data
public class QueueTask {

    /**
     * 任务唯一标识
     */
    private String taskId;

    /**
     * 关联的计算任务ID
     */
    private Long calcId;

    /**
     * 优先级(1-高, 2-中, 3-低)
     */
    private Integer priority;

    /**
     * 执行批次号
     */
    private String executionNo;

    /**
     * 入队时间戳
     */
    private Long createdAt;

}
