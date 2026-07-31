/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *
 * This file is part of qModel Module Platform (Open Source Edition).
 *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel Module for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *
 * White-label use, OEM distribution, rebranding, or presenting qModel Module as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.service.calc.dto;

import lombok.Data;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;

/**
 * 执行引擎的一次调用上下文（对象传参统一入口）。
 * <p>
 * 把原来散落在各引擎里「从 calc 取字段 / 取 executionNo / 拼日志前缀」的重复逻辑集中在这里，
 * 调用端用 {@link #of(ModelCalcDO, String)} 一次性构造，引擎内部只用 getXxx() 取值即可。
 * </p>
 *
 * @author qModel
 * @date 2026-07-31
 */
@Data
public class CalcExecuteContext {

    /** 原始计算任务配置（引擎特殊场景下可以直接读完整字段） */
    private ModelCalcDO calc;

    /** 计算任务ID（等价于 calc.id） */
    private Long calcId;

    /** 模型ID（等价于 calc.modelId） */
    private Long modelId;

    /** 接入方式：0-API接口, 1-Python本地（等价于 calc.calcType） */
    private Integer calcType;

    /** 执行批次号，用于标记本次执行（落 execution 表 + 打日志） */
    private String executionNo;

    /** 原始 inputParams JSON 字符串（等价于 calc.inputParams） */
    private String inputParamsJson;

    /** 超时秒数（优先取 calc.timeoutSeconds；为 null 时引擎内部会回退到模型配置默认值） */
    private Long timeoutSeconds;

    public static CalcExecuteContext of(ModelCalcDO calc, String executionNo) {
        CalcExecuteContext ctx = new CalcExecuteContext();
        ctx.setCalc(calc);
        if (calc != null) {
            ctx.setCalcId(calc.getId());
            ctx.setModelId(calc.getModelId());
            ctx.setCalcType(calc.getCalcType());
            ctx.setInputParamsJson(calc.getInputParams());
            ctx.setTimeoutSeconds(calc.getTimeoutSeconds());
        }
        ctx.setExecutionNo(executionNo);
        return ctx;
    }
}
