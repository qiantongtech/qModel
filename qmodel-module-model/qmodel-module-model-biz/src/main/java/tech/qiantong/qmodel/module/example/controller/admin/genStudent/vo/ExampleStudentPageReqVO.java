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

package tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

import java.util.Date;

/**
 * 学生 Request VO 对象 example_student
 *
 * @author anivia
 * @date 2025-02-18
 */
@Schema(description = "学生 Request VO")
@Data
public class ExampleStudentPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;
    @Schema(description = "ID", example = "")
    private Long id;
    @Schema(description = "姓名", example = "")
    private String name;

    @Schema(description = "学生照", example = "")
    private String pictureUrl;

    @Schema(description = "教育经历", example = "")
    private String experience;

    @Schema(description = "性别", example = "")
    private Integer sex;

    @Schema(description = "生日", example = "")
    private Date birthday;

    @Schema(description = "年龄", example = "")
    private Long age;

    @Schema(description = "学号", example = "")
    private String studentNumber;

    @Schema(description = "班级", example = "")
    private Integer grade;

    @Schema(description = "爱好", example = "")
    private String hobby;




}
