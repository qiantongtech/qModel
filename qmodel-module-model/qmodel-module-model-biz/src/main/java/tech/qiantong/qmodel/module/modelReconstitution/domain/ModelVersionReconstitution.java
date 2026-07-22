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

package tech.qiantong.qmodel.module.modelReconstitution.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

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
