package tech.qiantong.qmodel.module.example.controller.admin.gen.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;
import java.util.Date;
import java.io.Serializable;

/**
 * 示例部门 Response VO 对象 example_dept
 *
 * @author anivia
 * @date 2024-12-09
 */
@Schema(description = "示例部门 Response VO")
@Data
public class ExampleDeptRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Excel(name = "父部门id")
    @Schema(description = "父部门id", example = "")
    private Long parentId;

    @Excel(name = "部门名称")
    @Schema(description = "部门名称", example = "")
    private String name;

    @Excel(name = "负责人")
    @Schema(description = "负责人", example = "")
    private String leader;

    @Excel(name = "联系电话")
    @Schema(description = "联系电话", example = "")
    private String phone;

    @Excel(name = "邮箱")
    @Schema(description = "邮箱", example = "")
    private String email;

    @Excel(name = "部门状态")
    @Schema(description = "部门状态", example = "")
    private Integer status;

    @Excel(name = "是否有效")
    @Schema(description = "是否有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志")
    @Schema(description = "删除标志", example = "")
    private Boolean delFlag;

    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;

    @Excel(name = "创建人id")
    @Schema(description = "创建人id", example = "")
    private Long creatorId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;

    @Excel(name = "更新人id")
    @Schema(description = "更新人id", example = "")
    private Long updatorId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

}
