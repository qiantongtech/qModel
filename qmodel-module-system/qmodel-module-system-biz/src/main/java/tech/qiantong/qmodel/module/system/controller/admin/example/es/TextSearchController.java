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
import javax.annotation.Resource;
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
    @Resource
    private ISearchService searchService;

    @Resource
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
