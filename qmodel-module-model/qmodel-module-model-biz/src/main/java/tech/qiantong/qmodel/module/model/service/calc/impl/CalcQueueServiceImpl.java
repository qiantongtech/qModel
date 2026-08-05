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

package tech.qiantong.qmodel.module.model.service.calc.impl;

import cn.hutool.core.date.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.module.model.service.calc.ICalcQueueService;
import tech.qiantong.qmodel.module.model.service.calc.dto.QueueTask;

import javax.annotation.Resource;
import java.util.*;

/**
 * 计算任务队列服务实现类（基于Redis ZSet优先级队列）
 *
 * @author qModel
 * @date 2026-07-28
 */
@Slf4j
@Service
public class CalcQueueServiceImpl implements ICalcQueueService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public String enqueue(Long calcId, Integer priority, String executionNo) {
        String taskId = "TASK_" + DateUtil.date().getTime() + "_" + calcId;

        long timestamp = System.currentTimeMillis() / 1000;
        double score = timestamp * 10 + (4 - priority);

        try {
            stringRedisTemplate.opsForZSet().add(QUEUE_KEY, taskId, score);

            Map<String, String> taskInfo = new HashMap<>();
            taskInfo.put("calcId", calcId.toString());
            taskInfo.put("priority", priority.toString());
            taskInfo.put("executionNo", executionNo);
            taskInfo.put("createdAt", String.valueOf(System.currentTimeMillis()));
            stringRedisTemplate.opsForHash().putAll(TASK_PREFIX + taskId, taskInfo);

            log.info("任务入队成功: taskId={}, calcId={}, priority={}, executionNo={}",
                    taskId, calcId, priority, executionNo);

            return taskId;
        } catch (Exception e) {
            log.error("任务入队失败: calcId={}", calcId, e);
            throw new RuntimeException("任务入队失败", e);
        }
    }

    @Override
    public QueueTask dequeue() {
        try {
            Set<String> tasks = stringRedisTemplate.opsForZSet()
                    .reverseRange(QUEUE_KEY, 0, 0);

            if (tasks == null || tasks.isEmpty()) {
                return null;
            }

            String taskId = tasks.iterator().next();

            Long removed = stringRedisTemplate.opsForZSet().remove(QUEUE_KEY, taskId);
            if (removed == null || removed == 0) {
                return null;
            }

            Map<Object, Object> taskInfo = stringRedisTemplate.opsForHash()
                    .entries(TASK_PREFIX + taskId);

            stringRedisTemplate.delete(TASK_PREFIX + taskId);

            log.info("任务出队: taskId={}", taskId);

            return convertToQueueTask(taskId, taskInfo);
        } catch (Exception e) {
            log.error("任务出队失败", e);
            return null;
        }
    }

    @Override
    public boolean cancel(String executionNo) {
        try {
            Set<String> allTasks = stringRedisTemplate.opsForZSet().range(QUEUE_KEY, 0, -1);
            if (allTasks != null) {
                for (String taskId : allTasks) {
                    String storedExecutionNo = (String) stringRedisTemplate.opsForHash()
                            .get(TASK_PREFIX + taskId, "executionNo");
                    if (executionNo.equals(storedExecutionNo)) {
                        stringRedisTemplate.opsForZSet().remove(QUEUE_KEY, taskId);
                        stringRedisTemplate.delete(TASK_PREFIX + taskId);
                        log.info("任务取消成功: executionNo={}", executionNo);
                        return true;
                    }
                }
            }
            log.warn("未找到待取消的任务: executionNo={}", executionNo);
            return false;
        } catch (Exception e) {
            log.error("任务取消失败: executionNo={}", executionNo, e);
            return false;
        }
    }

    @Override
    public Long getQueueSize() {
        try {
            Long size = stringRedisTemplate.opsForZSet().size(QUEUE_KEY);
            return size != null ? size : 0L;
        } catch (Exception e) {
            log.error("获取队列大小失败", e);
            return 0L;
        }
    }

    @Override
    public Long getDeadQueueSize() {
        try {
            Long size = stringRedisTemplate.opsForZSet().size(DEAD_QUEUE_KEY);
            return size != null ? size : 0L;
        } catch (Exception e) {
            log.error("获取死信队列大小失败", e);
            return 0L;
        }
    }

    @Override
    public List<QueueTask> listWaitingTasks() {
        List<QueueTask> result = new ArrayList<>();
        try {
            Set<String> tasks = stringRedisTemplate.opsForZSet().reverseRange(QUEUE_KEY, 0, -1);
            if (tasks != null) {
                for (String taskId : tasks) {
                    Map<Object, Object> taskInfo = stringRedisTemplate.opsForHash()
                            .entries(TASK_PREFIX + taskId);
                    result.add(convertToQueueTask(taskId, taskInfo));
                }
            }
        } catch (Exception e) {
            log.error("获取任务列表失败", e);
        }
        return result;
    }

    @Override
    public void moveToDeadQueue(QueueTask task) {
        try {
            double score = System.currentTimeMillis();
            stringRedisTemplate.opsForZSet().add(DEAD_QUEUE_KEY, task.getTaskId(), score);

            Map<String, String> taskInfo = new HashMap<>();
            taskInfo.put("calcId", task.getCalcId().toString());
            taskInfo.put("priority", task.getPriority().toString());
            taskInfo.put("executionNo", task.getExecutionNo());
            taskInfo.put("movedAt", String.valueOf(System.currentTimeMillis()));
            stringRedisTemplate.opsForHash().putAll(TASK_PREFIX + "dead:" + task.getTaskId(), taskInfo);

            log.warn("任务移入死信队列: taskId={}, executionNo={}", task.getTaskId(), task.getExecutionNo());
        } catch (Exception e) {
            log.error("移入死信队列失败: taskId={}", task.getTaskId(), e);
        }
    }

    private QueueTask convertToQueueTask(String taskId, Map<Object, Object> taskInfo) {
        QueueTask task = new QueueTask();
        task.setTaskId(taskId);
        task.setCalcId(Long.parseLong(taskInfo.get("calcId").toString()));
        task.setPriority(Integer.parseInt(taskInfo.get("priority").toString()));
        task.setExecutionNo(taskInfo.get("executionNo").toString());
        if (taskInfo.containsKey("createdAt")) {
            task.setCreatedAt(Long.parseLong(taskInfo.get("createdAt").toString()));
        }
        return task;
    }

}
