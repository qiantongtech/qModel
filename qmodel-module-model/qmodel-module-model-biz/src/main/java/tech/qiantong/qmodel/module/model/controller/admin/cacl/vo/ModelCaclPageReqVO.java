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

package tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

import java.util.Date;

/**
 * 模型计算重构 Request VO 对象 MODEL_CACL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Schema(description = "模型计算重构 Request VO")
@Data
public class ModelCaclPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "计算编码", example = "")
    private String code;

    @Schema(description = "计算名称", example = "")
    private String name;

    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Schema(description = "模型版本", example = "")
    private String modelVersion;

    @Schema(description = "开始时间", example = "")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    private Date endTime;

    @Schema(description = "计算状态", example = "")
    private Integer status;

    @Schema(description = "模型输入内容", example = "")
    private String inputContent;

    @Schema(description = "模型输出内容", example = "")
    private String outputContent;



    @Schema(description = "文件或接口地址id", example = "")
    private Long addressId;

    @Schema(description = "判断是文件的id还是地址的id，0:文件，1：接口", example = "")
    private Long addressType;

    @Schema(description = "文件计算的历史方案id", example = "")
    private Long mpProgrammeId;


}
