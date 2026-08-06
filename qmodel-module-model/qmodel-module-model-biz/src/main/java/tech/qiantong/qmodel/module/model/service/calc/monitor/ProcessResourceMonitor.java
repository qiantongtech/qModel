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

package tech.qiantong.qmodel.module.model.service.calc.monitor;

import com.alibaba.fastjson2.annotation.JSONField;
import com.sun.jna.Pointer;
import lombok.Data;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import oshi.SystemInfo;
import oshi.software.os.OSProcess;
import oshi.software.os.OperatingSystem;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Python 进程资源监控器（基于 OSHI，跨平台高性能）
 * @author qModel
 * @date 2026-07-31
 */
@Slf4j
public class ProcessResourceMonitor {

    /** 采样间隔（毫秒） */
    private final long sampleIntervalMs;

    /** 进程 PID */
    @Getter
    private long pid = -1;

    /** 进程启动时间 */
    private final long startTime;

    /** 采样快照列表 */
    private final List<ResourceSnapshot> snapshots = new ArrayList<>();

    /** 监控运行标志 */
    private final AtomicBoolean running = new AtomicBoolean(false);

    /** 监控线程 */
    private Thread monitorThread;

    /** OSHI 系统信息对象 */
    private final SystemInfo systemInfo;
    private final OperatingSystem os;

    /** 上次采样时的进程对象（用于计算 CPU 负载差值） */
    private OSProcess previousProcessState = null;

    /**
     * 资源快照（单次采样）
     */
    @Data
    public static class ResourceSnapshot {
        /** 采样时间戳 */
        private final long timestamp;
        /** 物理内存（KB） */
        private long memoryKb;
        /** CPU 占用率 (百分比，单核) */
        private double cpuUsagePercent = -1.0;
        /** 累计 CPU 时间（毫秒） */
        private long cumulativeCpuTimeMs = 0;
        /** 进程运行时间（毫秒） */
        private long processUpTimeMs = 0;
        /** 进程是否存活 */
        private boolean alive;

        public ResourceSnapshot(long timestamp) {
            this.timestamp = timestamp;
        }
    }

    /**
     * 进程资源统计结果
     */
    @Data
    public static class ProcessStats {
        @JSONField(name = "进程PID")
        private long pid;

        @JSONField(serialize = false)
        private long startTimeMs;

        @JSONField(serialize = false)
        private long endTimeMs;

        @JSONField(name = "执行时长毫秒")
        private long durationMs;

        @JSONField(serialize = false)
        private double avgCpuUsagePercent;

        @JSONField(serialize = false)
        private double maxCpuUsagePercent;

        @JSONField(serialize = false)
        private long avgMemoryKb;

        @JSONField(serialize = false)
        private long maxMemoryKb;

        @JSONField(name = "采样次数")
        private int sampleCount;

        @JSONField(serialize = false)
        private boolean completedNormally;

        // --- 用于 JSON 序列化的格式化方法 ---

        @JSONField(name = "监控开始时间", format = "yyyy-MM-dd HH:mm:ss")
        public long getStartTimeMsForJson() {
            return startTimeMs;
        }

        @JSONField(name = "监控结束时间", format = "yyyy-MM-dd HH:mm:ss")
        public long getEndTimeMsForJson() {
            return endTimeMs;
        }

        @JSONField(name = "平均CPU使用率")
        public String getAvgCpuUsagePercentFormatted() {
            return String.format("%.2f%%", avgCpuUsagePercent);
        }

        @JSONField(name = "峰值CPU使用率")
        public String getMaxCpuUsagePercentFormatted() {
            return String.format("%.2f%%", maxCpuUsagePercent);
        }

        @JSONField(name = "平均内存使用GB")
        public String getAvgMemoryGb() {
            if (avgMemoryKb <= 0) {
                return "0.00";
            }
            return String.format("%.2f", (double) avgMemoryKb / 1024 / 1024);
        }

        @JSONField(name = "峰值内存使用GB")
        public String getMaxMemoryGb() {
            if (maxMemoryKb <= 0) {
                return "0.00";
            }
            return String.format("%.2f", (double) maxMemoryKb / 1024 / 1024);
        }
    }

    /**
     * 构造函数（使用默认采样间隔 1000ms）
     */
    public ProcessResourceMonitor() {
        this(200);
    }

    /**
     * 构造函数
     *
     * @param sampleIntervalMs 采样间隔（毫秒），最小 200ms
     */
    public ProcessResourceMonitor(long sampleIntervalMs) {
        this.sampleIntervalMs = Math.max(200, sampleIntervalMs);
        this.startTime = System.currentTimeMillis();
        this.systemInfo = new SystemInfo();
        this.os = systemInfo.getOperatingSystem();
    }




    /**
     * 绑定进程并开始监控
     *
     * @param process Python 子进程
     */
    public void startMonitoring(Process process) {
        running.set(true);
        monitorThread = new Thread(() -> {
            this.pid = getProcessId(process);
            if (this.pid <= 0) {
                log.warn("无法获取进程 PID，监控未启动");
                return;
            }

            log.info("开始监控进程 PID={}, 采样间隔={}ms", pid, sampleIntervalMs);

            while (running.get()) {
                try {
                    ResourceSnapshot snapshot = collectMetrics(process);
                    snapshots.add(snapshot);

                    if (!snapshot.isAlive()) {
                        log.info("进程 PID={} 已退出，停止监控", pid);
                        break;
                    }

                    Thread.sleep(sampleIntervalMs);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    break;
                } catch (Exception e) {
                    log.error("采集进程资源指标异常, PID={}", pid, e);
                }
            }

            log.info("停止监控进程 PID={}, 共采集 {} 条快照", pid, snapshots.size());
        }, "python-resource-monitor-" + pid);

        monitorThread.setDaemon(true);
        monitorThread.start();
    }

    /**
     * 停止监控
     */
    public void stopMonitoring() {
        running.set(false);
        if (monitorThread != null && monitorThread.isAlive()) {
            monitorThread.interrupt();
            try {
                monitorThread.join(3000);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    /**
     * 获取监控统计结果
     *
     * @param completedNormally 是否正常完成（超时/异常时为 false）
     * @return 统计结果
     */
    public ProcessStats getStats(boolean completedNormally) {
        ProcessStats stats = new ProcessStats();
        stats.setPid(pid);
        stats.setStartTimeMs(startTime);
        stats.setEndTimeMs(System.currentTimeMillis());
        stats.setDurationMs(stats.getEndTimeMs() - startTime);
        stats.setCompletedNormally(completedNormally);
        stats.setSampleCount(snapshots.size());

        if (snapshots.isEmpty()) {
            return stats;
        }

        long totalMemoryKb = 0;
        long maxMemoryKb = 0;
        double maxCpu = 0;
        double totalCpuPercent = 0;
        int cpuSampleCount = 0;

        long finalCpuTimeMs = 0;
        long finalUpTimeMs = 0;

        for (ResourceSnapshot snap : snapshots) {
            totalMemoryKb += snap.getMemoryKb();
            maxMemoryKb = Math.max(maxMemoryKb, snap.getMemoryKb());

            if (snap.getCpuUsagePercent() >= 0) {
                maxCpu = Math.max(maxCpu, snap.getCpuUsagePercent());
                totalCpuPercent += snap.getCpuUsagePercent();
                cpuSampleCount++;
            }

            if (snap.getCumulativeCpuTimeMs() > 0) {
                finalCpuTimeMs = Math.max(finalCpuTimeMs, snap.getCumulativeCpuTimeMs());
            }
            if (snap.getProcessUpTimeMs() > 0) {
                finalUpTimeMs = Math.max(finalUpTimeMs, snap.getProcessUpTimeMs());
            }
        }

        stats.setAvgMemoryKb(totalMemoryKb / snapshots.size());
        stats.setMaxMemoryKb(maxMemoryKb);
        stats.setMaxCpuUsagePercent(Math.round(maxCpu * 100.0) / 100.0);

        // 优先使用累计 CPU 时间计算精确的平均 CPU 使用率
        if (finalUpTimeMs > 0) {
            double avgCpu = 100.0 * finalCpuTimeMs / finalUpTimeMs;
            stats.setAvgCpuUsagePercent(Math.round(avgCpu * 100.0) / 100.0);
            // 如果仅有 1 次采样，峰值 CPU 也就等于平均 CPU
            if (snapshots.size() == 1) {
                stats.setMaxCpuUsagePercent(stats.getAvgCpuUsagePercent());
            }
        } else {
            double avgCpu = cpuSampleCount > 0 ? totalCpuPercent / cpuSampleCount : 0;
            stats.setAvgCpuUsagePercent(Math.round(avgCpu * 100.0) / 100.0);
        }

        return stats;
    }

    /**
     * 获取所有快照（用于调试或详情展示）
     */
    public List<ResourceSnapshot> getSnapshots() {
        return new ArrayList<>(snapshots);
    }

    /**
     * 获取进程 ID（兼容 Java 8+）
     */
    private long getProcessId(Process process) {
        try {
            Method pidMethod = Process.class.getMethod("pid");
            return (Long) pidMethod.invoke(process);
        } catch (Exception e) {
            try {
                if (process.getClass().getName().equals("java.lang.UNIXProcess")) {
                    Field pidField = process.getClass().getDeclaredField("pid");
                    pidField.setAccessible(true);
                    return pidField.getInt(process);
                }

                if (process.getClass().getName().equals("java.lang.ProcessImpl")) {
                    Field handleField = process.getClass().getDeclaredField("handle");
                    handleField.setAccessible(true);
                    long handle = handleField.getLong(process);

                    Pointer pointer = com.sun.jna.Pointer.createConstant(handle);
                    com.sun.jna.platform.win32.WinNT.HANDLE winHandle = new com.sun.jna.platform.win32.WinNT.HANDLE(pointer);
                    return com.sun.jna.platform.win32.Kernel32.INSTANCE.GetProcessId(winHandle);
                }
            } catch (Exception ex) {
                log.warn("解析进程 PID 失败", ex);
            }
        }
        return -1;
    }

    /**
     * 采集资源指标
     */
    private ResourceSnapshot collectMetrics(Process process) {
        ResourceSnapshot snapshot = new ResourceSnapshot(System.currentTimeMillis());
        snapshot.setAlive(process.isAlive());

        if (!snapshot.isAlive()) {
            return snapshot;
        }

        try {
            OSProcess osProcess = os.getProcess((int) pid);
            if (osProcess != null) {
                // 内存 (Resident Set Size) 单位 Bytes
                long rssBytes = osProcess.getResidentSetSize();
                snapshot.setMemoryKb(rssBytes / 1024);

                // 累计 CPU 时间和运行时间
                snapshot.setCumulativeCpuTimeMs(osProcess.getKernelTime() + osProcess.getUserTime());
                snapshot.setProcessUpTimeMs(osProcess.getUpTime());

                // CPU
                if (previousProcessState != null) {
                    // getProcessCpuLoadBetweenTicks 返回的是 0.0 ~ 1.0 之间的值，乘以 100 得到百分比
                    double cpuLoad = 100d * osProcess.getProcessCpuLoadBetweenTicks(previousProcessState);
                    snapshot.setCpuUsagePercent(cpuLoad);
                }

                // 为了下次计算差值，更新上一次的状态。OSHI 的 OSProcess 需要重新获取或 updateAttributes() 才能拿到最新的 ticks
                osProcess.updateAttributes();
                previousProcessState = osProcess;
            } else {
                log.warn("OSHI getProcess 返回 null，可能进程已退出或无权限读取, PID={}", pid);
            }
        } catch (Exception e) {
            log.warn("使用 OSHI 采集进程指标失败, PID={}: {}", pid, e.getMessage());
        }

        return snapshot;
    }
}
