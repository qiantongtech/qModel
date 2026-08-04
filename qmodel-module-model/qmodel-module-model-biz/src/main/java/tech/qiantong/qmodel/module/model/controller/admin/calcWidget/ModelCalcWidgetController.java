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

package tech.qiantong.qmodel.module.model.controller.admin.calcWidget;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.common.exception.enums.GlobalErrorCodeConstants;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.calcWidget.ModelCalcWidgetConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcWidget.ModelCalcWidgetDO;
import tech.qiantong.qmodel.module.model.service.calcWidget.IModelCalcWidgetService;

/**
 * 模型计算任务可视化组件配置Controller
 *
 * @author anivia
 * @date 2026-08-04
 */
@Tag(name = "模型计算任务可视化组件配置")
@RestController
@RequestMapping("/model/calcWidget")
@Validated
public class ModelCalcWidgetController extends BaseController {
    @Resource
    private IModelCalcWidgetService modelCalcWidgetService;

    @Operation(summary = "查询模型计算任务可视化组件配置列表")
    @PreAuthorize("@ss.hasPermi('model:calcWidget:calcwidget:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelCalcWidgetRespVO>> list(ModelCalcWidgetPageReqVO modelCalcWidget) {
        PageResult<ModelCalcWidgetDO> page = modelCalcWidgetService.getModelCalcWidgetPage(modelCalcWidget);
        return CommonResult.success(BeanUtils.toBean(page, ModelCalcWidgetRespVO.class));
    }

    @Operation(summary = "根据计算任务ID查询可视化组件配置列表")
    @PreAuthorize("@ss.hasPermi('model:calcWidget:calcwidget:list')")
    @GetMapping("/listByCalcId/{calcId}")
    public CommonResult<List<ModelCalcWidgetRespVO>> listByCalcId(@PathVariable("calcId") Long calcId) {
        return CommonResult.success(modelCalcWidgetService.getModelCalcWidgetListByCalcId(calcId));
    }

    @Operation(summary = "导出模型计算任务可视化组件配置列表")
    @PreAuthorize("@ss.hasPermi('model:calcWidget:calcwidget:export')")
    @Log(title = "模型计算任务可视化组件配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelCalcWidgetPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelCalcWidgetDO> list = (List<ModelCalcWidgetDO>) modelCalcWidgetService.getModelCalcWidgetPage(exportReqVO).getRows();
        ExcelUtil<ModelCalcWidgetRespVO> util = new ExcelUtil<>(ModelCalcWidgetRespVO.class);
        util.exportExcel(response, ModelCalcWidgetConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型计算任务可视化组件配置列表")
    @PreAuthorize("@ss.hasPermi('model:calcWidget:calcwidget:import')")
    @Log(title = "模型计算任务可视化组件配置", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelCalcWidgetRespVO> util = new ExcelUtil<>(ModelCalcWidgetRespVO.class);
        List<ModelCalcWidgetRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelCalcWidgetService.importModelCalcWidget(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型计算任务可视化组件配置详细信息")
    @PreAuthorize("@ss.hasPermi('model:calcWidget:calcwidget:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelCalcWidgetRespVO> getInfo(@PathVariable("id") Long id) {
        ModelCalcWidgetDO modelCalcWidgetDO = modelCalcWidgetService.getModelCalcWidgetById(id);
        return CommonResult.success(BeanUtils.toBean(modelCalcWidgetDO, ModelCalcWidgetRespVO.class));
    }

    @Operation(summary = "新增模型计算任务可视化组件配置")
    @PreAuthorize("@ss.hasPermi('model:calcWidget:calcwidget:add')")
    @Log(title = "模型计算任务可视化组件配置", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelCalcWidgetSaveReqVO modelCalcWidget) {
        return CommonResult.toAjax(modelCalcWidgetService.createModelCalcWidget(modelCalcWidget));
    }

    @Operation(summary = "修改模型计算任务可视化组件配置")
    @PreAuthorize("@ss.hasPermi('model:calcWidget:calcwidget:edit')")
    @Log(title = "模型计算任务可视化组件配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelCalcWidgetSaveReqVO modelCalcWidget) {
        return CommonResult.toAjax(modelCalcWidgetService.updateModelCalcWidget(modelCalcWidget));
    }

    @Operation(summary = "删除模型计算任务可视化组件配置")
    @PreAuthorize("@ss.hasPermi('model:calcWidget:calcwidget:remove')")
    @Log(title = "模型计算任务可视化组件配置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelCalcWidgetService.removeModelCalcWidget(Arrays.asList(ids)));
    }

}
