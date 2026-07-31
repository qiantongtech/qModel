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
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcExecuteContext;
import tech.qiantong.qmodel.module.model.service.calc.dto.ExecutionResult;

import java.util.ArrayList;
import java.util.List;

/**
 * 执行引擎接口。
 * <p>
 * 结构说明：
 * <ul>
 *   <li>{@link #execute(ModelCalcDO, String)} / {@link #execute(CalcExecuteContext)} 是对外统一入口，
 *       使用接口 default 方法实现「计时 + 日志缓冲 + 异常兜底 + finally 拼 duration/executionLog」，
 *       每个具体引擎不用重复写这一套 try/finally。</li>
 *   <li>具体引擎（API / Python / 未来扩展）只需实现
 *       {@link #doExecute(CalcExecuteContext, List, ExecutionResult)} 这一个方法，
 *       专注「拿到参数 → 调用外部服务/脚本 → 把结果写回 result / 往 logBuffer 加日志」的核心业务逻辑。</li>
 *   <li>引擎入口统一用 {@link CalcExecuteContext} 对象传参，避免方法签名上堆一串 (calc, executionNo, modelId, timeout)。</li>
 * </ul>
 * </p>
 *
 * @author qModel
 * @date 2026-07-31
 */
public interface IExecutionEngine {

    /**
     * 执行计算任务（对外入口 1：兼容旧的 DO + executionNo 传参）。
     *
     * @param calc        计算任务配置
     * @param executionNo 执行批次号
     * @return 执行结果
     */
    default ExecutionResult execute(ModelCalcDO calc, String executionNo) {
        return execute(CalcExecuteContext.of(calc, executionNo));
    }

    /**
     * 执行计算任务（对外入口 2：推荐用上下文对象传参）。
     * <p>
     * 这是接口层的「公共模板方法」：统一处理日志 buffer 初始化、开始/结束计时、
     * 异常兜底（成功/失败结果）、finally 中把 duration + executionLog 回填到 result。
     * 具体引擎通过 {@link #doExecute} 写真正的业务调用。
     * </p>
     *
     * @param ctx 执行上下文（含 calcId / modelId / calcType / executionNo / inputParamsJson / timeout 等）
     * @return 执行结果（永远非 null，success/output/error/duration/log 都已填好）
     */
    default ExecutionResult execute(CalcExecuteContext ctx) {
        ExecutionResult result = new ExecutionResult();
        List<String> logBuffer = new ArrayList<>();
        long startTime = System.currentTimeMillis();
        try {
            logBuffer.add("[" + safe(ctx.getExecutionNo()) + "] 开始执行任务，calcId="
                    + (ctx.getCalcId() == null ? "null" : ctx.getCalcId())
                    + ", modelId=" + (ctx.getModelId() == null ? "null" : ctx.getModelId())
                    + ", engine=" + getClass().getSimpleName());
            doExecute(ctx, logBuffer, result);

            // doExecute 里没有显式 setSuccess 的话，默认视为成功（但 output 为 null 时警告一下）
            if (result.getSuccess() == null) {
                result.setSuccess(result.getErrorMessage() == null);
            }
        } catch (Exception e) {
            result.setSuccess(false);
            String errMsg = (e.getMessage() != null)
                    ? e.getClass().getSimpleName() + ": " + e.getMessage()
                    : e.getClass().getSimpleName();
            if (result.getErrorMessage() == null) {
                result.setErrorMessage(errMsg);
            }
            logBuffer.add("执行异常：" + errMsg);
            // 把异常堆栈前几行追加到日志（便于排查，又不把日志撑爆）
            Throwable cause = e.getCause() != null ? e.getCause() : e;
            if (cause != null && cause.getStackTrace() != null && cause.getStackTrace().length > 0) {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < Math.min(8, cause.getStackTrace().length); i++) {
                    sb.append("\n    at ").append(cause.getStackTrace()[i].toString());
                }
                logBuffer.add("异常堆栈：" + sb);
            }
        } finally {
            long duration = System.currentTimeMillis() - startTime;
            if (result.getDuration() == null || result.getDuration() == 0L) {
                result.setDuration(duration);
            }
            if (result.getExecutionLog() == null) {
                result.setExecutionLog(String.join("\n", logBuffer));
            }
        }
        return result;
    }

    /**
     * 引擎具体业务逻辑（留给各实现类覆盖）。
     * <p>
     * 实现要点：
     * <ol>
     *   <li>从 {@code ctx} 取参数（calcId/modelId/executionNo/inputParamsJson/timeout）；</li>
     *   <li>向 {@code logBuffer} 追加结构化日志（会被 finally 合并写入 result.executionLog）；</li>
     *   <li>把执行结果写入 {@code result}：
     *       <ul>
     *         <li>成功：{@code result.setSuccess(true); result.setOutput(outputStr);}</li>
     *         <li>失败：{@code result.setSuccess(false); result.setErrorMessage(errMsg);}</li>
     *       </ul>
     *   </li>
     *   <li>不要在实现里自己 try/finally 计时/拼 executionLog —— 这些交给接口 default 方法统一做。</li>
     * </ol>
     * </p>
     *
     * @param ctx       执行上下文（对象传参，不再散列多个参数）
     * @param logBuffer 日志缓冲（直接 add 即可）
     * @param result    执行结果承载对象（直接 setXxx 即可）
     * @throws Exception 抛出任意异常都会被 default execute() 兜底成失败结果
     */
    void doExecute(CalcExecuteContext ctx, List<String> logBuffer, ExecutionResult result) throws Exception;

    /**
     * 支持的计算类型（和 ModelCalcDO.calcType 对应）。
     *
     * @return 0-API接口, 1-Python本地, ...
     */
    String getCalcType();

    static String safe(String s) {
        return s == null ? "" : s;
    }
}
