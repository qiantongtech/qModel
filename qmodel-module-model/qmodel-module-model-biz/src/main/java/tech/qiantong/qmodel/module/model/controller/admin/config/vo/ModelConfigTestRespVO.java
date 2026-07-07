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
