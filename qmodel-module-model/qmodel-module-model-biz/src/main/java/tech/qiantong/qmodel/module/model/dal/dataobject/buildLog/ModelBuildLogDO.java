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

package tech.qiantong.qmodel.module.model.dal.dataobject.buildLog;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 构建日志 DO 对象 model_build_log
 *
 * @author qModel
 * @date 2026-07-14
 */
@Data
@TableName(value = "model_build_log")
// 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
// @KeySequence("model_build_log_seq")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ModelBuildLogDO extends BaseEntity {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** ID */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 模型文件id */
    private Long resourceId;

    /** 模型id */
    private Long modelId;

    /** 模型名称 */
    private String modelName;

    /** 版本id */
    private Long versionId;

    /** 构建类型 */
    private Integer buildType;

    /** 构建状态 */
    private Integer status;

    /** 开始时间 */
    private Date startTime;

    /** 结束时间 */
    private Date endTime;

    /** 执行耗时 */
    private Long duration;

    /** 已存在的依赖包列表JSON */
    private String installedPackages;

    /** 缺失失败的依赖包列表JSON */
    private String missingPackages;

    /** 安装失败的依赖包列表JSON */
    private String failedPackages;

    /** dockerFile内容 */
    private String dockerfileContent;

    /** 构建日志 */
    private String buildLog;

    /** 错误日志 */
    private String errorMessage;

    /** requirements.txt 内容 */
    private String requirements;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    @TableLogic
    private Boolean delFlag;


    @Schema(description = "创建者id", example = "")
    private Long creatorId;

    /**
     * 创建者
     */
    @Schema(description = "创建者", example = "")
    private String createBy;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Schema(description = "更新者id", example = "")
    private Long updatorId;

    /**
     * 更新者
     */
    @Schema(description = "更新者", example = "")
    private String updateBy;

    /**
     * 更新时间
     */
    // 更新时间自动填充
    @Schema(description = "更新时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
     * 备注
     */
    @Schema(description = "备注", example = "")
    private String remark;


}
