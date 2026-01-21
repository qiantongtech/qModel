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

package tech.qiantong.qmodel.module.model.controller.admin.operate.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;

/**
 * 模型历史管理 创建/修改 Request VO MODEL_OPERATE
 *
 * @author qModel
 * @date 2026-01-09
 */
@Schema(description = "模型历史管理 Response VO")
@Data
public class ModelOperateSaveReqVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "操作模块", example = "")
    @NotBlank(message = "操作模块不能为空")
    private String moduleName;

    @Schema(description = "操作类型", example = "")
    private Integer type;

    @Schema(description = "操作内容", example = "")
    @NotBlank(message = "操作内容不能为空")
    private String content;

    @Schema(description = "请求方式", example = "")
    @NotBlank(message = "请求方式不能为空")
    private String method;

    @Schema(description = "请求参数", example = "")
    @NotBlank(message = "请求参数不能为空")
    private String reqContent;

    @Schema(description = "返回参数", example = "")
    @NotBlank(message = "返回参数不能为空")
    private String respContent;

    @Schema(description = "操作地址(Ip)", example = "")
    @NotBlank(message = "操作地址(Ip)不能为空")
    private String ip;

    @Schema(description = "操作地点", example = "")
    @NotBlank(message = "操作地点不能为空")
    private String address;

    @Schema(description = "操作状态", example = "")
    private Integer status;

    @Schema(description = "备注", example = "")
    @NotBlank(message = "备注不能为空")
    private String remark;


}
