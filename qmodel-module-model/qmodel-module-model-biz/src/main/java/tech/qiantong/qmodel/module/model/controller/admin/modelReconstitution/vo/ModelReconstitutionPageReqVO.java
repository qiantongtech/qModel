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

package tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

import java.util.Date;
import java.util.List;

/**
 * 模型库重构 Request VO 对象 MODEL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Schema(description = "模型库重构 Request VO")
@Data
public class ModelReconstitutionPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "模型名称", example = "")
    private String name;

    @Schema(description = "模型分类", example = "")
    private Long classifyId;

    @Schema(description = "是否预置", example = "")
    private Long builtin;

    @Schema(description = "接入方式", example = "")
    private Integer accessMode;

    @Schema(description = "请求方式", example = "")
    private Integer requestMethod;

    @Schema(description = "接口和文件的地址", example = "")
    private String interfaceorfileAddress;

    @Schema(description = "版本id", example = "")
    private Long versionId;

    @Schema(description = "是否发布", example = "")
    private Long whetherPublish;

    @Schema(description = "发布时间", example = "")
    private Date publishTime;


    @Schema(description = "接口的端口号", example = "")
    private String port;

    @Schema(description = "文件名称", example = "")
    private String fileName;

    @Schema(description = "可执行文件相对路径", example = "")
    private String runnableFileAddress;

    private List<Long> classifyIds;

}
