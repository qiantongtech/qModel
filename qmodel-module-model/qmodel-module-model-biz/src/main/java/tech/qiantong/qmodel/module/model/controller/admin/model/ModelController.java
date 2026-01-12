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

package tech.qiantong.qmodel.module.model.controller.admin.model;

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
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.model.ModelConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.domain.ModelVersion;
import tech.qiantong.qmodel.module.model.service.model.IModelService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 模型管理Controller
 *
 * @author qModel
 * @date 2026-01-07
 */
@Tag(name = "模型管理")
@RestController
@RequestMapping("/model/model")
@Validated
public class ModelController extends BaseController {
    @Resource
    private IModelService modelService;

    @Operation(summary = "导出模型管理列表")
    @PreAuthorize("@ss.hasPermi('model:model::export')")
    @Log(title = "模型管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelDO> list = (List<ModelDO>) modelService.getModelPage(exportReqVO).getRows();
        ExcelUtil<ModelRespVO> util = new ExcelUtil<>(ModelRespVO.class);
        util.exportExcel(response, ModelConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型管理列表")
    @PreAuthorize("@ss.hasPermi('model:model::import')")
    @Log(title = "模型管理", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelRespVO> util = new ExcelUtil<>(ModelRespVO.class);
        List<ModelRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelService.importModel(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型管理详细信息")
    @PreAuthorize("@ss.hasPermi('model:model::query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelRespVO> getInfo(@PathVariable("id") Long id) {
        ModelDO modelDO = modelService.getModelById(id);
        return CommonResult.success(BeanUtils.toBean(modelDO, ModelRespVO.class));
    }

    @Operation(summary = "新增模型管理")
    @PreAuthorize("@ss.hasPermi('model:model::add')")
    @Log(title = "模型管理", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelSaveReqVO model, @RequestBody ModelVersionSaveReqVO modelVersion) {
        return CommonResult.toAjax(modelService.createModel(model,modelVersion));
    }

    @Operation(summary = "修改模型管理")
    @PreAuthorize("@ss.hasPermi('model:model::edit')")
    @Log(title = "模型管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelSaveReqVO model) {
        return CommonResult.toAjax(modelService.updateModel(model));
    }

    @Operation(summary = "删除模型管理")
    @PreAuthorize("@ss.hasPermi('model:model::remove')")
    @Log(title = "模型管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelService.removeModel(Arrays.asList(ids)));
    }
    /**
     * 查询模型管理 列表
     */
    @Operation(summary = "查询模型管理列表")
    @PreAuthorize("@ss.hasPermi('model:model::list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelRespVO>> list(ModelPageReqVO model) {
        PageResult<ModelDO> page = modelService.getModelPage(model);
        return CommonResult.success(BeanUtils.toBean(page, ModelRespVO.class));
    }

    /**
     * 修改模型管理详细信息（版本会自增）
     */
    @PreAuthorize("@ss.hasPermi('model:model:edit')")
    @Log(title = "模型管理 ", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public CommonResult<Integer> update(@RequestBody ModelSaveReqVO model, @RequestBody ModelVersionSaveReqVO modelVersion) {
        return CommonResult.toAjax(modelService.updateModel(model,modelVersion));
    }

}
