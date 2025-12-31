package tech.qiantong.qmodel.module.example.dal.dataobject.student;

import lombok.*;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 学生 DO 对象 example_student_test
 *
 * @author anivia
 * @date 2024-12-06
 */
@Data
@TableName(value = "example_student_test")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("example_student_test_seq")
@EqualsAndHashCode(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExampleStudentTestDO extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** ID */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 姓名 */
    private String name;

    /** 学生照 */
    private String pictureUrl;

    /** 教育经历 */
    private String experience;

    /** 性别 */
    private Integer sex;

    /** 年龄 */
    private Long age;

    /** 学号 */
    private String studentNumber;

    /** 班级 */
    private Integer grade;

    /** 爱好 */
    private String hobby;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    @TableLogic
    private Boolean delFlag;


}
