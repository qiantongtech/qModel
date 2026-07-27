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

package tech.qiantong.qmodel.module.model.controller.admin.history;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistoryPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistoryRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.convert.history.ModelHistoryConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.history.ModelHistoryDO;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 模型历史Controller
 *
 * @author qModel
 * @date 2026-01-09
 */
@Tag(name = "模型历史")
@RestController
@RequestMapping("/model/history")
@Validated
public class ModelHistoryController extends BaseController {
    @Resource
    private IModelHistoryService modelHistoryService;

    @Operation(summary = "查询模型历史列表")
    @PreAuthorize("@ss.hasPermi('model:history:history:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelHistoryRespVO>> list(ModelHistoryPageReqVO modelHistory) {
        PageResult<ModelHistoryDO> page = modelHistoryService.getModelHistoryPage(modelHistory);
        return CommonResult.success(BeanUtils.toBean(page, ModelHistoryRespVO.class));
    }

    @Operation(summary = "导出模型历史列表")
    @PreAuthorize("@ss.hasPermi('model:history:history:export')")
    @Log(title = "模型历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelHistoryPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelHistoryDO> list = (List<ModelHistoryDO>) modelHistoryService.getModelHistoryPage(exportReqVO).getRows();
        ExcelUtil<ModelHistoryRespVO> util = new ExcelUtil<>(ModelHistoryRespVO.class);
        util.exportExcel(response, ModelHistoryConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型历史列表")
    @PreAuthorize("@ss.hasPermi('model:history:history:import')")
    @Log(title = "模型历史", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelHistoryRespVO> util = new ExcelUtil<>(ModelHistoryRespVO.class);
        List<ModelHistoryRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelHistoryService.importModelHistory(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型历史详细信息")
    @PreAuthorize("@ss.hasPermi('model:history:history:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelHistoryRespVO> getInfo(@PathVariable("id") Long id) {
        ModelHistoryDO modelHistoryDO = modelHistoryService.getModelHistoryById(id);
        return CommonResult.success(BeanUtils.toBean(modelHistoryDO, ModelHistoryRespVO.class));
    }

    @Operation(summary = "新增模型历史")
    @PreAuthorize("@ss.hasPermi('model:history:history:add')")
    @Log(title = "模型历史", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelHistorySaveReqVO modelHistory) {
        return CommonResult.toAjax(modelHistoryService.createModelHistory(modelHistory));
    }

    @Operation(summary = "修改模型历史")
    @PreAuthorize("@ss.hasPermi('model:history:history:edit')")
    @Log(title = "模型历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelHistorySaveReqVO modelHistory) {
        return CommonResult.toAjax(modelHistoryService.updateModelHistory(modelHistory));
    }

    @Operation(summary = "删除模型历史")
    @PreAuthorize("@ss.hasPermi('model:history:history:remove')")
    @Log(title = "模型历史", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelHistoryService.removeModelHistory(Arrays.asList(ids)));
    }

}
