package tech.qiantong.qmodel.es.service;

import tech.qiantong.qmodel.es.model.example.EsTextDocument;
import tech.qiantong.qmodel.es.model.Search;
import org.dromara.easyes.core.biz.EsPageInfo;

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
