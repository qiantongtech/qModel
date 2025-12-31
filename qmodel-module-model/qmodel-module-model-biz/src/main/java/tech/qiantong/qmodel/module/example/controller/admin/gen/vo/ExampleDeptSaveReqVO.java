package tech.qiantong.qmodel.module.example.controller.admin.gen.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import tech.qiantong.qmodel.common.core.domain.BaseEntity;

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
