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

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 模型计算管理 对象 model_cacl
 *
 * @author Ywg
 * @date 2023-09-26
 */
public class ModelCaclReconstitution extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    @Excel(name = "企业id")
    private Long companyId;

    /** 计算编码 */
    @Excel(name = "计算编码")
    private String code;

    /** 计算名称 */
    @Excel(name = "计算名称")
    private String name;

    /** 模型id */
    @Excel(name = "模型id")
    private Long modelId;

    /** 模型名称 */
    @Excel(name = "模型名称")
    private String modelName;

    /** 模型版本 */
    @Excel(name = "模型版本")
    private String modelVersion;

    /** 开始时间 */
//    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 结束时间 */
//    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 计算状态 */
    @Excel(name = "计算状态")
    private Integer status;

    /** 模型输入内容 */
    @Excel(name = "模型输入内容")
    private String inputContent;

    /** 模型输出内容 */
    @Excel(name = "模型输出内容")
    private String outputContent;

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

    /** 接口地址或是文件地址的id */
    private Long addressId;

    /** 判断是文件地址id还是接口地址id 0:文件id,1: 接口id*/
    private Integer addressType;

    /** 地址 */
    private String address;

    /** 请求方式  0：get，1：post，2：put，3：delete*/
    private Integer requestMethod;

    public Integer getRequestMethod() {
        return requestMethod;
    }

    public void setRequestMethod(Integer requestMethod) {
        this.requestMethod = requestMethod;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public Integer getAddressType() {
        return addressType;
    }

    public void setAddressType(Integer addressType) {
        this.addressType = addressType;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setCompanyId(Long companyId)
    {
        this.companyId = companyId;
    }

    public Long getCompanyId()
    {
        return companyId;
    }
    public void setCode(String code)
    {
        this.code = code;
    }

    public String getCode()
    {
        return code;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setModelId(Long modelId)
    {
        this.modelId = modelId;
    }

    public Long getModelId()
    {
        return modelId;
    }
    public void setModelName(String modelName)
    {
        this.modelName = modelName;
    }

    public String getModelName()
    {
        return modelName;
    }
    public void setModelVersion(String modelVersion)
    {
        this.modelVersion = modelVersion;
    }

    public String getModelVersion()
    {
        return modelVersion;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }
    public void setStatus(Integer status)
    {
        this.status = status;
    }

    public Integer getStatus()
    {
        return status;
    }
    public void setInputContent(String inputContent)
    {
        this.inputContent = inputContent;
    }

    public String getInputContent()
    {
        return inputContent;
    }
    public void setOutputContent(String outputContent)
    {
        this.outputContent = outputContent;
    }

    public String getOutputContent()
    {
        return outputContent;
    }
    public void setValidFlag(Boolean validFlag)
    {
        this.validFlag = validFlag;
    }

    public Boolean getValidFlag()
    {
        return validFlag;
    }
    public void setDelFlag(Boolean delFlag)
    {
        this.delFlag = delFlag;
    }

    public Boolean getDelFlag()
    {
        return delFlag;
    }
    public void setCreatorId(Long creatorId)
    {
        this.creatorId = creatorId;
    }

    public Long getCreatorId()
    {
        return creatorId;
    }
    public void setUpdatorId(Long updatorId)
    {
        this.updatorId = updatorId;
    }

    public Long getUpdatorId()
    {
        return updatorId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("companyId", getCompanyId())
                .append("code", getCode())
                .append("name", getName())
                .append("modelId", getModelId())
                .append("modelName", getModelName())
                .append("modelVersion", getModelVersion())
                .append("startTime", getStartTime())
                .append("endTime", getEndTime())
                .append("status", getStatus())
                .append("inputContent", getInputContent())
                .append("outputContent", getOutputContent())
                .append("validFlag", getValidFlag())
                .append("delFlag", getDelFlag())
                .append("createBy", getCreateBy())
                .append("creatorId", getCreatorId())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updatorId", getUpdatorId())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
