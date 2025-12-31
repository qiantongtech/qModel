package tech.qiantong.qmodel.module.example.dal.dataobject.user;

import lombok.*;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;


/**
 * 用户类型 DO 对象 user_type
 *
 * @author anivia
 * @date 2024-11-27
 */
@Data
@TableName(value = "user_type")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("user_type_seq")
@EqualsAndHashCode(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserTypeDO extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** ID */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 类型名称 */
    private String name;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    @TableLogic
    private Boolean delFlag;


}
