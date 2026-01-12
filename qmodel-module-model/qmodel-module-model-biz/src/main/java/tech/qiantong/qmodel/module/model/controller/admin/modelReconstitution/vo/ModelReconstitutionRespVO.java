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

package tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;

/**
 * 模型库重构 Response VO 对象 MODEL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Schema(description = "模型库重构 Response VO")
@Data
public class ModelReconstitutionRespVO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Excel(name = "id")
    @Schema(description = "id", example = "")
    private Long id;

    @Excel(name = "企业id")
    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Excel(name = "模型名称")
    @Schema(description = "模型名称", example = "")
    private String name;

    @Excel(name = "模型分类")
    @Schema(description = "模型分类", example = "")
    private Long classifyId;

    @Excel(name = "是否预置")
    @Schema(description = "是否预置", example = "")
    private Long builtin;

    @Excel(name = "接入方式")
    @Schema(description = "接入方式", example = "")
    private Long accessMode;

    @Excel(name = "请求方式")
    @Schema(description = "请求方式", example = "")
    private Long requestMethod;

    @Excel(name = "接口和文件的地址")
    @Schema(description = "接口和文件的地址", example = "")
    private String interfaceorfileAddress;

    @Excel(name = "版本id")
    @Schema(description = "版本id", example = "")
    private Long versionId;

    @Excel(name = "是否发布")
    @Schema(description = "是否发布", example = "")
    private Long whetherPublish;

    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "发布时间", example = "")
    private Date publishTime;

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

    @Excel(name = "接口的端口号")
    @Schema(description = "接口的端口号", example = "")
    private String port;

    @Excel(name = "文件名称")
    @Schema(description = "文件名称", example = "")
    private String filename;

    @Excel(name = "可执行文件相对路径")
    @Schema(description = "可执行文件相对路径", example = "")
    private String runnableFileAddress;

}