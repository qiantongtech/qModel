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

package tech.qiantong.qmodel.module.modelReconstitution.domain;

import lombok.*;
import org.apache.commons.lang3.builder.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.domain.*;

/**
 * 版本管理对象 model_version
 *
 * @author surge
 * @date 2023-09-15
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ModelVersionReconstitution extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    @Excel(name = "企业id")
    private Long companyId;

    /** 所属模型id */
    @Excel(name = "所属模型id")
    private Long modelId;

    /** 所属模型名称 */
    @Excel(name = "所属模型名称")
    private String modelName;

    /** 模型版本号 */
    @Excel(name = "模型版本号")
    private String version;

    /** 文件地址 */
    @Excel(name = "文件地址")
    private String fileAddress;

    /** 文件名称 */
    @Excel(name = "文件地址")
    private String fileName;

    /** 接口地址 */
    @Excel(name = "接口地址")
    private String interfaceAddress;

    /** 版本状态 */
    @Excel(name = "版本状态")
    private Integer status;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 是否有效 0：无效，1：有效 */
    @Excel(name = "是否有效 0：无效，1：有效")
    private Boolean validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    private Boolean delFlag;

    /** 创建人id 创建者的sys_user_id */
    @Excel(name = "创建人id 创建者的sys_user_id")
    private Long creatorId;

    /** 更新人id 更新者的sys_user_id */
    @Excel(name = "更新人id 更新者的sys_user_id")
    private Long updatorId;

    /** 接口和文件的地址 */
    @Excel(name = "可执行文件相对路径")
    private String runnableFileAddress;

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("companyId", getCompanyId())
            .append("modelId", getModelId())
            .append("modelName", getModelName())
            .append("version", getVersion())
            .append("fileAddress", getFileAddress())
            .append("interfaceAddress", getInterfaceAddress())
            .append("status", getStatus())
            .append("description", getDescription())
            .append("validFlag", getValidFlag())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("creatorId", getCreatorId())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updatorId", getUpdatorId())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("runnableFileAddress", getRunnableFileAddress())
            .toString();
    }
}
