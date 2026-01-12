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

package tech.qiantong.qmodel.module.model.api.model.dto;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

/**
 * 模型管理 DTO 对象 MODEL
 *
 * @author qModel
 * @date 2026-01-07
 */
@Data
public class ModelReqDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 分类id */
    private Long classifyId;

    /** 父级和自己id */
    private String ancestors;

    /** 模型名称 */
    private String name;

    /** 模型介绍 */
    private String description;

    /** 所属模型类别 0：水文，1：水动力，2：水质 */
    private Long type;

    /** 所属纬度 0：一维，1：二维，2：三维 */
    private Long dimensions;

    /** 模型版本号 */
    private String version;

    /** 模型调用接口 */
    private String interfaceAddress;

    /** 是否内置 0：否，1：是 */
    private Long builtin;

    /** 模型格式 */
    private Long format;

    /** 模型大小 0：exe格式 */
    private Long size;

    /** 数据来源 */
    private String source;

    /** 上传状态 */
    private Long uploadStatus;

    /** 上传时间 */
    private Date uploadTime;

    /** 上传接口 */
    private String uploadInterface;

    /** 上传文件 */
    private String uploadFile;

    /** 文件地址 */
    private String uploadLocation;

    /** 是否有效 0：无效，1：有效 */
    private Boolean validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    private Boolean delFlag;


}
