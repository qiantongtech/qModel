package tech.qiantong.qmodel.module.example.dal.dataobject.gen;

import lombok.*;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 示例部门 DO 对象 example_dept
 *
 * @author anivia
 * @date 2024-12-09
 */
@Data
@TableName(value = "example_dept")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("example_dept_seq")
@EqualsAndHashCode(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExampleDeptDO extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** ID */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 父部门id */
    private Long parentId;

    /** 部门名称 */
    private String name;

    /** 负责人 */
    private String leader;

    /** 联系电话 */
    private String phone;

    /** 邮箱 */
    private String email;

    /** 部门状态 */
    private Integer status;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    @TableLogic
    private Boolean delFlag;


}
