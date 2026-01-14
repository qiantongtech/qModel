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

package tech.qiantong.qmodel.module.model.controller.admin.cacl.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;
import java.util.Date;

/**
 * 模型计算重构 创建/修改 Request VO MODEL_CACL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Schema(description = "模型计算重构 Response VO")
@Data
public class ModelCaclSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "计算编码", example = "")
    private String code;

    @Schema(description = "计算名称", example = "")
    @NotBlank(message = "计算名称不能为空")
    private String name;

    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "模型名称", example = "")
    @NotBlank(message = "模型名称不能为空")
    private String modelName;

    @Schema(description = "模型版本", example = "")
    @NotBlank(message = "模型版本不能为空")
    private String modelVersion;

    @Schema(description = "开始时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @Schema(description = "结束时间", example = "")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    @Schema(description = "计算状态", example = "")
    private Long status;

    @Schema(description = "模型输入内容", example = "")
    private String inputContent;

    @Schema(description = "模型输出内容", example = "")
    private String outputContent;

    @Schema(description = "备注", example = "")
    private String remark;

    @Schema(description = "文件或接口地址id", example = "")
    private Long addressId;

    @Schema(description = "判断是文件的id还是地址的id，0:文件，1：接口", example = "")
    private Long addressType;

    @Schema(description = "文件计算的历史方案id", example = "")
    private Long mpProgrammeId;


}
