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

package tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型计算执行记录 创建/修改 Request VO model_calc_execution
 *
 * @author qModel
 * @date 2026-07-28
 */
@Schema(description = "模型计算执行记录 Response VO")
@Data
public class ModelCalcExecutionSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "计算任务ID", example = "")
    @NotNull(message = "计算任务ID不能为空")
    private Long calcId;

    @Schema(description = "模型id", example = "")
    @NotNull(message = "模型id不能为空")
    private Long modelId;

    @Schema(description = "执行批次号", example = "")
    @NotBlank(message = "执行批次号不能为空")
    @Size(max = 32, message = "执行批次号长度不能超过32个字符")
    private String executionNo;

    @Schema(description = "执行模式：1-手动触发 2-定时调度 3-重试执行", example = "")
    private Integer executionMode;

    @Schema(description = "执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中", example = "")
    private Integer status;

    @Schema(description = "开始时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    @Schema(description = "耗时(毫秒)", example = "")
    private Long duration;

    @Schema(description = "输入参数快照(JSON，记录执行时的实际参数)", example = "")
    @NotBlank(message = "输入参数快照(JSON，记录执行时的实际参数)不能为空")
    private String inputParams;

    @Schema(description = "输出结果(JSON)", example = "")
    @NotBlank(message = "输出结果(JSON)不能为空")
    private String outputResult;

    @Schema(description = "执行日志", example = "")
    @NotBlank(message = "执行日志不能为空")
    private String executionLog;

    @Schema(description = "错误信息", example = "")
    @NotBlank(message = "错误信息不能为空")
    private String errorMessage;

    @Schema(description = "当前重试次数", example = "")
    private Long retryCount;

    @Schema(description = "资源使用情况(JSON，如CPU、内存、GPU使用)", example = "")
    @NotBlank(message = "资源使用情况(JSON，如CPU、内存、GPU使用)不能为空")
    @Size(max = 3072, message = "资源使用情况(JSON，如CPU、内存、GPU使用)长度不能超过3072个字符")
    private String resourceUsage;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    @Size(max = 512, message = "备注长度不能超过512个字符")
    private String remark;


}
