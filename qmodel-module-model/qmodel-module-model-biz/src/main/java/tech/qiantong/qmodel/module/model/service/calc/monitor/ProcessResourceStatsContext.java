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

package tech.qiantong.qmodel.module.model.service.calc.monitor;

/**
 * Python 进程资源统计上下文（ThreadLocal 透传）
 * @author qModel
 * @date 2026-07-31
 */
public class ProcessResourceStatsContext {

    private static final ThreadLocal<ProcessResourceMonitor.ProcessStats> STATS_HOLDER = new ThreadLocal<>();
    private static final ThreadLocal<Boolean> ENABLE_MONITOR_HOLDER = ThreadLocal.withInitial(() -> false);

    private ProcessResourceStatsContext() {
    }

    /**
     * 设置是否开启资源监控
     */
    public static void setEnableMonitor(boolean enable) {
        ENABLE_MONITOR_HOLDER.set(enable);
    }

    /**
     * 判断是否开启资源监控
     */
    public static boolean isEnableMonitor() {
        return ENABLE_MONITOR_HOLDER.get();
    }

    /**
     * 写入本次脚本执行的资源统计结果
     */
    public static void set(ProcessResourceMonitor.ProcessStats stats) {
        if (stats != null) {
            STATS_HOLDER.set(stats);
        }
    }

    /**
     * 读取本次脚本执行的资源统计结果（不删除，需显式 clear）
     */
    public static ProcessResourceMonitor.ProcessStats get() {
        return STATS_HOLDER.get();
    }

    /**
     * 读取并移除（推荐，避免线程池复用导致污染）
     */
    public static ProcessResourceMonitor.ProcessStats getAndClear() {
        ProcessResourceMonitor.ProcessStats stats = STATS_HOLDER.get();
        STATS_HOLDER.remove();
        return stats;
    }

    /**
     * 仅清理统计结果（保留配置，供 runModelScript 初始时调用）
     */
    public static void clearStats() {
        STATS_HOLDER.remove();
    }

    /**
     * 手动清理（防止线程池复用导致的上下文残留）
     */
    public static void clear() {
        STATS_HOLDER.remove();
        ENABLE_MONITOR_HOLDER.remove();
    }
}
