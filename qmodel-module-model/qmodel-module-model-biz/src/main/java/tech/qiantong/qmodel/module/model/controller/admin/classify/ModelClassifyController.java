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

package tech.qiantong.qmodel.module.model.controller.admin.classify;

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
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifyPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifyRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifySaveReqVO;
import tech.qiantong.qmodel.module.model.convert.classify.ModelClassifyConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.classify.ModelClassifyDO;
import tech.qiantong.qmodel.module.model.service.classify.IModelClassifyService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 模型分类Controller
 *
 * @author qModel
 * @date 2026-01-07
 */
@Tag(name = "模型分类")
@RestController
@RequestMapping("/model/classify")
@Validated
public class ModelClassifyController extends BaseController {
    @Resource
    private IModelClassifyService modelClassifyService;

    @Operation(summary = "查询模型分类列表")
    @PreAuthorize("@ss.hasPermi('model:classify:classify:list')")
    @GetMapping("/list")
    public CommonResult<List<ModelClassifyRespVO>> list(ModelClassifyPageReqVO modelClassify) {
        List<ModelClassifyDO> modelClassifyList = modelClassifyService.getModelClassifyList(modelClassify);
        return CommonResult.success(BeanUtils.toBean(modelClassifyList, ModelClassifyRespVO.class));
    }

    @Operation(summary = "导出模型分类列表")
    @PreAuthorize("@ss.hasPermi('model:classify:classify:export')")
    @Log(title = "模型分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelClassifyPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelClassifyDO> list = (List<ModelClassifyDO>) modelClassifyService.getModelClassifyPage(exportReqVO).getRows();
        ExcelUtil<ModelClassifyRespVO> util = new ExcelUtil<>(ModelClassifyRespVO.class);
        util.exportExcel(response, ModelClassifyConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型分类列表")
    @PreAuthorize("@ss.hasPermi('model:classify:classify:import')")
    @Log(title = "模型分类", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelClassifyRespVO> util = new ExcelUtil<>(ModelClassifyRespVO.class);
        List<ModelClassifyRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelClassifyService.importModelClassify(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型分类详细信息")
    @PreAuthorize("@ss.hasPermi('model:classify:classify:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelClassifyRespVO> getInfo(@PathVariable("id") Long id) {
        ModelClassifyDO modelClassifyDO = modelClassifyService.getModelClassifyById(id);
        return CommonResult.success(BeanUtils.toBean(modelClassifyDO, ModelClassifyRespVO.class));
    }

    @Operation(summary = "新增模型分类")
    @PreAuthorize("@ss.hasPermi('model:classify:classify:add')")
    @Log(title = "模型分类", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelClassifySaveReqVO modelClassify) {
        return CommonResult.toAjax(modelClassifyService.createModelClassify(modelClassify));
    }

    @Operation(summary = "修改模型分类")
    @PreAuthorize("@ss.hasPermi('model:classify:classify:edit')")
    @Log(title = "模型分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelClassifySaveReqVO modelClassify) {
        return CommonResult.toAjax(modelClassifyService.updateModelClassify(modelClassify));
    }

    @Operation(summary = "删除模型分类")
    @PreAuthorize("@ss.hasPermi('model:classify:classify:remove')")
    @Log(title = "模型分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelClassifyService.removeModelClassify(Arrays.asList(ids)));
    }

}
