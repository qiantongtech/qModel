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

package tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;

/**
 * 模型调用历史记录 Response VO 对象 model_invoke_history
 *
 * @author qmodel
 * @date 2026-07-14
 */
@Schema(description = "模型调用历史记录 Response VO")
@Data
public class ModelInvokeHistoryRespVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    @Schema(description = "ID")
    private Long id;

    @Excel(name = "模型id")
    @Schema(description = "模型id", example = "")
    private Long modelId;

    @Excel(name = "模型名称")
    @Schema(description = "模型名称", example = "")
    private String modelName;

    @Excel(name = "模型配置资源id")
    @Schema(description = "模型配置资源id", example = "")
    private Long resourceId;

    @Excel(name = "模型版本id")
    @Schema(description = "模型版本id", example = "")
    private Long versionId;

    @Excel(name = "请求方式")
    @Schema(description = "请求方式", example = "")
    private String requestMethod;

    @Excel(name = "调用类型")
    @Schema(description = "调用类型", example = "")
    private String invokeType;

    @Excel(name = "输入参数", readConverterExp = "J=SON格式")
    @Schema(description = "输入参数", example = "")
    private String inputParams;

    @Excel(name = "输出结果", readConverterExp = "J=SON格式")
    @Schema(description = "输出结果", example = "")
    private String outputResult;

    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "开始时间", example = "")
    private Date startTime;

    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "结束时间", example = "")
    private Date endTime;

    @Excel(name = "执行耗时", readConverterExp = "毫=秒")
    @Schema(description = "执行耗时", example = "")
    private Long duration;

    @Excel(name = "错误信息")
    @Schema(description = "错误信息", example = "")
    private String errorMessage;

    @Excel(name = "调用状态")
    @Schema(description = "调用状态", example = "")
    private String status;

    @Excel(name = "客户端操作IP")
    @Schema(description = "客户端操作IP", example = "")
    private String clientIp;

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

    @Schema(description = "模型编码", example = "")
    private String code;

    @Schema(description = "模型版本号", example = "")
    private String version;
}
