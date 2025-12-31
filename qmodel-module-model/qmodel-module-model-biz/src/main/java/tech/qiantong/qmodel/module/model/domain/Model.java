package tech.qiantong.qmodel.module.model.domain;

import com.fasterxml.jackson.annotation.*;
import org.apache.commons.lang3.builder.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.domain.*;

import java.util.*;

/**
 * 模型管理 对象 model
 *
 * @author YWG
 * @date 2023-09-14
 */
public class Model extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 企业id */
    private Long companyId;
    /** 分类id */
    private Long classifyId;
    /** 父类和自己id */
    private String ancestors;

    /** 模型名称 */
    @Excel(name = "模型名称")
    private String name;

    /** 模型介绍 */
    @Excel(name = "模型介绍")
    private String description;

    /** 所属模型类别 0：水文，1：水动力，2：水质 */
    @Excel(name = "所属模型类别 0：水文，1：水动力，2：水质")
    private Integer type;

    /** 所属纬度 0：一维，1：二维，2：三维 */
    @Excel(name = "所属纬度 0：一维，1：二维，2：三维")
    private Integer dimensions;

    /** 模型版本号 */
    @Excel(name = "模型版本号")
    private String version;

    /** 模型调用接口 */
    @Excel(name = "模型调用接口")
    private String interfaceAddress;

    /** 是否内置 0：否，1：是 */
    @Excel(name = "是否内置 0：否，1：是")
    private Integer builtin;

    /** 模型格式 */
    @Excel(name = "模型格式")
    private Integer format;

    /** 模型大小 0：exe格式 */
    @Excel(name = "模型大小 0：exe格式")
    private Integer size;

    /** 数据来源 */
    @Excel(name = "数据来源")
    private String source;

    /** 上传状态 */
    @Excel(name = "上传状态")
    private Integer uploadStatus;

    /** 上传时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上传时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date uploadTime;

    /** 上传接口 */
    @Excel(name = "上传接口")
    private String uploadInterface;

    /** 上传接口 */
    @Excel(name = "上传文件")
    private String uploadFile;

    /** 文件地址 */
    @Excel(name = "文件地址")
    private String uploadLocation;

    /** 是否有效 0：无效，1：有效 */
    @Excel(name = "是否有效 0：无效，1：有效")
    private Integer validFlag;

    /** 删除标志 1：已删除，0：未删除 */
    private Boolean delFlag;

    /** 创建人id 创建者的sys_user_id */
    @Excel(name = "创建人id 创建者的sys_user_id")
    private Long creatorId;

    /** 更新人id 更新者的sys_user_id */
    @Excel(name = "更新人id 更新者的sys_user_id")
    private Long updatorId;

    public Long getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Long classifyId) {
        this.classifyId = classifyId;
    }

    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }

    public String getUploadInterface() {
        return uploadInterface;
    }

    public void setUploadInterface(String uploadInterface) {
        this.uploadInterface = uploadInterface;
    }

    public String getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(String uploadFile) {
        this.uploadFile = uploadFile;
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
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setType(Integer type)
    {
        this.type = type;
    }

    public Integer getType()
    {
        return type;
    }
    public void setDimensions(Integer dimensions)
    {
        this.dimensions = dimensions;
    }

    public Integer getDimensions()
    {
        return dimensions;
    }
    public void setVersion(String version)
    {
        this.version = version;
    }

    public String getVersion()
    {
        return version;
    }
    public void setInterfaceAddress(String interfaceAddress)
    {
        this.interfaceAddress = interfaceAddress;
    }

    public String getInterfaceAddress()
    {
        return interfaceAddress;
    }
    public void setBuiltin(Integer builtin)
    {
        this.builtin = builtin;
    }

    public Integer getBuiltin()
    {
        return builtin;
    }
    public void setFormat(Integer format)
    {
        this.format = format;
    }

    public Integer getFormat()
    {
        return format;
    }
    public void setSize(Integer size)
    {
        this.size = size;
    }

    public Integer getSize()
    {
        return size;
    }
    public void setSource(String source)
    {
        this.source = source;
    }

    public String getSource()
    {
        return source;
    }
    public void setUploadStatus(Integer uploadStatus)
    {
        this.uploadStatus = uploadStatus;
    }

    public Integer getUploadStatus()
    {
        return uploadStatus;
    }
    public void setUploadTime(Date uploadTime)
    {
        this.uploadTime = uploadTime;
    }

    public Date getUploadTime()
    {
        return uploadTime;
    }
    public void setUploadLocation(String uploadLocation)
    {
        this.uploadLocation = uploadLocation;
    }

    public String getUploadLocation()
    {
        return uploadLocation;
    }
    public void setValidFlag(Integer validFlag)
    {
        this.validFlag = validFlag;
    }

    public Integer getValidFlag()
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
            .append("name", getName())
            .append("description", getDescription())
            .append("type", getType())
            .append("dimensions", getDimensions())
            .append("version", getVersion())
            .append("interfaceAddress", getInterfaceAddress())
            .append("builtin", getBuiltin())
            .append("format", getFormat())
            .append("size", getSize())
            .append("source", getSource())
            .append("uploadStatus", getUploadStatus())
            .append("uploadTime", getUploadTime())
            .append("uploadLocation", getUploadLocation())
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
