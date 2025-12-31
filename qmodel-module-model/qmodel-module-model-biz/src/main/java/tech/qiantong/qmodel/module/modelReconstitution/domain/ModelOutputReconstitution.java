package tech.qiantong.qmodel.module.modelReconstitution.domain;

import org.apache.commons.lang3.builder.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.domain.*;

/**
 * 模型输出管理对象 model_output
 *
 * @author surge
 * @date 2023-09-26
 */
public class ModelOutputReconstitution extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long id;

    /**
     * 企业Id
     */
    @Excel(name = "企业Id")
    private Long companyId;

    /**
     * 参数名称
     */
    @Excel(name = "参数名称")
    private String name;

    /**
     * 英文名称
     */
    @Excel(name = "英文名称")
    private String engName;

    /**
     * 参数类型 0:单值，1：多列数值
     */
    @Excel(name = "参数类型 0:单值，1：多列数值")
    private Integer type;

    /**
     * 所属模型id
     */
    @Excel(name = "所属模型id")
    private Long modelId;

    /**
     * 所属模型名称
     */
    @Excel(name = "所属模型名称")
    private String modelName;

    /**
     * 所属模型版本
     */
    @Excel(name = "所属模型版本")
    private String modelVersion;

    /**
     * 参数说明(描述)
     */
    @Excel(name = "参数说明(描述)")
    private String description;

    /**
     * 参数单值
     */
    @Excel(name = "参数单值")
    private String singleContent;

    /**
     * 参数多列值
     */
    @Excel(name = "参数多列值")
    private String multipleContent;

    /**
     * 是否有效 0：无效，1：有效
     */
    @Excel(name = "是否有效 0：无效，1：有效")
    private Boolean validFlag;

    /**
     * 删除标志 1：已删除，0：未删除
     */
    private Boolean delFlag;

    /**
     * 创建人id 创建者的sys_user_id
     */
    @Excel(name = "创建人id 创建者的sys_user_id")
    private Long creatorId;

    /**
     * 更新人id 更新者的sys_user_id
     */
    @Excel(name = "更新人id 更新者的sys_user_id")
    private Long updatorId;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setEngName(String engName) {
        this.engName = engName;
    }

    public String getEngName() {
        return engName;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setModelId(Long modelId) {
        this.modelId = modelId;
    }

    public Long getModelId() {
        return modelId;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelVersion(String modelVersion) {
        this.modelVersion = modelVersion;
    }

    public String getModelVersion() {
        return modelVersion;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setSingleContent(String singleContent) {
        this.singleContent = singleContent;
    }

    public String getSingleContent() {
        return singleContent;
    }

    public void setMultipleContent(String multipleContent) {
        this.multipleContent = multipleContent;
    }

    public String getMultipleContent() {
        return multipleContent;
    }

    public void setValidFlag(Boolean validFlag) {
        this.validFlag = validFlag;
    }

    public Boolean getValidFlag() {
        return validFlag;
    }

    public void setDelFlag(Boolean delFlag) {
        this.delFlag = delFlag;
    }

    public Boolean getDelFlag() {
        return delFlag;
    }

    public void setCreatorId(Long creatorId) {
        this.creatorId = creatorId;
    }

    public Long getCreatorId() {
        return creatorId;
    }

    public void setUpdatorId(Long updatorId) {
        this.updatorId = updatorId;
    }

    public Long getUpdatorId() {
        return updatorId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("companyId", getCompanyId())
                .append("name", getName())
                .append("engName", getEngName())
                .append("type", getType())
                .append("modelId", getModelId())
                .append("modelName", getModelName())
                .append("modelVersion", getModelVersion())
                .append("description", getDescription())
                .append("singleContent", getSingleContent())
                .append("multipleContent", getMultipleContent())
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
