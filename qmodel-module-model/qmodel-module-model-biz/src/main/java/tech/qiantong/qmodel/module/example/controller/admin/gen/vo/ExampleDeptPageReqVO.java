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
