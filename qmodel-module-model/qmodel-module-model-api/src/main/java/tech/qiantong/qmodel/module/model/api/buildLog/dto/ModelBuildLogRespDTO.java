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

package tech.qiantong.qmodel.module.model.api.buildLog.dto;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

/**
 * 构建日志 DTO 对象 model_build_log
 *
 * @author qModel
 * @date 2026-07-14
 */
@Data
public class ModelBuildLogRespDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 模型文件id */
    private Long resourceId;

    /** 模型id */
    private Long modelId;

    /** 模型名称 */
    private String modelName;

    /** 版本id */
    private Long versionId;

    /** 构建类型 */
    private String buildType;

    /** 构建状态 */
    private String status;

    /** 开始时间 */
    private Date startTime;

    /** 结束时间 */
    private Date endTime;

    /** 执行耗时 */
    private Long duration;

    /** 已存在的依赖包列表JSON */
    private String installedPackages;

    /** 缺失失败的依赖包列表JSON */
    private String missingPackages;

    /** 安装失败的依赖包列表JSON */
    private String failedPackages;

    /** dockerFile内容 */
    private String dockerfileContent;

    /** 构建日志 */
    private String buildLog;

    /** 错误日志 */
    private String errorMessage;

    /** requirements.txt 内容 */
    private String requirements;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    private Boolean delFlag;


}
