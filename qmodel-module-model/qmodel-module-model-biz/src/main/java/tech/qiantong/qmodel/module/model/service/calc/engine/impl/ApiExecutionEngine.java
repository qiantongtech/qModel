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

package tech.qiantong.qmodel.module.model.service.calc.engine.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import tech.qiantong.qmodel.module.model.service.calc.dto.ExecutionResult;
import tech.qiantong.qmodel.module.model.service.calc.engine.IExecutionEngine;

/**
 * API接口类型执行引擎
 *
 * @author qModel
 * @date 2026-07-28
 */
@Slf4j
@Component
public class ApiExecutionEngine implements IExecutionEngine {

    @Override
    public ExecutionResult execute(ModelCalcDO calc, String executionNo) {
        log.info("API执行引擎开始执行: calcId={}, executionNo={}", calc.getId(), executionNo);
        long startTime = System.currentTimeMillis();

        ExecutionResult result = new ExecutionResult();
        result.setSuccess(false);
        result.setErrorMessage("API执行引擎暂未实现");
        result.setDuration(System.currentTimeMillis() - startTime);
        result.setExecutionLog("[" + executionNo + "] API执行引擎暂未实现，待接入具体API调用逻辑");

        return result;
    }

    @Override
    public String getCalcType() {
        return "0";
    }

}
