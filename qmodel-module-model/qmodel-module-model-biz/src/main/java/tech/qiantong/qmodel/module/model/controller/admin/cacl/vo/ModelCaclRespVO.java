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

package tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;

/**
 * 模型计算重构 Response VO 对象 MODEL_CACL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Schema(description = "模型计算重构 Response VO")
@Data
public class ModelCaclRespVO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Excel(name = "主键id")
    @Schema(description = "主键id", example = "")
    private Long id;

    @Excel(name = "企业id")
    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Excel(name = "计算编码")
    @Schema(description = "计算编码", example = "")
    private String code;

    @Excel(name = "计算名称")
    @Schema(description = "计算名称", example = "")
    private String name;

    @Excel(name = "模型id")
    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Excel(name = "模型名称")
    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Excel(name = "模型版本")
    @Schema(description = "模型版本", example = "")
    private String modelVersion;

    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "开始时间", example = "")
    private Date startTime;

    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "结束时间", example = "")
    private Date endTime;

    @Excel(name = "计算状态")
    @Schema(description = "计算状态", example = "")
    private Long status;

    @Excel(name = "模型输入内容")
    @Schema(description = "模型输入内容", example = "")
    private String inputContent;

    @Excel(name = "模型输出内容")
    @Schema(description = "模型输出内容", example = "")
    private String outputContent;

    @Excel(name = "是否有效 0：无效，1：有效")
    @Schema(description = "是否有效 0：无效，1：有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志 1：已删除，0：未删除")
    @Schema(description = "删除标志 1：已删除，0：未删除", example = "")
    private Boolean delFlag;

    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;

    @Excel(name = "创建人id")
    @Schema(description = "创建人id", example = "")
    private Long creatorId;

    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;

    @Excel(name = "更新人id")
    @Schema(description = "更新人id", example = "")
    private Long updatorId;

    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

    @Excel(name = "文件或接口地址id")
    @Schema(description = "文件或接口地址id", example = "")
    private Long addressId;

    @Excel(name = "判断是文件的id还是地址的id，0:文件，1：接口")
    @Schema(description = "判断是文件的id还是地址的id，0:文件，1：接口", example = "")
    private Long addressType;

    @Excel(name = "文件计算的历史方案id")
    @Schema(description = "文件计算的历史方案id", example = "")
    private Long mpProgrammeId;

}