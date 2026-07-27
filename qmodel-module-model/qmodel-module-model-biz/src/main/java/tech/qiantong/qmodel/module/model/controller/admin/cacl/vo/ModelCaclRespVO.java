/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  
 * This file is part of qModel Module Platform (Open Source Edition).
 *  
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

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

    /**
     * 地址
     */
    @TableField(exist = false)
    private String address;

    /**
     * 请求方式  0：get，1：post，2：put，3：delete
     */
    @TableField(exist = false)
    private Integer requestMethod;

}
