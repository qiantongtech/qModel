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

package tech.qiantong.qmodel.module.model.controller.admin.config.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 模型配置测试调用 Response VO
 *
 * @author anivia
 * @date 2026-07-07
 */
@Schema(description = "模型配置测试调用 Response VO")
@Data
public class ModelConfigTestRespVO {

    @Schema(description = "是否成功", example = "true")
    private Boolean success;

    @Schema(description = "HTTP 状态码", example = "200")
    private Integer statusCode;

    @Schema(description = "响应体")
    private String responseBody;

    @Schema(description = "响应头")
    private Map<String, List<String>> responseHeaders;

    @Schema(description = "执行日志")
    private List<String> logs;

    @Schema(description = "错误信息")
    private String errorMsg;

}
