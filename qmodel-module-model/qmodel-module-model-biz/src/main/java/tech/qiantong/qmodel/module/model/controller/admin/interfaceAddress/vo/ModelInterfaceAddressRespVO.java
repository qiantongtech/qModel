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

package tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * 接口地址 Response VO 对象 MODEL_INTERFACE_ADDRESS
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "接口地址 Response VO")
@Data
public class ModelInterfaceAddressRespVO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Excel(name = "id")
    @Schema(description = "id", example = "")
    private Long id;

    @Excel(name = "企业id")
    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Excel(name = "模型id")
    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Excel(name = "接口地址")
    @Schema(description = "接口地址", example = "")
    private String interfaceAddress;

    @Excel(name = "模型版本id")
    @Schema(description = "模型版本id", example = "")
    private Long versionId;

    @Excel(name = "请求方式")
    @Schema(description = "请求方式", example = "")
    private Integer requestMethod;

    @Excel(name = "输入参数")
    @Schema(description = "输入参数", example = "")
    private String inputParameter;

    @Excel(name = "输出参数")
    @Schema(description = "输出参数", example = "")
    private String outputParameter;

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

    @Excel(name = "输入参数说明")
    @Schema(description = "输入参数说明", example = "")
    private String inputParameterIllustrate;

    @Excel(name = "输出参数说明")
    @Schema(description = "输出参数说明", example = "")
    private String outputParameterIllustrate;

    /** 模型版本 */
    @TableField(exist = false)
    private String version;

    /** 描述 */
    @TableField(exist = false)
    private String description;

}
