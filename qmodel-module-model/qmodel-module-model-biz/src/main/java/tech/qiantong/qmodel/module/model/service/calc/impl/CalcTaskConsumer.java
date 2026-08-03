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

package tech.qiantong.qmodel.module.model.service.calc.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcExecution.ModelCalcExecutionDO;
import tech.qiantong.qmodel.module.model.service.calc.ICalcQueueService;
import tech.qiantong.qmodel.module.model.service.calc.IModelCalcService;
import tech.qiantong.qmodel.module.model.service.calc.dto.ExecutionResult;
import tech.qiantong.qmodel.module.model.service.calc.dto.QueueTask;
import tech.qiantong.qmodel.module.model.service.calc.engine.ExecutionEngineFactory;
import tech.qiantong.qmodel.module.model.service.calc.engine.IExecutionEngine;
import tech.qiantong.qmodel.module.model.service.calcExecution.IModelCalcExecutionService;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 计算任务消费者
 *
 * @author qModel
 * @date 2026-07-28
 */
@Slf4j
@Component
@Order(1)
public class CalcTaskConsumer implements ApplicationRunner {

    @Resource
    private ICalcQueueService calcQueueService;

    @Resource
    private IModelCalcService modelCalcService;

    @Resource
    private IModelCalcExecutionService executionService;

    @Resource
    private ExecutionEngineFactory executionEngineFactory;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    private volatile boolean running = false;

    @Override
    public void run(ApplicationArguments args) {
        startConsuming();
    }

    /**
     * 启动任务消费线程
     */
    public void startConsuming() {
        if (running) {
            log.warn("任务消费者已在运行中");
            return;
        }
        running = true;
        log.info("计算任务消费者启动");

        Thread consumerThread = new Thread(() -> {
            while (running && !Thread.currentThread().isInterrupted()) {
                try {
                    QueueTask task = calcQueueService.dequeue();

                    if (task == null) {
                        Thread.sleep(1000);
                        continue;
                    }

                    executeTask(task);

                } catch (InterruptedException e) {
                    log.info("任务消费者被中断");
                    Thread.currentThread().interrupt();
                    break;
                } catch (Exception e) {
                    log.error("任务消费异常", e);
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        break;
                    }
                }
            }

            running = false;
            log.info("计算任务消费者停止");
        }, "calc-task-consumer");
        consumerThread.setDaemon(true);
        consumerThread.start();
    }

    /**
     * 执行单个任务
     */
    private void executeTask(QueueTask task) {
        log.info("开始执行任务: taskId={}, calcId={}, executionNo={}",
                task.getTaskId(), task.getCalcId(), task.getExecutionNo());

        executionService.updateStatusByExecutionNo(task.getExecutionNo(), 1);

        ModelCalcExecutionDO execution = executionService.getByExecutionNo(task.getExecutionNo());
        Date startTimeObj = new Date();
        if (execution != null) {
            ModelCalcExecutionDO updateObj = new ModelCalcExecutionDO();
            updateObj.setId(execution.getId());
            updateObj.setStartTime(startTimeObj);
            executionService.updateById(updateObj);
        }
        // ============ 同步主表：开始执行 → status=1 + startTime ============
        ModelCalcSaveReqVO infoVO = new ModelCalcSaveReqVO();
        infoVO.setId(task.getCalcId());
        infoVO.setStatus(1);
        infoVO.setStartTime(startTimeObj);
        modelCalcService.updateCalcExecutionInfo(infoVO);
        // ===============================================================

        long startTime = System.currentTimeMillis();

        try {
            ModelCalcDO calc = modelCalcService.getModelCalcById(task.getCalcId());
            if (calc == null) {
                throw new RuntimeException("计算任务不存在: " + task.getCalcId());
            }

            IExecutionEngine engine = executionEngineFactory.getEngine(calc.getCalcType());
            ExecutionResult result = engine.execute(calc, task.getExecutionNo());

            long duration = System.currentTimeMillis() - startTime;
            result.setDuration(duration);

            int execStatus = result.getSuccess() ? 2 : 3;
            executionService.updateExecutionResult(
                    task.getExecutionNo(),
                    execStatus,
                    result.getOutput(),
                    result.getErrorMessage(),
                    duration,
                    result.getResourceStatsJson()
            );

            if (result.getExecutionLog() != null) {
                executionService.updateExecutionLog(task.getExecutionNo(), result.getExecutionLog());
            }

            // ============ 同步主表：结束 → status / outputResult / endTime / duration / errorMessage ============
            Date endTimeObj = new Date();
            ModelCalcSaveReqVO endVO = new ModelCalcSaveReqVO();
            endVO.setId(task.getCalcId());
            endVO.setStatus(execStatus);
            endVO.setOutputResult(result.getOutput() != null ? result.getOutput() : "");
            endVO.setEndTime(endTimeObj);
            endVO.setDuration(duration);
            endVO.setErrorMessage(result.getSuccess() ? ""
                    : (result.getErrorMessage() != null ? result.getErrorMessage() : ""));
            modelCalcService.updateCalcExecutionInfo(endVO);
            // ===========================================================================================

            log.info("任务执行完成: taskId={}, success={}, duration={}ms",
                    task.getTaskId(), result.getSuccess(), duration);

        } catch (Exception e) {
            long duration = System.currentTimeMillis() - startTime;
            log.error("任务执行失败: taskId={}, executionNo={}", task.getTaskId(), task.getExecutionNo(), e);

            executionService.updateExecutionResult(
                    task.getExecutionNo(),
                    3,
                    null,
                    e.getMessage(),
                    duration,
                    null
            );

            Date endTimeObj = new Date();
            String errorMsg = e.getMessage() != null ? e.getMessage() : e.getClass().getSimpleName();
            // ============ 先把失败信息写到主表（先不改 status，handleRetry 内部再决定 5 / 3） ============
            ModelCalcSaveReqVO failVO = new ModelCalcSaveReqVO();
            failVO.setId(task.getCalcId());
            failVO.setEndTime(endTimeObj);
            failVO.setDuration(duration);
            failVO.setErrorMessage(errorMsg);
            modelCalcService.updateCalcExecutionInfo(failVO);
            // =======================================================================================

            handleRetry(task);
        }
    }

    /**
     * 处理重试逻辑
     */
    private void handleRetry(QueueTask task) {
        try {
            ModelCalcExecutionDO execution = executionService.getByExecutionNo(task.getExecutionNo());
            if (execution == null) {
                // 至少保证主任务状态不悬空：失败
                Date endTimeObj = new Date();
                ModelCalcSaveReqVO infoVO = new ModelCalcSaveReqVO();
                infoVO.setId(task.getCalcId());
                infoVO.setStatus(3);
                infoVO.setEndTime(endTimeObj);
                infoVO.setErrorMessage("执行记录不存在");
                modelCalcService.updateCalcExecutionInfo(infoVO);
                return;
            }

            int retryCount = execution.getRetryCount() != null ? execution.getRetryCount().intValue() : 0;
            ModelCalcDO calc = modelCalcService.getModelCalcById(task.getCalcId());
            int maxRetryCount = calc != null && calc.getMaxRetryCount() != null
                    ? calc.getMaxRetryCount().intValue() : 3;

            if (retryCount < maxRetryCount) {
                long delayMs = (long) Math.pow(2, retryCount) * 60 * 1000;

                executionService.incrementRetryCount(task.getExecutionNo());

                long timestamp = (System.currentTimeMillis() + delayMs) / 1000;
                double score = timestamp * 10 + (4 - task.getPriority());

                Map<String, String> taskInfo = new HashMap<>();
                taskInfo.put("calcId", task.getCalcId().toString());
                taskInfo.put("priority", task.getPriority().toString());
                taskInfo.put("executionNo", task.getExecutionNo());
                taskInfo.put("createdAt", String.valueOf(System.currentTimeMillis()));

                String retryTaskId = task.getTaskId() + "_retry_" + (retryCount + 1);
                stringRedisTemplate.opsForZSet().add(ICalcQueueService.QUEUE_KEY, retryTaskId, score);
                stringRedisTemplate.opsForHash().putAll(ICalcQueueService.TASK_PREFIX + retryTaskId, taskInfo);

                ModelCalcExecutionDO updateMode = new ModelCalcExecutionDO();
                updateMode.setId(execution.getId());
                updateMode.setExecutionMode(3);
                executionService.updateById(updateMode);

                executionService.updateStatusByExecutionNo(task.getExecutionNo(), 5);
                // ============ 同步主表：重新排队 → status=5，错误信息保留（方便追溯上一次失败原因） ============
                ModelCalcSaveReqVO infoVO = new ModelCalcSaveReqVO();
                infoVO.setId(task.getCalcId());
                infoVO.setStatus(5);
                modelCalcService.updateCalcExecutionInfo(infoVO);
                // =======================================================================================

                log.info("任务重试入队: taskId={}, retryCount={}, delay={}ms",
                        retryTaskId, retryCount + 1, delayMs);
            } else {
                calcQueueService.moveToDeadQueue(task);
                executionService.updateStatusByExecutionNo(task.getExecutionNo(), 3);
                // ============ 所有重试都失败：主任务置失败 + endTime/duration ============
                Date endTimeObj = new Date();
                Long duration = null;
                if (execution.getStartTime() != null) {
                    duration = Math.max(0L, endTimeObj.getTime() - execution.getStartTime().getTime());
                } else if (execution.getDuration() != null) {
                    duration = execution.getDuration();
                }
                ModelCalcSaveReqVO infoVO = new ModelCalcSaveReqVO();
                infoVO.setId(task.getCalcId());
                infoVO.setStatus(3);
                infoVO.setEndTime(endTimeObj);
                if (duration != null) {
                    infoVO.setDuration(duration);
                }
                modelCalcService.updateCalcExecutionInfo(infoVO);
                // =========================================================================
                log.warn("任务移入死信队列: taskId={}, retryCount={}", task.getTaskId(), retryCount);
            }
        } catch (Exception e) {
            log.error("重试处理失败: executionNo={}", task.getExecutionNo(), e);
            // 兜底：失败
            Date endTimeObj = new Date();
            ModelCalcSaveReqVO infoVO = new ModelCalcSaveReqVO();
            infoVO.setId(task.getCalcId());
            infoVO.setStatus(3);
            infoVO.setEndTime(endTimeObj);
            infoVO.setErrorMessage(e.getMessage() != null ? e.getMessage() : e.getClass().getSimpleName());
            modelCalcService.updateCalcExecutionInfo(infoVO);
        }
    }

    /**
     * 停止消费者
     */
    public void stop() {
        running = false;
    }

}
