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

package tech.qiantong.qmodel.module.model.api.calcExecution.dto;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

/**
 * 模型计算执行记录 DTO 对象 model_calc_execution
 *
 * @author qModel
 * @date 2026-07-28
 */
@Data
public class ModelCalcExecutionReqDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 计算任务ID */
    private Long calcId;

    /** 模型id */
    private Long modelId;

    /** 执行批次号（yyyyMMddHHmmss） */
    private String executionNo;

    /** 执行模式：1-手动触发 2-定时调度 3-重试执行 */
    private Integer executionMode;

    /** 执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中 */
    private Integer status;

    /** 开始时间 */
    private Date startTime;

    /** 结束时间 */
    private Date endTime;

    /** 耗时(毫秒) */
    private Long duration;

    /** 输入参数快照(JSON，记录执行时的实际参数) */
    private String inputParams;

    /** 输出结果(JSON) */
    private String outputResult;

    /** 执行日志 */
    private String executionLog;

    /** 错误信息 */
    private String errorMessage;

    /** 当前重试次数 */
    private Long retryCount;

    /** 资源使用情况(JSON，如CPU、内存、GPU使用) */
    private String resourceUsage;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    private Boolean delFlag;


}
