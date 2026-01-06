/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
 */

package tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

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
