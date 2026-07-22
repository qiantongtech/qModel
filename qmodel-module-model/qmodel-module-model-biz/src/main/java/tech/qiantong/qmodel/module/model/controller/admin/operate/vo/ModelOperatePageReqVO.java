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

package tech.qiantong.qmodel.module.model.controller.admin.operate.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型历史管理 Request VO 对象 MODEL_OPERATE
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "模型历史管理 Request VO")
@Data
public class ModelOperatePageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "操作模块", example = "")
    private String moduleName;

    @Schema(description = "操作类型", example = "")
    private Long type;

    @Schema(description = "操作内容", example = "")
    private String content;

    @Schema(description = "请求方式", example = "")
    private String method;

    @Schema(description = "请求参数", example = "")
    private String reqContent;

    @Schema(description = "返回参数", example = "")
    private String respContent;

    @Schema(description = "操作地址(Ip)", example = "")
    private String ip;

    @Schema(description = "操作地点", example = "")
    private String address;

    @Schema(description = "操作状态", example = "")
    private Integer status;




}
