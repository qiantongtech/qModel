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

package tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 模型库重构 创建/修改 Request VO MODEL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Schema(description = "模型库重构 Response VO")
@Data
public class ModelReconstitutionSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "模型名称", example = "")
    @NotBlank(message = "模型名称不能为空")
    private String name;

    @Schema(description = "模型分类", example = "")
    @NotNull(message = "模型分类不能为空")
    private Long classifyId;

    @Schema(description = "是否预置", example = "")
    private Long builtin;

    @Schema(description = "接入方式", example = "")
    private Integer accessMode;

    @Schema(description = "请求方式", example = "")
    private Integer requestMethod;

    @Schema(description = "接口和文件的地址", example = "")
    private String interfaceorfileAddress;

    @Schema(description = "版本id", example = "")
    private Long versionId;

    @Schema(description = "是否发布", example = "")
    private Long whetherPublish;

    @Schema(description = "发布时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date publishTime;

    @Schema(description = "备注", example = "")
    private String remark;

    @Schema(description = "接口的端口号", example = "")
    private String port;

    @Schema(description = "文件名称", example = "")
    private String filename;

    @Schema(description = "可执行文件相对路径", example = "")
    private String runnableFileAddress;

    /** 版本号 */
    @TableField(exist = false)
    private String version;

    /** 版本发布说明 */
    @TableField(exist = false)
    private String description;

    @TableField(exist = false)
    private String classifyName;

}
