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

package tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;

/**
 * 模型计算执行记录 Response VO 对象 model_calc_execution
 *
 * @author qModel
 * @date 2026-07-28
 */
@Schema(description = "模型计算执行记录 Response VO")
@Data
public class ModelCalcExecutionRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "计算任务ID")
    @Schema(description = "计算任务ID", example = "")
    private Long calcId;

    @Excel(name = "模型id")
    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Excel(name = "执行批次号", readConverterExp = "y=yyyMMddHHmmss")
    @Schema(description = "执行批次号", example = "")
    private String executionNo;

    @Excel(name = "执行模式：1-手动触发 2-定时调度 3-重试执行")
    @Schema(description = "执行模式：1-手动触发 2-定时调度 3-重试执行", example = "")
    private Integer executionMode;

    @Excel(name = "执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中")
    @Schema(description = "执行状态：0-待执行 1-运行中 2-成功 3-失败 4-终止 5-排队中", example = "")
    private Integer status;

    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "开始时间", example = "")
    private Date startTime;

    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "结束时间", example = "")
    private Date endTime;

    @Excel(name = "耗时(毫秒)")
    @Schema(description = "耗时(毫秒)", example = "")
    private Long duration;

    @Excel(name = "输入参数快照(JSON，记录执行时的实际参数)")
    @Schema(description = "输入参数快照(JSON，记录执行时的实际参数)", example = "")
    private String inputParams;

    @Excel(name = "输出结果(JSON)")
    @Schema(description = "输出结果(JSON)", example = "")
    private String outputResult;

    @Excel(name = "执行日志")
    @Schema(description = "执行日志", example = "")
    private String executionLog;

    @Excel(name = "错误信息")
    @Schema(description = "错误信息", example = "")
    private String errorMessage;

    @Excel(name = "当前重试次数")
    @Schema(description = "当前重试次数", example = "")
    private Long retryCount;

    @Excel(name = "资源使用情况(JSON，如CPU、内存、GPU使用)")
    @Schema(description = "资源使用情况(JSON，如CPU、内存、GPU使用)", example = "")
    private String resourceUsage;

    @Excel(name = "是否有效")
    @Schema(description = "是否有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志")
    @Schema(description = "删除标志", example = "")
    private Boolean delFlag;

    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;

    @Excel(name = "创建人id")
    @Schema(description = "创建人id", example = "")
    private Long creatorId;

    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;

    @Excel(name = "更新人id")
    @Schema(description = "更新人id", example = "")
    private Long updatorId;

    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

}
