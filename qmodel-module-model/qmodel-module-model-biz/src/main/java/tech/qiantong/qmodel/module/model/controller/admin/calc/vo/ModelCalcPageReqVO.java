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

package tech.qiantong.qmodel.module.model.controller.admin.calc.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型计算任务 Request VO 对象 model_calc
 *
 * @author qModel
 * @date 2026-07-27
 */
@Schema(description = "模型计算任务 Request VO")
@Data
public class ModelCalcPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "租户/公司ID", example = "")
    private Long companyId;

    @Schema(description = "计算编码", example = "")
    private String code;

    @Schema(description = "任务名称", example = "")
    private String name;

    @Schema(description = "模型分类ID", example = "")
    private Long classifyId;

    @Schema(description = "模型分类名称", example = "")
    private String classifyName;

    @Schema(description = "关联模型ID", example = "")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Schema(description = "模型版本号", example = "")
    private String modelVersion;

    @Schema(description = "模型版本ID", example = "")
    private Long modelVersionId;

    @Schema(description = "描述", example = "")
    private String description;

    @Schema(description = "输入参数(JSON格式)", example = "")
    private String inputParams;

    @Schema(description = "输出结果(JSON格式)", example = "")
    private String outputResult;

    @Schema(description = "开始时间", example = "")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    private Date endTime;

    @Schema(description = "耗时(毫秒)", example = "")
    private Long duration;

    @Schema(description = "计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中", example = "")
    private Integer status;

    @Schema(description = "超时时间(秒)", example = "")
    private Long timeoutSeconds;

    @Schema(description = "已重试次数", example = "")
    private Long retryCount;

    @Schema(description = "最大重试次数", example = "")
    private Long maxRetryCount;

    @Schema(description = "优先级:1-高,2-中,3-低", example = "")
    private Integer priority;

    @Schema(description = "错误信息", example = "")
    private String errorMessage;

    @Schema(description = "文件或接口资源ID", example = "")
    private Long resourceId;

    @Schema(description = "接入方式: 0-API接口, 1-Python本地", example = "")
    private Integer calcType;




}
