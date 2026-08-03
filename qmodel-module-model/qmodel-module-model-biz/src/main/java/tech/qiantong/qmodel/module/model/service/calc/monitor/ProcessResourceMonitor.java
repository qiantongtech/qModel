
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

import com.alibaba.fastjson2.annotation.JSONField;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Python 进程资源监控器（Java 原生实现，零第三方依赖）
 * @author qModel
 * @date 2026-07-31
 */
@Slf4j
public class ProcessResourceMonitor {

    /** 采样间隔（毫秒） */
    private final long sampleIntervalMs;

    /** 进程 PID
     * -- GETTER --
     *  获取当前绑定的进程 PID（未绑定则返回 -1）
     */
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

    /** 系统类型 */
    private final String osName;

    /** 是否为 Linux 系统 */
    private final boolean isLinux;

    /** CPU 时钟频率（Linux 下每核每秒的 clock ticks 数，通常为 100） */
    private long cpuTicksPerSecond = 100;

    /**
     * 资源快照（单次采样）
     */
    public static class ResourceSnapshot {
        /** 采样时间戳 */
        private final long timestamp;
        /** CPU 累计时间（单位：clock ticks，Linux） */
        private long cpuTotalTicks;
        /** 物理内存（KB） */
        private long memoryKb;
        /** 进程是否存活 */
        private boolean alive;
        /** CPU 用户模式时间 (Windows, 100ns) */
        private long userModeTime;
        /** CPU 内核模式时间 (Windows, 100ns) */
        private long kernelModeTime;

        public ResourceSnapshot(long timestamp) {
            this.timestamp = timestamp;
        }

        public long getTimestamp() {
            return timestamp;
        }

        public long getCpuTotalTicks() {
            return cpuTotalTicks;
        }

        public void setCpuTotalTicks(long cpuTotalTicks) {
            this.cpuTotalTicks = cpuTotalTicks;
        }

        public long getMemoryKb() {
            return memoryKb;
        }

        public void setMemoryKb(long memoryKb) {
            this.memoryKb = memoryKb;
        }

        public boolean isAlive() {
            return alive;
        }

        public void setAlive(boolean alive) {
            this.alive = alive;
        }

        public long getUserModeTime() {
            return userModeTime;
        }

        public void setUserModeTime(long userModeTime) {
            this.userModeTime = userModeTime;
        }

        public long getKernelModeTime() {
            return kernelModeTime;
        }

        public void setKernelModeTime(long kernelModeTime) {
            this.kernelModeTime = kernelModeTime;
        }
    }

    /**
     * 进程资源统计结果
     */
    public static class ProcessStats {
        /** 进程 PID */
        @JSONField(name = "进程PID")
        private long pid;
        /** 监控开始时间（ms） */
        @JSONField(name = "监控开始时间毫秒")
        private long startTimeMs;
        /** 监控结束时间（ms） */
        @JSONField(name = "监控结束时间毫秒")
        private long endTimeMs;
        /** 执行时长（ms） */
        @JSONField(name = "执行时长毫秒")
        private long durationMs;
        /** 平均 CPU 占用率（%，0-100） */
        @JSONField(name = "平均CPU使用率")
        private double avgCpuUsagePercent;
        /** 峰值 CPU 占用率（%） */
        @JSONField(name = "峰值CPU使用率")
        private double maxCpuUsagePercent;
        /** 平均内存使用（KB） */
        @JSONField(name = "平均内存使用KB")
        private long avgMemoryKb;
        /** 峰值内存使用（KB） */
        @JSONField(name = "峰值内存使用KB")
        private long maxMemoryKb;
        /** 采样次数 */
        @JSONField(name = "采样次数")
        private int sampleCount;
        /** 是否正常完成 */
        @JSONField(name = "是否正常完成")
        private boolean completedNormally;

        public long getPid() {
            return pid;
        }

        public void setPid(long pid) {
            this.pid = pid;
        }

        public long getStartTimeMs() {
            return startTimeMs;
        }

        public void setStartTimeMs(long startTimeMs) {
            this.startTimeMs = startTimeMs;
        }

        public long getEndTimeMs() {
            return endTimeMs;
        }

        public void setEndTimeMs(long endTimeMs) {
            this.endTimeMs = endTimeMs;
        }

        public long getDurationMs() {
            return durationMs;
        }

        public void setDurationMs(long durationMs) {
            this.durationMs = durationMs;
        }

        public double getAvgCpuUsagePercent() {
            return avgCpuUsagePercent;
        }

        public void setAvgCpuUsagePercent(double avgCpuUsagePercent) {
            this.avgCpuUsagePercent = avgCpuUsagePercent;
        }

        public double getMaxCpuUsagePercent() {
            return maxCpuUsagePercent;
        }

        public void setMaxCpuUsagePercent(double maxCpuUsagePercent) {
            this.maxCpuUsagePercent = maxCpuUsagePercent;
        }

        public long getAvgMemoryKb() {
            return avgMemoryKb;
        }

        public void setAvgMemoryKb(long avgMemoryKb) {
            this.avgMemoryKb = avgMemoryKb;
        }

        public long getMaxMemoryKb() {
            return maxMemoryKb;
        }

        public void setMaxMemoryKb(long maxMemoryKb) {
            this.maxMemoryKb = maxMemoryKb;
        }

        public int getSampleCount() {
            return sampleCount;
        }

        public void setSampleCount(int sampleCount) {
            this.sampleCount = sampleCount;
        }

        public boolean isCompletedNormally() {
            return completedNormally;
        }

        public void setCompletedNormally(boolean completedNormally) {
            this.completedNormally = completedNormally;
        }
    }

    /**
     * 构造函数（使用默认采样间隔 1000ms）
     */
    public ProcessResourceMonitor() {
        this(1000);
    }

    /**
     * 构造函数
     *
     * @param sampleIntervalMs 采样间隔（毫秒），最小 200ms
     */
    public ProcessResourceMonitor(long sampleIntervalMs) {
        this.sampleIntervalMs = Math.max(200, sampleIntervalMs);
        this.startTime = System.currentTimeMillis();
        this.osName = System.getProperty("os.name", "").toLowerCase();
        this.isLinux = osName.contains("linux");
        initCpuTicks();
    }

    /**
     * 初始化 CPU 时钟频率
     */
    private void initCpuTicks() {
        if (isLinux) {
            try {
                String content = readFile("/proc/cpuinfo");
                if (content != null) {
                    // 获取 CPU 核数，用于计算总 CPU 占用率（保留拓展性）
                    long cores = java.util.Arrays.stream(content.split("\n"))
                            .filter(l -> l.startsWith("processor"))
                            .count();
                    if (cores > 0) {
                        this.cpuTicksPerSecond = 100;
                    }
                }
            } catch (Exception e) {
                log.warn("获取 CPU 核数失败，使用默认值: {}", e.getMessage());
            }
        }
    }

    /**
     * 绑定进程并开始监控
     *
     * @param process Python 子进程
     */
    public void startMonitoring(Process process) {
        this.pid = getProcessId(process);
        if (this.pid <= 0) {
            log.warn("无法获取进程 PID，监控未启动");
            return;
        }

        running.set(true);
        monitorThread = new Thread(() -> {
            log.info("开始监控进程 PID={}, 系统={}, 采样间隔={}ms", pid, osName, sampleIntervalMs);

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

        // 计算内存统计
        long totalMemoryKb = 0;
        long maxMemoryKb = 0;
        for (ResourceSnapshot snap : snapshots) {
            totalMemoryKb += snap.getMemoryKb();
            maxMemoryKb = Math.max(maxMemoryKb, snap.getMemoryKb());
        }
        stats.setAvgMemoryKb(snapshots.size() > 0 ? totalMemoryKb / snapshots.size() : 0);
        stats.setMaxMemoryKb(maxMemoryKb);

        // 计算 CPU 占用率（需要对比两个快照的差值）
        if (snapshots.size() >= 2) {
            if (isLinux) {
                calculateLinuxCpuUsage(stats);
            } else if (osName.contains("win")) {
                calculateWindowsCpuUsage(stats);
            }
        }

        return stats;
    }

    private void calculateLinuxCpuUsage(ProcessStats stats) {
        double maxCpu = 0;
        double totalCpuPercent = 0;
        int cpuSampleCount = 0;

        for (int i = 1; i < snapshots.size(); i++) {
            ResourceSnapshot prev = snapshots.get(i - 1);
            ResourceSnapshot curr = snapshots.get(i);

            long timeDeltaMs = curr.getTimestamp() - prev.getTimestamp();
            long cpuDeltaTicks = curr.getCpuTotalTicks() - prev.getCpuTotalTicks();

            if (timeDeltaMs > 0 && cpuDeltaTicks >= 0) {
                // CPU 占用率 = (cpuDeltaTicks / cpuTicksPerSecond) / (timeDeltaMs / 1000) * 100
                // 单进程视角（单核百分比），未做多核归一化
                double cpuUsage = ((double) cpuDeltaTicks / cpuTicksPerSecond)
                        / ((double) timeDeltaMs / 1000) * 100.0;

                maxCpu = Math.max(maxCpu, cpuUsage);
                totalCpuPercent += cpuUsage;
                cpuSampleCount++;
            }
        }

        stats.setMaxCpuUsagePercent(maxCpu);
        stats.setAvgCpuUsagePercent(cpuSampleCount > 0 ? totalCpuPercent / cpuSampleCount : 0);
    }

    private void calculateWindowsCpuUsage(ProcessStats stats) {
        double maxCpu = 0;
        double totalCpuPercent = 0;
        int cpuSampleCount = 0;
        long numCores = Runtime.getRuntime().availableProcessors();

        for (int i = 1; i < snapshots.size(); i++) {
            ResourceSnapshot prev = snapshots.get(i - 1);
            ResourceSnapshot curr = snapshots.get(i);

            long timeDeltaMs = curr.getTimestamp() - prev.getTimestamp();
            long kernelDelta = curr.getKernelModeTime() - prev.getKernelModeTime();
            long userDelta = curr.getUserModeTime() - prev.getUserModeTime();

            if (timeDeltaMs > 0 && kernelDelta >= 0 && userDelta >= 0) {
                // Windows CPU 时间单位是 100ns
                long totalCpuTime100ns = kernelDelta + userDelta;
                // CPU 占用率 = (CPU 时间增量 / 时间增量) / CPU核心数
                double cpuUsage = ((double) totalCpuTime100ns / (timeDeltaMs * 10000.0)) * 100.0 / numCores;

                maxCpu = Math.max(maxCpu, cpuUsage);
                totalCpuPercent += cpuUsage;
                cpuSampleCount++;
            }
        }

        stats.setMaxCpuUsagePercent(maxCpu);
        stats.setAvgCpuUsagePercent(cpuSampleCount > 0 ? totalCpuPercent / cpuSampleCount : 0);
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
        // 方法1：Java 9+ 原生 API (通过反射调用，避免 Java 8 编译报错)
        try {
            Method pidMethod = Process.class.getMethod("pid");
            return (Long) pidMethod.invoke(process);
        } catch (Exception e) {
            // 方法2：反射兼容 Java 8
            try {
                // Linux/Mac 下 Java 8 的实现类是 UNIXProcess，包含 pid 字段
                if (process.getClass().getName().equals("java.lang.UNIXProcess")) {
                    java.lang.reflect.Field pidField = process.getClass().getDeclaredField("pid");
                    pidField.setAccessible(true);
                    return pidField.getInt(process);
                }

                // Windows 下 Java 8 的特殊处理：尝试通过 wmic 获取子进程 PID
                if (osName.contains("win")) {
                    long javaPid = getCurrentJavaProcessId();
                    if (javaPid > 0) {
                        // 使用 wmic 查询子进程
                        // wmic process where "ParentProcessId=javaPid and name='python.exe'" get ProcessId
                        String command = "wmic process where \"ParentProcessId=" + javaPid + "\" get ProcessId,CommandLine /value";
                        String output = executeCommand(new String[]{"cmd", "/c", command});
                        if (output != null && !output.isEmpty()) {
                            // 示例输出:
                            // CommandLine="C:\Python\python.exe" "your_script.py"
                            // ProcessId=1234
                            for (String line : output.split(System.lineSeparator())) {
                                if (line.startsWith("CommandLine=") && line.toLowerCase().contains("python")) {
                                    String pidLine = output.substring(output.indexOf("ProcessId=", line.indexOf("CommandLine=")) + "ProcessId=".length());
                                    pidLine = pidLine.substring(0, pidLine.indexOf(System.lineSeparator()));
                                    return Long.parseLong(pidLine.trim());
                                }
                            }
                        }
                    }
                }

                // 通用兜底反射 (针对某些特定 JDK 可能有用)
                Method method = Process.class.getDeclaredMethod("pid");
                method.setAccessible(true);
                return (Long) method.invoke(process);
            } catch (Exception ex) {
                // 方法3：通过 toString() 解析（最后兜底）
                // 尝试解析 Windows/Java 8 默认没有 pid 方法也没有暴露出简单字段的问题
                return parsePidFromProcessString(process);
            }
        }
    }

    /**
     * 获取当前 Java 进程的 PID
     */
    private long getCurrentJavaProcessId() {
        String jvmName = ManagementFactory.getRuntimeMXBean().getName();
        int index = jvmName.indexOf('@');
        if (index > 0) {
            try {
                return Long.parseLong(jvmName.substring(0, index));
            } catch (NumberFormatException e) {
                log.warn("解析当前 Java 进程 PID 失败: {}", e.getMessage());
            }
        }
        return -1;
    }

    /**
     * 从 Process.toString() 解析 PID（Java 8 兜底方案）
     */
    private long parsePidFromProcessString(Process process) {
        try {
            String str = process.toString();
            // 格式：Process[pid=12345, ...]
            int start = str.indexOf("pid=");
            if (start >= 0) {
                start += 4;
                int end = str.indexOf(',', start);
                if (end > start) {
                    return Long.parseLong(str.substring(start, end).trim());
                }
            }

            // 如果是 Windows Java 8 的 ProcessImpl，尝试利用反射获取系统句柄并解析（非常黑科技，但 Windows Java 8 只有这种办法）
            if (process.getClass().getName().equals("java.lang.ProcessImpl")) {
                try {
                    java.lang.reflect.Field handleField = process.getClass().getDeclaredField("handle");
                    handleField.setAccessible(true);
                    long handle = handleField.getLong(process);

                    // 利用 JNA 或 Kernel32 来根据 handle 获取 PID，但这里不能引入第三方依赖
                    // 我们尝试使用 Windows 自带的命令或只返回-1，这里直接放弃，因为不引入JNA极难根据handle拿PID
                } catch (Exception ignore) {
                }
            }

        } catch (Exception e) {
            log.warn("解析进程 PID 失败: {}", e.getMessage());
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

        if (isLinux) {
            collectLinuxMetrics(snapshot);
        } else if (osName.contains("win")) {
            collectWindowsMetrics(snapshot);
        }

        return snapshot;
    }

    /**
     * Linux 下采集指标
     */
    private void collectLinuxMetrics(ResourceSnapshot snapshot) {
        try {
            // 1. 读取 /proc/{pid}/stat 获取 CPU 时间
            String statContent = readFile("/proc/" + pid + "/stat");
            if (statContent != null && !statContent.isEmpty()) {
                // stat 格式（括号外的部分）: pid (comm) state ppid pgrp session tty_nr tpgid
                //   minflt cminflt majflt cmajflt utime stime cutime cstime ...
                String content = statContent;
                int rparen = content.lastIndexOf(')');
                if (rparen >= 0) {
                    // 提取 comm 之后的部分
                    String afterComm = content.substring(rparen + 2).trim();
                    String[] fields = afterComm.split("\\s+");
                    // fields[11] = utime (用户态时间)
                    // fields[12] = stime (内核态时间)
                    if (fields.length >= 13) {
                        long utime = Long.parseLong(fields[11]);
                        long stime = Long.parseLong(fields[12]);
                        snapshot.setCpuTotalTicks(utime + stime);
                    }
                }
            }

            // 2. 读取 /proc/{pid}/status 获取内存
            String statusContent = readFile("/proc/" + pid + "/status");
            if (statusContent != null) {
                for (String line : statusContent.split("\n")) {
                    if (line.startsWith("VmRSS:")) {
                        // VmRSS:  单位 KB
                        String[] parts = line.split("\\s+");
                        if (parts.length >= 2) {
                            snapshot.setMemoryKb(Long.parseLong(parts[1]));
                        }
                        break;
                    }
                }
            }
        } catch (Exception e) {
            log.debug("采集 Linux 进程指标失败, PID={}: {}", pid, e.getMessage());
        }
    }

    /**
     * Windows 下采集指标（通过 wmic 命令）
     */
    private void collectWindowsMetrics(ResourceSnapshot snapshot) {
        try {
            // 1. 使用 wmic 获取内存和 CPU 时间
            String command = "wmic path Win32_PerfRawData_PerfProc_Process where IDProcess=" + pid + " get WorkingSet,KernelModeTime,UserModeTime /value";
            String output = executeCommand(new String[]{"cmd", "/c", command});

            if (output != null && !output.isEmpty()) {
                long memoryKb = -1;
                long kernelTime = -1;
                long userTime = -1;

                for (String line : output.split(System.lineSeparator())) {
                    if (line.startsWith("KernelModeTime=")) {
                        kernelTime = Long.parseLong(line.substring("KernelModeTime=".length()).trim());
                    } else if (line.startsWith("UserModeTime=")) {
                        userTime = Long.parseLong(line.substring("UserModeTime=".length()).trim());
                    } else if (line.startsWith("WorkingSet=")) {
                        // WorkingSet 单位是 Bytes
                        long workingSetBytes = Long.parseLong(line.substring("WorkingSet=".length()).trim());
                        memoryKb = workingSetBytes / 1024;
                    }
                }

                if (memoryKb != -1) {
                    snapshot.setMemoryKb(memoryKb);
                }
                if (kernelTime != -1) {
                    snapshot.setKernelModeTime(kernelTime);
                }
                if (userTime != -1) {
                    snapshot.setUserModeTime(userTime);
                }
            }
        } catch (Exception e) {
            log.debug("采集 Windows 进程指标失败, PID={}: {}", pid, e.getMessage());
        }
    }

    /**
     * 读取文件内容
     */
    private String readFile(String path) {
        try {
            return new String(Files.readAllBytes(Paths.get(path)));
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 执行 shell 命令并获取输出
     */
    private String executeCommand(String[] command) {
        StringBuilder output = new StringBuilder();
        try {
            ProcessBuilder pb = new ProcessBuilder(command);
            pb.redirectErrorStream(true);
            Process proc = pb.start();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream(), "GBK"))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    output.append(line).append(System.lineSeparator());
                }
            }
            proc.waitFor();
        } catch (Exception e) {
            log.warn("执行命令失败: {}", String.join(" ", command), e);
        }
        return output.toString();
    }
}
