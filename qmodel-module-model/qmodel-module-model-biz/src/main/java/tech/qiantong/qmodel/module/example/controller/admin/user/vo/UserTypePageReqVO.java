package tech.qiantong.qmodel.module.example.controller.admin.user.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 用户类型 Request VO 对象 user_type
 *
 * @author anivia
 * @date 2024-11-27
 */
@Schema(description = "用户类型 Request VO")
@Data
public class UserTypePageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "类型名称", example = "")
    private String name;


    @Schema(description = "是否有效", example = "")
    private Boolean validFlag;


    @Schema(description = "删除标识")
    private Boolean delFlag;

}
