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
 * 执行结果对象
 *
 * @author qModel
 * @date 2026-07-28
 */
@Data
public class ExecutionResult {

    /**
     * 是否成功
     */
    private Boolean success;

    /**
     * 输出结果(JSON)
     */
    private String output;

    /**
     * 错误信息
     */
    private String errorMessage;

    /**
     * 耗时(毫秒)
     */
    private Long duration;

    /**
     * 执行日志
     */
    private String executionLog;

}
