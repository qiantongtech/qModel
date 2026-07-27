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
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型调用历史记录 Request VO 对象 model_invoke_history
 *
 * @author qmodel
 * @date 2026-07-14
 */
@Schema(description = "模型调用历史记录 Request VO")
@Data
public class ModelInvokeHistoryPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Schema(description = "模型配置资源id", example = "")
    private Long resourceId;

    @Schema(description = "模型版本id", example = "")
    private Long versionId;

    @Schema(description = "请求方式", example = "")
    private String requestMethod;

    @Schema(description = "调用类型", example = "")
    private String invokeType;

    @Schema(description = "输入参数", example = "")
    private String inputParams;

    @Schema(description = "输出结果", example = "")
    private String outputResult;

    @Schema(description = "开始时间", example = "")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    private Date endTime;

    @Schema(description = "执行耗时", example = "")
    private Long duration;

    @Schema(description = "错误信息", example = "")
    private String errorMessage;

    @Schema(description = "调用状态", example = "")
    private String status;

    @Schema(description = "客户端操作IP", example = "")
    private String clientIp;




}
