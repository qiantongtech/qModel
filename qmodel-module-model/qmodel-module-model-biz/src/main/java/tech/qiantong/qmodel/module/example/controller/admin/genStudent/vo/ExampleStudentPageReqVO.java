package tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo;

import java.util.Date;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

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
