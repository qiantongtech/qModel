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

package tech.qiantong.qmodel.module.model.controller.admin.model.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.core.page.PageParam;

/**
 * 模型管理 Request VO 对象 MODEL
 *
 * @author qModel
 * @date 2026-01-07
 */
@Schema(description = "模型管理 Request VO")
@Data
public class ModelPageReqVO extends PageParam {

    private static final long serialVersionUID = 1L;

    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Schema(description = "分类id", example = "")
    private Long classifyId;

    @Schema(description = "父级和自己id", example = "")
    private String ancestors;

    @Schema(description = "模型名称", example = "")
    private String name;

    @Schema(description = "模型介绍", example = "")
    private String description;

    @Schema(description = "所属模型类别 0：水文，1：水动力，2：水质", example = "")
    private Long type;

    @Schema(description = "所属纬度 0：一维，1：二维，2：三维", example = "")
    private Long dimensions;

    @Schema(description = "模型版本号", example = "")
    private String version;

    @Schema(description = "模型调用接口", example = "")
    private String interfaceAddress;

    @Schema(description = "是否内置 0：否，1：是", example = "")
    private Long builtIn;

    @Schema(description = "模型格式", example = "")
    private Long format;

    @Schema(description = "模型大小 0：exe格式", example = "")
    private Long size;

    @Schema(description = "数据来源", example = "")
    private String source;

    @Schema(description = "上传状态", example = "")
    private Long uploadStatus;

    @Schema(description = "上传时间", example = "")
    private Date uploadTime;

    @Schema(description = "上传接口", example = "")
    private String uploadInterface;

    @Schema(description = "上传文件", example = "")
    private String uploadFile;

    @Schema(description = "文件地址", example = "")
    private String uploadLocation;




}
