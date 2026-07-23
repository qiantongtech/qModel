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

package tech.qiantong.qmodel.module.model.controller.admin.modelAudit;

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
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.modelAudit.ModelAuditConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelAudit.ModelAuditDO;
import tech.qiantong.qmodel.module.model.service.modelAudit.IModelAuditService;

/**
 * 模型审批Controller
 *
 * @author anivia
 * @date 2026-07-23
 */
@Tag(name = "模型审批")
@RestController
@RequestMapping("/model/audit")
@Validated
public class ModelAuditController extends BaseController {
    @Resource
    private IModelAuditService modelAuditService;

    @Operation(summary = "查询模型审批列表")
    @PreAuthorize("@ss.hasPermi('model:modelAudit:audit:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelAuditRespVO>> list(ModelAuditPageReqVO modelAudit) {
        PageResult<ModelAuditDO> page = modelAuditService.getModelAuditPage(modelAudit);
        return CommonResult.success(BeanUtils.toBean(page, ModelAuditRespVO.class));
    }

    @Operation(summary = "导出模型审批列表")
    @PreAuthorize("@ss.hasPermi('model:modelAudit:audit:export')")
    @Log(title = "模型审批", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelAuditPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelAuditDO> list = (List<ModelAuditDO>) modelAuditService.getModelAuditPage(exportReqVO).getRows();
        ExcelUtil<ModelAuditRespVO> util = new ExcelUtil<>(ModelAuditRespVO.class);
        util.exportExcel(response, ModelAuditConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型审批列表")
    @PreAuthorize("@ss.hasPermi('model:modelAudit:audit:import')")
    @Log(title = "模型审批", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelAuditRespVO> util = new ExcelUtil<>(ModelAuditRespVO.class);
        List<ModelAuditRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelAuditService.importModelAudit(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型审批详细信息")
    @PreAuthorize("@ss.hasPermi('model:modelAudit:audit:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelAuditRespVO> getInfo(@PathVariable("id") Long id) {
        ModelAuditDO modelAuditDO = modelAuditService.getModelAuditById(id);
        return CommonResult.success(BeanUtils.toBean(modelAuditDO, ModelAuditRespVO.class));
    }

    @Operation(summary = "新增模型审批")
    @PreAuthorize("@ss.hasPermi('model:modelAudit:audit:add')")
    @Log(title = "模型审批", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelAuditSaveReqVO modelAudit) {
        return CommonResult.toAjax(modelAuditService.createModelAudit(modelAudit));
    }

    @Operation(summary = "修改模型审批")
    @PreAuthorize("@ss.hasPermi('model:modelAudit:audit:edit')")
    @Log(title = "模型审批", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelAuditSaveReqVO modelAudit) {
        return CommonResult.toAjax(modelAuditService.updateModelAudit(modelAudit));
    }

    @Operation(summary = "删除模型审批")
    @PreAuthorize("@ss.hasPermi('model:modelAudit:audit:remove')")
    @Log(title = "模型审批", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelAuditService.removeModelAudit(Arrays.asList(ids)));
    }

}
