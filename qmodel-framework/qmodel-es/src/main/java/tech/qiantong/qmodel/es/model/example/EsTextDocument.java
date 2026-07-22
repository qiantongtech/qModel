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

package tech.qiantong.qmodel.es.model.example;

import org.dromara.easyes.annotation.HighLight;
import org.dromara.easyes.annotation.IndexField;
import org.dromara.easyes.annotation.IndexId;
import org.dromara.easyes.annotation.IndexName;
import org.dromara.easyes.annotation.rely.Analyzer;
import org.dromara.easyes.annotation.rely.FieldType;
import org.dromara.easyes.annotation.rely.IdType;

/**
 * 全文索引 ES数据模型
 *
 * @author qModel*/
@IndexName("text_document")
public class EsTextDocument
{
    /**
     * es中的唯一id
     */
    @IndexId(type = IdType.NONE)
    private String id;

    /** 公告ID */
    private Long noticeId;

    /** 公告标题 */
    @HighLight(preTag = "<font color=\"red\">", postTag = "</font>")
    @IndexField(fieldType = FieldType.TEXT, analyzer = Analyzer.IK_SMART, searchAnalyzer = Analyzer.IK_MAX_WORD)
    private String noticeTitle;

    /** 公告类型 */
    private String noticeType;

    /** 内容 */
    @HighLight(preTag = "<font color=\"red\">", postTag = "</font>")
    @IndexField(fieldType = FieldType.TEXT, analyzer = Analyzer.IK_SMART, searchAnalyzer = Analyzer.IK_MAX_WORD)
    private String noticeContent;

    /** 公告状态 */
    private String status;

    public String getId()
    {
        return id;
    }

    public Long getNoticeId()
    {
        return noticeId;
    }

    public String getNoticeTitle()
    {
        return noticeTitle;
    }

    public String getNoticeType()
    {
        return noticeType;
    }

    public String getNoticeContent()
    {
        return noticeContent;
    }

    public String getStatus()
    {
        return status;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public void setNoticeId(Long noticeId)
    {
        this.noticeId = noticeId;
    }

    public void setNoticeTitle(String noticeTitle)
    {
        this.noticeTitle = noticeTitle;
    }

    public void setNoticeType(String noticeType)
    {
        this.noticeType = noticeType;
    }

    public void setNoticeContent(String noticeContent)
    {
        this.noticeContent = noticeContent;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
}
