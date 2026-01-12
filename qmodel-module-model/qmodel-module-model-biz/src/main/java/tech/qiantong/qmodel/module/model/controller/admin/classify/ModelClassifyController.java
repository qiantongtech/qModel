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
