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

package tech.qiantong.qmodel.module.model.service.calc;

import tech.qiantong.qmodel.module.model.service.calc.dto.QueueTask;

import java.util.List;

/**
 * 计算任务队列服务接口
 *
 * @author qModel
 * @date 2026-07-28
 */
public interface ICalcQueueService {

    String QUEUE_KEY = "qmodel:calc:queue:priority";
    String TASK_PREFIX = "qmodel:calc:task:";
    String DEAD_QUEUE_KEY = "qmodel:calc:queue:dead";

    /**
     * 入队 - 添加任务到优先级队列
     *
     * @param calcId     计算任务ID
     * @param priority   优先级(1-高, 2-中, 3-低)
     * @param executionNo 执行批次号
     * @return 任务唯一标识
     */
    String enqueue(Long calcId, Integer priority, String executionNo);

    /**
     * 出队 - 获取下一个待执行任务
     *
     * @return 任务信息，队列为空返回null
     */
    QueueTask dequeue();

    /**
     * 取消任务 - 从队列中移除
     *
     * @param executionNo 执行批次号
     * @return 是否取消成功
     */
    boolean cancel(String executionNo);

    /**
     * 获取队列大小
     *
     * @return 队列中等待的任务数
     */
    Long getQueueSize();

    /**
     * 获取死信队列大小
     *
     * @return 死信队列中的任务数
     */
    Long getDeadQueueSize();

    /**
     * 获取等待中的任务列表
     *
     * @return 任务列表
     */
    List<QueueTask> listWaitingTasks();

    /**
     * 将任务移入死信队列
     *
     * @param task 任务信息
     */
    void moveToDeadQueue(QueueTask task);

}
