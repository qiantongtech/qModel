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
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型库重构 Request VO 对象 MODEL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Schema(description = "模型库重构 Request VO")
@Data
public class ModelReconstitutionPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "模型名称", example = "")
    private String name;

    @Schema(description = "模型分类", example = "")
    private Long classifyId;

    @Schema(description = "是否预置", example = "")
    private Long builtin;

    @Schema(description = "接入方式", example = "")
    private Long accessMode;

    @Schema(description = "请求方式", example = "")
    private Long requestMethod;

    @Schema(description = "接口和文件的地址", example = "")
    private String interfaceorfileAddress;

    @Schema(description = "版本id", example = "")
    private Long versionId;

    @Schema(description = "是否发布", example = "")
    private Long whetherPublish;

    @Schema(description = "发布时间", example = "")
    private Date publishTime;


    @Schema(description = "接口的端口号", example = "")
    private String port;

    @Schema(description = "文件名称", example = "")
    private String fileName;

    @Schema(description = "可执行文件相对路径", example = "")
    private String runnableFileAddress;


}
