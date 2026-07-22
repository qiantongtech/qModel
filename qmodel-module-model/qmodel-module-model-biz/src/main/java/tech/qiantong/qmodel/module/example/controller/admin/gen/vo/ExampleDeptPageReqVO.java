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

package tech.qiantong.qmodel.module.example.controller.admin.gen.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 示例部门 Request VO 对象 example_dept
 *
 * @author anivia
 * @date 2024-12-09
 */
@Schema(description = "示例部门 Request VO")
@Data
public class ExampleDeptPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
        @Schema(description = "ID", example = "")
        private Long id;

    @Schema(description = "部门名称", example = "")
    private String name;

    @Schema(description = "负责人", example = "")
    private String leader;

    @Schema(description = "联系电话", example = "")
    private String phone;

    @Schema(description = "邮箱", example = "")
    private String email;

    @Schema(description = "部门状态", example = "")
    private Integer status;




}
