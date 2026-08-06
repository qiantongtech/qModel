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

package tech.qiantong.qmodel.module.model.service.calc.engine.impl;

import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcExecuteContext;
import tech.qiantong.qmodel.module.model.service.calc.dto.ExecutionResult;
import tech.qiantong.qmodel.module.model.service.calc.engine.IExecutionEngine;
import tech.qiantong.qmodel.module.model.service.calc.monitor.ProcessResourceMonitor;
import tech.qiantong.qmodel.module.model.service.calc.monitor.ProcessResourceStatsContext;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Python本地类型执行引擎
 *
 * @author qModel
 * @date 2026-07-31
 */
@Slf4j
@Component
public class PythonExecutionEngine implements IExecutionEngine {

    @Resource
    private IModelFileResourceService modelFileResourceService;

    @Override
    public void doExecute(CalcExecuteContext ctx, List<String> logBuffer, ExecutionResult result) throws Exception {
        log.info("Python执行引擎开始执行: calcId={}, modelId={}, executionNo={}",
                ctx.getCalcId(), ctx.getModelId(), ctx.getExecutionNo());

        Map<String, Object> inputParam = ApiExecutionEngine.parseInputParamsToMap(ctx.getInputParamsJson());
        logBuffer.add("输入参数解析完成，共 " + inputParam.size() + " 个字段：" + JSON.toJSONString(inputParam));

        long overallStart = System.currentTimeMillis();
        try {

            ProcessResourceStatsContext.setEnableMonitor(true);

            // 调用 runModelScript —— 内部已包含：脚本路径检查、构建状态校验、

            Object scriptResult = modelFileResourceService.runModelScript(ctx.getModelId(), inputParam);

            ProcessResourceMonitor.ProcessStats stats = ProcessResourceStatsContext.getAndClear();
            if (stats != null || ProcessResourceStatsContext.isEnableMonitor()) {
                applyResourceStats(result, logBuffer, stats);
            }

            // 结果规整：null→"", String→原样, 其他→JSON 序列化
            String outputStr;
            if (scriptResult == null) {
                outputStr = "";
            } else if (scriptResult instanceof String) {
                outputStr = (String) scriptResult;
            } else {
                outputStr = JSON.toJSONString(scriptResult);
            }

            result.setSuccess(true);
            result.setOutput(outputStr);
            result.setDuration(System.currentTimeMillis() - overallStart);

            logBuffer.add("Python 脚本执行成功，结果长度：" + (outputStr == null ? 0 : outputStr.length()));
            if (StringUtils.isNotBlank(outputStr)) {
                int previewLen = Math.min(512, outputStr.length());
                logBuffer.add("结果预览：" + outputStr.substring(0, previewLen)
                        + (previewLen < outputStr.length() ? "..." : ""));
            }
            log.info("Python执行引擎执行成功: calcId={}, executionNo={}", ctx.getCalcId(), ctx.getExecutionNo());
        } catch (Exception e) {
            // 异常分支也要读取 ThreadLocal 里的监控数据
            try {
                ProcessResourceMonitor.ProcessStats stats = ProcessResourceStatsContext.getAndClear();
                if (stats != null || ProcessResourceStatsContext.isEnableMonitor()) {
                    applyResourceStats(result, logBuffer, stats);
                }
            } catch (Exception ex) {
                log.warn("异常分支读取资源统计失败: {}", ex.getMessage());
            }

            result.setSuccess(false);
            result.setDuration(System.currentTimeMillis() - overallStart);
            String errMsg = (e instanceof ServiceException
                    ? e.getMessage()
                    : (e.getClass().getSimpleName() + ": " + e.getMessage()));
            result.setErrorMessage(errMsg);
            logBuffer.add("执行异常：" + errMsg);
            log.error("Python执行引擎执行异常: calcId={}, executionNo={}", ctx.getCalcId(), ctx.getExecutionNo(), e);
            throw e;
        } finally {
            // 兜底清理：防止线程池复用导致 stats 泄漏到下一次执行
            ProcessResourceStatsContext.clear();
        }
    }

    /**
     * 把 ProcessStats 写入 ExecutionResult，并追加到 logBuffer
     */
    private void applyResourceStats(ExecutionResult result, List<String> logBuffer,
                                    ProcessResourceMonitor.ProcessStats stats) {
        if (stats == null) {
            // logBuffer.add("资源监控：未采集到监控数据（可能PID获取失败或进程立即退出）");
            return;
        }

        result.setProcessPid(stats.getPid() > 0 ? stats.getPid() : null);
        result.setAvgCpuUsagePercent(stats.getAvgCpuUsagePercent());
        result.setMaxCpuUsagePercent(stats.getMaxCpuUsagePercent());
        result.setAvgMemoryKb(stats.getAvgMemoryKb());
        result.setMaxMemoryKb(stats.getMaxMemoryKb());
        result.setResourceSampleCount(stats.getSampleCount());

        try {
            result.setResourceStatsJson(JSON.toJSONString(stats));
        } catch (Exception e) {
            log.warn("序列化资源统计JSON失败: {}", e.getMessage());
        }

        // 日志中不再输出资源监控信息
        
        StringBuilder sb = new StringBuilder(256);
        sb.append("进程资源监控：PID=").append(stats.getPid() > 0 ? stats.getPid() : "N/A")
                .append("，采样次数=").append(stats.getSampleCount())
                .append("，监控耗时=").append(stats.getDurationMs()).append("ms")
                .append("，平均CPU=").append(String.format("%.2f", stats.getAvgCpuUsagePercent())).append("%")
                .append("，峰值CPU=").append(String.format("%.2f", stats.getMaxCpuUsagePercent())).append("%")
                .append("，平均内存=").append(formatKbToHuman(stats.getAvgMemoryKb()))
                .append("，峰值内存=").append(formatKbToHuman(stats.getMaxMemoryKb()))
                .append("，完成状态=").append(stats.isCompletedNormally() ? "正常" : "异常");
        logBuffer.add(sb.toString());
        
    }

    /**
     * KB → 人类可读字符串（KB / MB / GB）
     */
    private static String formatKbToHuman(long kb) {
        if (kb <= 0) {
            return "0KB";
        }
        if (kb < 1024) {
            return kb + "KB";
        }
        double mb = (double) kb / 1024;
        if (mb < 1024) {
            return String.format("%.2fMB", mb);
        }
        double gb = mb / 1024;
        return String.format("%.2fGB", gb);
    }

    @Override
    public String getCalcType() {
        return "1";
    }
}
