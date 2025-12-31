package tech.qiantong.qmodel.module.example.controller.admin.user.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
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
