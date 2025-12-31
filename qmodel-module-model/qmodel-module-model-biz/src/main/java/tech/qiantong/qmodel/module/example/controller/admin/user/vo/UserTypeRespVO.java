package tech.qiantong.qmodel.module.example.controller.admin.user.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;
import java.util.Date;

/**
 * 用户类型 Response VO 对象 user_type
 *
 * @author anivia
 * @date 2024-11-27
 */
@Schema(description = "用户类型 Response VO")
@Data
public class UserTypeRespVO {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Excel(name = "类型名称")
    @Schema(description = "类型名称", example = "")
    private String name;


    @Excel(name = "是否有效")
    @Schema(description = "是否有效", example = "")
    private Boolean validFlag;

    @Schema(description = "删除标识")
    private Boolean delFlag;


    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;


    @Excel(name = "创建人id")
    @Schema(description = "创建人id", example = "")
    private Long creatorId;


    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    @Schema(description = "创建时间", example = "")
    private Date createTime;


    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;


    @Excel(name = "更新人id")
    @Schema(description = "更新人id", example = "")
    private Long updatorId;


    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;


    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;


}
