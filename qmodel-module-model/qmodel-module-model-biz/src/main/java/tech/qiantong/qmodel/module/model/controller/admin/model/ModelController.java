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

package tech.qiantong.qmodel.module.model.controller.admin.model;

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
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveWithConfigReqVO;
import tech.qiantong.qmodel.module.model.convert.model.ModelConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.service.model.IModelService;

/**
 * 模型基础信息Controller
 *
 * @author anivia
 * @date 2026-07-07
 */
@Tag(name = "模型基础信息")
@RestController
@RequestMapping("/model/model")
@Validated
public class ModelController extends BaseController {
    @Resource
    private IModelService modelService;

    @Operation(summary = "查询模型基础信息列表")
    @PreAuthorize("@ss.hasPermi('model:model:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelRespVO>> list(ModelPageReqVO model) {
        PageResult<ModelDO> page = modelService.getModelPage(model);
        return CommonResult.success(BeanUtils.toBean(page, ModelRespVO.class));
    }

    @Operation(summary = "导出模型基础信息列表")
    @PreAuthorize("@ss.hasPermi('model:model:export')")
    @Log(title = "模型基础信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelDO> list = (List<ModelDO>) modelService.getModelPage(exportReqVO).getRows();
        ExcelUtil<ModelRespVO> util = new ExcelUtil<>(ModelRespVO.class);
        util.exportExcel(response, ModelConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型基础信息列表")
    @PreAuthorize("@ss.hasPermi('model:model:import')")
    @Log(title = "模型基础信息", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelRespVO> util = new ExcelUtil<>(ModelRespVO.class);
        List<ModelRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelService.importModel(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型基础信息详细信息")
    @PreAuthorize("@ss.hasPermi('model:model:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelRespVO> getInfo(@PathVariable("id") Long id) {
        ModelDO modelDO = modelService.getModelById(id);
        return CommonResult.success(BeanUtils.toBean(modelDO, ModelRespVO.class));
    }

    @Operation(summary = "新增模型基础信息")
    @PreAuthorize("@ss.hasPermi('model:model:add')")
    @Log(title = "模型基础信息", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelSaveReqVO model) {
        return CommonResult.toAjax(modelService.createModel(model));
    }

    @Operation(summary = "修改模型基础信息")
    @PreAuthorize("@ss.hasPermi('model:model:edit')")
    @Log(title = "模型基础信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelSaveReqVO model) {
        return CommonResult.toAjax(modelService.updateModel(model));
    }

    @Operation(summary = "保存模型基础信息及配置详情")
    @PreAuthorize("@ss.hasPermi('model:model:add') || @ss.hasPermi('model:model:edit')")
    @Log(title = "模型基础信息", businessType = BusinessType.UPDATE)
    @PostMapping("/saveWithConfig")
    public CommonResult<Long> saveWithConfig(@Valid @RequestBody ModelSaveWithConfigReqVO saveReqVO) {
        return CommonResult.success(modelService.saveModelWithConfig(saveReqVO));
    }

    @Operation(summary = "删除模型基础信息")
    @PreAuthorize("@ss.hasPermi('model:model:remove')")
    @Log(title = "模型基础信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelService.removeModel(Arrays.asList(ids)));
    }

    @Operation(summary = "修改模型状态")
    @PreAuthorize("@ss.hasPermi('model:model:edit')")
    @Log(title = "模型基础信息", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/status/{status}")
    public CommonResult<Boolean> updateStatus(@PathVariable("id") Long id, @PathVariable("status") String status) {
        modelService.updateModelStatus(id, status);
        return CommonResult.success(true);
    }

}
