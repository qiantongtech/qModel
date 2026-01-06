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

package tech.qiantong.qmodel.server.controller.modelReconstitution;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.poi.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import javax.servlet.http.*;
import java.util.*;

/**
 * 操作历史Controller
 *
 * @author surge
 * @date 2023-09-15
 */
@RestController
@RequestMapping("/modelReconstitution/history" )
public class ModelHistoryReconstitutionController extends BaseController {
    @Autowired
    private IModelHistoryReconstitutionService modelHistoryService;

    /**
     * 查询操作历史列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:history:list')" )
    @GetMapping("/list" )
    public TableDataInfo list(ModelHistoryReconstitution modelHistory) {
        startPage();
//        modelHistory.setSchoolId(super.getSchoolId());
        List<ModelHistoryReconstitution> list = modelHistoryService.selectModelHistoryList(modelHistory);
        return getDataTable(list);
    }

    /**
     * 查询操作历史列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:history:list')" )
    @GetMapping("/modelList" )
    public TableDataInfo modelList(ModelHistoryReconstitution modelHistory) {
        startPage();
        Long modelId = modelHistory.getModelId();
        List<ModelHistoryReconstitution> list = modelHistoryService.selectModelHistoryByModelId(modelId);
        return getDataTable(list);
    }

    /**
     * 导出操作历史列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:history:export')" )
    @Log(title = "操作历史" , businessType = BusinessType.EXPORT)
    @PostMapping("/export" )
    public void export(HttpServletResponse response, ModelHistoryReconstitution modelHistory) {
//        modelHistory.setSchoolId(super.getSchoolId());
        List<ModelHistoryReconstitution> list = modelHistoryService.selectModelHistoryList(modelHistory);
        ExcelUtil<ModelHistoryReconstitution> util = new ExcelUtil<ModelHistoryReconstitution>(ModelHistoryReconstitution. class);
        util.exportExcel(response, list, "操作历史数据" );
    }

    /**
     * 获取操作历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:history:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(modelHistoryService.selectModelHistoryById(id));
    }

    /**
     * 新增操作历史
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:history:add')" )
    @Log(title = "操作历史" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelHistoryReconstitution modelHistory) {
//        modelHistory.setSchoolId(super.getSchoolId());
        modelHistory.setCreatorId(getUserId());
        modelHistory.setCreateBy(getNickName());
        return toAjax(modelHistoryService.insertModelHistory(modelHistory));
    }

    /**
     * 修改操作历史
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:history:edit')" )
    @Log(title = "操作历史" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelHistoryReconstitution modelHistory) {
        return toAjax(modelHistoryService.updateModelHistory(modelHistory));
    }

    /**
     * 删除操作历史
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:history:remove')" )
    @Log(title = "操作历史" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelHistoryService.deleteModelHistoryByIds(ids));
    }
}
