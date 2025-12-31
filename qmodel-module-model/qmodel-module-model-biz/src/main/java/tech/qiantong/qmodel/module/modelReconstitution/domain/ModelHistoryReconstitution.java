package tech.qiantong.qmodel.module.modelReconstitution.domain;

import com.fasterxml.jackson.annotation.*;
import org.apache.commons.lang3.builder.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.domain.*;

import java.util.*;

/**
 * 操作历史对象 model_history
 *
 * @author surge
 * @date 2023-09-15
 */
public class ModelHistoryReconstitution extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    private Long companyId;

    /** 所属模型id */
    @Excel(name = "所属模型id")
    private Long modelId;

    /** 所属模型名称 */
    @Excel(name = "所属模型名称")
    private String modelName;

    /** 操作内容 */
    @Excel(name = "操作内容")
    private String context;

    /** 启用时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "启用时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 启用版本号 */
    @Excel(name = "启用版本号")
    private String modelVersion;

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
    public void setModelName(String modelName)
    {
        this.modelName = modelName;
    }

    public String getModelName()
    {
        return modelName;
    }
    public void setContext(String context)
    {
        this.context = context;
    }

    public String getContext()
    {
        return context;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setModelVersion(String modelVersion)
    {
        this.modelVersion = modelVersion;
    }

    public String getModelVersion()
    {
        return modelVersion;
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
            .append("modelId", getModelId())
            .append("modelName", getModelName())
            .append("context", getContext())
            .append("startTime", getStartTime())
            .append("modelVersion", getModelVersion())
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
