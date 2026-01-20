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

package tech.qiantong.qmodel.module.model.controller.admin.version.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * 版本管理 Response VO 对象 MODEL_VERSION
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "版本管理 Response VO")
@Data
public class ModelVersionRespVO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Excel(name = "ID")
    @Schema(description = "ID", example = "")
    private Long id;

    @Excel(name = "企业id")
    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Excel(name = "所属模型id")
    @Schema(description = "所属模型id", example = "")
    private Long modelId;

    @Excel(name = "所属模型名称")
    @Schema(description = "所属模型名称", example = "")
    private String modelName;

    @Excel(name = "模型版本号")
    @Schema(description = "模型版本号", example = "")
    private String version;

    @Excel(name = "文件地址")
    @Schema(description = "文件地址", example = "")
    private String fileAddress;

    @Excel(name = "接口地址")
    @Schema(description = "接口地址", example = "")
    private String interfaceAddress;

    @Excel(name = "版本状态")
    @Schema(description = "版本状态", example = "")
    private Integer status;

    @Excel(name = "描述")
    @Schema(description = "描述", example = "")
    private String description;

    @Excel(name = "是否有效 0：无效，1：有效")
    @Schema(description = "是否有效 0：无效，1：有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志 1：已删除，0：未删除")
    @Schema(description = "删除标志 1：已删除，0：未删除", example = "")
    private Boolean delFlag;

    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;

    @Excel(name = "创建人id 创建者的sys_user_id")
    @Schema(description = "创建人id 创建者的sys_user_id", example = "")
    private Long creatorId;

    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;

    @Excel(name = "更新人id 更新者的sys_user_id")
    @Schema(description = "更新人id 更新者的sys_user_id", example = "")
    private Long updatorId;

    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

    @Excel(name = "文件的名称")
    @Schema(description = "文件的名称", example = "")
    private String fileName;

    @Excel(name = "可执行文件地址")
    @Schema(description = "可执行文件地址", example = "")
    private String runnableFileAddress;

    @Excel(name = "切换后版本号")
    private String afterVersion;

    @Excel(name = "切换后版本id")
    private Long afterVersionId;

    @Excel(name = "切换前版本id")
    private Long beforeVersionId;

    @Excel(name = "切换后版本号")
    private String beforeVersion;

    @Excel(name = "停用版本id")
    private Long clearVersionId;

}
