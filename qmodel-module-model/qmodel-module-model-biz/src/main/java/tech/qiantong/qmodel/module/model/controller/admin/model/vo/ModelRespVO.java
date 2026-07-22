/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.controller.admin.model.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;

import java.io.Serializable;
import java.util.Date;

/**
 * 模型基础信息 Response VO 对象 model
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型基础信息 Response VO")
@Data
public class ModelRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "企业ID")
    @Schema(description = "企业ID", example = "")
    private Long companyId;

    @Excel(name = "分类id")
    @Schema(description = "分类id", example = "")
    private Long classifyId;

    @Excel(name = "分类名称")
    @Schema(description = "分类名称", example = "")
    private String classifyName;

    @Excel(name = "名称")
    @Schema(description = "名称", example = "")
    private String name;

    @Excel(name = "编码")
    @Schema(description = "编码", example = "")
    private String code;

    @Excel(name = "接入方式")
    @Schema(description = "接入方式", example = "")
    private String accessType;

    @Excel(name = "版本号")
    @Schema(description = "版本号", example = "")
    private String version;

    @Excel(name = "作者")
    @Schema(description = "作者", example = "")
    private String author;

    @Excel(name = "状态")
    @Schema(description = "状态", example = "状态;0-停用, 1-启用，2-构建部署中，3-构建失败，4-构建成功")
    private String status;

    @Excel(name = "标签")
    @Schema(description = "标签", example = "")
    private String tags;

    @Excel(name = "图标")
    @Schema(description = "图标", example = "")
    private String icon;


    @Excel(name = "描述")
    @Schema(description = "描述", example = "")
    private String description;

    @Excel(name = "是否有效")
    @Schema(description = "是否有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志")
    @Schema(description = "删除标志", example = "")
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

    @Schema(description = "模型文件资源信息 Response VO", example = "")
    @TableField(exist = false)
    private ModelFileResourceDO modelFileResourceRespVO;
}
