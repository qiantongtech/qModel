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

package tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型调用历史记录 创建/修改 Request VO model_invoke_history
 *
 * @author qmodel
 * @date 2026-07-14
 */
@Schema(description = "模型调用历史记录 Response VO")
@Data
public class ModelInvokeHistorySaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "模型id", example = "")
    @NotNull(message = "模型id不能为空")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    @NotBlank(message = "模型名称不能为空")
    @Size(max = 128, message = "模型名称长度不能超过128个字符")
    private String modelName;

    @Schema(description = "模型配置资源id", example = "")
    private Long resourceId;

    @Schema(description = "模型版本id", example = "")
    private Long versionId;

    @Schema(description = "请求方式", example = "")
    @NotBlank(message = "请求方式不能为空")
    private String requestMethod;

    @Schema(description = "调用类型", example = "")
    @NotBlank(message = "调用类型不能为空")
    private String invokeType;

    @Schema(description = "输入参数", example = "")
    @NotBlank(message = "输入参数不能为空")
    private String inputParams;

    @Schema(description = "输出结果", example = "")
    @NotBlank(message = "输出结果不能为空")
    private String outputResult;

    @Schema(description = "开始时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    @Schema(description = "执行耗时", example = "")
    private Long duration;

    @Schema(description = "错误信息", example = "")
    @NotBlank(message = "错误信息不能为空")
    private String errorMessage;

    @Schema(description = "调用状态", example = "")
    @NotBlank(message = "调用状态不能为空")
    private String status;

    @Schema(description = "客户端操作IP", example = "")
    @NotBlank(message = "客户端操作IP不能为空")
    @Size(max = 32, message = "客户端操作IP长度不能超过32个字符")
    private String clientIp;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    @Size(max = 512, message = "备注长度不能超过512个字符")
    private String remark;


}
