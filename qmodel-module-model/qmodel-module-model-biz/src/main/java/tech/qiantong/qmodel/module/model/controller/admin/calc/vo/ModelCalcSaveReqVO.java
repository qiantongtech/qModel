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

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 模型计算任务 创建/修改 Request VO model_calc
 *
 * @author qModel
 * @date 2026-07-27
 */
@Schema(description = "模型计算任务 Response VO")
@Data
public class ModelCalcSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "租户/公司ID", example = "")
    private Long companyId;

    @Schema(description = "计算编码", example = "")
    @Size(max = 32, message = "计算编码长度不能超过32个字符")
    private String code;

    @Schema(description = "任务名称", example = "")
    @NotBlank(message = "任务名称不能为空")
    @Size(max = 32, message = "任务名称长度不能超过32个字符")
    private String name;

    @Schema(description = "模型分类ID", example = "")
    private Long classifyId;

    @Schema(description = "模型分类名称", example = "")
    @Size(max = 32, message = "模型分类名称长度不能超过32个字符")
    private String classifyName;

    @Schema(description = "关联模型ID", example = "")
    @NotNull(message = "关联模型ID不能为空")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    @Size(max = 32, message = "模型名称长度不能超过32个字符")
    private String modelName;

    @Schema(description = "模型版本号", example = "")
    @Size(max = 32, message = "模型版本号长度不能超过32个字符")
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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

    @Schema(description = "备注", example = "")
    @Size(max = 512, message = "备注长度不能超过512个字符")
    private String remark;



    @Schema(description = "创建者id", example = "")
    private Long creatorId;

    /**
     * 创建者
     */
    @Schema(description = "创建者", example = "")
    private String createBy;

    /**
     * 创建时间
     */
    // 创建时间自动填充
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Schema(description = "更新者id", example = "")
    private Long updatorId;

    /**
     * 更新者
     */
    @Schema(description = "更新者", example = "")
    private String updateBy;

    /**
     * 更新时间
     */
    // 更新时间自动填充
    @Schema(description = "更新时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;


}
