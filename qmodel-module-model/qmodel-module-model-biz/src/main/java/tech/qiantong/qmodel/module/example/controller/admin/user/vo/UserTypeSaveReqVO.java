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

package tech.qiantong.qmodel.module.example.controller.admin.user.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.Size;
import java.util.Date;

/**
 * 用户类型 创建/修改 Request VO user_type
 *
 * @author anivia
 * @date 2024-11-27
 */
@Schema(description = "用户类型 Response VO")
@Data
public class UserTypeSaveReqVO {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;


    @Schema(description = "类型名称", example = "")
    @Size(max = 256, message = "类型名称长度不能超过256个字符")
    private String name;


    @Schema(description = "是否有效", example = "")
    private Boolean validFlag;

    @Schema(description = "删除标识")
    private Boolean delFlag;

    @Schema(description = "创建者id")
    private Long creatorId;

    @Schema(description = "创建者", example = "")
    private String createBy;

    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Schema(description = "更新者", example = "")
    private String updateBy;

    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Schema(description = "备注", example = "")
    private String remark;

    @Schema(description = "更新人id", example = "")
    private Long updatorId;


}
