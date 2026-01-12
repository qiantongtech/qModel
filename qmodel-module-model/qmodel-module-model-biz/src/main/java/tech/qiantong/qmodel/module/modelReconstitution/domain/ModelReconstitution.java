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

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import tech.qiantong.qmodel.common.annotation.Excel;
import tech.qiantong.qmodel.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 模型库的重构表对象 MODEL_RECONSTITUTION
 *
 * @author model
 * @date 2024-01-02
 */
public class ModelReconstitution extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 企业id */
    @Excel(name = "企业id")
    private Long companyId;

    /** 模型名称 */
    @Excel(name = "模型名称")
    private String name;

    /** 模型分类 */
    @Excel(name = "模型分类")
    private Long classifyId;

    /** 模型分类名称 */
    @Excel(name = "模型分类名称")
    private String classifyName;

    /** 是否预置 1：是，0：否*/
    @Excel(name = "是否预置")
    private Integer builtin;

    /** 接入方式 1：api接口，0：单机程序（exe）*/
    @Excel(name = "接入方式")
    private Integer accessMode;

    /** 请求方式 0：get，1：post，2：put，3：delete */
    @Excel(name = "请求方式")
    private Integer requestMethod;

    /** 接口和文件的地址 */
    @Excel(name = "接口和文件的地址")
    private String interfaceorfileAddress;

    /** 接口和文件的地址 */
    private String runnableFileAddress;

    /** 接口端口号 */
    @Excel(name = "接口端口号")
    private String port;

    /** 文件名称 */
    @Excel(name = "接口端口号")
    private String fileName;

    /** 版本id */
    @Excel(name = "版本id")
    private Long versionId;

    /** 版本号 */
    @Excel(name = "版本号")
    private String version;

    /** 版本说明 */
    @Excel(name = "版本说明")
    private String description;

    /** 是否发布 1：是，0：否*/
    @Excel(name = "是否发布")
    private Integer whetherPublish;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date publishTime;

    /** 删除标志 */
    private Boolean delFlag;

    /** 创建人id */
    @Excel(name = "创建人id")
    private Long creatorId;

    /** 更新人id */
    @Excel(name = "更新人id")
    private Long updatorId;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
    public void setClassifyId(Long classifyId)
    {
        this.classifyId = classifyId;
    }

    public Long getClassifyId()
    {
        return classifyId;
    }
    public void setBuiltin(Integer builtin)
    {
        this.builtin = builtin;
    }

    public Integer getBuiltin()
    {
        return builtin;
    }
    public void setAccessMode(Integer accessMode)
    {
        this.accessMode = accessMode;
    }

    public Integer getAccessMode()
    {
        return accessMode;
    }
    public void setRequestMethod(Integer requestMethod)
    {
        this.requestMethod = requestMethod;
    }

    public Integer getRequestMethod()
    {
        return requestMethod;
    }
    public void setInterfaceorfileAddress(String interfaceorfileAddress)
    {
        this.interfaceorfileAddress = interfaceorfileAddress;
    }

    public String getInterfaceorfileAddress()
    {
        return interfaceorfileAddress;
    }
    public void setVersionId(Long versionId)
    {
        this.versionId = versionId;
    }

    public Long getVersionId()
    {
        return versionId;
    }
    public void setWhetherPublish(Integer whetherPublish)
    {
        this.whetherPublish = whetherPublish;
    }

    public Integer getWhetherPublish()
    {
        return whetherPublish;
    }
    public void setPublishTime(Date publishTime)
    {
        this.publishTime = publishTime;
    }

    public Date getPublishTime()
    {
        return publishTime;
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
                .append("classifyId", getClassifyId())
                .append("builtin", getBuiltin())
                .append("accessMode", getAccessMode())
                .append("requestMethod", getRequestMethod())
                .append("interfaceorfileAddress", getInterfaceorfileAddress())
                .append("versionId", getVersionId())
                .append("whetherPublish", getWhetherPublish())
                .append("publishTime", getPublishTime())
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

  public String getRunnableFileAddress() {
    return runnableFileAddress;
  }

  public void setRunnableFileAddress(String runnableFileAddress) {
    this.runnableFileAddress = runnableFileAddress;
  }
}
