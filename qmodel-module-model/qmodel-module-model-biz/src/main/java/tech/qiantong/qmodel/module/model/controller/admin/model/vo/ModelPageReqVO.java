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

package tech.qiantong.qmodel.module.model.controller.admin.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

import java.util.List;

/**
 * 模型基础信息 Request VO 对象 model
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型基础信息 Request VO")
@Data
public class ModelPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "企业ID", example = "")
    private Long companyId;

    @Schema(description = "分类id", example = "")
    private Long classifyId;

    @Schema(description = "分类id列表", example = "")
    private List<Long> classifyIdList;

    @Schema(description = "名称", example = "")
    private String name;

    @Schema(description = "编码", example = "")
    private String code;

    @Schema(description = "接入方式", example = "")
    private String accessType;

    @Schema(description = "版本号", example = "")
    private String version;

    @Schema(description = "作者", example = "")
    private String author;

    @Schema(description = "状态", example = "")
    private String status;

    @Schema(description = "标签", example = "")
    private String tags;

    @Schema(description = "描述", example = "")
    private String description;

}
