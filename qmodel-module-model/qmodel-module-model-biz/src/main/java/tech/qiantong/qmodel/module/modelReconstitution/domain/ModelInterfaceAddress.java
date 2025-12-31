package tech.qiantong.qmodel.module.modelReconstitution.domain;

import org.apache.commons.lang3.builder.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.domain.*;

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
