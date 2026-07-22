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

package tech.qiantong.qmodel.module.model.controller.admin.operate;

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
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperatePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.operate.ModelOperateConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.operate.ModelOperateDO;
import tech.qiantong.qmodel.module.model.service.operate.IModelOperateService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 模型历史管理Controller
 *
 * @author qModel
 * @date 2026-01-09
 */
@Tag(name = "模型历史管理")
@RestController
@RequestMapping("/model/operate")
@Validated
public class ModelOperateController extends BaseController {
    @Resource
    private IModelOperateService modelOperateService;

    @Operation(summary = "查询模型历史管理列表")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelOperateRespVO>> list(ModelOperatePageReqVO modelOperate) {
        PageResult<ModelOperateDO> page = modelOperateService.getModelOperatePage(modelOperate);
        return CommonResult.success(BeanUtils.toBean(page, ModelOperateRespVO.class));
    }

    @Operation(summary = "导出模型历史管理列表")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:export')")
    @Log(title = "模型历史管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelOperatePageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelOperateDO> list = (List<ModelOperateDO>) modelOperateService.getModelOperatePage(exportReqVO).getRows();
        ExcelUtil<ModelOperateRespVO> util = new ExcelUtil<>(ModelOperateRespVO.class);
        util.exportExcel(response, ModelOperateConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型历史管理列表")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:import')")
    @Log(title = "模型历史管理", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelOperateRespVO> util = new ExcelUtil<>(ModelOperateRespVO.class);
        List<ModelOperateRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelOperateService.importModelOperate(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型历史管理详细信息")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelOperateRespVO> getInfo(@PathVariable("id") Long id) {
        ModelOperateDO modelOperateDO = modelOperateService.getModelOperateById(id);
        return CommonResult.success(BeanUtils.toBean(modelOperateDO, ModelOperateRespVO.class));
    }

    @Operation(summary = "新增模型历史管理")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:add')")
    @Log(title = "模型历史管理", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelOperateSaveReqVO modelOperate) {
        return CommonResult.toAjax(modelOperateService.createModelOperate(modelOperate));
    }

    @Operation(summary = "修改模型历史管理")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:edit')")
    @Log(title = "模型历史管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelOperateSaveReqVO modelOperate) {
        return CommonResult.toAjax(modelOperateService.updateModelOperate(modelOperate));
    }

    @Operation(summary = "删除模型历史管理")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:remove')")
    @Log(title = "模型历史管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelOperateService.removeModelOperate(Arrays.asList(ids)));
    }

}
