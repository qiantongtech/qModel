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

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * 学生 创建/修改 Request VO example_student
 *
 * @author anivia
 * @date 2025-02-18
 */
@Schema(description = "学生 Response VO")
@Data
public class ExampleStudentSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "姓名", example = "")
    @NotBlank(message = "姓名不能为空")
    @Size(max = 256, message = "姓名长度不能超过256个字符")
    private String name;

    @Schema(description = "学生照", example = "")
    @Size(max = 256, message = "学生照长度不能超过256个字符")
    private String pictureUrl;

    @Schema(description = "教育经历", example = "")
    @Size(max = 256, message = "教育经历长度不能超过256个字符")
    private String experience;

    @Schema(description = "性别", example = "")
    private Integer sex;

    @Schema(description = "生日", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date birthday;

    @Schema(description = "年龄", example = "")
    @NotNull(message = "年龄不能为空")
    private Long age;

    @Schema(description = "学号", example = "")
    @Size(max = 256, message = "学号长度不能超过256个字符")
    private String studentNumber;

    @Schema(description = "班级", example = "")
    private Integer grade;

    @Schema(description = "爱好", example = "")
    @Size(max = 256, message = "爱好长度不能超过256个字符")
    private String hobby;

    @Schema(description = "备注", example = "")
    @Size(max = 256, message = "备注长度不能超过256个字符")
    private String remark;


}
