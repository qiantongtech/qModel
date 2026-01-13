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

package tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;

/**
 * 接口地址 创建/修改 Request VO MODEL_INTERFACE_ADDRESS
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "接口地址 Response VO")
@Data
public class ModelInterfaceAddressSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Schema(description = "接口地址", example = "")
    @NotBlank(message = "接口地址不能为空")
    private String interfaceAddress;

    @Schema(description = "模型版本id", example = "")
    private Long versionId;

    @Schema(description = "请求方式", example = "")
    private Integer requestMethod;

    @Schema(description = "输入参数", example = "")
    @NotBlank(message = "输入参数不能为空")
    private String inputParameter;

    @Schema(description = "输出参数", example = "")
    @NotBlank(message = "输出参数不能为空")
    private String outputParameter;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    private String remark;

    @Schema(description = "输入参数说明", example = "")
    @NotBlank(message = "输入参数说明不能为空")
    private String inputParameterIllustrate;

    @Schema(description = "输出参数说明", example = "")
    @NotBlank(message = "输出参数说明不能为空")
    private String outputParameterIllustrate;

    @Schema(description = "模型名称", example = "")
    @TableField(exist = false)
    private String modelName;

    @Schema(description = "模型版本", example = "")
    @TableField(exist = false)
    private String version;

}
