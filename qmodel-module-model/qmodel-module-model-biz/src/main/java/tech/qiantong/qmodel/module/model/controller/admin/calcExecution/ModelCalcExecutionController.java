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

package tech.qiantong.qmodel.module.model.controller.admin.calcExecution;

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
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.calcExecution.ModelCalcExecutionConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcExecution.ModelCalcExecutionDO;
import tech.qiantong.qmodel.module.model.service.calcExecution.IModelCalcExecutionService;

/**
 * 模型计算执行记录Controller
 *
 * @author qModel
 * @date 2026-07-28
 */
@Tag(name = "模型计算执行记录")
@RestController
@RequestMapping("/model/calcExecution")
@Validated
public class ModelCalcExecutionController extends BaseController {
    @Resource
    private IModelCalcExecutionService modelCalcExecutionService;

    @Operation(summary = "查询模型计算执行记录列表")
    @PreAuthorize("@ss.hasPermi('model:calcExecution:calcexecution:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelCalcExecutionRespVO>> list(ModelCalcExecutionPageReqVO modelCalcExecution) {
        PageResult<ModelCalcExecutionDO> page = modelCalcExecutionService.getModelCalcExecutionPage(modelCalcExecution);
        return CommonResult.success(BeanUtils.toBean(page, ModelCalcExecutionRespVO.class));
    }

    @Operation(summary = "导出模型计算执行记录列表")
    @PreAuthorize("@ss.hasPermi('model:calcExecution:calcexecution:export')")
    @Log(title = "模型计算执行记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelCalcExecutionPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelCalcExecutionDO> list = (List<ModelCalcExecutionDO>) modelCalcExecutionService.getModelCalcExecutionPage(exportReqVO).getRows();
        ExcelUtil<ModelCalcExecutionRespVO> util = new ExcelUtil<>(ModelCalcExecutionRespVO.class);
        util.exportExcel(response, ModelCalcExecutionConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型计算执行记录列表")
    @PreAuthorize("@ss.hasPermi('model:calcExecution:calcexecution:import')")
    @Log(title = "模型计算执行记录", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelCalcExecutionRespVO> util = new ExcelUtil<>(ModelCalcExecutionRespVO.class);
        List<ModelCalcExecutionRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelCalcExecutionService.importModelCalcExecution(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型计算执行记录详细信息")
    @PreAuthorize("@ss.hasPermi('model:calcExecution:calcexecution:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelCalcExecutionRespVO> getInfo(@PathVariable("id") Long id) {
        ModelCalcExecutionDO modelCalcExecutionDO = modelCalcExecutionService.getModelCalcExecutionById(id);
        return CommonResult.success(BeanUtils.toBean(modelCalcExecutionDO, ModelCalcExecutionRespVO.class));
    }

    @Operation(summary = "新增模型计算执行记录")
    @PreAuthorize("@ss.hasPermi('model:calcExecution:calcexecution:add')")
    @Log(title = "模型计算执行记录", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelCalcExecutionSaveReqVO modelCalcExecution) {
        return CommonResult.toAjax(modelCalcExecutionService.createModelCalcExecution(modelCalcExecution));
    }

    @Operation(summary = "修改模型计算执行记录")
    @PreAuthorize("@ss.hasPermi('model:calcExecution:calcexecution:edit')")
    @Log(title = "模型计算执行记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelCalcExecutionSaveReqVO modelCalcExecution) {
        return CommonResult.toAjax(modelCalcExecutionService.updateModelCalcExecution(modelCalcExecution));
    }

    @Operation(summary = "删除模型计算执行记录")
    @PreAuthorize("@ss.hasPermi('model:calcExecution:calcexecution:remove')")
    @Log(title = "模型计算执行记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelCalcExecutionService.removeModelCalcExecution(Arrays.asList(ids)));
    }

}
