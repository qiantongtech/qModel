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

package tech.qiantong.qmodel.module.model.api.calc.dto;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

/**
 * 模型计算任务 DTO 对象 model_calc
 *
 * @author qModel
 * @date 2026-07-27
 */
@Data
public class ModelCalcRespDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 租户/公司ID */
    private Long companyId;

    /** 计算编码 */
    private String code;

    /** 任务名称 */
    private String name;

    /** 模型分类ID */
    private Long classifyId;

    /** 模型分类名称 */
    private String classifyName;

    /** 关联模型ID */
    private Long modelId;

    /** 模型名称 */
    private String modelName;

    /** 模型版本号 */
    private String modelVersion;

    /** 模型版本ID */
    private Long modelVersionId;

    /** 描述 */
    private String description;

    /** 输入参数(JSON格式) */
    private String inputParams;

    /** 输出结果(JSON格式) */
    private String outputResult;

    /** 开始时间 */
    private Date startTime;

    /** 结束时间 */
    private Date endTime;

    /** 耗时(毫秒) */
    private Long duration;

    /** 计算状态:0-待执行,1-运行中,2-计算成功,3-计算失败,4-已终止,5-排队中 */
    private Integer status;

    /** 超时时间(秒) */
    private Long timeoutSeconds;

    /** 已重试次数 */
    private Long retryCount;

    /** 最大重试次数 */
    private Long maxRetryCount;

    /** 优先级:1-高,2-中,3-低 */
    private Integer priority;

    /** 错误信息 */
    private String errorMessage;

    /** 文件或接口资源ID */
    private Long resourceId;

    /** 接入方式: 0-API接口, 1-Python本地 */
    private Integer calcType;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    private Boolean delFlag;


}
