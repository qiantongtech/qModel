package tech.qiantong.qmodel.module.system.controller.admin.example.es;

import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.page.TableDataInfo;
import tech.qiantong.qmodel.common.utils.bean.BeanUtils;
import tech.qiantong.qmodel.es.model.Search;
import tech.qiantong.qmodel.es.model.example.EsTextDocument;
import tech.qiantong.qmodel.module.system.domain.SysNotice;
import tech.qiantong.qmodel.module.system.service.ISysNoticeService;
import tech.qiantong.qmodel.es.service.ISearchService;
import org.dromara.easyes.core.biz.EsPageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 测试管理[全文检索]
 *
 * @author anivia
 */
@RestController
@RequestMapping("/search/fulltext")
public class TextSearchController
{
    @Autowired
    private ISearchService searchService;

    @Autowired
    private ISysNoticeService noticeService;

    /**
     * 查询全文检索列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Search search) {
        EsPageInfo<EsTextDocument> esPageInfo = searchService.selectTextList(search);
        long total = esPageInfo.getTotal();
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(esPageInfo.getList());
        rspData.setTotal(total > 200 ? 200 : total);
        return rspData;
    }

    /**
     * 新增保存公告
     */
    @PostMapping
    public AjaxResult addSave(@Validated @RequestBody SysNotice notice) {
        noticeService.insertNotice(notice);
        EsTextDocument esTextDocument = new EsTextDocument();
        BeanUtils.copyBeanProp(esTextDocument, notice);
        searchService.addEsTextDocument(esTextDocument);
        return AjaxResult.success();
    }

    /**
     * 根据通知公告编号获取详细信息
     */
    @GetMapping(value = "/{noticeId}")
    public AjaxResult getInfo(@PathVariable Long noticeId) {
        EsTextDocument esTextDocument = searchService.getEsTextDocument(noticeId);
        SysNotice notice = new SysNotice();
        BeanUtils.copyBeanProp(notice, esTextDocument);
        return AjaxResult.success(notice);
    }

    /**
     * 修改保存公告
     */
    @PutMapping
    public AjaxResult editSave(@Validated @RequestBody SysNotice notice) {
        noticeService.updateNotice(notice);
        EsTextDocument esTextDocument = new EsTextDocument();
        BeanUtils.copyBeanProp(esTextDocument, notice);
        searchService.updateEsTextDocument(esTextDocument);
        return AjaxResult.success();
    }

    /**
     * 删除公告
     */
    @DeleteMapping("/{noticeIds}")
    public AjaxResult remove(@PathVariable Long[] noticeIds) {
        noticeService.deleteNoticeByIds(noticeIds);
        searchService.deleteEsTextDocument(noticeIds);
        return AjaxResult.success();
    }

    /**
     * 刷新全文检索数据
     */
    @DeleteMapping("/resetTextCache")
    public AjaxResult resetTextCache() {
        searchService.resetTextCache();
        return AjaxResult.success();
    }
}
