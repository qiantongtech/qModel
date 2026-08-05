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

package tech.qiantong.qmodel.module.model.controller.admin.calc.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;

/**
 * 模型计算任务 Response VO 对象 model_calc
 *
 * @author qModel
 * @date 2026-07-27
 */
@Schema(description = "模型计算任务 Response VO")
@Data
public class ModelCalcRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "租户/公司ID")
    @Schema(description = "租户/公司ID", example = "")
    private Long companyId;

    @Excel(name = "计算编码")
    @Schema(description = "计算编码", example = "")
    private String code;

    @Excel(name = "任务名称")
    @Schema(description = "任务名称", example = "")
    private String name;

    @Excel(name = "模型分类ID")
    @Schema(description = "模型分类ID", example = "")
    private Long classifyId;

    @Excel(name = "模型分类名称")
    @Schema(description = "模型分类名称", example = "")
    private String classifyName;

    @Excel(name = "关联模型ID")
    @Schema(description = "关联模型ID", example = "")
    private Long modelId;

    @Excel(name = "模型名称")
    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Excel(name = "模型版本号")
    @Schema(description = "模型版本号", example = "")
    private String modelVersion;

    @Excel(name = "模型版本ID")
    @Schema(description = "模型版本ID", example = "")
    private Long modelVersionId;

    @Excel(name = "描述")
    @Schema(description = "描述", example = "")
    private String description;

    @Excel(name = "输入参数(JSON格式)")
    @Schema(description = "输入参数(JSON格式)", example = "")
    private String inputParams;

    @Excel(name = "输出结果(JSON格式)")
    @Schema(description = "输出结果(JSON格式)", example = "")
    private String outputResult;

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

    @Excel(name = "计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中")
    @Schema(description = "计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中", example = "")
    private Integer status;

    @Excel(name = "超时时间(秒)")
    @Schema(description = "超时时间(秒)", example = "")
    private Long timeoutSeconds;

    @Excel(name = "已重试次数")
    @Schema(description = "已重试次数", example = "")
    private Long retryCount;

    @Excel(name = "最大重试次数")
    @Schema(description = "最大重试次数", example = "")
    private Long maxRetryCount;

    @Excel(name = "优先级:1-高,2-中,3-低")
    @Schema(description = "优先级:1-高,2-中,3-低", example = "")
    private Integer priority;

    @Excel(name = "错误信息")
    @Schema(description = "错误信息", example = "")
    private String errorMessage;

    @Excel(name = "文件或接口资源ID")
    @Schema(description = "文件或接口资源ID", example = "")
    private Long resourceId;

    @Excel(name = "接入方式: 0-API接口, 1-Python本地")
    @Schema(description = "接入方式: 0-API接口, 1-Python本地", example = "")
    private Integer calcType;

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
