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

package tech.qiantong.qmodel.module.model.api.operate.dto;

import lombok.Data;

/**
 * 模型历史管理 DTO 对象 MODEL_OPERATE
 *
 * @author qModel
 * @date 2026-01-09
 */
@Data
public class ModelOperateReqDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 操作模块 */
    private String moduleName;

    /** 操作类型 */
    private Long type;

    /** 操作内容 */
    private String content;

    /** 请求方式 */
    private String method;

    /** 请求参数 */
    private String reqContent;

    /** 返回参数 */
    private String respContent;

    /** 操作地址(Ip) */
    private String ip;

    /** 操作地点 */
    private String address;

    /** 操作状态 */
    private Integer status;

    /** 是否有效 0：无效，1：有效 */
    private Boolean validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    private Boolean delFlag;


}
