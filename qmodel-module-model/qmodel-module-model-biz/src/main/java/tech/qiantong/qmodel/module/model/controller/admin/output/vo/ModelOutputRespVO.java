/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.controller.admin.output.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * 模型输出管理 Response VO 对象 MODEL_OUTPUT
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "模型输出管理 Response VO")
@Data
public class ModelOutputRespVO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Excel(name = "ID")
    @Schema(description = "ID", example = "")
    private Long id;

    @Excel(name = "企业Id")
    @Schema(description = "企业Id", example = "")
    private Long companyId;

    @Excel(name = "参数名称")
    @Schema(description = "参数名称", example = "")
    private String name;

    @Excel(name = "英文名称")
    @Schema(description = "英文名称", example = "")
    private String engName;

    @Excel(name = "参数类型 0:单值，1：多列数值")
    @Schema(description = "参数类型 0:单值，1：多列数值", example = "")
    private Long type;

    @Excel(name = "所属模型id")
    @Schema(description = "所属模型id", example = "")
    private Long modelId;

    @Excel(name = "所属模型名称")
    @Schema(description = "所属模型名称", example = "")
    private String modelName;

    @Excel(name = "所属模型版本")
    @Schema(description = "所属模型版本", example = "")
    private String modelVersion;

    @Excel(name = "参数说明(描述)")
    @Schema(description = "参数说明(描述)", example = "")
    private String description;

    @Excel(name = "参数单值")
    @Schema(description = "参数单值", example = "")
    private String singleContent;

    @Excel(name = "参数多列值")
    @Schema(description = "参数多列值", example = "")
    private String multipleContent;

    @Excel(name = "是否有效 0：无效，1：有效")
    @Schema(description = "是否有效 0：无效，1：有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志 1：已删除，0：未删除")
    @Schema(description = "删除标志 1：已删除，0：未删除", example = "")
    private Boolean delFlag;

    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;

    @Excel(name = "创建人id 创建者的sys_user_id")
    @Schema(description = "创建人id 创建者的sys_user_id", example = "")
    private Long creatorId;

    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;

    @Excel(name = "更新人id 更新者的sys_user_id")
    @Schema(description = "更新人id 更新者的sys_user_id", example = "")
    private Long updatorId;

    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

}
