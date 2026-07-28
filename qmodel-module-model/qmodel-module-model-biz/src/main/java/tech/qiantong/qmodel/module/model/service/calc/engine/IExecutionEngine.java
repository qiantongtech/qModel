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

package tech.qiantong.qmodel.module.model.service.calc.engine;

import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import tech.qiantong.qmodel.module.model.service.calc.dto.ExecutionResult;

/**
 * 执行引擎接口
 *
 * @author qModel
 * @date 2026-07-28
 */
public interface IExecutionEngine {

    /**
     * 执行计算任务
     *
     * @param calc        计算任务配置
     * @param executionNo 执行批次号
     * @return 执行结果
     */
    ExecutionResult execute(ModelCalcDO calc, String executionNo);

    /**
     * 支持的计算类型
     *
     * @return 计算类型编码
     */
    String getCalcType();

}
