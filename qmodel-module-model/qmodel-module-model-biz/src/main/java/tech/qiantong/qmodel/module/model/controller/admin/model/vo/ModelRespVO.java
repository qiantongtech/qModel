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

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import tech.qiantong.qmodel.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * 模型管理 Response VO 对象 MODEL
 *
 * @author qModel
 * @date 2026-01-07
 */
@Schema(description = "模型管理 Response VO")
@Data
public class ModelRespVO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Excel(name = "ID")
    @Schema(description = "ID", example = "")
    private Long id;

    @Excel(name = "企业id")
    @Schema(description = "企业id", example = "")
    private Long companyId;

    @Excel(name = "分类id")
    @Schema(description = "分类id", example = "")
    private Long classifyId;

    @Excel(name = "父级和自己id")
    @Schema(description = "父级和自己id", example = "")
    private String ancestors;

    @Excel(name = "模型名称")
    @Schema(description = "模型名称", example = "")
    private String name;

    @Excel(name = "模型介绍")
    @Schema(description = "模型介绍", example = "")
    private String description;

    @Excel(name = "所属模型类别 0：水文，1：水动力，2：水质")
    @Schema(description = "所属模型类别 0：水文，1：水动力，2：水质", example = "")
    private Long type;

    @Excel(name = "所属纬度 0：一维，1：二维，2：三维")
    @Schema(description = "所属纬度 0：一维，1：二维，2：三维", example = "")
    private Long dimensions;

    @Excel(name = "模型版本号")
    @Schema(description = "模型版本号", example = "")
    private String version;

    @Excel(name = "模型调用接口")
    @Schema(description = "模型调用接口", example = "")
    private String interfaceAddress;

    @Excel(name = "是否内置 0：否，1：是")
    @Schema(description = "是否内置 0：否，1：是", example = "")
    private Long builtin;

    @Excel(name = "模型格式")
    @Schema(description = "模型格式", example = "")
    private Long format;

    @Excel(name = "模型大小 0：exe格式")
    @Schema(description = "模型大小 0：exe格式", example = "")
    private Long size;

    @Excel(name = "数据来源")
    @Schema(description = "数据来源", example = "")
    private String source;

    @Excel(name = "上传状态")
    @Schema(description = "上传状态", example = "")
    private Long uploadStatus;

    @Excel(name = "上传时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-dd HH:mm:ss")
    @Schema(description = "上传时间", example = "")
    private Date uploadTime;

    @Excel(name = "上传接口")
    @Schema(description = "上传接口", example = "")
    private String uploadInterface;

    @Excel(name = "上传文件")
    @Schema(description = "上传文件", example = "")
    private String uploadFile;

    @Excel(name = "文件地址")
    @Schema(description = "文件地址", example = "")
    private String uploadLocation;

    @Excel(name = "是否有效 0：无效，1：有效")
    @Schema(description = "是否有效 0：无效，1：有效", example = "")
    private Boolean validFlag;

    @Excel(name = "删除标志 1：已删除，0：未删除")
    @Schema(description = "删除标志 1：已删除，0：未删除", example = "")
    private Boolean delFlag;

    @Excel(name = "创建人")
    @Schema(description = "创建人", example = "")
    private String createBy;

    @Excel(name = "创建人id 创建者的sys_user_id")
    @Schema(description = "创建人id 创建者的sys_user_id", example = "")
    private Long creatorId;

    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-dd HH:mm:ss")
    @Schema(description = "创建时间", example = "")
    private Date createTime;

    @Excel(name = "更新人")
    @Schema(description = "更新人", example = "")
    private String updateBy;

    @Excel(name = "更新人id 更新者的sys_user_id")
    @Schema(description = "更新人id 更新者的sys_user_id", example = "")
    private Long updatorId;

    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-dd HH:mm:ss")
    @Schema(description = "更新时间", example = "")
    private Date updateTime;

    @Excel(name = "备注")
    @Schema(description = "备注", example = "")
    private String remark;

}
