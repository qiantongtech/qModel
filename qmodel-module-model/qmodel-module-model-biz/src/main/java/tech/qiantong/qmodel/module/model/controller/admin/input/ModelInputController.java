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

package tech.qiantong.qmodel.module.model.controller.admin.input;

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
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.input.ModelInputConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.input.ModelInputDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.service.input.IModelInputService;
import tech.qiantong.qmodel.module.model.service.modelReconstitution.IModelReconstitutionService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelReconstitution;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 模型输入管理Controller
 *
 * @author qModel
 * @date 2026-01-09
 */
@Tag(name = "模型输入管理")
@RestController
@RequestMapping("/model/input")
@Validated
public class ModelInputController extends BaseController {
    @Resource
    private IModelInputService modelInputService;

    @Resource
    private IModelReconstitutionService modelReconstitutionService;

    @Resource
    private IModelVersionService modelVersionService;


    @Operation(summary = "查询模型输入管理列表")
    @PreAuthorize("@ss.hasPermi('model:input:input:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelInputRespVO>> list(ModelInputPageReqVO modelInput) {
        PageResult<ModelInputDO> page = modelInputService.getModelInputPage(modelInput);
        return CommonResult.success(BeanUtils.toBean(page, ModelInputRespVO.class));
    }

    @Operation(summary = "导出模型输入管理列表")
    @PreAuthorize("@ss.hasPermi('model:input:input:export')")
    @Log(title = "模型输入管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelInputPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelInputDO> list = (List<ModelInputDO>) modelInputService.getModelInputPage(exportReqVO).getRows();
        ExcelUtil<ModelInputRespVO> util = new ExcelUtil<>(ModelInputRespVO.class);
        util.exportExcel(response, ModelInputConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型输入管理列表")
    @PreAuthorize("@ss.hasPermi('model:input:input:import')")
    @Log(title = "模型输入管理", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelInputRespVO> util = new ExcelUtil<>(ModelInputRespVO.class);
        List<ModelInputRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelInputService.importModelInput(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型输入管理详细信息")
    @PreAuthorize("@ss.hasPermi('model:input:input:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelInputRespVO> getInfo(@PathVariable("id") Long id) {
        ModelInputDO modelInputDO = modelInputService.getModelInputById(id);
        return CommonResult.success(BeanUtils.toBean(modelInputDO, ModelInputRespVO.class));
    }

    @Operation(summary = "新增模型输入管理")
    @PreAuthorize("@ss.hasPermi('model:input:input:add')")
    @Log(title = "模型输入管理", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelInputSaveReqVO modelInput) {
        return CommonResult.toAjax(modelInputService.createModelInput(modelInput));
    }

    @Operation(summary = "修改模型输入管理")
    @PreAuthorize("@ss.hasPermi('model:input:input:edit')")
    @Log(title = "模型输入管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelInputSaveReqVO modelInput) {
        return CommonResult.toAjax(modelInputService.updateModelInput(modelInput));
    }

    @Operation(summary = "删除模型输入管理")
    @PreAuthorize("@ss.hasPermi('model:input:input:remove')")
    @Log(title = "模型输入管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelInputService.removeModelInput(Arrays.asList(ids)));
    }


    /**
     * 查询所有模型
     */
    @PostMapping("/findAllModel")
    public AjaxResult findAllModel(@RequestBody ModelReconstitution modelReconstitution) {
        modelReconstitution.setDelFlag(false);
        return AjaxResult.success(modelReconstitutionService.selectModelReconstitutionList(modelReconstitution));
    }

    /**
     * 查询所有模型版本
     */
    @PostMapping("/findAllModelVersion")
    public AjaxResult findAllModelVersion(@RequestBody ModelVersionDO modelVersion) {
        modelVersion.setDelFlag(false);
        return AjaxResult.success(modelVersionService.selectModelVersionList(modelVersion));
    }



}
