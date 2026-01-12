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

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

/**
 * 接口地址对象 MODEL_INTERFACE_ADDRESS
 *
 * @author shu
 * @date 2024-01-10
 */
public class ModelInterfaceAddress extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 企业id */
    @Excel(name = "企业id")
    private Long companyId;

    /** 模型id */
    @Excel(name = "模型id")
    private Long modelId;

    /** 模型名称 */
    @Excel(name = "模型名称")
    private String modelName;

    /** 接口地址 */
    @Excel(name = "接口地址")
    private String interfaceAddress;

    /** 模型版本id */
    @Excel(name = "模型版本id")
    private Long versionId;

    /** 模型版本 */
    @Excel(name = "模型版本")
    private String version;

    /** 模型版本描述 */
    @Excel(name = "模型版本描述")
    private String description;

    /** 请求方式 */
    @Excel(name = "请求方式")
    private Integer requestMethod;

    /** 输入参数 */
    @Excel(name = "输入参数")
    private String inputParameter;

    /** 输出参数 */
    @Excel(name = "输出参数")
    private String outputParameter;

    /** 输入参数说明 */
    @Excel(name = "输入参数说明")
    private String inputParameterIllustrate;

    /** 输出参数说明 */
    @Excel(name = "输出参数说明")
    private String outputParameterIllustrate;

    /** 删除标志 */
    private Boolean delFlag;

    /** 创建人id */
    @Excel(name = "创建人id")
    private Long creatorId;

    /** 更新人id */
    @Excel(name = "更新人id")
    private Long updatorId;

    public String getInputParameterIllustrate() {
        return inputParameterIllustrate;
    }

    public void setInputParameterIllustrate(String inputParameterIllustrate) {
        this.inputParameterIllustrate = inputParameterIllustrate;
    }

    public String getOutputParameterIllustrate() {
        return outputParameterIllustrate;
    }

    public void setOutputParameterIllustrate(String outputParameterIllustrate) {
        this.outputParameterIllustrate = outputParameterIllustrate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
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
    public void setModelId(Long modelId)
    {
        this.modelId = modelId;
    }

    public Long getModelId()
    {
        return modelId;
    }
    public void setInterfaceAddress(String interfaceAddress)
    {
        this.interfaceAddress = interfaceAddress;
    }

    public String getInterfaceAddress()
    {
        return interfaceAddress;
    }
    public void setVersionId(Long versionId)
    {
        this.versionId = versionId;
    }

    public Long getVersionId()
    {
        return versionId;
    }
    public void setRequestMethod(Integer requestMethod)
    {
        this.requestMethod = requestMethod;
    }

    public Integer getRequestMethod()
    {
        return requestMethod;
    }
    public void setInputParameter(String inputParameter)
    {
        this.inputParameter = inputParameter;
    }

    public String getInputParameter()
    {
        return inputParameter;
    }
    public void setOutputParameter(String outputParameter)
    {
        this.outputParameter = outputParameter;
    }

    public String getOutputParameter()
    {
        return outputParameter;
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
                .append("modelId", getModelId())
                .append("interfaceAddress", getInterfaceAddress())
                .append("versionId", getVersionId())
                .append("requestMethod", getRequestMethod())
                .append("inputParameter", getInputParameter())
                .append("outputParameter", getOutputParameter())
                .append("InputParameterIllustrate", getInputParameterIllustrate())
                .append("outputParameterIllustrate", getOutputParameterIllustrate())
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
