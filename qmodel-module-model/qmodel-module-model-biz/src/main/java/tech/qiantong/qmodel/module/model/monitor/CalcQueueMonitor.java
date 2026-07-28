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

package tech.qiantong.qmodel.module.model.monitor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.module.model.service.calc.ICalcQueueService;
import tech.qiantong.qmodel.module.model.service.calcExecution.IModelCalcExecutionService;

import javax.annotation.Resource;

/**
 * 队列监控组件
 *
 * @author qModel
 * @date 2026-07-28
 */
@Slf4j
@Component
public class CalcQueueMonitor {

    @Resource
    private ICalcQueueService calcQueueService;

    @Resource
    private IModelCalcExecutionService executionService;

    private static final long ALERT_THRESHOLD = 100;

    /**
     * 每分钟检查队列状态
     */
    @Scheduled(fixedRate = 60000)
    public void monitorQueueStatus() {
        try {
            Long waitingSize = calcQueueService.getQueueSize();
            Long deadSize = calcQueueService.getDeadQueueSize();
            Long runningCount = executionService.countByStatus(1);

            log.info("[计算队列监控] 等待中: {}, 运行中: {}, 死信: {}", waitingSize, runningCount, deadSize);

            if (waitingSize != null && waitingSize > ALERT_THRESHOLD) {
                sendAlert("队列积压告警", "当前等待队列任务数: " + waitingSize + "，超过阈值: " + ALERT_THRESHOLD);
            }

            if (deadSize != null && deadSize > 0) {
                sendAlert("死信队列告警", "死信队列任务数: " + deadSize + "，请及时处理");
            }
        } catch (Exception e) {
            log.error("队列监控检查异常", e);
        }
    }

    /**
     * 发送告警通知
     */
    private void sendAlert(String title, String message) {
        log.warn("[告警] {}: {}", title, message);
    }

}
