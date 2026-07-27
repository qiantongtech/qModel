/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  
 * This file is part of qModel Module Platform (Open Source Edition).
 *  
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.es.service;

import org.dromara.easyes.core.biz.EsPageInfo;
import tech.qiantong.qmodel.es.model.Search;
import tech.qiantong.qmodel.es.model.example.EsTextDocument;

/**
 * 检索Service
 *
 * @author qModel
 */
public interface ISearchService
{
    /**
     * 查询全文检索数据
     */
    public EsPageInfo<EsTextDocument> selectTextList(Search search);

    /**
     * 新增全文检索数据
     */
    public Integer addEsTextDocument(EsTextDocument esTextDocument);

    /**
     * 修改全文检索数据
     */
    public Integer updateEsTextDocument(EsTextDocument esTextDocument);

    /**
     * 根据ID查询全文检索数据
     */
    public EsTextDocument getEsTextDocument(Long noticeId);

    /**
     * 根据ID删除全文检索数据
     */
    public void deleteEsTextDocument(Long[] noticeIds);

    /**
     * 重置全文检索数据
     */
    public void resetTextCache();
}
