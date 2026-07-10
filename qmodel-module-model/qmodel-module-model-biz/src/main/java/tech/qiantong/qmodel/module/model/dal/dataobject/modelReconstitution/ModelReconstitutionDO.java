/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
 */

package tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 模型库重构 DO 对象 MODEL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Data
@TableName(value = "model_reconstitution")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("MODEL_RECONSTITUTION_seq")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ModelReconstitutionDO extends BaseEntity {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 模型名称 */
    private String name;

    /** 模型分类 */
    private Long classifyId;

    /** 是否预置 */
    private Long builtin;

    /** 接入方式 */
    private Integer accessMode;

    /** 请求方式 */
    private Integer requestMethod;

    /** 接口和文件的地址 */
    private String interfaceorfileAddress;

    /** 版本id */
    private Long versionId;

    /** 是否发布 */
    private Long whetherPublish;

    /** 发布时间 */
    private Date publishTime;

    /** 删除标志 */
    @TableLogic
    private Boolean delFlag;

    /** 接口的端口号 */
    private String port;

    /** 文件名称 */
    private String fileName;

    /** 可执行文件相对路径 */
    private String runnableFileAddress;


    /** 版本号 */
    @TableField(exist = false)
    private String version;

    /** 版本说明 */
    @TableField(exist = false)
    private String description;

    @TableField(exist = false)
    private String classifyName;

}
