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

package tech.qiantong.qmodel.module.model.api.invokeHistory.dto;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

/**
 * 模型调用历史记录 DTO 对象 model_invoke_history
 *
 * @author qmodel
 * @date 2026-07-14
 */
@Data
public class ModelInvokeHistoryRespDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 模型id */
    private Long modelId;

    /** 模型名称 */
    private String modelName;

    /** 模型配置资源id */
    private Long resourceId;

    /** 模型版本id */
    private Long versionId;

    /** 请求方式 */
    private String requestMethod;

    /** 调用类型 */
    private String invokeType;

    /** 输入参数（JSON格式） */
    private String inputParams;

    /** 输出结果（JSON格式） */
    private String outputResult;

    /** 开始时间 */
    private Date startTime;

    /** 结束时间 */
    private Date endTime;

    /** 执行耗时（毫秒） */
    private Long duration;

    /** 错误信息 */
    private String errorMessage;

    /** 调用状态 */
    private String status;

    /** 客户端操作IP */
    private String clientIp;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    private Boolean delFlag;


}
