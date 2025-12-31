package tech.qiantong.qmodel.module.model.domain;

import org.apache.commons.lang3.builder.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.domain.*;

/**
 * 模型历史管理 对象 model_operate
 *
 * @author YangWenGuang
 * @date 2023-09-26
 */
public class ModelOperate extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    @Excel(name = "企业id")
    private Long companyId;

    /** 操作模块 */
    @Excel(name = "操作模块")
    private String moduleName;

    /** 操作类型 */
    @Excel(name = "操作类型")
    private Integer type;

    /** 操作内容 */
    @Excel(name = "操作内容")
    private String content;

    /** 请求方式 */
    @Excel(name = "请求方式")
    private String method;

    /** 请求参数 */
    @Excel(name = "请求参数")
    private String reqContent;

    /** 返回参数 */
    @Excel(name = "返回参数")
    private String respContent;

    /** 操作地址(Ip) */
    @Excel(name = "操作地址(Ip)")
    private String ip;

    /** 操作地点 */
    @Excel(name = "操作地点")
    private String address;

    /** 操作状态 */
    @Excel(name = "操作状态")
    private Integer status;

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
    public void setModuleName(String moduleName)
    {
        this.moduleName = moduleName;
    }

    public String getModuleName()
    {
        return moduleName;
    }
    public void setType(Integer type)
    {
        this.type = type;
    }

    public Integer getType()
    {
        return type;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setMethod(String method)
    {
        this.method = method;
    }

    public String getMethod()
    {
        return method;
    }
    public void setReqContent(String reqContent)
    {
        this.reqContent = reqContent;
    }

    public String getReqContent()
    {
        return reqContent;
    }
    public void setRespContent(String respContent)
    {
        this.respContent = respContent;
    }

    public String getRespContent()
    {
        return respContent;
    }
    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getIp()
    {
        return ip;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setStatus(Integer status)
    {
        this.status = status;
    }

    public Integer getStatus()
    {
        return status;
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
            .append("moduleName", getModuleName())
            .append("type", getType())
            .append("content", getContent())
            .append("method", getMethod())
            .append("reqContent", getReqContent())
            .append("respContent", getRespContent())
            .append("ip", getIp())
            .append("address", getAddress())
            .append("status", getStatus())
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
