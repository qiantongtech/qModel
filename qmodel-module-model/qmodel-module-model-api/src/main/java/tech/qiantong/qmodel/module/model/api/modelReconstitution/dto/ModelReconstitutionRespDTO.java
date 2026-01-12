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

package tech.qiantong.qmodel.module.model.api.modelReconstitution.dto;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

/**
 * 模型库重构 DTO 对象 MODEL_RECONSTITUTION
 *
 * @author qModel
 * @date 2026-01-12
 */
@Data
public class ModelReconstitutionRespDTO {

    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 模型名称 */
    private String name;

    /** 模型分类 */
    private Long classifyId;

    /** 是否预置 */
    private Long builtin;

    /** 接入方式 */
    private Long accessMode;

    /** 请求方式 */
    private Long requestMethod;

    /** 接口和文件的地址 */
    private String interfaceorfileAddress;

    /** 版本id */
    private Long versionId;

    /** 是否发布 */
    private Long whetherPublish;

    /** 发布时间 */
    private Date publishTime;

    /** 删除标志 */
    private Boolean delFlag;

    /** 接口的端口号 */
    private String port;

    /** 文件名称 */
    private String filename;

    /** 可执行文件相对路径 */
    private String runnableFileAddress;


}