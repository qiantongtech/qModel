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

package tech.qiantong.qmodel.module.example.controller.admin.gen.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * 示例部门 创建/修改 Request VO example_dept
 *
 * @author anivia
 * @date 2024-12-09
 */
@Schema(description = "示例部门 Response VO")
@Data
public class ExampleDeptSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "父部门id", example = "")
    @NotNull(message = "父部门id不能为空")
    private Long parentId;

    @Schema(description = "部门名称", example = "")
    @Size(max = 256, message = "部门名称长度不能超过256个字符")
    private String name;

    @Schema(description = "负责人", example = "")
    @Size(max = 256, message = "负责人长度不能超过256个字符")
    private String leader;

    @Schema(description = "联系电话", example = "")
    @Size(max = 256, message = "联系电话长度不能超过256个字符")
    private String phone;

    @Schema(description = "邮箱", example = "")
    @Size(max = 256, message = "邮箱长度不能超过256个字符")
    private String email;

    @Schema(description = "部门状态", example = "")
    @NotNull(message = "部门状态不能为空")
    private Integer status;


}
