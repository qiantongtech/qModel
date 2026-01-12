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

package tech.qiantong.qmodel.module.model.controller.admin.input.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 模型输入管理 创建/修改 Request VO MODEL_INPUT
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "模型输入管理 Response VO")
@Data
public class ModelInputSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业Id", example = "")
    private Long companyId;

    @Schema(description = "参数名称", example = "")
    @NotBlank(message = "参数名称不能为空")
    private String name;

    @Schema(description = "英文名称", example = "")
//    @NotBlank(message = "英文名称不能为空")
    private String engName;

    @Schema(description = "参数类型 0:单值，1：多列数值，2：文件", example = "")
    @NotNull(message = "参数类型不能为空")
    private Long type;

    @Schema(description = "所属模型id", example = "")
    private Long modelId;

    @Schema(description = "所属模型名称", example = "")
//    @NotBlank(message = "所属模型名称不能为空")
    private String modelName;

    @Schema(description = "所属模型版本", example = "")
    @NotBlank(message = "所属模型版本不能为空")
    private String modelVersion;

    @Schema(description = "参数说明(描述)", example = "")
    private String description;

    @Schema(description = "参数示例", example = "")
//    @NotBlank(message = "参数示例不能为空")
    private String example;

    @Schema(description = "参数文件", example = "")
//    @NotBlank(message = "参数文件不能为空")
    private String paramFile;

    @Schema(description = "参数单值", example = "")
//    @NotBlank(message = "参数单值不能为空")
    private String singleContent;

    @Schema(description = "参数多列值", example = "")
//    @NotBlank(message = "参数多列值不能为空")
    private String multipleContent;

    @Schema(description = "备注", example = "")
    private String remark;

    @Schema(description = "是否可变", example = "")
    private Boolean changeFlag;


}
